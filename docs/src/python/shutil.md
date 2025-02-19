# High-Level File Operations In Python

In Python you can use the [shutil](https://docs.python.org/3/library/shutil.html) module to perform high-level operations on files, similar to how commands run in shell.

Especially good for moving, copying, archiving and removing files and directories.

```python
import shutil # in standard library

source = "path/to/some/file.txt"
destination = "another/path/to/some/file_that_may_not_exist_yet.txt"

shutil.copy2(source, destination)

# Can move files across file systems https://stackoverflow.com/questions/42392600/oserror-errno-18-invalid-cross-device-link
shutil.move(source, destination)
```

> Documentation:
>
> - [shutil](https://docs.python.org/3/library/shutil.html)
