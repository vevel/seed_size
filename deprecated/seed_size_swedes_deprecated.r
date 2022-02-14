## swedes seed size

# rough stuff to give Arty the data

seed <- read.table("~/Work/GMI/projects/seed_size/swedes/summary_0.04-0.25_0.70-1.00_mm.txt", sep="\t", header=T, stringsAsFactors=F)

tg_ecotypeid <- matrix(unlist(strsplit(seed$Slice, "_")), ncol=3, byrow=T)[,2]

seed <- data.frame(tg_ecotypeid=tg_ecotypeid, seed)
seed <- aggregate(seed[,c(5,7,8,9)], list(seed$tg_ecotypeid), mean)
colnames(seed) <- c("tg_ecotypeid", "size", "perimeter","length", "width")

seed$tg_ecotypeid <- as.numeric(as.character(seed$tg_ecotypeid))
swe_seeds <- seed[order(seed$tg_ecotypeid),]

save(swe_seeds, file="/Users/envel.kerdaffrec/GMI/projects/seed_size/swedes/swe_seeds.RData")

