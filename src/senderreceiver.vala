using PortAudio;

public class SenderReceiver {
	private PortAudio.Stream audioStream;
	private double sampleRate;

	private int streamCallback(void* input, void* output, ulong frame_count, PortAudio.Stream.CallbackTimeInfo time_info, PortAudio.Stream.CallbackFlags status_flags) {
		float* inputBuffer = (float*) input;
		for (int frame = 0; frame < frame_count; frame++) {
			stdout.printf("%f\n", inputBuffer[frame]);
		}
		return 0;
	}

	public SenderReceiver(double sampleRate) {
		this.sampleRate = sampleRate;
		PortAudio.Error err = PortAudio.initialize();
		if (err != PortAudio.ErrorCode.NO_ERROR) {
			print("PortAudio initialization error.");
		}
		
		err = PortAudio.Stream.open_default(out audioStream, 1, 1, PortAudio.FLOAT_32, sampleRate, PortAudio.FRAMES_PER_BUFFER_UNSPECIFIED, streamCallback);
	}
	~SenderReceiver() {
		PortAudio.Error err = PortAudio.terminate();
		if (err != PortAudio.ErrorCode.NO_ERROR) {
			print("PortAudio termination error.");
		}
	}
}
