unit SistemaGestao.Model.IterfaceDaoUsuario;

interface
uses SistemaGestao.Model.Entidade.UsuarioLogar,Classes;
        type
        IDaoUsuario = interface
          ['{EA38309A-19DE-47D4-97EB-F082E570DA95}']
          function acessar(usuario: TUsuarioLogar): Integer;
         function pegatoken(ptoken:WideString):WideString;
       
        end;
implementation

end.
