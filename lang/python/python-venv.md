

# list

```bash
conda list                   # list all package in current env
```





# create

```bash
python3 -m venv venv        # create virtual env named "venv" 
                            # will create a subdir in current dir named "venv"
                            
# conda                            
conda create --name venv                            
```

# activate

```bash
source venv/bin/activate    # activate virtual env (use source!)
                            # will prefix prompt with "(venv)"
                            # will prefix $PATH with venv/bin                          
                            # - venv/bin contains python/pip (symbolic links)
                            # creates deactivate() function
                          
pip install --upgrade pip   # upgrade pip                          
                          
pip install ...             # will run venv/bin/pip

which pip                   # show which venv is active
```

# deactivate

```bash
deactivate                # deactivate virtual env
                          # restores previous $PATH
```



# conda

- is basically pip + venv

```bash

# new / activate
conda create --name my_environment # create new environment 
source activate my_environment     # activate

# install
conda install scikit-learn   # now you can install scikit-learn for the newly created environment 


/Users/kbouck/opt/miniconda3/envs/venv
```

