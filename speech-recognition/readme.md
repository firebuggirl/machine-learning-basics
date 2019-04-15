https://rubikscode.net/2018/07/30/speech-recognition-with-python-crash-course/#comments


- From inside docker container:

    ` pip install SpeechRecognition
    `

    ` pip install pyaudio
    `

- Free, open source sounds https://freesound.org/people/klankbeeld/sounds/465618/


<!-- import speech_recognition as sr

#create recognizer class object
recognizer = sr.Recognizer()
audiofile = sr.AudioFile('465618__klankbeeld__kampina-forest-spring005-190322-1321.wav')

#“record” content of the selected audio file into the local variable
with audiofile as source:
    recognizer.adjust_for_ambient_noise(source)
    audio = recognizer.record(source)

recognizer.recognize_google(audio) -->

https://realpython.com/python-speech-recognition/

- The primary purpose of a Recognizer instance is, of course, to recognize speech.

  - Each Recognizer instance has seven methods for recognizing speech from an audio source using various APIs. These are:

    - recognize_bing(): Microsoft Bing Speech

    - recognize_google(): Google Web Speech API

    - recognize_google_cloud(): Google Cloud Speech - requires installation of the google-cloud-speech package

    - recognize_houndify(): Houndify by SoundHound

    - recognize_ibm(): IBM Speech to Text

    - recognize_sphinx(): CMU Sphinx - requires installing PocketSphinx

    - recognize_wit(): Wit.ai

          - Of the seven, only recognize_sphinx() works offline with the CMU Sphinx engine. The other six all require an internet connection.


          - SpeechRecognition ships with a default API key for the Google Web Speech API => use the Web Speech API in this guide. The other six APIs all require authentication with either an API key or a username/password combination. For more information, consult the SpeechRecognition docs.

            https://github.com/Uberi/speech_recognition/blob/master/reference/library-reference.rst

            - The default key provided by SpeechRecognition is for testing purposes only

            - two ways to create an AudioData instance: from an audio file or audio recorded by a microphone.


## Using record() to Capture Data From a File

- Type the following into your interpreter session to process the contents of the “harvard

    ` harvard = sr.AudioFile('harvard.wav')
        with harvard as source:
            audio = r.record(source)
        type(audio)
        r.recognize_google(audio)
        `

- Check type of audio recognition:

    ` type(audio)
    `

- invoke `recognize_google()` to attempt to recognize any speech in the audio


  - `Open Speech Repository` :

    http://www.voiptroubleshooter.com/open_speech/index.html

    - The OSR Project provides freely usable speech files in multiple languages for use in Voice over IP testing and other applications. We encourage you to use these files, publish, copy, broadcast without restriction - we only require that you identify the source of files used as "Open Speech Repository".


  - capture any speech in the `first four seconds` of the file:


      - ` with harvard as source:
            audio = r.record(source, duration=4)

          r.recognize_google(audio)`

      - ...second time returns the four seconds of audio after the first four seconds

        ` with harvard as source:
              audio1 = r.record(source, duration=4)
              audio2 = r.record(source, duration=4)

          r.recognize_google(audio1)

          r.recognize_google(audio2)

           `

      - In addition to specifying a recording duration, the record() method can be given a specific starting point using the `offset` keyword argument. This value represents the number of seconds from the beginning of the file to ignore before starting to record.


      - To capture only the second phrase in the file, you could start with an offset of four seconds and record for, say, three seconds.


          ` with harvard as source:
                audio = r.record(source, offset=4, duration=3)

            recognizer.recognize_google(audio)

            `


      - The offset and duration keyword arguments are useful for segmenting an audio file if you have prior knowledge of the structure of the speech in the file. However, using them hastily `can result in poor transcriptions`. To see this effect, try the following in your interpreter:

        ` with harvard as source:
            audio = r.record(source, offset=4.7, duration=2.8)

          recognizer.recognize_google(audio)
          `
          - There is another reason you may get inaccurate transcriptions. Noise!

## The Effect of Noise on Speech Recognition


  - `jackhammer.wav` => This file has the phrase “the stale smell of old beer lingers” spoken with a loud jackhammer in the background.

  - What happens when you try to transcribe this file?

      - way off!!

      - try `adjust_for_ambient_noise()` method of the Recognizer class

      - a little closer to the actual phrase, but it still isn’t perfect. Also, “the” is missing from the beginning of the phrase. Why is that?

      - The adjust_for_ambient_noise() method reads the first second of the file stream and calibrates the recognizer to the noise level of the audio. Hence, that portion of the stream is consumed before you call record() to capture the data.

      - You can `adjust the time-frame` that `adjust_for_ambient_noise()` uses for analysis with the duration keyword argument. This argument takes a numerical value in seconds and is set to 1 by default. Try lowering this value to `0.5`.

      - Well, that got you “the” at the beginning of the phrase, but now you have some new issues! Sometimes it isn’t possible to remove the effect of the `noise—the signal is just too noisy to be dealt with successfully`. That’s the case with this file.

      - If you find yourself running up against these issues frequently, you `may have to resort to some pre-processing of the audio`. This can be done with `audio editing software(https://www.audacityteam.org/)` or a `Python package (such as SciPy)` that can `apply filters` to the files. A detailed discussion of this is beyond the scope of this tutorial—check out `Allen Downey’s Think DSP book(http://greenteapress.com/wp/think-dsp/)` if you are interested. For now, just be aware that ambient noise in an audio file can cause problems and must be addressed in order to maximize the accuracy of speech recognition.

      - When working with noisy files, it can be `helpful to see the actual API response`. `Most APIs return a JSON string containing many possible transcriptions`. The `recognize_google() method will always return the most likely transcription` unless you force it to give you the full response.

      - You can do this by `setting the show_all keyword argument of the recognize_google() method to True`.

          - returns a dictionary with the key 'alternative' that points to a list of possible transcripts. The structure of this response may vary from API to API and is mainly useful for debugging.


## Working With Microphones

### Installing PyAudio

    - `Debian Linux`

      - If you’re on Debian-based Linux (like Ubuntu) you can install PyAudio with apt:

        `  sudo apt-get install python-pyaudio python3-pyaudio
        `

        - or, in my case...inside of `jupyter-notebooks` Docker image, run:

            ` apt-get install python-pyaudio python3-pyaudio
            `
            - Once installed, you may still need to run:

                ` pip install pyaudio
                `// especially if you are working in a `virtual environment`.

                +

                ` apt-get install libportaudio-dev
                `

                - if this fails...try this instead:

                ` apt-get install portaudio19-dev
                `

                - THEN run:

                    ` pip install pyaudio
                    `

    - `macOS`

        - For macOS, first you will need to install PortAudio with Homebrew, and then install PyAudio with pip:

          `  brew install portaudio
          `

          ` pip install pyaudio
          `

    - `Testing the Installation`:

        - Once you’ve got PyAudio installed, you can test the installation from the console.

            ` python -m speech_recognition
            `
              - OSError: No Default Input Device Available

          - Try installing this:

              ` import sounddevice as sd
                sd.query_devices()
                `//still not working!!

    - `The Microphone Class`:

        - Open up another interpreter session and create an instance of the recognizer class.

        - create new file `microphone.ipynb`

          ` import speech_recognition as sr
            r = sr.Recognizer()
              `
- can't get input microphone to work on this image w/ Anaconda/Debian!!

- come back to this...maybe try on Google Drive via `Colab`

https://realpython.com/python-speech-recognition/
