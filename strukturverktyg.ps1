# kommando för att skapa mappar
function Skapa-mappar { #function = själva funktionen som ska skapa mappen efter userinput.
    param (
        [string]$Namn #här skapas parametern $namn där användaren ska döpa mappen
    )

    # Här anges pathen där mappstrukturen ska skapas (först sökvägen, sedan vad hela sökvägen blir med datan som ska hämtas från användarens input)

    $basPath = "C:\Scripting_o_automatisering\inlamning_scripting_1" #Anger sökvägen där mappar + undermappar ska skapas
    $fullPath = Join-Path -Path $basPath -ChildPath $Namn #joinpath adderar "bas-path" med angiven input (mappens namn) så skapas fullständig sökväg. dvs "fullpath".

    try { #try är en funktion för felkontroll (när fel hittas hoppar koden till catch)
        
        if (Test-Path -Path $fullPath) { # OM-FUNKTIONEN! Kollar om huvudmappen finns i $fullpath (Test-path är kommandot kontrollerar)
            throw "Mappen '$fullPath' finns redan. Välj ett annat namn." #throw anger ett felmeddelande
        }

        # Skapar huvudmappen om den inte finns och vi får en godkänd fullpath.
        New-Item -ItemType Directory -Path $fullPath | Out-Null #| Out-Null funktion tar bort den automatiska tabellen som skrivs ut
        $undermappar = @("logs", "scripts", "temp") # Här namnger vi undermapparna: logs, scripts, temp till variabeln $undermappar
        foreach ($mapp in $undermappar) { #foreach läser in variabeln $undermappar och skapar under-objekten inuti för att skapa variabeln $mapp.
            New-Item -ItemType Directory -Path "$fullPath\$mapp" | Out-Null #Här skapas den fysiska mappstrukturen för variabeln $mapp. 
        }

        # Skapar loggfil i logs-mappen med dagens datum
        $datum = Get-Date -Format "yyyy-MM-dd" #här hämtas datumdata i bestämt format. (komihåg stora MM vid månad. mm=minuter)
        $loggFil = "$fullPath\logs\log-$datum.txt" #här skapas själva textfilen och filnamnet i angiven sökväg. 

        # Innehåll till loggfilen
        $loggText = "Struktur skapad: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" #här skapas den rad i textfilen som önskats enligt manus
        $loggText | Out-File -FilePath $loggFil #här sparas innehållet i den skapade filen "log-$datum.txt" ($datum blir dagens datum)

        Write-Host "Strukturen för '$Namn' skapades under '$fullPath' med undermapparna logs, scripts och temp." -ForegroundColor Green #write-host=skriv meddelande. Foregroundcolor green = färg på textmeddelandet
    }
    catch { #här kommer if-funktionens "catch" - åtgärd om nåt går snett
        # skriv ut felmeddelande
        Write-Host "Fel: $_" -ForegroundColor Yellow #foregroundcolor gul. olycksbådande och tydligt mot svart bakgrund.
    }
}

# anropar programet – Frågar användaren om input för ett namn på mappen om allt funkar som det ska
$namn = Read-Host "Ange namn på din nya mapp" #anropar parametern $namn för att usern ska ange input
Skapa-mappar -Namn $namn #anger användarens input till funktionen
