# football-player-position-prediction-svm
Football players playing in different positions have different abilities. Magnitude of abilities vary widely among the players of different positions. Combinations of certain attributes can predict where a player plays in the field. Attributes are: Pace, Dribbling, Shooting, Passing, Defensive ability and Physical Strength. These attributes are the features for the algorithm.
Data of the players’ attributes is taken from Kaggle: Fifa 18 Complete Player Data Set. Data consists of 17,994 rows (Players) and 188 columns (player attributes). Support Vector Machine is used for prediction through the six player attributes considered as features. Computing is done by R programming.
Detailed positions are categorized in five classes: Striker, Midfielder, Winger, Defender and Goalkeeper. Players are then categorized in the general positions according to their best positions. This general position will be our class to predict.
Detailed positions are categorized in five classes: Striker, Midfielder, Winger, Defender and Goalkeeper. Players are then categorized in the general positions according to their best positions. This general position will be our class to predict.
All the six features: Pace, Dribbling, Shooting, Passing, Defensive ability and Physical Strength are being normalized by the overall rating of a player. Normalizing is done for treating every player with equal weight. Then the first 15,000 rows are taken as the training set. The last 2,994 rows are taken as the sample set. The normalized data is shown in the snapshot.
The overall accuracy of the model is 75%.
More accuracy can be achieved by considering more detailed attributes of the players. Also, the tuning of the players’ categorization can lead to more accurate  predictions. Overall with the little set of features, the model performed really well.
















