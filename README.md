---
tags: oo, static html generator, hierarchical class interactions, passing around objects
languages: ruby, html
resources: 4
---

# OO-Neopets

## Contents

## Contents

|Picture                                |Section                                |
|---------------------------------------|---------------------------------------|
|![cat reading](public/img/readme-images/cat-reading.jpg)                                        |[Background](#background)              |
|                                       |[Objectives](#objectives)              |
|                                       |[Overview](#overview)                  |
|                                       |[File Structure](#file-structure)      |
|                                       |[Instructions](#instructions)          |
|                                       |[Resources](#resources)                |

## Background

Before we cover the topic of web frameworks, like Sinatra and Rails, we introduce the idea of [ERB](http://www.rrn.dk/rubys-erb-templating-system), or "Embedded Ruby." ERB is an easy way to get Ruby to use templates, usually written in HTML, to create web pages. This lab is a pre-ERB lab in that it uses Ruby to generate HTML files without the benefit of ERB.

Hopefully upon the completion of this lab, you will:
  * feel comfortable getting objects to interact with each other
  * understand why ERB is so useful

## Objectives

You're going to be making a rudimentary version of [Neopets](http://www.neopets.com/) using object oriented Ruby. In the final section of this lab, you will be creating an HTML file using Ruby.

## Overview

#### Models

On [neopets.com](http://www.neopets.com/), there are users, items, and neopets:
* Items are of the simplest class and just have a type.
* Users have have a name, neopoints (the Neopia version of currency), neopets, and items.
* Like users, neopets also can have items. In addition, they have a name, a species, strength, defence, movement, and a mood.

#### Methods

Some basic things that users can do on [neopets.com](http://www.neopets.com/) are buy pets, buy items, sell pets, feed pets, and give items to pets (kinda like giving them presents).

They can also read to their pets, submit items for auction, etc. but we'll just be focusing on the five methods above.

#### HTML Generator

Once all these methods are built out, you'll make a method in the user class that will generate an HTML file to display the user's "account" (an HTML dashboard, so to speak). For instance, that HTML file could look like this:

![example html file](/public/img/readme-images/example-html-page.png)

To see the basic HTML structure that went into creating the above 'profile', take a look at [example.html](/views/readme_example/example.html) in the `views/readme_example` folder.

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

It will be helpful to be familiar with this structure as your Neopet class will select a random species for a new neopet using the file names in the folder `public/img/neopets/`. 

Along the same lines, your Item class will select a random type from the file names in the `public/img/items` folder.

Furthermore, your User class will have a method, `make_index_page`, that will generate an HTML file and save it to the `views/users/` folder.

## Instructions

This is a test-driven lab and tests are written in order of increasing difficulty. Therefore, we suggest that you tackle them in order.

If you get stuck, be sure to refer to the curated resources below. If still stuck, feel free to:
 * google to your heart's content
 * ask a classmate
 * ask an instructor

## Resources
* [Stack Overflow](http://stackoverflow.com/) - [Get names of all files from a folder with Ruby](http://stackoverflow.com/a/1755713)
* [Stack Overflow](http://stackoverflow.com/) - [Writing to a file in Ruby](http://stackoverflow.com/a/7915881)
* [Ruby Monk](http://rubymonk.com/)- [Using the File Class](http://rubymonk.com/learning/books/1-ruby-primer/chapters/42-introduction-to-i-o/lessons/90-using-the-file-class)
* [DaniWeb - Ruby](https://www.daniweb.com/web-development/ruby/) - [Create Html Files Using Ruby](https://www.daniweb.com/web-development/ruby/threads/236062/create-html-files-using-ruby)
* [Rasmus Roon Nielsen's Blog](http://www.rrn.dk/) - [Ruby's ERB Templating System](http://www.rrn.dk/rubys-erb-templating-system)
