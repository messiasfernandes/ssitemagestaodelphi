unit SistemaGestao.Model.DaoCompra;

interface
uses SistemaGestao.Model.EntidadeCompra,SistemaGestao.Model.IterfaceDao,SistemaGestao.Model.EntidadeUsuarioComToken,
SistemaGestao.Model.DmConexaoEventos,Vcl.Dialogs,System.Generics.Collections,REST.Utils,System.JSON,RESTRequest4D.Request,
RESTRequest4D.Response.Intf,  REST.Types,   REST.Json,SistemaGestao.Model.EntidadeProduto,SistemaGestao.Model.IterfaceIdaoCompra,
SistemaGestao.Model.EntidadeItemCompra,System.StrUtils,System.SysUtils,SistemaGestao.Model.EntidadeContaDetalhe;
        type
        TDAoCompra = class(TInterfacedObject, IdaoCompra<TCompra>)
        private
           dm:TDataEventos;

        protected

        public
          constructor Create;
          destructor Destroy; override;
            function salvar (objeto:TCompra;usuario:TUsuarioComToken):string;
         function Carregar(objeto: TCompra;usuario:TUsuarioComToken): TCompra;
         function Excluir (pid:integer;usuario:TUsuarioComToken):string;
         function pesquisa(colecao: TObjectList<TCompra>;pchave,ptipo:string ;usuario:TUsuarioComToken): TObjectList<TCompra>;
        function salvarprodutoxml(objeto:TProduto;usuario:TUsuarioComToken):Integer;
         function cancelarcompra(objeto:TCompra;usuario:TUsuarioComToken):Integer;
         function buscar(objeto:TCompra;usuario:TUsuarioComToken):TCompra;
        published

        end;
implementation

uses
  SistemaGestao.Model.EntidadeContaapagar;

{ TDAoCompra }

function TDAoCompra.buscar(objeto: TCompra; usuario: TUsuarioComToken): TCompra;
begin

end;

function TDAoCompra.cancelarcompra(objeto: TCompra;usuario:TUsuarioComToken): Integer;
var
 jsonPai:TJSONObject;
 jsonFilho : TJSONObject;
  itemCompra :TItemCompra;
 lArrayFilho: TJSONArray;
 LResponse:IResponse;


begin

   LResponse:= TRequest.New.BaseURL('http://192.168.1.3:8080/' ).
       AcceptCharset ('application/json').
     Resource( 'compras/'+objeto.idCompra.ToString).

     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     Put;

     if (LResponse.StatusCode = 200) and (objeto.idCompra>0) then
   begin
       ShowMessage('Cencelado com sucesso!!')   ;

   end ;
      if (LResponse.StatusCode = 400)  then
   begin
       ShowMessage(LResponse.Content)   ;

   end ;
    Result:= LResponse.StatusCode;
end;

function TDAoCompra.Carregar(objeto: TCompra;
  usuario: TUsuarioComToken): TCompra;
  var itemCompra: TItemCompra;
  var contaPagar:TContasPagar;
  lresponse:IResponse;
begin
     TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( '/compras/por-itens/?idCompra='+objeto.idCompra.ToString).
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
    DataSetAdapter(dm.FDMemItemCompras).Get  ;
      objeto.idCompra:=StrToInt( dm.FDMemItemComprascompraidcompra.value);
      objeto.numeronota:=StrToInt(dm.FDMemItemComprascompranumeronota.Value);
     objeto.fornecedor.codigo:=strtoInt (dm.FDMemItemComprascomprafornecedorcodigo.Value);
     objeto.fornecedor.nomePessoa:=(dm.FDMemItemComprascomprafornecedornomePessoa.Value);
     objeto.fornecedor.cpfouCnpj:=dm.FDMemItemComprascomprafornecedorcpfouCnpj.Value;
     objeto.totalCompra:=StrToCurr( dm.FDMemItemComprascompratotalCompra.Value);
     objeto.totalproduto:=StrToCurr(dm.FDMemItemComprascompratotalProduto.Value);
     objeto.dataCompra:=StrToDate(dm.FDMemItemComprascompradataCompra.Value);
     objeto.datadeentrada:=StrToDateTime(dm.FDMemItemComprascompradatadeentrada.Value);
     objeto.desconto:=StrToCurr(dm.FDMemItemComprascompradesconto.Value);
     objeto.valorfrete:=StrToCurr(dm.FDMemItemComprascompravalorfrete.Value);
     objeto.valorseguro:=StrToCurr(dm.FDMemItemComprascompravalorseguro.Value);
     objeto.statusCompra:=dm.FDMemItemComprascomprastatus.Value;

      objeto.itemcompras.Clear;
     dm.FDMemItemCompras.First;
      while not dm.FDMemItemCompras.Eof do
      begin
         itemCompra:=TItemCompra.Create;
         itemCompra.id_itemcompra:=StrToInt(dm.FDMemItemComprasid_itemcompra.Value);
         itemCompra.qtde:=StrToCurr(dm.FDMemItemComprasqtde.Value);
         itemCompra.Subtotal:=StrToCurr(dm.FDMemItemComprassubtotal.Value);
        itemCompra.custototal :=StrToCurr( dm.FDMemItemComprascustototal.Value);
        itemCompra .produto.tipoproduto:=dm.FDMemItemComprasprodutotipoproduto.Value;
        itemCompra.produto.idproduto:=StrToInt(dm.FDMemItemComprasprodutoidproduto.Value);
        itemCompra.produto.nomeproduto:=dm.FDMemItemComprasprodutonomeproduto.Value;
        itemCompra.produto.precocusto:=StrToCurr(dm.FDMemItemComprasprodutoprecocusto.Value);
        objeto.itemcompras.Add(itemCompra);
        dm.FDMemItemCompras.Next;
      end;


      lresponse:=   TRequest.New.BaseURL('http://192.168.1.3:8080/' ).
      AcceptCharset ('application/json').
      Resource( '/contas-apagar/situacao-contas?').
      BasicAuthentication(usuario.funcionario.email,usuario.senha).
      AddParam('cnpj', objeto.fornecedor.cpfouCnpj).
      AddParam('numeroTitulo',objeto.numeronota.ToString).
      DataSetAdapter(dm.FDMemContasaPagar).Get  ;
    objeto.contas.Clear;
    dm.FDMemContasaPagar.First;
    while not dm.FDMemContasaPagar.Eof do
    begin
      contaPagar:=TContasPagar.Create;
      contaPagar.idconta:=StrToInt(dm.FDMemContasaPagaridconta.Value);
      contaPagar.numparcela:=StrToInt(dm.FDMemContasaPagarnumparcela.Value);
      contaPagar.numtitulo:=StrToInt(dm.FDMemContasaPagarnumtitulo.Value);
      contaPagar.valoparcela:=StrToCurr(dm.FDMemContasaPagarvaloparcela.Value);
      contaPagar.statuspagmaento:=dm.FDMemContasaPagarstatuspagmaento.Value;
      contaPagar.datavencimento:=StrToDate(dm.FDMemContasaPagardatavencimento.Value);
      contaPagar.formadePagmamento.Idformapagamento:=StrToInt(dm.FDMemContasaPagarformadePagmamentoidformapagamento.Value);
     contaPagar.formadePagmamento.Nomeforma:= (dm.FDMemContasaPagarformadePagmamentonomeforma.value);
     objeto.contas.Add(contaPagar);
     dm.FDMemContasaPagar.Next;
    end;


    Result:=  objeto;
end;

constructor TDAoCompra.Create;
begin
    dm:=TDataEventos.Create(nil);
end;

destructor TDAoCompra.Destroy;
begin
  dm.Free;
  inherited;
end;

function TDAoCompra.Excluir(pid: integer; usuario: TUsuarioComToken): string;
begin

end;

function TDAoCompra.pesquisa(colecao: TObjectList<TCompra>; pchave,
  ptipo: string; usuario: TUsuarioComToken): TObjectList<TCompra>;
var  compra: TCompra;
begin

      if ptipo='&Cancelada' then
           TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( 'compras/buscar-por-canceladas').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     DataSetAdapter(dm.FDMemCompras).Get
      else
      if Length (pchave)=0 then
        TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( 'compras/').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
    DataSetAdapter(dm.FDMemCompras).Get
    else
    if ptipo ='&Cnpj' then
            TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( 'compras/buscar-por-cnpj?').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
      AddParam('cnpj',pchave).
     DataSetAdapter(dm.FDMemCompras).Get
      else
      begin
         TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( 'compras/buscar-por-nome?').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
      AddParam('parametro',pchave).
     DataSetAdapter(dm.FDMemCompras).Get;
      end;
   colecao.clear;
   dm.FDMemCompras.First;
   while not dm.FDMemCompras.Eof do
   begin
     compra:=TCompra.Create;
     compra.idCompra:=StrToInt(dm.FDMemComprasidcompra.Value);
     compra.numeronota:=StrToInt(dm.FDMemComprasnumeronota.Value);
     compra.fornecedor.nomePessoa:=dm.FDMemComprasfornecedornomePessoa.Value;
     compra.totalCompra:=StrToCurr(dm.FDMemComprastotalCompra.Value);
     compra.statusCompra:=dm.FDMemComprasstatus.Value;
     compra.datadeentrada:= StrToDateTime(dm.FDMemComprasdatadeentrada.value);
     colecao.Add(compra);
     dm.FDMemCompras.Next;
   end;
   Result:=colecao;
end;

function TDAoCompra.salvar(objeto: TCompra; usuario: TUsuarioComToken): string;
var
 jsonPai:TJSONObject;
 jsonFilho : TJSONObject;
  itemCompra :TItemCompra;
 lArrayFilho: TJSONArray;
 LResponse:IResponse;
 jsonConta: TJSONObject;
 jsonContaDetalhe: TJSONObject;
 larraycontadetelhe:  TJSONArray;
     contadetalhe: TContasPagar;

begin

     jsonPai := TJSONObject.Create;
     jsonPai:=objeto.deObjetoparaJson(jsonPai);

    lArrayFilho := TJSONArray.create;
  for itemCompra in objeto.itemcompras do
  begin

    jsonFilho := TJson.ObjectToJsonObject(itemCompra);
    lArrayFilho.AddElement(jsonFilho);
  end;
 jsonPai.AddPair('itemcompras', lArrayFilho);

    try
     if objeto.idCompra=0 then
    begin


  LResponse:= TRequest.New.BaseURL('http://192.168.1.3:8080/' ).
       AcceptCharset ('application/json').
     Resource( 'compras/').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).

    AddBody(jsonPai).Post;
    end
   else
    begin
    LResponse:= TRequest.New.BaseURL('http://192.168.1.3:8080/' ).
      AcceptCharset ('application/json').
     Resource( 'compras/').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
    AddBody(jsonPai).Post;
   end;
   if (LResponse.StatusCode = 201) and (objeto.idCompra=0) then
   begin
    ShowMessage('Salvo com sucesso.');

   end ;
 if (LResponse.StatusCode = 200) and (objeto.idCompra>0) then
   begin
       ShowMessage('Editado com sucesso!!')
   end;
  if LResponse.StatusCode=400 then
  begin
    MessageDlg(LResponse.Content, mtError,
        [mbOK], 0);
  end;
finally



end;
end;

function TDAoCompra.salvarprodutoxml(objeto: TProduto;usuario:TUsuarioComToken): Integer;
var
  json:TJSONObject;
  LResponse:IResponse;
begin

    json := TJson.ObjectToJsonObject(objeto);

    try
     if objeto.idproduto=0 then
     begin

      LResponse:=  TRequest.New.BaseURL('http://192.168.1.3:8080/' ).
      Resource('produtos/').
       BasicAuthentication(usuario.funcionario.email,usuario.senha).
      AcceptCharset ('application/json')
      .AddBody(json).Post;

    end
    else
    begin
   LResponse := TRequest.New.BaseURL('http://192.168.1.3:8080/' ).
   Resource('produtos').
   BasicAuthentication(usuario.funcionario.email,usuario.senha).
   AcceptCharset ('application/json')
  .AddBody(json).Put;
    end;

  if (LResponse.StatusCode=200) and (objeto.idproduto>0 )then
  begin
     ShowMessage('Editado com sucesso.');
  end;
  if LResponse.StatusCode=403 then
   begin
      raise Exception.Create('seu usu�rio n�o tem permiss�o para usar este servi�o');
   end;
     if LResponse.StatusCode=400 then
   begin
    ShowMessage(LResponse.Content);
   end;
      if LResponse.StatusCode=500 then
   begin
    ShowMessage(LResponse.Content);
   end;
    finally

    end;
     Result:=LResponse.StatusCode;
end;

end.
