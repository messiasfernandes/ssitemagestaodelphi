unit SistemaGestao.View.FormModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, SistemaGestao.Model.EntidadeUsuarioComToken,
  Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Data.Bind.ObjectScope,
  Data.Bind.Components, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.ImageList,
  Vcl.ImgList;

type
  TFrmModelo = class(TForm)
    Pageprincipal: TPageControl;
    Tabconsulta: TTabSheet;
    Panel1: TPanel;
    edt_chave: TSearchBox;
    Panel2: TPanel;
    Panel3: TPanel;
    tabcadastro: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    rdCodigo: TRadioButton;
    Label4: TLabel;
    Adapter: TAdapterBindSource;
    lista: TBindingsList;
    Label2: TLabel;
    edt_codigo: TMaskEdit;
    lbuaario: TLabel;
    pnl_salvar: TPanel;
    btn_salvar: TSpeedButton;
    ImageList1: TImageList;
    pnle_voltar: TPanel;
    btn_voltar: TSpeedButton;
    pnl_fechar: TPanel;
    btn_fechar: TSpeedButton;
    pnnl_excluir: TPanel;
    btn_excluir: TSpeedButton;
    pnl_editar: TPanel;
    btn_editar: TSpeedButton;
    pl_novo: TPanel;
    btn_novo: TSpeedButton;

    procedure btn_editarClick(Sender: TObject);
    procedure btn_voltarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure edt_chaveInvokeSearch(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdCodigoClick(Sender: TObject);
    procedure edt_chaveKeyPress(Sender: TObject; var Key: Char);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_salvarMouseEnter(Sender: TObject);
    procedure btn_salvarMouseLeave(Sender: TObject);
    procedure btn_voltarMouseEnter(Sender: TObject);
    procedure btn_voltarMouseLeave(Sender: TObject);
    procedure btn_novoMouseEnter(Sender: TObject);
    procedure btn_novoMouseLeave(Sender: TObject);
    procedure btn_editarMouseEnter(Sender: TObject);
    procedure btn_editarMouseLeave(Sender: TObject);
    procedure btn_excluirMouseEnter(Sender: TObject);
    procedure btn_excluirMouseLeave(Sender: TObject);
    procedure btn_fecharMouseEnter(Sender: TObject);
    procedure btn_fecharMouseLeave(Sender: TObject);
  private
    { Private declarations }

  public
  pUsuario: TUsuarioComToken;
  colIndex:Integer ;
  OrdAsc : boolean ;
     procedure inicializar;virtual;
    procedure pesquisar;  virtual;
    procedure editar;virtual;
    procedure salvar; virtual;
    procedure cadEditarDeletar;virtual;
    procedure voltar; virtual;
    procedure excluir;virtual;
    procedure fechar;virtual;
    procedure novo;virtual;
    procedure abriform;virtual;
    procedure carregaedit;virtual;
    procedure buscar;virtual;
    procedure ConhecaObjeto(pcontontroller: TObject);virtual;
    procedure save(ABindSourceAdapter: TBindSourceAdapter);   virtual;
    procedure limpaedit; virtual;
    procedure BloqueiaEdit;virtual;
    procedure DesbloqueiaEdit;virtual;
    procedure conhecaUsuario(usarioToken:TUsuarioComToken) ;virtual;
    procedure  carregaricones;virtual;
  end;

var
  FrmModelo: TFrmModelo;
           tipo:string;
           mbotao:string;
implementation

{$R *.dfm}

{ TFrmModelo }

procedure TFrmModelo.abriform;
begin
   ShowModal;
end;

procedure TFrmModelo.BloqueiaEdit;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    If Components[i].ClassName = 'TEdit' then
      TEdit(Components[i]).Enabled:=False; // ou TEdit(components[i]).text:= ''

  end;
end;

procedure TFrmModelo.btn_editarClick(Sender: TObject);
begin
  editar;
end;

procedure TFrmModelo.btn_editarMouseEnter(Sender: TObject);
begin
    pnl_editar.Color:=$008F8D00;
end;

procedure TFrmModelo.btn_editarMouseLeave(Sender: TObject);
begin
  pnl_editar.Color :=$00D7BA58;
end;

procedure TFrmModelo.btn_excluirClick(Sender: TObject);
begin
  excluir;
end;

procedure TFrmModelo.btn_excluirMouseEnter(Sender: TObject);
begin
     pnnl_excluir.Color:=$002828C6;
end;

procedure TFrmModelo.btn_excluirMouseLeave(Sender: TObject);
begin
   pnnl_excluir.Color:=$004D4FD4;
end;

procedure TFrmModelo.btn_fecharClick(Sender: TObject);
begin
  fechar;
end;

procedure TFrmModelo.btn_fecharMouseEnter(Sender: TObject);
begin
   pnl_fechar.Color:=$0035312B;
end;

procedure TFrmModelo.btn_fecharMouseLeave(Sender: TObject);
begin
    pnl_fechar.Color:=$00796F68;
end;

procedure TFrmModelo.btn_novoClick(Sender: TObject);
begin
   novo;
end;

procedure TFrmModelo.btn_novoMouseEnter(Sender: TObject);
begin
   pl_novo.Color:=$00327D2E;
end;

procedure TFrmModelo.btn_novoMouseLeave(Sender: TObject);
begin
    pl_novo.Color:=$004ABB67;
end;

procedure TFrmModelo.btn_salvarClick(Sender: TObject);
begin
  salvar;
end;

procedure TFrmModelo.btn_salvarMouseEnter(Sender: TObject);
begin
  pnl_salvar.Color:=$00B5513F;
 // btn_salvar.Font.Color:=  $00BA6E2B;
end;

procedure TFrmModelo.btn_salvarMouseLeave(Sender: TObject);
begin
    pnl_salvar.Color:= $00BA6E2B;
  // btn_salvar.Font.Color:=clWhite;
end;

procedure TFrmModelo.btn_voltarClick(Sender: TObject);
begin
     voltar;
end;

procedure TFrmModelo.btn_voltarMouseEnter(Sender: TObject);
begin
   pnle_voltar.Color:=$002828C6;
end;

procedure TFrmModelo.btn_voltarMouseLeave(Sender: TObject);
begin
    pnle_voltar.Color:=$004D4FD4;
end;

procedure TFrmModelo.buscar;
begin

end;

procedure TFrmModelo.cadEditarDeletar;
begin
    Tabconsulta.TabVisible := False;
  tabcadastro.TabVisible := False;
  Pageprincipal.ActivePage := tabcadastro
end;

procedure TFrmModelo.carregaedit;
begin

end;

procedure TFrmModelo.carregaricones;
begin
    ImageList1.GetBitmap(0,btn_salvar.Glyph);
   ImageList1.GetBitmap(2,btn_voltar.Glyph);
   ImageList1.GetBitmap(3,btn_fechar.Glyph);
   ImageList1.GetBitmap(6,btn_excluir.Glyph);
   ImageList1.GetBitmap(4,btn_editar.Glyph);
   ImageList1.GetBitmap(5,btn_novo.Glyph);

end;

procedure TFrmModelo.ConhecaObjeto(pcontontroller: TObject);
begin

end;

procedure TFrmModelo.conhecaUsuario(usarioToken: TUsuarioComToken);
begin
   pUsuario:=usarioToken;
   lbuaario.Caption:=pUsuario.funcionario.email;
end;

procedure TFrmModelo.DesbloqueiaEdit;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    If Components[i].ClassName = 'TEdit' then
      TEdit(Components[i]).Enabled:=True; // ou TEdit(components[i]).text:= ''

  end;
end;

procedure TFrmModelo.editar;
begin
    cadEditarDeletar;

    DesbloqueiaEdit;
end;

procedure TFrmModelo.excluir;
begin
   cadEditarDeletar;
   BloqueiaEdit;
end;

procedure TFrmModelo.fechar;
begin
   Close;
end;

procedure TFrmModelo.FormShow(Sender: TObject);
begin
  inicializar;
  carregaricones;

end;

procedure TFrmModelo.inicializar;
begin
  tabcadastro.TabVisible := False;
  Tabconsulta.TabVisible := False;
  Pageprincipal.ActivePage := Tabconsulta;
end;

procedure TFrmModelo.limpaedit;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    If Components[i].ClassName = 'TEdit' then
      TEdit(Components[i]).clear; // ou TEdit(components[i]).text:= ''

  end;
end;

procedure TFrmModelo.novo;
var id:Integer;
begin
   id:=0;
   edt_codigo.Text:=id.ToString;
   limpaedit;
   DesbloqueiaEdit;
   cadEditarDeletar;
end;

procedure TFrmModelo.pesquisar;
begin

end;

procedure TFrmModelo.rdCodigoClick(Sender: TObject);
begin
 pesquisar
end;

procedure TFrmModelo.salvar;
begin

end;

procedure TFrmModelo.save(ABindSourceAdapter: TBindSourceAdapter);
begin

end;

procedure TFrmModelo.edt_chaveInvokeSearch(Sender: TObject);
begin
   pesquisar;
end;

procedure TFrmModelo.edt_chaveKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
   begin
     pesquisar;
   key:=#0;
   end;
end;

procedure TFrmModelo.voltar;
begin
   if btn_salvar.Caption='&Excluir' then
   begin
     btn_salvar.Caption:=mbotao;
   end;
   inicializar;
end;

end.
