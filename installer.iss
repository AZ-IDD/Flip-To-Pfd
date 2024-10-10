#define CodeFile "D:\Users\amr2\Downloads\FLIP 2 PDF Code"
#define ThankYou "https://www.flip2pdf.com/thanks.html"
#define Affid "123"
#define Subid "456"




[Setup]
AppName=FLIP 2 PDF 
AppVersion=1.0
DefaultDirName={autopf}\FLIPToPDF 
AppPublisher=Company
SetupIconFile={#CodeFile}\Resources\Logo.ico
DisableProgramGroupPage=yes
OutputDir={#CodeFile}\Installers
OutputBaseFilename=FLIPToPDF Installert
PrivilegesRequired=none
LicenseFile={#CodeFile}\Resources\license.rtf  



[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked


[Icons]
Name: "{group}\FLIP 2 PDF"; Filename: "{app}\FlipToPdf.exe"; IconFilename: "{app}\Resources\Logo.ico"
Name: "{autodesktop}\FLIP 2 PDF"; Filename: "{app}\FlipToPdf.exe"; Tasks: desktopicon; IconFilename: "{app}\Resources\Logo.ico"


[Files]
Source: "{#CodeFile}\bin\Release\net8.0-windows\FlipToPdf.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\Microsoft.Web.WebView2.Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\Microsoft.Web.WebView2.Wpf.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\FlipToPdf.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\FlipToPdf.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\FlipToPdf.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\runtimes\*"; DestDir: "{app}\runtimes"; Flags: ignoreversion recursesubdirs
Source: "{#CodeFile}\Resources\Logo.ico"; DestDir: "{app}\Resources"; Flags: ignoreversion
; This should be near the beginning, as it's extracted individually first
Source: "{#CodeFile}\bin\Release\net8.0-windows\windowsdesktop-runtime-8.0.10-win-x64.exe"; DestDir: {tmp}; Flags: ignoreversion
Source: "{#CodeFile}\bin\Release\net8.0-windows\MicrosoftEdgeWebview2Setup.exe"; DestDir: {tmp}; Flags: ignoreversion


[Code]
function NeedEdge(): Boolean;
var
  InstallPath: string;
begin
  InstallPath := 'C:\Program Files (x86)\Microsoft\EdgeWebView\Application\129.0.2792.79\msedge.exe';
  
  if FileExists(InstallPath) then
    Result := False  
  else
    Result := True;  
end;
function NeedDotNet(): Boolean;
var
  InstallPath: string;
begin
  InstallPath := 'C:\Program Files\dotnet\dotnet.exe';
  
  if FileExists(InstallPath) then
    Result := False  
  else
    Result := True;  
end;
function NextButtonClick(CurPageID: Integer): Boolean;
var
  ResultCode: Integer;
  Path, Msg: string;
begin
  if CurPageID = wpFinished then
  begin
  
      // Open the Thank You page with parameters
    Path := 'cmd';
    if Exec(Path, '/c start {#ThankYou}/?affid={#Affid}^&subid={#Subid}', '', SW_SHOW, ewNoWait, ResultCode) then
    begin
      Log('Opened Thank You page');
    end
    else
    begin
      Msg := 'Error opening Thank You page - ' + SysErrorMessage(ResultCode);
      MsgBox(Msg, mbError, MB_OK);
    end;
  
    Path := ExpandConstant('{app}\FlipToPdf.exe');
    if ExecAsOriginalUser(Path, '', '', SW_SHOW, ewNoWait, ResultCode) then
    begin
      Log('Executed MyProg');
    end
    else
    begin
      Msg := 'Error executing MyProg - ' + SysErrorMessage(ResultCode);
      MsgBox(Msg, mbError, MB_OK);
    end;


  end;
  Result := True;
end;


[Run]
Filename: "cmd"; Parameters: "/c start {tmp}\windowsdesktop-runtime-8.0.10-win-x64.exe"; Flags: waituntilterminated runhidden; Check: NeedDotNet
Filename: "cmd"; Parameters: "/c start {tmp}\MicrosoftEdgeWebview2Setup.exe"; Flags: waituntilterminated runhidden; Check: NeedEdge

