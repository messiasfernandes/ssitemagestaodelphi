unit SistemaGestao.Model.DaoCategoria;

interface
         uses SistemaGestao.Model.IterfaceDao, uDWJSONObject, System.JSON,REST.Json, System.Generics.Collections,
          SistemaGestao.Model.EntidadeCategoria,  Vcl.StdCtrls, RESTRequest4D.Request,
          SistemaGestao.Model.DmConexaoEventos,  SistemaGestao.Model.EntidadeUsuarioComToken,
          System.SysUtils,Vcl.Dialogs,REST.Types;
         type

         TDaoCategoria = class(TInterfacedObject, Idao<TCategoria>)
         private
           dmEventos:TDataEventos;


         protected
           { protected declarations }
         public
         function salvar (objeto:TCategoria;usuario:TUsuarioComToken):string;
         function Carregar(objeto:TCategoria;usuario:TUsuarioComToken): TCategoria ;
           function Excluir (pid:integer;usuario:TUsuarioComToken):string;
            function buscar(obeto:TCategoria;usuario:TUsuarioComToken):TCategoria;
          function pesquisa(colecaoCategoria: TObjectList<TCategoria>;
          pchave,ptipo:string;usuario:TUsuarioComToken): TObjectList<TCategoria>;
         published
           constructor  Create;
         destructor  Destroy;override;
           { published declarations }
         end;
implementation

{ TDaoCategoria }





function TDaoCategoria.buscar(obeto: TCategoria;
  usuario: TUsuarioComToken): TCategoria;
begin

end;



function TDaoCategoria.Carregar(objeto:TCategoria;usuario:TUsuarioComToken): TCategoria;
var
jsonObj:TJSONObject;
 json:string;
lREsponse:IResponse;
begin
  lREsponse:= TRequest.New.BaseURL('http://192.168.1.3:8080/' ).
       AcceptCharset ('application/json').
          Resource( 'categorias/'+ objeto.IdCategoria.ToString).
  /// BasicAuthentication(usuario.funcionario.email,usuario.senha).
        // .AddHeader('Headers',usuario.token)


         DataSetAdapter(dmEventos.MentabelCategoria).Get  ;

  objeto.IdCategoria:=( dmEventos.MentabelCategoriaidCategoria.Value);

   objeto.Nomecategoria:=dmEventos.MentabelCategorianomecategoria.Value;
;
    Result:=  objeto;

end;

constructor TDaoCategoria.Create;
begin
   dmEventos:=TDataEventos.Create(nil);

end;

destructor TDaoCategoria.Destroy;
begin

  FreeAndNil(dmEventos);


  inherited;
end;

function TDaoCategoria.Excluir(pid: integer;usuario:TUsuarioComToken): string;
var Lreponse: IResponse;
begin

  Lreponse:= TRequest.New.BaseURL('http://192.168.1.3:8080/').
   Resource('categorias/'+ pid.ToString).
//    BasicAuthentication(usuario.funcionario.email,usuario.senha)
//         .AddHeader('Headers',usuario.token)
    Accept('application/json')
    .Delete;
    if Lreponse.StatusCode=204 then
    begin
      ShowMessage('excluido com sucesso!!');
    end;
    if Lreponse.StatusCode=400 then
    begin
      raise Exception.Create('Opera��o n�o permitida');
    end;




   Result:='';
end;



function TDaoCategoria.pesquisa(colecaoCategoria: TObjectList<TCategoria>;pchave,ptipo:string;usuario:TUsuarioComToken): TObjectList<TCategoria>;
  var
  categoria : TCategoria;
begin
     if Length (pchave)=0 then
        TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
     Resource( 'categorias/').
     BasicAuthentication(usuario.funcionario.email,usuario.senha)
    .AddHeader('Headers',usuario.token).
    DataSetAdapter(dmEventos.MentabelCategoria).Get
   else
     if ptipo='&C�digo'then
     TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
          Resource( 'categorias/'+pchave).
        BasicAuthentication(usuario.funcionario.email,usuario.senha)
        .AddHeader('Headers',usuario.token).
         DataSetAdapter(dmEventos.MentabelCategoria).Get
     else
     begin
         TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
      Resource( 'categorias/por-nome-comecando/?').
     BasicAuthentication(usuario.funcionario.email,usuario.senha)
         .AddHeader('Headers',usuario.token).



      AddParam('parametro',pchave)
      .DataSetAdapter(dmEventos.MentabelCategoria).Get;
     end;
    colecaoCategoria.Clear;
     dmEventos.MentabelCategoria.First;
   while not dmEventos.MentabelCategoria.Eof do
   begin
     categoria:=TCategoria.Create;
    categoria.IdCategoria:=dmEventos.MentabelCategoriaidCategoria.Value;
    categoria.Nomecategoria:=dmEventos.MentabelCategorianomecategoria.AsString;
     colecaoCategoria.Add(categoria);
     dmEventos.MentabelCategoria.Next;
    end;
   Result:=colecaoCategoria;
  end;





function TDaoCategoria.salvar(objeto: TCategoria;usuario:TUsuarioComToken): string;
var  
 jsonObj, json:TJSONObject;
 jsonstring: string;
 categoria:TCategoria;
    LResponse: IResponse;
begin
   /// json:=TJSONObject.Create;
    json := TJson.ObjectToJsonObject(objeto);
    try
     if objeto.IdCategoria=0 then
     begin

  LResponse:=  TRequest.New.BaseURL('http://192.168.1.3:8080/categorias' ).
//    BasicAuthentication(usuario.funcionario.email,usuario.senha)
//         .AddHeader('Headers',usuario.token).
  AcceptCharset ('application/json')
  .AddBody(json).Post;


    end
    else
    begin


   LResponse := TRequest.New.BaseURL('http://192.168.1.3:8080/categorias' ).
//  BasicAuthentication(usuario.funcionario.email,usuario.senha)
//         .AddHeader('Headers',usuario.token).
  AcceptCharset ('application/json')
  .AddBody(json).Put;
    end;


       if LResponse.StatusCode=201  then
  begin
  ShowMessage('salvo com sucesso'+ LResponse.StatusCode.ToString);
  end;
  if (LResponse.StatusCode=200) and (objeto.IdCategoria>0 )then
  begin
     ShowMessage('Editado com sucesso.');
  end;
  if LResponse.StatusCode=400 then
   begin
      raise Exception.Create('registro j� existente no banco de dados');
   end;
  ///  jsonstring:=dmEventos.RESTRequestCategoria.Response.JSONValue.ToString;
//   /// ShowMessage(jsonstring);
//     jsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(LResponse.Content), 0) as TJSONObject;
//    categoria:=TJson.JsonToObject<TCategoria>(jsonObj);
//    ShowMessage(categoria.Nomecategoria);
finally
///categoria.Free;
 /// jsonObj.Free;
  ///json.Free;
end;

end;

end.
