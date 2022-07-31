chcp 65001
REM ｢REM｣とはbatファイルのコメントアウトです｡
REM PowerShellのウィンドウを非表示にしたい場合は､下記のコメントアウトを切り替えてください｡
REM 非表示の場合､プロセスを特定して終了することが難しいため､動作確認後に非表示にしてください｡

REM PowerShellのウィンドウを最小化状態で起動する場合
start /min powershell -ExecutionPolicy Unrestricted -File VRC_AffinityChange_PS.ps1
REM PowerShellのウィンドウを非表示状態で起動する場合(プロセスの終了出来なくなるため非推奨)
REM start powershell-ExecutionPolicy Unrestricted -File VRC_AffinityChange_PS.ps1 -WindowStyle Hidden
