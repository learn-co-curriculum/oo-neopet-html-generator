---
tags: oo, static html generator, hierarchical class interactions, wip
languages: ruby, html
resources: 3
---

# OO-Neopets

## Contents

|Section                                |
|---------------------------------------|
|[Objectives](#objectives)              |
|[Overview](#overview)                  |
|[File Structure](#file-structure)      |
|[Resources](#resources)                |
|[Example HTML File](#example-html-file)|

## Objectives

You're going to be making a rudimentary version of [Neopets](http://www.neopets.com/).

## Overview

#### Models

On [neopets.com](http://www.neopets.com/), there are users, items, and neopets:
* Items are the simplest and just have a type.
* Users have have a name, neopoints (which are treated like currency), neopets, and items.
* Neopets also can have items, like users. They also have a name, a species, strength, defence, movement, and moods.

#### Methods

Some basic things that users can do on [neopets.com](http://www.neopets.com/) is buy more pets, buy more items, sell pets, feed pets, and give items to pets (kinda like giving them presents).

#### HTML Generator

Once all these methods are built out, you'll make a method in the user class that will generate an HTML file that will display the user's "account", so to speak. For instance, that HTML file could look like this:

![example html file](/public/img/readme-images/example-html-page.png)

## File Structure

This lab has the following structure:

```
├── README.md
├── lib
│   ├── models
│   │   ├── item.rb
│   │   ├── neopet.rb
│   │   └── user.rb
│   └── scrapers
│       └── don't worry about this folder but take a look if you want
├── public
│   └── img
│       ├── items
│       │   └── bunch of item jpg files
│       ├── neopets
│       │   └── bunch of neopet jpg files
│       └── readme-images
│           └── example-html-page.png
├── spec
│   ├── specs
│   └── spec_helper.rb
└── views
    ├── readme_example
    │   └── example.html
    └── users
        └── your user.rb file will create html files in this folder
```

It will be helpful to be familiar with this structure as your Neopet class will select a random species for a new neopet using the file names in public/img/neopets. 

Along the same lines, your Item class will select a random type from the file names in public/img/items.

Furthermore, your User class will have a method, `make_index_page`, that will generate an HTML file and save it to the `views/users/` folder.

## Example HTML File

For a hint about what the generated HTML could look like, see the file [example.html](/views/readme_example/example.html) in the `views/readme_example` folder.

## Resources
* [Stack Overflow](http://stackoverflow.com/) - [Get names of all files from a folder with Ruby](http://stackoverflow.com/a/1755713)
* [Stack Overflow](http://stackoverflow.com/) - [Writing to a file in Ruby](http://stackoverflow.com/a/7915881)
* [Ruby Monk](http://rubymonk.com/)- [Using the File Class](http://rubymonk.com/learning/books/1-ruby-primer/chapters/42-introduction-to-i-o/lessons/90-using-the-file-class)
* [DaniWeb - Ruby](https://www.daniweb.com/web-development/ruby/) - [Create Html Files Using Ruby](https://www.daniweb.com/web-development/ruby/threads/236062/create-html-files-using-ruby)
