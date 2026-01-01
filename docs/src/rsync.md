# rsync

Copy files from source to destination - good for backups

```bash
rsync path/to/source path/to/destination
```

## Options

| Flag               | Comment                                                                          |
| ---                | ----                                                                             |
| `-a`               | for archives                                                                     |
| `--human-readable` | makes output human readable                                                      |
| `--progress`       | displays progress                                                                |
| `--delete`         | removes files from the destination directory not present in the source directory |

## Note
- Without a trailing slash on source, a file `destination/source` is created (if not present)
- With a trailing slash on source, the contents of `source` are copied into `destination` without an intermediate directory created 
[source](https://wiki.archlinux.org/title/Rsync)
