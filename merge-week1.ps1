param(
  [string]$Source = ".\week01"
)

function Find-Or-Create($keywords, $fallback) {
  $dirs = Get-ChildItem -Directory
  foreach ($d in $dirs) {
    $n = $d.Name.ToLower()
    foreach ($k in $keywords) { if ($n -match $k) { return $d.FullName } }
  }
  $path = Join-Path (Get-Location) $fallback
  if (-not (Test-Path $path)) { New-Item -ItemType Directory -Path $path | Out-Null }
  return $path
}

function Copy-Safe($from, $toDir, $toName) {
  if (-not (Test-Path $from)) { return }
  if (-not (Test-Path $toDir)) { New-Item -ItemType Directory -Path $toDir | Out-Null }
  $dest = Join-Path $toDir $toName
  if (Test-Path $dest) {
    $base = [System.IO.Path]::GetFileNameWithoutExtension($toName)
    $ext  = [System.IO.Path]::GetExtension($toName)
    $i = 2
    do { $cand = Join-Path $toDir ("{0}.{1}{2}" -f $base,$i,$ext); $i++ } while (Test-Path $cand)
    $dest = $cand
  }
  Copy-Item $from $dest
}

$src = Resolve-Path $Source

$setupDir = Find-Or-Create @('setup','account','onboard','bootstrap') '00-accounts-and-setup'
$gitDir   = Find-Or-Create @('(^|-)git($|-)') '01-git-basics'
$linuxDir = Find-Or-Create @('linux','unix','bash','shell') '02-linux-basics'
$netDir   = Find-Or-Create @('network') '03-networking-basics'
$resDir   = Find-Or-Create @('resource','links','reading','reference') 'links-and-resources'
$evDir    = Find-Or-Create @('evidence','proof','screenshot','artifact') 'evidence'

Copy-Safe (Join-Path $src '00-accounts-and-setup\ssh-setup-windows.md') $setupDir 'ssh-setup-windows.md'
Copy-Safe (Join-Path $src '00-accounts-and-setup\git-setup.md')           $setupDir 'git-setup.md'
Copy-Safe (Join-Path $src '00-accounts-and-setup\tools-to-install.md')     $setupDir 'tools-to-install.md'

Copy-Safe (Join-Path $src '01-git-basics\workflow.md')                     $gitDir   'workflow.md'
Copy-Safe (Join-Path $src '02-linux-basics\nav-perms.md')                  $linuxDir 'nav-perms.md'
Copy-Safe (Join-Path $src '03-networking-basics\tcpip-dns.md')             $netDir   'tcpip-dns.md'

Copy-Safe (Join-Path $src 'links-and-resources\people-and-repos.md')       $resDir   'people-and-repos.md'
Copy-Safe (Join-Path $src 'links-and-resources\learning-platforms.md')     $resDir   'learning-platforms.md'

Copy-Safe (Join-Path $src 'README.md')                                     (Get-Location) 'WEEK1-README.md'
Copy-Safe (Join-Path $src 'evidence\README.md')                            $evDir     'README.md'

git add -A
git commit -m "week01: merge new Week 1 assets into existing layout (no overwrites)"