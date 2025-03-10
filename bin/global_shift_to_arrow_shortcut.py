#!/usr/bin/env python3
from Xlib import X, XK, display
from Xlib.ext import record
from Xlib.protocol import rq
import subprocess
import sys
import logging
from datetime import datetime
import time

logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(levelname)s - %(message)s',
    filename=f'/tmp/key_mapper_{datetime.now().strftime("%Y%m%d_%H%M%S")}.log'
)

class KeyMapper:
    def __init__(self):
        try:
            self.display = display.Display()
            self.root = self.display.screen().root
            self.local_display = display.Display()
            
            self.ctx = self.display.record_create_context(
                0,
                [record.AllClients],
                [{
                    'core_requests': (0, 0),
                    'core_replies': (0, 0),
                    'ext_requests': (0, 0, 0, 0),
                    'ext_replies': (0, 0, 0, 0),
                    'delivered_events': (0, 0),
                    'device_events': (X.KeyPress, X.KeyRelease),
                    'errors': (0, 0),
                    'client_started': False,
                    'client_died': False,
                }]
            )
            logging.info("Initialization complete")
            
        except Exception as e:
            logging.error(f"Initialization error: {str(e)}")
            raise

    def simulate_left_arrow(self):
        try:
            logging.info("Attempting to simulate left arrow key...")
            result = subprocess.run(
                ['xdotool', 'key', '--clearmodifiers', 'Left'],
                capture_output=True,
                text=True
            )
            if result.returncode == 0:
                logging.info("Successfully simulated left arrow key")
            else:
                logging.error(f"xdotool error: {result.stderr}")
        except Exception as e:
            logging.error(f"Error simulating key: {str(e)}")

    def simulate_right_arrow(self):
        try:
            logging.info("Attempting to simulate right arrow key...")
            result = subprocess.run(
                ['xdotool', 'key', '--clearmodifiers', 'Right'],
                capture_output=True,
                text=True
            )
            if result.returncode == 0:
                logging.info("Successfully simulated right arrow key")
            else:
                logging.error(f"xdotool error: {result.stderr}")
        except Exception as e:
            logging.error(f"Error simulating key: {str(e)}")

    def handle_event(self, reply):
        try:
            data = reply.data
            while len(data):
                event, data = rq.EventField(None).parse_binary_value(
                    data, self.display.display, None, None)
                
                if event.type == X.KeyPress:
                    keycode = event.detail
                    keysym = self.local_display.keycode_to_keysym(keycode, 0)
                    shift_mask = event.state & X.ShiftMask
                    key_char = self.local_display.lookup_string(keysym)
                    
                    logging.debug(f"Key pressed - Keycode: {keycode}, "
                                f"Keysym: {keysym}, "
                                f"Char: {key_char}, "
                                f"Shift: {bool(shift_mask)}")
                    
                    # Check for Shift+H
                    if shift_mask and key_char == 'h':
                        logging.info("Detected Shift+H combination!")
                        self.simulate_left_arrow()
                    if shift_mask and key_char == 'l':
                        logging.info("Detected Shift+L combination!")
                        self.simulate_right_arrow()
                        
        except Exception as e:
            logging.error(f"Error in handle_event: {str(e)}")

    def start(self):
        try:
            logging.info("Starting key mapper...")
            print("Key mapper started. Check /tmp/key_mapper_*.log for debug output.")
            print("Press Ctrl+C to stop.")
            
            self.display.record_enable_context(
                self.ctx,
                lambda reply: self.handle_event(reply)
            )
            
        except Exception as e:
            logging.error(f"Error in start: {str(e)}")
            raise

    def stop(self):
        try:
            logging.info("Stopping key mapper...")
            self.display.record_free_context(self.ctx)
            self.display.close()
            self.local_display.close()
            logging.info("Key mapper stopped successfully")
        except Exception as e:
            logging.error(f"Error in stop: {str(e)}")

def main():
    # Test xdotool
    try:
        subprocess.run(['xdotool', '--version'], 
                      capture_output=True, 
                      check=True)
        logging.info("xdotool is available")
    except subprocess.CalledProcessError:
        print("Error: xdotool is not installed or not working.")
        print("Please install it with: sudo apt-get install xdotool")
        sys.exit(1)

    try:
        mapper = KeyMapper()
        mapper.start()
    except KeyboardInterrupt:
        print("\nStopping key mapper...")
        mapper.stop()
        sys.exit(0)
    except Exception as e:
        logging.error(f"Fatal error: {str(e)}")
        print(f"Fatal error: {str(e)}")
        sys.exit(1)

if __name__ == "__main__":
    main()
