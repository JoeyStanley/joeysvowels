#' Formant measurements from 10 tokens of the MOUTH vowel
#'
#' This is a "lite" version of the \code{mouth} dataset.
#'
#' This dataset contains only five columns and and only 10 random tokens of the
#' original \code{mouth} dataset. See \code{?mouth} for more
#' information. Ultimately, this is a subset of the \code{coronals} dataset, so
#' please see \code{?coronals} for information on how the data was created.
#'
#' @format A data frame with 352 rows and 5 variables:
#' \describe{
#'   \item{traj_id}{a unique identifier for each trajectory}
#'   \item{word}{the generated nonce word I read}
#'   \item{percent}{how far into the vowel's duration (in terms of percent of the duration) the formants were extracted. 0 = onset, 50 = midpoint, 100 = offset}
#'   \item{formant}{which formant did the data come from}
#'   \item{hz}{the formant measurements, in hz}
#' }
#'
"mouth_lite"
