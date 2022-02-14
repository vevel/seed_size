

### Lab seed size

# I did not re analysed the seed images with FijI as it had already been done properly back in 2015. Here I am extracting the same parameters as for the field data (area, length, width, perimeter) and removing duplicated measurements (from exact sames images that were found multiple times in Vikash's directories)

library(tidyverse)


setwd("~/Work/GMI/projects/seed_size/swedes_lab")


lab <- read.table("summary_0.04-0.25_0.70-1.00_mm.txt", 
                  sep="\t", header=T, stringsAsFactors=F) %>%
  separate(Slice, c(NA, "tg_ecotypeid", NA), sep = "_", remove = F) %>%
  arrange(as.numeric(tg_ecotypeid))


# look for accessions that have been measured more than once. Some measurements are duplicated and should be removed.

acc <- split(lab, lab$tg_ecotypeid)
l <- lapply(acc, nrow) > 1
acc_dup <- acc[l]

# after manual inspection of the pictures, I identified the reps that should be removed

to_rem <- c("1363_2", "1366_2", "1404_2", "1585_2", "5831_1", "5835_2",
            "5836_2", "5856_2", "6127_3", "6142_2", "6142_5", "6144_3",
            "6146_3", "6147_3", "6240_2", "6240_3", "6255_2", "6964_2",
            "6965_2", "6974_2", "6974_3", "8283_3", "8423_2", "8427_2",
            "9057_3", "9353_3", "9382_2", "9383_2", "9390_2", "9392_4",
            "9399_2", "9411_2", "9427_2", "9437_2", "9437_4", "9450_3")


lab_clean <- lab %>%
  filter(!grepl(paste(to_rem, collapse = "|"), Slice)) %>%
  group_by(tg_ecotypeid) %>%
  summarise(size = mean(Average.Size),
            perimeter = mean(Perim.),
            length = mean(Major),
            width = mean(Minor))  %>%
  arrange(as.numeric(tg_ecotypeid))

write.csv(lab_clean, file="seed_size_swedes_lab_updated.csv", row.names = F)

