```bash

  # Find all files modified in the last 90 minutes
print -l **/*(mm-90)
    
# Find all files and do something to each one
print -l **/*(mm-90) | xargs ls -l
  
# Find all files modified before 2 days ago
print -l **/*(m+2)
  
# Removing files older than 7 days
zargs -- **/*(m+7) -- rm
  
# Find all files modified after last 2 days
print -l **/*(m-2)
  
# Find all files modified at the last 2 day mark
print -l **/*(m2)
```

