


# Verify CC cli is operational
sagcc list landscape nodes local -e ONLINE


# Import composite template
sagcc exec templates composite import -i template.yaml


# Verify composite template is registered in CC
sagcc list templates composite -e myTemplate


# Apply the composite template
sagcc exec templates composite apply myTemplate -i my.properties