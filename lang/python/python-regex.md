# regex

```python
import re

recaptcha_regex = re.compile(r'<input type="hidden" id="recaptcha-token" value="([^"]+)">')
match = recaptcha_regex.search(some_text)
if match is None:
    print("failed to match regex")
    return None

extracted_text = match.group(1)
```

