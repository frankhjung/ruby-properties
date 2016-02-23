ruby-properties
===============

A Ruby example to read and process a Java like properties file.

The `build.sh` script will prepare the gem set, update bundles and invoke
[rake](https://github.com/ruby/rake). The rake targets are:

* bundles             - Install bundles
* check               - Check project syntax with RuboCop
* check:auto_correct  - Auto-correct RuboCop offenses
* clean               - Remove any temporary products
* clobber             - Remove any generated files
* clobber_doc         - Remove RDoc HTML files
* doc                 - Build RDoc HTML files
* help                - Show help
* info                - Show bundle and Gem information
* redoc               - Rebuild RDoc HTML files
* run                 - Run script with test XML file (verbose)
* test                - Test classes

The default build target is `test`.
