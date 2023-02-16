





# print

```python

# format
print("Consumed event from topic {topic}: key = {key:12} value = {value:12}".format(topic=msg.topic(), key=msg.key().decode('utf-8'), value=msg.value().decode('utf-8')))

```



# file

```python

# read file into string
# NOTE: using with...as will close the file descriptor at end of block
with open('data.txt', 'r') as file:
    data = file.read()

```

# zip

```python
import zipfile

with zipfile.ZipFile('file.zip', 'r') as zip_ref:
    zip_ref.extractall(directory_to_extract_to)
```

