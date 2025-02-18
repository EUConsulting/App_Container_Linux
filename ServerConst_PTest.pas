unit ServerConst_PTest;

interface

resourcestring
  sPortInUse = '- Error: Port %s already in use';
  sPortSet = '- Port set to %s';
  sPortNotSet = '- Port could not be set';
  sServerRunning = '- The Server is already running';
  sStartingServer = '- Starting Server';
  sServerIsRunning = '- Server Running';
  sStoppingServer = '- Stopping Server';
  sServerStopped = '- Server Stopped';
  sServerNotRunning = '- The Server is not running';
  sInvalidCommand = '- Error: Invalid Command';
  sIndyVersion = '- Indy Version: ';
  sActive = '- Active: ';
  sTCPIPPort = '- TCP/IP Port: ';
  sHTTPPort = '- HTTP Port: ';
  sHTTPSPort = '- HTTPS Port: ';
  sSessionID = '- Session ID CookieName: ';
  sCommands = 'Enter a Command: ' + slineBreak +
    '   - "start" to start the server' + slineBreak +
    '   - "stop" to stop the server' + slineBreak +
    '   - "set port -h" to change the HTTP default port' + slineBreak +
    '   - "status" for Server status' + slineBreak +
    '   - "help" to show commands' + slineBreak +
    '   - "IB" Connect DB Interbase' + slineBreak +
    '   - "W_MYSQL" Connect DB MySQL Windows' + slineBreak +
    '   - "C_MYSQL" Connect DB MySQL Container' + slineBreak +
    '   - "TRACEON" Enable Trace ' + slineBreak +
    '   - "TRACEOFF" Disable Trace ' + slineBreak +
    '   - "NCON" Active Connection N. ' + slineBreak +
    '   - "DST" Enable DataSnap Compatibility ' + slineBreak +
    '   - "DSF" Disable DataSnap Compatibility ' + slineBreak +
    '   - "EXT" Enable Direct Execute  ' + slineBreak +
    '   - "EXF" Disable Direct Execute  ' + slineBreak +
    '   - "exit" to close the application'  + slineBreak +
    '   - "bye" to stop server and close the application';

const
  cArrow = '->';
  cCommandStart = 'start';
  cCommandStop = 'stop';
  cCommandStatus = 'status';
  cCommandHelp = 'help';
  cCommandSetHTTPPort = 'set port -h';
  cCommandIb = 'IB';
  cCommandMySQl = 'W_MYSQL';
  cCommandMySQl_Container = 'C_MYSQL';
  cCommandTrace_True = 'TRACEON';
  cCommandTrace_False = 'TRACEOFF';
  cCommandConn_Attive = 'NCON';
  cCommandExit = 'exit';
  cCommandbye = 'bye';
  cCommandStartFD = 'startfd';
  cCommandStopFD = 'stopfd';
  cDataSnap_True = 'DST';
  cDataSnap_False = 'DSF';
  cExecDirect_True = 'EXT';
  cExecDirect_False = 'EXF';
  cclosedss1 = 'Close dss1';
  cclosedss2 = 'Close dss2';
  cclosedss3 = 'Close dss3';
  cclosedss4 = 'Close dss4';
  cclosedss5 = 'Close dss5';
  cclosedss6 = 'Close Metodi';
  cOpendss1 = 'Open dss1';
  cOpendss2 = 'Open dss2';
  cOpendss3 = 'Open dss3';
  cOpendss4 = 'Open dss4';
  cOpendss5 = 'Open dss5';
  cOpendss6 = 'Open Metodi';
  cErrordss1 = 'Error dss1';
  cErrordss2 = 'Error dss2';
  cErrordss3 = 'Error dss3';
  cErrordss4 = 'Error dss4';
  cErrordss5 = 'Error dss5';
  cErrordss6 = 'Error Metodi';
  cErrorConn = 'Error Connection Principale';
  cErrorConn_method = 'Error Connection Metodi';
  cErrorLost = 'Error Lost Principale';
  cErrorLost_method = 'Error Lost Metodi';
  cErrorRecover = 'Error Recover Principale';
  cErrorRecover_method = 'Error Recover Metodi';
  cconn_attive = 'Active Connect';
  cDatabase_IB = 'Connect to Database Interbase';
  cDatabase_MySQL = 'Connect to Database MySql Windows';
  cDatabase_MySQL_Container = 'Connect to Database MySql Container';
  cTrace_on = 'Trace enable';
  cTrace_off = 'Trace disable';
  sConnOK = ' Connect OK';
  sConnKO = ' Connect Error';
{$SCOPEDENUMS ON}

type
  DSProtocol = (TCPIP, HTTP, HTTPS);

{$SCOPEDENUMS OFF}

implementation

end.
