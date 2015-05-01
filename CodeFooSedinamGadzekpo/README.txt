Video: My intro video has been named ‘CodeFooIntro.mp4’ and can be found in this directory.

747: My response to the question ‘How many ping-pong balls can you fit in 747?’ is a text file labeled ‘747PingPongBalls.txt’

Code: I wrote the entire project in Objective-C via Xcode 5.1.1 Opening the file ‘CodeFoo.xcodeproj’ will open the entire project. On running the project, the word search results will print out and the iOS Simulator will run an tab view app showing most recent articles and video via the API provided.

Word search: The main code for the word search can be found in ‘main.m’ in the ‘CodeFoo’ folder. It begins by scanning the text file and separating it into 2 parts: the grid and the words to be found. Then it loops through the search list and compares the first letter of the word with every letter in the grid. It does this 8 times based on the 8 directions of a word search. Once a match is found, it scans the rest of the letters in that direction and compares it with the rest of the word. If there is a match, it prints out the starting position of the word and the direction it was found in.

Article and video API: I used a tab view for this so the code for articles and videos is split into 2 parts: the article code can be found in ‘abcFirstViewController.m’ and the video code can be found in ‘abcSecondViewController.m’. The codes for both parts is relatively similar:using the iOS table view and a custom table cell for each element, I loaded the first 20 articles (or videos) via the API and stored them in an NSDictionary. I then scraped the data and updated the table cell to show each element (articles show the article name and videos show the video title and video duration).



Thank you for your consideration.