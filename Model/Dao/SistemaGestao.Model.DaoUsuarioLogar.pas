unit SistemaGestao.Model.DaoUsuarioLogar;

interface
       uses REST.Json, System.JSON,  Vcl.Dialogs, SistemaGestao.Model.EntidadeUsuarioComToken,
       REST.Client, System.StrUtils, System.SysUtils,
        Classes ,
       SistemaGestao.Model.IterfaceDaoUsuario, Vcl.StdCtrls,
       RESTRequest4D.Request,SistemaGestao.Model.Entidade.UsuarioLogar;
       type
       TDaoUsuarioLogar = class (TInterfacedObject,IDaoUsuario)
       private

       token:WideString;

       protected
          var lResponse:IResponse;

       public
         constructor Create;
         destructor Destroy; override;
         function acessar(usuario: TUsuarioLogar): Integer;
         function pegatoken(ptoken:WideString):WideString;

       published

       end;
implementation

{ TDaoUsuarioLogar }

function TDaoUsuarioLogar.acessar(usuario: TUsuarioLogar): Integer;
var json:TJSONObject;

status, i:Integer;
begin
    json:=TJson.ObjectToJsonObject(usuario);

     lResponse:=   TRequest
     .New.BaseURL('http://192.168.1.3:8080/')
   .Resource('login').
      AcceptCharset('application/json').
   AddBody(json).Post;


   Result:=lResponse.StatusCode;

end;

constructor TDaoUsuarioLogar.Create;
begin


end;

destructor TDaoUsuarioLogar.Destroy;
begin

  inherited;
end;



function TDaoUsuarioLogar.pegatoken(ptoken: WideString): WideString;
var I:Integer;
begin
  ptoken:=token;
  Result:=ptoken;
end;




end.
