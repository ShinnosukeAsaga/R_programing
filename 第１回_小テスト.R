# パッケージのインストールと読み込み
if(!require(readxl)) install.packages("readxl")
library(readxl)
# Excelファイルの読み込み(pathは指定してください)
test <- read_excel("C:test1.xlsx")

head(test)
science <- ibm$`理科成績`
english <- ibm$`英語成績`

# 第1問：基本統計量
mean_price <- mean(science, na.rm = TRUE)
median_price <- median(science, na.rm = TRUE)
variance <- var(science, na.rm = TRUE) * (length(science) - 1) / length(science)
std_dev <- sqrt(variance)

cat("平均値:", mean_price, "\n")
cat("中央値:", median_price, "\n")
cat("標準偏差:", std_dev, "\n")

# 第2問：四分位数
q1 <- quantile(science, 0.25, na.rm = TRUE)
q3 <- quantile(science, 0.75, na.rm = TRUE)
cat("第1四分位数:", q1, "\n")
cat("第3四分位数:", q3, "\n")

# 第3問：共分散と相関係数
complete_data <- na.omit(data.frame(science, english))
n <- nrow(complete_data)
population_cov <- sample_cov * (n - 1) / n
corr_val <- cor(complete_data$science, complete_data$english)

cat("母共分散:", population_cov, "\n")
cat("相関係数:", corr_val, "\n")
