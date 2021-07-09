#' @title  View RegionPropertiesFeatures User's Guide
#' @description 
#' Finds the location of the RegionPropertiesFeatures User's Guide and optionally opens it.
#' @param view logical, should the document be opened using the default PDF document reader?
#' @details 
#' The function vignette("RegionPropertiesFeatures") will find the short RegionPropertiesFeatures Vignette which describes how to obtain the RegionPropertiesFeatures User's Guide. The User's Guide is not itself a true vignette because it is not automatically generated using \link{Sweave} during the package build process. This means that it cannot be found using vignette, hence the need for this special function.
#' If the operating system is other than Windows, then the PDF viewer used is that given by Sys.getenv("R_PDFVIEWER"). The PDF viewer can be changed using Sys.putenv(R_PDFVIEWER=).
#' @return Character string giving the file location. If view=TRUE, the PDF document reader is started and the User's Guide is opened, as a side effect.
#' @author Zhen Wei
#' @seealso \link{system}
#' @examples 
#' \dontrun{
#' # To get the location:
#' RegionPropertiesFeaturesUsersGuide(view=FALSE)
#' # To open in pdf viewer:
#' RegionPropertiesFeaturesUsersGuide()
#' }
#' @export
RegionPropertiesFeaturesUsersGuide <- function(view = TRUE){
  f <- system.file("doc", "RegionPropertiesFeaturesUsersGuide.pdf", package = "RegionPropertiesFeatures")
  if (view) {
    if (.Platform$OS.type == "windows") 
      shell.exec(f)
    else system(paste(Sys.getenv("R_PDFVIEWER"), f, "&"))
  }
  return(f)
}
