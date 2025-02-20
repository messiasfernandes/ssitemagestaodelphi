unit SistemaGestao.Contoller.ControllerCategorias;

interface
         uses SistemaGestao.Model.EntidadeCategoria, SistemaGestao.Model.IterfaceDao, System.SysUtils,
         SistemaGestao.Model.DaoCategoria, SistemaGestao.Model.IterfaceEntidade, System.Generics.Collections,
         SistemaGestao.Model.IterfaceController,SistemaGestao.Model.EntidadeUsuarioComToken;
         type
         TControllerCategorias = class(TInterfacedObject,Icontroller<TCategoria>)
         private

        daoCategoria:     Idao<TCategoria>;
    Fobjeto: TCategoria;
    pUsuario: TUsuarioComToken;
    procedure Setobjeto(const Value: TCategoria);



           { private declarations }
         protected
           { protected declarations }
         public

          constructor Create;
          destructor Destroy; override;


           function salvar: string;overload;
           function carrega:TCategoria ;
           function pesquisa(colecaoObjeto: TObjectList<TCategoria>;phave,ptipo:string;usuario:TUsuarioComToken ): TObjectList<TCategoria>;
              function Excluir(pId: integer;usuario:TUsuarioComToken):string;
           function GetObjeto:TCategoria;
           property objeto :TCategoria  read Fobjeto write Setobjeto;
            procedure conhecaUsuario(usuario: TUsuarioComToken);
                function buscar :TCategoria;

         published
           { published declarations }
         end;

implementation

{ TControllerCategorias }

procedure TControllerCategorias.conhecaUsuario(usuario: TUsuarioComToken);
begin
   pUsuario:=usuario;
end;



function TControllerCategorias.buscar: TCategoria;
begin

end;



function TControllerCategorias.carrega: TCategoria;
begin
   Result:=daoCategoria.Carregar(Fobjeto, pUsuario);
end;

constructor TControllerCategorias.Create;
begin
  daoCategoria:=TDaoCategoria.Create;
 Fobjeto:=TCategoria.Create;
end;

destructor TControllerCategorias.Destroy;
begin
   FreeAndNil(Fobjeto);

  inherited;

end;

function TControllerCategorias.Excluir(pId: integer;usuario:TUsuarioComToken): string;
begin
   Result:=daoCategoria.Excluir(pId,usuario);
end;



function TControllerCategorias.GetObjeto: TCategoria;
begin
   Result:=objeto;
end;



function TControllerCategorias.pesquisa(
  colecaoObjeto: TObjectList<TCategoria>;phave,ptipo:string;usuario:TUsuarioComToken): TObjectList<TCategoria>;
begin
    Result:=daoCategoria.pesquisa(colecaoObjeto,phave,ptipo,usuario);
end;



function TControllerCategorias.salvar: string;
begin
  Result:=daoCategoria.salvar(objeto,pUsuario);
end;


procedure TControllerCategorias.Setobjeto(const Value: TCategoria);
begin
  Fobjeto := Value;
end;

end.

