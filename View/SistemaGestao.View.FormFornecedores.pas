unit SistemaGestao.View.FormFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaGestao.View.FormModelo,SistemaGestao.Model.EntidadeCidade,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,  SistemaGestao.Model.IterfaceController,
  Data.Bind.ObjectScope, Vcl.Mask, Vcl.Buttons, Vcl.StdCtrls, Vcl.WinXCtrls, uValidacampos,
  Vcl.ExtCtrls, Vcl.ComCtrls, uFormatacoes, SistemaGestao.Contoller.ControllerForncedores,
  System.Generics.Collections, SistemaGestao.Model.EntidadeFornecedor, SistemaGestao.Contoller.ControllerCidades,
  SistemaGestao.Model.EntidadeUsuarioComToken,  SistemaGestao.View.FormCidade,SistemaGestao.Model.EntidadeCondicaoPagamento,
  uWebServiceViaCEP,utipoPessoa, SistemaGestao.Model.IterfaceViaCEP,SistemaGestao.View.FormCondicaoPagamento, SistemaGestao.Contoller.ControllerCondicaoPagamento,
  System.ImageList, Vcl.ImgList;

type
  TFrmFornecedor = class(TFrmModelo)
    ListView1: TListView;
    ComboBox1: TComboBox;
    edt_razao_nome: TEdit;
    edt_cpf_cnpj: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    edt_endereco: TEdit;
    edt_numero: TEdit;
    edt_bairro: TEdit;
    edt_telefone: TEdit;
    edt_celular: TEdit;
    edt_cidade: TEdit;
    edt_uf: TEdit;
    edt_estado: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edt_complemento: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edt_email: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edt_condicao: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edt_representante: TEdit;
    Label19: TLabel;
    edt_rg_inscricao: TEdit;
    Label20: TLabel;
    edt_data_fundacao: TEdit;
    Label21: TLabel;
    edt_site: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    edt_cep: TSearchBox;
    edt_codigo_cidade: TSearchBox;
    edt_id_condicao: TSearchBox;
    RadioButton1: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edt_cpf_cnpjChange(Sender: TObject);
    procedure edt_telefoneChange(Sender: TObject);
    procedure edt_celularChange(Sender: TObject);
    procedure edt_cepChange(Sender: TObject);
    procedure btn_pesquisarcepClick(Sender: TObject);
    procedure btn_pesquisar_cidadeClick(Sender: TObject);
    procedure edt_codigo_cidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_rg_inscricaoChange(Sender: TObject);
    procedure edt_data_fundacaoChange(Sender: TObject);
    procedure btne_pesquisar_cpndicaoClick(Sender: TObject);
    procedure edt_id_condicaoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_cepInvokeSearch(Sender: TObject);
    procedure edt_codigo_cidadeInvokeSearch(Sender: TObject);
    procedure edt_id_condicaoInvokeSearch(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_cpf_cnpjExit(Sender: TObject);
  private
      pcontrollerFonrecedor:Icontroller<TFornecedor>;
      colecaoForencedores: TObjectList<TFornecedor>;
      controllerCidade:Icontroller<TCidade>;
      controllerCondicaoPgto: Icontroller<TCondicaoPagmento> ;
  public
    { Public declarations }
    procedure carregalistview;
    procedure novo; override;
    procedure salvar; override;
    procedure carregaedit; override;
    procedure pesquisar; override;
    procedure limpaedit; override;
    procedure conhecaUsuario(usarioToken: TUsuarioComToken); override;
    procedure pesquisarcep;
    procedure pesquisarcidade;
    procedure pesquisarcidadePorId;
    procedure pesquisarcondicao;
    procedure pesquisarcondicaoporId;
    procedure editar; override;
    procedure excluir; override;
    procedure BloqueiaEdit; override;
    procedure DesbloqueiaEdit; override;
    procedure validacpfoucnpj;



  end;

var
  FrmFornecedor: TFrmFornecedor;

implementation

{$R *.dfm}

procedure TFrmFornecedor.BloqueiaEdit;
begin
 edt_cep.Enabled:=False;
 edt_codigo_cidade.Enabled:=False;
 edt_id_condicao.Enabled:=False;

  inherited;

end;

procedure TFrmFornecedor.btne_pesquisar_cpndicaoClick(Sender: TObject);
begin
  inherited;
   pesquisarcondicao;
end;

procedure TFrmFornecedor.btn_pesquisarcepClick(Sender: TObject);
begin
  inherited;
  pesquisarcep;
end;

procedure TFrmFornecedor.btn_pesquisar_cidadeClick(Sender: TObject);
begin
  inherited;
  pesquisarcidade;
end;

procedure TFrmFornecedor.carregaedit;
begin
  inherited;
  with pcontrollerFonrecedor do
  begin
      edt_codigo.Text:=objeto.codigo.ToString;
      edt_telefone.Text:=objeto.telefone;
      edt_razao_nome.Text:=objeto.nomePessoa;
      edt_celular.Text:=objeto.celular;
      edt_endereco.Text:=objeto.logradouro;
      edt_cep.Text:=objeto.cep;
      edt_cidade.Text:=objeto.cidade.cidadenome;
      edt_codigo_cidade.Text:=objeto.cidade.codigo_cidade.ToString;
      edt_estado.Text:=objeto.cidade.estado.nomestado;
      edt_uf.Text:=objeto.cidade.estado.uf;
      edt_email.Text:=objeto.email;
      edt_site.Text:=objeto.site;
      edt_numero.Text:=objeto.numero.ToString;
      edt_bairro.Text:=objeto.bairro;
      edt_condicao.Text:=objeto.condicaocondicaoPamento.descricao;
      edt_id_condicao.Text:=objeto.condicaocondicaoPamento.idcondicao.ToString;
      edt_complemento.Text:=objeto.complemto;
      edt_representante.Text:=objeto.representante;
      edt_rg_inscricao.Text:=objeto.rgouInscricao;
      edt_data_fundacao.Text:=DateToStr(objeto.dataNiverouFundacao);
      edt_cpf_cnpj.Text:=objeto.cpfouCnpj;
      edt_rg_inscricao.Text:=objeto.rgouInscricao;


 
  end;

end;

procedure TFrmFornecedor.carregalistview;
var I : Integer;
 iten: TListItem;
 total:Integer;
begin
    Self.ListView1.Clear;
    total:=colecaoForencedores.Count;
   for I := 0 to Pred( total) do
   begin
     iten := ListView1.Items.Add();
      iten.Caption :=colecaoForencedores.Items[I].codigo.ToString;
     iten.SubItems.Add(colecaoForencedores.Items[I].nomePessoa);
     iten.SubItems.Add(colecaoForencedores.Items[I].cpfouCnpj);
     iten.SubItems.Add(colecaoForencedores.Items[I].telefone);
     iten.SubItems.Add(colecaoForencedores.Items[I].cidade.cidadenome);
     iten.SubItems.Add(colecaoForencedores.Items[I].email);
   end;
end;

procedure TFrmFornecedor.conhecaUsuario(usarioToken: TUsuarioComToken);
begin
  inherited;
  pcontrollerFonrecedor.conhecaUsuario(pUsuario);
end;

procedure TFrmFornecedor.DesbloqueiaEdit;
begin
 edt_cep.Enabled:=True;
 edt_codigo_cidade.Enabled:=True;
 edt_id_condicao.Enabled:=True;
  inherited;

end;

procedure TFrmFornecedor.editar;
begin
  inherited;
  try
      pcontrollerFonrecedor.objeto.codigo:= StrToInt(ListView1.Selected.Caption);
  pcontrollerFonrecedor.carrega;

   if  pcontrollerFonrecedor.objeto.tipessoa.Equals('F�SICA') then
  begin
      ComboBox1.ItemIndex:=Ord(TTipoPessoa.F�SICA);
  end
  else
  if  pcontrollerFonrecedor.objeto.tipessoa.Equals('JUR�DiCA') then
   begin

   ComboBox1.ItemIndex:=Ord(TTipoPessoa.JUR�DiCA);

   end;
   carregaedit;
  except on E: Exception do
  begin
  voltar  ;
  raise Exception.Create('� necess�rio selecionar uma linha da tabela');

  end;

  end;


end;

procedure TFrmFornecedor.edt_celularChange(Sender: TObject);
begin
  inherited;
  Formatar(edt_celular, TFormato.Celular);
end;

procedure TFrmFornecedor.edt_cepChange(Sender: TObject);
begin
  inherited;
  Formatar(edt_cep, TFormato.Personalizado, '#####-###');
end;

procedure TFrmFornecedor.edt_cepInvokeSearch(Sender: TObject);
begin
  inherited;
  pesquisarcep;
end;

procedure TFrmFornecedor.edt_codigo_cidadeInvokeSearch(Sender: TObject);
begin
  inherited;
  pesquisarcidade;
end;

procedure TFrmFornecedor.edt_codigo_cidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
  begin
      pesquisarcidadePorId;
      key:=#0;
  end;
end;

procedure TFrmFornecedor.edt_cpf_cnpjChange(Sender: TObject);
begin
  inherited;
  Formatar(edt_cpf_cnpj, TFormato.CNPJorCPF );
end;

procedure TFrmFornecedor.edt_cpf_cnpjExit(Sender: TObject);
begin
  inherited;
  validacpfoucnpj;
end;

procedure TFrmFornecedor.edt_data_fundacaoChange(Sender: TObject);
begin
  inherited;
  Formatar(edt_data_fundacao, TFormato.Dt);
end;

procedure TFrmFornecedor.edt_id_condicaoInvokeSearch(Sender: TObject);
begin
  inherited;
  pesquisarcondicao;
end;

procedure TFrmFornecedor.edt_id_condicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
   begin
     pesquisarcondicaoporId;
     Key:=#0;
   end;
end;

procedure TFrmFornecedor.edt_rg_inscricaoChange(Sender: TObject);
begin
  inherited;
    Formatar(edt_rg_inscricao,TFormato.InscricaoEstadual,edt_uf.Text);
end;

procedure TFrmFornecedor.edt_telefoneChange(Sender: TObject);
begin
  inherited;
  Formatar(edt_telefone, TFormato.TelefoneFixo);
end;

procedure TFrmFornecedor.excluir;
begin
  inherited;
  try
     pcontrollerFonrecedor.objeto.codigo:=StrToInt(ListView1.Selected.Caption);
  pcontrollerFonrecedor.carrega;
  carregaedit;

  BloqueiaEdit;
  mbotao:= btn_salvar.Caption ;
  btn_salvar.Caption:='&Excluir';
  except on E: Exception do


  begin
  voltar  ;
  raise Exception.Create('� necess�rio selecionar uma linha da tabela');

  end;


  end;

end;

procedure TFrmFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  pcontrollerFonrecedor:=TControllerFornecedor.Create;


  colecaoForencedores:=TObjectList<TFornecedor>.Create();
end;

procedure TFrmFornecedor.FormDestroy(Sender: TObject);
begin
  inherited;
    colecaoForencedores.Free;

end;

procedure TFrmFornecedor.FormShow(Sender: TObject);
begin
carregacombox(ComboBox1);
  inherited;

end;

procedure TFrmFornecedor.limpaedit;
begin
    edt_cep.Clear;
    edt_codigo_cidade.Clear;
    edt_id_condicao.Clear;
    ComboBox1.ItemIndex:=-1;
  inherited;

end;

procedure TFrmFornecedor.novo;
begin
  inherited;

end;

procedure TFrmFornecedor.pesquisar;
begin
  inherited;
  tipo:='';
  if rdCodigo.Checked then
  begin
    tipo:='&C�digo';
  end;
    if RadioButton1.Checked then
  begin
    tipo:='Cnpj/cpf';
  end;
  colecaoForencedores:=pcontrollerFonrecedor.pesquisa(colecaoForencedores,edt_chave.Text,
  tipo,pUsuario );
  carregalistview;
  edt_chave.Clear;
  rdCodigo.Checked:=False;
  RadioButton1.Checked:=False;
end;

procedure TFrmFornecedor.pesquisarcep;
var    WebServiceViaCEP:IWebServiceViaCEP;
retorno :TStringList;
begin
      WebServiceViaCEP := TWebServiceViaCEP.Create;


 WebServiceViaCEP.ConsultarEnderecoWebService(edt_cep.Text);



  // instancia uma TStringList para receber o retorno
  Retorno := TStringList.Create;
  Retorno.Values['Logradouro']:= WebServiceViaCEP.ObterLogradouro;
  Retorno.Values['Bairro']:=WebServiceViaCEP.ObterBairro;
  Retorno.Values['Cidade'] :=WebServiceViaCEP.ObterCidade;


  try
    try
      // invoca o m�todo de consulta e recebe o retorno
     /// Retorno := Comunicador.ConsultarEndereco(edt_cep.Text);
     edt_endereco.Text := Retorno.Values['Logradouro'];
      edt_bairro.Text := Retorno.Values['Bairro'];
      edt_cidade.Text := Retorno.Values['Cidade'];
    except
      // se ocorrer alguma exce��o na comunica��o com o WebService,
      // os textos dos campos s�o apagados
      edt_endereco.Clear;
      edt_bairro.Clear;
      edt_cidade.Clear;
      edt_codigo_cidade.Clear;
    end;
    if Retorno.Values['Cidade']<>'' then
    begin
       controllerCidade:=TControllerCidade.Create;


     controllerCidade.objeto.cidadenome:=edt_cidade.Text;
     controllerCidade.conhecaUsuario(pUsuario);
      controllerCidade.buscar;
      edt_codigo_cidade.Text:=controllerCidade.objeto.codigo_cidade.ToString;
      edt_cidade.Text:=controllerCidade.objeto.cidadenome;
      edt_uf.Text:=controllerCidade.objeto.estado.uf;
      edt_estado.Text:=controllerCidade.objeto.estado.nomestado;
      pcontrollerFonrecedor.objeto.cidade.codigo_cidade:=StrToInt(edt_codigo_cidade.Text);
      pcontrollerFonrecedor.objeto.cep:=edt_cep.Text;
    end
     else
  begin
      MessageDlg('Cep n�o econtrado na base dos correios .', mtError, [mbOK], 0);
    edt_cep.SetFocus;
  end;
  finally
      Retorno.Free;

  end;
end;

procedure TFrmFornecedor.pesquisarcidade;
var ofrmcidade: TFrmCidade;
begin
    ofrmcidade := TFrmCidade.Create(nil);
    controllerCidade:=TcontrollerCidade.Create;
    ofrmcidade.conhecaUsuario(pUsuario);
    controllerCidade.conhecaUsuario(pUsuario);
    try
        mbotao:=ofrmcidade.btn_fechar.Caption;
      ofrmcidade.btn_fechar.Caption:='&Selecionar';
     ofrmcidade.pesquisar;
      ofrmcidade.abriform;
      controllerCidade.objeto.codigo_cidade:=
      StrToInt(ofrmcidade.ListView1.Selected.Caption);
      controllerCidade.carrega;
      edt_codigo_cidade.Text    :=controllerCidade.objeto.codigo_cidade.ToString ;
      edt_cidade.Text := controllerCidade.objeto.cidadenome;
      edt_uf.Text:=controllerCidade.objeto.estado.uf;
      edt_estado.Text:=controllerCidade.objeto.estado.nomestado;
      ofrmcidade.btn_fechar.Caption:=mbotao;
    finally
      ofrmCidade.Free;
    end;
end;

procedure TFrmFornecedor.pesquisarcidadePorId;
begin
     controllerCidade:=TControllerCidade.Create;
    controllerCidade.objeto.codigo_cidade:=StrToInt(edt_codigo_cidade.Text);
    controllerCidade.conhecaUsuario(pUsuario);
    controllerCidade.carrega;
 edt_codigo_cidade.Text    :=controllerCidade.objeto.codigo_cidade.ToString ;
      edt_cidade.Text := controllerCidade.objeto.cidadenome;
      edt_uf.Text:=controllerCidade.objeto.estado.uf;
      edt_estado.Text:=controllerCidade.objeto.estado.nomestado;
end;

procedure TFrmFornecedor.pesquisarcondicao;
var frmcondicaoPgto: TFrmCondicaoPagamento;

begin
     frmcondicaoPgto := TFrmCondicaoPagamento.Create(nil);
    controllerCondicaoPgto:=TControllerCondicaoPagamento.Create;
    frmcondicaoPgto.conhecaUsuario(pUsuario);
    controllerCondicaoPgto.conhecaUsuario(pUsuario);
    try
     mbotao:=frmcondicaoPgto.btn_fechar.Caption;
      frmcondicaoPgto.btn_fechar.Caption:='&Selecionar';
     frmcondicaoPgto.pesquisar;
      frmcondicaoPgto.abriform;
      controllerCondicaoPgto.objeto.idcondicao:=
      StrToInt(frmcondicaoPgto.ListView1.Selected.Caption);
      controllerCondicaoPgto.carrega;
      edt_id_condicao.Text   :=controllerCondicaoPgto.objeto.idcondicao.ToString;
      edt_condicao.Text := controllerCondicaoPgto.objeto.descricao;
      frmcondicaoPgto.btn_fechar.Caption:=mbotao;
    finally

      frmcondicaoPgto.Free;
    end;
end;

procedure TFrmFornecedor.pesquisarcondicaoporId;
 begin
   controllerCondicaoPgto:=TControllerCondicaoPagamento.Create;
   controllerCondicaoPgto.objeto.idcondicao:=StrToInt( edt_id_condicao.Text);
   controllerCondicaoPgto.conhecaUsuario(pUsuario);
    controllerCondicaoPgto.carrega;
    edt_id_condicao.Text   :=controllerCondicaoPgto.objeto.idcondicao.ToString ;
    edt_condicao.Text := controllerCondicaoPgto.objeto.descricao;
end;

procedure TFrmFornecedor.RadioButton1Click(Sender: TObject);
begin
  inherited;
  pesquisar;
end;

procedure TFrmFornecedor.salvar;
begin
  inherited;
       if (Self.btn_Salvar.Caption = '&Excluir') then
  begin
    if Application.MessageBox('DESEJA EXCLUIR ?', 'ATEN��O !!!  ',
      MB_ICONWARNING + MB_YESNO) = ID_YES then
      pcontrollerFonrecedor.Excluir(pcontrollerFonrecedor.objeto.codigo,pUsuario);
      pesquisar;
      Self.voltar;
  end
  else
     if (Self.btn_Salvar.Caption = '&Salvar') then
   begin
   validaCampos(Self);
    with  pcontrollerFonrecedor   do
    begin
     objeto.codigo:=StrToInt(edt_codigo.Text);
    objeto.condicaocondicaoPamento.idcondicao:=StrToInt(edt_id_condicao.Text);
     objeto.nomePessoa:=edt_razao_nome.Text;
     objeto.cidade.codigo_cidade:=StrToInt(edt_codigo_cidade.Text);
     objeto.dataNiverouFundacao:=StrToDate(edt_data_fundacao.Text);
     objeto.cpfouCnpj:=edt_cpf_cnpj.Text;
     objeto.rgouInscricao:=edt_rg_inscricao.Text;
     objeto.cep:=edt_cep.Text;
     objeto.logradouro:=edt_endereco.Text;
     objeto.numero:=StrToInt( edt_numero.Text );
     objeto.bairro:=edt_bairro.Text;
     objeto.complemto:=edt_complemento.Text;
     objeto.telefone:=edt_telefone.Text;
     objeto.celular:=edt_celular.Text;
     objeto.email:=edt_email.Text;


     pcontrollerFonrecedor.objeto.tipessoa:=
     TTipoPessoa.JUR�DiCA.Getvalue(ComboBox1.ItemIndex);


      objeto.representante:=edt_representante.Text;
      objeto.site:=edt_site.Text;
    salvar;
     pesquisar;
    voltar;
    end;
   end;

end;

procedure TFrmFornecedor.validacpfoucnpj;
begin
  if ComboBox1.ItemIndex=0 then
  begin
  if  pcontrollerFonrecedor.objeto.validacnpj(edt_cpf_cnpj.Text) =False then
  begin
      MessageDlg('Cpf incorreto.' + #13 +
        'Por favor, informe um n�mero de <<Cnpj>> v�lido!' + #13, mtError,
        [mbOK], 0);


  end;
  end
  else
   if ComboBox1.ItemIndex=1 then
  begin
       if  pcontrollerFonrecedor.objeto.validaCpf(edt_cpf_cnpj.Text) =False then
  begin
      MessageDlg('Cnpj incorreto.' + #13 +
        'Por favor, informe um n�mero de <<Cpf>> v�lido!' + #13, mtError,
        [mbOK], 0);


  end;
  end;

end;

end.
