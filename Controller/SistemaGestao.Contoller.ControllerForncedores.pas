unit SistemaGestao.Contoller.ControllerForncedores;

interface
       uses SistemaGestao.Model.IterfaceController, SistemaGestao.Model.EntidadeFornecedor,
       SistemaGestao.Model.DaoFornecedor,System.Generics.Collections, System.SysUtils,
        SistemaGestao.Model.IterfaceDao, SistemaGestao.Model.EntidadeUsuarioComToken;
       type
       TControllerFornecedor = class(TInterfacedObject, Icontroller<TFornecedor>)
       private
    Fobjeto: TFornecedor;
         daoForncedor: Idao<TFornecedor>  ;
          pUsuario: TUsuarioComToken;
       protected

       public
         constructor Create;
         destructor Destroy; override;

       published
            function salvar:string;
           procedure Setobjeto(const objeto: TFornecedor);
           function GetObjeto:TFornecedor;
           function buscarTodos(colecao: TObjectList<TFornecedor> ): TObjectList<TFornecedor>;
           function carregar (objeto : TFornecedor;usuario:TUsuarioComToken ):TFornecedor;
           function carrega:TFornecedor;
           function pesquisa(colecaoObjeto: TObjectList<TFornecedor> ;phave,ptipo:string;usuario:TUsuarioComToken): TObjectList<TFornecedor>;
           function Excluir(pId: integer;usuario:TUsuarioComToken):string;
           property objeto: TFornecedor read Fobjeto write Setobjeto;
           procedure conhecaUsuario(usuario: TUsuarioComToken);
           function buscar:TFornecedor;
       end;
implementation

{ TControllerForncedor }





function TControllerFornecedor.buscar: TFornecedor;
begin
Result:=daoForncedor.buscar(objeto, pUsuario);
end;

function TControllerFornecedor.buscarTodos(
  colecao: TObjectList<TFornecedor>): TObjectList<TFornecedor>;
begin

end;

function TControllerFornecedor.carrega: TFornecedor;
begin
    Result:=daoForncedor.Carregar(objeto,pUsuario);
end;

function TControllerFornecedor.carregar(objeto: TFornecedor;
  usuario: TUsuarioComToken): TFornecedor;
begin
    Result:=daoForncedor.Carregar(objeto,usuario);
end;

procedure TControllerFornecedor.conhecaUsuario(usuario: TUsuarioComToken);
begin
   pUsuario:=usuario;
end;

constructor TControllerFornecedor.Create;
begin
   daoForncedor:=TDaoFornecedor.Create;
   Fobjeto:=TFornecedor.Create;
end;

destructor TControllerFornecedor.Destroy;
begin
  if Assigned(objeto) then

  begin
    FreeAndNil(Fobjeto);
  end;
  inherited;
end;

function TControllerFornecedor.Excluir(pId: integer;
  usuario: TUsuarioComToken): string;
begin
  Result := daoForncedor.Excluir(pId,pUsuario);
end;

function TControllerFornecedor.GetObjeto: TFornecedor;
begin
   Result:=Fobjeto;
end;

function TControllerFornecedor.pesquisa(colecaoObjeto: TObjectList<TFornecedor>;
  phave, ptipo: string; usuario: TUsuarioComToken): TObjectList<TFornecedor>;
begin
  Result:=daoForncedor.pesquisa(colecaoObjeto, phave, ptipo, usuario);
end;

function TControllerFornecedor.salvar: string;
begin
  Result:=daoForncedor.salvar(objeto, pUsuario);
end;

procedure TControllerFornecedor.Setobjeto(const objeto: TFornecedor);
begin
    Fobjeto:=objeto;
end;

end.
