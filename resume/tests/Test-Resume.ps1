param(
    [switch]$AllowBuildArtifacts
)

$ErrorActionPreference = 'Stop'

$resumeRoot = Split-Path -Parent $PSScriptRoot
$failures = [System.Collections.Generic.List[string]]::new()

function Assert-True {
    param(
        [bool]$Condition,
        [string]$Message
    )

    if (-not $Condition) {
        $failures.Add($Message)
    }
}

function Assert-Contains {
    param(
        [string]$Text,
        [string]$Pattern,
        [string]$Message
    )

    Assert-True ($Text -match $Pattern) $Message
}

$requiredFiles = @(
    'resume-general.tex',
    'README.md',
    'style/resume.sty',
    'content/profile.tex',
    'content/education.tex',
    'content/strengths.tex',
    'content/research.tex',
    'content/projects.tex',
    'content/honors.tex',
    'content/skills.tex',
    'content/profile-local.example.tex'
)

foreach ($relativePath in $requiredFiles) {
    $fullPath = Join-Path $resumeRoot $relativePath
    Assert-True (Test-Path -LiteralPath $fullPath -PathType Leaf) "Missing required file: $relativePath"
}

$texFiles = @(Get-ChildItem -LiteralPath $resumeRoot -Recurse -File -Filter '*.tex' -ErrorAction SilentlyContinue)
$styleFiles = @(Get-ChildItem -LiteralPath $resumeRoot -Recurse -File -Filter '*.sty' -ErrorAction SilentlyContinue)
$sourceFiles = @($texFiles + $styleFiles)
$allSource = ($sourceFiles | ForEach-Object { Get-Content -Raw -Encoding UTF8 -LiteralPath $_.FullName }) -join "`n"

# Contact details and the photo live in git-ignored files (matched by "local"),
# so every committed source file must stay free of phone numbers and emails.
$committedFiles = @($sourceFiles | Where-Object { $_.Name -notmatch 'local' })
$committedSource = ($committedFiles | ForEach-Object { Get-Content -Raw -Encoding UTF8 -LiteralPath $_.FullName }) -join "`n"

Assert-True ($committedSource -notmatch '\b1[3-9]\d{9}\b') 'A phone number appears in a committed resume source.'
Assert-True ($committedSource -notmatch '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}') 'An email address appears in a committed resume source.'

$forbiddenPatterns = @(
    '(?i)\bTODO\b',
    '(?i)\bTBD\b',
    '(?i)OpenReview',
    '(?i)MFilter',
    'Paper Title'
)

foreach ($pattern in $forbiddenPatterns) {
    Assert-True ($allSource -notmatch $pattern) "Forbidden placeholder or submission detail found: $pattern"
}

Assert-Contains $allSource '\u5F20\u5FD7\u96C4' 'Chinese name is missing.'
Assert-Contains $allSource 'Xavier' 'English name is missing.'
Assert-Contains $allSource '\u5E7F\u4E1C\u73E0\u6D77' 'Location is missing.'
Assert-Contains $allSource 'GPA[^\r\n]*3\.8/4\.0' 'GPA is missing.'
Assert-Contains $allSource '\u4E13\u4E1A\u524D[^\r\n]*5\\%' 'Top-5-percent ranking is missing or the percent sign is not escaped.'
Assert-Contains $allSource '2024[^\r\n]*\u65B0\u751F\u5168\u989D\u5956\u5B66\u91D1' 'The 2024 scholarship is missing.'
Assert-Contains $allSource '2025[^\r\n]*\u7EED\u5F97' 'The 2025 scholarship renewal is missing.'
Assert-Contains $allSource '\u7279\u5F81\u5339\u914D' 'Feature-matching research is missing.'
Assert-Contains $allSource 'ACCV 2026[^\r\n]*\u63A5\u6536' 'The ACCV 2026 acceptance is missing.'
Assert-Contains $allSource '\u5355\u6B65\u56FE\u50CF\u7F16\u8F91' 'The single-step image editing direction is missing.'
Assert-Contains $allSource 'ChordEdit' 'The ChordEdit-based research description is missing.'
Assert-Contains $allSource '\u7A0B\u6587\u97EC' 'The supervisor name is missing.'
Assert-Contains $allSource '2026[^\r\n]*\u7B2C 17 \u5C4A\u84DD\u6865\u676F[^\r\n]*\u56FD\u8D5B\u4E8C\u7B49\u5956' 'The 2026 Lanqiao national award is missing.'
Assert-Contains $allSource '2025[^\r\n]*\u7B2C 16 \u5C4A\u84DD\u6865\u676F[^\r\n]*\u7701\u4E8C\u7B49\u5956' 'The 2025 Lanqiao provincial award is missing.'
Assert-Contains $allSource '2025[^\r\n]*GDCPC[^\r\n]*\u56E2\u961F\u4E09\u7B49\u5956' 'The 2025 GDCPC team award is missing.'
Assert-Contains $allSource '2025[^\r\n]*\u5168\u56FD\u5927\u5B66\u751F\u6570\u5B66\u5EFA\u6A21\u7ADE\u8D5B[^\r\n]*\u5E7F\u4E1C\u7701\u4E8C\u7B49\u5956' 'The 2025 mathematical modeling award is missing.'

$profilePath = Join-Path $resumeRoot 'content/profile.tex'
if (Test-Path -LiteralPath $profilePath) {
    $profileSource = Get-Content -Raw -Encoding UTF8 -LiteralPath $profilePath
    foreach ($macro in @(
        'ResumeNameCN', 'ResumeNameEN', 'ResumePhone', 'ResumeEmail',
        'ResumeLocation', 'ResumeGithub', 'ResumeCSDN', 'ResumePhotoPath'
    )) {
        Assert-Contains $profileSource "\\newcommand\{\\$macro\}" "Shared profile macro is missing: \\$macro"
    }
}

$stylePath = Join-Path $resumeRoot 'style/resume.sty'
if (Test-Path -LiteralPath $stylePath) {
    $styleSource = Get-Content -Raw -Encoding UTF8 -LiteralPath $stylePath
    Assert-Contains $styleSource '\\end\{minipage\}%\s*\\par\s*\\vspace\{1pt\}' 'ResumeHeader must end its horizontal paragraph before the first section.'
}

$entryPath = Join-Path $resumeRoot 'resume-general.tex'
if (Test-Path -LiteralPath $entryPath) {
    $entrySource = Get-Content -Raw -Encoding UTF8 -LiteralPath $entryPath
    $orderedSections = @(
        'content/profile',
        'content/education',
        'content/strengths',
        'content/research',
        'content/projects',
        'content/honors',
        'content/skills'
    )
    $lastIndex = -1
    foreach ($section in $orderedSections) {
        $needle = "\input{$section}"
        $currentIndex = $entrySource.IndexOf($needle, [System.StringComparison]::Ordinal)
        Assert-True ($currentIndex -ge 0) "Entry point does not include $section."
        Assert-True ($currentIndex -gt $lastIndex) "Section order is incorrect near $section."
        $lastIndex = $currentIndex
    }

    $inputMatches = [regex]::Matches($entrySource, '\\input\{([^}]+)\}')
    foreach ($match in $inputMatches) {
        $relativeInput = $match.Groups[1].Value
        if (-not [System.IO.Path]::HasExtension($relativeInput)) {
            $relativeInput += '.tex'
        }
        # Local-only inputs are optional by design and absent from a fresh checkout.
        if ($relativeInput -match 'local') {
            continue
        }
        Assert-True (Test-Path -LiteralPath (Join-Path $resumeRoot $relativeInput) -PathType Leaf) "Broken input path: $relativeInput"
    }
}

foreach ($sourceFile in $sourceFiles) {
    $source = Get-Content -Raw -Encoding UTF8 -LiteralPath $sourceFile.FullName
    $openBraces = ([regex]::Matches($source, '(?<!\\)\{')).Count
    $closeBraces = ([regex]::Matches($source, '(?<!\\)\}')).Count
    Assert-True ($openBraces -eq $closeBraces) "Unbalanced braces in $($sourceFile.FullName)."
}

$photoPath = Join-Path $resumeRoot 'assets/profile-local.jpg'
if (Test-Path -LiteralPath $photoPath -PathType Leaf) {
    Add-Type -AssemblyName System.Drawing
    $photo = [System.Drawing.Image]::FromFile($photoPath)
    try {
        $ratio = $photo.Width / $photo.Height
        Assert-True ($ratio -ge 0.72 -and $ratio -le 0.82) "Photo aspect ratio must remain a portrait headshot close to 3:4; actual ratio is $ratio."
    }
    finally {
        $photo.Dispose()
    }
}

$buildArtifacts = @(Get-ChildItem -LiteralPath $resumeRoot -Recurse -File -ErrorAction SilentlyContinue | Where-Object {
    $_.Name -match '\.(pdf|aux|log|out|toc|synctex\.gz|fls|fdb_latexmk)$'
})
if (-not $AllowBuildArtifacts) {
    Assert-True ($buildArtifacts.Count -eq 0) 'LaTeX build artifacts were generated even though compilation is out of scope.'
}

if ($failures.Count -gt 0) {
    Write-Host "Resume static checks failed ($($failures.Count)):" -ForegroundColor Red
    $failures | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
    exit 1
}

$artifactSummary = if ($AllowBuildArtifacts) {
    "$($buildArtifacts.Count) allowed build artifacts"
}
else {
    '0 build artifacts'
}
Write-Host "Resume static checks passed: $($requiredFiles.Count) required files, $($sourceFiles.Count) source files, 0 forbidden details, $artifactSummary." -ForegroundColor Green
