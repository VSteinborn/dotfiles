#! /bin/bash
if [[ -z "${DOTFILEPATH}" ]]; then
  echo "ERROR: Environment variable DOTFILEPATH is unset. Please set DOTFILEPATH to the path to the dotfiles directory."
  exit 1
fi

if [[ -z "${THELIBRARYPATH}" ]]; then
  echo "ERROR: Environment variable THELIBRARYPATH is unset. Please set THELIBRARYPATH to the path to the vimwiki."
  exit 1
fi

# List configuration directories (in the current dotfiles directory)
# and destination directories (in the program/application file system)
# All the files in the listed config directories will be read.
# NOTE: Directories that are embeded in the listed directories will *not* be linked, only files.
declare -A config_dict=(
    [bash-rc]="${DOTFILEPATH}/config.d/bash-rc"
    [bash-rc-d]="${DOTFILEPATH}/config.d/bash-rc/.bashrc.d"
    [bash-profile]="${DOTFILEPATH}/config.d/bash-profile"
    [bash-profile-d]="${DOTFILEPATH}/config.d/bash-profile/.bash_profile.d"
    [nvim]="${DOTFILEPATH}/config.d/nvim"
    [nvim-config]="${DOTFILEPATH}/config.d/nvim/lua/config"
    [nvim-plugins]="${DOTFILEPATH}/config.d/nvim/lua/plugins"
    [zed-snippets]="${DOTFILEPATH}/config.d/zed/snippets"
    [newsboat]="${DOTFILEPATH}/config.d/newsboat"
    [tmux]="${DOTFILEPATH}/config.d/tmux"
)
declare -A destination_dict=(
    [bash-rc]="${HOME}"
    [bash-rc-d]="${HOME}/.bashrc.d"
    [bash-profile]="${HOME}"
    [bash-profile-d]="${HOME}/.bash_profile.d"
    [nvim]="${HOME}/.config/nvim"
    [nvim-config]="${HOME}/.config/nvim/lua/config"
    [nvim-plugins]="${HOME}/.config/nvim/lua/plugins"
    [zed-snippets]="${HOME}/.var/app/dev.zed.Zed/config/zed/snippets"
    [newsboat]="${HOME}/.newsboat"
    [tmux]="${HOME}"
)

# Test if dictionaries set properly
if [[ ${#config_dict[@]} != ${#destination_dict[@]} ]]; then
    echo "ERROR: The number of enteries in config_dict and destination_dict do not match."
    unset config_dict destination_dict
    exit 1
fi

if [[ ${!config_dict[@]} != ${!destination_dict[@]} ]]; then
    echo "ERROR: Keys do not match in config_dict and destination_dict."
    unset config_dict destination_dict
    exit 1
fi

# Set up symbolic links
for key in ${!config_dict[@]}; do # Go through each key in the config directory
    if [[ -d "${config_dict[${key}]}" ]]; then # If directory and it exists
        for rc in ${config_dict[${key}]}/* ${config_dict[${key}]}/.*; do # For each file (including hidden files) and directory in the config directory
	    if [ -a "${rc}" ] && [ ! -d "${rc}" ]; then # Files only filter (including hidden files, excluding directories)
                mkdir -p ${destination_dict[${key}]} # Make the directory path for the program/application
                ln -s ${rc} ${destination_dict[${key}]} # Link config file with path in program/application
            fi
        done
    fi
done
unset key rc config_dict destination_dict
