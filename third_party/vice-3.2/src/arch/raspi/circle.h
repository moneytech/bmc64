/*
 * circle.h
 *
 * Written by
 *  Randy Rossi <randy.rossi@gmail.com>
 *
 * This file is part of VICE, the Versatile Commodore Emulator.
 * See README for copyright notice.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
 *  02111-1307  USA.
 *
 */

#ifndef VICE_CIRCLE_H
#define VICE_CIRCLE_H

// The way we are organized for the time being is
// for circle to embed vice.  This file defines the
// types circle layer needs to know about to
// give the vice layer what it needs and also the
// functions circle layer need to provide for vice to
// call back into it.  Vice types/includes should not be
// added here.

#include <sys/types.h>

// TODO: Replace this with a direct call from kernel
typedef void (*raspi_key_handler)(long key);

extern void circle_joy_init();

extern void circle_kbd_init(raspi_key_handler press_handler,
                            raspi_key_handler release_handler);

extern int circle_get_machine_timing();
extern uint8_t* circle_get_fb();
extern int circle_get_fb_pitch();
extern void circle_sleep(long);
extern void circle_set_palette(uint8_t, uint16_t);
extern void circle_update_palette();
extern int circle_get_display_w();
extern int circle_get_display_h();
extern unsigned long circle_get_ticks();
extern void circle_set_fb_y(int);
extern void circle_wait_vsync();
extern void circle_yield();
extern void circle_poll_joysticks(int port);
extern void circle_check_gpio();

extern void joy_set_gamepad_info(int num_pads, int axes[2], int hats[2]);

extern void circle_joy_usb(unsigned device, int value);
extern void circle_joy_gpio(unsigned device, int value);

extern int circle_joy_need_gpio(int device);
extern void circle_usb_pref(int device, int *usb_pref, int* x_axis, int *y_axis);
extern int circle_ui_activated(void);
extern int circle_ui_activated(void);
extern void circle_ui_key_interrupt(long key);

#endif
