CRABS
=====
A website for members of the *CRABS* leauge - Competitive Recreational Alcoholic Ball Sports

-------------------------------

## Developer setup:

**Note**: *This assumes using Python 2.7.6 on Linux, adapt as necessary*

### Basic Setup
I assume you have Python installed.

Install Pip

		$ sudo apt-get install python-pip python-dev build-essential
		$ sudo pip install --upgrade pip
		$ sudo pip install --upgrade virtualenv

Clone our Git repository

		$ git clone https://github.com/conezone/crabs.git

Create the Virtual Environment

		$ cd crabs
		$ virtualenv -p /usr/bin/python2.7 venv
		$ . venv/bin/activate

**Note**: *To leave the virtual environment, simply use* `deactivate`.

Install the required libraries

		$ pip install Flask
		$ pip install flask-restful

That should be all you need to get the project going!

-------------------------------

### TODO
Create relevant git branches
- `master` - currently in production
- `release` - release candidate, often matches master
- `develop`	- used to add new features and bug fixes
- `feature branches` - individual branches introducing new branches
