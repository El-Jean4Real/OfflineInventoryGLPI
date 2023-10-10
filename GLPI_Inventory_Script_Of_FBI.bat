@echo off
mkdir C:\GLPI
cd /d C:\Program Files\GLPI-Agent

if errorlevel 1 (
    echo Erreur : Impossible de changer de répertoire.
) else (
    echo Bonjour FBI, je commence...
    echo Action en cours...

    glpi-inventory --json > C:\GLPI\InventaireByFBI.json
    if errorlevel 1 (
        echo Erreur : L'exécution de glpi-inventory a échoué.
    ) else (
     setlocal enabledelayedexpansion
    set "progress="
    for /l %%A in (1,1,100) do (
        set "progress=!progress=!"
        cls
        echo Progression : [!progress!] %%A%%
        timeout /t 0,8 /nobreak > nul
    )
        echo Action effectuée avec succès.
        start explorer C:\GLPI
    )
    endlocal
    pause
)
