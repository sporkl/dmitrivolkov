\version "2.24.3"

\score {

<<
  \new Staff {
    \set Staff.measureBarType = ""
    \tempo 4 = 45
    \scaleDurations 100/45 {a'4 b'4 c''4 e''4 \bar "|"}
    \tempo 4 = 90
    \scaleDurations 100/90 { d''4 c''4 b'4 a'4 \bar "|" }
  }
  \new Staff {
    \set Staff.measureBarType = ""
    \tempo 4 = 60
    \scaleDurations 100/60 {
      a'4 b'4 c''4 e''4 \bar "|"
      d''4 c''4 b'4 a'4 \bar "|"
    }
  }
>>

	\layout {
		\enablePolymeter
		\context {
			\Score
			forbidBreakBetweenBarLines = ##f
			\remove Metronome_mark_engraver
		}
		\context {
			\Voice
			\consists Metronome_mark_engraver
			\remove Forbid_line_break_engraver
		}
	}

	\midi {
		\context {
			\Score
			\remove Tempo_performer
			\remove Time_signature_performer
		}
	}
}
