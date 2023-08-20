

# install


```bash
# linux - apt
sudo apt install prometheus

# linux - tarball
cd <prometheus-dir>
wget https://github.com/prometheus/prometheus/releases/download/v*/prometheus-*.*-amd64.tar.gz
tar xvf prometheus-*.*-amd64.tar.gz

```


# start, stop, restart

```bash
# direct
cd <prometheus-dir>/prometheus-*.*
./prometheus --config.file=./prometheus.yml


# as service
sudo systemctl restart prometheus


# using docker
todo
```

# concepts

```bash
job

instance


label


```

# metrics format

```bash
 # TYPE some_metric counter
  some_metric{label="val1"} 42
  # TYPE another_metric gauge
  # HELP another_metric Just an example.
  another_metric 2398.283
```



# pushgateway

```bash
# push single sample to {job="some_job"}
echo "some_metric 3.14" | curl --data-binary @- http://pushgateway.example.org:9091/metrics/job/some_job

# push something more complex to {job="some_job",instance="some_instance"} 
 cat <<EOF | curl --data-binary @- http://pushgateway.example.org:9091/metrics/job/some_job/instance/some_instance
  # TYPE some_metric counter
  some_metric{label="val1"} 42
  # TYPE another_metric gauge
  # HELP another_metric Just an example.
  another_metric 2398.283
  EOF

# Delete all metrics in the group identified by {job="some_job",instance="some_instance"}
curl -X DELETE http://pushgateway.example.org:9091/metrics/job/some_job/instance/some_instance

# Delete all metrics in the group identified by {job="some_job"}
# NOTE: does not include some_job/some_instance -- need to understand this better
curl -X DELETE http://pushgateway.example.org:9091/metrics/job/some_job

# Delete all metrics in all groups
curl -X PUT http://pushgateway.example.org:9091/api/v1/admin/wipe


# API
/metrics/job/<JOB_NAME>{/<LABEL_NAME>/<LABEL_VALUE>}
```

