unit SistemaGestao.Model.IterfaceFactory;

interface
uses SistemaGestao.Model.EntidadeUsuarioComToken;
       type
       Ifactory =interface
         ['{00BE2D33-DB95-4368-85DA-18CE2525AAFF}']
         procedure CriaCategoria;
         procedure CriaFormadePagamento;
         procedure CriarCondicao;
         procedure CriarCiade;
         procedure CriarFornecedor;
         procedure conhecaUsuario(pUsuario:TUsuarioComToken);
         procedure Criarproduto;
         procedure CriarCompra;
         procedure CriarContasApagar;
         procedure CriarRelatorios;
       end;
implementation

end.
