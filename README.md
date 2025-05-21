# Scripting.inlamning1

Strukturverktyg.ps1 är ett funktionsprogram som skapar en mappstruktur som användaren väljer namn till. Om mappen redan finns anges felmeddelande.
Inuti huvudmappen skapas sedan 3 undermappar: logs, scripts och temp.
I mappen "logs" skapas en textfil som innehåller uppgifter om när mappstrukturen skapades.

Filformatet är .ps1 och är en vanlig textfil som innehåller ett eller flera PowerShell-kommandon.
Skriptet är gjort för PowerShell, skriven i Visual Studio Code. 
Filen öppnas i PowerShell (pwsh.exe) eller Visual Studio Code. 
För att granska koden kan den redigeras i t.ex notepad.

Det jag fann intressant med uppgiften var att få en bättre förståelse för just variabler och parametrar, att dessa skapas och lagras utan fysisk form för att sedan åberopas
och senare få sin fysiska form.
