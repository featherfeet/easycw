[indent = 4]

uses PortAudio

class SenderReceiver
    init
        err:PortAudio.Error = PortAudio.initialize()
        if err != PortAudio.ErrorCode.NO_ERROR
            print("PortAudio initialization error.")
