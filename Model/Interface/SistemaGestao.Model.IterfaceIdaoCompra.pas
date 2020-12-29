unit SistemaGestao.Model.IterfaceIdaoCompra;

interface
uses System.Generics.Collections, SistemaGestao.Model.EntidadeProduto,
SistemaGestao.Model.EntidadeUsuarioComToken;
        TYPE
        IdaoCompra <T:class> = interface
          ['{F48ABE8C-9CBB-457E-9F0E-5027BF5AF023}']
         function salvar (objeto:T;usuario:TUsuarioComToken):string;
         function Carregar(objeto: T;usuario:TUsuarioComToken): T;
         function Excluir (pid:integer;usuario:TUsuarioComToken):string;
         function pesquisa(colecao: TObjectList<T>;pchave,ptipo:string ;usuario:TUsuarioComToken): TObjectList<T>;
         function salvarprodutoxml(objeto:TProduto;usuario:TUsuarioComToken):Integer;
         function cancelarcompra(objeto:T;usuario:TUsuarioComToken):Integer;
         function buscar(objeto:T;usuario:TUsuarioComToken):T;
        end;
implementation

end.
