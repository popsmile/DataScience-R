## 2.1.1 파일 또는 URL로부터 잘 구조화된 데이터 작업하기

# 예제 2.1
# UCI 자동차 데이터 읽기

uciCar <- read.table('car.data.csv', sep=',', header=T)

# 예제 2.2
# 자동차 데이터 탐색하기

class(uciCar)
summary(uciCar)
dim(uciCar)


## 2.1.2. 덜 구조화된 데이터에 R 사용하기

# 예제 2.3
# 신용 데이터셋 적재하기

d <- read.table(paste('http://archive.ics.uci.edu/ml/',
                      'machine-learning-databases/statlog/german/german.data', sep=''),
                stringsAsFactors=F, header=F)
head(d)

# 예제 2.4
# 열 이름 정의하기

colnames(d) <- c('Status.of.existing.checking.account',
                 'Duration.in.month',
                 'Credit.history',
                 'Purpose',
                 'Credit.amount',
                 'Savings account/bonds',
                 'Present.employment.since',
                 'Installment.rate.in.percentage.of.disposable.income',
                 'Personal.status.and.sex',
                 'Other.debtors/guarantors',
                 'Present.residence.since',
                 'Property',
                 'Age.in.years',
                 'Other.installment.plans',
                 'Housing',
                 'Number.of.existing.credits.at.this.bank',
                 'Job',
                 'Number.of.people.being.liable.to.provide.maintenance.for',
                 'Telephone',
                 'foreign.worker',
                 'Good.Loan')
d$Good.Loan <- as.factor(ifelse(d$Good.Loan==1,'GoodLoan','BadLoan'))
print(d[1:3,])

# 예제 2.5
# 대출 코드 변환을 위한 map 만들기

mapping <- list(
  'A40'='car (new)',
  'A41'='car (used)',
  'A42'='furniture/equipment',
  'A43'='radio/television',
  'A44'='domestic appliances') # 56개지만 책에서는 일부만 나옴 (나머지는 NULL로 들어가더라)

# 예제 2.6
# 자동차 데이터 변환하기

for(i in 1:(dim(d))[2]) {
  if(class(d[,i])=='character') {
    d[,i] <- as.factor(as.character(mapping[d[,i]]))
  }
}
head(d)
