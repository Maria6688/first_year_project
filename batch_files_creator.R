parent_path <- "/Users/Sablab/Desktop/Maria/Masters/mas_alpha_blocking"

bdf_file_paths <- list.files(parent_path, 
                             pattern = ".AEM.AR$",
                             recursive = T,
                             full.names = T)

write.table(x = bdf_file_paths,
            file = paste0(parent_path, "/mac_AEMAR_batch.txt"),quote = F,
            row.names = F,col.names = F)


appcat_file_paths<- list.files(parent_path, 
           pattern = ".app[1-9]$",
           recursive = T,
           full.names = T)
write.table(x = appcat_file_paths,
            file = paste0(parent_path, "/mac_appcat.txt"),quote = F,
            row.names = F,col.names = F)


#maybe use this in a for loop move app files
#file.copy()
