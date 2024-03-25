all:
	unrar x ${irs}
	fixed-ir-wavs2plugin.sh Kalthallen KalthallenCabsIR/Kalthallen\ IRs/0*.wav
	make -C fixed-ir-Kalthallen

install:
	install -d ${out}/lib/lv2/
	cp -r fixed-ir-Kalthallen/fixed-ir-Kalthallen.lv2 ${out}/lib/lv2
