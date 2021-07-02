$directories = Get-ChildItem -Directory

Function Create-Menu() {
    $Selection = 0
    $EnterPressed = $False
    $ItemsCount = $directories.Count - 1

    Clear-Host

    While ($EnterPressed -eq $False) {
        
        For($i=0; $i -le $ItemsCount; $i++) {

            If ($i -eq $Selection) {
                Write-Host -BackgroundColor Cyan -ForegroundColor Black "[ $($directories[$i]) ]"
            } Else {
                Write-Host "[ $($directories[$i]) ]"
            }

        }

        #$KeyInput = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        $KeyInput = [console]::ReadKey()

        Switch($KeyInput.Key) {

            Enter {
                $EnterPressed = $True;
                Return $directories[$Selection]
                Clear-Host
                break
            }

            UpArrow {
                If ($Selection -eq 0) {
                    $Selection = $ItemsCount
                } Else {
                    $Selection -= 1
                }

                Clear-Host
                break
            }

            DownArrow {
                If ($Selection -eq $ItemsCount) {
                    $Selection = 0
                } Else {
                    $Selection += 1
                }

                Clear-Host
                break
            }

            Default {

                Clear-Host

            }
        }
    }
}

$result = Create-Menu

Clear-Host

Write-Host $result