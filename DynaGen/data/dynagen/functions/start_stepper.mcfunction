#starts both the cw and ccw steppers in the appropriate locations

#advance 1 chunk forward and start the ccw_stepper recursive loop
execute positioned ^ ^ ^16 run function dynagen:ccw_stepper

#this feeds the cw stepper 1 step forward to prevent potential double population of the first chunk
#the directions are different than in cw_stepper to prevent updating the command context if not necessary
#otherwise it's functionally identical to the corresponding part of cw_stepper
execute if block ^-16 ^ ^ command_block if block ^-32 ^ ^16 bedrock rotated ~90 0 positioned ^ ^ ^32 run function dynagen:cw_stepper
execute if block ^-16 ^ ^ bedrock rotated ~90 0 positioned ^ ^ ^16 run function dynagen:cw_turn