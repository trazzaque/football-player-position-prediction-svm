library("car")
library("e1071")
#Read Dataset
Fifa18=read.csv('G:/Porashuna/Data Mining/Fifa 18 More Complete Dataset.csv')
colnames(Fifa18)
head(Fifa18)
attach(Fifa18)
#Data Cleaning
#Getting Players' Best Positions
preferedPositionValue=max.col((Fifa18[,68:93]))
preferedPositionNames=names((Fifa18[1,68:93]))
Best.Position=preferedPositionNames[preferedPositionValue]
length(Best.Position)

#Accomodating Best Positions to the Data
Fifa18$Best.Position=Best.Position
Fifa18$Best.Position[is.na(Fifa18$Best.Position)==TRUE]='GK'
Fifa18[1:5,c('name','Best.Position')]
unique(Fifa18$Best.Position)

#Categorizing Players in Their General Positions
striker=c('ls','cf','rs','st','lf','rf')
winger=c('rw','lw','lwb','rwb','rb','ram','lam','lb')
midfielder=c('rcm','cam','lcm','rm','lm','rdm','ldm','cdm','cm')
defender=c('cb','lcb','rcb')
Fifa18$General.Position=recode(Fifa18$Best.Position,"striker='Striker';
winger='Winger';
midfielder='Midfielder';
defender='Defender';else='Goalkeeper'")
Fifa18$General.Position.Int=recode(Fifa18$Best.Position,"striker=1;
winger=2;
midfielder=3;
defender=4;else=5")
Fifa18[1:5,c('name','Best.Position','General.Position')]

#Classification of Training ang Test Dataset
classificationColumns=c('name','full_name','overall','potential','pac','sho','pas','dri','def','phy','Best.Position','General.Position','General.Position.Int')
Fifa18Classify=Fifa18[,classificationColumns]
names(Fifa18Classify)
Fifa18Classify[,5:10]=Fifa18Classify[,5:10]/Fifa18Classify[,3]
trainAndTestColumns=c('pac','sho','pas','dri','def','phy','General.Position')
Fifa18Classify_train=Fifa18Classify[1:15000,trainAndTestColumns]
Fifa18Classify_test=Fifa18Classify[15000:(dim(Fifa18Classify)[1]),trainAndTestColumns]
head(Fifa18Classify_train)
head(Fifa18Classify_test)

#Training Dataset
svmFit=svm(as.factor(General.Position)~.,data=Fifa18Classify_train,svm.type='C-classification',kernel="radial",cost=5,gamma=9,scale=FALSE)
print(svmFit)

#Predict From Model
predictedResult=predict(svmFit,Fifa18Classify_test)
head(predictedResult)


#Confusion Matrix and Model Accuracy
table(Fifa18Classify_test$General.Position,as.character(predictedResult))
mean(as.character(predictedResult)==Fifa18Classify_test$General.Position)*100



tunedSvmFit=tune(svm,as.factor(General.Position)~.,data=Fifa18Classify_train,kernel="radial",ranges=list(cost=1:100,gamma=1:100))

summary(tunedSvmFit)

x=read.csv("C:/Users/Tawfique/Downloads/seattleWeather_1948-2017.csv")
head(x)
x$PRCP_bucket=0
x$PRCP_bucket=if(x$PRCP<.51 && x$PRCP>.45){paste('well')}
