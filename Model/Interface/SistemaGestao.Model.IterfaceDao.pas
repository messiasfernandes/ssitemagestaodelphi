unit SistemaGestao.Model.IterfaceDao;

interface
uses System.Generics.Collections,SistemaGestao.Model.EntidadeUsuarioComToken;
        TYPE
        Idao <T:class> = interface
          ['{F48ABE8C-9CBB-457E-9F0E-5027BF5AF023}']
         function salvar (objeto:T;usuario:TUsuarioComToken):string;
         function Carregar(objeto: T;usuario:TUsuarioComToken): T;
         function Excluir (pid:integer;usuario:TUsuarioComToken):string;
         function pesquisa(colecao: TObjectList<T>;pchave,ptipo:string ;usuario:TUsuarioComToken): TObjectList<T>;

         function buscar(objeto:T;usuario:TUsuarioComToken):T;
        end;
implementation

end.
