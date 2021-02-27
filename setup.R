library(data.table)
library(dplyr)

text_1 <- "With the number of species increasing, the genus was divided into the two subgenera 
Magnolia and Yulania. Magnolia contains the American evergreen species M. grandiflora,
 which is of horticultural importance, especially in the southeastern United States,
  and M. virginiana, the type species. Yulania contains several deciduous Asiatic species,
   such as M. denudata and M. kobus, which have become horticulturally important in their 
   own right and as parents in hybrids. Classified in Yulania, is also the American deciduous 
   M. acuminata (cucumber tree), which has recently attained greater status as the parent
    responsible for the yellow flower color in many new hybrids.

Relations in the family Magnoliaceae have been puzzling taxonomists for a long
 time. Because the family is quite old and has survived many geological events
  (such as ice ages, mountain formation, and continental drift), its distribution
   has become scattered. Some species or groups of species have been isolated for
    a long time, while others could stay in close contact. To create divisions in
     the family (or even within the genus Magnolia), solely based upon morphological
      characters, has proven to be a nearly impossible task.[f]"

text_2 <- "By the end of the 20th century, DNA sequencing had become available as a method of 
large-scale research on phylogenetic relationships. Several studies, including studies
 on many species in the family Magnoliaceae, were carried out to investigate relationships.[24][25][26] 
 What these studies all revealed was that genus Michelia and Magnolia subgenus Yulania 
 were far more closely allied to each other than either one of them was to Magnolia subgenus 
 Magnolia. These phylogenetic studies were supported by morphological data.[27]

As nomenclature is supposed to reflect relationships, the situation with the species
 names in Michelia and Magnolia subgenus Yulania was undesirable. Taxonomically, 
 three choices are available: 1 to join Michelia and Yulania species in a common genus, 
 not being Magnolia (for which the name Michelia has priority), 2 to raise subgenus Yulania
  to generic rank, leaving Michelia names and subgenus Magnolia names untouched, or 3 to
   join Michelia with genus Magnolia into genus Magnolia s.l. (a big genus). Magnolia 
   subgenus Magnolia cannot be renamed because it contains M. virginiana, the type species 
   of the genus and of the family. Not many Michelia species have so far become horticulturally 
   or economically important, apart for their wood. Both subgenus Magnolia and subgenus Yulania 
   include species of major horticultural importance, and a change of name would be very undesirable 
   for many people, especially in the horticultural branch. In Europe, Magnolia even is more or less 
   a synonym for Yulania, since most of the cultivated species on this continent have Magnolia (Yulania)
    denudata as one of their parents. Most taxonomists who acknowledge close relations between Yulania 
    and Michelia therefore support the third option and join Michelia with Magnolia. "

text_df <- data.table(text = c(text_1, text_2))
text_df[, nwords := length(tstrsplit(text, " ")), by = text]
text_df[, goal_nwords := round(nwords/10)]

fwrite(text_df, out_loc)s
