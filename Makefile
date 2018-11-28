easycw: src/main.gs src/senderreceiver.gs
	valac -o easycw --pkg gtk+-3.0 --vapidir ./src --pkg portaudio -X -lportaudio src/main.gs src/senderreceiver.gs
run: easycw
	./easycw
