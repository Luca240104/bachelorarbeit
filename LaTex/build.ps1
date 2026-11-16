$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    New-Item -ItemType Directory -Force -Path 'output' | Out-Null
    & pdflatex -interaction=nonstopmode -halt-on-error -synctex=1 -file-line-error -output-directory=output main.tex
    if ($LASTEXITCODE -ne 0) { throw 'Erster LaTeX-Lauf fehlgeschlagen.' }
    $taskPreviousBibInputs = $env:BIBINPUTS
    try {
        $env:BIBINPUTS = "$PSScriptRoot;$PSScriptRoot\output;$taskPreviousBibInputs;"
        & bibtex output/main
        if ($LASTEXITCODE -ne 0) { throw 'BibTeX fehlgeschlagen.' }
    } finally {
        $env:BIBINPUTS = $taskPreviousBibInputs
    }
    & pdflatex -interaction=nonstopmode -halt-on-error -synctex=1 -file-line-error -output-directory=output main.tex
    if ($LASTEXITCODE -ne 0) { throw 'Zweiter LaTeX-Lauf fehlgeschlagen.' }
    & pdflatex -interaction=nonstopmode -halt-on-error -synctex=1 -file-line-error -output-directory=output main.tex
    if ($LASTEXITCODE -ne 0) { throw 'Dritter LaTeX-Lauf fehlgeschlagen.' }
    Write-Host 'Erstellt: output/main.pdf'
} finally {
    Pop-Location
}
