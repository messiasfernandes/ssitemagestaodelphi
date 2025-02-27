unit SistemaGestao.Model.DmConexaoEventos;

interface

uses
  System.SysUtils, System.Classes, uRESTDWBase, uDWAbout, uRESTDWServerEvents,
  uRESTDWPoolerDB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDWConstsData,
  Datasnap.DBClient, REST.Types, REST.Client, REST.Authenticator.Basic,
  Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.Stan.Async, FireDAC.DApt,
  REST.Response.Adapter, uDWDataset, DataSet.Serialize,RESTRequest4D.Request,RESTRequest4D.Response,
  frxClass, frxDBSet;


type
  TDataEventos = class(TDataModule)
    FDMemCategoria: TFDMemTable;
    FDMemCategoriaidCategoria: TWideStringField;
    FDMemCategorianomecategoria: TWideStringField;
    FDMemTable1: TFDMemTable;
    FDMemTable1idcondicao: TWideStringField;
    FDMemTable1descricao: TWideStringField;
    FDMemTable1qtdeparcelas: TWideStringField;
    MentabelCategoria: TFDMemTable;
    MentabelCategoriaidCategoria: TIntegerField;
    MentabelCategorianomecategoria: TStringField;
    FDMemTableCondicao: TFDMemTable;
    FDMemTableCondicaoidparcela: TIntegerField;
    FDMemTableCondicaonumeroparcela: TIntegerField;
    FDMemTableCondicaodia: TIntegerField;
    FDMemTableCondicaopercentual: TCurrencyField;
    FDMemTableCondicaoidformapagamento: TIntegerField;
    FDMemTableCondicaoformadePagamento: TAggregateField;
    FDMemCidade: TFDMemTable;
    FDMemCidadecodigo_cidade: TIntegerField;
    FDMemCidadecodigoibge: TIntegerField;
    FDMemCidadecidadenome: TStringField;
    FDMemCidadeestadocodigo: TIntegerField;
    FDMemCidadeestadonomestado: TStringField;
    FDMemCidadeestadouf: TStringField;
    FDMemTableFormadePagamento: TFDMemTable;
    FDMemTableFormadePagamentoidformapagamento: TWideStringField;
    FDMemTableFormadePagamentonomeforma: TWideStringField;
    FDMemFornecedor: TFDMemTable;
    FDMemFornecedorcodigo: TWideStringField;
    FDMemFornecedordataNiverouFundacao: TWideStringField;
    FDMemFornecedornomePessoa: TWideStringField;
    FDMemFornecedorcpfouCnpj: TWideStringField;
    FDMemFornecedorlogradouro: TWideStringField;
    FDMemFornecedornumero: TWideStringField;
    FDMemFornecedorbairro: TWideStringField;
    FDMemFornecedorcomplemto: TWideStringField;
    FDMemFornecedorcep: TWideStringField;
    FDMemFornecedortelefone: TWideStringField;
    FDMemFornecedorcelular: TWideStringField;
    FDMemFornecedoremail: TWideStringField;
    FDMemFornecedortipessoa: TWideStringField;
    FDMemFornecedorrepresentante: TWideStringField;
    FDMemFornecedorsite: TWideStringField;
    FDMemFornecedorcondicaoPamento: TWideStringField;
    FDMemFornecedorcondicaoPamentoidcondicao: TWideStringField;
    FDMemFornecedorcondicaoPamentodescricao: TWideStringField;
    FDMemFornecedorcondicaoPamentoqtdeparcelas: TWideStringField;
    FDMemFornecedorcidade: TWideStringField;
    FDMemFornecedorcidadecodigo_cidade: TWideStringField;
    FDMemFornecedorcidadecodigoibge: TWideStringField;
    FDMemFornecedorcidadecidadenome: TWideStringField;
    FDMemFornecedorcidadeestado: TWideStringField;
    FDMemFornecedorcidadeestadouf: TWideStringField;
    FDMemFornecedorcidadeestadonomestado: TWideStringField;
    MemTableCondicaocondicao: TFDMemTable;
    MemTableCondicaocondicaoidparcela: TWideStringField;
    MemTableCondicaocondicaonumeroparcela: TWideStringField;
    MemTableCondicaocondicaodia: TWideStringField;
    MemTableCondicaocondicaopercentual: TWideStringField;
    MemTableCondicaocondicaoformadePagamento: TWideStringField;
    MemTableCondicaocondicaoformadePagamentoidformapagamento: TWideStringField;
    MemTableCondicaocondicaoformadePagamentonomeforma: TWideStringField;
    MemTableCondicaocondicaocondicaopagamento: TWideStringField;
    MemTableCondicaocondicaocondicaopagamentoidcondicao: TWideStringField;
    MemTableCondicaocondicaocondicaopagamentodescricao: TWideStringField;
    MemTableCondicaocondicaocondicaopagamentoqtdeparcelas: TWideStringField;
    FDMemFornecedorrgouInscricao: TStringField;
    FDMemComprasItems: TFDMemTable;
    FDMemComprasItemsid_itemcompra: TWideStringField;
    FDMemComprasItemsqtde: TWideStringField;
    FDMemComprasItemsproduto: TWideStringField;
    FDMemComprasItemsprodutoidproduto: TWideStringField;
    FDMemComprasItemsprodutonomeproduto: TWideStringField;
    FDMemComprasItemsprodutoprecocusto: TWideStringField;
    FDMemComprasItemsprodutoqteestoque: TWideStringField;
    FDMemComprasItemsprodutotipoproduto: TWideStringField;
    FDMemComprasItemsprodutoprecodevenda: TWideStringField;
    FDMemComprasItemssubtotal: TWideStringField;
    FDMemCompras: TFDMemTable;
    FDMemComprasidcompra: TWideStringField;
    FDMemComprasnumeronota: TWideStringField;
    FDMemComprasstatus: TWideStringField;
    FDMemComprastotalCompra: TWideStringField;
    FDMemComprastotalProduto: TWideStringField;
    FDMemComprasfornecedor: TWideStringField;
    FDMemComprasfornecedorcodigo: TWideStringField;
    FDMemComprasfornecedornomePessoa: TWideStringField;
    FDMemComprasfornecedorcpfouCnpj: TWideStringField;
    FDMemComprasdatadeentrada: TWideStringField;
    FDQuery1: TFDQuery;
    FDMemTableProduto: TFDMemTable;
    FDMemTableProdutoidproduto: TWideStringField;
    FDMemTableProdutonomeproduto: TWideStringField;
    FDMemTableProdutoprecocusto: TWideStringField;
    FDMemTableProdutoqteestoque: TWideStringField;
    FDMemTableProdutoprecodevenda: TWideStringField;
    FDMemTableProdutocustomedio: TWideStringField;
    FDMemTableProdutodataultimacmpra: TWideStringField;
    FDMemTableProdutoativo: TWideStringField;
    FDMemTableProdutounidede: TWideStringField;
    FDMemTableProdutocodigoEan13: TWideStringField;
    FDMemTableProdutotipoproduto: TWideStringField;
    FDMemTableProdutocodigofabricante: TWideStringField;
    FDMemTableProdutomarca: TWideStringField;
    FDMemTableProdutocaminhodafoto: TWideStringField;
    FDMemTableProdutopeso: TWideStringField;
    FDMemTableProdutoultiMocusto_pago: TWideStringField;
    FDMemTableProdutocategoria: TWideStringField;
    FDMemTableProdutocategoriaidCategoria: TWideStringField;
    FDMemTableProdutocategorianomecategoria: TWideStringField;
    FDMemItemCompras: TFDMemTable;
    FDMemItemComprasid_itemcompra: TWideStringField;
    FDMemItemComprasqtde: TWideStringField;
    FDMemItemComprascustototal: TWideStringField;
    FDMemItemComprasproduto: TWideStringField;
    FDMemItemComprasprodutoidproduto: TWideStringField;
    FDMemItemComprasprodutonomeproduto: TWideStringField;
    FDMemItemComprasprodutoprecocusto: TWideStringField;
    FDMemItemComprasprodutoqteestoque: TWideStringField;
    FDMemItemComprasprodutotipoproduto: TWideStringField;
    FDMemItemComprasprodutoprecodevenda: TWideStringField;
    FDMemItemComprassubtotal: TWideStringField;
    FDMemItemComprascompra: TWideStringField;
    FDMemItemComprascompraidcompra: TWideStringField;
    FDMemItemComprascompranumeronota: TWideStringField;
    FDMemItemComprascomprastatus: TWideStringField;
    FDMemItemComprascompratotalCompra: TWideStringField;
    FDMemItemComprascompratotalProduto: TWideStringField;
    FDMemItemComprascomprafornecedor: TWideStringField;
    FDMemItemComprascomprafornecedorcodigo: TWideStringField;
    FDMemItemComprascomprafornecedornomePessoa: TWideStringField;
    FDMemItemComprascomprafornecedorcpfouCnpj: TWideStringField;
    FDMemItemComprascompradatadeentrada: TWideStringField;
    FDMemItemComprascompradataCompra: TWideStringField;
    FDMemItemComprascompravalorseguro: TWideStringField;
    FDMemItemComprascompravalorfrete: TWideStringField;
    FDMemItemComprascompraoutrasdepesza: TWideStringField;
    FDMemItemComprascompradesconto: TWideStringField;
    FDMemContasaPagar: TFDMemTable;
    FDMemContasaPagaridconta: TWideStringField;
    FDMemContasaPagardatalancamento: TWideStringField;
    FDMemContasaPagarfornecedor: TWideStringField;
    FDMemContasaPagarfornecedorcodigo: TWideStringField;
    FDMemContasaPagarfornecedornomePessoa: TWideStringField;
    FDMemContasaPagarfornecedorcpfouCnpj: TWideStringField;
    FDMemContasaPagarnumtitulo: TWideStringField;
    FDMemContasaPagarnumparcela: TWideStringField;
    FDMemContasaPagarvaloparcela: TWideStringField;
    FDMemContasaPagarvaloprago: TWideStringField;
    FDMemContasaPagarvalorapagar: TWideStringField;
    FDMemContasaPagardataDePagamento: TWideStringField;
    FDMemContasaPagardatavencimento: TWideStringField;
    FDMemContasaPagarstatuspagmaento: TWideStringField;
    FDMemContasaPagarformadePagmamento: TWideStringField;
    FDMemContasaPagarformadePagmamentoidformapagamento: TWideStringField;
    FDMemContasaPagarformadePagmamentonomeforma: TWideStringField;
    FDMemContasaPagaridcocontaMovimento: TWideStringField;
    frxReportEstqoue: TfrxReport;
    frxDBDatasetEstoqueProduto: TfrxDBDataset;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    FDMemTabEstoque: TFDMemTable;
    HTTPBasicAuthenticator2: THTTPBasicAuthenticator;
    FDMemTabEstoqueidproduto: TWideStringField;
    FDMemTabEstoquenomeproduto: TWideStringField;
    FDMemTabEstoqueprecocusto: TWideStringField;
    FDMemTabEstoqueqteestoque: TWideStringField;
    FDMemTabEstoqueprecodevenda: TWideStringField;
    FDMemTabEstoquecustomedio: TWideStringField;
    FDMemTabEstoquedataultimacmpra: TWideStringField;
    FDMemTabEstoqueativo: TWideStringField;
    FDMemTabEstoqueunidede: TWideStringField;
    FDMemTabEstoquecodigoEan13: TWideStringField;
    FDMemTabEstoquetipoproduto: TWideStringField;
    FDMemTabEstoquecodigofabricante: TWideStringField;
    FDMemTabEstoquemarca: TWideStringField;
    FDMemTabEstoquecaminhodafoto: TWideStringField;
    FDMemTabEstoquepeso: TWideStringField;
    FDMemTabEstoqueultiMocusto_pago: TWideStringField;
    FDMemTabEstoquecategoria: TWideStringField;
    FDMemTabEstoquecategoriaidCategoria: TWideStringField;
    FDMemTabEstoquecategorianomecategoria: TWideStringField;

  private
    { Private declarations }
  public
    procedure linkcategoria;
    procedure carregarest;
    procedure linkFormadepagamento;
    procedure LinCondicao;
  end;

var
  DataEventos: TDataEventos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataEventos }

procedure TDataEventos.carregarest;
begin

end;

procedure TDataEventos.LinCondicao;
begin
//   RESTClient1.ResetToDefaults;
//   RESTRequest1.ResetToDefaults;
//   RESTResponse1.ResetToDefaults;
//   RESTClient1.BaseURL := 'http://localhost:8080/';
//   RESTRequest1.Resource := '/condicoes-de-pagamento';
//   RESTRequest1.Method := TRESTRequestMethod.rmGET;
//  // RESTRequest1.Execute;
end;

procedure TDataEventos.linkcategoria;
begin


end;

procedure TDataEventos.linkFormadepagamento;
begin

end;

end.
