# Sync dance + shop FastDL content into fastdl/ for GitHub Pages.
# Run from anywhere; push ph-loading after.
$ErrorActionPreference = "Stop"
$sources = @(
	"C:\Users\347ro\Desktop\server\garrysmod\addons\phe_hunter_dances",
	"C:\Users\347ro\Desktop\server\garrysmod\addons\phe_shesterochka",
	"C:\Users\347ro\Desktop\server\garrysmod\addons\phe_pets"
)
$fastdl = Join-Path $PSScriptRoot "fastdl"

foreach ($addon in $sources) {
	if (-not (Test-Path $addon)) {
		Write-Warning "Skip missing addon: $addon"
		continue
	}
	foreach ($sub in @("models", "sound", "materials")) {
		$src = Join-Path $addon $sub
		$dst = Join-Path $fastdl $sub
		if (-not (Test-Path $src)) {
			Write-Warning "Skip missing: $src"
			continue
		}
		New-Item -ItemType Directory -Force -Path $dst | Out-Null
		robocopy $src $dst /E /XO /NFL /NDL /NJH /NJS /nc /ns /np | Out-Null
		if ($LASTEXITCODE -ge 8) { throw "robocopy failed for $addon\$sub (exit $LASTEXITCODE)" }
		Write-Host "Synced $sub from $(Split-Path $addon -Leaf)"
	}
}
# Ensure Pages serves binaries without Jekyll filtering
New-Item -ItemType File -Force -Path (Join-Path $PSScriptRoot ".nojekyll") | Out-Null
New-Item -ItemType File -Force -Path (Join-Path $fastdl ".nojekyll") | Out-Null

$sum = Get-ChildItem $fastdl -Recurse -File | Measure-Object Length -Sum
Write-Host ("fastdl ready: {0} files, {1:N1} MB" -f $sum.Count, ($sum.Sum / 1MB))
Write-Host "Next: git add fastdl; git commit; git push"
