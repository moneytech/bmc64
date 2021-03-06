//
// viceoptions.h
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef _vice_options_h
#define _vice_options_h

#include <circle/bcmpropertytags.h>
#include <circle/cputhrottle.h>

#define DEFAULT_CANVAS_WIDTH 384
#define DEFAULT_CANVAS_HEIGHT 272

#define MACHINE_TIMING_NTSC 0
#define MACHINE_TIMING_PAL 1

#define TEST_PIN_TARGET_NONE 0
#define TEST_PIN_TARGET_SPACE 1
#define TEST_PIN_TARGET_FIRE_1 2
#define TEST_PIN_TARGET_FIRE_2 3

class ViceOptions
{
public:
	ViceOptions (void);
	~ViceOptions (void);

	unsigned GetCanvasWidth (void) const;
	unsigned GetCanvasHeight (void) const;
	unsigned GetMachineTiming (void) const;

	static ViceOptions *Get (void);

private:
	char *GetToken (void);				// returns next "option=value" pair, 0 if nothing follows

	static char *GetOptionValue (char *pOption);	// returns value and terminates option with '\0'

	static unsigned GetDecimal (char *pString);	// returns decimal value, -1 on error

private:
	TPropertyTagCommandLine m_TagCommandLine;
	char *m_pOptions;

	unsigned m_nCanvasWidth;
	unsigned m_nCanvasHeight;
	unsigned m_nMachineTiming;

	static ViceOptions *s_pThis;
};

#endif
