tools/scripts/man/%.1: tools/scripts/man/%.md
	pandoc --standalone --to man -o $@ $<
