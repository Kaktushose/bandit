unit uspiel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

	{ TSpiel }

  TSpiel = class(TObject)
    private
      aiFelder : array[1..3] of Integer;
      iAnzahl, iGuthaben : Integer;
      procedure SetzeEinsatz;
      procedure Auswertung;
    public
      procedure NeueWerte;
      function sGibAnzeige(iIndex : Integer) : string;
      function sGibGuthaben(bGestoppt : Boolean) : string;
      function bIstBeendet : Boolean;
      function sGibAnzahl : string;
      procedure NeuesSpiel;
      constructor Create;
      destructor Destroy; reintroduce;
	end;


implementation

var
  //Zählervariable für for-Schleife
  iNr : Integer;

{ TSpiel }

procedure TSpiel.SetzeEinsatz;
begin
  //EInsatz wird vom Guthaben abgezogen. die Anzahl an Zügen entspricht dem verbleibenden Guthaben
  iGuthaben := iGuthaben -1;
  iAnzahl := iGuthaben;
end;

procedure TSpiel.Auswertung;
begin
  //Nur Wenn alle oder nur die beiden außen gleich sind, wird das Guthaben erhöht
  if (aiFelder[1] = aiFelder[2]) and (aiFelder[2] = aiFelder[3]) then
    iGuthaben := iGuthaben + 8
  else if aiFelder[1] = aiFelder[3] then
    iGuthaben := iGuthaben + 4;
end;

procedure TSpiel.NeueWerte;
begin
  //Für jedes Feld wird ein neuer Buchstabe generiert. Repräsentation über Zahlen
  for iNr := 1 to 3 do
  begin
    aiFelder[iNr] := random(3) + 1;
	end;
end;

function TSpiel.sGibAnzeige(iIndex : Integer) : string;
begin
  //Ermittlung der Buchstaben über case of für eines der 3 Felder
  case aiFelder[iIndex] of
  1: Result := 'A';
  2: Result := 'B';
  3: Result := 'C';
	end;
end;

function TSpiel.sGibGuthaben(bGestoppt : Boolean) : string;
begin
  //Wenn der Timer gestoppt ist, dann wird ausgewertet. Sonst aktuelles Guthaben zurückgeben
  if bGestoppt then
  begin
    Auswertung;
    Result := IntToStr(iGuthaben);
	end
  else
    Result := IntToStr(iGuthaben);
end;

function TSpiel.bIstBeendet : Boolean;
begin
  //Spiel ist beendet, sobald Guthaben 0 ist
  if iGuthaben = 0 then
    Result := True
  else
    Result := False;
end;

function TSpiel.sGibAnzahl : string;
begin
  //Setzt den Einsatz und gibt die Anzahl an Spielen zurück
  SetzeEinsatz;
  Result := IntToStr(iAnzahl);
end;

procedure TSpiel.NeuesSpiel;
begin
  //Guthaben und Anzahl wird zurückgesetzt
  iGuthaben := 5;
  iAnzahl := 5;
end;

constructor TSpiel.Create;
begin
  //Zufallszahlengenerator wird aufgerufen und Guthaben und Anzahl auf 5 gesetzt
  inherited Create;
  Randomize;
  iGuthaben := 5;
  iAnzahl := 5;
end;

destructor TSpiel.Destroy;
begin
  inherited Destroy;
end;

end.

