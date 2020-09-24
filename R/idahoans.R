#' Vowel formants from 11 Idahoans
#'
#' A dataset containing information on 1,100 vowel tokens produced by 10 people
#' from the state of Idaho in the United States. For each speaker, there are
#' ten tokens per canonical monophthong, randomly selected from a larger
#' dataset. Vowels are not preceding sonorants and not following coronal
#' consonants. For each token, F1, F2, F3, and F4 were extracted at the midpoint
#' of each vowel using a Praat script. The individuals consented to their data
#' being used in this way.
#'
#' This dataset is useful for testing and demonstrating vowel normalization
#' functions.
#'
#' @format A dataframe with 1,100 rows and 7 variables.
#' \describe{
#'   \item{speaker}{a unique identifier per speaker}
#'   \item{sex}{biological sex of the speakers}
#'   \item{vowel}{vowel, in ARPABET. This is a handy transcription system since
#'   all General American English vowels are represented using two-letter codes.}
#'   \item{F1, F2, F3, F4}{vowel formant measurements, in Hz}
#' }
"idahoans"
