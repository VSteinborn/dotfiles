# dotfiles
Templates, snippets and configs.

# First Time Setup

No dependancies, Bash only.

Need to set `DOTFILEPATH` and `THELIBRARYPATH` environment variables.

- `DOTFILEPATH` is the path to the dotfiles directory
- `THELIBRARYPATH` is the path to the vimwiki library

```bash
git clone https://github.com/VSteinborn/dotfiles.git
cd dotfiles
touch config.d/bash-profile/.bash_profile.d/secret.bash_profile
echo "export DOTFILEPATH=/path/to/dotfile/directory" >> config.d/bash-profile/.bash_profile.d/secret.bash_profile
echo "export THELIBRARYPATH=/path/to/vimwiki/library" >> config.d/bash-profile/.bash_profile.d/secret.bash_profile 
```

Then run the setup script.

```bash
bash setup.sh
```
