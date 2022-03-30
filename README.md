# README
 Welcome to RelationalRails

 This project is an exercise in a one-to-many relational database using Ruby on Rails.

 In this project, the 'parent' is a 'Ski Maker' and the 'child' is 'Skis'.  A Ski Maker has many skis, while a pair of skis only has one Ski Maker.

 The application is ran via localhost:3000.

 localhost:3000/ski_makers will bring you to the Ski Maker index page, showing all of the Ski Makers, their attributes, ordered by when they were created.  There are links to see all Skis, Add a Ski Maker, see and Ski Makers skis and more.

 localhost:3000/skis will bring you to the Skis index page, showing you all skis that are 100% symmetrical.

 Throughout the site there are links to create, edit/update, and destroy a Ski Maker or a pair of skis. And also functionality to sort a Ski Makers skis alphabetically, or to only see the skis they have over a given height in centimeters.

 The schema:
 ![](../../../../Desktop/Screen Shot 2022-03-29 at 5.09.13 PM.png)


 A link to see the visual representation of the schema used can be found here: https://app.dbdesigner.net/designer/schema/509755
