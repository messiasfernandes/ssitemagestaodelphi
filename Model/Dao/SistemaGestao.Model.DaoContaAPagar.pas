unit SistemaGestao.Model.DaoContaAPagar;

interface
        uses SistemaGestao.Model.IterfaceDaoContas, SistemaGestao.Model.EntidadeContaapagar, System.Generics.Collections,
        SistemaGestao.Model.EntidadeUsuarioComToken,Vcl.Dialogs ,SistemaGestao.Model.DmConexaoEventos,RESTRequest4D.Request,
        RESTRequest4D.Response,REST.Json, System.JSON,System.SysUtils, System.StrUtils;
        type
        TDaoContasApagar = class(TInterfacedObject, Icontas<TContasPagar>)
        private
            dm: TDataEventos;
        protected

        public
          constructor Create;
          destructor Destroy; override;

        published
         function baixarConta (valorpago: Currency; objeto:TContasPagar;usuario:TUsuarioComToken): Integer;
         function salvar (objeto:TContasPagar;usuario:TUsuarioComToken):Integer;
      ///  function salvarContas(colecao:TObjectList<TContasPagar>;usuario:TUsuarioComToken):Integer;
         function Carregar(objeto: TContasPagar;usuario:TUsuarioComToken): TContasPagar;
         function pesquisa(colecao: TObjectList<TContasPagar>;pchave,ptipo:string ;usuario:TUsuarioComToken): TObjectList<TContasPagar>;
          function  buscarEntreData(colecaoObjeto: TObjectList<TContasPagar>;ptada1,pdata2:string;usuario:TUsuarioComToken): TObjectList<TContasPagar>;
        end;
implementation

{ TDaoContasApagar }

function TDaoContasApagar.baixarConta(valorpago: Currency; objeto: TContasPagar;
  usuario: TUsuarioComToken): Integer;
  var json: TJSONObject;
  lresponse:IResponse;

begin
json:=TJSONObject.Create;
     json:=objeto.deObjetoparaJson(json);


    lresponse:=  TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
   Resource( 'contas-apagar/').
    BasicAuthentication(usuario.funcionario.email,usuario.senha).

     AddBody(json).Put;

     if lresponse.StatusCode=200 then
     begin
       ShowMessage('Pago com sucesso!!');
     end   ;
     if lresponse.StatusCode=400 then
     begin
        ShowMessage(lresponse.Content);
     end;
     Result:=lresponse.StatusCode;
end;

function TDaoContasApagar.buscarEntreData(
  colecaoObjeto: TObjectList<TContasPagar>; ptada1, pdata2: string;
  usuario: TUsuarioComToken): TObjectList<TContasPagar>;
  var conta:TContasPagar;
begin
     TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( 'contas-apagar/situacao-contas?').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddParam('datadevencimentoDe',ptada1).
     AddParam('datadevencimentoAte',pdata2).

     DataSetAdapter(dm.FDMemContasaPagar).Get;
       colecaoObjeto.clear;
   dm.FDMemContasaPagar.First;
   while not dm.FDMemContasaPagar.Eof do
   begin
     conta:=TContasPagar.Create;
     conta.idconta:=StrToInt(dm.FDMemContasaPagaridconta.Value);
     conta.valoprago:=StrToCurr(dm.FDMemContasaPagarvaloprago.Value);
     conta.numtitulo:=StrToInt(dm.FDMemContasaPagarnumtitulo.Value);
     conta.fornecedor.nomePessoa:=dm.FDMemContasaPagarfornecedornomePessoa.Value;
     conta.valoparcela:=StrToCurr(dm.FDMemContasaPagarvaloparcela.Value);
     conta.valorapagar:=StrToCurr(dm.FDMemContasaPagarvalorapagar.Value);
     conta.statuspagmaento:=dm.FDMemContasaPagarstatuspagmaento.Value;
     conta.numtitulo:=StrToInt(dm.FDMemContasaPagarnumtitulo.Value);
     conta.datavencimento:= StrToDateTime(dm.FDMemContasaPagardatavencimento.value);
     colecaoObjeto.Add(conta);
     dm.FDMemContasaPagar.Next;
   end;
   Result:=colecaoObjeto;
end;

function TDaoContasApagar.Carregar(objeto: TContasPagar;
  usuario: TUsuarioComToken): TContasPagar;
begin
      TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( '/contas-apagar/'+objeto.idconta.ToString).
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
    DataSetAdapter(dm.FDMemContasaPagar).Get  ;
      objeto.idconta:=StrToInt( dm.FDMemContasaPagaridconta.value);
      objeto.numparcela:=StrToInt(dm.FDMemContasaPagarnumparcela.Value);
      objeto.numtitulo:=StrToInt(dm.FDMemContasaPagarnumtitulo.Value);
     objeto.fornecedor.codigo:=strtoInt (dm.FDMemContasaPagarfornecedorcodigo.Value);
     objeto.fornecedor.nomePessoa:=(dm.FDMemContasaPagarfornecedornomePessoa.Value);
     objeto.fornecedor.cpfouCnpj:=dm.FDMemContasaPagarfornecedorcpfouCnpj.Value;
     objeto.valoparcela:=StrToCurr( dm.FDMemContasaPagarvaloparcela.Value);
     objeto.valorapagar:=StrToCurr(dm.FDMemContasaPagarvalorapagar.Value);
     objeto.datavencimento:=StrToDate(dm.FDMemContasaPagardatavencimento.Value);
     objeto.formadePagmamento.Idformapagamento:=StrToInt(dm.FDMemContasaPagarformadePagmamentoidformapagamento.Value);
     objeto.formadePagmamento.Nomeforma:=(dm.FDMemContasaPagarformadePagmamentonomeforma.Value);
     objeto.statuspagmaento:=dm.FDMemContasaPagarstatuspagmaento.Value;
     objeto.datalancamento:=StrToDate(dm.FDMemContasaPagardatalancamento.Value);
     Result:=objeto;
end;

constructor TDaoContasApagar.Create;
begin
  dm:=TDataEventos.Create(nil);
end;

destructor TDaoContasApagar.Destroy;
begin
  dm.Free;
  inherited;
end;

function TDaoContasApagar.pesquisa(colecao: TObjectList<TContasPagar>; pchave,
  ptipo: string; usuario: TUsuarioComToken): TObjectList<TContasPagar>;
 var conta: TContasPagar;
begin
 if ptipo='&Cancelado' then
    begin
    TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( 'contas-apagar/canceladas').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).

     DataSetAdapter(dm.FDMemContasaPagar).Get
    end
    else
    if ptipo='C&npj/Cpf' then
    begin
        TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( 'contas-apagar/situacao-contas?').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddParam('cnpj', pchave).
     DataSetAdapter(dm.FDMemContasaPagar).Get
    end
    else
      if ptipo='&Atrasado' then
    begin
        TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( 'contas-apagar/contas-atrasada').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     DataSetAdapter(dm.FDMemContasaPagar).Get
    end
    else
   if Length(pchave)=0 then
    begin
    TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( 'contas-apagar/').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).

     DataSetAdapter(dm.FDMemContasaPagar).Get;
    end
    else
    begin
       TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( 'contas-apagar/contas-fornecedores-nome?').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
      AddParam('parametro',pchave).
     DataSetAdapter(dm.FDMemContasaPagar).Get;
    end;

   colecao.clear;
   dm.FDMemContasaPagar.First;
   while not dm.FDMemContasaPagar.Eof do
   begin
     conta:=TContasPagar.Create;
     conta.idconta:=StrToInt(dm.FDMemContasaPagaridconta.Value);
     conta.valoprago:=StrToCurr(dm.FDMemContasaPagarvaloprago.Value);
     conta.numtitulo:=StrToInt(dm.FDMemContasaPagarnumtitulo.Value);
     conta.fornecedor.nomePessoa:=dm.FDMemContasaPagarfornecedornomePessoa.Value;
     conta.valoparcela:=StrToCurr(dm.FDMemContasaPagarvaloparcela.Value);
     conta.valorapagar:=StrToCurr(dm.FDMemContasaPagarvalorapagar.Value);
     conta.statuspagmaento:=dm.FDMemContasaPagarstatuspagmaento.Value;
     conta.numtitulo:=StrToInt(dm.FDMemContasaPagarnumtitulo.Value);
     conta.datavencimento:= StrToDateTime(dm.FDMemContasaPagardatavencimento.value);
     colecao.Add(conta);
     dm.FDMemContasaPagar.Next;
   end;
   Result:=colecao;
end;

function TDaoContasApagar.salvar(objeto: TContasPagar;
  usuario: TUsuarioComToken): Integer;
begin

end;



end.
