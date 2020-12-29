unit SistemaGestao.Model.EntidadeCompra;

interface
uses SistemaGestao.Model.EntidadeFornecedor,System.Generics.Collections, SistemaGestao.Model.EntidadeItemCompra,
SistemaGestao.Model.EntidadeProduto,  SistemaGestao.Model.EntidadeUsuarioComToken,SistemaGestao.Model.EntidadeContaapagar,
System.StrUtils,System.SysUtils,ACBrDFe,ACBrBase,REST.Json,System.JSON;


       type TCompra = class(TObject)
            private
  private
    Fvalorfrete: Currency;
    Fdesconto: Currency;
    Femail: string;
    Foutrasdepesza: Currency;
    Ftotalproduto: Currency;
    Fvalorseguro: Currency;
    Ffornecedor: TFornecedor;
    Fmarkqup: Currency;
    FtotalCompra: Currency ;
    FmotivoCancelamento: string;
    FidCompra: Integer;
    Fnumeronota: Integer;
    Fdatadeentrada : string;
    FdataCompra :string;
    Fdatacancelamento:string;
    FstatusCompra: string;
    Fitemcompras: TObjectList<TItemCompra>;
    Fcontas: TObjectList<TContasPagar>;

    procedure Setdesconto(const Value: Currency);
    procedure Setemail(const Value: string);
    procedure Setfornecedor(const Value: TFornecedor);
    procedure SetidCompra(const Value: Integer);
    procedure Setmarkqup(const Value: Currency);
    procedure SetmotivoCancelamento(const Value: string);
    procedure Setnumeronota(const Value: Integer);
    procedure Setoutrasdepesza(const Value: Currency);

    procedure Setvalorfrete(const Value: Currency);
    procedure Setvalorseguro(const Value: Currency);
    procedure SetstatusCompra(const Value: string);
    procedure Setitemcompras(const Value: TObjectList<TItemCompra>);
    procedure SettotalCompra(const Value: Currency);
    procedure Settotalproduto(const Value: Currency);
    procedure Setcontas(const Value: TObjectList<TContasPagar>);


            protected


            public

        constructor Create;
        destructor Destroy; override;
        function GetDataCompra: TDateTime;
        procedure SetdataCompra(avalue : TDateTime);
        function GetDatadeentrada: TDateTime;
        procedure Setdatadeentrada(avalue : TDateTime);
        function GetDataCancelamento: TDateTime;
        procedure Setdatacancelamento(avalue : TDateTime);
        property  idCompra: Integer read FidCompra write SetidCompra;
        property  numeronota: Integer read Fnumeronota write Setnumeronota;
        property   markqup : Currency read Fmarkqup write Setmarkqup;
         property  dataCompra: TDateTime read GetDataCompra write SetDataCompra;
        property   valorseguro : Currency read Fvalorseguro write Setvalorseguro;


        property  valorfrete : Currency read Fvalorfrete write Setvalorfrete;
        property  outrasdepesza : Currency read Foutrasdepesza write Setoutrasdepesza;
        property  desconto : Currency read Fdesconto write Setdesconto;
        property  datadeentrada : TDateTime read GetDatadeentrada write SetDatadeentrada;
        property  datacancelamento: TDateTime read GetDataCancelamento write SetDataCancelamento;
        property  motivoCancelamento: string read FmotivoCancelamento write SetmotivoCancelamento;
        property  totalCompra :Currency read FtotalCompra write SettotalCompra;
        property  totalproduto : Currency  read Ftotalproduto write Settotalproduto;
        property fornecedor : TFornecedor read Ffornecedor write Setfornecedor;
        property email:string read Femail write Setemail;
        property  statusCompra: string read FstatusCompra write SetstatusCompra;
        property itemcompras:TObjectList<TItemCompra> read Fitemcompras write Setitemcompras;
        property  contas: TObjectList<TContasPagar> read Fcontas write Setcontas;
        function  clone(pfonecedor: TFornecedor):TFornecedor;
        function remover (idproduto:Integer):TObjectList<TItemCompra>;
         procedure zerarpropiedade;
          function deObjetoparaJson(json: TJSONObject):TJSONObject;
        function addContas(pnumdoc:LongInt;pdata: TDate;pValorTotal: Currency;
  pfonecedor: TFornecedor): TObjectList<TContasPagar>;
         function addProduto(pProduto: TProduto; qtde:Currency;pCusto:Currency):TObjectList<TItemCompra>;
            published

            end;
implementation

uses
  ACBrNFe, Vcl.Dialogs, SistemaGestao.Model.EntidadeParcelas;

{ TCompra }

function TCompra.addContas(pnumdoc: LongInt; pdata: TDate;
  pValorTotal: Currency; pfonecedor: TFornecedor): TObjectList<TContasPagar>;
  var contaDetalhe: TContasPagar;
  I, numparcela: Integer;
   percetual:Currency;
begin
     numparcela:=0;
   for I := 0 to Pred(pfonecedor.condicaocondicaoPamento.qtdeparcelas) do
   begin
      numparcela:=I+1;
      contaDetalhe:=TContasPagar.Create;
      contaDetalhe.numtitulo:=pnumdoc;
      contaDetalhe.numparcela:=numparcela;
      contaDetalhe.statuspagmaento:='PENDENTE';
      contaDetalhe.datavencimento:= pdata+pfonecedor.condicaocondicaoPamento.colecaoparcelas.Items
      [I].dia;

      contaDetalhe.valoparcela:=pValorTotal* pfonecedor.condicaocondicaoPamento
      .colecaoparcelas.Items[I].percentual/100;
      contaDetalhe.valorapagar:=contaDetalhe.valoparcela;
      contaDetalhe.formadePagmamento.Idformapagamento:=pfonecedor.condicaocondicaoPamento.colecaoparcelas
      .Items[i].formadePagamento.Idformapagamento;
        contaDetalhe.formadePagmamento.Nomeforma:=pfonecedor.condicaocondicaoPamento.colecaoparcelas
      .Items[i].formadePagamento.Nomeforma;

      contas.Add(contaDetalhe);
   end;
   Result:=contas;
end;

function TCompra.addProduto(pProduto: TProduto ;qtde:Currency;pCusto:Currency): TObjectList<TItemCompra>;
var itemcompra: TItemCompra;
     I:Integer; aux: Boolean;
begin
    aux:=True;
      itemcompra := TItemCompra.Create;
       itemcompra.produto.idproduto:=pProduto.idproduto;
       itemcompra.qtde:=qtde;
         itemcompra.subtotal := itemcompra.qtde* pcusto;
         itemcompra.produto.nomeproduto:=pProduto.nomeproduto;
         itemcompra.produto.precocusto:= pcusto;
         itemcompra.produto.unidede:=pProduto.unidede;
         itemcompra.produto.categoria.IdCategoria:=pProduto.categoria.IdCategoria;
         itemcompra.produto.tipoproduto:=pProduto.tipoproduto;
         itemcompra.produto.precodevenda:=pProduto.precodevenda;
         itemcompra.produto.customedio:=pProduto.customedio;
         itemcompra.produto.peso:=pProduto.peso;
         itemcompra.produto.dataultimacmpra:=Now;
         itemcompra.produto.codigoEan13:=pProduto.codigoEan13;
         itemcompra.produto.codigofabricante:=pProduto.codigofabricante;
         itemcompra.produto.ativo:=pProduto.ativo;
         itemcompra.produto.qteestoque:=pProduto.qteestoque;
         itemcompra.produto.ultiMocusto_pago:=pProduto.precocusto;
             itemcompra.numItem := itemcompras.Count+1;
         for I := 0 to pred(itemcompras.Count) do
      begin
        if itemcompras.Items[I].produto.idproduto = pProduto.idproduto then
        begin
          itemcompra.subtotal := itemcompra.subtotal +
            itemcompras.Items[I].subtotal;
          itemcompra.qtde := itemcompra.qtde +
           itemcompras.Items[I].qtde;

          itemcompras.Delete(I);
         itemcompras.Insert(I, itemcompra);
          aux := False;
        end;

      end;

      if aux = True then

      begin
        itemcompras.Add(itemcompra);
      end;
      totalCompra:=totalCompra+itemcompra.Subtotal;
      totalproduto:=totalproduto + itemcompra.Subtotal;
      Result:=itemcompras;
end;



function TCompra.clone(pfonecedor: TFornecedor): TFornecedor;
var parcela: TParcelas ;
i: Integer;
begin
     fornecedor.codigo:= pfonecedor.codigo;
     fornecedor.nomePessoa:=pfonecedor.nomePessoa;
     fornecedor.telefone:=pfonecedor.telefone;
     fornecedor.celular:=pfonecedor.celular;
     fornecedor.cep:=pfonecedor.cep;
     fornecedor.condicaocondicaoPamento.idcondicao:=pfonecedor.condicaocondicaoPamento.idcondicao;
     fornecedor.condicaocondicaoPamento.descricao:=pfonecedor.condicaocondicaoPamento.descricao;
     fornecedor.cidade.codigo_cidade:= pfonecedor.cidade.codigo_cidade;
     fornecedor.cidade.cidadenome:=pfonecedor.cidade.cidadenome;
     fornecedor.cidade.estado.nomestado:=pfonecedor.cidade.estado.nomestado;
     fornecedor.cidade.estado.uf:=pfonecedor.cidade.estado.uf;
     fornecedor.cep:=pfonecedor.cep;
     fornecedor.representante:=pfonecedor.representante;
     fornecedor.dataNiverouFundacao:=pfonecedor.dataNiverouFundacao;
     fornecedor.cpfouCnpj:=pfonecedor.cpfouCnpj;
     fornecedor.complemto:=pfonecedor.complemto;
     fornecedor.rgouInscricao:=pfonecedor.rgouInscricao;
     fornecedor.numero:=pfonecedor.numero;
     fornecedor.email:=pfonecedor.email;
     fornecedor.site:=pfonecedor.site;
     fornecedor.logradouro:=pfonecedor.logradouro;
     fornecedor.bairro:=pfonecedor.bairro;
     fornecedor.tipessoa:=pfonecedor.tipessoa;


     fornecedor.condicaocondicaoPamento.qtdeparcelas:=pfonecedor.condicaocondicaoPamento.qtdeparcelas;
      fornecedor.condicaocondicaoPamento.colecaoparcelas.Clear;
    for I := 0 to Pred(fornecedor.condicaocondicaoPamento.qtdeparcelas) do

      begin
        parcela:=TParcelas.Create;
        parcela.idparcela:=pfonecedor.condicaocondicaoPamento.colecaoparcelas.Items[I].idparcela;
        parcela.numeroparcela:=pfonecedor.condicaocondicaoPamento.colecaoparcelas.Items[I].numeroparcela;
        parcela.percentual:=pfonecedor.condicaocondicaoPamento.colecaoparcelas.Items[I].percentual;
        parcela.dia:=pfonecedor.condicaocondicaoPamento.colecaoparcelas.Items[I].dia;
        parcela.formadePagamento.Idformapagamento:=pfonecedor.condicaocondicaoPamento.colecaoparcelas.Items[I].formadePagamento.Idformapagamento;
        parcela.formadePagamento.Nomeforma:=pfonecedor.condicaocondicaoPamento.colecaoparcelas.Items[I].formadePagamento.Nomeforma;
        fornecedor.condicaocondicaoPamento.colecaoparcelas.Add(parcela);


      end;
    Result:=  fornecedor;

    end;


constructor TCompra.Create;
begin
   fornecedor:=TFornecedor.Create;
   itemcompras:=TObjectList<TItemCompra>.Create;
   Fcontas:=TObjectList<TContasPagar>.Create;

end;

function TCompra.deObjetoparaJson(json: TJSONObject): TJSONObject;

begin

      json.AddPair('idCompra', idCompra.ToString);
      json.AddPair('numeronota', numeronota.ToString);
      json.AddPair('dataCompra',DateToStr(dataCompra));
      json.AddPair('markqup', TJSONNumber.Create(markqup));
      json.AddPair('valorseguro',TJSONNumber.Create(valorseguro) );
      json.AddPair('valorfrete', TJSONNumber.Create(valorfrete));
      json.AddPair('totalCompra',TJSONNumber.Create(totalCompra));
      json.AddPair('totalproduto', TJSONNumber.Create(totalproduto));
      json.AddPair('desconto',TJSONNumber.Create(desconto)) ;
      json.AddPair('email', email);
      json.AddPair('idfonecedor', TJSONNumber.Create(fornecedor.codigo));
      json.AddPair('outrasdepesza',TJSONNumber.Create( outrasdepesza));
      json.AddPair('statusCompra', statusCompra)  ;

      Result:=json;
end;

destructor TCompra.Destroy;
begin
   fornecedor.Free;
   itemcompras.Free;
   Fcontas.Free;
  inherited;
end;

function TCompra.GetDataCancelamento: TDateTime;
begin
    Result:=StrToDateTime(Fdatacancelamento) ;
end;

function TCompra.GetDataCompra: TDateTime;
begin
   Result:=StrToDateTime(FdataCompra) ;
end;

function TCompra.GetDatadeentrada: TDateTime;
begin
     Result:=StrToDateTime(Fdatadeentrada) ;
end;

function TCompra.remover(idproduto: Integer): TObjectList<TItemCompra>;
var  I: Integer;
  valor: Boolean;
begin

  valor := True;
  I := 0;
  while (valor = True) do

  begin
    if itemcompras.Items[I].produto.idproduto = idproduto then
    begin
      totalCompra := totalCompra- itemcompras.Items
        [I].subtotal;
     totalproduto := totalproduto-
        itemcompras.Items[I].subtotal;

      itemcompras.Delete(I);
      valor := False;
    end;
    Inc(I);
  end;
  Result:=itemcompras;
end;



procedure TCompra.Setcontas(const Value: TObjectList<TContasPagar>);
begin
  Fcontas := Value;
end;

procedure TCompra.Setdatacancelamento(avalue: TDateTime);
begin
     Fdatacancelamento:= FormatDateTime('DD/MM/YYYY',avalue);
end;

procedure TCompra.SetdataCompra(avalue: TDateTime);
begin
   FdataCompra:= FormatDateTime('DD/MM/YYYY',avalue);
end;

procedure TCompra.Setdatadeentrada(avalue: TDateTime);
begin
  Fdatadeentrada:= FormatDateTime('DD/MM/YYYY HH:M ',avalue);
end;

procedure TCompra.Setdesconto(const Value: Currency);
begin
  Fdesconto := Value;
end;

procedure TCompra.Setemail(const Value: string);
begin
  Femail := Value;
end;

procedure TCompra.Setfornecedor(const Value: TFornecedor);
begin
  Ffornecedor := Value;
end;

procedure TCompra.SetidCompra(const Value: Integer);
begin
  FidCompra := Value;
end;

procedure TCompra.Setitemcompras(const Value: TObjectList<TItemCompra>);
begin
  Fitemcompras := Value;
end;

procedure TCompra.Setmarkqup(const Value: Currency);
begin
  Fmarkqup := Value;
end;

procedure TCompra.SetmotivoCancelamento(const Value: string);
begin
  FmotivoCancelamento := Value;
end;

procedure TCompra.Setnumeronota(const Value: Integer);
begin
  Fnumeronota := Value;
end;

procedure TCompra.Setoutrasdepesza(const Value: Currency);
begin
  Foutrasdepesza := Value;
end;

procedure TCompra.SetstatusCompra(const Value: string);
begin
  FstatusCompra := Value;
end;




procedure TCompra.SettotalCompra(const Value: Currency);
begin
  FtotalCompra := Value;
end;

procedure TCompra.Settotalproduto(const Value: Currency);
begin
  Ftotalproduto := Value;
end;

procedure TCompra.Setvalorfrete(const Value: Currency);
begin
  Fvalorfrete := Value;
end;

procedure TCompra.Setvalorseguro(const Value: Currency);
begin
  Fvalorseguro := Value;
end;

procedure TCompra.zerarpropiedade;
begin
    Self.totalCompra:=0;
    Self.totalproduto:=0;
    Self.desconto:=0;
    Self.itemcompras.Clear;
    Self.valorfrete:=0;
    Self.valorseguro:=0;
    Self.outrasdepesza:=0;
    Self.idCompra:=0 ;
end;

end.
