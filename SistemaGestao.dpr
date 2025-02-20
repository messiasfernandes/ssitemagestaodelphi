program SistemaGestao;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  SistemaGestao.View.FormPrincipal in 'View\SistemaGestao.View.FormPrincipal.pas' {FrmPrincipal},
  SistemaGestao.Model.EntidadeCategoria in 'Model\Entidades\SistemaGestao.Model.EntidadeCategoria.pas',
  SistemaGestao.Model.EntidadeBase in 'Model\Entidades\SistemaGestao.Model.EntidadeBase.pas',
  SistemaGestao.Model.DmConexaoEventos in 'Model\Conexao\SistemaGestao.Model.DmConexaoEventos.pas' {DataEventos: TDataModule},
  SistemaGestao.Model.IterfaceDao in 'Model\Interface\SistemaGestao.Model.IterfaceDao.pas',
  SistemaGestao.View.FormModelo in 'View\SistemaGestao.View.FormModelo.pas' {FrmModelo},
  SistemaGestao.View.FormCategoria in 'View\SistemaGestao.View.FormCategoria.pas' {FrmCategoria},
  SistemaGestao.Model.DaoCategoria in 'Model\Dao\SistemaGestao.Model.DaoCategoria.pas',
  SistemaGestao.Model.IterfaceFactory in 'Model\Interface\SistemaGestao.Model.IterfaceFactory.pas',
  SistemaGestao.Contoller.ControllerFabricadeCriacao in 'Controller\SistemaGestao.Contoller.ControllerFabricadeCriacao.pas',
  SistemaGestao.Model.IterfaceController in 'Model\Interface\SistemaGestao.Model.IterfaceController.pas',
  SistemaGestao.Model.IterfaceEntidade in 'Model\Interface\SistemaGestao.Model.IterfaceEntidade.pas',
  SistemaGestao.Contoller.ControllerCategorias in 'Controller\SistemaGestao.Contoller.ControllerCategorias.pas',
  SistemaGestao.Model.EntidadeFormadePagamento in 'Model\Entidades\SistemaGestao.Model.EntidadeFormadePagamento.pas',
  Pkg.Json.DTO in 'Model\utils\Pkg.Json.DTO.pas',
  SistemaGestao.View.FormFormadePagamento in 'View\SistemaGestao.View.FormFormadePagamento.pas' {FrmFormadePagamento},
  SistemaGestao.Contoller.ControllerFormadePagamento in 'Controller\SistemaGestao.Contoller.ControllerFormadePagamento.pas',
  SistemaGestao.Model.DaoFormdePagamento in 'Model\Dao\SistemaGestao.Model.DaoFormdePagamento.pas',
  SistemaGestao.Model.EntidadeCondicaoPagamento in 'Model\Entidades\SistemaGestao.Model.EntidadeCondicaoPagamento.pas',
  SistemaGestao.Model.EntidadeParcelas in 'Model\Entidades\SistemaGestao.Model.EntidadeParcelas.pas',
  SistemaGestao.Contoller.ControllerCondicaoPagamento in 'Controller\SistemaGestao.Contoller.ControllerCondicaoPagamento.pas',
  SistemaGestao.Model.DaoCondicaoPagamento in 'Model\Dao\SistemaGestao.Model.DaoCondicaoPagamento.pas',
  SistemaGestao.View.FormCondicaoPagamento in 'View\SistemaGestao.View.FormCondicaoPagamento.pas' {FrmCondicaoPagamento},
  uJsonUtil in 'Model\utils\uJsonUtil.pas',
  uConcidcaoAux in 'Model\utils\uConcidcaoAux.pas',
  uFormatacoes in 'Model\utils\uFormatacoes.pas',
  SistemaGestao.View.FormClientes in 'View\SistemaGestao.View.FormClientes.pas' {FrmCliente},
  SistemaGestao.View.FormLogin in 'View\SistemaGestao.View.FormLogin.pas' {FrmLogin},
  SistemaGestao.Contoller.ControllerUsuarioLogar in 'Controller\SistemaGestao.Contoller.ControllerUsuarioLogar.pas',
  SistemaGestao.Model.EntidadeFuncionarioLogar in 'Model\Entidades\SistemaGestao.Model.EntidadeFuncionarioLogar.pas',
  SistemaGestao.Model.Entidade.UsuarioLogar in 'Model\Entidades\SistemaGestao.Model.Entidade.UsuarioLogar.pas',
  SistemaGestao.Model.DaoUsuarioLogar in 'Model\Dao\SistemaGestao.Model.DaoUsuarioLogar.pas',
  SistemaGestao.Model.EntidadeUsuarioComToken in 'Model\Entidades\SistemaGestao.Model.EntidadeUsuarioComToken.pas',
  uValidacampos in 'Model\utils\uValidacampos.pas',
  SistemaGestao.View.FormCidade in 'View\SistemaGestao.View.FormCidade.pas' {FrmCidade},
  SistemaGestao.Model.IterfaceDaoUsuario in 'Model\Interface\SistemaGestao.Model.IterfaceDaoUsuario.pas',
  SistemaGestao.Model.EntidadeEstado in 'Model\Entidades\SistemaGestao.Model.EntidadeEstado.pas',
  SistemaGestao.Model.EntidadeCidade in 'Model\Entidades\SistemaGestao.Model.EntidadeCidade.pas',
  SistemaGestao.Contoller.ControllerCidades in 'Controller\SistemaGestao.Contoller.ControllerCidades.pas',
  SistemaGestao.Model.DaoCidade in 'Model\Dao\SistemaGestao.Model.DaoCidade.pas',
  SistemaGestao.View.FormFornecedores in 'View\SistemaGestao.View.FormFornecedores.pas' {FrmFornecedor},
  SistemaGestao.Model.EntidadePessoa in 'Model\Entidades\SistemaGestao.Model.EntidadePessoa.pas',
  SistemaGestao.Model.EntidadeFornecedor in 'Model\Entidades\SistemaGestao.Model.EntidadeFornecedor.pas',
  SistemaGestao.Model.DaoFornecedor in 'Model\Dao\SistemaGestao.Model.DaoFornecedor.pas',
  SistemaGestao.Contoller.ControllerForncedores in 'Controller\SistemaGestao.Contoller.ControllerForncedores.pas',
  SistemaGestao.Model.IterfaceViaCEP in 'Model\Interface\SistemaGestao.Model.IterfaceViaCEP.pas',
  uWebServiceViaCEP in 'Model\utils\uWebServiceViaCEP.pas',
  utipoPessoa in 'Model\utils\utipoPessoa.pas',
  SistemaGestao.View.FormProdutos in 'View\SistemaGestao.View.FormProdutos.pas' {FrmProduto},
  SistemaGestao.Model.EntidadeCliente in 'Model\Entidades\SistemaGestao.Model.EntidadeCliente.pas',
  SistemaGestao.Model.EntidadeProduto in 'Model\Entidades\SistemaGestao.Model.EntidadeProduto.pas',
  SistemaGestao.Model.DaoProduto in 'Model\Dao\SistemaGestao.Model.DaoProduto.pas',
  SistemaGestao.Contoller.ControllerProduto in 'Controller\SistemaGestao.Contoller.ControllerProduto.pas',
  utipoProduto in 'Model\utils\utipoProduto.pas',
  SistemaGestao.Model.EntidadeCompra in 'Model\Entidades\SistemaGestao.Model.EntidadeCompra.pas',
  SistemaGestao.Model.DaoCompra in 'Model\Dao\SistemaGestao.Model.DaoCompra.pas',
  SistemaGestao.Model.EntidadeItemCompra in 'Model\Entidades\SistemaGestao.Model.EntidadeItemCompra.pas',
  SistemaGestao.Contoller.ControllerCompra in 'Controller\SistemaGestao.Contoller.ControllerCompra.pas',
  SistemaGestao.View.FormCompra in 'View\SistemaGestao.View.FormCompra.pas' {FrmCompras},
  SistemaGestao.Model.ServicoimpNtfiscal in 'Model\serivico\SistemaGestao.Model.ServicoimpNtfiscal.pas' {ServicoimpNF: TDataModule},
  SistemaGestao.View.FormMensagem in 'View\SistemaGestao.View.FormMensagem.pas' {FrmMensagem},
  SistemaGestao.Model.IterfaceIdaoCompra in 'Model\Interface\SistemaGestao.Model.IterfaceIdaoCompra.pas',
  SistemaGestao.Model.IterfaceControllerCompra in 'Model\Interface\SistemaGestao.Model.IterfaceControllerCompra.pas',
  SistemaGestao.Model.EntidadeContaapagar in 'Model\Entidades\SistemaGestao.Model.EntidadeContaapagar.pas',
  SistemaGestao.Model.EntidadeContaDetalhe in 'Model\Entidades\SistemaGestao.Model.EntidadeContaDetalhe.pas',
  uCopyObjeto in 'Model\utils\uCopyObjeto.pas',
  SistemaGestao.View.FormContasApagar in 'View\SistemaGestao.View.FormContasApagar.pas' {FrmContasApagar},
  SistemaGestao.Model.IterfaceDaoContas in 'Model\Interface\SistemaGestao.Model.IterfaceDaoContas.pas',
  SistemaGestao.Model.DaoContaAPagar in 'Model\Dao\SistemaGestao.Model.DaoContaAPagar.pas',
  SistemaGestao.Contoller.ControllerContasaPagar in 'Controller\SistemaGestao.Contoller.ControllerContasaPagar.pas',
  SistemaGestao.Model.IterfaceControllerContas in 'Model\Interface\SistemaGestao.Model.IterfaceControllerContas.pas',
  SistemaGestao.Model.EntidadeContaCaixa in 'Model\Entidades\SistemaGestao.Model.EntidadeContaCaixa.pas',
  SistemaGestao.Model.EntidadeBanco in 'Model\Entidades\SistemaGestao.Model.EntidadeBanco.pas',
  SistemaGestao.Model.DaoContaCaixa in 'Model\Dao\SistemaGestao.Model.DaoContaCaixa.pas',
  SistemaGestao.Model.ServicodeRelatorio in 'Model\serivico\SistemaGestao.Model.ServicodeRelatorio.pas',
  SistemaGestao.View.FormRelatorio in 'View\SistemaGestao.View.FormRelatorio.pas' {FormRelatorio};

{$R *.res}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);

  Application.Run;

end.

























