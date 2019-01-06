using PortAudio;
using Gtk;

public class SenderReceiver {
	private PortAudio.Stream audioStream;
	private Gtk.LevelBar audioLevelDisplay;
	private double sampleRate;

	private int streamCallback(void* input, void* output, ulong frame_count, PortAudio.Stream.CallbackTimeInfo time_info, PortAudio.Stream.CallbackFlags status_flags) {
		float* inputBuffer = (float*) input;
		float* outputBuffer = (float*) output;
		for (int frame = 0; frame < frame_count; frame++) {
			audioLevelDisplay.set_value(Math.fabs(inputBuffer[frame]));
			outputBuffer[frame] = 0.0f;
		}
		return 0;
	}

	public SenderReceiver(double sampleRate, Gtk.LevelBar audioLevelDisplay) {
		this.audioLevelDisplay = audioLevelDisplay;
		this.sampleRate = sampleRate;
		PortAudio.Error err = PortAudio.initialize();
		if (err != PortAudio.ErrorCode.NO_ERROR) {
			print("PortAudio initialization error.");
		}
		
		err = PortAudio.Stream.open_default(out audioStream, 1, 1, PortAudio.FLOAT_32, sampleRate, PortAudio.FRAMES_PER_BUFFER_UNSPECIFIED, streamCallback);
		if (err != PortAudio.ErrorCode.NO_ERROR) {
			print("PortAudio open_default error.");
		}

		err = audioStream.start();
		if (err != PortAudio.ErrorCode.NO_ERROR) {
			print("PortAudio stream start error.");
		}
	}
	~SenderReceiver() {
		PortAudio.Error err = audioStream.stop();
		if (err != PortAudio.ErrorCode.NO_ERROR) {
			print("PortAudio audio stream stop error.");
		}

		err = PortAudio.terminate();
		if (err != PortAudio.ErrorCode.NO_ERROR) {
			print("PortAudio termination error.");
		}
	}
}
