unit SistemaGestao.Contoller.ControllerFabricadeCriacao;

interface
      uses SistemaGestao.Model.IterfaceFactory, SistemaGestao.Model.EntidadeCategoria,
      SistemaGestao.View.FormCategoria,SistemaGestao.Model.DmConexaoEventos,SistemaGestao.Model.IterfaceController,
      SistemaGestao.Contoller.ControllerCategorias, SistemaGestao.View.FormFormadePagamento   ,
      SistemaGestao.View.FormCondicaoPagamento , SistemaGestao.View.FormCidade,  SistemaGestao.View.FormProdutos,
      SistemaGestao.Model.EntidadeUsuarioComToken, SistemaGestao.View.FormContasApagar,
      SistemaGestao.View.FormFornecedores, SistemaGestao.View.FormRelatorio,
      SistemaGestao.View.FormCompra;
      type
      TFabrica = class(TInterfacedObject,Ifactory)
      private
        dmConexao: TDataEventos;
        uSuario:TUsuarioComToken;
      protected
        { protected declarations }
      public

       constructor Create;
       destructor Destroy;override;
    procedure CriarRelatorios;
      published
      procedure CriaFormadePagamento;
      procedure CriaCategoria;
      procedure CriarCondicao;
      procedure conhecaUsuario(pUsuario: TUsuarioComToken);
      procedure CriarCiade;
      procedure CriarFornecedor;
      procedure Criarproduto;
      procedure CriarCompra;
      procedure CriarContasApagar;


        { published declarations }
      end;
implementation

uses
  System.SysUtils;

{ TMyClass }



{ TFabrica }

procedure TFabrica.conhecaUsuario(pUsuario: TUsuarioComToken);
begin
  uSuario:=pUsuario;
end;

constructor TFabrica.Create;
begin
  dmConexao:=TDataEventos.Create(nil);
end;

procedure TFabrica.CriaCategoria;

  var frmcategoria : TFrmCategoria;

begin
    frmcategoria := TFrmCategoria.Create(nil);
     try
       frmcategoria.conhecaUsuario(uSuario);
       frmcategoria.pesquisar;
       frmCategoria.abriform;
     finally
       if Assigned(frmcategoria) then
      begin
      frmcategoria.Free;
      end;
end;
end;

procedure TFabrica.CriaFormadePagamento;
var frmFormadePagamento: TFrmFormadePagamento;
begin
    frmFormadePagamento := TFrmFormadePagamento.Create(nil);
    try
       frmFormadePagamento.conhecaUsuario(uSuario);
       frmFormadePagamento.pesquisar;
       frmFormadePagamento.abriform;
    finally
      frmFormadePagamento.Free;
    end;
end;

procedure TFabrica.CriarCiade;
var frmCidade:TFrmCidade;
begin
   frmCidade := TFrmCidade.Create(nil);
   try
     frmCidade.conhecaUsuario(uSuario);
     frmCidade.pesquisar;
     frmCidade.abriform;
   finally
     frmCidade.Free;
   end;
end;

procedure TFabrica.CriarCompra;
var frmCompras: TFrmCompras;
begin
    frmCompras := TFrmCompras.Create(nil);
    try

      frmCompras.conhecaUsuario(uSuario);
       frmCompras.pesquisar;
      frmCompras.ShowModal;
    finally

       if Assigned(frmCompras) then
      begin
      FreeAndNil(frmCompras);
      end;

    end;
end;

procedure TFabrica.CriarCondicao;
var frmCondicaoPgato :TFrmCondicaoPagamento;
begin
    frmCondicaoPgato := TFrmCondicaoPagamento.Create(nil);
    try
      frmCondicaoPgato.conhecaUsuario(uSuario);
      frmCondicaoPgato.pesquisar;
      frmCondicaoPgato.abriform;
    finally
      frmCondicaoPgato.Free;
    end;
end;

procedure TFabrica.CriarContasApagar;
var frmContasApagar: TFrmContasApagar;
begin
    frmContasApagar:=TFrmContasApagar.Create(nil);

    try
     frmContasApagar.conhecaUsuario(uSuario);
    frmContasApagar.pesquisar;
      frmContasApagar.ShowModal;
    finally
      frmContasApagar.Free;
    end;
end;

procedure TFabrica.CriarFornecedor;
var frmFornecedores : TFrmFornecedor;
begin
    frmFornecedores := TFrmFornecedor.Create(nil);
    try
      frmFornecedores.conhecaUsuario(uSuario);
      frmFornecedores.pesquisar;
      frmFornecedores.abriform;
    finally
      frmFornecedores.Free;
    end;
end;

procedure TFabrica.Criarproduto;
var frmProduto: TFrmProduto ;
begin
   frmProduto := TFrmProduto.Create(nil);
   try
       frmProduto.conhecaUsuario(uSuario);
       frmProduto.pesquisar;
       frmProduto.abriform;
   finally
     frmProduto.Free;
   end;
end;

procedure TFabrica.CriarRelatorios;
var frmRelatorio: TFormRelatorio;
begin
   frmRelatorio := TFormRelatorio.Create(nil);
   try
     frmRelatorio.conhecaUsuario(uSuario);
     frmRelatorio.ShowModal;
   finally
     frmRelatorio.Free;
   end;
end;

destructor TFabrica.Destroy;
begin

  inherited;
  FreeAndNil(dmConexao);

end;

end.

