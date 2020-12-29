unit SistemaGestao.Model.DaoFormdePagamento;

interface
        uses SistemaGestao.Model.IterfaceDao,System.Generics.Collections,
        SistemaGestao.Model.DmConexaoEventos, SistemaGestao.Model.EntidadeUsuarioComToken,
        System.JSON,REST.Json, System.SysUtils,Vcl.Dialogs,REST.Types,
        SistemaGestao.Model.EntidadeFormadePagamento, RESTRequest4D.Request,
        RESTRequest4D.Response;
        type TDaoFormadePagmanto = class(TInterfacedObject,Idao<TFormadePagamento>)
             private
               { private declarations }
             protected
               dm:TDataEventos;
             public
               { public declarations }

             published
                function salvar (objeto:TFormadePagamento;usuario:TUsuarioComToken):string;
         function Carregar(objeto: TFormadePagamento;usuario:TUsuarioComToken): TFormadePagamento;
         function Excluir (pid:integer;usuario:TUsuarioComToken):string;
         function pesquisa(colecaoforma: TObjectList<TFormadePagamento>;pchave,ptipo:string ;usuario:TUsuarioComToken): TObjectList<TFormadePagamento>;
          constructor Create;
         destructor Destroy;override;
            function buscar(objeto:TFormadePagamento;usuario:TUsuarioComToken):TFormadePagamento;
             end;
implementation

{ TDaoFormadePagmanto }





function TDaoFormadePagmanto.buscar(objeto: TFormadePagamento;
  usuario: TUsuarioComToken): TFormadePagamento;
begin

end;

function TDaoFormadePagmanto.Carregar(
  objeto: TFormadePagamento;usuario:TUsuarioComToken): TFormadePagamento;
begin
    TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
          Resource( 'formas-de-pagamento/'+objeto.Idformapagamento.ToString).
        BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddHeader('Headers',usuario.token).
    DataSetAdapter(dm.FDMemTableFormadePagamento).Get;
     objeto.Idformapagamento:=StrToInt( dm.FDMemTableFormadePagamentoidformapagamento.Value);
     objeto.Nomeforma:=dm.FDMemTableFormadePagamentonomeforma.Value;
    Result:=  objeto;
end;

constructor TDaoFormadePagmanto.Create;
begin
  dm:=TDataEventos.Create(nil);
end;

destructor TDaoFormadePagmanto.Destroy;
begin
  dm.Free;
  inherited;
end;

function TDaoFormadePagmanto.Excluir(pid: integer;usuario:TUsuarioComToken): string;
begin

end;

function TDaoFormadePagmanto.pesquisa(
  colecaoforma: TObjectList<TFormadePagamento>; pchave,
  ptipo: string;usuario:TUsuarioComToken): TObjectList<TFormadePagamento>;
  var formdePagamento: TFormadePagamento;
begin
 if Length (pchave)=0 then
        TRequest.New.BaseURL('http://192.168.1.3:8080/' )
        .AcceptCharset ('application/json').
     Resource( 'formas-de-pagamento/').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddHeader('Headers',usuario.token).
    DataSetAdapter(dm.FDMemTableFormadePagamento).Get
   else
     if ptipo='&C�digo'then
     TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
          Resource( 'formas-de-pagamento/'+pchave).
        BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddHeader('Headers',usuario.token).
    DataSetAdapter(dm.FDMemTableFormadePagamento).Get
     else
     begin
         TRequest.New.BaseURL('http://192.168.1.3:8080/' ).AcceptCharset ('application/json').
      Resource( 'formas-de-pagamento/por-nome-comecando/?').
      BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddHeader('Headers',usuario.token).
      AddParam('parametro',pchave).
      DataSetAdapter(dm.FDMemTableFormadePagamento).Get
     end;

    colecaoforma.Clear;

     dm.FDMemTableFormadePagamento.First;
 while not dm.FDMemTableFormadePagamento.Eof do
 begin
   formdePagamento:=TFormadePagamento.Create;
  formdePagamento.Idformapagamento:=StrToInt( dm.FDMemTableFormadePagamentoidformapagamento.Value);
  formdePagamento.Nomeforma:=dm.FDMemTableFormadePagamentonomeforma.Value;
     colecaoforma.Add(formdePagamento);

    dm.FDMemTableFormadePagamento.Next;
  end;

  Result:=colecaoforma;

  end;


function TDaoFormadePagmanto.salvar(objeto: TFormadePagamento;usuario:TUsuarioComToken): string;
begin

end;



end.
