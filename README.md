# :musical_keyboard: Sonic Pi Json Sequencer

Launch Sonic Pi `live_loop` from json.

## Todo

- [ ] Run on RPi...
    - [ ] Test with Rpi3 : Reverb FX consumes too many resources
    - [ ] Test with RPi4
- [ ] Python part :
    - [ ] Piano HAT (WIP)
    - [ ] Potards
    - [ ] E-ink display

## Changelog

### 20210301

- Read channel information from json file
- Adapt Python part

## OSC commands

| Feature                            | OSC URI          | Parameters                                                  |
| ---------------------------------- | ---------------- | ----------------------------------------------------------- |
| Set global volume                  | /settings        | ['volume', Float] between 0 and 5                |
| Set playback state                 | /settings        | ['state', value] `stop` (default), `play` or `pause`        |
| Set bpm                            | /settings        | ['bpm', Integer] default : 60                               |
| ~Set eighth (One sleep divided by)~  | ~/settings~        | ~['eighth', Integer] default : 4~                             |
| Set bar (Sleeps between patterns)  | /settings        | ['bar', Integer] default : 1                                |
| Set max pattern to play            | /settings        | ['pmax', Integer] default : 4                               |
| Kill a loop                        | /kill            | String `live_loop` name                                     |
| ~Set channels~                     | ~/channels~      | ~Json~                                                      |
| Send signal to read json channel file  | /channel         | [Integer `position`]                                  |
| Set channel                        | /channel         | [Integer `position`, Json]                                  |
| Channel opts                       | /channel/options | [String `live_loop` name, Json]                             |
| Channel FXs                        | /channel/fxs     | [String `live_loop` name, String FX name, Json]             |
| Start record (*Experimental*)      | /record/start    | Start to record                                             |
| Stop record (*Experimental*)       | /record/stop     | Stop record                                                 |
| Save record (*Experimental*)       | /record/save     | Save record (Change `FILE_PATH` constant in `main.rb` file) |

Record features are commented in `main.rb`, some time issues on Rpi 3 for the moment.

## Run

Set `CHANNELS_PATH` constant in `main.rb` and `python/Machine.py` files

### Sonic Pi

`run_file "/absolute/path/to/main.rb"`

### Python

Install [python-osc](https://pypi.org/project/python-osc/) : `pip install python-osc`

`python3 python/main.py`

## Python

### Machine

### Channel

### PianoHat
