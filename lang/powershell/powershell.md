
# services

see os/windows/win-services


# network

see on/windows/win-net



# unix equivalents

| PowerShell (Cmdlet) | PowerShell (Alias)            | CMD.EXE / COMMAND.COM | Unix                     | Note |
| ------------------- | ----------------------------- | --------------------- | ------------------------ | ---- |
| Get-ChildItem       | gci, dir, ls                  | dir                   | ls                       |      |
| TestConnection[a]   | N/A                           | ping                  | ping                     |      |
| Get-Content         | gc, type, cat                 | type                  | cat                      |      |
| Get-Command         | gcm                           | help                  | type, which, compgen     |      |
| Get-Help            | help, man                     | help                  | apropos, man             |      |
| Clear-Host          | cls, clear                    | cls                   | clear                    |      |
| Copy-Item           | cpi, copy, cp                 | copy                  | cp                       |      |
| Move-Item           | mi, move, mv                  | move                  | mv                       |      |
| Remove-Item         | ri, del, erase, rmdir, rd, rm | del, erase, rmdir, rd | rm, rmdir                |      |
| Rename-Item         | rni, ren, mv                  | ren, rename           | mv                       |      |
| Get-Location        | gl, cd, pwd                   | cd                    | pwd                      |      |
| Pop-Location        | popd                          | popd                  | popd                     |      |
| Push-Location       | pushd                         | pushd                 | pushd                    |      |
| Set-Location        | sl, ch, chdir                 | ch, chdir             | cd                       |      |
| Tee-Object          | tee                           | n/a                   | tee                      |      |
| Write-Output        | echo, write                   | echo                  | echo                     |      |
| Get-Process         | gps, ps                       | tlist, tasklist       | ps                       |      |
| Stop-Process        | spps, kill                    | kill, taskkill        | kill[e]                  |      |
| Select-String       | sls                           | find, findstr         | grep                     |      |
| Set-Variable        | sv, set                       | set                   | env, export, set, setenv |      |
| Invoke-WebRequest   | iwr, curl, wget               | n/a                   | curl, wget               |      |



