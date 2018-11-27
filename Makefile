easycw: src/main.gs
	valac -o easycw --pkg gtk+-3.0 --vapidir ./src --pkg portaudio src/main.gs
run: easycw
	./easycw
