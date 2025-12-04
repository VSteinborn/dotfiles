# Recursive Find and Action

Recursively find files of a specific type and perform an action.

For example, the following looks for all `jpg` files that are in `start_folder` or any sub folder, and copies them to the folder `temp`.

```bash
find start_folder -name *.jpg -exec cp {} temp/ \; # the {} is a placeholder for any file that is found via find
```
