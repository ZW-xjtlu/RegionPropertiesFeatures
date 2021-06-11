#' @title  View RPF User's Guide
#' @description 
#' Finds the location of the RPF User's Guide and optionally opens it.
#' @param view logical, should the document be opened using the default PDF document reader?
#' @details 
#' The function vignette("RPF") will find the short RPF Vignette which describes how to obtain the RPF User's Guide. The User's Guide is not itself a true vignette because it is not automatically generated using \link{Sweave} during the package build process. This means that it cannot be found using vignette, hence the need for this special function.
#' If the operating system is other than Windows, then the PDF viewer used is that given by Sys.getenv("R_PDFVIEWER"). The PDF viewer can be changed using Sys.putenv(R_PDFVIEWER=).
#' @return Character string giving the file location. If view=TRUE, the PDF document reader is started and the User's Guide is opened, as a side effect.
#' @author Zhen Wei
#' @seealso \link{system}
#' @examples 
#' \dontrun{
#' # To get the location:
#' RPFUsersGuide(view=FALSE)
#' # To open in pdf viewer:
#' RPFUsersGuide()
#' }
#' @export
RPFUsersGuide <- function(view = TRUE){
  f <- system.file("doc", "RPFUsersGuide.pdf", package = "RPF")
  if (view) {
    if (.Platform$OS.type == "windows") 
      shell.exec(f)
    else system(paste(Sys.getenv("R_PDFVIEWER"), f, "&"))
  }
  return(f)
}
