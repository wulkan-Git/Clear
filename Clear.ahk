#NoEnv
#SingleInstance, Force
FileEncoding, UTF-8

; Логгирование в файл
logFile := A_ScriptDir . "\RecycleBinCleaner.log"
logMessage := ""

try {
    ; Попытка очистки
    RunWait, PowerShell.exe -Command `"Clear-RecycleBin -Force -ErrorAction Stop`",, Hide
    logMessage := "[" . A_YYYY . "-" . A_MM . "-" . A_DD . " " . A_Hour . ":" . A_Min . ":" . A_Sec . "] Корзина успешно очищена"
}
catch {
    logMessage := "[" . A_YYYY . "-" . A_MM . "-" . A_DD . " " . A_Hour . ":" . A_Min . ":" . A_Sec . "] Ошибка: " . ErrorMessage
}

; Запись результата в лог
FileAppend, %logMessage%`n, %logFile%

; Задержка перед закрытием (опционально)
Sleep, 500
ExitApp