## Summary
* This application will find the most common words in a User-supplied document.
* Words are stemmed before being counted
   * Stemming is done without the use of an external library
* Stop Words can be excluded in the analysis

## Libraries / Frameworks Used
* Ruby On Rails
    * Rails Version - 5.2

## How To Run
* In the command line `$rails s` will run the application in development. 

## How To Test
* The whole suite of tests can be run by running `$rails test`

##  Solution Overview
* Most of the code is what you would expect in a basic rails CRUD app
    * The app currently only allows Creating and Reading
* Most of the Document analysis is done using two modules
    * The `Stemmer` module has two other modules
        * The `Verb` module which stems words using Verb Stemming rules
        * The `Noun` module which stems words using Noun Stemming rules
        * Within each of these modules you can easily add new stemming rules
        * You can also add the stem of specific words
    * The `Parser` module
        * This module can be given a document and will return a word count
        * To accomplish this the module removes stop words if necessary, removes non-words, sanitizes words, and uses the `Stemmer` module to stem words
* `ActiveStorage` is used to store the uploaded document
    * This allows us to easily be able to use a 3rd party service to store documents in production 
    * This also allows us to easily download documents
* `Materialize` is used to give us some quick and easy styling in the frontend
## Design/Code Decisions
### Modules
I decided to write most of the analysis work in modules instead of in one of the models or controllers because most of the work being done seems like work utility modules would do. The modules are also written in a way that they can be easily extracted an used in other applications.
### Testing
* `Minitest` was used instead of `RSpec` for the sole purpose of me trying something different
    * If this was a production-level application I would have probably used `RSpec`
* Most of the testing is on the `Parser` and `Stemmer` modules
    * This is where most of the work is being done as well as the most complex part of the application
* There are a few integration tests to cover some of the different application flows
* There are no controller or model tests at this point because the other tests were given more priority bases on the likelihood of where errors can happen in the application
    * With more time I would add these tests
### Stemming Noun and Verbs
Without diving deeper into NPL there is no real way of knowing if a word is a noun, a verb or something else. For this reason, all words are processed through both the Noun and Verb stemmer. Some of the rules are the same for both stemmers but so that the stems are not tried to be stemmed again the identical rules of one of the stemmers is commented out. For most other words even though they go through both stemmers only the rules for its type will apply.
### Error Handling
There is not much error handling on the backend at this point. The UI is designed to try to help keep you within the happy path. But there is definitely room for improvement here and what I would probably address next if I were to continue developing the app.

## TODO / Possible Improvements
* Testing
    *  Add model and controller tests
    * Improve integration tests
* Better Error Handling / Validation
    * Handling Non-Text Files
* Improve Stemming
    * Add more exceptions to stemming rules
    * Add more rules to the stemmer
    * Use an external library to help figure out the type of a word
    * Utilize external libraries to help with stemming
        * Ex. Rails Pluralization
