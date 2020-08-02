#' Formant measurements from 81 tokens of the MOUTH vowel
#'
#' A dataset containing formant measurements from 81 tokens of the MOUTH (/aw/)
#' vowel. These came from generated nonce words. This dataset is relatively
#' clean and can be used for vowel formant example data.
#'
#' This dataset is a subset of the coronals dataframe. It only includes data
#' from the MOUTH vowel, from only F1 and F2, and reshaped into a "tall" format.
#' See \code{?coronals} for more information on how the dataset was prepared.
#'
#' @format A data frame with 2,758 rows and 12 variables:
#' \describe{
#'   \item{traj_id}{a unique identifier for each trajectory (that is, each combination of vowel_id and formant))}
#'   \item{vowel_id}{a unique identifier for each vowel token}
#'   \item{start}{the start time for that vowel}
#'   \item{end}{the end time for that vowel}
#'   \item{t}{the time where formants were extracted}
#'   \item{percent}{how far into the vowel's duration (in terms of percent of the duration) the formants were extracted. 0 = onset, 50 = midpoint, 100 = offset}
#'   \item{word}{the generated nonce word I read}
#'   \item{pre}{the consonant(s) before the vowel (if any)}
#'   \item{fol}{the consonant(s) after the vowel}
#'   \item{formant}{which formant did the data come from}
#'   \item{hz}{the formant measurements, in hz}
#' }
#'
"mouth"
