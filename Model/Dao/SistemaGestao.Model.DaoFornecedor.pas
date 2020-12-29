unit SistemaGestao.Model.DaoFornecedor;

interface
        uses
     SistemaGestao.Model.DmConexaoEventos, System.SysUtils,Vcl.Dialogs,
        SistemaGestao.Model.EntidadeFornecedor, REST.Json,RESTRequest4D.Request,
        RESTRequest4D.Response,System.Generics.Collections,System.JSON,
        SistemaGestao.Model.EntidadeUsuarioComToken,
         SistemaGestao.Model.IterfaceDao;
        type
        TDaoFornecedor = class(TInterfacedObject,Idao<TFornecedor>)
        private

        protected
            dm:TDataEventos;
            lResponse:IResponse;
        public
          constructor Create;
          destructor Destroy; override;

        published
        function salvar (objeto:TFornecedor;usuario:TUsuarioComToken):string;
         function Carregar(objeto: TFornecedor;usuario:TUsuarioComToken): TFornecedor;
         function Excluir (pid:integer;usuario:TUsuarioComToken):string;
            function buscar(objeto:TFornecedor;usuario:TUsuarioComToken):TFornecedor;
         function pesquisa(colecao: TObjectList<TFornecedor>;pchave,ptipo:string ;usuario:TUsuarioComToken): TObjectList<TFornecedor>;

        end;
implementation

uses
  SistemaGestao.Model.EntidadeParcelas;

{ TDaoFonecedor }





function TDaoFornecedor.buscar(objeto: TFornecedor;
  usuario: TUsuarioComToken): TFornecedor;
    var parcela: TParcelas ;
begin
   lREsponse:=   TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
          Resource( '/fornecedores/buscar-por-cnpj-ou-cpf?').
      BasicAuthentication(usuario.funcionario.email,usuario.senha).

      AddParam('cnpj',objeto.cpfouCnpj).
    DataSetAdapter(dm.FDMemFornecedor).Get ;
    if lResponse.StatusCode=404 then
   begin
       ShowMessage('Registro n�o encontrado');
   end
   else
   begin
    objeto.codigo:= StrToInt( dm.FDMemFornecedorcodigo.Value);
     objeto.nomePessoa:=dm.FDMemFornecedornomePessoa.Value;
     objeto.telefone:=dm.FDMemFornecedortelefone.Value;
     objeto.celular:=dm.FDMemFornecedorcelular.Value;
     objeto.cep:=dm.FDMemFornecedorcep.Value;
     objeto.condicaocondicaoPamento.idcondicao:=StrToInt(dm.FDMemFornecedorcondicaoPamentoidcondicao.Value);
     objeto.condicaocondicaoPamento.descricao:=dm.FDMemFornecedorcondicaoPamentodescricao.Value;
     objeto.cidade.codigo_cidade:= StrToInt( dm.FDMemFornecedorcidadecodigo_cidade.Value);
     objeto.cidade.cidadenome:=dm.FDMemFornecedorcidadecidadenome.Value;
     objeto.cidade.estado.nomestado:=dm.FDMemFornecedorcidadeestadonomestado.Value;
     objeto.cidade.estado.uf:=dm.FDMemFornecedorcidadeestadouf.Value;
     objeto.cep:=dm.FDMemFornecedorcep.Value;
     objeto.representante:=dm.FDMemFornecedorrepresentante.Value;
     objeto.dataNiverouFundacao:=StrToDate(dm.FDMemFornecedordataNiverouFundacao.Value);
     objeto.cpfouCnpj:=dm.FDMemFornecedorcpfouCnpj.Value;
     objeto.complemto:=dm.FDMemFornecedorcomplemto.Value;
     objeto.rgouInscricao:=dm.FDMemFornecedorrgouInscricao.Value;
     objeto.numero:=StrToInt( dm.FDMemFornecedornumero.Value);
     objeto.email:=dm.FDMemFornecedoremail.Value;
     objeto.site:=dm.FDMemFornecedorsite.Value;
     objeto.logradouro:=dm.FDMemFornecedorlogradouro.Value;
     objeto.bairro:=dm.FDMemFornecedorbairro.Value;
     objeto.tipessoa:=dm.FDMemFornecedortipessoa.Value;
          TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( '/condicoes-de-pagamento/buscar-nome-ou-id/?idcondicao='
     +objeto.condicaocondicaoPamento.idcondicao.ToString ).
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddHeader('Headers',usuario.token).
    DataSetAdapter(dm.MemTableCondicaocondicao).Get  ;

     objeto.condicaocondicaoPamento.qtdeparcelas:=StrToInt(dm.MemTableCondicaocondicaocondicaopagamentoqtdeparcelas.Value);
      objeto.condicaocondicaoPamento.colecaoparcelas.Clear;
     dm.MemTableCondicaocondicao.First;
      while not dm.MemTableCondicaocondicao.Eof do
      begin
        parcela:=TParcelas.Create;
        parcela.idparcela:=StrToInt(dm.MemTableCondicaocondicaoidparcela.Value);
        parcela.numeroparcela:=StrToInt(dm.MemTableCondicaocondicaonumeroparcela.Value);
        parcela.percentual:=StrToCurr(dm.MemTableCondicaocondicaopercentual.Value);
        parcela.dia:=StrToInt(dm.MemTableCondicaocondicaodia.Value);
        parcela.formadePagamento.Idformapagamento:=StrToInt(dm.MemTableCondicaocondicaoformadePagamentoidformapagamento.Value);
        parcela.formadePagamento.Nomeforma:=dm.MemTableCondicaocondicaoformadePagamentonomeforma.Value;
        objeto.condicaocondicaoPamento.colecaoparcelas.Add(parcela);
        dm.MemTableCondicaocondicao.Next;
      end;
    Result:=  objeto;
    end;
end;


function TDaoFornecedor.Carregar(objeto: TFornecedor;
  usuario: TUsuarioComToken): TFornecedor;
 var parcela: TParcelas ;
begin
       TRequest.New.BaseURL('http://192.168.1.3:8080/' ).
       AcceptCharset ('application/json').
          Resource( 'fornecedores/'+ objeto.codigo.ToString).
       BasicAuthentication(usuario.funcionario.email,usuario.senha).

         DataSetAdapter(dm.FDMemFornecedor).Get  ;

    objeto.codigo:= StrToInt( dm.FDMemFornecedorcodigo.Value);
     objeto.nomePessoa:=dm.FDMemFornecedornomePessoa.Value;
     objeto.telefone:=dm.FDMemFornecedortelefone.Value;
     objeto.celular:=dm.FDMemFornecedorcelular.Value;
     objeto.cep:=dm.FDMemFornecedorcep.Value;
     objeto.condicaocondicaoPamento.idcondicao:=StrToInt(dm.FDMemFornecedorcondicaoPamentoidcondicao.Value);
     objeto.condicaocondicaoPamento.descricao:=dm.FDMemFornecedorcondicaoPamentodescricao.Value;
     objeto.cidade.codigo_cidade:= StrToInt( dm.FDMemFornecedorcidadecodigo_cidade.Value);
     objeto.cidade.cidadenome:=dm.FDMemFornecedorcidadecidadenome.Value;
     objeto.cidade.estado.nomestado:=dm.FDMemFornecedorcidadeestadonomestado.Value;
     objeto.cidade.estado.uf:=dm.FDMemFornecedorcidadeestadouf.Value;
     objeto.cep:=dm.FDMemFornecedorcep.Value;
     objeto.representante:=dm.FDMemFornecedorrepresentante.Value;
     objeto.dataNiverouFundacao:=StrToDate(dm.FDMemFornecedordataNiverouFundacao.Value);
     objeto.cpfouCnpj:=dm.FDMemFornecedorcpfouCnpj.Value;
     objeto.complemto:=dm.FDMemFornecedorcomplemto.Value;
     objeto.rgouInscricao:=dm.FDMemFornecedorrgouInscricao.Value;
     objeto.numero:=StrToInt( dm.FDMemFornecedornumero.Value);
     objeto.email:=dm.FDMemFornecedoremail.Value;
     objeto.site:=dm.FDMemFornecedorsite.Value;
     objeto.logradouro:=dm.FDMemFornecedorlogradouro.Value;
     objeto.bairro:=dm.FDMemFornecedorbairro.Value;
     objeto.tipessoa:=dm.FDMemFornecedortipessoa.Value;


     TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( '/condicoes-de-pagamento/buscar-nome-ou-id/?idcondicao='
     +objeto.condicaocondicaoPamento.idcondicao.ToString ).
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddHeader('Headers',usuario.token).
    DataSetAdapter(dm.MemTableCondicaocondicao).Get  ;
    
     objeto.condicaocondicaoPamento.qtdeparcelas:=StrToInt(dm.MemTableCondicaocondicaocondicaopagamentoqtdeparcelas.Value);
      objeto.condicaocondicaoPamento.colecaoparcelas.Clear;
     dm.MemTableCondicaocondicao.First;
      while not dm.MemTableCondicaocondicao.Eof do
      begin
        parcela:=TParcelas.Create;
        parcela.idparcela:=StrToInt(dm.MemTableCondicaocondicaoidparcela.Value);
        parcela.numeroparcela:=StrToInt(dm.MemTableCondicaocondicaonumeroparcela.Value);
        parcela.percentual:=StrToCurr(dm.MemTableCondicaocondicaopercentual.Value);
        parcela.dia:=StrToInt(dm.MemTableCondicaocondicaodia.Value);
        parcela.formadePagamento.Idformapagamento:=StrToInt(dm.MemTableCondicaocondicaoformadePagamentoidformapagamento.Value);
        parcela.formadePagamento.Nomeforma:=dm.MemTableCondicaocondicaoformadePagamentonomeforma.Value;
        objeto.condicaocondicaoPamento.colecaoparcelas.Add(parcela);
        dm.MemTableCondicaocondicao.Next;
      end;
    Result:=  objeto;
end;

constructor TDaoFornecedor.Create;
begin
  dm:=TDataEventos.Create(nil);
end;

destructor TDaoFornecedor.Destroy;
begin
   dm.Free;
  inherited;
end;

function TDaoFornecedor.Excluir(pid: integer; usuario: TUsuarioComToken): string;
begin
     lResponse:= TRequest.New.BaseURL('http://192.168.1.3:8080/').
   Resource('fornecedores/'+ pid.ToString).
    BasicAuthentication(usuario.funcionario.email,usuario.senha).
    Accept('application/json')
    .Delete;
    if lResponse.StatusCode=204 then
    begin
      ShowMessage('exclu�do com sucesso!!');
    end;
    if lResponse.StatusCode=400 then
    begin
      raise Exception.Create('Opera��o n�o permitida');
    end;

      if lREsponse.StatusCode=403 then
     begin
        MessageDlg('Seu usu�rio n�o permiss�o para utilizar este recurso !', mtError,
            [mbOK], 0);
           ShowMessage(lREsponse.Content);
     end;


   Result:='';
end;

function TDaoFornecedor.pesquisa(colecao: TObjectList<TFornecedor>; pchave,
  ptipo: string; usuario: TUsuarioComToken): TObjectList<TFornecedor>;
  var fornecedor: TFornecedor;
begin
 if Length (pchave)=0 then
    lREsponse:=    TRequest.New.BaseURL('http://192.168.1.3:8080/' )
    .AcceptCharset ('application/json').
     Resource( 'fornecedores/').
   BasicAuthentication(usuario.funcionario.email,usuario.senha).

    DataSetAdapter(dm.FDMemFornecedor).Get
    else
if ptipo='&C�digo' then

  lREsponse:=    TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
          Resource( 'fornecedores/'+pchave).
       BasicAuthentication(usuario.funcionario.email,usuario.senha).

    DataSetAdapter(dm.FDMemFornecedor).Get

      else
  if ptipo='Cnpj/cpf' then
   lREsponse:=   TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
          Resource( '/fornecedores/buscar-por-cnpj-ou-cpf?').
      BasicAuthentication(usuario.funcionario.email,usuario.senha).

      AddParam('cnpj',pchave).
    DataSetAdapter(dm.FDMemFornecedor).Get

  else

  begin
    lREsponse:=   TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
          Resource( '/fornecedores/buscar-nome-comecando/?').
      BasicAuthentication(usuario.funcionario.email,usuario.senha).

      AddParam('parametro',pchave).
    DataSetAdapter(dm.FDMemFornecedor).Get ;

 end;
 if lREsponse.StatusCode=403 then
 begin
    MessageDlg('Seu usu�rio n�o permiss�o para utilizar este recurso !', mtError,
        [mbOK], 0);
       ShowMessage(lREsponse.Content);
 end
 else
  if lREsponse.StatusCode=404 then
 begin
    MessageDlg('Registro n�o encontrado !', mtError,
        [mbOK], 0);
       ShowMessage(lREsponse.Content);
 end
 else
 begin
   colecao.Clear;
   dm.FDMemFornecedor.First;
  while not dm.FDMemFornecedor.Eof do
   begin
     fornecedor:=TFornecedor.Create;
     fornecedor.codigo:= StrToInt( dm.FDMemFornecedorcodigo.Value);
     fornecedor.nomePessoa:= dm.FDMemFornecedornomePessoa.Value;
     fornecedor.cpfouCnpj:=dm.FDMemFornecedorcpfouCnpj.Value;
     fornecedor.telefone:=dm.FDMemFornecedortelefone.Value;
     fornecedor.email:=dm.FDMemFornecedoremail.Value;
     fornecedor.cidade.cidadenome:=dm.FDMemFornecedorcidadecidadenome.Value;
     colecao.Add(fornecedor);
     dm.FDMemFornecedor.Next;
   end;
 end;
   Result:=colecao;
end;

function TDaoFornecedor.salvar(objeto: TFornecedor;
  usuario: TUsuarioComToken): string;
  var json,jsoncidade,jssondicao:TJSONObject;
  
begin
     json:=TJSONObject.Create;
     json := objeto.deObjetoparaJson(json);
     jsoncidade:=TJSONObject.Create;
    jssondicao:=TJSONObject.Create;
     jsoncidade.AddPair('codigo_cidade',objeto.cidade.codigo_cidade.ToString);
  jssondicao.AddPair('idcondicao',objeto.condicaocondicaoPamento.idcondicao.ToString);
     json.AddPair('cidade',jsoncidade);
    json.AddPair('condicaoPamento',jssondicao);

    try
     if objeto.codigo=0 then
     begin

     LResponse:=  TRequest.New.BaseURL('http://192.168.1.3:8080/fornecedores' ).
    BasicAuthentication(usuario.funcionario.email,usuario.senha) .
     AcceptCharset ('application/json')
     .AddBody(json).Post;
    end
    else
    begin

     LResponse := TRequest.New.BaseURL('http://192.168.1.3:8080/fornecedores' ).
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AcceptCharset ('application/json')
     .AddBody(json).Put;
    end;


       if LResponse.StatusCode=201  then
  begin
  ShowMessage('salvo com sucesso'+ LResponse.StatusCode.ToString);
  end;
  if (LResponse.StatusCode=200) and (objeto.codigo>0 )then
  begin
     ShowMessage('Editado com sucesso.');
  end;
  if LResponse.StatusCode=400 then
   begin
   ShowMessage(lResponse.Content );
   end;
   if LResponse.StatusCode=403 then
   begin
      raise Exception.Create('seu us�rio n�o tem permiss�o para esta opera��o');
   end;
  finally

end;

end;

end.
