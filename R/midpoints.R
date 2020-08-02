#' Formant measurements from 564 vowel midpoints
#'
#' A dataset containing formant measurements from the midpoints of 564 vowel
#' tokens. These came from generated nonce words. This dataset is relatively
#' clean and can be used for vowel formant example data.
#'
#' This dataset is a subset of the coronals dataframe. It only includes data
#' from vowel midpoints. The diphthongs PRICE, MOUTH, and CHOICE are excluded.
#' See \code{?coronals} for more information on how the dataset was prepared.
#'
#' @format A data frame with 564 rows and 12 variables:
#' \describe{
#'   \item{vowel_id}{a unique identifier for each vowel token}
#'   \item{start}{the start time for that vowel}
#'   \item{end}{the end time for that vowel}
#'   \item{t}{the time where formants were extracted}
#'   \item{F1}{the F1 measurement}
#'   \item{F2}{the F2 measurement}
#'   \item{F3}{the F3 measurement}
#'   \item{F4}{the F4 measurement}
#'   \item{word}{the generated nonce word I read}
#'   \item{pre}{the consonant(s) before the vowel (if any)}
#'   \item{vowel}{the vowel class, in Wells' Lexical Sets}
#'   \item{fol}{the consonant(s) after the vowel}
#' }
#'
"midpoints"
