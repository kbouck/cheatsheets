



```bash
# Upgrade packages
brew update
brew upgrade

# List outdated packages
brew outdated

# Show info about the package
brew info <package>

# Show all formulaes installed on request
brew info --json=v2 --installed | jq -r '.formulae[]|select(any(.installed[]; .installed_on_request)).full_name'

# Show all casks installed
brew list --cask -1
```

