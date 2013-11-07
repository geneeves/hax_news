#README

This app is a hacker news clone, built during [Epicodus Fall 2013](http://www.epicodus.com) by [Geneva Skeen](http://geneevesco.site44.com).

During the build of this project, I was working with hand coding user authentication, a polymorphic comment model, and a voting algorithm which degraded the points value of a link based on time passed since it had been posted vs the number of votes it had. 

To work the app locally: clone it, then make sure to run `rake db:create` and `rake db:schema:load` to set up the database. Start up your rails server with `rails s` and then you're ready to go.

You can try HAXNews out yourself on Heroku over [here](http://haxnews.herokuapp.com)!

Ideas for next steps:

	.Add rotating 3D animation to HAXNews logo
	
	.User profile analytics to track voted-on links and popularity of posts
	
	.Report spam links/limit uniqueness of post

