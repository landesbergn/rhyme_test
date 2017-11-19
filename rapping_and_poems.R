library(glue)
library(rhymer)

eminem <- glue("

  his palms are sweaty
  knees weak arms are {(get_rhyme('sweaty', limit = 1))$word}

  there's vomit on his sweater already
  mom's {(get_rhyme('already', limit = 1))$word}

  he's nervous
  but on the surface he looks {((get_rhyme('already', limit = 3))$word)[3]}

")

shakespeare <- glue("

  When in the chronicle of wasted time
  I see descriptions of the fairest wights,
  And beauty making beautiful old {(get_rhyme('time', limit = 1))$word}
  In praise of ladies dead, and lovely {(get_rhyme('wights', limit = 1))$word},
  Then, in the blazon of sweet beauty’s best,
  Of hand, of foot, of lip, of eye, of brow,
  I see their antique pen would have {(get_rhyme('best', limit = 1))$word}
  Even such a beauty as you master {(get_rhyme('brow', limit = 1))$word}.
  So all their praises are but prophecies
  Of this our time, all you prefiguring;
  And, for they look’d but with divining {(get_rhyme('prophecy', limit = 1))$word},
  They had not skill enough your worth to {(get_rhyme('figuring', limit = 1))$word}:
  For we, which now behold these present days,
  Had eyes to wonder, but lack tongues to {(get_rhyme('days', limit = 1))$word}.

")


