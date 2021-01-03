# Add FXs to an instrument
#
# OSC parameters :
# - instrument position
# - FX name
# - FX options
# Example :
# - [0, 'reverb', 'room', 1, 'mix', 0.5]
live_loop :add_fx do
  use_real_time
  osc       = sync "/osc*/instru/fx/add"
  instruPos = osc[0]
  fxName    = osc[1]
  fxOpts    = osc[2..]

  instrus = get(:instrus)[0..]
  instru  = (instrus[instruPos]).to_h

  fxs = instru['fxs'][0..]
  fx  = {'name' => fxName, 'opts' => {}}
  fxOpts.each_with_index do |v, i|
    if i % 2 == 0 then
      fx['opts'][v] = fxOpts[i+1]
    end
  end

  instru['fxs'] = fxs.push(fx)

  # osc "/instru/fx/add", instru.length-1

  instrus[instruPos] = instru
  set(:instrus, instrus)
end

# Change FX options
#
# OSC parameters :
# - instrument position
# - FX position
# - FX options
# Example :
# - [0, 0, 'room', 1, 'mix', 0.5]
live_loop :change_options_fx do
  use_real_time
  osc        = sync '/osc*/instru/fx/change'
  instruPos  = osc[0]
  fxPosition = osc[1]
  fxOpts     = osc[2..]

  instrus = get(:instrus)[0..]
  instru  = (instrus[instruPos]).to_h

  fxs = instru['fxs'][0..]
  fx  = fxs[fxPosition].to_h
  fxsOptions = fx['opts'].to_h
  fxOpts.each_with_index do |v, i|
    if i % 2 == 0 then
      fxsOptions[v] = fxOpts[i+1]
    end
  end

  fx['opts']       = fxsOptions
  fxs[fxPosition] = fx
  instru['fxs']    = fxs

  instrus[instruPos] = instru
  set(:instrus, instrus)
end

# Remove FXs from an instrument
#
# OSC parameters :
# - instrument position
# - FX name
# - FX position
# Example :
# - [0, 0...]
live_loop :remove_fx do
  use_real_time
  osc       = sync '/osc*/instru/fx/remove'
  instruPos = osc[0]
  fxOpts    = osc[1..]

  instrus = get(:instrus)[0..]
  instru  = (instrus[instruPos]).to_h

  fxs = instru['fxs'][0..]

  fxOpts.each_with_index do |v, i|
    fxs.delete_at(i)
  end

  instru['fxs'] = fxs

  instrus[instruPos] = instru
  set(:instrus, instrus)
end

# Remove all FXs from an instrument
#
# OSC parameters :
# - instrument position
# - FX name
# Example :
# - [0]
live_loop :remove_all_fx do
  use_real_time
  osc       = sync '/osc*/instru/fx/remove/all'
  instruPos = osc[0]

  instrus = get(:instrus)[0..]
  instru  = (instrus[instruPos]).to_h

  instru['fxs'] = []

  instrus[instruPos] = instru
  set(:instrus, instrus)
end
