easycw: src/main.vala src/senderreceiver.vala
	valac -o easycw --pkg gtk+-3.0 --vapidir ./src --pkg portaudio -X -lportaudio src/main.vala src/senderreceiver.vala
run: easycw
	./easycw
clean:
	rm easycw
