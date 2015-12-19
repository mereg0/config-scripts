if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # ...
elif [[ "$OSTYPE" == "darwin"* ]]; then
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  chmod +rx "$DIR/OSX_setup.sh"
  source $DIR/OSX_setup.sh 
elif [[ "$OSTYPE" == "cygwin" ]]; then
  # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
  # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  # ...
else
  # Unknown.
fi
