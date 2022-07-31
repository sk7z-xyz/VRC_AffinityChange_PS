REM ｢REM｣とはbatファイルのコメントアウトです｡
REM PowerShellのウィンドウを表示･非表示にしたい場合は､下記のコメントアウトを切り替えてください｡
REM 非表示の場合､プロセスを特定して終了することが難しいため､動作確認後に非表示にしてください｡

REM PowerShellのウィンドウを表示する場合
start powershell -ExecutionPolicy Unrestricted -File VRC_AffinityChange_PS.ps1
REM PowerShellのウィンドウを表示しない場合
REM start powershell-ExecutionPolicy Unrestricted -File VRC_AffinityChange_PS.ps1 -WindowStyle Hidden
