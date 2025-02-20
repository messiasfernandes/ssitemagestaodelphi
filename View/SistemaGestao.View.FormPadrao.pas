unit SistemaGestao.View.FormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient;

type
  TFrmPadrao = class(TForm)
    Pageprincipal: TPageControl;
    Tabconsulta: TTabSheet;
    tabcadastro: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btn_novo: TSpeedButton;
    SearchBox1: TSearchBox;
    Edit1: TEdit;
    btn_editar: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    btn_salvar: TSpeedButton;
    btn_voltar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_fechar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SearchBox1InvokeSearch(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_voltarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure inicializar;virtual;
    procedure pesquisar;  virtual;
    procedure editar;virtual;
    procedure salvar; virtual;
    procedure cadEditarDeletar;virtual;
    procedure voltar; virtual;
    procedure excluir;virtual;
    procedure fechar;virtual;
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

{$R *.dfm}

procedure TFrmPadrao.btn_editarClick(Sender: TObject);
begin
   editar;
end;

procedure TFrmPadrao.btn_salvarClick(Sender: TObject);
begin
   salvar;
end;

procedure TFrmPadrao.btn_voltarClick(Sender: TObject);
begin
   voltar;
end;

procedure TFrmPadrao.cadEditarDeletar;
begin
  Tabconsulta.TabVisible := False;
  tabcadastro.TabVisible := False;
  Pageprincipal.ActivePage := tabcadastro;
end;

procedure TFrmPadrao.editar;
begin
   cadEditarDeletar;
end;

procedure TFrmPadrao.excluir;
begin
  cadEditarDeletar;
end;

procedure TFrmPadrao.fechar;
begin
  Close;
end;

procedure TFrmPadrao.FormCreate(Sender: TObject);
begin
   inicializar;

end;

procedure TFrmPadrao.inicializar;
begin
  tabcadastro.TabVisible := False;
  Tabconsulta.TabVisible := False;
  Pageprincipal.ActivePage := Tabconsulta;
end;

procedure TFrmPadrao.pesquisar;
begin



end;

procedure TFrmPadrao.salvar;
begin

end;

procedure TFrmPadrao.SearchBox1InvokeSearch(Sender: TObject);
begin
  pesquisar;
end;

procedure TFrmPadrao.voltar;
begin
   inicializar;
end;

procedure TFrmPadrao.btn_excluirClick(Sender: TObject);
begin
   excluir;
end;

procedure TFrmPadrao.btn_fecharClick(Sender: TObject);
begin
   fechar;
end;



end.
