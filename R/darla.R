#' Vowel formants produced by DARLA and FAVE
#'
#' A dataset containing information on 3,504 vowel tokens. It is formatted
#' very nearly how FAVE outputs its spreadsheets, so it is useful for
#' demonstrating code assuming you have a FAVE-produced spreadsheet.
#'
#' To create this dataset, I first selected 300 sentences from COCA. This was
#' part of a research project and I wanted to run through the sentences I would
#' have participants read by going through them myself. The sentences were
#' chosen because they contained key words I wanted to elicit.
#'
#' It is not the cleanest dataset. I sat at my kitchen table and read the 300
#' sentences with a decent microphone, but I had a bit of sore throat, so my
#' voice was not how it normally sounded. Plus, there was an infact screaming
#' during part of the recording. For my purposes, I didn't need a particularly
#' clean dataset, so I was fine with that. This was sometime around June 2017.
#'
#' I processed the data using DARLA (\url{http://darla.dartmouth.edu}) using
#' its automatic speech recognition option. I didn't have the time to transcribe
#' the data myself, and I didn't find it necessary, really. DARLA admits that
#' its word-level transcriptions are not completely reliable, but that it does
#' do a pretty good job at at least getting the vowels correct. Comparing this
#' output to the script I read, I'd say that's about right.
#'
#' After DARLA did its automatic transcription, it sent the audio and
#' transcription to be force aligned. At the time, Prosody-Lab was used.
#'
#' Finally, DARLA sends the audio and phoneme-level transcriptions to FAVE for
#' formant extraction. The resulting dataset is very nearly the same as the one
#' that FAVE produced. The only modifications are in the first few metadata
#' columns.
#'
#' This dataset is useful for two reasons. First, I use this code in a lot of my
#' R workshops; if you have FAVE-produced data yourself, you'll be able to
#' follow along using your own data with minimal modifications to the code.
#' Second, it's a great example of noisy data, which is useful when
#' demonstrating functions that detect outliers.
#'
#' Metadata about the speaker:
#' White male, born in 1989 in suburban St. Louis where I lived  until I was
#' 18. Parents are from upstate New York and Minnesota. Lived in Utah, Brazil,
#' and Georgia as an adult. Data was recorded July 2020 (age 31).
#'
#' @format A dataframe with 3,504 rows and 43 variables. There are probably
#' better explanations of these variables elsewere on the internet, but here's
#' my description:
#' \describe{
#'   \item{name}{speaker name. Since this is just my data, it's just "joey"}
#'   \item{sex}{speaker sex. Since it's me, it's "M" for "male"}
#'   \item{vowel}{vowel, in ARPABET. Since DARLA uses the
#'   \href{http://www.speech.cs.cmu.edu/cgi-bin/cmudict}{CMU Pronouncing
#'   Dictionary}, it uses ARPABET for transcription of the vowels. This is a
#'   handy transcription system since all General American English vowels are
#'   represented using two-letter codes.}
#'   \item Other columns will be added later.
#' }
"darla"


# vowel = the vowel phoneme, transcribed in ARPABET.
# stress = primary (1), secondary (2), or unstressed (0).
# pre_word = the previous word
# word = the word that this vowel token is taken from
# fol_word = the following word
#
# Basic acoustic measurements
# F1, F2, F3 = formant measurements. They are taken at different time points along the duration of the vowel (some are one-third of the way into the duration, others are at the onset). See page. 37–38 of the attached article for details.
# F1_LobanovNored_unscaled, F2_LobanovNormed_unscaled = normalized versions of the F1 and F2 columns. Normalization is where you adjust the formant values on a by-speaker basis to remove physiological differences while also retaining sociolinguistic differences. The Lobanov method is ones such technique. (There is some debate as to whether it should be used or not, but that’s a whole nother rabbit hole I won’t take you down…)
# B1, B2, B3 = bandwidths for F1, F2, F3, measured in Hz. I’m a little foggy as to what these mean, but basically the wider the bandwidth, the less certain you are about the formants. Think of looking at a spectrogram in Praat: if the formants are very thick and black, you can’t really tell where the “true” measurements are. But if they’re narrow, you’ve got a better guess.
# t = the time (in seconds) into the recording that the F1, F2, F3 measurements were taken.
# beg, end = the beginning and end times (in seconds) of the vowel
# dur = the duration of the vowel (in seconds)
#
# Context columns. The next several columns all start with “plt” which stands for “Plotnik” a software developed and used by UPenn Linguistics that is probably now outdated (thanks, R). These are codes that have to do with the phonological categories of the previous and following segments. Makes it easy to sort by “all vowels before nasals” for example.
# plt_vlass = a different way of transcribing the vowels. These codes have some more nuance to them, i.e. “eyF” is (I believe) /e/ in an open (=“free”) syllable while “eyC” is /e/ in a closed (=“checked”) syllable. See this blog post by Joe Fruehwald (the maintainer of FAVE) for details.
# plt_manner = the manner of articulation for the following consonant
# plt_place = the place of the following consonant. I think they’re mostly straightforward, but I remember that “central” basically means /r/.
# plt_voice = the voicing of the following consonant
# plt_preseg, plt_folseg = something to do with the previous and following segments. I don’t know exactly. I’ve never used these columns but they’re part of the output we get so we keep them.
# pre_seg, fol_seg = the ARPABET transcription of the previous and following segments.
# context = basically, where in the word does the vowel appear.
# vowel_index = I guess these are numbers for each vowel phoneme? Like 1 = /æ/, 2 = /aɪ/, etc. Probably something that Plotnik uses.
# pre_word_trans, word_trans, fol_word_trans = full transcriptions of the previous, current, and following words, in ARPABET.
#
# Formant Measurements. This is really where the good stuff is. In addition to formant measurements at the determined points as outlined in the attached article, the program we use (FAVE) also takes points at 5 places along the vowel’s duration: 20% into the duration of the vowel, 35%, 50% (the midpoint), 65%, and 80%. Combined, these will give you decent information about the trajectory of the vowel if you want to go that route. If not, most people just use the midpoints. I think originally the columns were called something like “F1@20%” meaning “F1 measurement at 20% into the duration of the vowel”, but R has trouble with column names with “%” and “@“ so it converted them to “F1.20.” which is super annoying. We have unnormalized and normalized versions of each.
# F1.20., F2.20., F1.35., F2.35., F1.50., F2.50., F1.65., F2.65., F1.80., F2.80. = formant measurements.
# Same as above, with with _lob attached to the end = Lobanov-transformed versions of the previous 10 columns. Out of all the formant measurement columns this spreadsheet has, my guess is that the two you’ll want are F1.50._lob and F2.50._lob, which are normalized F1 and F2 at the midpoints. That’ll make them most comparable between speakers and midpoints are the most common thing to look at.
# Bark_height, Bark_backness = normalized versions of the midpoints (I believe) but transformed into the Bark scale.
# nFormants = a number between 3 and 6 that isn’t useful for most people but is used for diagnosing problems with formant measurements if we want to go back and pop the hood on FAVE.
#
# Metadata
# The filename where the data came from.
# State, sector, sector_name, sex, ethnicity, age, age_level, education_level, social_class, classification, kurath_type, town, county, land_region, locality, interview_year, birth_year, = metadata about the people that is mostly self-explanatory. I give some detail in the GSV if you turn on the help (the upper right corner on the plotting pages.)}
