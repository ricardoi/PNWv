wvc <- c("artichokes", "snap bean", "beets", "broccoli", "cabbage", 
         "cantaloupe", "cauliflower", "celery", "Chinese peas", "cucumber-pickle", "eggplant", 
         "garlic", "kale", "lettuce", "mustard", "onions", "green peas", 
         "peppers", "pumpkins", "radishes", "rhubarb", "spinach", "squash", "corn", 
         "tomatoes", "turnips", "watermelons", "rutabagas", "parsnips", "green lima beans",
          "asparagus")

fams <- c("Asteraceae", "Fabaceae", "Amaranthaceae", "Brassicaceae", "Brassicaceae",
          "Cucurbitaceae", "Brassicaceae", "Apiaceae", "Fabaceae", "Cucurbitaceae", "Solanaceae",
          "Amaryllidaceae", "Brassicaceae", "Asteraceae", "Brassicaceae", "Amaryllidaceae", "Fabaceae", 
          "Solanaceae", "Cucurbitaceae", "Brassicaceae", "Polygonaceae", "Amaranthaceae", "Cucurbitaceae", "Poaeceae", 
          "Solanaceae", "Brassicaceae", "Cucurbitaceae", "Brassicaceae", "Apiaceae", "Fabaceae",
          "Asparagaceae")

clade <- c("Dicots", "Dicots", "Dicots", "Dicots", "Dicots",
           "Dicots", "Dicots", "Dicots", "Dicots", "Dicots", "Dicots",
           "Dicots", "Dicots", "Dicots", "Dicots", "Dicots", "Dicots",
           "Dicots", "Dicots","Dicots","Dicots","Dicots","Dicots", "Monocots",
           "Dicots", "Dicots", "Dicots", "Dicots", "Dicots", "Dicots", 
           "Dicots")
wv <- data.frame(crops = wvc, family = fams, clade = clade)
wv

# load libraries
library(alluvial)
library(tidyverse)
library(reshape2)

head(wv)

# adding colors
RbPal <- rainbow(c(length(unique(wv$family))+2))

dat <- wv %>%
  mutate( ss = as.numeric(as.factor(wv$family)),
          so = paste(ss, crops),
          cols = RbPal[ match(ss, sort(unique(ss))) ] 
  )
# alluvla plot  

dat <- dat[order(dat$family),]

ord <- list(NULL, NULL, with(dat, order(family, crops)))



alluvial(dat[,c(3,2,5)], freq=dat$ss,
         #hide = datc$length == 0,
         col = dat$cols,
         border = dat$cols, 
         alpha = 0.7,
         blocks = FALSE,
         ordering = ord, #list(NULL, NULL, sort(as.numeric(as.factor(dat$family))))
         # change NULL to order them
         cex = 0.8
)
