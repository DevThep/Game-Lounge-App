# README

## Game Lounge App
Phornthep Sachdev (5680836) & Arun Bhusri (5680607)

### Models
User, Post, Comment, Game, Topic & Relationship

### About
We wanted to make a forum for sharing details and interests about video games. 
Users can signup and login, and we use sessions to store user id and we also have the cookie option using remember me on login.

We have a feed about the trending video games using the reddit api to get information from 
r/gaming subreddit. Some of the posts may have missing images due to the links not being an image but most of it is. This is some javascript component of our project.

Users once logged in can view and follow other users. Users can post text and image into the feed and other following users can comment on their post.

We also have a game model to include information about video games. Our goal was to have topics within a game and people can add discussion into the topics but we ran into some problems.  We planned to make a discussion session where the admin can add topics about the game and the user can come in and leave comments on that particular topic. While implementing this model, we ran into a problem where we were unable to delete the topic because of “no routes found” error. Since we were already running out of time, we had to drop the plan. 

So for now admin can add/delete games and add topics but no discussion about the topics can be made due to the missing Discuss model.

For images, we are hosting it on an Amazon S3 bucket.

### link to deployed webapp : https://stark-caverns-56318.herokuapp.com/

Models are stored in /doc -> can view it using a browser.
