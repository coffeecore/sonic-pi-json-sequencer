# :musical_keyboard: Sonic Pi Json Sequencer

Launch Sonic Pi `live_loop` from json.

## Todo

- [ ] Run on RPi...
    - [x] Test with Rpi3 : Reverb FX consumes too many resources
    - [ ] Test with RPi4
- [ ] Python part :
    - [ ] Piano HAT
    - [ ] Potards
    - [ ] E-ink display

## Json (changed, see dark_mist.py)

```
[
    {
        "type": "synth",
        "name": "tb303",
        "fxs": {
            "distortion": {
                "distort": 0.99
            }
        },
        "patterns": [
            [
                {"n": ":e1", "release": 0.125, "cutoff": 120, "res": 0.5},
                {"n": "(chord :c4, : major)", "release": 0.125, "cutoff": 120, "res": 0.5},
                None,
                None
            ]
        ],
        "sleeps": [
            [1, 0.25, 5, 1]
        ]
    },
    {
        "type": "sample",
        "name": "drum_cymbal_closed",
        "fxs": {
        },
        "patterns": [
            [{"res": 0.9}, None, {"attack": 0.5}, None]
        ],
        "sleeps": [
            0.25, 0.25, 0.25
        ]
    },
    {
        "type": "external_sample",
        "name": "/home/pi/mysample.ext",
        "fxs": {
        },
        "patterns": [
            [{"rate": 0.9}, {}, {"rate": 0.5}, None]
        ],
        "sleeps": [
            0.25, 0.25, 0.25
        ]
    }
]
```

Will result `live_loop` name to :
- synth_0
- sample_1
- external_sample_2

See begin of `test.py` for example.

## OSC commands

| Feature                            | OSC URI          | Parameters                                                  |
| ---------------------------------- | ---------------- | ----------------------------------------------------------- |
| Set global volume                  | /settings        | ['volume', Float] (between 0 and 5(default))                |
| Set playback state                 | /state           | String `stop`, `play` or `pause`                            |
| Set bpm                            | /settings        | ['bpm', Integer] (default : 60)                             |
| Set eighth (One sleep divided by)  | /settings        | ['eighth', Integer] (default : 4)                           |
| Set bar (Sleeps between patterns)  | /settings        | ['bar', Integer] (default : 1)                              |
| Set max pattern to play            | /settings        | ['pmax', Integer] (default : 4)                             |
| Kill a loop                        | /kill            | String `live_loop` name                                     |
| Set channels                       | /channels        | Json                                                        |
| Set channel                        | /channel         | [Integer `position`, Json]                                  |
| Channel opts                       | /channel/options | [String `live_loop` name, Json]                             |
| Channel FXs                        | /channel/fxs     | [String `live_loop` name, String FX name, Json]             |
| Start record (*Experimental*)      | /record/start    | Start to record                                             |
| Stop record (*Experimental*)       | /record/stop     | Stop record                                                 |
| Save record (*Experimental*)       | /record/save     | Save record (Change `FILE_PATH` constant in `main.rb` file) |

Record features are commented in `main.rb`, some time issues on Rpi 3 for the moment.

## Run

`run_file "/absolute/path/to/main.rb"`

## Python

...
