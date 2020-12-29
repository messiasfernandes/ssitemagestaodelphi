unit SistemaGestao.Model.IterfaceControllerContas;

interface
        uses SistemaGestao.Model.EntidadeUsuarioComToken, System.Generics.Collections;
        type
          IcontrollerContas <T:class>=  interface
            ['{CA3D56D7-EF77-45DB-B121-2F1EBDDB1AD4}']

            function salvar:integer;
           procedure Setobjeto(const objeto: T);
           function GetObjeto:T;
           function carrega:T ;
           function pesquisa(colecaoObjeto: TObjectList<T> ;pchave,ptipo:string;usuario:TUsuarioComToken): TObjectList<T>;
           property objeto: T  read GetObjeto write Setobjeto;
           function baixarConta : Integer;
       ///    function salvarContas:Integer;
          function  buscarEntreData(colecaoObjeto: TObjectList<T>;ptada1,pdata2:string;usuario:TUsuarioComToken): TObjectList<T>;
            procedure conhecaUsuario(usuario: TUsuarioComToken);

          end;
implementation

end.
