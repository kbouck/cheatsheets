



elastic common schema


purpose
to normalize event data structure across elasticsearch users - enabling better collaboration and sharing of analysis, dashboards, visualizations, etc.


# base fields

```bash
@timestamp
message
ecs.version
tags            # array of strings
labels          # flat object (of name/value pairs, non-nested)

```


# logs app fields
all fields are ecs unless otherwise noted

```bash
@timestamp
_doc                  # not ecs
container.id 
event.dataset
host.hostname
host.name
kubernetes.pod.id     # not ecs
log.file.path
message
```


# log fields
https://www.elastic.co/guide/en/ecs/current/ecs-log.html

```bash
log.file.path
log.level
log.logger
log.origin.file.name
log.origin.function
log.syslog.facility.code
log.syslog.facility.name
log.syslog.priority
log.syslog.severity.code
log.syslog.severity.name
```


# host fields
https://www.elastic.co/guide/en/ecs/current/ecs-host.html

```bash
host.architecture
host.cpu.usage
host.disk.read.bytes
host.disk.write.bytes
host.domain
host.hostname
host.id
host.ip
host.mac
host.name
host.network.egress.bytes
host.network.egrtess.packets
host.network.ingress.bytes
host.network.ingress.packets
host.type
host.uptime
```

# user fields
https://www.elastic.co/guide/en/ecs/current/ecs-user.html
```bash
user.domain
user.email
user.full_name
user.hash
user.id
user.name
user.roles
```

# file fields
ihttps://www.elastic.co/guide/en/ecs/current/ecs-file.html
```bash
file.accessed
file.attributes
file.created
file.ctime
file.device
file.directory
file.drive_letter
file.extension
file.fork_name
file.gid
file.group
file.inode
file.mime_time
file.mode
file.mtime
file.name
file.owner
file.path
file.size
file.target_path
file.type
file.uid
```

# service fields

```bash
service.address       (eg. 172.26.0.2:5432)
service.environment   (eg. prod)
service.ephemeral_id
service.id
service.name
service.node.name
service.state
service.type
service.version
```


