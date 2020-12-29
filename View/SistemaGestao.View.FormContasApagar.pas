unit SistemaGestao.View.FormContasApagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, SistemaGestao.Contoller.ControllerFormadePagamento,
  SistemaGestao.View.FormFormadePagamento,
  SistemaGestao.Model.IterfaceControllerContas,SistemaGestao.Contoller.ControllerContasaPagar,
  System.Generics.Collections, SistemaGestao.Model.EntidadeContaapagar,  uFormatacoes,
  Vcl.StdCtrls, Vcl.WinXCtrls, SistemaGestao.Model.EntidadeUsuarioComToken;

type
  TFrmContasApagar = class(TForm)
    PageControl1: TPageControl;
    TabConsultaConta: TTabSheet;
    TAbBaixarConta: TTabSheet;
    TabLancarContas: TTabSheet;
    Panel1: TPanel;
    pnlHeader: TPanel;
    pnlGrid: TPanel;
    pnlfooter: TPanel;
    pnlbotoes: TPanel;
    pnl_lancar: TPanel;
    pnl_editar: TPanel;
    pnl_baixar: TPanel;
    pnl_novo: TPanel;
    pnl_fechar: TPanel;
    btn_novo: TSpeedButton;
    btn_baixar: TSpeedButton;
    btn_editar: TSpeedButton;
    btn_lancar: TSpeedButton;
    btn_fechar: TSpeedButton;
    ListView1: TListView;
    edt_chave: TSearchBox;
    pnlCadHeader: TPanel;
    Label1: TLabel;
    pnl_body_input: TPanel;
    pnlBotaoes: TPanel;
    pnl_BaixarConta: TPanel;
    btn_pagar: TSpeedButton;
    pnl_alterar: TPanel;
    btn_alterar: TSpeedButton;
    pnl_voltar: TPanel;
    btn_voltar: TSpeedButton;
    edt_idconta: TLabeledEdit;
    edt_nomefornecedor: TLabeledEdit;
    edt_idFornecedor: TLabeledEdit;
    edt_numparcela: TLabeledEdit;
    edtdatavencimento: TLabeledEdit;
    edt_valor_parclela: TLabeledEdit;
    edt_numtitulo: TLabeledEdit;
    edt_idforma: TLabeledEdit;
    edt_forma: TLabeledEdit;
    edt_valor_a_pagar: TLabeledEdit;
    edt_cnpj: TLabeledEdit;
    edt_valorPago: TEdit;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    data1: TDateTimePicker;
    data2: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    pnlfiltrar: TPanel;
    btn_buscar: TSpeedButton;
    pnlforma: TPanel;
    SpeedButton1: TSpeedButton;
    procedure btn_novoMouseEnter(Sender: TObject);
    procedure btn_novoMouseLeave(Sender: TObject);
    procedure btn_baixarMouseEnter(Sender: TObject);
    procedure btn_baixarMouseLeave(Sender: TObject);
    procedure btn_editarMouseEnter(Sender: TObject);
    procedure btn_editarMouseLeave(Sender: TObject);
    procedure btn_lancarMouseEnter(Sender: TObject);
    procedure btn_lancarMouseLeave(Sender: TObject);
    procedure btn_fecharMouseEnter(Sender: TObject);
    procedure btn_fecharMouseLeave(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_baixarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_pagarMouseEnter(Sender: TObject);
    procedure btn_pagarMouseLeave(Sender: TObject);
    procedure btn_alterarMouseEnter(Sender: TObject);
    procedure btn_alterarMouseLeave(Sender: TObject);
    procedure btn_voltarMouseEnter(Sender: TObject);
    procedure btn_voltarMouseLeave(Sender: TObject);
    procedure btn_voltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_pagarClick(Sender: TObject);
    procedure edt_valorPagoChange(Sender: TObject);
    procedure edt_valor_a_pagarChange(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure edt_chaveInvokeSearch(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn_buscarMouseLeave(Sender: TObject);
    procedure btn_buscarMouseEnter(Sender: TObject);
    procedure btn_buscarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton1MouseLeave(Sender: TObject);
    procedure SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListView1AdvancedCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
  private
    { Private declarations }
     pUsuario: TUsuarioComToken;
     colecaocontas: TObjectList<TContasPagar>;
     controllerContasApagar: TControllerContasApgar;
       colIndex:Integer ;
    OrdAsc : boolean ;
 ///    IcontrollerContas<TContasPagar>;
  public
 procedure fechar;
 procedure inicializar;
 procedure pagebaixar;
 procedure conhecaUsuario(usarioToken: TUsuarioComToken) ;
 procedure carregalistiview;
 procedure pesquisar;
 procedure carregaEdit;
 procedure pagar;
 procedure voltar;
 procedure baixar;
 procedure limpaedit;
 procedure bloqueiabotoes;
 procedure desbloqueia;
 procedure desbloquebotoes;
 procedure pesquisarporData;
 procedure pesquisarforma;
  end;

var
  FrmContasApagar: TFrmContasApagar;

implementation

{$R *.dfm}

procedure TFrmContasApagar.btn_baixarMouseLeave(Sender: TObject);
begin
   pnl_baixar.Color:=$00D0C088;

end;

procedure TFrmContasApagar.btn_buscarClick(Sender: TObject);
begin
   pesquisarporData;
end;

procedure TFrmContasApagar.btn_buscarMouseEnter(Sender: TObject);
begin
   pnlfiltrar.Color:=$00AC815E;
end;

procedure TFrmContasApagar.btn_buscarMouseLeave(Sender: TObject);
begin
   pnlfiltrar.Color:=$00C9640F;
end;

procedure TFrmContasApagar.btn_editarClick(Sender: TObject);
begin
   pagebaixar;
end;

procedure TFrmContasApagar.btn_editarMouseEnter(Sender: TObject);
begin
  pnl_editar.Color:=$0068625A;
end;

procedure TFrmContasApagar.btn_editarMouseLeave(Sender: TObject);
begin
   pnl_editar.Color:=$007D756C;
end;

procedure TFrmContasApagar.btn_fecharClick(Sender: TObject);
begin
   fechar;
end;

procedure TFrmContasApagar.btn_fecharMouseEnter(Sender: TObject);
begin
   pnl_fechar.Color:=  $006161D3;
end;

procedure TFrmContasApagar.btn_fecharMouseLeave(Sender: TObject);
begin
   pnl_fechar.Color:= $008686F2;
end;

procedure TFrmContasApagar.btn_novoClick(Sender: TObject);
begin
    pagebaixar;
end;

procedure TFrmContasApagar.btn_novoMouseEnter(Sender: TObject);
begin
    pnl_novo.Color:=   $004DA275;

end;

procedure TFrmContasApagar.btn_novoMouseLeave(Sender: TObject);
begin

    pnl_novo.Color:=$006BCE99;
end;

procedure TFrmContasApagar.btn_pagarClick(Sender: TObject);
begin
   baixar;
end;

procedure TFrmContasApagar.btn_pagarMouseEnter(Sender: TObject);
begin
    pnl_BaixarConta.Color:= $00896446;;
end;

procedure TFrmContasApagar.btn_pagarMouseLeave(Sender: TObject);
begin
   pnl_BaixarConta.Color:=$00AC815E;
end;

procedure TFrmContasApagar.btn_voltarClick(Sender: TObject);
begin
    voltar;
end;

procedure TFrmContasApagar.btn_voltarMouseEnter(Sender: TObject);
begin
   pnl_voltar.Color:=$0056A9D2;
end;

procedure TFrmContasApagar.btn_voltarMouseLeave(Sender: TObject);
begin
   pnl_voltar.Color:=$008BCBEB;
end;

procedure TFrmContasApagar.Button1Click(Sender: TObject);
begin
   pesquisarporData;
end;

procedure TFrmContasApagar.carregaEdit;
begin
     with controllerContasApagar do
   begin
    edt_idconta.Text:=objeto.idconta.ToString;
    edt_nomefornecedor.Text:=objeto.fornecedor.nomePessoa;
    edt_numparcela.Text:=objeto.numparcela.ToString;
    edtdatavencimento.Text:=DateToStr(objeto.datavencimento);
    edt_idfornecedor.Text:=objeto.fornecedor.codigo.ToString;
    edt_valor_parclela.Text:= FormatCurr ('#,##0.000',objeto.valoparcela) ;
    edt_numtitulo.Text:=objeto.numtitulo.ToString;
    edt_idforma.Text:=objeto.formadePagmamento.Idformapagamento.ToString;
    edt_forma.Text:=objeto.formadePagmamento.Nomeforma;
    edt_valor_a_pagar.Text:=FormatCurr ('#,##0.000',objeto.valorapagar);
    edt_cnpj.Text:=objeto.fornecedor.cpfouCnpj;

   end;
end;
procedure TFrmContasApagar.limpaedit;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    If Components[i].ClassName = 'TLabeledEdit' then
      TLabeledEdit(Components[i]).clear;


  end;
  edt_valorPago.Clear;

end;
procedure TFrmContasApagar.ListView1AdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
  var data1,data2: TDateTime;
    rt, r: TRect;
  s: String;
  i: Integer;
  c:TCanvas;

  // Fit the rect used for TextRect
  Procedure PrepareTextRect;
  begin
    rt := r;
    rt.Left := rt.Left +1;
    rt.Top := rt.Top + 1;
  end;
begin
   data2:= StrToDateTime( Item.SubItems.Strings[3]);
   data1:=Date;
     if data2 < data1 then
  begin
    ListView1.Canvas.Font.Color := clRed;
    ListView1.Canvas.Font.Style :=
      ListView1.Canvas.Font.Style + [fsBold];
  end;
   c := Sender.Canvas;
  if (cdsSelected in State) then
  begin
    c.Brush.Color := $008D4D27;
    c.Font.Color := clWhite;
    // will get the rect for Item + Subitems in ViewStyle = vsReport
    r := Item.DisplayRect(drBounds);
    c.FillRect(r);
    // set width to get fitting rt for tfEndEllipsis
    r.Right := r.Left +   TListView(Sender).Columns[0].Width;
    s := Item.Caption;
    PrepareTextRect;

    c.TextRect(rt, s, [tfSingleLine, tfEndEllipsis]);

    if TListView(Sender).ViewStyle = vsReport then
    begin // Paint the Subitems if ViewStyle = vsReport

                      ;
      for i := 0 to Item.SubItems.Count - 1 do

      begin

        r.Left := r.Left + TListView(Sender).Columns.Items[i].Width ;
        r.Right := r.Left + TListView(Sender).Columns.Items[i+1].Width;

        PrepareTextRect;

        s := Item.SubItems[i];


        c.TextRect(rt, s, [tfSingleLine, tfEndEllipsis]);
      end;
    end;
    DefaultDraw := false;
  end  ;
end;

procedure TFrmContasApagar.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
begin
    if ColIndex = Column.Index then
  begin
    // Se a coluna clicada eh a mesma que ja esta,
    // troca a ordem
    OrdAsc := not(OrdAsc);
    Listview1.AlphaSort;
  end else
  begin
    // Sendo a coluna diferente da clicada anteriormente
    OrdAsc := true;
    ColIndex:= Column.Index;
    Listview1.AlphaSort;

  end;
end;

procedure TFrmContasApagar.ListView1Compare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
      inherited;
  If ColIndex = 0 Then
  begin
    // Organiza��o pelo caption do item de acordo com a ordem ascendente ou n�o
    if OrdAsc then
      Compare:= CompareText(Item1.Caption, Item2.Caption)
    else
      Compare:= CompareText(Item2.Caption, Item1.Caption);
  end else
  begin
    // Organiza��o pelos subitems, tb de acordo com a ordem ascendente ou n�o
    if OrdAsc then
      Compare:= CompareText(Item1.SubItems[ColIndex-1],
                            Item2.SubItems[ColIndex-1])
    else
      Compare:= CompareText(Item2.SubItems[ColIndex-1],
                            Item1.SubItems[ColIndex-1]);

  end;
end;

procedure TFrmContasApagar.carregalistiview;
var I ,cont: Integer;
 iten: TListItem;
begin
       Self.ListView1.Clear;
       cont:=colecaocontas.Count;
       for I := 0 to pred(cont) do
         begin
     iten := ListView1.Items.Add();
     iten.Caption :=colecaocontas.Items[I].idconta.ToString;
     iten.SubItems.Add( (colecaocontas.Items[I].numtitulo.ToString));
      iten.SubItems.Add(colecaocontas.Items[I].fornecedor.nomePessoa);
      iten.SubItems.Add(FormatCurr('#,##0.000', (colecaocontas.Items[I].valorapagar)));
     iten.SubItems.Add(FormatDateTime('dd/mm/YYYY ',colecaocontas.Items[I].datavencimento));
     iten.SubItems.Add(FormatCurr('#,##0.000 ', (colecaocontas.Items[I].valoprago)));
       iten.SubItems.Add(FormatCurr('#,##0.000 ', (colecaocontas.Items[I].valoparcela)));
      iten.SubItems.Add (colecaocontas.Items[I].statuspagmaento);
         end;
end;

procedure TFrmContasApagar.conhecaUsuario(usarioToken: TUsuarioComToken);
begin
   pUsuario:=usarioToken;
   controllerContasApagar.conhecaUsuario(pUsuario);
end;

procedure TFrmContasApagar.desbloquebotoes;
begin
  btn_alterar.Enabled:=True;
end;

procedure TFrmContasApagar.desbloqueia;
begin

end;

procedure TFrmContasApagar.edt_chaveInvokeSearch(Sender: TObject);
begin
  pesquisar;
end;

procedure TFrmContasApagar.edt_valorPagoChange(Sender: TObject);
begin
 Formatar(edt_valorPago,TFormato.Peso);
end;

procedure TFrmContasApagar.edt_valor_a_pagarChange(Sender: TObject);
begin
  Formatar(edt_valor_a_pagar,TFormato.Peso);
end;

procedure TFrmContasApagar.fechar;
begin
  Close;
end;

procedure TFrmContasApagar.FormCreate(Sender: TObject);
begin
   colecaocontas:=TObjectList<TContasPagar>.Create;
   controllerContasApagar:=TControllerContasApgar.Create;

end;

procedure TFrmContasApagar.FormDestroy(Sender: TObject);
begin
  colecaocontas.Free;
  controllerContasApagar.Free;
end;

procedure TFrmContasApagar.FormShow(Sender: TObject);
begin
   inicializar;
   data1.Date:=Date;
   data2.Date:=Date;
end;

procedure TFrmContasApagar.inicializar;
begin
  TAbBaixarConta.TabVisible := False;
  TabLancarContas.TabVisible := False;
  TabConsultaConta.TabVisible:=False;
  PageControl1.ActivePage := TabConsultaConta;
end;

procedure TFrmContasApagar.pagar;
begin

   pagebaixar;
   try

  controllerContasApagar.objeto.idconta:=StrToInt(ListView1.Selected.Caption);
  controllerContasApagar.carrega;
  carregaEdit;

except on E: Exception do
      begin
        voltar;
        raise Exception.Create('� necess�rio selecionar uma linha para pagar uma compra');

      end;


end;
end;

procedure TFrmContasApagar.pagebaixar;
begin
     TAbBaixarConta.TabVisible := False;
  TabLancarContas.TabVisible := False;
  TabConsultaConta.TabVisible:=False;
  PageControl1.ActivePage := TAbBaixarConta;
end;

procedure TFrmContasApagar.pesquisar;
var tipo: string;
begin
   tipo:='';
   if RadioButton1.Checked then
   begin
     tipo:='&Cancelado';
   end;
    if RadioButton2.Checked then
   begin
     tipo:='C&npj/Cpf';
   end ;
    if RadioButton3.Checked then
   begin
     tipo:='&Atrasado';
   end ;
   colecaocontas:= controllerContasApagar.pesquisa(colecaocontas,edt_chave.Text, tipo,pUsuario);
   carregalistiview;
   RadioButton1.Checked:=False;
   RadioButton2.Checked:=False;
   RadioButton3.Checked:=False;
   edt_chave.Clear;
end;

procedure TFrmContasApagar.pesquisarforma;
var  frmFormdePgto: TFrmFormadePagamento;
controllerFormadePgto: TControllerFormadePagamento;
mbotao:string;
begin
    frmFormdePgto := TFrmFormadePagamento.Create(Self);
    controllerFormadePgto:=TControllerFormadePagamento.Create;
    frmFormdePgto.conhecaUsuario(pUsuario);
    controllerFormadePgto.conhecaUsuario(pUsuario);
    try
             mbotao:=frmFormdePgto.btn_fechar.Caption;
      frmFormdePgto.btn_fechar.Caption:='&Selecionar';
     frmFormdePgto.pesquisar;
      frmFormdePgto.abriform;
      controllerFormadePgto.objeto.Idformapagamento:=
      StrToInt(frmFormdePgto.ListView1.Selected.Caption);
      controllerFormadePgto.carrega;
      edt_idforma.Text    :=controllerFormadePgto.objeto.Idformapagamento.ToString ;
      edt_forma.Text := controllerFormadePgto.objeto.Nomeforma;

      frmFormdePgto.btn_fechar.Caption:=mbotao;
    finally
    controllerFormadePgto.Free;
      frmFormdePgto.Free;
    end;
end;

procedure TFrmContasApagar.pesquisarporData;
begin
  colecaocontas:=controllerContasApagar.buscarEntreData(colecaocontas, DateToStr(data1.Date), DateToStr(data2.Date),pUsuario);
   carregalistiview;
end;

procedure TFrmContasApagar.RadioButton1Click(Sender: TObject);
begin
   pesquisar;
end;

procedure TFrmContasApagar.RadioButton2Click(Sender: TObject);
begin
   pesquisar;
end;

procedure TFrmContasApagar.RadioButton3Click(Sender: TObject);
begin
   pesquisar;
end;

procedure TFrmContasApagar.SpeedButton1Click(Sender: TObject);
begin
  pesquisarforma;
end;

procedure TFrmContasApagar.SpeedButton1MouseLeave(Sender: TObject);
begin
    pnlforma.Color:=
     $00C9640F;
end;

procedure TFrmContasApagar.SpeedButton1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   pnlforma.Color:=$00AC815E;
end;

procedure TFrmContasApagar.voltar;
begin
   limpaedit;
   desbloquebotoes;
  inicializar;
end;

procedure TFrmContasApagar.btn_lancarMouseEnter(Sender: TObject);
begin
   pnl_lancar.Color:=$00896446;
end;

procedure TFrmContasApagar.btn_lancarMouseLeave(Sender: TObject);
begin
pnl_lancar.Color:= $00AC815E;
end;

procedure TFrmContasApagar.baixar;
begin
   controllerContasApagar.objeto.valoprago:=StrToCurrDef
 (StringReplace(edt_valorPago.Text, '.', '', [rfReplaceAll]), 0);
  controllerContasApagar.objeto.idcocontaMovimento:=1151;
  controllerContasApagar.objeto.formadePagmamento.Idformapagamento:=StrToInt(edt_idforma.Text);
  controllerContasApagar.objeto.dataDePagamento:=Date;
  if (controllerContasApagar.objeto.valoprago=0 )  then
  begin
     raise Exception.Create('O valor a ser pago n�o pode igual a 0 ou menor que  0');
     edt_valorPago.SetFocus;
  end
  else
  begin
       controllerContasApagar.baixarConta;
  end;

  pesquisar;
  voltar;

end;

procedure TFrmContasApagar.bloqueiabotoes;
begin
  btn_alterar.Enabled:=False;

end;

procedure TFrmContasApagar.btn_alterarMouseEnter(Sender: TObject);
begin
   pnl_alterar.Color:=$002B2723;
end;

procedure TFrmContasApagar.btn_alterarMouseLeave(Sender: TObject);
begin
    pnl_alterar.Color:=$00403A34;
end;

procedure TFrmContasApagar.btn_baixarClick(Sender: TObject);
begin
   pagar;
   bloqueiabotoes;
end;

procedure TFrmContasApagar.btn_baixarMouseEnter(Sender: TObject);
begin
   pnl_baixar.Color:=  $00B1A26C;
end;

end.
