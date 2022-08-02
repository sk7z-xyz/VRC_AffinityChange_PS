$ErrorActionPreference = "Stop"

# 定数定義
$MASK = 0xFFF
# MASKに使用したいスレッドを2進数から16進数に変換した値を入れてください
#左から順に使用するスレッドを0､使用しないスレッドを1に設定
# 例 5900X 000000000000111111111111
# 2進数から16進数変換 FFF
# 16進数と識別するために0xを先頭につける
# 0xFFF


#CPU毎の推奨値(動作確認していないため値は推測)
#Ryzen シリーズ
#5950X 16スレッド選択(00000000000000001111111111111111)
#0xFFFF

#5900X 12スレッド選択(000000000000111111111111)
#0xFFF

#3950X 3800X 3700X  8スレッド選択(0000000011111111)
#0xFF

#3900X 3600X 6スレッド選択(000000111111)
#0X3F

#Intelシリーズ

#12900k(000000000000000011111111)
#0xFF

#12700K(00000000000000001111)
#0XF

#12600K(0000000000001111)
#0xF

$save_process_id = -1
$isAlreadyRuning = $false
$debugmode = $false
function timer_function()
{
    $process
    try
    {
        #プロセスが存在するかチェック
        $process = Get-Process -Name "start_protected_game"
    }
    catch
    {
        #プロセスが存在しない場合
        $script:isAlreadyRuning = $false
        if ($debugmode -eq $true)
        {
            Write-Host "Process not found"
        }
        return
    }
    if ($null -ne $process)
    {

        if ($script:save_process_id -ne $process.id)
        {
            #プロセスIDが変更された場合は再度スレッド割当を変更する
            $script:isAlreadyRuning = $false
            if ($debugmode -eq $true)
            {
                Write-Host "Process id change"
            }
        }

        if ($isAlreadyRuning -eq $false)
        {
            #VRChatが起動したらスレッド割当を変更する
            Write-Host "Process start!"
            $script:isAlreadyRuning = $true
            $script:save_process_id = $process.id
            try
            {
                $process.ProcessorAffinity = $MASK
                Write-Host "Succes AffinityChange"
            }
            catch
            {
                #MASKに設定した値が不正の場合
                Write-Host "Error AffinityChange"
            }
        }
        else
        {
            #既に変更済みの場合は何もしない
            if ($debugmode -eq $true)
            {
                Write-Host "Process already start"
            }
        }
    }
}
Write-Host "Process Scan Start"
#定期実装
while ($True)
{
    timer_function
    Start-Sleep 1
}