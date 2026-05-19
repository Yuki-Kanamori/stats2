
load("/Users/Yuki/Downloads/kubobook_2012/distribution/data.RData")

getwd()
write.csv(data, "data_text.csv", fileEncoding = "CP932", row.names = F)
