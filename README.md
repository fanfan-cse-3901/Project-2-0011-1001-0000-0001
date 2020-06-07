# Project 2
## Game of Set

### Roles

* Overall Project Manager: Amanda Cheng
* Coding Manager: Yifan Yao
* Testing Manager: Prachiti Garge
* Documentation Manager: Troy Stein

### Contributions

* Verification of Set: Amanda Cheng, Prachiti Garge, Kevin Dong
* Creation of Set: Troy Stein, Kevin Dong
* Main method: Yifan Yao, Amanda Cheng, Kevin Dong

1.	Set up game/break down game - Troy Stein
2.	Deal the appropriate number of cards, Check if there is at least one set - Prachiti Garge
3.	Get player input, ending turn - Amanda Cheng
4.	Giving scores, keeping track of score to identify a winner - Yifan Yao
5.	Verify the correctness of sets - Kevin Dong

* Additional functionality:

1. Table image creation: Yifan Yao
2. Timer: Amanda Cheng
3. Hint generator: Prachiti Garge
4. Computer Player: Troy Stein, Kevin Dong

* Testing:

1. Unit testing SetVerify: Kevin Dong
2. Unit Testing Hint and TableSetting: Prachiti Garge
3. Systems Testing: Troy Stein, Prachiti Garge

* Refer the ./docs/test_plan.pdf for the whole test plan.

### How to Make It Work

Please be run following commands to make the project work. Before running these command, you should make sure `ruby` is installed correctly (if you are not sure, try to run `ruby -v`): 

#### Step 1: Install Dependencies

```
# Debian/Ubuntu
$ gem install bundler
$ sudo apt-get install libmagickwand-dev
# CentOS
$ gem install bundler
$ sudo dnf install gcc ImageMagick-devel make which
# macOS
$ gem install bundler
$ brew install pkg-config imagemagick
```

#### Step 2: Install Gem Package

```
# Debian/Ubuntu/CentOS
$ bundle install
# macOS
$ sudo bundle install
```

#### :beers: Step 3: Enjoy :beers:

```
$ ruby main.rb
```
