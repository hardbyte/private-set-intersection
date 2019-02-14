
### Installing Jupyter Notebook with Julia kernel

Using pipenv. Activate the virtualenv

    python -m pipenv shell

Or for just jupyter notebook (no lab):

    using IJulia; notebook(dir=pwd())