# Test REST API Services and UI automation using Ruby, Cucumber (Gherkin), Watir and Generate HTML Reports

This repository provides a framework and example code for testing RESTful API and Web UI automation services using Ruby, Watir, HTTParty and Cucumber (Gherkin). 
The tests are designed to ensure the functionality of REST APIs and generate HTML reports to provide clear and organized test results.



## Prerequisites

Before getting started, make sure you have the following prerequisites installed:
https://www.ruby-lang.org/en/documentation/installation/

 Verify your ruby version in your system , if ruby is setup we can go straight to `Installing Depencies` section
    ```
    ruby -v
    ```

### Mac:
  
  If the system version is 3.0.0 we are good. If it is below that please follow the below steps:
  ```
  brew install rbenv
  rbenv init
  rbenv install 3.0.0
  rbenv global 3.0.0
  ruby -v
  ```

  The output should be something like this:

  ```
  ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [arm64-darwin21]
  ```

  We also need to update your **~/.bash_profile** and add the following lines:

  ```
  export PATH=$PATH:/usr/local/bin
  eval "$(rbenv init - zsh)"
  export PATH=/opt/homebrew/Cellar:$PATH
  ```

  Execute the bash profile and restart terminal to see if you still have the changes!
  
### Windows:

  Download Ruby devkit and follow the installation instruction https://rubyinstaller.org/downloads/

  Open new CMD, then run `ruby -v`

  The output should be something like this:

  ```
  ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x64-mingw-ucrt]
  ```


## Install Dependencies

Open new Terminal / command prompt and run the following commands on the project directory:

  ```
  gem install bundler
  bundle install
  ```

  This should install all the Ruby gems / dependencies.
  Or you can separately install them:

  ```
  gem 'cucumber'
  gem 'httparty'
  gem 'json-schema'
  gem 'minitest', '~> 5.20'
  ```
  Now, we should be good to start execution Localy.

## Test Execution

Open CMD / Terminal and navigate to the project directory

### Specification Execution

  ### Default

  ```
  bundle exec cucumber
  ```

  ### Execution of tests with tags:
  ```
  cucumber <folder_name>/<file_name> -t @tagName
  ```
  *Example:* cucumber features/api_users_crud.feature -t @scenario1

  ### Execution of feature:
  ```
  cucumber <folder_name>/<file_name>
  ```
  *Example:*  cucumber features/api_users_crud.feature

## HTML Reporting:

The reports are **dynamic and are generated in Cucumber Cloud** when you run your test, you the dynamic cucumber link in web browser


**Example:**
```                                          
┌──────────────────────────────────────────────────────────────────────────┐
│ View your Cucumber Report at:                                            │
│ https://reports.cucumber.io/reports/ecd22163-3b59-4879-ba0b-38f403a6e7e4 │
│                                                                          │
│ This report will self-destruct in 24h.                                   │
│ Keep reports forever: https://reports.cucumber.io/profile                │
└──────────────────────────────────────────────────────────────────────────┘
```


