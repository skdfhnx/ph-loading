# Sync phe_hunter_dances content into fastdl/ for GitHub Pages FastDL.
# Run from anywhere; push ph-loading after.
$ErrorActionPreference = "Stop"
$phe = "C:\Users\347ro\Desktop\server\garrysmod\addons\phe_hunter_dances"
$fastdl = Join-Path $PSScriptRoot "fastdl"

if (-not (Test-Path $phe)) { throw "Missing addon: $phe" }

foreach ($sub in @("models", "sound", "materials")) {
	$src = Join-Path $phe $sub
	$dst = Join-Path $fastdl $sub
	if (-not (Test-Path $src)) {
		Write-Warning "Skip missing: $src"
		continue
	}
	# Mirror content but keep sibling .bz2 companions if present (do not wipe whole tree).
	New-Item -ItemType Directory -Force -Path $dst | Out-Null
	robocopy $src $dst /E /XO /NFL /NDL /NJH /NJS /nc /ns /np | Out-Null
	if ($LASTEXITCODE -ge 8) { throw "robocopy failed for $sub (exit $LASTEXITCODE)" }
	Write-Host "Synced $sub"
}
# Ensure Pages serves binaries without Jekyll filtering
New-Item -ItemType File -Force -Path (Join-Path $PSScriptRoot ".nojekyll") | Out-Null
New-Item -ItemType File -Force -Path (Join-Path $fastdl ".nojekyll") | Out-Null

$sum = Get-ChildItem $fastdl -Recurse -File | Measure-Object Length -Sum
Write-Host ("fastdl ready: {0} files, {1:N1} MB" -f $sum.Count, ($sum.Sum / 1MB))
Write-Host "Next: git add fastdl; git commit; git push"
