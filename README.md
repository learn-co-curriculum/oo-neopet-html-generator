---
tags: oo, static html generator, hierarchical class interactions, wip
languages: ruby, html
resources: 2
---

# OO-Neopets

## Contents

|Section                                |
|---------------------------------------|
|[Objectives](#objectives)              |
|[File Structure](#file-structure)      |
|[Resources](#resources)                |
|[Example HTML File](example-html-file) |
## Objectives

You're going to be making a rudimentary version of [Neopets](http://www.neopets.com/).

In Neopets, there are users, items, and neopets:
* Items are the simplest and just have a type.
* Users have have a name, neopoints (which are treated like currency), neopets, and items.
* Neopets also can have items, like users. They also have a name, a species, strength, defence, movement, and moods.

Some basic things that users can do on neopets is buy more pets, buy more items, sell pets, feed pets, and give items to pets (kinda like giving them presents).

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
│   ├── 1_item_spec.rb
│   ├── 2_neopet_spec.rb
│   ├── 3_user_spec.rb
│   ├── 4_user_item_interactions_spec.rb
│   ├── 5_user_pet_interactions_spec.rb
│   ├── 6_give_present_spec.rb
│   ├── 7_html_spec.rb
│   └── spec_helper.rb
└── views
    ├── readme_example
    │   └── example.html
    └── users
        └── your user.rb file will create html files in this folder
```

## Example HTML File

For a hint about what your generated HTML could look like, see the file `example.html` in the `views/readme_example` folder.

## Resources
* [Stack Overflow](http://stackoverflow.com/) - [Writing to a file in Ruby](http://stackoverflow.com/a/7915881)
* [Ruby Monk](http://rubymonk.com/)- [Using the File Class](http://rubymonk.com/learning/books/1-ruby-primer/chapters/42-introduction-to-i-o/lessons/90-using-the-file-class)
