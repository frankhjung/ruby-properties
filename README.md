ruby-properties
===============

Ruby - example program to read and process a propeties file.

The ''build.sh'' script will prepare the gem set, update bundles and invoke
[rake](https://github.com/ruby/rake). The rake targets are:

* rake bundles             # Install bundles
* rake check               # Check project syntax with RuboCop
* rake check:auto_correct  # Auto-correct RuboCop offenses
* rake clean               # Remove any temporary products
* rake clobber             # Remove any generated files
* rake clobber_doc         # Remove RDoc HTML files
* rake doc                 # Build RDoc HTML files
* rake help                # Show help
* rake info                # Show bundle and Gem information
* rake redoc               # Rebuild RDoc HTML files
* rake run                 # Run script with test XML file (verbose)
* rake test                # Test classes

The default build target is ''test''.
