unit SistemaGestao.View.FormCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls,SistemaGestao.Model.EntidadeUsuarioComToken,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls, System.ImageList, SistemaGestao.Model.IterfaceControllerCompra,
  SistemaGestao.Contoller.ControllerCompra, SistemaGestao.Model.IterfaceController,
  System.Generics.Collections,SistemaGestao.Model.EntidadeCompra, SistemaGestao.Model.EntidadeContaapagar, SistemaGestao.Model.EntidadeContaDetalhe,
  SistemaGestao.Contoller.ControllerForncedores,  SistemaGestao.Model.EntidadeProduto,
   ACBrNFe, SistemaGestao.Model.EntidadeFornecedor,  utipoPessoa,  SistemaGestao.View.FormProdutos,
   uFormatacoes,System.JSON,REST.Json, uValidacampos, SistemaGestao.Contoller.ControllerProduto,
   ACBrBase, SistemaGestao.Model.ServicoimpNtfiscal, System.Threading, uCopyObjeto,
    SistemaGestao.View.FormMensagem,SistemaGestao.View.FormFornecedores,
  ACBrDFe, Vcl.ImgList,SistemaGestao.Model.EntidadeCidade, SistemaGestao.Contoller.ControllerCidades,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdMappedPortTCP,
  IdMappedTelnet;

type
  TFrmCompras = class(TForm)
    pnaelheader: TPanel;
    panelfooter: TPanel;
    panelbody: TPanel;
    edt_chave: TSearchBox;
    Label1: TLabel;
    ListView1: TListView;
    PageControl1: TPageControl;
    TabConsulta: TTabSheet;
    Tabcadastro: TTabSheet;
    ImageList1: TImageList;
    pnl_novo: TPanel;
    btn_novo: TSpeedButton;
    pnl_fehcar: TPanel;
    btn_fechar: TSpeedButton;
    pnlacancelar: TPanel;
    btn_cancelar: TSpeedButton;
    Panel1: TPanel;
    pnlcabecario: TPanel;
    Label2: TLabel;
    pnl_salvar: TPanel;
    btn_salvar: TSpeedButton;
    pnl_voltar: TPanel;
    btn_voltar: TSpeedButton;
    pnl_imprimir: TPanel;
    btn_imprimir: TSpeedButton;
    OpenDialog1: TOpenDialog;
    pnl_cancelar: TPanel;
    btn_cancelar_compra: TSpeedButton;
    PageCadastro: TPageControl;
    TabCompra: TTabSheet;
    TabSheet2: TTabSheet;
    pnlcadastro: TPanel;
    Pnl_edit: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edt_numero_nota: TEdit;
    edt_data_cmpra: TEdit;
    edt_idfornecedor: TSearchBox;
    edt_nomefornecdor: TEdit;
    edt_data_entrada: TEdit;
    edt_xml: TSearchBox;
    edt_markup: TEdit;
    edt_totalproduto: TEdit;
    edt_totalcompra: TEdit;
    edt_valor_frete: TEdit;
    edt_valor_seguro: TEdit;
    edt_outras_despesas: TEdit;
    edt_codigo_produto: TSearchBox;
    edt_nome_produto: TEdit;
    edt_custo_produto: TEdit;
    edtqtde: TEdit;
    edt_desconto: TEdit;
    panelgrid: TPanel;
    ListView2: TListView;
    Pnl_add: TPanel;
    btn_add: TSpeedButton;
    pnl_remover: TPanel;
    btn_remover: TSpeedButton;
    pnledit_contas: TPanel;
    pnlgrid_contas: TPanel;
    pnlgridContas: TPanel;
    ListView3: TListView;
    pnl_addparcelas: TPanel;
    btn_add_parcelas: TSpeedButton;
    edt_qtde_parcelas: TEdit;
    edt_descricao_condicao: TEdit;
    pnl_removerp: TPanel;
    btn_rem_parcelas: TSpeedButton;
    Label22: TLabel;
    Label23: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure edt_chaveInvokeSearch(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_voltarClick(Sender: TObject);
    procedure edt_xmlInvokeSearch(Sender: TObject);
    procedure edt_data_cmpraChange(Sender: TObject);

    procedure edt_markupChange(Sender: TObject);
    procedure edt_totalprodutoChange(Sender: TObject);
    procedure edt_totalcompraChange(Sender: TObject);
    procedure edt_valor_freteChange(Sender: TObject);
    procedure edt_valor_seguroChange(Sender: TObject);
    procedure edt_custo_produtoChange(Sender: TObject);
    procedure edtqtdeChange(Sender: TObject);
    procedure edt_codigo_produtoInvokeSearch(Sender: TObject);
    procedure edt_outras_despesasChange(Sender: TObject);
    procedure edt_data_entradaChange(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure edt_codigo_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_removerClick(Sender: TObject);
    procedure edt_descontoChange(Sender: TObject);
    procedure edt_idfornecedorInvokeSearch(Sender: TObject);
    procedure edt_valor_freteExit(Sender: TObject);
    procedure edt_valor_seguroExit(Sender: TObject);
    procedure edt_outras_despesasExit(Sender: TObject);
    procedure edt_descontoExit(Sender: TObject);
    procedure btn_cancelar_compraClick(Sender: TObject);
    procedure btn_add_parcelasClick(Sender: TObject);
    procedure btn_rem_parcelasClick(Sender: TObject);
    procedure edt_idfornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
  private
    pUsuario: TUsuarioComToken;
    controllerCompras:
    IcontrolleCompra<TCompra>;
    listaCompras: TObjectList<TCompra>;
     dmservico:TServicoimpNF;

        AllTasks: array of ITask;
    FLoading: TFrmMensagem;


    controllerFornecedor : Icontroller<TFornecedor>;
    controlleProduto:Icontroller<TProduto>;
 idfab,  unidade, mbotao:string;
 idcategoria:Integer;
  public
   procedure pesquisar;
    procedure conhecaUsuario(usarioToken: TUsuarioComToken);
    procedure cadEditarDeletar;
    procedure inicializar;
    procedure novo;
    procedure cancelar;
    procedure carregacompras;
    procedure salvar;
    procedure importartNf;
    procedure carregaEdit;
    procedure importaxmProduto;
    procedure carregalisview;
    procedure produtoporid ;
    procedure limpaedit;
    procedure voltar;
    procedure adicionarproduto;
    procedure pesquisarproduto  ;
    procedure RunTask(var aTask: ITask);
    procedure ExibirLoading;
    procedure removerproduto;
    procedure updatevalortotal;
    procedure pesquisarfornecedor;
    procedure cancerlarcompra;
    procedure adcionarcontas;
    procedure carregaContas;
    procedure buscarfornecedorporid;
    procedure bloqueiabotoes;
    procedure desbloqueiboes;
    procedure bloqueiaEdit;
    procedure desbloqueiaEdit;
    procedure desbloqueiabotoesadderemover;


  end;

var
  FrmCompras: TFrmCompras;

implementation

{$R *.dfm}

procedure TFrmCompras.adcionarcontas;
var total:Currency;
begin

 total:= StrToCurrDef
 (StringReplace(edt_totalcompra.Text, '.', '', [rfReplaceAll]), 0);
    validaCampos(self);
    if controllerCompras.objeto.itemcompras.Count= 0 then
    begin
    raise Exception.Create('� necess�rio pelo menos um item na lista de produtos ');
    end
    else
    begin
 controllerCompras.objeto.addContas(StrToInt(edt_numero_nota.Text),
   StrToDate(edt_data_cmpra.Text),total,
   controllerCompras.objeto.fornecedor) ;
   end;

    if controllerCompras.objeto.contas.Count>0 then
    begin
      btn_add.Enabled:=False;
      btn_add_parcelas.Enabled:=False;
      btn_remover.Enabled:=False;
      btn_add_parcelas.Enabled:=False;
      desbloqueiboes;
      bloqueiaEdit;
    end;
   carregaContas;
end;

procedure TFrmCompras.adicionarproduto;
var qte:Currency;
begin
 validaCampos(self);
 try
     qte:= StrToCurrDef
 (StringReplace(edtqtde.Text, '.', '', [rfReplaceAll]), 0);
    controllerCompras.objeto.addProduto(controlleProduto.objeto,qte,StrToCurr(edt_custo_produto.Text));

 carregalisview;
 updatevalortotal;
 except on E: Exception do
 begin

 raise Exception.Create('Selecionar um produto para adicionar');
   edt_codigo_produto.SetFocus;
 end;
    end;

end;

procedure TFrmCompras.bloqueiabotoes;
begin
   btn_cancelar_compra.Enabled:=False;
   btn_salvar.Enabled:=False;
   btn_imprimir.Enabled:=False;


end;

procedure TFrmCompras.bloqueiaEdit;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    If Components[i].ClassName = 'TEdit' then
      TEdit(Components[i]).Enabled:=False; // ou TEdit(components[i]).text:= ''

  end;
    edt_xml.Enabled:=false;
  edt_idfornecedor.Enabled:=False;
  edt_codigo_produto.Enabled:=False;
end;

procedure TFrmCompras.btn_addClick(Sender: TObject);
begin
   adicionarproduto;
end;

procedure TFrmCompras.btn_add_parcelasClick(Sender: TObject);
begin
   adcionarcontas;
end;

procedure TFrmCompras.btn_cancelarClick(Sender: TObject);
begin
  cancelar;
end;

procedure TFrmCompras.btn_cancelar_compraClick(Sender: TObject);
begin
  cancerlarcompra;
end;

procedure TFrmCompras.btn_fecharClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmCompras.btn_imprimirClick(Sender: TObject);
begin
dmservico.ACBrNFe1.NotasFiscais.ImprimirPDF;
 dmservico.ACBrNFe1.NotasFiscais.Imprimir;
end;

procedure TFrmCompras.btn_novoClick(Sender: TObject);
begin
   novo;
end;

procedure TFrmCompras.btn_removerClick(Sender: TObject);
begin
    removerproduto;

end;

procedure TFrmCompras.btn_rem_parcelasClick(Sender: TObject);
begin
   controllerCompras.objeto.contas.Clear;
   ListView3.Clear;
   btn_add.Enabled:=True;
   btn_add_parcelas.Enabled:=True;
   btn_remover.Enabled:=True;

   desbloqueiaEdit;
end;

procedure TFrmCompras.btn_salvarClick(Sender: TObject);
begin
   salvar;
end;

procedure TFrmCompras.btn_voltarClick(Sender: TObject);
begin
   voltar;
end;

procedure TFrmCompras.buscarfornecedorporid;
begin
     controllerFornecedor:=TControllerFornecedor.Create;
    controllerFornecedor.objeto.codigo:=StrToInt(edt_idfornecedor.Text);
    controllerFornecedor.conhecaUsuario(pUsuario);
    controllerFornecedor.carrega;
    controllerCompras.objeto.clone(controllerFornecedor.objeto);
     edt_idfornecedor.Text    :=controllerFornecedor.objeto.codigo.ToString ;
      edt_nomefornecdor.Text := controllerFornecedor.objeto.nomePessoa;
      edt_descricao_condicao.Text:=controllerFornecedor.objeto.condicaocondicaoPamento.descricao;
      edt_qtde_parcelas.Text:=controllerFornecedor.objeto.condicaocondicaoPamento.qtdeparcelas.ToString;
end;

procedure TFrmCompras.cadEditarDeletar;
begin

  Tabconsulta.TabVisible := False;
  tabcadastro.TabVisible := False;

  PageControl1.ActivePage := tabcadastro;
   PageCadastro.ActivePage:=TabCompra;
end;

procedure TFrmCompras.cancelar;
begin
try
   cadEditarDeletar;
   btn_cancelar_compra.Enabled:=True;
   btn_add.Enabled:=False;
   btn_remover.Enabled:=False;
   bloqueiaEdit;
  controllerCompras.objeto.idCompra:=StrToInt(ListView1.Selected.Caption);
  controllerCompras.carrega;
  carregaEdit;
  carregalisview;
  carregaContas;
except on E: Exception do
      begin
        voltar;
        raise Exception.Create('� necess�rio selecionar uma linha para cancelar uma compra');

      end;


end;
end;

procedure TFrmCompras.cancerlarcompra;
begin

  controllerCompras.cancelarcompra;
     pesquisar;
     limpaedit;
     voltar;
end;

procedure TFrmCompras.carregacompras;
var I : Integer;
 iten: TListItem;
begin
       Self.ListView1.Clear;
   for I := 0 to Pred( listaCompras.Count) do
   begin
      iten := ListView1.Items.Add();
       iten.Caption :=listaCompras.Items[I].idCompra.ToString;

     iten.SubItems.Add(listaCompras.Items[I].numeronota.ToString);
     iten.SubItems.Add(listaCompras.Items[I].fornecedor.nomePessoa);
     iten.SubItems.Add(FormatCurr('#,##0.000 ', (listaCompras.Items[I].totalCompra)));
      iten.SubItems.Add(listaCompras.Items[I].statusCompra);
     iten.SubItems.Add(DateTimeToStr(listaCompras.Items[I].datadeentrada));

   end;
end;

procedure TFrmCompras.carregaContas;
var I ,cont: Integer;
 iten: TListItem;
begin
       Self.ListView3.Clear;
       cont:=controllerCompras.objeto.contas.Count;
       for I := 0 to pred(cont) do
         begin
     iten := ListView3.Items.Add();
     iten.Caption :=controllerCompras.objeto.contas.Items[I].numparcela.ToString;
      iten.SubItems.Add(FormatCurr('#,##0.000', (controllerCompras.objeto.contas.Items[I].valoparcela)));
      iten.SubItems.Add(controllerCompras.objeto.contas.Items[I].formadePagmamento.Nomeforma);
     iten.SubItems.Add ( FormatDateTime( 'DD/MM/YYYY' , controllerCompras.objeto.contas.Items[I].datavencimento));
     iten.SubItems.Add(controllerCompras.objeto.contas.Items[I].statuspagmaento)

         end
end;

procedure TFrmCompras.carregaEdit;
begin
 with controllerCompras do
   begin
  edt_nomefornecdor.Text:=objeto.fornecedor.nomePessoa;
     edt_numero_nota.Text:=objeto.numeronota.ToString;
    edt_data_cmpra.Text:=DateToStr(objeto.dataCompra);
   edt_idfornecedor.Text:=objeto.fornecedor.codigo.ToString;
     edt_data_entrada.Text:=DateToStr(Now);
     edt_valor_frete.Text:= FormatCurr ('#,##0.00',objeto.valorfrete) ;
     edt_valor_seguro.Text:=FormatCurr ('#,##0.00',objeto.valorseguro);
     edt_totalproduto.Text:=FormatCurr ('#,##0.00',objeto.totalproduto);
     edt_totalcompra.Text:=FormatCurr ('#,##0.00',objeto.totalCompra);
    edt_descricao_condicao.Text:=controllerCompras.objeto.fornecedor.condicaocondicaoPamento.descricao;
    edt_qtde_parcelas.Text:=controllerCompras.objeto.fornecedor.condicaocondicaoPamento.qtdeparcelas.ToString;
   end;
end;

procedure TFrmCompras.carregalisview;
var I ,cont: Integer;
 iten: TListItem;
begin
       Self.ListView2.Clear;
       cont:=controllerCompras.objeto.itemcompras.Count;
       for I := 0 to pred(cont) do
         begin
     iten := ListView2.Items.Add();
     iten.Caption :=controllerCompras.objeto.itemcompras.Items[I].numItem.ToString;
      iten.SubItems.Add(controllerCompras.objeto.itemcompras.Items[I].produto.idproduto.ToString);
     iten.SubItems.Add(controllerCompras.objeto.itemcompras.Items[I].produto.nomeproduto);
      iten.SubItems.Add(FormatCurr('#,##0.000', (controllerCompras.objeto.itemcompras.Items[I].qtde)));
     iten.SubItems.Add(FormatCurr('#,##0.000 ', (controllerCompras.objeto.itemcompras.Items[I].produto.precocusto)));
     iten.SubItems.Add(FormatCurr('#,##0.00 ', (controllerCompras.objeto.itemcompras.Items[I].Subtotal)));
     iten.SubItems.Add (controllerCompras.objeto.itemcompras.Items[I].produto.unidede);
      iten.SubItems.Add (controllerCompras.objeto.itemcompras.Items[I].produto.codigofabricante);

         end;
end;



procedure TFrmCompras.conhecaUsuario(usarioToken: TUsuarioComToken);
begin
  pUsuario:=usarioToken;
  controllerCompras.conhecaUsuario(usarioToken);
  Label1.Caption:= pUsuario.funcionario.email;
  controllerCompras.objeto.email:=pUsuario.funcionario.email;
end;

procedure TFrmCompras.desbloqueiaEdit;

    var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    If Components[i].ClassName = 'TEdit' then
      TEdit(Components[i]).Enabled:=true; // ou TEdit(components[i]).text:= ''

  end;
  edt_xml.Enabled:=True;
  edt_idfornecedor.Enabled:=True;
  edt_codigo_produto.Enabled:=True;
end;

procedure TFrmCompras.desbloqueiboes;
begin
 
   btn_salvar.Enabled:=True;
   btn_imprimir.Enabled:=True;
end;

procedure TFrmCompras.edtqtdeChange(Sender: TObject);
begin
   Formatar(edtqtde, TFormato.Peso);
end;

procedure TFrmCompras.edt_chaveInvokeSearch(Sender: TObject);
begin
   pesquisar;
end;

procedure TFrmCompras.edt_codigo_produtoInvokeSearch(Sender: TObject);
begin
  pesquisarproduto;
end;

procedure TFrmCompras.edt_codigo_produtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    produtoporid;
    Key:=#0;
  end;
end;

procedure TFrmCompras.edt_custo_produtoChange(Sender: TObject);
begin
///  Formatar(edt_custo_produto, TFormato.Valor);
end;

procedure TFrmCompras.edt_data_cmpraChange(Sender: TObject);
begin
  Formatar(edt_data_cmpra, TFormato.Dt);
end;



procedure TFrmCompras.edt_data_entradaChange(Sender: TObject);
begin
     Formatar(edt_data_entrada,  TFormato.dt);
end;

procedure TFrmCompras.edt_descontoChange(Sender: TObject);
begin
    Formatar(edt_desconto, TFormato.Valor);
end;

procedure TFrmCompras.edt_descontoExit(Sender: TObject);
begin
   with controllerCompras do
begin
objeto.totalCompra:= objeto.totalCompra - StrToCurr(edt_desconto.Text);
   updatevalortotal;
end;
end;

procedure TFrmCompras.edt_idfornecedorInvokeSearch(Sender: TObject);
begin
   pesquisarfornecedor;
end;

procedure TFrmCompras.edt_idfornecedorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
      buscarfornecedorporid;
      key:=#0;
  end;
end;

procedure TFrmCompras.edt_markupChange(Sender: TObject);
begin
   Formatar(edt_markup,TFormato.Valor);
end;

procedure TFrmCompras.edt_outras_despesasChange(Sender: TObject);
begin
  Formatar(edt_outras_despesas, TFormato.Valor);
end;

procedure TFrmCompras.edt_outras_despesasExit(Sender: TObject);
begin
    with controllerCompras do
begin
objeto.totalCompra:= objeto.totalCompra + StrToCurr(edt_outras_despesas.Text);
   updatevalortotal;
end;
end;

procedure TFrmCompras.edt_totalcompraChange(Sender: TObject);
begin
 /// Formatar(edt_totalcompra, TFormato.Valor);
end;

procedure TFrmCompras.edt_totalprodutoChange(Sender: TObject);
begin
 /// Formatar(edt_totalproduto, TFormato.Valor);
end;

procedure TFrmCompras.edt_valor_freteChange(Sender: TObject);
begin
   Formatar(edt_valor_frete, TFormato.Valor);
end;

procedure TFrmCompras.edt_valor_freteExit(Sender: TObject);
begin
with controllerCompras do
begin
objeto.totalCompra:= objeto.totalCompra + StrToCurr(edt_valor_frete.Text);
   updatevalortotal;
end;


end;

procedure TFrmCompras.edt_valor_seguroChange(Sender: TObject);
begin
  Formatar(edt_valor_seguro, TFormato.Valor);
end;

procedure TFrmCompras.edt_valor_seguroExit(Sender: TObject);
begin
  with controllerCompras do
begin
objeto.totalCompra:= objeto.totalCompra + StrToCurr(edt_valor_seguro.Text);
   updatevalortotal;
end;
end;

procedure TFrmCompras.edt_xmlInvokeSearch(Sender: TObject);
begin
   importartNf;

end;

procedure TFrmCompras.ExibirLoading;
begin
       TTask.Run(
    procedure
    begin
        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
            FLoading := TFrmMensagem.Create(nil);
            FLoading.Show;
        end);
        TTask.WaitForAll(AllTasks);
        TThread.Queue(TThread.CurrentTHread,
        procedure
        begin
            FLoading.Close;
            FLoading.Free;
        end);
    end);
end;

procedure TFrmCompras.FormCreate(Sender: TObject);
begin
  controllerCompras:=TControllercompra.Create;
  listaCompras:=TObjectList<TCompra>.Create;
  dmservico:=TServicoimpNF.Create(nil);

end;

procedure TFrmCompras.FormDestroy(Sender: TObject);
begin
  listaCompras.Free;
 /// controllerCompras.Free;
  dmservico.Free;
end;

procedure TFrmCompras.FormShow(Sender: TObject);
begin
 inicializar;
    bloqueiabotoes;
   ImageList1.GetBitmap(10,btn_novo.Glyph);
    ImageList1.GetBitmap(13,btn_fechar.Glyph);
    ImageList1.GetBitmap(14,btn_cancelar.Glyph);
    ImageList1.GetBitmap(15,btn_salvar.Glyph);
    ImageList1.GetBitmap(16,btn_voltar.Glyph);
    ImageList1.GetBitmap(19 ,btn_remover.Glyph);
     ImageList1.GetBitmap(18,btn_add.Glyph);
     ImageList1.GetBitmap(20,btn_imprimir.Glyph);
     ImageList1.GetBitmap(21,btn_cancelar_compra.Glyph);
end;

procedure TFrmCompras.importartNf;

begin

 try
        if not FileExists(edt_xml.Text) then
  begin
    OpenDialog1.Execute();
    edt_xml.Text := OpenDialog1.FileName;

  end
  else
  begin
    OpenDialog1.Execute();
    edt_xml.Text := OpenDialog1.FileName;

  end;
 ///   SetLength(AllTasks, 1);
    RunTask(AllTasks[0]);
   // ExibirLoading;
 except on E: Exception do
 end;


   end;

procedure TFrmCompras.importaxmProduto;
begin
   with controllerCompras do
   begin
     dmservico.importxml(objeto, edt_xml.Text, pUsuario);
   end;
    carregaEdit;

  carregalisview;
end;

procedure TFrmCompras.inicializar;
begin
   tabcadastro.TabVisible := False;
   Tabconsulta.TabVisible := False;

   PageControl1.ActivePage := Tabconsulta;
end;

procedure TFrmCompras.limpaedit;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    If Components[i].ClassName = 'TEdit' then
      TEdit(Components[i]).clear; // ou TEdit(components[i]).text:= ''

  end;
  controllerCompras.objeto.zerarpropiedade;
  controllerCompras.objeto.contas.Clear;
  ListView2.Clear;
  ListView3.Clear;
  edt_idfornecedor.Clear;
  edt_xml.Clear;
  edt_codigo_produto.Clear;

end;

procedure TFrmCompras.novo;
begin
  cadEditarDeletar;
end;

procedure TFrmCompras.pesquisar;
var tipo:string;
begin
  tipo:='';
  if RadioButton1.Checked then
  begin
    tipo:='&Cancelada';
  end;

  if RadioButton2.Checked then
  begin
   tipo:='&Cnpj';
  end;
   listaCompras:=controllerCompras.pesquisa(listaCompras, edt_chave.Text,tipo, pUsuario);
   carregacompras;
   RadioButton1.Checked:=False;
   RadioButton2.Checked:=False;
   edt_chave.Clear;
end;

procedure TFrmCompras.pesquisarfornecedor;
var frmForncedor:TFrmFornecedor;

begin
  frmForncedor := TFrmFornecedor.Create(nil);

     controllerFornecedor:=TControllerFornecedor.Create;
    frmForncedor.conhecaUsuario(pUsuario);
   controllerFornecedor.conhecaUsuario(pUsuario);

    try
        mbotao:=frmForncedor.btn_fechar.Caption;
      frmForncedor.btn_fechar.Caption:='&Selecionar';
     frmForncedor.pesquisar;
      frmForncedor.ShowModal;
     controllerfornecedor.objeto.codigo :=
      StrToInt(frmForncedor.ListView1.Selected.Caption);
      controllerfornecedor.carrega;

      controllerCompras.objeto.clone(controllerFornecedor.objeto);



      edt_idfornecedor.Text    := controllerFornecedor.objeto.codigo.ToString ;
      edt_nomefornecdor.Text := controllerFornecedor.objeto.nomePessoa;
      edt_descricao_condicao.Text:= controllerFornecedor.objeto.condicaocondicaoPamento.descricao;
      edt_qtde_parcelas.Text:=controllerFornecedor.objeto.condicaocondicaoPamento.qtdeparcelas.ToString;
      frmForncedor.btn_fechar.Caption:=mbotao;
  finally

    frmForncedor.Free;
  end;
end;

procedure TFrmCompras.pesquisarproduto;
var frmproduto:TFrmProduto;
begin
      frmproduto := TFrmProduto.Create(nil);
    controlleProduto:=TcontrollerProduto.Create;
    frmproduto.conhecaUsuario(pUsuario);
    controlleProduto.conhecaUsuario(pUsuario);
    try
        mbotao:=frmproduto.btn_fechar.Caption;
      frmproduto.btn_fechar.Caption:='&Selecionar';
     frmproduto.pesquisar;
      frmproduto.ShowModal;
      controlleProduto.objeto.idproduto:=
      StrToInt(frmproduto.ListView1.Selected.Caption);
      controlleProduto.objeto:=  controlleProduto.carrega;

      edt_codigo_produto.Text    :=controlleProduto.objeto.idproduto.ToString ;
      edt_nome_produto.Text := controlleProduto.objeto.nomeproduto;
      edt_custo_produto.Text:=(FormatCurr('#,##0.00' ,controlleProduto.objeto.precocusto));
      unidade:=controlleProduto.objeto.unidede;
      idfab:=controlleProduto.objeto.codigofabricante;
      idcategoria:=controlleProduto.objeto.categoria.IdCategoria;
      frmproduto.btn_fechar.Caption:=mbotao;
    finally
      frmproduto.Free;
    end;
end;

procedure TFrmCompras.produtoporid;
begin

end;

procedure TFrmCompras.RadioButton1Click(Sender: TObject);
begin
 pesquisar;
end;

procedure TFrmCompras.RadioButton2Click(Sender: TObject);
begin
   pesquisar;
end;

procedure TFrmCompras.removerproduto;
var  id:Integer;

begin
     try
      id:= StrToInt( ListView2.Selected.SubItems.Strings[0]);
      controllerCompras.objeto.remover(id);
     carregalisview;
     updatevalortotal;
  except on E: Exception do
  raise Exception.Create('� necess�rio selecionar uma linha para remover um poduto');
  end;
end;

procedure TFrmCompras.RunTask(var aTask: ITask);
begin
 importaxmProduto;
//    aTask := TTask.Run(
//    procedure
//    begin
//        Sleep(1000);
//        TThread.Synchronize(nil,
//        procedure
//        begin
//            importaxmProduto;
//        end);
//    end);
end;

procedure TFrmCompras.salvar;
    var total:Currency;
begin
total:=StrToCurrDef
 (StringReplace(edt_totalproduto.Text, '.', '', [rfReplaceAll]), 0);
      validaCampos(Self);
    controllerCompras.objeto.numeronota:=StrToInt(edt_numero_nota.Text);
    controllerCompras.objeto.fornecedor.codigo:=StrToInt(edt_idfornecedor.Text);
    controllerCompras.objeto.totalCompra:=
    StrToCurrDef(StringReplace(edt_totalcompra.Text, '.','',[rfReplaceAll]),0);
    controllerCompras.objeto.totalproduto:=  total;
    controllerCompras.objeto.dataCompra:=StrToDate(edt_data_cmpra.Text);
    controllerCompras.objeto.markqup:= StrToCurr(edt_markup.Text) / 100 + 1;
    controllerCompras.objeto.statusCompra:='Entregue';
    controllerCompras.objeto.desconto:=StrToCurrDef
     (StringReplace(edt_desconto.Text, '.', '', [rfReplaceAll]), 0);
     controllerCompras.objeto.outrasdepesza:=StrToCurrDef
    (StringReplace(edt_outras_despesas.Text, '.', '', [rfReplaceAll]), 0);
    controllerCompras.objeto.valorfrete:=  StrToCurrDef
    (StringReplace(edt_valor_frete.Text, '.', '', [rfReplaceAll]), 0);
    controllerCompras.objeto.valorseguro:=StrToCurrDef
     (StringReplace(edt_valor_seguro.Text, '.', '', [rfReplaceAll]), 0);
     controllerCompras.salvar;

     pesquisar;
     limpaedit;
     voltar;

end;

procedure TFrmCompras.updatevalortotal;
begin
with controllerCompras do
  begin
   edt_totalproduto.Text:=FormatCurr ('#,##0.00',objeto.totalproduto);
   edt_totalcompra.Text:=FormatCurr ('#,##0.00',objeto.totalCompra) ;

  end;
end;
 procedure TFrmCompras.desbloqueiabotoesadderemover;
 begin

    btn_remover.Enabled:=True;
  btn_add.Enabled:=True;
  btn_add_parcelas.Enabled:=True;
  end;
procedure TFrmCompras.voltar;
begin
  limpaedit;
  desbloqueiabotoesadderemover;
  inicializar;
  bloqueiabotoes;
  desbloqueiaEdit;
end;

end.
