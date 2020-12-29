unit SistemaGestao.Model.ServicoimpNtfiscal;

interface

uses
  System.SysUtils, System.Classes, SistemaGestao.Model.IterfaceIdaoCompra,
  SistemaGestao.Model.DaoCompra,
  ACBrDFe, ACBrNFe,SistemaGestao.Model.EntidadeCidade,
  SistemaGestao.Model.DaoProduto,SistemaGestao.Model.DaoCidade, SistemaGestao.Model.DaoFornecedor,
  Vcl.ImgList, ACBrBase,SistemaGestao.Model.IterfaceDao,SistemaGestao.Model.EntidadeItemCompra,
  SistemaGestao.Model.EntidadeUsuarioComToken  , Vcl.Dialogs,  utipoPessoa, SistemaGestao.Model.EntidadeProduto,
  SistemaGestao.Model.EntidadeCompra,SistemaGestao.Model.EntidadeFornecedor,
  ACBrNFeDANFEClass, ACBrNFeDANFeRLClass, ACBrDFeReport, ACBrDFeDANFeReport,
  ACBrDANFCeFortesFrA4, ACBrNFeDANFEFR;

type
  TServicoimpNF = class(TDataModule)
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFCeFortesA41: TACBrNFeDANFCeFortesA4;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;


  private
    { Private declarations }
           pusuario:TUsuarioComToken;
           daoCompra:IdaoCompra<TCompra>;
  public
        procedure conhecaUsuario(usarioToken: TUsuarioComToken);
        function importxml (objeto:TCompra;xml :string; usuario:TUsuarioComToken):TCompra ;
  end;

var
  ServicoimpNF: TServicoimpNF;

implementation

uses
  SistemaGestao.View.FormMensagem, Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TServicoimpNF }







{ TServicoimpNF }

procedure TServicoimpNF.conhecaUsuario(usarioToken: TUsuarioComToken);
begin
   pUsuario:=usarioToken;
end;

function TServicoimpNF.importxml(objeto: TCompra; xml: string;
  usuario: TUsuarioComToken): TCompra;
var  itemcompra:TItemCompra;
   daoProduto:Idao<TProduto> ;
   daoFonecedor:Idao<TFornecedor>;
   daocidade:Idao<TCidade>;
   data1:TDateTime;
   data:string;
   I:Integer ;
 aufrete, auxde, axudesp,  totap, totalc:Currency;

begin
      totap:=0;
      totalc:=0;
      auxde:=0;
      aufrete:=0;
      axudesp:=0;
      daoProduto:=TDAOProduto.Create ;
      daoCompra:=TDAoCompra.Create;
      daoFonecedor:=TDaoFornecedor.Create;
      daocidade:=TDaoCidade.Create;
      ACBrNFe1.NotasFiscais.Clear;
      objeto.itemcompras.Clear;


    ACBrNFe1.NotasFiscais.LoadFromFile(xml);




   objeto.numeronota:= ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.cNF;
     objeto.dataCompra:=  ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.dEmi;

    objeto.statusCompra:='Entregue';
   ///dados fornecerdor

     objeto.fornecedor.cidade.codigoibge:=
   ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.cMun;

    daocidade.buscar(objeto.fornecedor.cidade,usuario);

  objeto.fornecedor.nomePessoa := ACBrNFe1.NotasFiscais.Items[0]
   .NFe.Emit.xNome;
    objeto.fornecedor.cpfouCnpj:=  ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.CNPJCPF ;
    objeto.fornecedor.rgouInscricao:= ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.IEST;
    objeto.fornecedor.condicaocondicaoPamento.idcondicao := 5;
  objeto.fornecedor.logradouro := ACBrNFe1.NotasFiscais.Items[0]
    .NFe.Emit.EnderEmit.xLgr;
  objeto.fornecedor.bairro := ACBrNFe1.NotasFiscais.Items[0]
    .NFe.Emit.EnderEmit.xBairro;
  objeto.fornecedor.numero :=StrToInt( ACBrNFe1.NotasFiscais.Items[0]
    .NFe.Emit.EnderEmit.nro);
  objeto.fornecedor.telefone := ACBrNFe1.NotasFiscais.Items[0]
    .NFe.Emit.EnderEmit.fone;;
  objeto.fornecedor.cep :=
    IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.cep);

  objeto.fornecedor.complemto := ACBrNFe1.NotasFiscais.Items[0]
    .NFe.Emit.EnderEmit.xCpl;
       if Length(objeto.fornecedor.cpfouCnpj)=14 then
        begin
          objeto.fornecedor.tipessoa:=TTipoPessoa.JUR�DiCA.Getvalue(0)
        end
        else
        begin
           objeto.fornecedor.tipessoa:=TTipoPessoa.F�SICA.Getvalue(1) ;
        end;
         daoFonecedor.buscar(objeto.fornecedor,usuario) ;
     if objeto.fornecedor.codigo >0 then
     begin
       /// ShowMessage('fornecedor j� cadastrado');
        end
        else
   begin

    daoFonecedor.salvar(objeto.fornecedor,usuario);
   end;
     daoFonecedor.buscar(objeto.fornecedor,usuario);


         //// produtos

        data1:=   ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.dEmi;
   data:=FormatDateTime('DD/MM/YYYY',data1);
     for I := 0 to pred(ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Count) do
      begin
    itemcompra := TItemCompra.Create;
    itemcompra.numItem:=ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.nItem;
    itemcompra.produto.codigofabricante :=ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I]
      .Prod.cProd;
       itemcompra.produto.codigoEan13:=  ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.cEAN;
      itemcompra.qtde := ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I]
      .Prod.qTrib;
      if (ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.cEAN<>'')and
      (ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.cProd ='') then
      begin
          itemcompra.produto.codigofabricante:=
          ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.cEAN;
      end;
    if  (ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.cEAN='')and
      (ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.cProd <>'') then
      begin
         itemcompra.produto.codigoEan13:=
         ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.cProd;
      end;


   itemcompra.produto.peso := (ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I]
      .Prod.qCom);


    itemcompra.produto.nomeproduto := ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I]
      .Prod.xProd;
    itemcompra.produto.precocusto := ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I]
      .Prod.vUnTrib;

    itemcompra.produto.unidede := ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I]
      .Prod.uTrib;
      itemcompra.Subtotal:=itemcompra.produto.precocusto*itemcompra.qtde;

     itemcompra.produto.categoria.IdCategoria:=46;
     itemcompra.produto.tipoproduto:='FIS�CO';
     itemcompra.produto.dataultimacmpra:= StrToDate(data);

     itemcompra.produto.ativo:=True;
        daoProduto.buscar(itemcompra.produto, usuario);
  if itemcompra.produto.idproduto=0 then
  begin
      daoCompra.salvarprodutoxml(itemcompra.produto,usuario);
      itemcompra.produto:=daoProduto.buscar(itemcompra.produto, usuario);
  end
  else
  begin
    itemcompra.produto:=daoProduto.Carregar(itemcompra.produto, usuario);
//    itemcompra.qtde:=  ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[I]
//      .Prod.qTrib;


  end;
  totap:=totap+itemcompra.Subtotal;
  totalc:=totalc+itemcompra.Subtotal;
  objeto.itemcompras.Insert(I,itemcompra);


      end;
     objeto.totalproduto := objeto.totalproduto +totap;
       objeto.totalCompra:= objeto.totalCompra+
       totalc+ACBrNFe1.NotasFiscais.Items[0].NFe.Total.ICMSTot.vST;


    aufrete:=aufrete+   ACBrNFe1.NotasFiscais.Items[0].NFe.Total.ICMSTot.vfrete;
   objeto.valorfrete := objeto.valorfrete + aufrete;

  objeto.valorseguro := ACBrNFe1.NotasFiscais.Items[0].NFe.Total.ICMSTot.vSeg;

    objeto.desconto := objeto.valorseguro+ ACBrNFe1.NotasFiscais.Items[0].NFe.Total.ICMSTot.vDesc;

      Result:= objeto;

end;

end.
