


# Partitioning
- Code must be organized into folders/packages prefixed with a heirarchical name matching the business heirarchy to which the code relates.
- eg. [Business Unit].[Application]

- Partitions




# Configuration

## Configuration Loading
- 

## Configuration key naming
- Configuration keys names must be prefixed with their heirarchy 

## Configuration storage
- Configuration must be stored in human-readable files (json, yaml)
- Configuration files must be sparated among deployment partitions.





# Security

## Zero-trust network
- 

## Firewall
- 

## SSL
- TODO:
- List disallowed SSL versions, algorithms, etc. (and why)
- List supported SSL versions, algorithms, etc.


## Inbound credential management
- Prefer certificates
- TODO - salt, etc.


## Outbound credential management
- Outbound passwords must not be stored in clear-text. Outbound passwords must be stored in a secure vault.


