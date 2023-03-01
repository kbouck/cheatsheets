# venv / pip

```bash
python3 -m venv venv               # create virtual env named "venv" 
                                   # will create a subdir in current dir named "venv"
                            
source venv/bin/activate           # activate virtual env (use source!)
                                   # will prefix prompt with "(venv)"
                                   # will prefix $PATH with venv/bin                          
                                   # - venv/bin contains python/pip (symbolic links)
                                   # creates deactivate() function
which pip                          # show which venv is active
pip install --upgrade pip          # upgrade pip  

pip install <package>              # install pkg in activated venv (will run <venv>/bin/pip)
python -m pip install SomePackage  
python3 -c "import cv2"            # test import

# List all installed packages without versions
pip list --format=columns 2>/dev/null | cut -s -d ' ' -f 1 | tail -n +3
pip install -r requirements.txt    # Install packages listed in a text file

deactivate                         # deactivate venv (restores previous $PATH)
```

# conda

- basically pip + venv

```bash
conda list                              # list all package in current env

conda install scikit-learn              # install

conda create --name my_environment      # create new environment 
source activate my_environment          # activate

/Users/kbouck/opt/miniconda3/envs/venv  # fs location
```

