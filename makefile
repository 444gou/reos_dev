all:
	make clean
	make binary
	make floppy
	make iso
	make run

binary:src/main.asm
	nasm -fbin -o output/main.bin src/main.asm
	nasm -fbin -o output/secondary.bin src/secondary.asm
	cat output/main.bin output/secondary.bin > output/reos.bin
run:output/main.bin
	qemu-system-x86_64 -cdrom output/reos.iso

floppy:output/main.bin
	dd if=/dev/zero of=output/floppy.img bs=1024 count=1440
	dd if=output/reos.bin of=output/floppy.img seek=0 count=1 conv=notrunc

iso:output/main.bin
	mkdir iso_out
	#cp output/* iso_out
	cp output/floppy.img iso_out/floppy.img
	mkisofs -input-charset iso8859-1 -o output/reos.iso -V ReOS -b floppy.img -hide floppy.img iso_out/
	rm -r iso_out

clean:
	rm -r output/
	mkdir output
