

# パッケージの読み込み --------------------------------------------------------------
require(tidyverse)
require(ggplot2)



# ディレクトリの設定 ---------------------------------------------------------
setwd("/Users/Yuki/stats2")


# データの読み込み ----------------------------------------------------------------
# csvを読み込み，seedというオブジェクト名を付ける
seed = read.csv("data_text2.csv", fileEncoding = "CP932")



# seedの中身を表示させてみよう ----------------------------------------------------------------
head(seed)
tail(seed)
seed



# 基本統計量の算出 ----------------------------------------------------------------
# 要約統計量の計算はsummary()
summary(seed)
mean(seed$x)


# 種子数と体長の関係を散布図で表す -------------------------------------------------------------------------
g = ggplot(data = seed, aes(x = x, y = y))
p = geom_point()
labs = labs(x = "Body size", y = "Seed")
g+p+labs+theme_bw()



# 肥料の有無に分けて，箱ひげ図を作成する ------------------------------------------------------
g = ggplot(data = seed, aes(x = f, y = y))
b = geom_boxplot()
labs = labs(x = "肥料", y = "Seed")
g+b+labs+theme_gray(base_family = "HiraKakuPro-W3")



# モデル1を推定する -------------------------------------------------------------
fit1 = glm(y ~ x, data = seed, family = poisson(link = "log"))
summary(fit1)

# 最大対数尤度
logLik(fit1)



# モデル2を推定する -------------------------------------------------------------
fit2 = glm(y ~ f, data = seed, family = poisson(link = "log"))
summary(fit2)
logLik(fit2)


# モデル3を推定する ------------------------------------------------------
fit3 = glm(y ~ x + f, data = seed, family = poisson(link = "log"))
summary(fit3)
logLik(fit3)
