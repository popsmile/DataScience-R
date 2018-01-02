## 1.2.3 모델링 -----------------------

# 예제1.1
# 의사결정나무 만들기

library(rpart)
load('GCDData.RData')
model <- rpart(Good.Loan ~ 
                 Duration.in.month +
                 Installment.rate.in.percentage.of.disposable.income +
                 Credit.amount +
                 Other.installment.plans,
               data=d,
               control=rpart.control(maxdepth=4),
               method="class")
plot(model)
text(model)

## 1.2.4 모델 평가와 비평 --------------

# 예제1.2 
# 혼동 행렬(confusion matrix) 정리

resultframe <- data.frame(Good.Loan=creditdata$Good.Loan,
                          pred=predict(model, type="class"))
rtab <- table(resultframe)
rtab

sum(diag(rtab))/sum(rtab) # 모델 전체의 정확성
sum(rtab[1,1])/sum(rtab[,1]) # 모델 정밀도(실제 채무불이행 계좌에 대해 bad로 76% 예측)
sum(rtab[1,1])/sum(rtab[1,]) # 모델 재현율(모델은 채무 불이행된 계좌를 17% 찾음)
sum(rtab[2,1])/sum(rtab[2,]) # 오검출율(신용이 좋은 채무자 중 2%를 악성 채무자로 잘못 검출)


## 1.3.1 모델 성능 상하한선 결정 --------

# 예제 1.3
# 가처분소득과 대출 간의 관계

tab1
sum(diag(tab1))/sum(tab1)

tab2
sum(diag(tab2))/sum(tab2)
