
all:
	lt-comp lr apertium-asm-eng.asm-eng.dix asm-eng.autobil.bin
	lt-comp rl apertium-asm-eng.asm-eng.dix eng-asm.autobil.bin
	lt-comp lr $(AP_SRC1)/apertium-asm.asm.dix asm-eng.automorf.bin
	lt-comp rl $(AP_SRC1)/apertium-asm.asm.dix eng-asm.autogen.bin
	lt-comp lr apertium-asm-eng.eng.dix eng-asm.automorf.bin
	lt-comp rl apertium-asm-eng.eng.dix asm-eng.autogen.bin
	lt-comp lr apertium-asm-eng.post-eng.dix asm-eng.autopgen.bin

	apertium-validate-transfer apertium-asm-eng.asm-eng.t1x
	apertium-preprocess-transfer apertium-asm-eng.asm-eng.t1x asm-eng.t1x.bin
	apertium-validate-interchunk apertium-asm-eng.asm-eng.t2x
	apertium-preprocess-transfer apertium-asm-eng.asm-eng.t2x asm-eng.t2x.bin
	apertium-validate-postchunk apertium-asm-eng.asm-eng.t3x
	apertium-preprocess-transfer apertium-asm-eng.asm-eng.t3x asm-eng.t3x.bin

	lrx-comp apertium-asm-eng.asm-eng.lrx asm-eng.autolex.bin
	cg-comp $(AP_SRC1)/apertium-asm.asm.rlx asm-eng.rlx.bin
	apertium-gen-modes modes.xml
	cp *.mode modes/
