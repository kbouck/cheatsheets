



```powershell
# list USB devices (all known)
Get-PnpDevice -PresentOnly | Where-Object { $_.InstanceId -match '^USB' }

# list USB devices (presently connected)
Get-PnpDevice -PresentOnly | Where-Object { $_.InstanceId -match '^USB' }
```

