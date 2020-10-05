# generate list
n = 100
data_list <- list()
for (i in 1:n) {
  data_list[[i]] <- rnorm(10)
  names(data_list)[i] = paste0('data',i)
}

# create function to apply on the list items
plot_w_title <- function (i,data,directory) {
  # get name of list item
  data_name <- names(data_list)[i]

  # save plot with title
  pdf(file=paste0(directory,'/',data_name,'.pdf'))
  plot(data[[i]],main=data_name)
  dev.off()
}

# apply the function on the list items
system.time(
  lapply(
    seq_along(data_list),
    plot_w_title, 
    data=data_list, 
    directory='C:/Users/krose/Desktop/lapply_filename/plots'
  )
)
