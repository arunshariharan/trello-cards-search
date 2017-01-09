# trello-cards-search
Allows search among trello lists / cards / boards and displays similarly worded cards - useful when you want to make sure you don't log a card that has already been logged by someone else

Trello has built in search, yes - but where is the fun using a ready-made solution? Also anyone who thinks GUI is better than command-line - think again. 
You can be cool, but never **this** cool.

Also, does it provide results based on similarity of the words? Nope. This one does (based on what level of similarity you wish to see - adjustable!)

Now with Colorized Output!!!! Because, why not???

## Install Instructions

1. Clone the repository
2. Navigate to the directory in terminal / command line and do a **bundle install**
3. Run the app using **ruby start_search.rb** from the directory

## Requirements

1. Ruby 2.1.x
2. RubyGems 2.2.x (Any latest RubyGems version will cause conflict with a few of the gems required)

# Development
1. Implement a few other algorithms for text similarity and matching apart from the current Levenshtein Distance calculation. 
2. Provide option for exact word matches 
