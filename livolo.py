import time
import sys
import RPi.GPIO as GPIO

off =  '1242424352424342424242424242425342524342'
on  =  '124242435242434242424242424242425243424242'

if sys.argv[1:] == 'off':
    NUM_ATTEMPTS = 1000
else:
    NUM_ATTEMPTS = 150

TRANSMIT_PIN = 17

def transmit_code(code):
    '''Transmit a chosen code string using the GPIO transmitter'''
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(TRANSMIT_PIN, GPIO.OUT)
    for t in range(NUM_ATTEMPTS):
        for i in code:
            if i == '1':
                GPIO.output(TRANSMIT_PIN, 1)
                time.sleep(.00055);
                GPIO.output(TRANSMIT_PIN, 0)
            elif i == '2':
                GPIO.output(TRANSMIT_PIN, 0)
                time.sleep(.00011);
                GPIO.output(TRANSMIT_PIN, 1)
            elif i == '3':
                GPIO.output(TRANSMIT_PIN, 0)
                time.sleep(.000303);
                GPIO.output(TRANSMIT_PIN, 1)
            elif i == '4':
                GPIO.output(TRANSMIT_PIN, 1)
                time.sleep(.00011);
                GPIO.output(TRANSMIT_PIN, 0)
            elif i == '5':
                GPIO.output(TRANSMIT_PIN, 1)
                time.sleep(.00029);
                GPIO.output(TRANSMIT_PIN, 0)
            else:
                continue
        GPIO.output(TRANSMIT_PIN, 0)
    GPIO.cleanup()

if __name__ == '__main__':
    for argument in sys.argv[1:]:
        exec('transmit_code(' + str(argument) + ')')


# How to use:: I am putting this here, because it seems few people have figured out livolo switches.
# Hold down livolo light switch for 5 seconds and wait for a beep.
# Run ```python livolo.py on```
# Livolo light switch should beep again, signalling it is paired
# Now running ```python livolo.py on``` will toggle the switch.
# ```python livolo.py off``` is global to all switches and should work out of box.

# The following lines are possible RF codes which can be learned by the switch.
# Just make them strings and save them to variables similarly to 'on' or 'off'.
# I only have 1 switch so multiple RF freqs werent necessary.
# 1, 2, 4, 2, 4, 2, 4, 3, 5, 2, 4, 2, 4, 3, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2
# 1, 2, 4, 2, 4, 2, 4, 3, 5, 2, 4, 2, 4, 3, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 5, 3, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2
# 1, 2, 4, 2, 4, 2, 4, 3, 5, 2, 4, 2, 4, 3, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 5, 3, 5, 3, 4, 2, 4, 2, 4, 2
# 1, 2, 4, 2, 4, 2, 4, 3, 5, 2, 4, 2, 4, 3, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 5, 3, 4, 2, 4, 2, 4, 2
# 1, 2, 4, 2, 4, 2, 4, 3, 5, 2, 4, 2, 4, 3, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 5, 2, 4, 3, 4, 2, 4, 2, 4, 2, 4, 2
# 1, 2, 4, 2, 4, 2, 4, 3, 5, 2, 4, 2, 4, 3, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 5, 3, 4, 2, 4, 2, 4, 2, 4, 2
# 1, 2, 4, 2, 4, 2, 4, 3, 5, 2, 4, 2, 4, 3, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 5, 3, 4, 2, 5, 3, 4, 2, 4, 2
# 1, 2, 4, 2, 4, 2, 4, 3, 5, 2, 4, 2, 4, 3, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 5, 3, 4, 2, 4, 2
# 1, 2, 4, 2, 4, 2, 4, 3, 5, 2, 4, 2, 4, 3, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 5, 2, 4, 2, 4, 3, 4, 2, 4, 2, 4, 2
# 1, 2, 4, 2, 4, 2, 4, 3, 5, 2, 4, 2, 4, 3, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 4, 2, 5, 2, 4, 3, 4, 2, 4, 2, 4, 2
