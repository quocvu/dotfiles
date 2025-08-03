#!/bin/sh
aws polly synthesize-speech --output-format mp3 --engine neural --voice-id Brian --text-type ssml --text file://text $1
