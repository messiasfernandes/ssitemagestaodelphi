unit SistemaGestao.Model.EntidadeParcelas;

interface
uses Pkg.Json.DTO,SistemaGestao.Model.EntidadeFormadePagamento,uConcidcaoAux;
        type TParcelas = class(TJsonDTO)
             private
  private
    Fpercentual: Currency;

    Fidparcela: Integer;
    Fnumeroparcela: Integer;
    Fdia: Integer;
    FformadePagamento: TFormadePagamento;
    Ftotalpercentual: Currency;
    Fcondicaopagamento: CondicaoPagamento;


    procedure Setdia(const Value: Integer);
    procedure Setidparcela(const Value: Integer);
    procedure Setnumeroparcela(const Value: Integer);
    procedure Setpercentual(const Value: Currency);
    procedure SetformadePagamento(const Value: TFormadePagamento);
    procedure Settotalpercentual(const Value: Currency);
    procedure Setcondicaopagamento(const Value: CondicaoPagamento);


               { private declarations }
             protected
               { protected declarations }
             public
             destructor Destroy; override;
             constructor Create;
             property idparcela:Integer read Fidparcela write Setidparcela;
             property numeroparcela: Integer read Fnumeroparcela write Setnumeroparcela;
             property  percentual:Currency read Fpercentual write Setpercentual;
             property   formadePagamento : TFormadePagamento read FformadePagamento write SetformadePagamento;
             property totalpercentual  : Currency read Ftotalpercentual write Settotalpercentual;
             property dia :Integer read Fdia write Setdia;
             property condicaopagamento :  CondicaoPagamento read Fcondicaopagamento write Setcondicaopagamento;
             function  icrementaparcela: Integer;
             published
               { published declarations }
             end;
implementation

{ Parcelas }

constructor TParcelas.Create;
begin
   FformadePagamento:=TFormadePagamento.Create;
  /// condicaopagamento:=CondicaoPagamento.Create;
  ///numeroparcela:=0;
end;

destructor TParcelas.Destroy;
begin
 FformadePagamento.Free;
/// condicaopagamento.Free;
  inherited;
end;



function TParcelas.icrementaparcela: Integer;
begin
   Result:= (numeroparcela+1);
end;

procedure TParcelas.Setcondicaopagamento(const Value: CondicaoPagamento);
begin
  Fcondicaopagamento := Value;
end;

procedure TParcelas.Setdia(const Value: Integer);
begin
  Fdia := Value;
end;


procedure TParcelas.SetformadePagamento(const Value: TFormadePagamento);
begin
  FformadePagamento := Value;
end;

procedure TParcelas.Setidparcela(const Value: Integer);
begin
  Fidparcela := Value;
end;

procedure TParcelas.Setnumeroparcela(const Value: Integer);
begin
  Fnumeroparcela := Value;
end;

procedure TParcelas.Setpercentual(const Value: Currency);
begin
  Fpercentual := Value;
end;



procedure TParcelas.Settotalpercentual(const Value: Currency);
begin
  Ftotalpercentual := Value;
end;

end.
