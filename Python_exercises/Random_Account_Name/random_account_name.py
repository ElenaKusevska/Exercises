# Program to generate random account names

# Start simple. Just considering distribution of consonants and
# vowels first. And then look into including the other arrays.

# Compare which will give better results. Just distribution of letters?
# Or taking into account other rules and distribution of other morphemes :)

consonants = [b, c, d, ...]
vowels = [a, e, i, o, u ]
consosnant_digraphs = [ ch, sh, ...]
vowel_digraphs = [ay, ...]
vowel_diphtongs = [ae, ...]
common_last_name_endings = [ ]
common_word_endings = [ ]
common_prefixes = [ ]
common_separators = [ none, '-', '_', '.' ... ]
digits = [0, 1, 2, ... ]
Probably should collapse these to 2-3 arrays and look at the probability/
distribution of vowels and consonants and just put a small probability
for numbers at beginning and end ...

To find:
    distribution of word length in english language
    distribution/probability of occurence for every consonant/vowel...
    distribution of every letter
    distribution of first letter
    probability of two consonants appearing one next to the other
    combinations of consonants that can be found together (for
            example, following s, following n, ...
    probablity of occurence for last name endings and word endings...
    rules about vowels at the end of words

    sum probability of occurence for elements in each array

randomly select separator (can sometimes still use - probability 0.07 or
                                   something...)
If separator is none, then start each word with a capital letter
                                        with a probability of 0.9
n is randomly 1, 2, 3, or 4. With highest probablity for 2, and lowest
   for 4
for i = 1, n
    initialize current_word to 0
    start with consonant or random prefix
    pick random word_ending (can also be an empty string)
    m is length of word (sampled from distribution of word length)
    for j = 1, m - len(word_ending) - len(current_word)
       if mod(m,2) = 0
          get some vowel
       if mod(m,2) = 1
          get some consonant
       if some other condition ... 
          get one of the others instead


