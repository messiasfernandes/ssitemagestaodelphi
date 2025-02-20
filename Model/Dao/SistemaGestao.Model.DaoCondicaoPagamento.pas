unit SistemaGestao.Model.DaoCondicaoPagamento;

interface
        uses SistemaGestao.Model.DmConexaoEventos, SistemaGestao.Model.IterfaceDao,SistemaGestao.Model.EntidadeCondicaoPagamento,
        Vcl.Dialogs, System.SysUtils, System.StrUtils, REST.Types,  system.Json, REST.Json,
        SistemaGestao.Model.EntidadeParcelas,System.Generics.Collections,
        RESTRequest4D.Request,RESTRequest4D.Response,
        SistemaGestao.Model.EntidadeUsuarioComToken;
        type
        TDaoCondicaoPagamento = class(TInterfacedObject, Idao<TCondicaoPagmento>)
        private
          { private declarations }
        protected
        dm:TDataEventos;
        public
         function salvar (objeto:TCondicaoPagmento;usuario:TUsuarioComToken):string;
         function Carregar(objeto: TCondicaoPagmento;usuario:TUsuarioComToken): TCondicaoPagmento;
         function Excluir (pid:integer;usuario:TUsuarioComToken):string;
          function buscarTodos(colecao: TObjectList<TCondicaoPagmento> ): TObjectList<TCondicaoPagmento>;
           function buscar(objeto:TCondicaoPagmento;usuario:TUsuarioComToken):TCondicaoPagmento;
         function pesquisa(colecaoCondicaopgto: TObjectList<TCondicaoPagmento>;pchave,ptipo:string;usuario:TUsuarioComToken ): TObjectList<TCondicaoPagmento>;
         constructor Create;
         destructor Destroy; override;
        published
          { published declarations }
        end;
implementation

{ TDaoCondicaoPagamento }




function TDaoCondicaoPagamento.buscar(objeto: TCondicaoPagmento;
  usuario: TUsuarioComToken): TCondicaoPagmento;
begin

end;

function TDaoCondicaoPagamento.buscarTodos(
  colecao: TObjectList<TCondicaoPagmento>): TObjectList<TCondicaoPagmento>;
   var condicao: TCondicaoPagmento;
begin


end;

function TDaoCondicaoPagamento.Carregar(
  objeto: TCondicaoPagmento;usuario:TUsuarioComToken): TCondicaoPagmento;
  var parcela: TParcelas;
begin
     TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( '/condicoes-de-pagamento/buscar-nome-ou-id/?idcondicao='
     +objeto.idcondicao.ToString ).
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddHeader('Headers',usuario.token).
    DataSetAdapter(dm.MemTableCondicaocondicao).Get  ;
      objeto.idcondicao:=StrToInt( dm.MemTableCondicaocondicaocondicaopagamentoidcondicao.AsString);
     objeto.descricao:=dm.MemTableCondicaocondicaocondicaopagamentodescricao.Value;
     objeto.qtdeparcelas:=StrToInt(dm.MemTableCondicaocondicaocondicaopagamentoqtdeparcelas.Value);
      objeto.colecaoparcelas.Clear;
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
        objeto.colecaoparcelas.Add(parcela);
        dm.MemTableCondicaocondicao.Next;
      end;
    Result:=  objeto;
end;

constructor TDaoCondicaoPagamento.Create;
begin
  dm:=TDataEventos.Create(nil);
end;

destructor TDaoCondicaoPagamento.Destroy;
begin
  dm.Free;
  inherited;
end;

function TDaoCondicaoPagamento.Excluir(pid: integer;usuario:TUsuarioComToken): string;
var   Lreponse: IResponse;
begin
    Lreponse:= TRequest.New.BaseURL('http://192.168.1.3:8080/').
   Resource('/condicoes-de-pagamento/'+ pid.ToString).
  BasicAuthentication(usuario.funcionario.email,usuario.senha).

    Accept('application/json')
    .Delete;
    if Lreponse.StatusCode=204 then
    begin
      ShowMessage('excluido com sucesso!!');
    end;
    if Lreponse.StatusCode=400 then
    begin
      raise Exception.Create('Opera��o n�o permitida');
    end;
    if lREponse.StatusCode=403 then
 begin
    MessageDlg('Seu usu�rio n�o permiss�o para utilizar este recurso !', mtError,
        [mbOK], 0);
       ShowMessage(lREponse.Content);
 end;



   Result:='';

end;

function TDaoCondicaoPagamento.pesquisa(
  colecaoCondicaopgto: TObjectList<TCondicaoPagmento>; pchave,
  ptipo: string;usuario:TUsuarioComToken): TObjectList<TCondicaoPagmento>;
  var condicao: TCondicaoPagmento;
  lREsponse:IResponse;
begin
   if Length (pchave)=0 then
    lREsponse:=    TRequest.New.BaseURL('http://192.168.1.2:8080/' ).AcceptCharset ('application/json').
     Resource( 'condicoes-de-pagamento/').
   BasicAuthentication(usuario.funcionario.email,usuario.senha).
//    AddHeader('Headers',usuario.token).
    DataSetAdapter(dm.FDMemTable1).Get
    else
if ptipo='&C�digo' then

  lREsponse:=    TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
          Resource( 'condicoes-de-pagamento/'+pchave).
       BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddHeader('Headers',usuario.token).

    DataSetAdapter(dm.FDMemTable1).Get

      else
  begin
    lREsponse:=   TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
          Resource( '/condicoes-de-pagamento/por-nome-comecando/?').
      BasicAuthentication(usuario.funcionario.email,usuario.senha).

      AddParam('parametro',pchave).
    DataSetAdapter(dm.FDMemTable1).Get ;

 end;
 if lREsponse.StatusCode=403 then
 begin
    MessageDlg('Seu usu�rio n�o permiss�o para utilizar este recurso !', mtError,
        [mbOK], 0);
       ShowMessage(lREsponse.Content);
 end
 else
 begin
   colecaoCondicaopgto.Clear;
   dm.FDMemTable1.First;
  while not dm.FDMemTable1.Eof do
   begin
     condicao:=TCondicaoPagmento.Create;
     condicao.idcondicao:= StrToInt( dm.FDMemTable1idcondicao.Value);
     condicao.descricao:= dm.FDMemTable1descricao.Value;
     condicao.qtdeparcelas:= StrToInt(dm.FDMemTable1qtdeparcelas.Value);
     colecaoCondicaopgto.Add(condicao);
     dm.FDMemTable1.Next;
   end;
 end;
   Result:=colecaoCondicaopgto;
end;

function TDaoCondicaoPagamento.salvar(objeto: TCondicaoPagmento;usuario:TUsuarioComToken): string;
var
 jsonPai:TJSONObject;
 jsonFilho : TJSONObject;
  parcela :TParcelas;
 lArrayFilho: TJSONArray;
 LResponse:IResponse;
begin

     jsonPai := TJSONObject.Create;
    jsonPai.AddPair('idcondicao', objeto.idcondicao.ToString);
    jsonPai.AddPair('descricao', objeto.descricao);
    jsonPai.AddPair('qtdeparcelas', objeto.qtdeparcelas.ToString);
    lArrayFilho := TJSONArray.create;
  for parcela in objeto.colecaoparcelas do
  begin

    jsonFilho := TJson.ObjectToJsonObject(parcela);
    lArrayFilho.AddElement(jsonFilho);
  end;
 jsonPai.AddPair('colecaoparcelas', lArrayFilho);


    try
     if objeto.idcondicao=0 then
    begin
  LResponse:= TRequest.New.BaseURL('http://192.168.1.3:8080/' ).
       AcceptCharset ('application/json').
     Resource( 'condicoes-de-pagamento/').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddHeader('Headers',usuario.token).
    AddBody(jsonPai).Post;
    end
   else
    begin
    LResponse:= TRequest.New.BaseURL('http://192.168.1.3:8080/' ).
      AcceptCharset ('application/json').
     Resource( 'condicoes-de-pagamento/').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddHeader('Headers',usuario.token).
    AddBody(jsonPai).Post;
   end;
   if (LResponse.StatusCode = 201) and (objeto.idcondicao=0) then
   begin
    ShowMessage('Salvo com sucesso.');

   end ;
 if (LResponse.StatusCode = 200) and (objeto.idcondicao>0) then
   begin
       ShowMessage('Editado com sucesso!!')
   end;
  if LResponse.StatusCode=403 then
  begin
    MessageDlg('Seu usu�rio n�o permiss�o para utilizar este recurso !', mtError,
        [mbOK], 0);
  end;
finally



end;
end;



end.
