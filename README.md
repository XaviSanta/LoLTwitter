Ggez

Xavier Santamaria - 193400
Roger Solsona - 183847
Natalia Isern - 183732
Pau Florentí - 193968

Installation:

*	Import war file or use the files provided on the master branch on Github (https://github.com/XaviSanta/LoLTwitter)
*	We were having dependency errors between us, so we decided to go with Maven. With maven installed, we simply do in the project folder:
	- mvn clean
	- mvn install
*	Now we all have the same dependencies. In the database we find preloaded tweets and users, to make it feel more real. The file is also in the project as DB.txt. You can use the provided dump or run the code inside db.txt on MySql.
*	To run the project, we find ourselves on the main controller and run it with tomcat.
*	We have a bug that causes the menu buttons to not work propperly after the login. To solve it, we will have to refresh or click the profile button. Then, it works as expected. 
*	To become admin, set to 1 the isAdmin attribute.
