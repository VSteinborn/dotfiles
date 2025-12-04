# dotfiles
Templates, snippets and configs.

# First Time Setup

No dependancies. 

Need to set `DOTFILEPATH` and `THELIBRARYPATH` environment variables.

```bash
git clone https://github.com/VSteinborn/dotfiles.git
cd dotfiles
touch bash_profile.d/secret.bash_profile
echo "export DOTFILEPATH=${HOME}/path/to/dotfile/directory" >> bash_profile/secret.bash_profile
echo "export THELIBRARYPATH=${HOME}/path/to/vimwiki/library" >> bash_profile/secret.bash_profile 
```

- `DOTFILEPATH` is the path to the dotfiles directory
- `THELIBRARYPATH` is the path to the vimwiki library

Then run the setup script.

```bash
bash setup.sh
```
