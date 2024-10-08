# Overview

This file refers to the units program available from gnu.
This is gnu-units. I installed it on the RPi/Ubuntu. Downloaded to the RPI on 2023-08-05

1. Examples from kragen on Hacker News
2. Long, detailed item on units of all sorts from frinklang.org 


# 1. kragen examples from Hacker News 2023-08-05
kragen 1 day ago | next [–]

this page seriously undersells the versatility and utility of the units program

how long will my laptop take to charge at its current rate of charging?

    You have: (22.8 Wh - 16.8 Wh)/7.4W
    You want: time
            48 min + 38.918919 sec

how long will a 2000mAh 18650 cell take to discharge at 2.5 watts, using a nominal voltage of 3.7 volts?

    You have: 3.7 V 2 amp hour / 2.5 watt
    You want: time
            2 hr + 57 min + 36 sec

what energy density is that, so i can compare it to the volume needed for other forms of energy storage?

    You have: 3.7 V 2 amp hour / circlearea(half 18 mm) 65 mm
    You want: MJ/ℓ
            * 1.6105936
            / 0.62088909

what's the specific energy of stoichiometrically mixed oxyhydrogen fuel?

    You have: 44000 J/mol / ((2 hydrogen + oxygen)g/mol)
    You want: MJ/kg
            * 2.4423711
            / 0.40943818

okay but how much volume? say at atmospheric pressure?

    You have: 3 mol gasconstant tempC(20) / 1 atm
    You want: l
            * 72.165351
            / 0.013857066

so that's how much energy density?

    You have: 44kJ/_
    You want: J/l
            * 609.71089
            / 0.0016401216

(i may be off by a factor of 2 here)

how much energy can this capacitor hold?

    You have: half (10V)**2 47 uF
    You want: mJ
            * 2.35
            / 0.42553191

how much energy density is that?

    You have: half (10V)**2 47 μF / 15mm circlearea(3mm)
    You want: J/ℓ
            * 5.5409499
            / 0.18047447

how thick of a cable do i need to support me in a lightweight fabric-sling chair (or, from a different point of view, to pose a risk of accidental strangulation)? suppose its tensile strength is 2.7 gigapascals

    You have: 120kg gravity / 2.7 GPa
    You want: mm2
            * 0.43585111
            / 2.2943615
    You have: _
    You want: circlearea
            0.00037247244 m
    You have: _
    You want: mm
            * 0.37247244
            / 2.6847624

note that this is the radius of the cable, not its diameter!

the datasheet says this 400×240 display uses 175 μW if all the pixels flip once per second and 60 μW for a static display. how much energy is that per pixel flip?

    You have: (175 uW - 50 uW) / 400 240 1 Hz
    You want: nJ
            * 1.3020833
            / 0.768

if i overclock it to 60 fps how much power will it use?

    You have: 60 Hz 400 240 1.3nJ
    You want: μW
            * 7488
            / 0.00013354701

and how many pixels is its diagonal?

    You have: 400**2+240**2
    You want:
            Definition: 217600
    You have: _**.5
    You want:
            Definition: 466.47615

what is the visual angle subtended by the sun as seen from earth?

    You have: 2 sunradius/sundist
    You want: milliradians
            * 9.3049358
            / 0.10746984
    You have: _
    You want: dms
            31 arcmin + 59.280781 arcsec

okay, how does that compare to the moon?

    You have: moonradius 2 / moondist
    You want:
            Definition: 0.0090426639

on average the moon looks a little smaller, which is why annular eclipses are so common, but we can also calculate that total eclipses are possible because sometimes the moon looks bigger

    You have: moonradius 2 / moondist_min
    You want:
            Definition: 0.0097530864

what percentage of this copper sulfate is actual copper?

    You have: copper / (copper + (sulfur + 4 oxygen))
    You want: %
            * 39.813395
            / 0.025117175

how fast can i write to this slc flash chip without wearing it out in 53 years, assuming perfect wear leveling and no write amplification?

    You have: 100 thousand 128 MiB/53 years
    You want: bytes/second
            * 8024.8943
            / 0.00012461223

how much fuel will this truck need to get across the country?

    You have: 4000 km / (6.5 miles/gallon)
    You want: l
            * 1447.4744
            / 0.00069085852

how much is that per kilogram of lettuce or sodium lauryl sulfate or whatever?

    You have: _/28 tonnes
    You want: ml/kg
            * 51.695513
            / 0.019344039

okay, but how much energy is 52 mℓ of diesel per kg of lettuce?

    You have: _ 38.6 kJ/l
    You want: kJ/kg
            * 1.9954468
            / 0.5011409

how much data can i transfer overnight during unmetered hours on a 2400-baud modem?

    You have: 8 hours 2400 bps
    You want: MB
            * 8.64
            / 0.11574074

how much power does the earth receive from the sun, assuming a solar constant of 1400 W/m²?

    You have: 1400 W/m**2 * circlearea(earthradius)
    You want: petawatts
            * 178.52313
            / 0.0056015152

what would the equilibrium temperature of an object be if it were illuminated at that brightness and had a flat emission spectrum?

    You have: (1400 W/m**2 / stefanboltzmann)**(1/4)
    You want: tempC
            123.24583

how about here in buenos aires at the winter solstice? first, what angle is the sun at anyway? we're at 34°36’ south, and the sun's latitude at the solstice is 23°26’

    You have: 34° + 36' + 23° + 26'
    You want: dms
            58 deg + 2 arcmin

so that reduces the peak insolation to how much? here underneath the atmosphere we only get 1kW/m²

    You have: cos(_) 1000 W/m^2
    You want: W/m^2
            * 529.4258
            / 0.0018888388

and that would be what temperature in equilibrium?

    You have: (_/stefanboltzmann)**(1/4)
    You want: tempC
            37.698189

(integrating the sun's angle over the course of the day as the earth rotates is sadly beyond its capacities)

how much money could a sensible heat storage reservoir of 15 kg of water save me over 16 years? say power rates go down to only 2.5¢/kWh because of solar

    You have: 1500 kcal/day * 16 years * 2.5 cents/kWh
    You want:
            Definition: 254.69556 US$

what's the surface area of a 300mm × 400mm × 150mm backpack? like how much cloth?

    You have: 2 (300mm 400mm + 400mm 150mm + 150mm 300mm)
    You want:
            Definition: 0.45 m^2

okay but in cm²

    You have: _
    You want: cm2
            * 4500
            / 0.00022222222

what's the electrical impedance of a 1000 μF cap at an audio highpass frequency of 20Hz?

    You have: 1/(2 pi 20 Hz 1000 uF)
    You want: ohms
            * 7.9577472
            / 0.12566371

what's the time constant of 100 pF (roughly the smallest capacitance you can get in a macroscopic circuit with any degree of precision) and 1 MΩ?

    You have: 100 pF 1 megohm
    You want: ms
            * 0.1
            / 10

okay. so how long will an 0.1μF cap take to discharge through a 100kΩ resistor from 5 volts down to a 1.3 volt threshold?

    You have: ln(5V/1.3V) .1 uF 100kilohm
    You want: ms
            * 13.470736
            / 0.074234991

how many bits of precision does a linear adc need to be able to measure a difference of 1.8 millivolts if 1.5 volts is full-scale?

    You have: log(1.8mV/1.5V)/log(2)
    You want:
            Definition: -9.7027499

if this oxygen absorber contains 7 grams of iron which oxidizes to Fe₂O₃, how much air can it remove all the oxygen from? air is 21% oxygen by volume (and roughly by mass) and weighs 1.2 grams per liter

    You have: 3 oxygen / 2 iron * 7 g
    You want: g
            * 3.0082138
            / 0.33242318
    You have: _/21%/(1.2g/ℓ)
    You want: ℓ
            * 11.937356
            / 0.083770641

i've lost 7 kg over the last two months; how much of a caloric deficit does that represent in my diet?

    You have: 7 kg 3500kcal/pound / 2 months
    You want: kcal/day
            * 887.30034
            / 0.0011270141

if you were to spread the moon evenly over russia, how deep would it be?

    You have: spherevol(moonradius) / area_russia
    You want:
            Definition: 1286134.4 m

how big is nigeria compared to massachusetts?

    You have: area_nigeria/area_massachusetts
    You want:
            Definition: 33.793093

how many ounces of platinum is a ton of oil worth at 40 dollars per megawatt hour?

    You have: tonoil 40 dollars/MWh
    You want: platinumounce
            * 0.58368883
            / 1.7132416

or in grams?

    You have: tonoil 40 dollars/MWh / platinumprice
    You want: g
            * 18.154752
            / 0.055081997


# 2. frinklang.org (from Hacker News)

##########################################################################
https://frinklang.org/frinkdata/units.txt
##########################################################################


// -*- coding: utf-8 -*-
// Frink data file for non-changing units.
// 
// This file is used by the Frink calculating tool/programming language:
// https://frinklang.org/
//
// If you got to this page from a web search because you're trying to do a
// unit conversion or manipulation, try it at the following URL:
//
// https://frinklang.org/frink/
//
// Alan Eliasen
// eliasen@mindspring.com
//
// 
// This file is adapted, modified, and extended from the units database for use
// with GNU units, a units conversion program by Adrian Mariano
// adrian@cam.cornell.edu, who did a damn fine job collecting much of this.
// The GNU units program, in turn, copied much of the data and almost exactly
// duplicated its program interface from the Bell Labs units program that 
// existed way back in UNIX version 7 or before which was published in 1979!
// See, for example,
//   https://web.archive.org/web/20150205032715/http://plan9.bell-labs.com/7thEdMan/v7vol1.pdf (see p. 197)
//
//
// Most units data was drawn from
//            1. NIST Special Publication 811, 1995 Edition
//            2. CRC Handbook of Chemistry and Physics 70th edition
//            3. Oxford English Dictionary
//            4. Websters New Universal Unabridged Dictionary
//            5. Units of Measure by Stephen Dresner
//            6. A Dictionary of English Weights and Measures by Ronald Zupko
//            7. British Weights and Measures by Ronald Zupko
//            8. Realm of Measure by Isaac Asimov
//            9. United States standards of weights and measures, their
//                   creation and creators by Arthur H. Frazier.
//           10. French weights and measures before the Revolution: a
//                   dictionary of provincial and local units by Ronald Zupko
//           11. Weights and Measures: their ancient origins and their
//                   development in Great Britain up to AD 1855 by FG Skinner
//           12. The World of Measurements by H. Arthur Klein
//           13. For Good Measure by William Johnstone
//           14. NTC's Encyclopedia of International Weights and Measures 
//                   by William Johnstone
//           15. Sizes by John Lord
//           16. Sizesaurus by Stephen Strauss
//           17. CODATA Recommended Values of Physical Constants available at
//                   https://physics.nist.gov/cuu/Constants/index.html
//           18. SI Brochure, https://www.bipm.org/en/publications/si-brochure/
//
// Thanks to Jeff Conrad for assistance in ferreting out unit definitions.
//

/////////////////////////////////////////////////////////////////////////////
//                                                                         //
// Primitive units.  Any unit defined to contain a '!' character is a      //
// primitive unit which will not be reduced any further.  All units should //
// reduce to primitive units.                                              //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////

// Prefixes
//   Prefixes are defined with the symbol :- to indicate a prefix which cannot
//  stand by itself (must precede a unit name without intervening spaces)
//  or with the symbol ::- for a prefix which can be either attached to a unit
//  or defines a standalone unit.  For example, you may want to allow "giga"
//  to work as a prefix or as a stand-alone synonym for a billion, (generally
//  you do this just so someone can look up what it means if they forget,) 
//  in which case you would use the ::- operator.  If you have a prefix like 
//  "m" for milli, which you don't want to allow to stand alone, use the :-
//  operator. 
//   
//   A number specified like "1ee20" with integers for the mantissa and the 
//   exponent are treated as an exact integer, that is, 1ee20 represents 
//   the exact integer 1 followed by 20 zeroes.  ("ee" can be thought to 
//   stand for "exact exponent".)  This is in contrast to the more standard
//   "1e20" which is treated as an inexact floating-point number.
//
//   The latest prefixes, ronna, ronto, quetta and quecto were
//   approved at the 27th CGPM (2022)
//   https://www.bipm.org/en/cgpm-2022/resolution-3
//   https://www.scientificamerican.com/article/how-many-yottabytes-in-a-quettabyte-extreme-numbers-get-new-names/

quetta ::- 1ee30
ronna  ::- 1ee27                     
yotta  ::- 1ee24                     // 1E24 Greek or Latin octo, "eight"
zetta  ::- 1ee21                     // 1E21 Latin septem, "seven"
exa    ::- 1ee18                     // 1E18 Greek hex, "six"
peta   ::- 1ee15                     // 1E15 Greek pente, "five"
tera   ::- 1ee12                     // 1E12 Greek teras, "monster"
giga   ::- 1ee9                      // 1E9  Greek gigas, "giant"
mega   ::- 1ee6                      // 1E6  Greek megas, "large"
myria  ::- 1ee4                      // 1E4  Not an official SI prefix
kilo   ::- 1000                      // 1E3  Greek chilioi, "thousand"
hecto  ::- 100                       // 1E2  Greek hekaton, "hundred"
deca   ::- 10                        // 1E1  Greek deka, "ten"
deka   ::- 10    
deci   ::- 1/10                      // 1E-1 Latin decimus, "tenth"
centi  ::- 1/100                     // 1E-2 Latin centum, "hundred"
milli  ::- 1/1000                    // 1E-3 Latin mille, "thousand"
micro  ::- 1ee-6                     // 1E-6 Latin micro/Greek mikros,"small"
nano   ::- 1ee-9                     // 1E-9 Latin nanus or Greek nanos,"dwarf"
pico   ::- 1ee-12                    // 1E-12 Spanish pico, "a bit"
femto  ::- 1ee-15                    // 1E-15 Danish-Norwegian femten,"fifteen"
atto   ::- 1ee-18                    // 1E-18 Danish-Norwegian atten,"eighteen"
zepto  ::- 1ee-21                    // 1E-21 Latin septem, "seven"
yocto  ::- 1ee-24                    // 1E-24 Greek or Latin octo, "eight"
ronto  ::- 1ee-27
quecto ::- 1ee-30

Q :-  quetta
R :-  ronna
Y :-  yotta
Z :-  zetta
E :-  exa
P :-  peta
T :-  tera
G :-  giga
M :-  mega
k :-  kilo
h :-  hecto
da :- deka
d :-  deci
c :-  centi
m :-  milli
   // Alan's notes:
   // The "micro" prefix requires non-ASCII characters. It is defined as its
   // Unicode charactor \u00b5 below.
   //
   // Should we adopt the questionable Electrical Engineer policy of using
   // "u" to indicate micro?  I've added "uF" for microfarad later on to
   // tackle the most common case.  I just can't bring myself to kludge in
   // the double-awful "MFD" that capacitor manufacturers use to mean
   // "microfarad", which is wrong in at least 3 ways.
\u00b5 :- micro   // Unicode "MICRO SIGN"
n :-  nano
p :-  pico
f :-  femto
a :-  atto
z :-  zepto
y :-  yocto
r :-  ronto
q :-  quecto

//
// SI (International System of Units) base dimensions
//

// The special operator =!= defines a new base dimension.  This is a dimension
// that is orthogonal to all other base dimensions.  For example, the SI 
// defines base dimensions for length (m), mass (kg), time (s), etc., and other
// unit types are defined in terms of these base dimensions.  The left-hand-
// side is the human-readable name of the base dimension (e.g. "length" or
// "mass") and the right-hand-side is the fundamental unit of that dimension
// (e.g. "m" for length or "kg" for mass)

length    =!= m // The 2019 SI definition of the meter is:
meter :=  m     // "The metre, symbol m, is the SI unit of length. It is
                // defined by taking the fixed numerical value of the speed of
                // light in vacuum c to be 299_792_458 when expressed in
                // the unit m s^−1, where the second is defined in terms of
                // the caesium frequency Δν_Cs."
                //
                // In other words, a meter is the distance that light travels
                // in exactly 1/299792458 seconds.
                //
                //   Originally meant to be one ten-millionth
                //   of the length along a meridian from the equator
                //   to a pole, but the measurement was off.  
                //   
                //  Alan's notes:
                //   The earth's circumference would then be exactly 40
                //   million meters (which is a good thing to memorize.)

time      =!= s // The 2019 SI definition of the second is:
second := s     // "The second, symbol s, is the SI unit of time. It is defined
                // by taking the fixed numerical value of the caesium frequency
                // Δν_Cs, the unperturbed ground-state hyperfine transition
                // frequency of the caesium 133 atom, to be 9_192_631_770 when
                // expressed in the unit Hz, which is equal to s^−1."

mass      =!=  kg   // The standard unit of mass.
                // The 2019 SI definition of the kilogram is:
                // "The kilogram, symbol kg, is the SI unit of mass. It is
                //  defined by taking the fixed numerical value of the Planck
                //  constant h to be 6.62607015e−34 when expressed in
                //  the unit J s, which is equal to kg m^2 s^−1, where the
                //  metre and the second are defined in terms of c and Δν_Cs."
                //  (The defined frequency of the cesium-133 atom.)
                //
                // Since the redefinition of the SI in 2019, the definition of
                // the kilogram is no longer tied
                // to a physical object, but is now defined in terms of
                // Planck's constant h, the speed of light, and the meter or
                // second, which fixes the value of the kilogram in terms of
                // those constants.
                // Metrologists are now attempting to create highly-accurate
                // "watt balances" to measure and define masses accurately
                // and repeatably in any laboratory, without reference to
                // an untouchable physical object.
                //
                // Before 2019, the mass of the kilogram was defined by an
                // object called the "international prototype".
                // 
                // The "international prototype" is a cylinder of platinum
                // and platinum-iridium alloy which is kept in a series of
                // vacuum jars in a vault in France.  Its mass is *not*
                // constant.  It has gained tens of micrograms from surface
                // contamination.
                // http://www.livescience.com/26017-kilogram-gained-weight.html
                // 
                // Alan's editorializing:
                // I dislike having a prefixed unit as the base reference.
                // What a horrible decision.  Why don't you just have it go to
                // ten and make ten a little louder?
                //
                // The following comments relate to the pre-2019 definitions
                // of the kilogram:
                //
                // More Alan's editorializing:
                // This documentary tracks the attempts to tie the definition
                // of the kilogram to other repeatable constants, such as
                // Planck's constant.
                // http://stateoftheunit.com/
                //
                // The BIPM acknowledged that the kilogram, ampere, kelvin,
                // candela, and mole were troublesome definitions and wants to
                // try to redefine them in physically meaningful ways.
                // Some of these objections reflected my objections (dating back
                // decades) to some of these unit definitions.)
                //
                // http://www.bipm.org/en/measurement-units/new-si/
                // 2011 Resolution:  http://www.bipm.org/en/CGPM/db/24/1/
                // 2014 Resolution:  http://www.bipm.org/en/CGPM/db/25/1/

kilogram  := kg
gram      := 1/1000 kg

current =!= A /* The ampere, base unit of electrical current.  The 2019 SI
                 definition is:
                 "The ampere, symbol A, is the SI unit of electric current.
                  It is defined by taking the fixed numerical value of the
                  elementary charge e (in Frink, elementarycharge) to be
                  1.602176634e−19 when expressed in the unit C (coulomb),
                  which is equal to A s, where the second is defined in terms
                  of Δν_Cs."

                 With the 2019 SI redefinition, this now an exact definition
                 because the value of the elementary charge (the magnitude of
                 the charge of a proton or electron, in Frink, called
                 elementarycharge, often just called e in physics literature)
                 was defined to be exact.
              */
ampere := A     
amp :=   ampere
               /* Alan's editorializing:
                  The redefinition of the ampere in terms of an exact count
                  of elementary charges is a good thing.  However, the number
                  chosen was a little bit weird.
                 
                  Thus, the ampere is defined in
                  terms of the elementary charge and the second as the exact
                  rational number:
                   A = 5000000000000000000000000000/801088317
                     (approx. 6.2415090744607626e+18) elementarycharge / s
                  which is kind of odd because it's not an integer number of
                  electrons per second.  

                  The following comments are historical and relate to the
                  pre-2019 redefinition of the ampere:

                  Before the 2019 definition, the official definition was "The
                  ampere is that constant current which, if maintained in two
                  straight parallel conductors of infinite length, of
                  negligible circular cross-section, and placed 1 meter apart
                  in vacuum, would produce between these conductors a force
                  equal to 2 x 10^7 newton per meter of length."   

                  This was a horrible definition.  See more on that below.
                  
                  I'd actually much rather define this in terms of the charge
                  of a fundamental particle.  elementarycharge/sec
                  is less arbitrary.  I'd actually prefer to have the base
                  unit be charge instead of current.  However, I know that
                  one person's charge is another person's current due to 
                  relative motion.
                  
                  More Alan's editorializing:
                  This definition is impossible to physically reproduce.
                  There are no conductors of infinite length,
                  nor of negligible cross-section available in our universe.
                  Nor is there a perfect vacuum.
                 
                  A perfectly fine definition would count the number of
                  electrons per second.  Or just define it exactly as such.
                               
                  Other standards like the astronomical unit (see later in
                  this file) used to use vague, variable, terrible definitions
                  like that of the ampere but finally defined it in exact
                  terms, as a number of meters.

                  The ampere could simply be defined as an exact number of
                  electron charges per second and be perfectly clear.  All
                  other electrical units would be defined exactly in terms of
                  that definition.  Why bother with anything but an exact
                  definition?  While it's hard to count individual electrons,
                  that definition can be made exactly precise.  A physically
                  unrealizable definition is not of much use to anyone.
                               
                  In 2011 and 2014, the CGPM acknowledged that this is an
                  untenable definition and is working on a better
                  definition that might be accepted as a multiple of the
                  fundamental electron charge in 2018.
                  
                  http://www.bipm.org/en/measurement-units/new-si/
                  2011 Resolution:  http://www.bipm.org/en/CGPM/db/24/1/
                  2014 Resolution:  http://www.bipm.org/en/CGPM/db/25/1/
                  
                  An article called this definition of the ampere a
                  "metrological embarrassment".
                  
                  See: http://phys.org/news/2016-08-ampere.html
                  http://phys.org/news/2008-02-switchyard-electrons.html
                */

temperature =!= K  // The kelvin is the unit of temperature.
kelvin := K     // The kelvin was redefined in 2019 as:
                // "The kelvin, symbol K, is the SI unit of thermodynamic
                // temperature. It is defined by taking the fixed numerical
                // value of the Boltzmann constant k to be 1.380649e−23 when
                // expressed in the unit J K^−1, which is equal to
                // kg m^2 s^−2 K^−1, where the kilogram, metre and second are
                // defined in terms of h, c and Δν_Cs." (The defined frequency
                // of the cesium-133 atom.)
                
                // In the SI, it was decided by the 13th CGPM that:
                //  "1. the unit of thermodynamic temperature is denoted by
                //       the name "kelvin" and its symbol is "K";
                //   2. the same name and the same symbol are used to express
                //       a temperature interval;
                //   3. a temperature interval may also be expressed in 
                //       degrees Celsius"
                //
                //   See: http://www.bipm.org/en/CGPM/db/13/3/
                //        http://www.bipm.org/en/CGPM/db/13/4/
                //
                //   Thus, the SI uses the same symbol for absolute
                //   thermodynamic temperature and a temperature interval.
                //
                // Before 2019, the kelvin was defined as:
                // "1/273.16 of the thermodynamic temperature of the triple
                // point of water."  Note that there is a minor discrepancy
                // between this value and the 273.15 K figure used to set
                // the zero point of the Celsius scale.  The *size* of a
                // Kelvin or a degree Celsius is the same, but you need
                // to remember that the offset point is slightly different.
                // Use the Celsius[x] functions defined below to convert
                // between these unit systems.



currency =!= dollar// The US dollar is chosen arbitrarily to be the primitive
                 //   unit of money.  The dollar must be defined for use
                 //   in the CPISource (providing historical purchasing power
                 //   of the dollar) and for CurrencySource (providing 
                 //   exchange rate information
                 //   (and things like the price of Gold)) so
                 //   you can change the fundamental unit of currency, but you
                 //   have to be able to turn it into a dollar if you want
                 //   to use these other sources.
                 // If you want to define your own base currency, and you want
                 // currency conversions to still work, you
                 // should (for now) define the base currency as its 3-letter
                 // ISO-4217 currency code (say, "EUR" or "JPY").  This will
                 // allow the 
                 // currency converter to unambiguously figure out which
                 // currency you mean.   The units "Euro", "euro", the Euro 
                 // symbol \u20ac, the Japanese Yen symbol \u00a5,
                 // the U.K. pound symbol \u0163, and "dollar" are
                 // special cases that also work.
                 //
                 // If you change your base currency, you might get a few
                 // errors about units below that are defined in terms of the
                 // dollar.  You can probably comment those out and never miss
                 // them.  If you have a 3-letter ISO code for your base
                 // currency, it'll figure out what a "dollar" is later, so
                 // you shouldn't need to hard-code in a conversion rate.


amount_of_substance =!= mol 
                
mole :=  mol    // An "amount of substance".  The 2019 SI definition is:
                // "The mole, symbol mol, is the SI unit of amount of
                //  substance. One mole contains exactly 6.02214076e23
                //  elementary entities. This number is the fixed numerical
                //  value of the Avogadro constant, N_A, when expressed in the
                //  unit mol^−1 and is called the Avogadro number.
                //  The amount of substance, symbol n, of a system is a measure
                //  of the number of specified elementary entities. An
                //  elementary entity may be an atom, a molecule, an ion, an
                //  electron, any other particle or specified group of
                //  particles."
                //
                // A mole is referred to as an "amount of substance" which
                // is simply a count of the "elementary entities" in a system.
                // As of the 2019 redefinition of the SI, a mol is now
                // specified to have exactly 6.02214076ee23 items, which is
                // an exactly-defined integer.
                //
                // Previous to 2019, the mol was defined as:
                // The amount of substance of a system which contains as many
                //   elementary entities as there are atoms in 0.012 kg of
                //   carbon 12.  The elementary entities must be specified and
                //   may be atoms, molecules, ions, electrons, or other
                //   particles or groups of particles.  It is understood that
                //   unbound atoms of carbon 12, at rest and in the ground
                //   state, are referred to.
                //
                // Alan's editorializing:
                //   As useful as a mole may be, I really think that a mole is
                //   insufficient by itself.  It has to be a mole OF
                //   something.  How do you represent that?  It'll likely
                //   require an object that implements some interface and
                //   overloaded operators so you can still write stuff like
                //   "1 mol carbon"
                // 
                //   I also think that the definition of a mol is another 
                //   place where the SI made an unnecessary addition of a new
                //   fundamental dimension that is not required to make an 
                //   orthogonal system.  (The mol was introduced as its own 
                //   base unit with the 14th CGPM in 1971). 
                //
                //   A mol is actually just a dimensionless count 
                //   (of about 6.02*10^23 "things", be they atoms, molecules,
                //   etc.)  See the definition of the "avogadro" unit below 
                //   for the (as of 2019) exactly-defined value of this
                //   constant.
                //  
                //   It is thus just essentially a dimensionless number and it
                //   introduces artificiality to make it its own fundamental 
                //   base unit.
                //
                //   The only "meaning" in a mol is that you're working with
                //   6.02*10^23 things instead of one thing.  A mol could 
                //   easily be a derived dimensionless unit whose value is 
                //   equal to Avogadro's number.  (As essentially it was up 
                //   until 1971.)  It's just a "practical" unit to give
                //   a "practical" size, not because it represents a new 
                //   fundamental dimension of measurement.  
                // 
                //   As a practical matter, what it did before 2019 was to tie
                //   a more-easily(?) measurable quantity, that of a mass, 
                //   (0.012 kg of carbon-12) and thus forced a value for 
                //   Avogadro's number, one that may have been hard to count.
                //
                //   It's also odd in that it's the only definition that says
                //   it's incomplete by itself and that you must specify
                //   a mole of some specific particle or molecule.  Yet no
                //   provisions are made for unambiguously specifying how
                //   substances are identified (e.g. normalized names.)
                //   As a result, there is no standardized definition for
                //   communication and writing of a quantity of a specific
                //   substance.
                //   For example,
                //   is "1 mol Li" the same as "1 mol lithium"?
                // 
                //   The fact that this rule says there's not really such
                //   a thing as a (raw) mol, means that there's not one mol,
                //   but an infinite number of different mols, a mol of
                //   lithium being a totally different thing than a mol of
                //   fluorine, and essentially thus incommensurable.
                //
                //   Poor definition.
              

radian := 1     // The angle subtended at the center of a circle by an arc
                //   equal in length to the radius of the circle.
                // A circle thus subtends an angle of 2 pi radians.
                //
                // Alan's editorializing:
                // Despite what other units programs might have you believe, 
                // radians ARE dimensionless units and making them their own
                // unit leads to all sorts of arbitrary convolutions in
                // calculations (at the possible expense of some inclarity if
                // you don't know what you're doing.)
                // If you really want radians to be a fundamental unit,
                // replace the above with "angle =!= radian"
                // (This will give you a bit of artificiality in calculations.)
                //
                // The radian was actually a fundamental base unit in the SI
                // up until 1974, when they changed it, making it no longer
                // be a special unit, but just a dimensionless number (which
                // it is.)  See the definition of the "Hz" below for a
                // discussion of how this broke the SI's definitions of
                // basic circular / sinusoidal measures, though.

sr := 1         // Solid angle which cuts off an area of the surface of
steradian :=  sr//   the sphere equal to that of a square with sides of
                //   length equal to the radius of the sphere.
                // A sphere thus subtends 4 pi steradians.
                // Also a dimensionless unit (length^2/length^2)
                // If you have radians as a fundamental unit, and want to
                // have steradians tracked correctly, replace the first
                // definition with
                // sr := radian^2

information =!= bit  // Basic unit of information (entropy).
                //
                //  Alan's editorializing:  I'm considering changing 
                //  bits to be dimensionless units--it makes problems in
                //  information theory come out more reasonably.

luminous_intensity =!= cd
candela := cd   // unit of luminous intensity.  The official 2019 SI definition:
                // "The candela, symbol cd, is the SI unit of luminous
                // intensity in a given direction.  It is defined by taking
                // the fixed numerical value of the luminous efficacy of
                // monochromatic radiation of frequency 540e12 Hz, K_cd, to be
                // 683 when expressed in the unit lm W^−1, which is equal to
                // cd sr W^−1 , or cd sr kg^−1 m^−2 s^3, where the kilogram,
                // metre and second are defined in terms of h, c and Δν_Cs."
                //
                // Or, previously to 2019, and perhaps more clearly,
                // "The candela is the luminous intensity, in a given 
                //   direction, of a source that emits monochromatic radiation
                //   of frequency 540 x 10^12 hertz and that has a radiant 
                //   intensity in that direction of 1/683 watt per steradian."
                //
                //   (This differs from radiant
                //   intensity (W/sr) in that it is adjusted for human
                //   perceptual dependence on wavelength.  The frequency of
                //   540e12 Hz (yellow) is where human perception is most
                //   efficient.)
                //  
                // Alan's editorializing:
                //   I think the candela is a scam, and I am completely
                //   opposed to it.  Some good-for-nothing lighting "engineers"
                //   or psychologists probably got this perceptually-rigged
                //   abomination into the whole otherwise scientific endeavor.
                //
                //   What an unbelievably useless and stupid unit.  Is light
                //   at 540.00000001 x 10^12 Hz (or any other frequency) zero
                //   candela?  Is this expected to be an impulse function at
                //   this frequency?  Oh, wait, the Heisenberg Uncertainty
                //   Principle makes this impossible.  No mention for
                //   correction (ideally along the blackbody curve) for other
                //   wavelengths?  Damn you, 16th CGPM!  Damn you all to hell!
                //
                //   Other bodies have attempted to define curves, often based
                //   on studies of human perception, to try and define the
                //   obvious deficiencies of this inadequate definition of the
                //   candela at anything more than this infinitesimal point.
                //   However, these are completely outside of any official SI
                //   definition, so no authoritative definition is possible.
                //   Bodies like the International Commission for Illumination
                //   (CIE) made an attempt with their various colorspaces, 
                //   including "CIE 1931" and later versions that are more
                //   accurate but actually used less often.
                //
                //   The most-commonly used, CIE 1931, is long known to be off
                //   by a factor of 7 from average human perception at short
                //   wavelengths, (compare it to the 1978 definition at
                //   400 nm) and is arbitrarily truncated before the 
                //   limits of human perception.  In addition, no one
                //   perceptually-weighted curve is possible because the human
                //   eye is differently sensitive for photopic (bright-light,
                //   cone cells) and scotopic (dark-adapted, rod cells), or
                //   if the illumination occurs over narrower or wider fields.
                //   Many incremental improvements on these systems have been
                //   proposed, but none are part of the authoritative,
                //   oversimplified definition of the candela, making it 
                //   useless for unambiguous definitions that can be agreed
                //   upon or binding to any party.  Pronouncements of the CIE
                //   are in no way binding on the BIPM, nor vice-versa, and the
                //   CIE has a proliferation of "standard curves," which all
                //   disagree with each other.  Agreements to use one
                //   curve or another thus have to be agreed *outside* the
                //   definitions of the SI, and, of course, parties can 
                //   disagree on which curve to use.  You can use CIE 1931,
                //   or CIE 1978, or the "CIE 1988 Modified 2° Spectral
                //   Luminous Efficiency Function for Photopic Vision" or the
                //   2005 improvements by Sharpe, Stockman, Jagla & Jägle, 
                //   or ISO 23539:2005(E), or something else...
                //   
                //   If you can point me to *anywhere* that the BIPM clearly
                //   mandates and defines a *single* luminosity function to 
                //   unambiguously define the candela, please
                //   send it to me (eliasen@mindspring.com).  Hint: they don't.
                //   You'll find that they all weasel out of an authoritative
                //   definition by saying "approved the use of" (usually 
                //   multiple functions) or citing a couple of acceptable,
                //   non-agreeing options and saying one may be "preferred".  
                //   If they define more than one allowed function, then
                //   there's obviously no single definition of "candela".
                //   If they're not absolutely clear whether you use the
                //   photopic or scotopic function, then they've defined two
                //   different candelas, which better be named different
                //   things.  You can't have two different definitions of a
                //   meter, or a candela.  And even the CIE notes that 
                //   "for mesopic vision, there is at present no agreed method
                //    of weighting, but this problem is currently being 
                //    investigated by the CIE."
                // http://www.bipm.org/utils/en/pdf/Monographie1983-1.pdf
                //
                //   What really annoys me is that the official definitions
                //   don't come right out and say, "okay, we're sorry, this
                //   is obviously a useless definition for any other
                //   wavelength, and it doesn't even make sense for *that*
                //   wavelength.  We know.  It sucks.  The guys at the 16th
                //   CGPM went out and got drunk the night before instead of
                //   working on the definition, and they all sheepishly passed
                //   this in in the morning, and went back to bed.  They got
                //   fired later, make no doubt.  It's on our list of bugs.  
                //   We're sending in the Wolf to fix it directly.
                //   Here is the workaround, but we consider it broken
                //   and we're ashamed to have ever put it forth in this
                //   useless form and left it this way for 30 years.
                //   For now, here is one single draft standard equation to use
                //   for other wavelengths.  Download it here.  We promise
                //   that the link works and contains a computer-readable 
                //   table (though we're too sloppy to actually create a good
                //   smooth polynomial fit that would be a lot cleaner and
                //   easier for everyone) and is not some PDF of a terrible
                //   unreadable old re-scan, stashed away somewhere, making 
                //   you wonder if it's valid today, nor is it a ridiculous CIE
                //   document that you have to *pay* a hundred bucks for, when
                //   we could and absolutely need to distribute it for free.
                //
                //   "We've had the internet for weeks now.  It represents
                //   our best effort and just has to go through a bunch of
                //   political committees but we promise that we'll try to
                //   keep it constant if possible."  They never even *hint*
                //   with the definition that it's clearly insufficient, and
                //   obviously physically unrealizable in any way you look at
                //   it, which is what makes it so annoying.  There's not even
                //   a "buy freaking CIE spec xxxyyy to get the rest of the
                //   details."  Just nothing.  Figure it out yourself.
                // 
                //   Update:  On April 2, 2007, the BIPM and the CIE finally
                //   signed a vague agreement that they want to work more
                //   closely and hints at a future hope that there will
                //   someday be a single, authoritative definition accepted
                //   and mandated across both bodies.  The agreement says that
                //   the expertise for defining a standard curve will fall 
                //   under the auspices of the CIE, as "the CIE may decide to
                //   standardize."  (No certainty nor timeline; just "maybe
                //   it'll happen someday.")  Hopefully this will be followed
                //   by an official pronouncement of the BIPM that a certain
                //   curve is mandated for use in defining the candela.  And
                //   hopefully it will be better than the old 1931 curve.
                //   And hopefully the BIPM will, you know, maybe PUBLISH it
                //   somewhere instead of pointing at the root of another web
                //   site and saying "it's one of the documents hidden
                //   somewhere over there but we're not going to tell you
                //   which and we want to see your face when you realize you
                //   have to buy random documents at a hundred dollars a pop."
                //
                //   Don't hold your breath, though.  It's been 30 years since
                //   the modern definition of the candela just to get to this
                //   point.  See:
                //  http://www.bipm.org/utils/common/pdf/bipm-cie_agreement.pdf
                //  http://www.bipm.org/utils/en/pdf/SIApp2_cd_en.pdf
                //
                //  The latter hints that perhaps one of the equations in 
                //  CIE S 010/E:2004 (possibly superseded) / ISO 23539:2005(E) 
                //  is maybe suggested by them, (but there are conflicting
                //  definitions therein, and none are mandated) and they're 
                //  not going to help you find it, and when you do, you're 
                //  going to realize that the CIE clowns are going to charge 
                //  you over a hundred bucks for it.  For something that needs
                //  to be free and accessible for anyone trying to understand
                //  this standard.
                //
                //  We won't tell you if it's been superseded.  We
                //  won't point you to an authoritative definition.  We'll
                //  cite several equations and leave you to pick one randomly.
                //  We want this unit to remain an unusable mystery!
                //
                //  In short, candela = EPIC FAIL.
                //
                //  Update 2019:  The official 2019 SI definition still
                //  refuses to acknowledge any of the above issues!  "Hey,
                //  we fixed the SI but left this big useless definition in it
                //  just for fun."


// Define the default symbol for the imaginary unit, that is, the square
// root of negative one.
//
// The default Unicode codepoint for the imaginary unit.
//   (DOUBLE-STRUCK ITALIC SMALL I)
\u2148 := <<IMAGINARY_UNIT>>

// Also used for the imaginary unit (especially by electrical engineers, who
// use "i" to indicate current.
//   (DOUBLE-STRUCK ITALIC SMALL J)
\u2149 := <<IMAGINARY_UNIT>>

// Redefine the letter "i" to also be the imaginary unit
i := \u2148


// Define unit combinations
 
//  The special operator ||| defines a human-readable name for a combination
// of base units.  The left-hand side is a combination of units or a unit
// name already defined, which will be used to define the dimensions of the
// unit name on the right.  Note that the description of the base units are set
// by the =!= operator (see above).

1   ||| dimensionless

m^2 ||| area
m^3 ||| volume

s^-1   ||| frequency

m s^-1 ||| velocity
m s^-2 ||| acceleration
m kg s^-1 ||| momentum

m kg s^-2    ||| force
m^2  kg s^-3 ||| power
m^-1 kg s^-2 ||| pressure
m^2  kg s^-2 ||| energy
m^2  kg s^-1 ||| angular_momentum
m^2  kg      ||| moment_of_inertia

m^3 s^-1     ||| flow

m^-3 kg      ||| mass_density
m^3  kg^-1   ||| specific_volume         // Reciprocal of mass_density

A m^-2       ||| electric_current_density

dollar kg^-1 ||| price_per_mass


// The following definition is useful if you "shadow" a unit definition with a
// local variable.  Say, you define a local variable "g" which hides the
// definition of the gram unit.  With this prefix, you can say:
//
//    unit_g
//
// and get the original unit.

unit_ :- 1

//
// Names of some numbers
//

semi    :- 1/2
demi    :- 1/2
hemi    :- 1/2
half    ::- 1/2
third   ::- 1/3
quarter ::- 1/4
eighth  ::- 1/8

uni :-   1
bi :-    2
tri :-   3

zero :=                0
one :=                 1
two :=                 2
double :=              2
three :=               3
triple :=              3
treble :=              3
four :=                4
quadruple :=           4
five :=                5
quintuple :=           5
six :=                 6
sextuple :=            6
seven :=               7
septuple :=            7
eight :=               8
nine :=                9
ten :=                 10
twenty :=              20
thirty :=              30
forty :=               40
fifty :=               50
sixty :=               60
seventy :=             70
eighty :=              80
ninety :=              90

hundred :=             100
thousand :=            1000
million :=             1ee6
billion :=             1ee9
trillion :=            1ee12
quadrillion :=         1ee15
quintillion :=         1ee18
sextillion :=          1ee21
septillion :=          1ee24
octillion :=           1ee27
nonillion :=           1ee30
noventillion :=        nonillion
decillion :=           1ee33
undecillion :=         1ee36
duodecillion :=        1ee39
tredecillion :=        1ee42
quattuordecillion :=   1ee45
quindecillion :=       1ee48
sexdecillion :=        1ee51
septendecillion :=     1ee54
octodecillion :=       1ee57
novemdecillion :=      1ee60
vigintillion :=        1ee63
centillion :=          1ee303

googol :=              1ee100

// These number terms were described by N. Chuquet and De la Roche in the 16th
// century as being successive powers of a million.  These definitions are 
// still used in most European countries.  The current US definitions for these
// numbers arose in the 17th century and don't make nearly as much sense.
// These numbers are listed in the CRC Concise Encyclopedia of Mathematics by
// Eric W. Weisstein.
brbillion :=           million^2
brtrillion :=          million^3
brquadrillion :=       million^4
brquintillion :=       million^5
brsextillion :=        million^6
brseptillion :=        million^7
broctillion :=         million^8
brnonillion :=         million^9
brnoventillion :=      brnonillion
brdecillion :=         million^10
brundecillion :=       million^11
brduodecillion :=      million^12
brtredecillion :=      million^13
brquattuordecillion := million^14
brquindecillion :=     million^15
brsexdecillion :=      million^16
brseptdecillion :=     million^17
broctodecillion :=     million^18
brnovemdecillion :=    million^19
brvigintillion :=      million^20

// These numbers fill the gaps left by the European system above.

milliard :=            1000 million
billiard :=            1000 million^2
trilliard :=           1000 million^3
quadrilliard :=        1000 million^4
quintilliard :=        1000 million^5
sextilliard :=         1000 million^6
septilliard :=         1000 million^7
octilliard :=          1000 million^8
nonilliard :=          1000 million^9
noventilliard :=       nonilliard
decilliard :=          1000 million^10

// For consistency 

brmilliard :=          milliard
brbilliard :=          billiard
brtrilliard :=         trilliard
brquadrilliard :=      quadrilliard
brquintilliard :=      quintilliard
brsextilliard :=       sextilliard
brseptilliard :=       septilliard
broctilliard :=        octilliard
brnonilliard :=        nonilliard
brnoventilliard :=     noventilliard
brdecilliard :=        decilliard

// The British Centillion would be 1ee600.  The googolplex is another 
// familiar large number equal to 10^googol.


// Indian dimensionless numbers (used in English)
// See: https://en.wikipedia.org/wiki/Indian_Numbering_System
lakh  := 100 thousand
lac   := lakh
crore := 10 million


//////////////////////////////////////////////////////////////////////////////
//                                                                          //
// Derived units which can be reduced to the primitive units                //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////

//
// Named SI derived units (officially accepted)
//

newton :=              kg m / s^2  // force
N :=                   newton
pascal :=              N/m^2       // pressure or stress
Pa :=                  pascal
joule :=               N m         // energy
J :=                   joule
watt :=                J/s         // power
W :=                   watt

J m^-2  ||| surface_tension

coulomb :=             A s         // charge
coulomb ||| charge
coulomb m^-2 ||| surface_charge_density
coulomb m^-3 ||| electric_charge_density
C :=                   coulomb

volt :=                W/A         // potential difference
V :=                   volt
volt ||| electric_potential
V / m   ||| electric_field_strength
A / m   ||| magnetic_field_strength

ohm :=                 V/A         // electrical resistance
\u2126 :=              ohm  // Official Unicode codepoint OHM SIGN
\u03a9 :=              ohm  // "Preferred" Unicode codepoint for ohm
                            // GREEK CAPITAL LETTER OMEGA
ohm ||| electric_resistance

siemens :=             A/V         // electrical conductance
S :=                   siemens
siemens ||| electric_conductance

ohm m ||| electric_resistivity  // Resistivity is a specific intrinsic
                                // property of a material that is indepenent
		                // of the size of the piece of material.
				// Also called "volume resistivity" or
				// "electrical resistivity" or 
				// "specific electrical resistance."
				// This is often written as the character rho
				// in equations.  (Which is more commonly used
				// for density in physical equations.)  See:
    // https://en.m.wikipedia.org/wiki/Electrical_resistivity_and_conductivity

siemens/m ||| electric_conductivity  // This is the inverse of
                                     // electric_resisitivity (see above.)
    // https://en.m.wikipedia.org/wiki/Electrical_resistivity_and_conductivity

farad :=               C/V         // capacitance
farad ||| capacitance

F :=                   farad
uF :=                  microfarad  // Concession to electrical engineers
                                   // without adding the questionable "u"
                                   // as a general prefix.

weber :=               V s         // magnetic flux
weber ||| magnetic_flux
Wb :=                  weber

henry :=               Wb/A        // inductance
henry ||| inductance
henries :=             henry       // Irregular plural
H :=                   henry

tesla :=               Wb/m^2      // magnetic flux density
tesla ||| magnetic_flux_density
T :=                   tesla

hertz :=               s^-1        // frequency
Hz :=                  hertz
//
// Alan's Editorializing:  Here is YET ANOTHER place where the SI made a
// really stupid definition.  Let's follow their chain of definitions, shall
// we, and see how it leads to absolutely ridiculous results.

// The Hz is currently defined simply as inverse seconds. (1/s).
//  See: https://physics.nist.gov/cuu/Units/units.html
//
// The base unit of frequency in the SI *used* to be "cycles per second".  
// This was fine and good.  However, in 1960, the BIPM made the 
// change to make the fundamental unit of frequency to
// be "Hz" which they defined as inverse seconds (without qualification.) 
//
// Then, in 1974, they changed the radian from its own base unit in the SI
// to be a dimensionless number, which it indeed is (it's a length divided by 
// a length.)  That change was correct and good in itself.
//
// However, the definition of the Hz was *not* corrected at the same
// time that the radian was changed.  Thus, we have the conflicting SI 
// definition of the radian as the dimensionless number 1 (without 
// qualification) and Hz as 1/s.  (Without qualification.)
//
// This means that, if you follow the rules of the SI,
// 1 Hz = 1/s = 1 radian/s which is simply inconsistent and violates basic
// ideas of sinusoidal motion, and is simply a stupid definition.
// The entire rest of the world, up until that point, knew that 1 Hz needs to 
// be equal to *2 pi* radians/s or be changed to mean *cycles/second* for 
// these to be reconcilable.  If you use "Hz" to mean cycles/second, say,
// in sinusoidal motion, as the world has done for a century, know that the SI
// made all your calculations wrong.  A couple of times, in different ways.
//
// This gives the wonderful situation that the SI's Hz-vs-radian/s definitions
// have meant completely different things in the timeperiods:
//
// * pre-1960
// * 1960 to 1974
// * post-1974
//
//
// Thus, anyone trying to mix the SI definitions for Hz and angular
// frequencies (e.g. radians/s) will get utterly wrong answers that don't
// match basic mathematical reality, nor match any way that Hz was ever used
// for describing, say, sinusoidal motion.
//
// Beware the SI's broken definition
// of Hz.  You should treat the radian as being correct, as a fundamental
// dimensionless property of the universe that falls out of pure math like
// the Taylor series for sin[x], and you should treat the Hz as being a 
// fundamental property of incompetence by committee.
//
// One could consider the CGPM in 1960 to have made the original mistake, 
// re-defining Hz in a way that did not reflect its meaning up to that point,
// or the CGPM in 1974 to have made the absolutely huge mistake that made 
// the whole system inconsistent and wrong, and clearly broke the definition
// of Hz-vs-radian/s used everywhere in the world, turning it into a broken,
// self-contradictory mess that it is now.
//
// Either way, if I ever develop a time machine, I'm going to go back and
// knock both groups' heads together.  At a frequency of about 1 Hz.  Or
// better yet, strap them to a wheel and tell them I'm going to spin one group
// at a frequency of 1 Hz, and the other at 1 radian/s and let them try to
// figure out which one of those stupid inconsistent definitions means what.
// Hint:  It'll depend on which time period I do it in, I guess, thanks to
// their useless inconsistent definition changes.
//
// It's as if this bunch of geniuses took a well-understood term like "day"
// and redefined it to mean "60 minutes".  It simply breaks every historical
// use, and present use, and just causes confusion and a blatant source of
// error.
//
// Frink tries to follow the most authoritative international standards bodies
// for all of its definitions.  However, when authoritative international
// standards bodies change definitions silently to make them inconsistent
// with their previous definitions and with centuries of fundamental
// mathematical definitions, then Frink would be negligent to not try to
// warn you of the huge incompatibilities in the strongest possible way.
//
// One of Frink's design goals is: "When in doubt, be pedantic.  Explain to
// people how their calculation might be problematic and help them to write
// it in a more standardized, unambiguous way."  The re-definition of the Hz
// is an actively damaging change that has to be warned about in the strongest
// possible terms.
//
// In summary:  Frink grudgingly follows the SI's ridiculous, broken definition
// of "Hz".  You should not use "Hz".  The SI's definition of Hz should be
// considered harmful and broken.  Instead, if you're talking about circular
// or sinusoidal motion, use terms like "cycles/sec" "revolutions/s",
// "rpm", "rps", "circle/min", etc. and Frink will do the right thing because 
// it doesn't involve the stupid SI definition that doesn't match what any
// human knows about sinusoidal motion.
//
// WARNING:  Use of "Hz" will cause communication problems, errors, and make
// one party or another look insane in the eyes of the other.
//
// In other words, if you use the Hz in the way it's currently defined by the 
// SI, as equivalent to 1 radian/s, you can point to the SI definitions and
// prove that you follow their definitions precisely.  And your physics 
// teacher will *still* fail you and your clients will think you're completely
// incompetent because 1 Hz = 2 pi radians/s.  And it has for centuries.
// You are both simultaneously both right and both wrong.  
// You cannot win.
// You are perfectly right.  You are perfectly wrong.  You look dumb and
// unreasonable.  The person arguing the opposite looks dumb and unreasonable.
//
// Hz == YOU CANNOT WIN
//
// (Insert "IT'S A TRAP" image here.)


cesiumfrequency := 9_192_631_770 s^-1  // The cesium frequency which defines
                             // the second:  The unperturbed ground-state
                             // hyperfine transition frequency of the caesium
                             // 133 atom

Δν_Cs := cesiumfrequency

J/K          ||| heat_capacity
J kg^-1 K^-1 ||| specific_heat_capacity

//
// time
//

sec :=                 s
minute :=              60 s
min :=                 minute
hour :=                60 min
hr :=                  hour
day :=                 24 hr
d :=                   day
da :=                  day
week :=                7 day
wk :=                  week
sennight :=            7 day
fortnight :=           14 day
blink :=               1ee-5 day  // Actual human blink takes 1/3 second      
ce :=                  1ee-2 day

//
// units derived easily from SI units
//

gm :=                  gram
g :=                   gram
tonne :=               1000 kg
t :=                   tonne
metricton :=           tonne
sthene :=              tonne m / s^2
funal :=               sthene
pieze :=               sthene / m^2
quintal :=             100 kg
bar :=                 1ee5 Pa    // About 1 atm
vac :=                 millibar
micron :=              micrometer// One millionth of a meter
bicron :=              picometer // One brbillionth of a meter
cc :=                  cm^3
are :=                 100 m^2
liter :=               1000 cc      // The liter was defined in 1901 as the
oldliter :=            1.000028 dm^3// space occupied by 1 kg of pure water at
l :=                   liter        // the temperature of its maximum density
                                     // under a pressure of 1 atm.  This was
                                     // supposed to be 1000 cubic cm, but it
                                     // was discovered that the original
                                     // measurement was off.  In 1964, the
                                     // liter was redefined to be exactly 1000
                                     // cubic centimeters.
L :=                   liter  // This unit and its symbol l were adopted by 
                              // the CIPM in 1879. The alternative symbol for
                              // the liter, L, was adopted by the CGPM in 1979
                              // in order to avoid the risk of confusion 
                              // between the letter l and the number 1. Thus,
                              // although both l and L are internationally 
                              // accepted symbols for the liter, to avoid this
                              // risk the preferred symbol for use in the 
                              // United States is L.
mho :=                 siemens   // Inverse of ohm, hence ohm spelled backward
galvat :=              ampere    // Named after Luigi Galvani

angstrom :=            1ee-10 m   // Convenient for describing molecular sizes
\u212b :=              angstrom   // Official Unicode codepoint for
                                  // Angstrom symbol: ANGSTROM SIGN
\u00c5 :=              angstrom   // "Preferred" Unicode codepoint for
                                  // Angstrom symbol:
                                  // LATIN CAPITAL LETTER A WITH RING ABOVE

xunit :=               1.00202e-13 meter// Used for measuring wavelengths
siegbahn :=            xunit            // of X-rays.  It is defined to be
                                         // 1/3029.45 of the spacing of calcite
                                         // planes at 18 degC.  It was intended
                                         // to be exactly 1e-13 m, but was
                                         // later found to be off slightly.
fermi :=               1ee-15 m   // Convenient for describing nuclear sizes
                                  //   Nuclear radius is from 1 to 10 fermis
barn :=                1ee-28 m^2 // Used to measure cross section for
                                  //   particle physics collision, said to 
                                  //   have originated in the phrase "big as
                                  //   a barn".
shed :=                1ee-24 barn// Defined to be a smaller companion to the
                                  //   barn, but it's too small to be of
                                  //   much use.
brewster :=            micron^2/N // measures stress-optical coef
diopter :=             m^-1       // measures reciprocal of lens focal length
fresnel :=             1ee12 Hz   // occasionally used in spectroscopy
shake :=               1ee-8 sec
svedberg :=            1ee-13 s   // Used for measuring the sedimentation
                                  // coefficient for centrifuging.
gamma :=               microgram
lambda :=              microliter
spat :=                1ee12 m    // Rarely used for astronomical measurements
preece :=              1ee13 ohm m// resistivity
planck :=              J s        // action of one joule over one second
sturgeon :=            henry^-1   // magnetic reluctance
sturgeon ||| magnetic_reluctance

daraf :=               1/farad    // elastance (farad spelled backwards)
leo :=                 10 m/s^2
poiseuille :=          N s / m^2  // viscosity
mayer :=               J/(g K)    // specific heat capacity
mired :=               microK^-1  // reciprocal color temperature.  The name
                                  //   abbreviates micro reciprocal degree.
crocodile :=           megavolt   // used informally in UK physics labs
metricounce :=         25 g
mounce :=              metricounce
finsenunit :=          1ee5 W/m^2 // Measures intensity of ultraviolet light
                                  // with wavelength 296.7 nm.
fluxunit :=            1ee-26 W/(m^2 Hz)// Used in radio astronomy to measure
                                      //   the energy incident on the receiving
                                      //   body across a specified frequency
                                      //   bandwidth.  [12]
jansky :=              fluxunit  // K. G. Jansky identified radio waves coming
Jy :=                  jansky    // from outer space in 1931.

// Basic constants

pi :=                  3.141592653589793238
\u03c0 :=              pi              // Unicode character for pi
                                       // as a mathematical constant
                                       // GREEK SMALL LETTER PI

e :=         2.71828182845904523536    // Base of natural logarithm
                                       // 'e' was previously used to be
                                       // the charge of the electron, but
                                       // changed to this.  Mathematicians and
                                       // particle physicists may battle this
                                       // out.

EulerMascheroniConstant := 0.577215664901532860606512090082402431042159335939923598805767234884867726777664670936947063291746749
                // See http://en.wikipedia.org/wiki/Euler-Mascheroni_constant

c :=                   299792458 m/s   // speed of light in vacuum (exact)
                                       // The speed of light is the same to
                                       // all observers in all local frames.
                                       // The relation between the meter and
                                       // the second is thus fixed by this
                                       // definition.  This is good.

light :=               c
lightspeed :=          c               // sure, why not.

mu0 :=                1.25663706212e-6 N/A^2    // permeability of vacuum
                      // 2018 CODATA value after 2019 redefinition of SI base
                      // units.  Uncertainty is +/- 19 in the last 2 digits.
                      //
                      //  https://physics.nist.gov/cgi-bin/cuu/Value?eqmu0
                      //
                      // Before the 2019 SI redefinition,
                      // mu0 was a defined "exact" constant (but without a
                      // finite decimal representation because pi is
                      // transcendental) with the exact defining value:
                      //   4 pi 1ee-7 N/A^2
                      //
                      //  The value of the ampere and other electrical units
                      // were indirectly defined through this definition.
                      //
                      // After the redefinition, it now is an "experimentally
                      // determined" value with an uncertainty.
                      // It can be written in terms of other units as:
                      //  mu0 := 4 pi alpha hbar / (elementarycharge^2 c)
                      // or
                      //  mu0 := 2 alpha h / (elementarycharge^2 c)
		      // The latter is maybe preferable because it eliminates
		      // the transcendental number pi

mu\u2080 :=             mu0             // "mu" Unicode subscript 0
\u03bc\u2080 :=         mu0             // Unicode mu Unicode subscript 0
magneticconstant :=     mu0             
permeabilityofvacuum := mu0

mu0 ||| permeability

epsilon0 :=           8.8541878128e-12 F/m   // permittivity of vacuum
                      // This is the 2018 CODATA value after 2019 redefinition
                      // of SI base units.  Uncertainty is +/- 13 in the last
                      // 2 digits.
                      //  https://physics.nist.gov/cgi-bin/cuu/Value?eqep0
                      //
                      // Before the 2019 SI redefinition, epsilon0 was defined
                      // in terms of the "exact" definitions of mu0 and c,
                      // with the relation
                      //   epsilon0 := 1/(mu0 c^2)
                      //
                      // After the 2019 SI redefinition, it is now an inexact
                      // "experimentally determined" value with an uncertainty.
                      
\u03b50 :=              epsilon0      // Unicode epsilon plus normal zero
\u03b5\u2080 :=         epsilon0      // Unicode epsilon Unicode subscript zero
permittivityofvacuum := epsilon0
electricconstant :=     epsilon0
coulombconst :=        1/(4 pi epsilon0) // listed as "k_e" or sometimes "k"
                                         // The repulsive electric force 
                                         // between two charged pointlike 
                                         // particles is:
                                         // coulombconst q1 q2 / dist^2
k_e       := coulombconst
k\u2091   := coulombconst                // k Unicode subscript e

// Define a combination of units with the same units of measure as the
// coulomb constant so it will be suggested.
coulombconst ||| electric_force_constant

epsilon0 ||| permittivity

Z0 := mu0 c             // Characteristic impedance of vacuum
Z\u2080  := Z0          // Z Unicode subscript zero
impedanceofvacuum :=  Z0

Y0 := 1/(mu0 c)         // Characteristic admittance of vacuum
Y\u2080  := Y0          // Y Unicode subscript zero
admittanceofvacuum := Y0
            
energy :=              c^2             // convert mass to energy

elementarycharge :=   1.602176634ee-19 C // Defined exactly by the SI rules
                                         // that take effect on May 20, 2019
                               // https://physics.nist.gov/cgi-bin/cuu/Value?e
                                         // also called "e"
                                         // but that's reserved for the
                                         // base of the natural logarithm.

electroncharge :=      - elementarycharge 
protoncharge :=        + elementarycharge
neutroncharge :=       0 elementarycharge
upquarkcharge :=    +2/3 elementarycharge
downquarkcharge :=  -1/3 elementarycharge

h :=     6.62607015ee-34 J s  // Planck's constant, exactly
                              // defined by the SI rules that take effect
                              // on May 20, 2019.
                              // https://physics.nist.gov/cgi-bin/cuu/Value?h
                              //
                              // As h is now exactly defined, as are the speed
                              // of light c, and the length of the meter m,
                              // this makes the definition of the kilogram
                              // no longer exactly-defined, but
                              // an experimentally-measured value.
                              // 
                              //
                              // You can see Jean-Phillipe Uzan talk about the
                              // role of Planck's constant in physics as it
                              // relates to the 2019 SI redefinitions here:
                              // https://www.youtube.com/watch?v=yhgb23tAFFs

plancksconstant :=     h
\u210e :=              h          // Official Unicode char for Planck's const.
hbar :=                h / (2 pi)
\u210f :=              hbar       // Official Unicode char for Planck/2 pi

classicalElectronRadius := 2.8179403262e-15 m   // 2018 CODATA value
                            // https://physics.nist.gov/cgi-bin/cuu/Value?re
                            // uncertainty is +/- 13 in the last 2 digits
r_e     := classicalElectronRadius
r\u2091 := classicalElectronRadius   // r Unicode subscript e

ThomsonCrossSection :=  6.6524587321e-29 m^2    // 2018 CODATA value
                    // https://physics.nist.gov/cgi-bin/cuu/Value?sigmae
                    // The "classical" cross-section of an electron when
                    // illuminated by radiation.
                    // Uncertainty is +/- 60 in the last 2 digits.

sigma_e      := ThomsonCrossSection
sigma\u2091  := ThomsonCrossSection  // "sigma" Unicode subscript e
\u03c3\u2091 := ThomsonCrossSection  // Unicode sigma Unicode subscript e
sigma_t      := ThomsonCrossSection
sigma\u209c  := ThomsonCrossSection  // "sigma" Unicode subscript t
\u03c3\u209c := ThomsonCrossSection  // Unicode sigma Unicode subscript t

G :=             6.67430e-11 N m^2 / kg^2  // Newtonian gravity constant
        // From 2018 CODATA figures.  There is a standard uncertainty in the
        // last two figures of +/- 15.  The uncertainty decreased from 31
        // from the 2014 value.
        // Given by https://physics.nist.gov/cgi-bin/cuu/Value?bg
        // The gravitational force between the centers of two (spherelike)
        // bodies is: 
        // G mass1 mass2 / dist^2

gravitationalconstant := G

// Define a combination of units with the same units of measure as the
// gravitational constant so it will be suggested.
G ||| gravitational_constant


au :=                  149597870700 m   // astronomical unit, approximately 
                                        // the average radius of earth's orbit
                                        // around the sun.

                       // Alan's editorializing:
                       // Hooray!  In August 2012, the IAU finally
                       // voted on a single exact number for this. 

    // http://www.iau.org/static/resolutions/IAU2012_English.pdf
    // http://www.nature.com/news/the-astronomical-unit-gets-fixed-1.11416

                       // Previously,
                       // the Frankensteinian definition was:

                       // "the distance from the Sun at which a particle of
                       //  negligible mass, in an unperturbed circular orbit,
                       //  would have an orbital period of 365.2568983 days
                       // (a Gaussian year)."  
                       // 
                       // Gee, thanks for that helpful
                       // definition, guys.  Never mind that the sun's mass
                       // is changing or that the definition is experimentally
                       // impossible to calibrate to.
                       // 
                       // Thus, they had to post a "Current Best Estimate"
                       // based on external research.  The best
                       // estimate published by the IAU for 2009 was the value
                       // above, so Frink just went from an imprecise number
                       // (with uncertainty of about 3 m) to an exact integer.
                       // Previous citation:
                       // http://maia.usno.navy.mil/NSFA/NSFA_cbe.html

ua := au               // The SI defines "ua" as the international symbol
                       // for the astronomical unit, but the IAU recommends
                       // that "au" be used.  See 2012 resolution B2 here:
              // http://www.iau.org/static/resolutions/IAU2012_English.pdf
   

astronomicalunit :=    au


//
// angular measure
//

circle :=              2 pi radian
cycle  :=              circle
turn :=                circle
revolution :=          circle
rev :=                 circle

degree :=              1/360 circle
arcdegree :=           degree
deg    :=              degree
\u00B0 :=              degree          // Unicode degree (angle) symbol
arcdeg :=              arcdegree
arcminute :=           1/60 degree
arcmin :=              arcminute
arcsecond :=           1/60 arcmin
arcsec :=              arcsecond
mas :=                 milliarcsecond
rightangle :=          90 degrees
quadrant :=            1/4 circle
quintant :=            1/5 circle
sextant :=             1/6 circle

sign :=                1/12 circle  // Angular extent of one sign of the zodiac
pulsatance :=          radian / sec
gon :=                 1/100 rightangle // measure of grade
grade :=               gon
centesimalminute :=    1/100 grade
centesimalsecond :=    1/100 centesimalminute
milangle :=            1/6400 circle    // Official NIST definition.
                                         // Another choice is 1ee-3 radian.
pointangle :=          1/32 circle
centrad :=             1/100 radian // Used for angular deviation of light
                                    // through a prism.

brad := 1/256 circle  // Binary radian--used to fit angular measurements into
                      // a byte.  Questionable but what the hell.

//
// Solid angle measure
//

sphere :=              4 pi sr
squaredegree :=        1/180^2 pi^2 sr
squareminute :=        1/60^2 squaredegree
squaresecond :=        1/60^2 squareminute
squarearcmin :=        squareminute
squarearcsec :=        squaresecond
sphericalrightangle := 1/2 pi sr
octant :=              1/2 pi sr

//
// Concentration measures
//

percent :=             1/100
proof :=               1/200     // Alcohol content measured by volume at
                                 // 60 degrees Fahrenheit.  This is a USA
                                 // measure.  In Europe proof=percent.
ppm :=                 1ee-6
partspermillion :=     ppm
ppb :=                 1ee-9
partsperbillion :=     ppb      // USA billion
ppt :=                 1ee-12
partspertrillion :=    ppt      // USA trillion
karat :=               1/24     // measure of gold purity
fine :=                1/1000   // Measure of gold purity
caratgold :=           karat
gammil :=              mg/l
basispoint :=          1/100 percent// Used in finance 

//
// Temperature difference
// The units below are NOT an absolute temperature measurement in Fahrenheit,
// but represents the size of a degree in the specified systems.
degcelsius :=          K
degreeCelsius :=       K     // Per https://physics.nist.gov/Pubs/SP811/sec04.html#4.2.1.1     

  // This is allowable in the SI under resolutions 3 and 4 of the 13th CGPM:
  // http://www.bipm.org/en/CGPM/db/13/3/

degC :=                K     // The *size* of a degree in the Celsius scale.
                             // This is identical to the size of a Kelvin.
                             // WARNING: This should only be used when 
                             // you're indicating the *difference* between
                             // two temperatures, (say, how much energy to 
                             // raise the temperature of a gram of water by 5
                             // degrees Celsius, *not* for absolute
                             // temperatures.  (I wonder if they should go 
                             //   entirely to eliminate this confusion...)
                             // For calculating absolute temperatures, use
                             // the Celsius[] or C[] functions below.
                             //
                                 // In 1741  Anders Celsius introduced a
                                 // Temperature scale with water boiling at 0
                                 // degrees and freezing at 100 degrees at
                                 // standard pressure.  After his death the
                                 // fixed points were reversed and the scale
                                 // was called the centigrade scale.  Due to 
                                 // the difficulty of accurately measuring the
                                 // temperature of melting ice at standard
                                 // pressure, the centigrade scale was replaced
                                 // in 1954 by the Celsius scale which is
                                 // defined by subtracting 273.15 from the
                                 // temperature in Kelvins.  This definition
                                 // differed slightly from the old centigrade
                                 // definition, but the Kelvin scale depends on
                                 // the triple point of water rather than a
                                 // melting point, so it can be measured
                                 // accurately.

zerocelsius := 273.15ee0 K   // In 2019, defined exactly.
                             // The triple point of water is now
                             // experimentally measured.
                             //   The BIPM brochure states that "The previous
                             // definition of the kelvin set the temperature
                             // of the triple point of water, T_TPW, to be
                             // exactly 273.16 K. Due to the fact that the
                             // present definition of the kelvin fixes the
                             // numerical value of k instead of T_TPW , the
                             // latter must now be determined experimentally.
                             // At the time of adopting the present definition
                             // T_TPW was equal to 273.16 K with a relative
                             // standard uncertainty of 3.7 × 10 −7 based on
                             // measurements of k made prior to the
                             // redefinition."
                           // https://www.bipm.org/en/publications/si-brochure/

                             // This means that the triple point of water is
                             // experimentally measured to be
                             // 273.1600 K with an uncertainty of +/- 1 in the
                             // last digit.
                             // 
                             // Previously, this was defined by
                             // the 10th CGPM, 1954, Resolution 3;
                             // CR, 79.  The triple point of water was defined
                             // at the same time to be 273.16 Kelvin, and
                             // the reference temperature 273.15 K (the ice
                             // point) to be the scale difference between
                             // Kelvin and Celsius.  So, the size of a Kelvin
                             // and a degree Celsius are the same, but
                             // the zero point of the Celsius scale is actually
                             // set to .01 Kelvin below the triple point.
                        

degfahrenheit :=  5/9 degC   // The *size* of a degree in the Fahrenheit scale.
degreeFahrenheit := degfahrenheit // The *size* of a degree in the Fahrenheit scale.
degF :=        degfahrenheit // WARNING: These should only be used when 
                             // you're indicating the *difference* between
                             // two temperatures, (say, how much energy to 
                             // raise the temperature of a gram of water by 5
                             // degrees Fahrenheit, *not* for absolute
                             // temperatures.  (I wonder if they should go 
                             //   entirely to eliminate this confusion...)
                             // For calculating absolute temperatures, use
                             // the Fahrenheit[] or F[] functions below.
                             //
                             // Fahrenheit defined his temperature scale
                             // by setting 0 to the coldest temperature
                             // he could produce and by setting 96 degrees
                             // to body heat (for reasons unknown).


\u2109 :=              degfahrenheit  // Single Unicode codepoint for 
                                      // DEGREE FAHRENHEIT

degreesRankine :=      5/9 K
degreesrankine :=      degreesRankine   // The Rankine scale has the 
degrankine :=          degreesRankine   // Fahrenheit degree, but its zero
degreerankine :=       degrankine       // is at absolute zero.
degR :=                degrankine
Rankine :=             degreesrankine

degreaumur :=          10/8 degC // The Reaumur scale was used in Europe and
                                 // particularly in France.  It is defined
                                 // to be 0 at the freezing point of water
                                 // and 80 at the boiling point.  Reaumur
                                 // apparently selected 80 because it is
                                 // divisible by many numbers.

// Function for converting Fahrenheit to/from standard units

// This is a less legible version of the revised function below
//Fahrenheit[x] := (x conforms K) ? ((x - zerocelsius) / K) * 9/5 + 32 : ((x conforms 1) ? ((x-32) * 5/9) K + zerocelsius : "Error")

Fahrenheit[x] := 
{ 
   if (x conforms K)  // If x is already a temperature, convert to F
      return ((x - zerocelsius) / K) * 9/5 + 32 
   else
      if (x conforms 1) // If x is a pure number, treat as Fahrenheit degrees
         return ((x-32) * 5/9) K + zerocelsius
      else
         return "Error"
}

// TODO: Change the implementation of the following idiom so that it aliases 
// the function instead of chaining function calls. 
F[x] := Fahrenheit[x]

// Function for converting Celsius to/from standard units
Celsius[x] := (x conforms K) ? (x-zerocelsius) / K : ((x conforms 1) ? (x K + zerocelsius) : "Error")

C[x] := Celsius[x]

Reaumur[x] := (x conforms K) ? (8/10 (x-zerocelsius)) / K : ((x conforms 1) ? (10/8 * x * K + zerocelsius) : "Error")

//   Physical constants
//

gravity :=             980665/100000 m/s^2  // std acceleration of gravity 
                                            // (exact)
                           // see https://physics.nist.gov/cgi-bin/cuu/Value?gn
g_n :=                 gravity
g\u2099 :=             gravity  // g with Unicode subscript n
gee :=                 gravity
gravities :=           gravity              // Irregular plural
force :=               gravity         // use to turn masses into forces

// Various conventional values

atm :=                 101325 Pa       // Standard atmospheric pressure (exact)
                       // See https://physics.nist.gov/cgi-bin/cuu/Value?stdatm
atmosphere :=          atm
Hg :=         13.5951 gram / cm^3      // Density of mercury (defined)
mercurydensity :=      Hg
water :=               gram / cm^3     // Standard density of water (defined)
H2O :=                 water
H\u2082O :=            water           // H Unicode subscript 2 O
wc :=                  water           // water column
mach :=                331.46 m/s      // speed of sound in dry air at STP
standardtemp :=        273.15ee0 K     // standard temperature, exactly defined
stdtemp :=             standardtemp

// Physico-chemical constants

// Atomic mass unit is given by the 2018 CODATA value
// https://physics.nist.gov/cgi-bin/cuu/Value?u
atomicmassunit :=      1.66053906660e-27 kg   // atomic mass unit 
                                       // error is +/- 50 in last 2 digits
                                       // (defined to be 1/12 of the mass of
                                       //  carbon 12)

m_u :=                 atomicmassunit
u :=                   atomicmassunit  // 1/12 of the mass of carbon 12)
m\u1d64 :=             atomicmassunit  // m Unicode subscript u
amu :=                 atomicmassunit

amu_chem :=            1.66026e-27 kg  // 1/16 of the weighted average mass of
                                       //   the 3 naturally occurring neutral
                                       //   isotopes of oxygen

amu_phys :=            1.65981e-27 kg  // 1/16 of the mass of a neutral
                                       //   oxygen 16 atom

dalton :=              u               // Maybe this should be amu_chem?


avogadro :=            6.02214076ee23 mol^-1  // Number of items in a mole
                                              // Defined exactly by the SI
                                              // rules that go into effect
                                              // May 20, 2019
                              //  https://physics.nist.gov/cgi-bin/cuu/Value?na
N_A :=                 avogadro

boltzmann :=           1.380649ee-23 J/K // Boltzmann's constant.
                                         // Defined exactly by the SI rules
                                         // that go into effect May 20, 2019

boltzmannsconstant :=  boltzmann       // Boltzmann's constant
k :=                   boltzmann

gasconstant :=        avogadro k           // molar gas constant,
                                           // Now exactly defined in terms
                                           // of Avogadro's constant and
                                           // Boltzmann's constant.
                          // https://physics.nist.gov/cgi-bin/cuu/Value?r

R :=                   gasconstant

molarvolume :=         R stdtemp / atm // Volume occupied by one mole of an
                                       //   ideal gas at STP.  Units m^3/mol

molar :=               mol / l         // Unit of concentration (moles/liter)
Molar :=               molar           // Sometimes capitalized

molar ||| concentration_by_volume

molal :=               mol / kg        // Unit of concentration (moles/kg)

molal ||| concentration_by_mass

m^3/mol ||| molar_volume

loschmidt := avogadro / molarvolume    // Molecules per cubic meter of an
                                       //   ideal gas at STP.  Loschmidt did
                                       //   work similar to Avogadro.
amagat :=              loschmidt       // Used to measure gas densities

stefanboltzmann :=  2 pi^5 k^4 / (15 h^3 c^2)  // The radiant emittance by a 
                                       //   blackbody 
sigma :=               stefanboltzmann //   at temperature T is given by 
                                       //   sigma T^4.
                                       // Exactly defined as of 2019 but since
                                       // pi is transcendental, it doesn't
                                       // have a finite representation.
                         // https://physics.nist.gov/cgi-bin/cuu/Value?sigma

s^-3 kg K^-4 ||| radiative_power_constant   // This allows Frink to help you
                                       // guess that you need the
				       // Stefan-Boltzmann constant.
                            

wiendisplacement :=  2.897771955e-3 m K   // Wien's Displacement Law gives the
                                        //   frequency at which the the Planck
                                        //   spectrum has maximum intensity.
                                        //   The relation is lambda T = b where
                                        //   lambda is wavelength, T is
                                        //   temperature and b is the Wien
                                        //   displacement.  This relation is
                                        //   used to determine the temperature
                                        //   of stars.  This is the 2018
                                        //   CODATA value.  NIST claims this
                                        //   is exact, but they give an
                                        //   equation with a random
                                        //   unexplained, inexact, divisor,
                                        //   " b = (h c / k) / 4.965114231... "
                // https://physics.nist.gov/cgi-bin/cuu/Value?bwien

K_J := 2 elementarycharge/h  // Josephson Constant
                       // Direct measurement of the volt is difficult.  Until
                       //   recently, laboratories kept Weston cadmium cells as
                       //   a reference, but they could drift.  In 1987 the
                       //   CGPM officially recommended the use of the
                       //   Josephson effect as a laboratory representation of
                       //   the volt.  The Josephson effect occurs when two
                       //   superconductors are separated by a thin insulating
                       //   layer.  A "supercurrent" flows across the insulator
                       //   with a frequency that depends on the potential
                       //   applied across the superconductors.  This frequency
                       //   can be very accurately measured.  The Josephson
                       //   constant K_J, which is equal to
                       //   2 elementarycharge/h, relates the
                       //   measured frequency to the potential.  From 1990 to
                       //   2019, the value of the Josephson constant was
                       //   specified as as exactly 4.835979ee+14 Hz/V .
                       //   The new 2019 SI redefinition caused it to be
                       //   changed to a slightly different (but exact
                       //   rational number value)  See:
                       //  https://physics.nist.gov/cgi-bin/cuu/Value?kjos

Josephson_constant := K_J

m^-2 s^2 kg^-1 A ||| josephson_constant   // This lets Frink help you find the
                                          // right constant to multiply by.

R_K := h/elementarycharge^2 
                       // Measurement of the ohm also presents difficulties.
                       //   The old approach involved maintaining resistances
                       //   that were subject to drift.  The new standard is
                       //   based on the Hall effect.  When a current carrying
                       //   ribbon is placed in a magnetic field, a potential
                       //   difference develops across the ribbon.  The ratio
                       //   of the potential difference to the current is
                       //   called the Hall resistance.  Klaus von Klitzing
                       //   discovered in 1980 that the Hall resistance varies
                       //   in discrete jumps when the magnetic field is very
                       //   large and the temperature very low.  This enables
                       //   accurate realization of the resistance h/e^2 in the
                       //   lab.  From 1990 to 2019, this was defined as
                       //   exactly 25812.807 ohms.  The 2019 redefinition of
                       //   SI base units cause its definition to change to
                       //   another close but exact rational number in terms
                       //   of the exactly-defined h and elementarycharge.
                       // 
                       //   You can see Klaus von Klitzing talk about this
                       //   discovery and its implications for the 2019
                       //   redefinition of the SI here:
                       //  https://www.youtube.com/watch?v=pMnxuA2ljwc

von_Klitzing_constant := R_K

// Density of mercury and water at different temperatures using the standard
// force of gravity.

// Hg10C :=     13.5708 gram / cm^3 // These units, when used to form  
// Hg20C :=     13.5462 gram / cm^3 // pressure measures, are not accurate
// Hg23C :=     13.5386 gram / cm^3 // because of considerations of the
// Hg30C :=     13.5217 gram / cm^3 // revised practical temperature scale.
// Hg40C :=     13.4973 gram / cm^3
// Hg60F :=     13.5574 gram / cm^3  
// H2O0C :=     0.99987 gram / cm^3
// H2O5C :=     0.99999 gram / cm^3
// H2O10C :=    0.99973 gram / cm^3
// H2O15C :=    0.99913 gram / cm^3
// H2O18C :=    0.99862 gram / cm^3
// H2O20C :=    0.99823 gram / cm^3
// H2O25C :=    0.99707 gram / cm^3
// H2O50C :=    0.98807 gram / cm^3
// H2O100C :=   0.95838 gram / cm^3


// Masses of elementary particles, as given by 2018 CODATA-recommended values.
// https://physics.nist.gov/cuu/Constants/index.html

electronmass :=        9.1093837015e-31 kg     // +/- 28 in last 2 digits
m_e :=                 electronmass
                         //  2018 CODATA value.
                         //  https://physics.nist.gov/cgi-bin/cuu/Value?me

protonmass :=          1.67262192369e-27 kg    // +/- 51 in last 2 digits
m_p :=                 protonmass
                         //  2018 CODATA value.
                         //  https://physics.nist.gov/cgi-bin/cuu/Value?mp

neutronmass :=         1.67492749804e-27 kg    // +/- 95 in last 2 digits
m_n :=                 neutronmass
                         //  2018 CODATA value.
                         //  https://physics.nist.gov/cgi-bin/cuu/Value?mn

muonmass :=            1.883531627e-28 kg    // +/- 42 in last 2 digits
m_mu :=                muonmass
m_muon   :=            muonmass
                         //  2018 CODATA value.
                         //  https://physics.nist.gov/cgi-bin/cuu/Value?mmu

deuteronmass :=        3.3435837724e-27 kg    // +/- 10 in last 2 digits
m_d :=                 deuteronmass
                         //  2018 CODATA value.
                         //  https://physics.nist.gov/cgi-bin/cuu/Value?md

alphaparticlemass :=   6.6446573357e-27 kg     // +/- 20 in last 2 digits
m_alpha :=             alphaparticlemass
                         //  2018 CODATA value.
                         //  https://physics.nist.gov/cgi-bin/cuu/Value?mal

taumass :=             3.16754e-27 kg       // +/- 21 in last 2 digits
m_tau   :=             taumass
                         //  2018 CODATA value.
                         //  https://physics.nist.gov/cgi-bin/cuu/Value?mtau

// Atomic constants

alpha :=                elementarycharge^2 / (2 epsilon0 h c)
                        // Can also be calculated as
                        //   mu0 c elementarycharge^2 / (2 h)
                        // or, as NIST states,
                        //  elementarycharge^2 / (4 pi epsilon0 hbar c)
                        // 2018 CODATA value is 7.2973525693e-3
                        // https://physics.nist.gov/cgi-bin/cuu/Value?alph
                        // Standard uncertainty is +/- 11 in the last 2 
                        // decimal places.
                        //
                        // The fine structure constant was
                        //   introduced to explain fine
                        //   structure visible in spectral
                        //   lines.
finestructureconstant :=  alpha

// Rydberg constant
Rydberg_constant := electronmass elementarycharge^4 / (8 epsilon0^2 h^3 c)
          // 2018 CODATA value is 10973731.568160 m^-1
          // This can also be calculated as electronmass c alpha^2 / (2 h)
          // There is some discrepancy between this calculated from constants
          // and the CODATA value.
          // https://physics.nist.gov/cgi-bin/cuu/Value?ryd
          // The standard uncertainty is +/- 21 in the last 2 decimal places.

Rinfinity :=           Rydberg_constant 

                                        // The wavelengths of a spectral series
R_H :=                 10967760 /m      //   can be expressed as 
                                        //     1/lambda = R (1/m^2 - 1/n^2).
                                        //   where R is a number that various
                                        //   slightly from element to element.
                                        //   For hydrogen, R_H is the value,
                                        //   and for heavy elements, the value
                                        //   approaches Rinfinity.

bohrradius :=           hbar / (alpha electronmass c)  // Bohr radius
                        // This can also be calculated as
                        //   alpha / (4 pi Rinfinity)
                        // 2018 CODATA value, 5.29177210903e-11 m
                        //  There is some discrepancy between calculating this
                        // in terms of other constants and the CODATA value.
                        // uncertainty is +/- 80 in last
                        // 2 digits.
                        // https://physics.nist.gov/cgi-bin/cuu/Value?bohrrada0

// Planck constants

planckmass :=          (hbar c / G)^(1/2)    
m_P :=                 planckmass

plancktime :=          hbar / (planckmass c^2)
t_P :=                 plancktime

plancklength :=        plancktime c
l_P :=                 plancklength

plancktemperature :=  planckmass c^2 / k  /* This can also be calculated as
                                             planckmass c^2 / k
                                             which is also
                                             (hbar c^5 / (G k^2))^(1/2)
                                           2018 CODATA value gives this as
                                           1.416785*10^32 K where the
                                           uncertainty is +/- 16 in the last 2
                                           digits. 
                            https://physics.nist.gov/cgi-bin/cuu/Value?plktmp */
T_P := plancktemperature


// Particle wavelengths: the Compton wavelength of a particle is
// defined as h / (m c) where m is the mass of the particle.

electronwavelength :=  h / (m_e c)
lambda_C :=            electronwavelength
Comptonwavelength :=   electronwavelength

protonwavelength :=    h / (m_p c)
lambda_C_p :=          protonwavelength
neutronwavelength :=   h / (m_n c)
lambda_C_n :=          neutronwavelength


// Magnetic moments

bohrmagneton :=        elementarycharge hbar / (2 electronmass)
mu_B :=                bohrmagneton
nuclearmagneton :=     elementarycharge hbar / (2 protonmass)
mu_N :=                nuclearmagneton

m^2 A ||| magnetic_moment


// Values below are from 2018 CODATA values

muonmagneticmoment :=   -4.49044830e-26 J/T   // +/- 10 in last 2 digits
mu_mu :=               muonmagneticmoment
                        // https://physics.nist.gov/cgi-bin/cuu/Value?mumum

protonmagneticmoment := 1.41060679736e-26 J/T  // +/- 60 in last 2 digits
mu_p :=                 protonmagneticmoment
                         // https://physics.nist.gov/cgi-bin/cuu/Value?mup

electronmagneticmoment:= -9.2847647043e-24 J/T // +/- 28 in last 2 digits
mu_e :=                  electronmagneticmoment
                           // https://physics.nist.gov/cgi-bin/cuu/Value?muem

neutronmagneticmoment := -9.6623651e-27 J/T // +/- 23 in last 2 digits
mu_n :=                  neutronmagneticmoment
                           // https://physics.nist.gov/cgi-bin/cuu/Value?munn

deuteronmagneticmoment := 4.330735094e-27 J/T // +/- 11 in last 2 digits
mu_d :=                   deuteronmagneticmoment
                           // https://physics.nist.gov/cgi-bin/cuu/Value?mud

//
// United States units
//

// linear measure

// The US Metric Law of 1866 gave the exact relation 1 meter = 39.37 inches.
// From 1893 until 1959, the foot was exactly 1200/3937 meters.  In 1959
// the definition was changed to bring the US into agreement with other
// countries.  Since then, the foot has been exactly 0.3048 meters.  At the
// same time it was decided that any data expressed in feet derived from
// geodetic surveys within the US would continue to use the old definition.

inch :=                2.54ee0 cm    // Exactly 2.54 cm
foot :=                12 inch
feet :=                foot
ft :=                  foot
survey ::-             1200/3937 m/ft  // Ratio to give survey length
geodetic ::-           survey
statute ::-            survey
int :-                 3937/1200 ft/m   // Convert US Survey measures to
                                        //   international measures

inches :=              inch   // Wacky plural
in :=                  inch
yard :=                3 ft
yd :=                  yard
mile :=                5280 ft

line :=                1/12 inch // Also defined as '.1 in' or as '1e-8 Wb'
rod :=                 11/2 surveyyard
rd  :=                 rod
perch :=               rod
furlong :=             40 rod          // From "furrow long" 
statutemile :=         statute mile
league :=              3 statute mile

// Calories: energy to raise a gram of water one degree celsius

cal_IT :=              4.1868ee0 J    // International Table calorie, 4.1868 J
cal_th :=              4.184ee0 J     // Thermochemical calorie, 4.184 J
cal_fifteen :=         4.18580 J   // Energy to go from 14.5 to 15.5 degC
cal_twenty :=          4.18190 J   // Energy to go from 19.5 to 20.5 degC
cal_mean :=            4.19002 J   // 1/100 energy to go from 0 to 100 degC
calorie :=             cal_IT
cal :=                 calorie
calorie_IT :=          cal_IT
thermcalorie :=        cal_th
calorie_th :=          thermcalorie
Calorie :=             kilocalorie // the food Calorie
thermie :=          1ee6 cal_fifteen// Heat required to raise the
                                    // temperature of a tonne of
                                    // water from 14.5 to 15.5 degC.

//
// Units derived from physical constants
//

inHg :=                inch gravity Hg   // Inches of mercury
inH2O :=               inch gravity water
inchmercury :=         inHg
inchesmercury :=       inHg              // Irregular plural
mmH2O :=               mm gravity water
mmHg :=                mm gravity Hg

kgf :=                 kg gravity
technicalatmosphere := kgf / cm^2
at :=                  technicalatmosphere
hyl :=                 kgf s^2 / m  // Also gram-force s^2/m according to [15]
torr :=                101325/760 Pa // Exactly defined.  Differs from mmHg by
                                     // about 1 part in 7 million.
Torr :=                torr     // Accepted symbol is Torr
                                // These units, both named after Evangelista
tor :=                 Pa       // Torricelli, should not be confused.  
                                // Acording to [15] the torr is actually 
                                // atm/760 which is slightly different.

eV :=        elementarycharge V  // Energy acquired by a particle with charge e
electronvolt :=        eV      //   when it is accelerated through 1 V
lightyear :=           c (365 + 1/4) day // The 365.25 day year is specified in
                                         // NIST publication 811
ly :=                  lightyear
lightsecond :=         c s
lightminute :=         c min
parsec :=              (648000 / pi) au   // Unit of length equal to distance
pc :=                  parsec             // from the sun to a point having
                                          // heliocentric parallax of 1
                                          // arcsec (derived from parallax
                                          // second).
                                          // IAU Resolution B2, 2015
					  // (link below) cites
				          // two textbooks as saying
					  // that "the parsec is defined as
					  // exactly (648000 / pi) au"
					  // which is equivalent to the
					  // previous definition included here:
					  // au radian / arcsec
					  // but it does not quote
					  // any standards body.
					  // (648000 is 3600 * 180, the
					  // number of arcseconds in a
					  // semicircle.  This is thus not a
					  // correct trigonometric scale, but a
					  // small-angle approximation.  The
					  // rigorous trigonometric measure
					  // would be given by d = r/tan[theta]
					  // or specifically au / tan[arcsec])
					  // Note that the parsec is defined
					  // not as the angle when the Earth
					  // is on opposite sides of the Sun,
					  // but half that angle.
					  
         // https://www.iau.org/static/resolutions/IAU2015_English.pdf
         // Resolutions of the IAU:
         //  https://www.iau.org/administration/resolutions/general_assemblies/

rydberg :=             h c Rinfinity      // Rydberg energy
crith :=               0.089885 gram      // The crith is the mass of one
                                           //   liter of hydrogen at standard
                                           //   temperature and pressure.
amagatvolume :=        molarvolume         // Units m^3/mol
lorentz :=             bohrmagneton / (h c)// Used to measure the extent
                                           //   that the frequency of light
                                           //   is shifted by a magnetic field.
cminv :=               h c / cm            // Unit of energy used in infrared
invcm :=               cminv               //   spectroscopy.  
wavenumber :=          cminv
cal_mol :=            cal / (mol N_A)     // kcal/mol is used as a unit of
                                          //   energy by physical chemists.
J_mol :=              J / (mol N_A)       // Suggested by Richard Terrett
                                          // You can of course write kJ_mol.

//
// CGS system based on centimeter, gram and second
//

dyne :=                cm gram / s^2  // force
dyn :=                 dyne
erg :=                 cm dyne        // energy
poise :=               gram / (cm s)  // viscosity, honors Jean Poiseuille
P :=                   poise
poise ||| viscosity

rhe :=                 poise^-1        // reciprocal viscosity
rhe ||| reciprocal_viscosity

stokes :=              cm^2 / s       // kinematic viscosity
St :=                  stokes
stokes ||| kinematic_viscosity
stoke :=               stokes
lentor :=              stokes         // old name
Gal :=                 cm / s^2       // acceleration, used in geophysics
galileo :=             Gal            // for earth's gravitational field
                                      // (note that "gal" is for gallon
                                      // but "Gal" is the standard symbol
                                      // for the gal which is evidently a
                                      // shortened form of "galileo".)
barye :=               dyne/cm^2      // pressure
barad :=               barye          // old name
kayser :=              1/cm           // Proposed as a unit for wavenumber
balmer :=              kayser         // Even less common name than "kayser"
kine :=                cm/s           // velocity
bole :=                g cm / s       // momentum
pond :=                gram force
glug :=            gram force s^2 / cm // Mass which is accelerated at
                                       //   1 cm/s^2 by 1 gram force
darcy :=       centipoise cm^2 /(s atm)// Measures permeability to fluid flow.
                                       // One darcy is the permeability of a
                                       // medium that allows a flow of cc/s of
                                       // a liquid of centipoise viscosity
                                       // under a pressure gradient of atm/cm.

mobileohm :=           cm / (dyn s)   // mobile ohm, measure of mechanical

mechanicalohm :=       dyn s / cm     // mechanical resistance
acousticalohm :=       dyn s / cm^5   // ratio of the sound pressure of
                                      //   1 dyn/cm^2 to a source of strength
                                      //   1 cm^3/s

ray :=                 acousticalohm
rayl :=                dyn s / cm^3   // Specific acoustical resistance
eotvos :=              1ee-9 Gal/cm   // Change in gravitational acceleration
                                      //   over horizontal distance

// Electromagnetic units derived from the abampere

abampere :=            10 A           // Current which produces a force of
abamp :=               abampere       //   2 dyne/cm between two infinitely
aA :=                  abampere       //   long wires that are 1 cm apart
biot :=                aA             // alternative name for abamp
Bi :=                  biot
abcoulomb :=           abamp sec
abcoul :=              abcoulomb
abvolt :=              dyne cm  / (abamp sec)
abfarad :=             abampere sec / abvolt
abhenry :=             abvolt sec / abamp
abohm :=               abvolt / abamp
abmho :=               abohm^-1
gauss :=               abvolt sec / cm^2
Gs :=                  gauss
maxwell :=             abvolt sec     // Also called the "line"
Mx :=                  maxwell
oersted :=             gauss / mu0
Oe :=                  oersted
gilbert :=             gauss cm / mu0
Gb :=                  gilbert
Gi :=                  gilbert
unitpole :=            4 pi maxwell

// Gaussian system: electromagnetic units derived from statampere.
//
// Note that the Gaussian units are often used in such a way that Coulomb's law
// has the form F= q1 * q2 / r^2.  The constant 1/(4*pi*epsilon0)
// is incorporated
// into the units.  From this, we can get the relation force=charge^2/dist^2.
// This means that the simplification esu^2 = dyne cm^2 can be used to simplify
// units in the Gaussian system, with the curious result that capacitance can 
// be measured in cm, resistance in sec/cm, and inductance in sec^2/cm.  These
// units are given the names statfarad, statohm and stathenry below.  

statampere :=          10 A cm / (s c)
statamp :=             statampere
statvolt :=            dyne cm / (statamp sec)
statcoulomb :=         statamp s
esu :=                 statcoulomb
statcoul :=            statcoulomb
statfarad :=           statamp sec / statvolt
cmcapacitance :=       statfarad
stathenry :=           statvolt sec / statamp
statohm :=             statvolt / statamp
statmho :=             statohm^-1
statmaxwell :=         statvolt sec
franklin :=            statcoulomb
debye :=               1ee-18 statcoul cm// unit of electrical dipole moment
debye ||| electrical_dipole_moment
helmholtz :=           debye/angstrom^2 // Dipole moment per area
jar :=                 1000 statfarad   // approx capacitance of Leyden jar

//
// Some historical eletromagnetic units
//

Ah :=                  ampere hour  // so you can write stuff like mAh
intampere :=           0.999835 A   // Defined as the current which in one
intamp :=              intampere    //   second deposits .001118 gram of
                                    //   silver from an aqueous solution of
                                    //   silver nitrate.
intfarad :=            0.999505 F
intvolt :=             1.00033 V
intohm :=              1.000495 ohm // Defined as the resistance of a
                                    //   uniform column of mercury containing
                                    //   14.4521 gram in a column 1.063 m
                                    //   long and maintained at 0 degC.
daniell :=             1.042 V      // Meant to be electromotive force of a
                                    //   Daniell cell, but in error by .04 V
faraday := N_A elementarycharge mol  // Charge that must flow to deposit or
faraday_phys :=        96521.9 C     //   liberate one gram equivalent of any
faraday_chem :=        96495.7 C     //   element.  (The chemical and physical
                                     //   values are off slightly from what is
                                     //   obtained by multiplying by amu_chem
                                     //   or amu_phys.  These values are from
                                     //   a 1991 NIST publication.)  Note that
                                     //   there is a Faraday constant which is
                                     //   equal to N_A e and hence has units of
                                     //   C/mol.  
kappline :=            6000 maxwell // Named by and for Gisbert Kapp
siemensunit :=         0.9534 ohm   // Resistance of a meter long column of
                                    //   mercury with a 1 mm cross section.

//
// Photometric units
//

candle :=              1.02 candela // Standard unit for luminous intensity
hefnerunit :=          0.9 candle   //   in use before candela
hefnercandle :=        hefnerunit   //
violle :=              20.17 cd     // luminous intensity of 1 cm^2 of
                                    //   platinum at its temperature of
                                    //   solidification (2045 K)

lumen :=               cd sr        // Luminous flux 
lm :=                  lumen        //

talbot :=              lumen s      // Luminous energy
lumberg :=             talbot
talbot ||| luminous_energy

m^-2 cd sr ||| illuminance
lux :=                 lm/m^2       // Illuminance or exitance (luminous
lx :=                  lux          //   flux incident on or coming from
phot :=                lumen / cm^2 //   a surface)
ph :=                  phot         //
footcandle :=          lumen/ft^2   // Illuminance from a 1 candela source
                                    //    at a distance of one foot
metercandle :=         lumen/m^2    // Illuminance from a 1 candela source
                                    //    at a distance of one meter

mcs :=                 metercandle s// luminous energy per area, used to
                                    //    measure photographic exposure

// Luminance measures

nit :=                 cd/m^2       // Luminance: the intensity per projected
stilb :=               cd / cm^2    // area of an extended luminous source.
sb :=                  stilb        // (nit is from latin nitere = to shine.)

apostilb :=            cd/(pi m^2)
asb :=                 apostilb
blondel :=             apostilb     // Named after a French scientist.
nox :=                 1ee-3 lux     // These two units were proposed for
skot :=                1ee-3 apostilb// measurements relating to dark adapted
                                     // eyes.

// Equivalent luminance measures.  These units are units which measure
// the luminance of a surface with a specified exitance which obeys
// Lambert's law.  (Lambert's law specifies that luminous intensity of
// a perfectly diffuse luminous surface is proportional to the cosine
// of the angle at which you view the luminous surface.)

equivalentlux :=       cd / (pi m^2)  // luminance of a 1 lux surface
equivalentphot :=      cd / (pi cm^2) // luminance of a 1 phot surface
lambert :=             cd / (pi cm^2)
footlambert :=         cd / (pi ft^2)

// Some luminance data from the IES Lighting Handbook, 8th ed, 1993

sunlum :=              1.6e9 cd/m^2 // at zenith
sunillum :=            100e3 lux    // clear sky
sunillum_o :=          10e3 lux     // overcast sky
sunlum_h :=            6e6 cd/m^2   // value at horizon
skylum :=              8000 cd/m^2  // average, clear sky
skylum_o :=            2000 cd/m^2  // average, overcast sky
moonlum :=             2500 cd/m^2

//
// Astronomical time measurements
//

anomalisticyear :=     365.2596 days      // The time between successive
                                          //   perihelion passages of the 
                                          //   earth.
siderealyear :=        365.256360417 day  // The time for the earth to make
                                          //   one revolution around the sun
                                          //   relative to the stars.
tropicalyear :=        365.242198781 day  // The mean interval between vernal
                                          //   equinoxes.  Differs from the
                                          //   sidereal year by 1 part in
                                          //   26000 due to precession of the
                                          //   earth about its rotational axis
                                          //   combined with precession of the
                                          //   perihelion of the earth's
                                          //   orbit.
gaussianyear :=        365.2690 days      // The orbital period of a body in
                                          //   circular orbit at a distance of
                                          //   1 au from the sun.  Calculated
                                          //   from Kepler's third law.
siderealday :=         23 hour + 56 min + 4.090530833 s
                          // From http://en.wikipedia.org/wiki/Sidereal_day
                                          // The sidereal day is the interval
siderealhour :=        1/24 siderealday   //   between two successive transits
siderealminute :=      1/60 siderealhour  //   of a star over the meridian,
siderealsecond :=      1/60 siderealminute//   or the time required  for the
                                          //   earth to make one rotation
                                          //   relative to the stars.  The
                                          //   more usual solar day is the
                                          //   time required to make a
                                          //   rotation relative to the sun.
                                          //   Because the earth moves in its
                                          //   orbit, it has to turn a bit
                                          //   extra to face the sun again,
                                          //   hence the solar day is slightly
                                          //   longer.
solarday :=            day                // The time for the earth to rotate
                                          // on its axis relative to the sun.
anomalisticmonth :=    27.55454977 day    // Time from perigee to perigee
nodicalmonth :=        27.2122199 day     // The nodes are the points where
draconicmonth :=       nodicalmonth       //   an orbit crosses the ecliptic.
draconiticmonth :=     nodicalmonth       //   This is the time required to
                                          //   travel from the ascending node
                                          //   to the next ascending node.
siderealmonth :=       27.321661 day      // Time required for the moon to
                                          //   orbit the earth
lunarmonth :=          29.5305555 day     // Time between full moons. Full 
synodicmonth :=        lunarmonth         //   moon occur when the sun and 
lunation :=            synodicmonth       //   moon are on opposite sides of
lune :=                1/30 lunation      //   the earth.  Since the earth
lunour :=              1/24 lune          //   moves around the sun, the moon
                                          //   has to revolve a bit farther to
                                          //   get into the full moon
                                          //   configuration.
year :=                tropicalyear
yr :=                  year

month :=              1/12 year    // This is obviously an average for the 
                                   // limiting case... so is accurate in the
                                   // long term but useless for adding an 
                                   // offset to a specific date.

mo :=                  month
decade :=              10 years
century :=             100 years
centuries :=           century    // Irregular plural
millennium :=          1000 years
millennia :=           millennium
solaryear :=           year
lunaryear :=           12 lunarmonth
calendaryear :=        365 day
commonyear :=          365 day
leapyear :=            366 day
julianyear :=          365.25 day
juliancentury :=       36525 day
juliancenturies :=     36525 day
gregorianyear :=       365.2425 day
islamicyear :=         354 day         // A year of 12 lunar months. They
islamicleapyear :=     355 day         // began counting on July 16, AD 622
                                       // when Muhammad emigrated to Medina
                                       // (the year of the Hegira).  They need
                                       // 11 leap days in 30 years to stay in
                                       // sync with the lunar year which is a
                                       // bit longer than the 29.5 days of the
                                       // average month.  
islamicmonth :=        1/12 islamicyear// They have 29 day and 30 day months.
cron :=                1ee6 years
lustrum :=             5 years             // The Lustrum was a Roman
                                           //  purification ceremony that took
                                           //  place every five years.
                                           //  Classically educated Englishmen
                                           //  used this term. 

// Data on the planets.
// There is no single clearinghouse or CODATA equivalent for best-known data
// on the planets.
// Maybe use:
//    https://nssdc.gsfc.nasa.gov/planetary/factsheet/
// as a starting point, but drill down to the detail pages because that top
// overview page rounds drastically.

// The following are sidereal days unless otherwise noted

mercuryday :=          58.6462 day
venusday :=            243.01 day       // retrograde
earthday :=            siderealday
marssiderealday :=     24 hours + 37 min + 22.663 sec
marssolarday :=        24 hours + 39 min + 35.24409 sec
marsday :=             marssolarday   // The common "sol" definition.
jupiterday :=          0.41354 day
saturnday :=           0.4375 day
uranusday :=           0.65 day         // retrograde
neptuneday :=          0.768 day
plutoday :=            6.3867 day

// Solar days

// Planetary sidereal years

mercuryyear :=         86.96 day
venusyear :=           224.68 day
earthyear :=           siderealyear
marsyear :=            686.95 day
jupiteryear :=         11.862 tropicalyear
saturnyear :=          29.458 tropicalyear
uranusyear :=          84.012 tropicalyear
neptuneyear :=         164.798 tropicalyear
plutoyear :=           248.5 tropicalyear

//
// Some other astronomical values
//

sunmass :=             1.9891e30 kg
solarmass :=           sunmass        // Common unit name
sunradius :=           696342. km  // Plus/minus 65 km, 
               // http://www.ifa.hawaii.edu/info/press-releases/solar_radius/
sunpower :=            3.86e26 watts

landarea :=            148.847e6 km^2
oceanarea :=           361.9e6 km^2 
oceanvolume :=         1335e6 km^3    // All Earth's oceans 
  // ETOPO1 data, https://www.ngdc.noaa.gov/mgg/global/etopo1_ocean_volumes.html
  
moonmass :=            7.3483e22 kg
moonradius :=          1738. km        // mean value

// Distances
sundist :=             1.0000010178 au// mean earth-sun distance
sundist_near :=        1.471e11 m     // earth-sun distance at perihelion
sundist_far :=         1.521e11 m     // earth-sun distance at aphelion

// Average distances between planets and the sun.
mercurydist :=          57910. Mm
venusdist   :=         108200. Mm
earthdist   :=         sundist
marsdist    :=         227940. Mm

// https://nssdc.gsfc.nasa.gov/planetary/factsheet/jupiterfact.html
jupiterdist :=         778.57e6 km

saturndist  :=        1429400. Mm
uranusdist  :=        2870990. Mm
neptunedist :=        4497070. Mm
plutodist   :=        5913520. Mm 

moondist :=            384400. km      // mean earth-moon distance

mercurymass :=         0.33022e24 kg
venusmass :=           4.8690e24 kg
marsmass :=            0.64191e24 kg
earthmass :=           5.9742e24 kg

// https://nssdc.gsfc.nasa.gov/planetary/factsheet/jupiterfact.html
jupitermass :=         1898.19e24 kg

saturnmass :=          568.5e24 kg
uranusmass :=          86.625e24 kg
neptunemass :=         102.78e24 kg
plutomass :=           0.0127e24 kg

mercuryradius :=        2439. km
venusradius :=          6052. km
marsradius :=           3397. km
earthradius :=          6371.01 km    // mean +/- 0.02 km

// https://nssdc.gsfc.nasa.gov/planetary/factsheet/jupiterfact.html
jupiterradius :=            69911. km   // Volumetric mean radius
jupiterradius_equatorial := 71492. km   // (1 bar level)
jupiterradius_polar      := 66854. km   //

saturnradius :=        60268. km
uranusradius :=        25559. km
neptuneradius :=       24764. km
plutoradius :=          1185. km     // July 13, 2015, +/- 10
         // http://pluto.jhuapl.edu/News-Center/News-Article.php?page=20150713

// These use the WGS84 datum, which is currently most commonly used
// in mapping.
earthradius_equatorial :=   6378137. m
earthradius_polar :=        6356752.3142 m
earth_flattening :=         (earthradius_equatorial-earthradius_polar)/earthradius_equatorial
                    // http://www.uwgb.edu/dutchs/UsefulData/UTMFormulas.HTM
                    // http://ssd.jpl.nasa.gov/phys_props_earth.html
                    
earthvolume := 4/3 pi earthradius_equatorial^2 earthradius_polar             

// Larger moons... their distances are the average distances from their planet.

// Mars
phobosdist := 9378.5 km
phobosmass := 1.08e16 kg

deimosdist := 23458. km
deimosmass := 1.8e15 kg

// Jupiter

// Io is Jupiter I
iodist       := 422000. km
ioradius     :=   1815. km
iomass       := 8.93e22 kg

// Europa is Jupiter II
europadist   := 670900. km
europaradius :=   1569. km
europamass   :=  4.80e22 kg

// Ganymede is Jupiter III
ganymededist := 1070000. km
ganymederadius := 2631. km
ganymedemass := 1.48e23 kg

// Callisto is Jupiter IV
callistodist := 1883000. km
callistoradius := 2400. km
callistomass := 1.08e23 kg

// Saturn
titandist    := 1221850. km
titanradius  := 2575. km
titanmass    := 1.35e23 kg

// Pluto
charondist := 19640. km
charonradius := 604. km   // http://pluto.jhuapl.edu/News-Center/News-Article.php?page=20150713
charonmass := 1.90e21 kg

moongravity :=         1.62 m/s^2

// General cosmological observations
hubbleconstant := 67.8 km/s/megaparsec  // WMAP data, +/- 0.9 km/s/megaparsec
                                        // From Sky & Telescope, July 2015 p.30
H_0            := hubbleconstant

universeage := 13.799 billion years   // Error is 38 million years
                                      // Source: ibid



// Inverse time units
annually :=            1/year
annual :=              annually
yearly :=              annual
daily :=               1/day
weekly :=              1/week
monthly :=             1/month
hourly :=              1/hour


// Perfect intervals

octave :=                 2
majorthird :=             5/4
minorthird  :=            6/5  
musicalfourth :=          4/3
musicalfifth :=           3/2
majorsecond :=            musicalfifth^2 / octave
majorsixth :=             musicalfourth majorthird
minorsixth :=             musicalfourth minorthird
majorseventh :=           musicalfifth majorthird
minorseventh :=           musicalfifth minorthird

pythagoreanthird :=       majorsecond musicalfifth^2 / octave
syntoniccomma :=          pythagoreanthird / majorthird 
pythagoreancomma :=       musicalfifth^12 / octave^7

// Equal tempered definitions

semitone :=               octave^(1/12)


// The Hartree system of atomic units, derived from fundamental units
// of mass (of electron), action (reduced Planck's constant, that is hbar), 
// electron charge, and Coulomb's constant.
//
// The so-called Hartree "atomic units" system
// (as opposed to the Rydberg atomic units system, which differs in the
// choice of mass and charge) defines the following 
// units to be dimensionless with value of 1:  (The names below are their Frink
// names.)
// 
//  * electronmass
//  * elementarycharge
//  * hbar               (Planck's constant divided by (2 pi))
//  * coulombconst
//
// See:  https://en.wikipedia.org/wiki/Atomic_units
//
// Note that this "atomicmass" unit is NOT the "atomicmassunit" (also called 
// "amu" or "m_u" or "u".  See https://physics.nist.gov/cgi-bin/cuu/Value?u
// Should it be named something else to avoid confusion?
atomicmass :=          electronmass
atomiccharge :=        elementarycharge
atomicaction :=        hbar

// Hartree atomic units derived units
atomiclength :=        bohrradius
atomictime :=          hbar^3/(coulombconst^2 atomicmass elementarycharge^4) 
                       // Period of first Bohr orbit
atomicvelocity :=      atomiclength / atomictime
atomicenergy :=        hbar / atomictime
hartree :=             atomicenergy
Hartree :=             hartree
E_h :=                 hartree   // Synonym used at
           // https://physics.nist.gov/cgi-bin/cuu/Value?hr

//
// These thermal units treat entropy as charge, from [5]
//

thermalcoulomb :=      J/K       // entropy
thermalampere :=       W/K       // entropy flow
thermalfarad :=        J/K^2
thermalohm :=          K^2/W     // thermal resistance
fourier :=             thermalohm
thermalhenry :=        J K^2/W^2 // thermal inductance
thermalvolt :=         K         // thermal potential difference



// surveyor's measure

surveyorschain :=      66 surveyft
surveyorspole :=       1/4 surveyorschain
surveyorslink :=       1/100 surveyorschain
chain :=               surveyorschain
surveychain :=         chain
ch :=                  chain
link :=                surveyorslink
acre :=                43560 surveyfoot^2  // NIST Handbook 44 has a
                                           // typographical error (forgetting
                                           // to underline feet in one place
                                           // on middle of page C-16 in 2003
                                           // edition) with
                                           // respect to this, but it's
                                           // clear from corroborating 
                                           // different figures in that 
                                           // document and NIST Special
                                           // Publication 811, Sec. B.6,
                                           // that the survey foot is
                                           // the proper definition.  Have
                                           // filed errata with NIST and 
                                           // requested confirmation.
                                           // 2003-08-27
                                           // Received confirmation (years
                                           // later) that all of my reported
                                           // errors were indeed errors and
                                           // would be fixed.  Note that 
                      // it was apparently not fixed until the 2007 
                      // edition. 2010 edition of NIST Handbook 44 is 
                      // apparently correct. (see section C-2.)
                      // http://ts.nist.gov/WeightsAndMeasures/pubs.cfm

intacre :=             43560 ft^2  // Acre based on international ft
acrefoot :=            acre surveyfoot
acrefeet :=            acrefoot    // Irregular plural
section :=             surveymile^2
township :=            36 section
homestead :=           160 acre // Area of land granted by the 1862 Homestead
                                // Act of the United States Congress
gunterschain :=        surveyorschain

engineerschain :=      100 ft
engineerslink :=       1/100 engineerschain
ramsdenschain :=       engineerschain
ramsdenslink :=        engineerslink


// nautical measure

fathom :=              6 surveyft  // Originally defined as the distance from
                                   //   fingertip to fingertip with arms fully
                                   //   extended.
nauticalmile :=        1852 m  // Supposed to be one minute of latitude at
                               // the equator.  That value is about 1855 m.
                               // Early estimates of the earth's circumference
                               // were a bit off.  The value of 1852 m was
                               // made the international standard in 1929.
                               // The US did not accept this value until 
                               // July 1, 1954.  The UK switched in 1970.
                               // The value of this unit was adopted by the 
                               // First International Extraordinary 
                               // Hydrographic Conference, Monaco, 1929, 
                               // under the name "International nautical mile."

oldUSnauticalmile :=     6080.20 feet  // Used in U.S. before July 1, 1954
oldUSknot :=             oldUSnauticalmile / hour 

cable :=               720 surveyfoot    // NIST Handbook 44, 2003 Appendix C
cablelength :=         cable
cableslength :=        cable

metriccable :=         200 m   // Used by France and Spain

navycablelength :=     720 surveyft
marineleague :=        3 nauticalmile
knot :=                nauticalmile / hr
shackle := 15 fathoms             // Adopted 1949 by British navy
oldUKRNshackle :=      12.5 fathoms // Used by Royal Navy until 1949
watch :=               4 hours    // time a sentry stands watch or a ship's
                                  // crew is on duty. 
bell :=                1/8 watch  // Bell would be sounded every 30 minutes.

datamile :=            6000 feet  // Defined by U.S. Department of Defense
                                  // as a unit used in radar measurements.

// Avoirdupois weight
// These are actually defined as mass units to follow the recommendations
// of the SI.

pound :=               0.45359237ee0 kg  // Defined exactly, 0.45359237 kg

lb :=                  pound          // From the latin libra
grain :=               1/7000 pound   // The grain is the same in all three
                                      // weight systems.  It was originally
                                      // defined as the weight of a barley
                                      // corn taken from the middle of the
                                      // ear.
gr := grain
ounce :=               1/16 pound
oz :=                  ounce
dram :=                1/16 ounce
dr :=                  dram
hundredweight :=       100 pounds     // This is the USA hundredweight
cwt :=                 hundredweight
shorthundredweight :=  hundredweight
ton :=                 2000 lb
shortton :=            ton
shortquarter :=        1/4 shortton


// Troy Weight.  In 1828 the troy pound was made the first United States
// standard weight.  It was to be used to regulate coinage.

troypound :=           5760 grain
troyounce :=           1/12 troypound
ozt :=                 troyounce
pennyweight :=         1/20 troyounce  // Abbreviated "d" in reference to a
dwt :=                 pennyweight     //   Frankish coin called the "denier"
                                       //   minted in the late 700's.  There  
                                       //   were 240 deniers to the pound.
assayton :=            mg ton / troyounce  // mg / assayton = troyounce / ton

// Some other jewelers units

metriccarat :=         2/10 gram
metricgrain :=         50 mg
carat :=               metriccarat
ct :=                  carat
jewelerspoint :=       1/100 carat
silversmithpoint :=    1/4000 inch


// Apothecaries' weight

appound :=             troypound
apounce :=             troyounce
apdram :=              1/8 apounce
scruple :=             1/3 apdram

// Liquid measure

gallon :=              231 in^3
gal :=                 gallon
quart :=               1/4 gallon
qt :=                  quart
pint :=                1/2 qt
pt :=                  pint
gill :=                1/4 pint
fluidounce :=          1/16 pint
floz :=                fluidounce
fluiddram :=           1/8 floz
fldr :=                fluiddram
minim :=               1/60 fldr
liquidbarrel :=        31.5 gallon
petroleumbarrel :=     42 gallon      // Originated in Pennsylvania oil
                                      // fields, from the winetierce
barrel :=              petroleumbarrel
oilbarrel :=           petroleumbarrel
bbl :=                 barrel
hogshead :=            63 gallon
firkin :=              9 gallon

// Dry measures: The Winchester Bushel was defined by William III in 1702 and
// legally adopted in the US in 1836.

drybarrel :=           7056 in^3
bushel :=              2150.42 in^3 // Volume of 8 inch high cylinder with 18.5
bu :=                  bushel       // inch diameter (rounded)
peck :=                1/4 bushel
pk :=                  peck
drygallon :=           1/2 peck
dryquart :=            1/4 drygallon
drypint :=             1/2 dryquart

// Grain measures.  The bushel as it is used by farmers in the USA is actually
// a measure of mass which varies for different commodities.  Canada uses the
// same bushel masses for most commodities, but not for oats.

wheatbushel :=         60 lb
soybeanbushel :=       60 lb
cornbushel :=          56 lb
ryebushel :=           56 lb
barleybushel :=        48 lb 
oatbushel :=           32 lb
ricebushel :=          45 lb
canada_oatbushel :=    34 lb

// Wine and Spirits measure

pony :=                1 floz
jigger :=              1.5 floz  // Can vary between 1 and 2 floz
shot :=                jigger    // Sometimes 1 floz
eushot :=              20 ml     // EU standard spirits measure
                  // See http://bundesrecht.juris.de/eo_1988/anhang_c_119.html
fifth :=               1/5 gallon
winebottle :=          750 ml    // US industry standard, 1979
winesplit :=           1/4 winebottle
wineglass :=           4 floz
magnum :=              3/2 liter // Standardized in 1979, but given
                                 // as 2 qt in some references
metrictenth :=         375 ml
metricfifth :=         750 ml
metricquart :=         1 liter

// French champagne bottle sizes

split :=               200 ml
jeroboam :=            2 magnum
rehoboam :=            3 magnum
methuselah :=          4 magnum
salmanazar :=          6 magnum
balthazar :=           8 magnum
nebuchadnezzar :=      10 magnum

// Shoe measures

shoeiron :=            1/48 inch   // Used to measure leather in soles
shoeounce :=           1/64 inch   // Used to measure non-sole shoe leather

//
// USA slang units
//

buck :=                dollar
fin :=                 5 dollar
sawbuck :=             10 dollar
key :=                 kg          // usually of marijuana, 60's
lid :=                 1 oz        // Another 60's weed unit
footballfield :=       100 yards
marathon :=            26 miles + 385 yards

//
// British
//

british :-             1200000/3937014 m/ft // The UK lengths were defined by
                                            // a bronze bar manufactured in
                                            // 1844.  Measurement of that bar
                                            // revealed the dimensions given
                                            // here.

// Old nautical definitions
// See:  http://www.hemyockcastle.co.uk/nautical.htm
oldbrnauticalmile :=   6080 ft                 // Used until 1970 when the UK
oldbrknot :=           oldbrnauticalmile / hr  // switched to the international
oldbrcable :=          1/10 oldbrnauticalmile  // nautical mile.
geographicalmile :=    oldbrnauticalmile
admiraltymile :=       oldbrnauticalmile
admiraltyknot :=       oldbrknot
admiraltycable :=      oldbrcable
seamile :=             6000 ft
cablet :=              120 fathoms
hawserlaidcable :=     130 fathoms

oldrussiancable :=     100 fathoms
oldhollandcable :=     123 fathoms
oldportugalcable:=     141 fathoms

// British Imperial weight is mostly the same as US weight.  A few extra
// units are added here.

clove :=               7 lb
stone :=               14 lb
brhundredweight :=     8 stone
brquartermass :=       1/4 brhundredweight
longhundredweight :=   brhundredweight
longton :=             20 brhundredweight
brton :=               longton
brassayton :=          mg brton / troyounce

// British Imperial volume measures

brgallon :=        4.54609ee0 l       // The British Imperial gallon was
canadiangallon :=      brgallon       // defined in 1824 to be the volume of
cangallon :=           brgallon       // water which weighed 10 pounds at 62
                                      // deg F with a pressure of 30 inHg.
                                      // In 1963 it was defined to be the space
                                      // occupied by 10 pounds of distilled
                                      // water of density 0.998859 g/ml weighed
                                      // in air of density 0.001217 g/ml
                                      // against weights of density 8.136 g/ml.
                                      // The value given here is given by [1]
                                      // as an exact value.
imperialgallon :=      brgallon
brquart :=             1/4 brgallon
imperialquart :=       brquart
brpint :=              1/2 brquart
imperialpint :=        brpint
brfloz :=              1/20 brpint  // Note difference in definition
imperialfloz :=        brfloz
brdram :=              1/8 brfloz
imperialdram :=        brdram
brminim :=             1/60 brdram
imperialminim :=       brminim
brscruple :=           1/3 brdram
imperialscruple :=     brscruple
fluidscruple :=        brscruple
brfluidounce :=        brfloz
imperialfluidounce :=  brfloz
brgill :=              1/4 brpint
imperialgill :=        brgill
brpeck :=              2 brgallon
imperialpeck :=        brpeck
brbarrel :=            36 brgallon // Used for beer
imperialbarrel :=      brbarrel
brbushel :=            4 brpeck
imperialbushel :=      brbushel
brheapedbushel := 1.278 brbushel
brquarter := 8 brbushel
brchaldron := 36 brbushel

// Obscure British volume measures.  These units are generally traditional
// measures whose definitions have fluctuated over the years.  Often they
// depended on the quantity being measured.  They are given here in terms of
// British Imperial measures.  For example, the puncheon may have historically
// been defined relative to the wine gallon or beer gallon or ale gallon
// rather than the British Imperial gallon.

bag :=                 4 brbushel
bucket :=              4 brgallon
last :=                40 brbushel
noggin :=              brgill
pottle :=              1/2 brgallon
pin :=                 4.5 brgallon
puncheon :=            72 brgallon
seam :=                8 brbushel
coomb :=               4 brbushel
boll :=                6 brbushel
firlot :=              1/4 boll
brfirkin :=            9 brgallon    // Used for ale and beer
cran :=                37.5 brgallon // measures herring, about 750 fish
barrelbulk :=          5 feet^3
brhogshead :=          63 brgallon
registerton :=         100 ft^3 // Used for internal capacity of ships
shippington :=         40 ft^3  // Used for ship's cargo freight or timber
brshippington :=       42 ft^3  //
freightton :=        shippington// Both register ton and shipping ton derive
                                // from the "tun cask" of wine.
displacementton :=     35 ft^3  // Approximate volume of a longton weight of
                                // sea water used to measure ship displacement
waterton :=            224 brgallon
strike :=              70.5 l    // 16th century unit, sometimes
                                 //   defined as .5, 2, or 4 bushels
                                 //   depending on the location.  It
                                 //   probably doesn't make a lot of
                                 //   sense to define in terms of imperial
                                 //   bushels.  Zupko gives a value of
                                 //   2 Winchester grain bushels or about
                                 //   70.5 liters.

// obscure British lengths

barleycorn :=     1/3 britishinch  // Given in Realm of Measure as the
                                   // difference between successive shoe sizes
nail :=           1/16 britishyard // Originally the width of the thumbnail,
                                   //   or 1/16 ft.  This took on the general
                                   //   meaning of 1/16 and settled on the
                                   //   nail of a yard or 1/16 yards as its
                                   //   final value.  [12]
pole :=                16.5 britishft
rope :=                20 britishft
englishell :=          45 britishinch
flemishell :=          27 britishinch
ell :=                 englishell  // supposed to be measure from elbow to
                                   //   fingertips
span :=                9 britishinch    // supposed to be distance from thumb
                                   //   to pinky with full hand extension
goad := 4.5 britishft     // used for cloth

// misc obscure British units

rood :=                1/4 acre
englishcarat :=        3.163 grain    // Originally intended to be 4 grain
                                      //   but this value ended up being
                                      //   used in the London diamond market
mancus :=              2 oz
mast :=                2.5 lb
basebox :=             31360 in^2     // Used in metal plating

// alternate spellings

metre :=               meter
gramme :=              gram
litre :=               liter
dioptre :=             diopter

//
// Units derived the human body (may not be very accurate)
//

geometricpace :=       5 ft  // distance between points where the same
                             // foot hits the ground
pace :=                2.5 ft// distance between points where alternate
                             // feet touch the ground
USmilitarypace :=      30 in // United States official military pace
USdoubletimepace :=    36 in // United States official doubletime pace
fingerbreadth :=       7/8 in// The finger is defined as either the width
fingerlength :=        4.5 in//   or length of the finger
finger :=              fingerbreadth
hand :=                4 inch// width of hand
palmwidth :=           hand  // The palm is a unit defined as either the width
palmlength :=          8 in  //    or the length of the hand

//
// Cooking measures
//

// US measures

cup :=                 8 floz
tablespoon :=          1/16 cup
tbl :=                 tablespoon
tbsp :=                tablespoon
Tbsp :=                tablespoon
Tsp :=                 tablespoon
teaspoon :=            1/3 tablespoon
tsp :=                 teaspoon
metriccup :=           250 ml

// US can sizes. 

number1can :=          10 floz
number2can :=          19 floz
number2_5can :=        3.5 cups
number3can :=          4 cups
number5can :=          7 cups
number10can :=         105 floz

// British measures

brcup :=               1/2 brpint
brteacup :=            1/3 brpint
brtablespoon :=        15 ml            // Also 5/8 brfloz, approx 17.7 ml
brteaspoon :=          1/3 brtablespoon // Also 1/4 brtablespoon
dessertspoon :=        2 brteaspoon
brtsp :=               brteaspoon
brtbl :=               brtablespoon
dsp :=                 dessertspoon

// Australian

australiatablespoon := 20 ml
austbl :=              australiatablespoon

// Chinese
// Thai measurements are very similar so the name must be qualified
chinesecatty :=               1/2 kg         
oldchinesecatty :=            4/3 lbs       // Before metric conversion.
chinesetael :=           1/16 oldchinesecatty 
chinesemace :=           1/10 chinesetael
oldchinesepicul :=             100 oldchinesecatty
chinesepicul :=                100 chinesecatty      // Chinese usage

// Thai weights
thaitical  := 15 grams     
thaibaht   := thaitical    // New name for thaitical, not to be confused with
                           // the Thai currency called "Thailand_baht". 
thaisalung := 1/4 thaitical
thaifung   := 1/2 thaisalung
thaisatang := 1/100 thaitical
thaisadtahng := thaisatang         // Alternate transliteration 
thaitamlung := 4 thaitical
thaicatty   := 10 thaitamlung
thaichang   := 2 thaicatty
thaihap     := 50 thaichang
thaipicul   := thaihap
thaikoyan   := 20 thaipicul


// Japanese

japancup :=            200 ml         

jo := 71 inches * 35.5 inches   // The area of a standard tatami mat.
tatamimat := jo

tsubo := 2 jo   // Used in agriculture

// densities of cooking ingredients from The Cake Bible by Rose Levy Beranbaum
// so you can convert '2 cups sugar' to grams, for example, or in the other
// direction grams could be converted to 'cup flour_scooped'.  

butter :=              8. oz/cup
butter_clarified :=    6.8 oz/cup
cocoa_butter :=        9. oz/cup
shortening :=          6.75 oz/cup    // vegetable shortening
stickbutter := 1/4 lb 
vegetable_oil :=       7.5 oz/cup
cakeflour_sifted :=    3.5 oz/cup     // The density of flour depends on the  
cakeflour_spooned :=   4. oz/cup      // measuring method.  "Scooped",  or    
cakeflour_scooped :=   4.5 oz/cup     // "dip and sweep" refers to dipping a  
flour_sifted :=        4. oz/cup      // measure into a bin, and then sweeping
flour_spooned :=       4.25 oz/cup    // the excess off the top.  "Spooned"   
flour_scooped :=       5. oz/cup      // means to lightly spoon into a measure
breadflour_sifted :=   4.25 oz/cup    // and then sweep the top.  Sifted means
breadflour_spooned :=  4.5 oz/cup     // sifting the flour directly into a    
breadflour_scooped :=  5.5 oz/cup     // measure and then sweeping the top.   
cornstarch :=          120. grams/cup
dutchcocoa_sifted :=   75. g/cup       // These are for Dutch processed cocoa
dutchcocoa_spooned :=  92. g/cup
dutchcocoa_scooped :=  95. g/cup
cocoa_sifted :=        75. g/cup       // These are for nonalkalized cocoa
cocoa_spooned :=       82. g/cup
cocoa_scooped :=       95. g/cup
heavycream :=          232. g/cup
milk :=                242. g/cup
sourcream :=           242. g/cup
molasses :=            11.25 oz/cup
cornsyrup :=           11.5 oz/cup
honey :=               11.75 oz/cup
sugar :=               200. g/cup
powdered_sugar :=      4. oz/cup
brownsugar_light :=    217. g/cup      // packed
brownsugar_dark :=     239. g/cup

baking_powder :=       4.6 grams / tsp
salt :=                6 g / tsp
koshersalt :=          2.8 g / tsp    // Diamond Crystal salt, from package
                                      // Note that Morton kosher salt is 
                                      // much denser.  

ethanol := 0.7893 g/cm^3   // Density of ethanol
alcohol := ethanol         // For now, density of ethanol
methanol := 0.79130 g/cm^3 // Density of methanol

// Egg weights and volumes for a USA large egg

egg :=                 50. grams
eggwhite :=            30. grams
eggyolk :=             18.6 grams
eggvolume :=           3. tablespoons + 1/2 tsp
eggwhitevolume :=      2. tablespoons
eggyolkvolume :=       3.5 tsp


//
// Units derived from imperial system
//

ouncedal :=            oz ft / s^2    // force which accelerates an ounce
                                      //    at 1 ft/s^2
poundal :=             lb ft / s^2    // same thing for a pound
tondal :=              ton ft / s^2   // and for a ton
pdl :=                 poundal
psi :=                 pound force / inch^2
psia :=                psi            // absolute pressure
tsi :=                 ton force / inch^2
reyn :=                psi sec
lbf :=                 lb force
slug :=                lbf s^2 / ft
slugf :=               slug force
slinch :=              lbf s^2 / inch // Mass unit derived from inch second
slinchf :=             slinch force   //   pound-force system.  Used in space
                                      //   applications where in/sec^2 was a
                                      //   natural acceleration measure. 
geepound :=            slug
tonf :=                ton force
lbm :=                 lb
kip :=                 1000 lbf    // from kilopound
mil :=                 1/1000 inch
thou :=                1/1000inch
circularinch :=        1/4 pi in^2 // area of a one-inch diameter circle
circularmil :=         1/4 pi mil^2// area of one-mil diameter circle
cmil :=                circularmil
cental :=              100 pound
centner :=             cental
caliber :=             1/100 inch   // for measuring bullets
duty :=                ft lbf
celo :=                ft / s^2
jerk :=                ft / s^3
australiapoint :=      1/100 inch   // The "point" is used to measure rainfall
                                    //   in Australia
sabin :=               ft^2         // Measure of sound absorption equal to the
                                    //   absorbing power of one square foot of
                                    //   a perfectly absorbing material.  The
                                    //   sound absorptivity of an object is the
                                    //   area times a dimensionless
                                    //   absorptivity coefficient.
standardgauge :=      4 ft + 8.5 in // Standard width between railroad track
flag :=               5 ft^2        // Construction term referring to sidewalk.
rollwallpaper :=      30 ft^2       // Area of roll of wall paper
fillpower :=          in^3 / ounce  // Density of down at standard pressure.
                                    //   The best down has 750-800 fillpower. 
pinlength :=          1/16 inch     // A//17 pin is 17/16 in long in the USA.
buttonline :=         1/40 inch     // The line was used in 19th century USA
                                    //   to measure width of buttons.
scoopnumber :=        quart^-1      // Ice cream scoops are labeled with a  
                                    //   number specifying how many scoops  
                                    //   fill a quart.
//
// Other units of work, energy, power, etc
//


// Btu definitions: energy to raise a pound of water 1 degF
// "Btu" is the correct capitalization.
Btu :=                 cal lb degrankine / (gram K)// international table BTU
btu :=                 Btu
BTU :=                 btu
britishthermalunit :=  Btu
Btu_IT :=              Btu
btu_IT :=              Btu_IT
Btu_th :=              cal_th lb degrankine / (gram K)
btu_th :=              Btu_th
Btu_mean :=            cal_mean lb degrankine / (gram K)
btu_mean :=            Btu_mean
quad :=                quadrillion Btu

ECtherm :=             105506000 J   // Exact definition, close to 1e5 Btu
UStherm :=             105480400 J  // Exact definition
therm :=               UStherm

// The horsepower is supposedly the power of one horse pulling.   Obviously
// different people had different horses.

horsepower :=          550 foot pound force / sec  // Invented by James Watt
hp :=                  horsepower
metrichorsepower :=    75 kilogram force meter / sec
electrichorsepower :=  746 W
boilerhorsepower :=    9809.50 W
waterhorsepower :=     746.043 W
brhorsepower :=        745.70 W
donkeypower :=         250 W
Wh :=                  watt hour

// Thermal insulance and conductivity.

Rvalue :=         degrankine ft^2 hr / Btu  // r-value, U.S. insulation figure
Cvalue :=         1/Rvalue       // C-value U.S. insulation conductance rating
kvalue := Btu in / (ft^2 hr degF) // k-value, insulation conductance/in thick
Uvalue :=         1/Rvalue
europeanUvalue := watt / (m^2 K)
RSI :=                 K m^2 / W                 // SI insulation figure

// The following definitions are per NIST Special Publication 811:
// https://physics.nist.gov/Pubs/SP811/appenB9.html
W / (m K)   ||| thermal_conductivity
m^2 K / W   ||| thermal_insulance
K / W       ||| thermal_resistance
m K / W     ||| thermal_resistivity

// Term not defined by SI, somewhat questionable.  Used in building trade.
W / (m^2 K) ||| thermal_conductance

// Defined by the BIPM,
//  http://www.bipm.org/pdf/si-brochure.pdf
J/kg        ||| specific_energy
W/m^2       ||| heat_flux_density
J/mol       ||| molar_energy
J/(mol K)   ||| molar_heat_capacity


// kvalue is defined as the amount of
// heat that will be transmitted through a one inch thick piece of
// homogenous material, one square foot in size, in one hour, when
// there is a one degree Fahrenheit temperature difference.
//
// Cvalue is the kvalue multiplied by the thickness in inches and thus
// gives the thermal conductance of a real piece of material with a given
// thickness.   
// Rvalue is the reciprocal of this, and refers to the thermal insulance of a
// real piece of material of a given, concrete thickness.

clo :=                 0.155 K m^2 / W// Supposed to be the insulance 
                                      // required to keep a resting person
                                      // comfortable indoors.  The value
                                      // given is from NIST and the CRC,
                                      // but [5] gives a slightly different
                                      // value of 0.875 ft^2 degF hr / Btu.
// Misc other measures

clausius :=            1ee3 cal/K      // A unit of physical entropy
langley :=             thermcalorie/cm^2
poncelet :=            100 kg force m / s
tonrefrigeration :=    ton 144 Btu / (lb day)// One ton refrigeration is
                                       // the rate of heat extraction required
                                       // turn one ton of water to ice in
                                       // a day.  Ice is defined to have a
                                       // latent heat of 144 Btu/lb.

tonsrefrigeration :=   tonrefrigeration  // Irregular plural
tonref :=              tonrefrigeration
refrigeration :=       tonref / ton
frigorie :=            1000 cal_fifteen  // Used in refrigeration engineering.


// Energy in combustible fuels

TNT :=                 10^9 calories/ton  // So you can write tons TNT, this
                                          // is a defined, not measured, value
    /*  From Department of the Army's authoritative study: "Effects of
        Nuclear Weapons", footnote 3 to section 1.45, available at:
        http://www.fourmilab.ch/etexts/www/effects/

       "The majority of the experimental and theoretical values of the
       explosive energy released by TNT range from 900 to 1,100 calories per
       gram.  At one time, there was some uncertainty as to whether the term
       "kiloton" of TNT referred to a short kiloton (2 x 10^6 pounds), a
       metric kiloton (2.205 x 10^6 pounds), or a long kiloton (2.24 x 10^6
       pounds).  In order to avoid ambiguity, it was agreed that the term
       "kiloton" would refer to the release of 10^12 calories of explosive
       energy.  This is equivalent to 1 short kiloton of TNT if the energy
       release is 1,102 calories per gram or to 1 long kiloton if the energy
       is 984 calories per gram of TNT."

       So, evidently they don't quite specify which ton is required, but
       rather defined the phrase "kiloton" (of TNT is implied) as a new unit
       that just means 10^12 calories.  It's a measure of energy, not an
       energy density, and to be rigorous, we shouldn't divide by the mass.
       But as a practical matter, we will want to divide by mass.  Of all the
       different types of tons available, the one that matches this definition
       the closest shows that the short ton (2000 lb) was almost certainly
       originally intended, and most closely matches this definition. 

       In addition, people have questioned if the calorie mentioned was the
       international calorie or the "thermal calorie", (in Frink, cal_th).

       To disambiguate this, on page 643, in the section "Guide to SI Units",
       they cite the conversion factor:  

       calorie = 4.187 J

       (to 3 decimal places.  This corresponds more closely to the exact value
       of the international calorie of 4.1868 J, and rules against the use of
       the thermal calorie which would be 4.184 J/ton. No idea why they
       truncated an exact value to an almost-exact value, but one should note
       that no figures in that section have more than 4 significant figures,
       which probably explains it.)


       NIST Special Publication 811 lists the definition:
       https://www.nist.gov/physical-measurement-laboratory/nist-guide-si-appendix-b8#T

       ton of TNT (energy equivalent) = 4.184e9 J

       However, this is not clear as to which kind of ton is intended.  All of
       the other tons listed in that section are identified, but not this
       case.  (Yet another problem with SP811 that I'll have to report.)  If
       we assume that this is also for a short ton, it matches the definition
       from the Army study to more than 3 decimal places, so we'll assume that
       the short ton is intended.  Since this citation is so vague, the Army
       study has to be taken as more authoritative until SP811 is fixed or
       another more authoritative citation can be found. */

/** Alan's Editorializing:

    I would like to have more standardized energies for various fuels but it
    gets really ridiculous.  Some people have cited Frink's definition of
    "gasoline" to have up to 10% overestimation of the energy in a gallon of
    gasoline.   That may be true but it will vary in the quality of the
    gasoline and the efficiency in which it is combusted (some products may
    not burn in common processes but you may convert their energies with
    more-involved processes.)

    A monthly-updated source for the energy in various fuels (along with their
    usage) can be found somewhere in the Monthly Energy Review (MER):
    https://www.eia.gov/totalenergy/data/monthly/pdf/mer.pdf

    Which is a non-machine-parseable PDF file with tons of other stuff in it.
    It is really annoying in that it contains energy content of various fuels
    like gasoline as "Million Btu per Barrel" but as you probably know, there
    are lots of definitions for "barrel" (this data file contains 15 different
    definitions) so you have to hunt for what that means.

    And then they even have different internal definitions of "barrel" like
    "residual fuel oil equivalent barrel" or "fuel oil equivalent barrel" and
    then they mention "standard cubic foot" for hydrogen except there
    is no "standard cubic foot" as some fields define it at different
    temperatures and pressures.  See Appendix A in the above document.

    As a result, you will have to do further digging to find out what barrel
    they even mean or which "standard cubic foot" they even mean!  And after
    this, you will have to do further digging to figure out which Btu they
    mean!  (Frink has at least 4 different definitions for Btu)

    And after all of this, you will find that the MER gives different values
    of the energy content per barrel for various years!  And it varies a lot!
    For example, Table A2 says that the approximate heat content of
    "Natural Gas Plant Liquids" in "Million Btu per Barrel" has ranged from
    4.470 in the year 1950 to
    3.593 in the year 2021

    Augh!  This means that the variation in "Natural Gas Plant Liquids" has
    varied by more than 34% over that time.

    ***

    There is also the EPA Fuel Economy Labeling information which allow the
    U.S. Department of Energy to post the annual Fuel Economy Guide:
    https://www.epa.gov/fueleconomy/basic-information-fuel-economy-labeling

    This gives a definition of the MPGe (miles per gallon electric) which
    states that a gallon of gasoline is equivalent to 33.7 kWh/gallon and MPGe
    is thus sensibly defined as
    
    MPGe := miles / (33.7 kWh)

    so a car that uses 33.7 kWh to travel 100 miles is 100 MPGe.  (You will
    see a lot of confused stuff that says MPGe is (33.7 kWh) / (100 miles) but
    that makes little sense as a magnitude or dimensionally.)

    However, the Federal Register
    Federal Register / Vol. 65, No. 113 / Monday, June 12, 2000 / Rules and
    Regulations, p. 36987
    
    available at:
    http://frwebgate.access.gpo.gov/cgi-bin/getdoc.cgi?dbname=2000_register&docid=00-14446-filed.pdf

    lists derivations of the energy content of gasoline as
    "C = Watt-hours of energy per gallon of gasoline conversion factor = 33,705
Wh/gal"

    Which is 33.705 kWh per gallon gasoline compared to the EPA documents that
    state    33.70  kWh per gallon gasoline.  Which is right?  Which is the
    law?  What is the law?

    Note that with any such definition there is a discrepancy between the
    current value of the amount of energy in a given volume of gasoline
    (called "gasoline") and the MPGe values.  In Frink's 2022 data file, the
    energy in a gallon of gasoline is given as "1.4e8 J/gallon" which is about
    15% higher than the EPA value, so to make this consistent, Frink's
    estimate for the energy in a gallon of gasoline should probably be revised
    downwards to be self-consistent with MPGe if/when that is implemented.
*/

PETN :=                6.01e6 J/kg     // An explosive compound,
                                       // Pentaerythrite tetranitrate
                                       // used in plastic explosive like
                                       // Semtex

MPGe :=                miles / (33.7 kWh)  // EPA definition, of miles per
                                           // gallon, electric.  See above.
mpge :=                MPGe
gasoline :=            33.7 kWh / gallon  // So you can convert energy
                                          // to gallons gasoline.  This now
					  // matches the EPA definition for
					  // MPGe.  This definition was
					  // changed in the Frink data from
					  // 1.4e8 J/gallon (which is about
					  // 38.88 kWh/gallon) on 2022-11-03.
					  // The previous definition may have
					  // been more accurate for very
					  // efficient combustion of
					  // gasoline, but this makes it
					  // match with EPA definitions.
					  // 
					  // For example,
					  // 100 MPGe -> miles/(gallon gasoline)
				          //   gives
					  // 100.0
					  
natural_gas :=         1.09e6 J/foot^3 // Energy in natural gas
naturalgas :=          natural_gas
propane :=             9.63e7 J/gallon // Energy in liquid propane
kerosene :=            1.42e8 J/gallon // Energy in liquid kerosene
oil :=                 41.868 GJ/metricton
coal :=                18.20 GJ/metricton

//
// Permeability: The permeability or permeance, n, of a substance determines
// how fast vapor flows through the substance.  The formula W = n A dP
// holds where W is the rate of flow (in mass/time), n is the permeability,
// A is the area of the flow path, and dP is the vapor pressure difference.
//
// Alan's Veto:  These are damned, damned sketchy, and are going to go.

// perm_0C :=             grain / (hr ft^2 inHg)
// perm_zero :=           perm_0C
// perm_0 :=              perm_0C
// perm :=                perm_0C
//perm_23C :=            grain / (hr ft^2 in-Hg23C)
//perm_twentythree :=    perm_23C

//
// Counting measures
//

unity :=               1
pair :=                2
couple :=              2
brace :=               2
nest :=                3
dickers :=             10
dozen :=               12
bakersdozen :=         13
score :=               20
flock :=               40
timer :=               40
shock :=               60
gross :=               144
greatgross :=          12 gross

// Paper counting measure

shortquire :=          24
quire :=               25
shortream :=           480
ream :=                500     
perfectream :=         516
bundle :=              2 reams
bale :=                5 bundles

//
// Paper measures
//

// USA paper sizes 

lettersize :=          8.5 inch 11 inch
legalsize :=           8.5 inch 14 inch
ledgersize :=          11 inch 17 inch
executivesize :=       7.25 inch 10.5 inch
Apaper :=              8.5 inch 11 inch
Bpaper :=              11 inch 17 inch
Cpaper :=              17 inch 22 inch
Dpaper :=              22 inch 34 inch
Epaper :=              34 inch 44 inch

// The metric paper sizes are defined so that if a sheet is cut in half
// along the short direction, the result is two sheets which are
// similar to the original sheet.  This means that for any metric size,
// the long side is close to sqrt(2) times the length of the short
// side.  Each series of sizes is generated by repeated cuts in half, 
// with the values rounded down to the nearest millimeter.  

A0paper :=             841 mm 1189 mm  // The basic size in the A series
A1paper :=             594 mm  841 mm  // is defined to have an area of 
A2paper :=             420 mm  594 mm  // one square meter.
A3paper :=             297 mm  420 mm
A4paper :=             210 mm  297 mm
A5paper :=             148 mm  210 mm
A6paper :=             105 mm  148 mm
A7paper :=              74 mm  105 mm
A8paper :=              52 mm   74 mm
A9paper :=              37 mm   52 mm
A10paper :=             26 mm   37 mm

B0paper :=            1000 mm 1414 mm  // The basic B size has an area
B1paper :=             707 mm 1000 mm  // of sqrt(2) square meters.  
B2paper :=             500 mm  707 mm
B3paper :=             353 mm  500 mm
B4paper :=             250 mm  353 mm
B5paper :=             176 mm  250 mm
B6paper :=             125 mm  176 mm
B7paper :=              88 mm  125 mm
B8paper :=              62 mm   88 mm
B9paper :=              44 mm   62 mm
B10paper :=             31 mm   44 mm

C0paper :=             917 mm 1297 mm  // The basic C size has an area
C1paper :=             648 mm  917 mm  // of sqrt(sqrt(2)) square meters.
C2paper :=             458 mm  648 mm
C3paper :=             324 mm  458 mm  // Intended for envelope sizes
C4paper :=             229 mm  324 mm
C5paper :=             162 mm  229 mm
C6paper :=             114 mm  162 mm
C7paper :=              81 mm  114 mm
C8paper :=              57 mm   81 mm
C9paper :=              40 mm   57 mm
C10paper :=             28 mm   40 mm

// gsm (Grams per Square Meter), a sane, metric paper weight measure

gsm :=                 grams / meter^2

// Also called areal density
kg m^-2 ||| area_density

// In the USA, a collection of crazy historical paper measures are used.  Paper
// is measured as a weight of a ream of that particular type of paper.  This is
// sometimes called the "substance" or "basis" (as in "substance 20" paper).
// The standard sheet size or "basis size" varies depending on the type of
// paper.  As a result, 20 pound bond paper and 50 pound text paper are actually
// about the same weight.  The different sheet sizes were historically the most
// convenient for printing or folding in the different applications.  These
// different basis weights are standards maintained by American Society for
// Testing Materials (ASTM) and the American Forest and Paper Association
// (AF&PA).

poundbookpaper :=      lb / (25 inch 38 inch ream)
lbbook :=              poundbookpaper
poundtextpaper :=      poundbookpaper
lbtext :=              poundtextpaper
poundoffsetpaper :=    poundbookpaper   // For offset printing
lboffset :=            poundoffsetpaper
poundbiblepaper :=     poundbookpaper   // Designed to be lightweight, thin,
lbbible :=             poundbiblepaper  // strong and opaque.
poundtagpaper :=       lb / (24 inch 36 inch ream)
lbtag :=               poundtagpaper
poundbagpaper :=       poundtagpaper
lbbag :=               poundbagpaper
poundnewsprintpaper := poundtagpaper
lbnewsprint :=         poundnewsprintpaper
poundposterpaper :=    poundtagpaper
lbposter :=            poundposterpaper
poundtissuepaper :=    poundtagpaper
lbtissue :=            poundtissuepaper
poundwrappingpaper :=  poundtagpaper
lbwrapping :=          poundwrappingpaper
poundwaxingpaper :=    poundtagpaper
lbwaxing :=            poundwaxingpaper
poundglassinepaper :=  poundtagpaper
lbglassine :=          poundglassinepaper
poundcoverpaper :=     lb / (20 inch 26 inch ream)
lbcover :=             poundcoverpaper
poundindexpaper :=     lb / (25.5 inch 30.5 inch ream)
lbindex :=             poundindexpaper
poundindexbristolpaper :=   poundindexpaper
lbindexbristol :=      poundindexpaper
poundbondpaper :=      lb / (17 inch 22 inch ream) // Bond paper is stiff and
lbbond :=              poundbondpaper              // durable for repeated
poundwritingpaper :=   poundbondpaper              // filing, and it resists
lbwriting :=           poundwritingpaper           // ink penetration.  
poundledgerpaper :=    poundbondpaper
lbledger :=            poundledgerpaper
poundcopypaper :=      poundbondpaper
lbcopy :=              poundcopypaper
poundblottingpaper :=  lb / (19 inch 24 inch ream)
lbblotting :=          poundblottingpaper
poundblankspaper :=    lb / (22 inch 28 inch ream)
lbblanks :=            poundblankspaper
poundpostcardpaper :=  lb / (22.5 inch 28.5 inch ream)
lbpostcard :=          poundpostcardpaper
poundweddingbristol := poundpostcardpaper
lbweddingbristol :=    poundweddingbristol
poundbristolpaper :=   poundweddingbristol
lbbristol :=           poundbristolpaper
poundboxboard :=       lb / (1000 ft^2)
lbboxboard :=          poundboxboard
poundpaperboard :=     poundboxboard
lbpaperboard :=        poundpaperboard

// When paper is marked in units of M, it means the weight of 1000 sheets of the
// given size of paper.  To convert this to paper weight, divide by the size of
// the paper in question.

paperM :=              lb / 1000       

//
// Old French distance measures, from French Weights and Measures
// Before the Revolution by Zupko
//

frenchfoot :=          4500/13853 m     // pied de roi, the standard of Paris.
pied :=                frenchfoot       //   Half of the hashimicubit,
frenchfeet :=          frenchfoot       //   instituted by Charlemagne.
frenchinch :=          1/12 frenchfoot  //   This exact definition comes from
frenchthumb :=         frenchinch       //   a law passed on 10 Dec 1799 which
pouce :=               frenchthumb      //   fixed the meter at 
                                         //   3 frenchfeet + 11.296 lignes.
frenchline :=          1/12 frenchinch  // This is supposed to be the size
ligne :=               frenchline       //   of the average barleycorn
frenchpoint :=         1/12 frenchline
toise :=               6 frenchfeet
arpent :=              180^2 pied^2     // The arpent is 100 square perches,
                                         // but the perche seems to vary a lot
                                         // and can be 18 feet, 20 feet, or 22
                                         // feet.  This measure was described
                                         // as being in common use in Canada in
                                         // 1934 (Websters 2nd).  The value
                                         // given here is the Paris standard
                                         // arpent.

//
// Printing
//

fournierpoint :=       0.1648 inch / 12 // First definition of the printers
                                         // point made by Pierre Fournier who
                                         // defined it in 1737 as 1/12 of a
                                         // cicero which was 0.1648 inches.
olddidotpoint :=       1/72 frenchinch  // François Ambroise Didot, one of 
                                         // a family of printers, changed
                                         // Fournier's definition around 1770 
                                         // to fit to the French units then in
                                         // use.  
bertholdpoint :=       1/2660 m         // H. Berthold tried to create a 
                                         // metric version of the didot point
                                         // in 1878.  
INpoint :=             0.4 mm           // This point was created by a 
                                         // group directed by Fermin Didot in
                                         // 1881 and is associated with the 
                                         // imprimerie nationale.  It doesn't
                                         // seem to have been used much.
germandidotpoint :=    0.376065 mm      // Exact definition appears in DIN
                                        // 16507, a German standards document
                                        // of 1954.  Adopted more broadly  in
                                        // 1966 by ???
metricpoint :=         3/8 mm           // Proposed in 1977 by Eurograf

point :=          0.013837ee0 inch    // exact, NIST Handbook 44, Appendix 3
printerspoint :=       point

texscaledpoint :=      1/65536 point    // The TeX typesetting system uses
texsp :=               texscaledpoint   // this for all computations.
computerpoint :=       1/72 inch        // The American point was rounded 
computerpica :=        12 computerpoint // to an even 1/72 inch by computer
postscriptpoint :=     computerpoint    // people at some point. 
pspoint :=             postscriptpoint
Q :=                   1/4 mm           // Used in Japanese phototypesetting
                                        // Q is for quarter
frenchprinterspoint := olddidotpoint
didotpoint :=          germandidotpoint // This seems to be the dominant value
europeanpoint :=       didotpoint       // for the point used in Europe
cicero :=              12 didotpoint

stick :=               2 inches

// Type sizes

excelsior :=           3 point
brilliant :=           3.5 point
diamond :=             4 point
pearl :=               5 point
agate :=               5.5 point
ruby :=                agate     // British
nonpareil :=           6 point
mignonette :=          6.5 point
emerald :=             mignonette// British
minion :=              7 point
brevier :=             8 point
bourgeois :=           9 point
longprimer :=          10 point
smallpica :=           11 point
pica :=                12 point
english :=             14 point
columbian :=           16 point
greatprimer :=         18 point
paragon :=             20 point
meridian :=            44 point
canon :=               48 point

// German type sizes
nonplusultra :=        2 didotpoint
brillant :=            3 didotpoint
diamant :=             4 didotpoint
perl :=                5 didotpoint
nonpareille :=         6 didotpoint
kolonel :=             7 didotpoint
petit :=               8 didotpoint
borgis :=              9 didotpoint
korpus :=              10 didotpoint
corpus :=              korpus
garamond :=            korpus
mittel :=              14 didotpoint
tertia :=              16 didotpoint
text :=                18 didotpoint
kleine_kanon :=        32 didotpoint
kanon :=               36 didotpoint
grosse_kanon :=        42 didotpoint
missal :=              48 didotpoint
kleine_sabon :=        72 didotpoint
grosse_sabon :=        84 didotpoint

//
// Information theory units
//

hartley :=             3.32192809488 bits    // log[10]/log[2] bits, or the
                                             //  entropy of a
                                             //  uniformly-distributed
                                             //  random variable over 10
                                             //  symbols.
trit :=                1.58496250072 bits    // log[3]/log[2]
nat :=                 1.44269504088896 bits // log[e]/log[2] 

//
// Computer
//

bps :=                 bit/sec             // Sometimes the term "baud" is
                                           //   incorrectly used to refer to
                                           //   bits per second.  Baud refers
                                           //   to symbols per second.  Modern
                                           //   modems transmit several bits
                                           //   per symbol.

byte :=                8 bit               // Not all machines had 8 bit
                                           //   bytes, but these days most of
                                           //   them do.  But beware: for
                                           //   transmission over modems, a
                                           //   few extra bits are used so
                                           //   there are actually 10 bits per
                                           //   byte.

nybble :=              4 bits              // Half of a byte. Sometimes 
                                           //   equal to different lengths
                                           //   such as 3 bits.  
nibble :=              nybble               

// In computers, "kilo" tends to mean a multiple of 1024 or 2^10.
// This obviously interferes with the standard meanings.
//
// In December 1998 the International Electrotechnical Commission (IEC), the
// leading international organization for worldwide standardization in
// electrotechnology, approved as an IEC International Standard names and 
// symbols for prefixes for binary multiples for use in the fields of data
// processing and data transmission.  One would say "kibibit" to mean 1024 bits
//
// https://physics.nist.gov/cuu/Units/binary.html

// Prefixes
kibi ::- 2^10           // kilobinary
mebi ::- 2^20           // megabinary
gibi ::- 2^30           // gigabinary
tebi ::- 2^40           // terabinary
pebi ::- 2^50           // petabinary
exbi ::- 2^60           // exabinary

// Official symbols
Ki :- kibi
Mi :- mebi
Gi :- gibi
Ti :- tebi
Pi :- pebi
Ei :- exbi

jiffy :=               1/100 sec    // This is defined in the Jargon File
jiffies :=             jiffy        // (http://www.jargon.org) as being the
                                    // duration of a clock tick for measuring
                                    // wall-clock time.  Supposedly the value
                                    // used to be 1/60 sec or 1/50 sec
                                    // depending on the frequency of AC power,
                                    // but then 1/100 sec became more common.
                                    // On linux systems, this term is used and
                                    // for the Intel based chips, it does have
                                    // the value of .01 sec.  The Jargon File
                                    // also lists two other definitions:
                                    // millisecond, and the time taken for
                                    // light to travel one foot.

//
// yarn and cloth measures
//

// yarn linear density

m kg^-1 ||| reciprocal_linear_mass_density

woolyarnrun :=         1600 yard/pound// 1600 yds of "number 1 yarn" weighs
                                       // a pound.  
yarncut :=             300 yard/pound // Less common system used in
                                       // Pennsylvania for wool yarn
cottonyarncount :=     840 yard/pound
linenyarncount :=      300 yard/pound // Also used for hemp and ramie
worstedyarncount :=    1680 ft/pound
metricyarncount :=     meter/gram
kg/m ||| linear_mass_density
tex :=                 gram / km   // rational metric yarn measure, meant
denier :=              1/9 tex           // used for silk and rayon
manchesteryarnnumber := drams/(1000 yards)// old system used for silk
pli :=                 lb/in
typp :=                1000 yd/lb
asbestoscut :=         100 yd/lb   // used for glass and asbestos yarn

drex :=                0.1 tex     // to be used for any kind of yarn


// yarn and cloth length

skeincotton :=         80*54 inch  // 80 turns of thread on a reel with a
                                    //  54 in circumference (varies for other
                                    //  kinds of thread)
cottonbolt :=          120 ft      // cloth measurement
woolbolt :=            210 ft
bolt :=                cottonbolt
heer :=                600 yards
cut :=                 300 yards   // used for wet-spun linen yarn
lea :=                 300 yards

//
// drug dosage
//

mcg :=                 microgram       // Frequently used for vitamins
iudiptheria :=         62.8 microgram  // IU is for international unit
iupenicillin :=        0.6 microgram
iuinsulin :=           41.67 microgram
drop :=                1/20 ml         // The drop was an old "unit" that was
                                       // replaced by the minim.  But I was
                                       // told by a pharmacist that in his
                                       // profession, the conversion of 20
                                       // drops per ml is actually used. 
bloodunit :=          450 ml           // For whole blood.  For blood
                                       // components, a blood unit is the
                                       // quanity of the component found in a
                                       // blood unit of whole blood.  The
                                       // human body contains about 12 blood
                                       // units of whole blood.  

//
// fixup units for times when prefix handling doesn't do the job
//

hectare :=             hectoare
ha      :=             hectare
megohm :=              megaohm
kilohm :=              kiloohm
microhm :=             microohm

cent :=                1/100 dollar

// British currency
//
// These have been supplanted by the PoundSource definitions which include
// historical exchange rates for years back to 1600.
//
//shilling :=            1/20 britainpound  // Before decimalisation, there
//oldpence :=            1/12 shilling      // were 20 shillings to a pound,
                                            // each of twelve old pence
//quid :=                britainpound       // Slang names
//fiver :=               5 quid
//tenner :=              10 quid

//
// Units used for measuring volume of wood
//

cord :=                4 ft * 4 ft * 8 ft// 4 ft by 4 ft by 8 ft bundle of wood
facecord :=            1/2 cord
cordfoot :=            1/8 cord    // One foot long section of a cord
cordfeet :=            cordfoot
rick := 4 ft 8 ft 16 inches        // Stack of firewood

housecord :=           1/3 cord    // Used to sell firewood for residences, 
                                   //   often confusingly called a "cord"
boardfoot :=           ft^2 inch   // Usually 1 inch thick wood
boardfeet :=           boardfoot
fbm :=                 boardfoot   // feet board measure
stere :=               m^3
st :=                  stere
timberfoot :=          ft^3        // Used for measuring solid blocks of wood
standard :=            120 12 ft 11 in 1.5 in // This is the St Petersburg or
                                    //   Pittsburg standard.  Apparently the
                                    //   term is short for "standard hundred"
                                    //   which was meant to refer to 100 pieces
                                    //   of wood (deals).  However, this
                                    //   particular standard is equal to 120
                                    //   deals which are 12 ft by 11 in by 1.5
                                    //   inches (not the standard deal). 

// In Britain, the deal is apparently any piece of wood over 6 feet long, over
// 7 wide and 2.5 inches thick.  The OED doesn't give a standard size.  A piece
// of wood less than 7 inches wide is called a "batten".  This unit is now used
// exclusively for fir and pine.

deal :=         12 ft 11 in 2.5 in // The standard North American deal [OED]
wholedeal :=    1/2 deal           // If it's half as thick as the standard
                                   //   deal it's called a "whole deal"!
splitdeal :=    1/2 wholedeal      // And half again as thick is a split deal.


//
// Gas and Liquid flow units
//

// Some horribly-named flow units that I've never seen used other than once
// (unexplained) in the Guinness Book of World Records which has degraded into
// tabloid trash.
cumec :=               m^3/s
cusec :=               ft^3/s

sverdrup :=            10ee6 m^3/s  // http://en.wikipedia.org/wiki/Sverdrup

// Conventional abbreviations for fluid flow units

gph :=                 gal/hr
gpm :=                 gal/min
mgd :=                 megagal/day
cf  :=                 ft^3
ccf :=                 100 cf      // sorta dubious, but used.
cfs :=                 cf/s
cfh :=                 cf/hour
cfm :=                 cf/min
lpm :=                 liter/min

// Miner's inch:  This is an old historic unit used in the Western  United
// States.  It is generally defined as the rate of flow through a one square
// inch hole at a specified depth such as 4 inches.  In the late 19th century,
// volume of water was sometimes measured in the "24 hour inch".  Values for the
// miner's inch were fixed by state statues.  (This information is from a web
// site operated by the Nevada Division of Water Planning:  The Water Words
// Dictionary at http://www.state.nv.us/cnr/ndwp/dict-1/waterwds.htm.)

minersinchAZ :=        1.5 ft^3/min
minersinchCA :=        1.5 ft^3/min 
minersinchMT :=        1.5 ft^3/min
minersinchNV :=        1.5 ft^3/min
minersinchOR :=        1.5 ft^3/min
minersinchID :=        1.2 ft^3/min
minersinchKS :=        1.2 ft^3/min
minersinchNE :=        1.2 ft^3/min
minersinchNM :=        1.2 ft^3/min
minersinchND :=        1.2 ft^3/min
minersinchSD :=        1.2 ft^3/min
minersinchUT :=        1.2 ft^3/min
minersinchCO :=        1.56 ft^3/min
minersinchBC :=        1.68 ft^3/min  // British Columbia

// In vacuum science and some other applications, gas flow is measured
// as the product of volumetric flow and pressure.  This is useful
// because it makes it easy to compare with the flow at standard
// pressure (one atmosphere).  It also directly relates to the number
// of gas molecules per unit time, and hence to the mass flow if the
// molecular mass is known.

sccm :=                atm cc/min    // 's' is for "standard" to indicate
sccs :=                atm cc/sec    // flow at standard pressure
scfh :=                atm ft^3/hour //
scfm :=                atm ft^3/min
slpm :=                atm liter/min
slph :=                atm liter/hour
lusec :=               liter micron Hg force / s // Used in vacuum science

// Wire gauge: this area is a nightmare with huge charts of wire gauge
// diameters that usually have no clear origin.  There are at least 5 competing
// wire gauge systems to add to the confusion.

// The use of wire gauge is related to the manufacturing method: a metal rod is
// heated and drawn through a hole.  The size change can't be too big.  To get
// smaller wires, the process is repeated with a series of smaller holes.  

// American Wire Gauge (AWG) or Brown & Sharpe Gauge appears to be the most
// important gauge. ASTM B-258 specifies that this gauge is based on geometric
// interpolation between gauge 0000, which is 0.46 inches exactly, and gauge 36
// which is 0.005 inches exactly.  Therefore, the diameter in inches of a wire
// is given by the formula 1/200 92^((36-g)/39).  Note that 92^(1/39) is close
// to 2^(1/6), so diameter is approximately halved for every 6 gauges.  For the
// repeated zero values, use negative numbers in the formula.  The same document
// also specifies rounding rules which seem to be ignored by makers of tables.
// Gauges up to 44 are to be specified with up to 4 significant figures, but no
// closer than 0.0001 inch.  Gauges from 44 to 56 are to be rounded to the
// nearest 0.00001 inch.  The table below gives 4 significant figures for all
// gauges.
//
// In addition to being used to measure wire thickness, this gauge is used to
// measure the thickness of sheets of aluminum, copper, and most metals other
// than steel, iron and zinc.

// The numbers below are DIAMETERS.
wire0000gauge :=       0.4600 in
wire000gauge :=        0.4096 in
wire00gauge :=         0.3648 in
wire0gauge :=          0.3249 in
wire1gauge :=          0.2893 in
wire2gauge :=          0.2576 in
wire3gauge :=          0.2294 in
wire4gauge :=          0.2043 in
wire5gauge :=          0.1819 in
wire6gauge :=          0.1620 in
wire7gauge :=          0.1443 in
wire8gauge :=          0.1285 in
wire9gauge :=          0.1144 in
wire10gauge :=         0.1019 in
wire11gauge :=         0.09074 in
wire12gauge :=         0.08081 in
wire13gauge :=         0.07196 in
wire14gauge :=         0.06408 in
wire15gauge :=         0.05707 in
wire16gauge :=         0.05082 in
wire17gauge :=         0.04526 in
wire18gauge :=         0.04030 in
wire19gauge :=         0.03589 in
wire20gauge :=         0.03196 in
wire21gauge :=         0.02846 in
wire22gauge :=         0.02535 in
wire23gauge :=         0.02257 in
wire24gauge :=         0.02010 in
wire25gauge :=         0.01790 in
wire26gauge :=         0.01594 in
wire27gauge :=         0.01420 in
wire28gauge :=         0.01264 in
wire29gauge :=         0.01126 in
wire30gauge :=         0.01003 in
wire31gauge :=         0.008928 in
wire32gauge :=         0.007950 in
wire33gauge :=         0.007080 in
wire34gauge :=         0.006305 in
wire35gauge :=         0.005615 in
wire36gauge :=         0.005000 in
wire37gauge :=         0.004453 in
wire38gauge :=         0.003965 in
wire39gauge :=         0.003531 in
wire40gauge :=         0.003145 in
wire41gauge :=         0.002800 in
wire42gauge :=         0.002494 in
wire43gauge :=         0.002221 in
wire44gauge :=         0.001978 in
wire45gauge :=         0.001761 in
wire46gauge :=         0.001568 in
wire47gauge :=         0.001397 in
wire48gauge :=         0.001244 in
wire49gauge :=         0.001108 in
wire50gauge :=         0.0009863 in
wire51gauge :=         0.0008783 in
wire52gauge :=         0.0007822 in
wire53gauge :=         0.0006966 in
wire54gauge :=         0.0006203 in
wire55gauge :=         0.0005524 in
wire56gauge :=         0.0004919 in

// Next we have the SWG, the Imperial or British Standard Wire Gauge.  This one
// is piecewise linear, so it is not generated by a simple formula.  It was used
// for aluminum sheets.

brwire0000000gauge :=  0.500 in
brwire000000gauge :=   0.464 in
brwire00000gauge :=    0.432 in
brwire0000gauge :=     0.400 in
brwire000gauge :=      0.372 in
brwire00gauge :=       0.348 in 
brwire0gauge :=        0.324 in
brwire1gauge :=        0.300 in
brwire2gauge :=        0.276 in
brwire3gauge :=        0.252 in
brwire4gauge :=        0.232 in
brwire5gauge :=        0.212 in
brwire6gauge :=        0.192 in
brwire7gauge :=        0.176 in
brwire8gauge :=        0.160 in
brwire9gauge :=        0.144 in
brwire10gauge :=       0.128 in
brwire11gauge :=       0.116 in
brwire12gauge :=       0.104 in
brwire13gauge :=       0.092 in
brwire14gauge :=       0.080 in
brwire15gauge :=       0.072 in
brwire16gauge :=       0.064 in
brwire17gauge :=       0.056 in
brwire18gauge :=       0.048 in
brwire19gauge :=       0.040 in
brwire20gauge :=       0.036 in
brwire21gauge :=       0.032 in
brwire22gauge :=       0.028 in
brwire23gauge :=       0.024 in
brwire24gauge :=       0.022 in
brwire25gauge :=       0.0200 in
brwire26gauge :=       0.0180 in
brwire27gauge :=       0.0164 in
brwire28gauge :=       0.0149 in
brwire29gauge :=       0.0136 in
brwire30gauge :=       0.0124 in
brwire31gauge :=       0.0116 in
brwire32gauge :=       0.0108 in
brwire33gauge :=       0.0100 in
brwire34gauge :=       0.0092 in
brwire35gauge :=       0.0084 in
brwire36gauge :=       0.0076 in
brwire37gauge :=       0.0068 in
brwire38gauge :=       0.0060 in
brwire39gauge :=       0.0052 in
brwire40gauge :=       0.0048 in
brwire41gauge :=       0.0044 in
brwire42gauge :=       0.0040 in
brwire43gauge :=       0.0036 in
brwire44gauge :=       0.0032 in
brwire45gauge :=       0.0028 in
brwire46gauge :=       0.0024 in
brwire47gauge :=       0.0020 in
brwire48gauge :=       0.0016 in
brwire49gauge :=       0.0012 in
brwire50gauge :=       0.0010 in

// The following is from the Appendix to ASTM B 258
// 
// For example, in U.S. gage, the standard for sheet metal is based on the
// weight of the metal, not on the thickness. 16-gage is listed as approximately
// .0625 inch thick and 40 ounces per square foot (the original standard was
// based on wrought iron at .2778 pounds per cubic inch; steel has almost
// entirely superseded wrought iron for sheet use, at .2833 pounds per cubic
// inch). Smaller numbers refer to greater thickness. There is no formula for
// converting gage to thickness or weight.
// 
// It's rather unclear from the passage above whether the plate gauge values are
// therefore wrong if steel is being used.  Reference [15] states that steel is
// in fact measured using this gauge (under the name Manufacturers' Standard
// Gauge) with a density of 501.84 lb/ft3 = 0.2904 lb/in3 used for steel.
// But this doesn't seem to be the correct density of steel (.2833 lb/in3 is
// closer), and nobody else lists these values.  
//
// This gauge was established in 1893 for purposes of taxation.

plate000000gauge :=    15/32 in   // 300 oz / ft^2
plate00000gauge :=     14/32 in   // 280 oz / ft^2
plate0000gauge :=      13/32 in   // 260 oz / ft^2
plate000gauge :=       12/32 in   // 240 oz / ft^2
plate00gauge :=        11/32 in   // 220 oz / ft^2
plate0gauge :=         10/32 in   // 200 oz / ft^2
plate1gauge :=          9/32 in   // 180 oz / ft^2 
plate2gauge :=         17/64 in   // 170 oz / ft^2
plate3gauge :=         16/64 in   // 160 oz / ft^2
plate4gauge :=         15/64 in   // 150 oz / ft^2
plate5gauge :=         14/64 in   // 140 oz / ft^2
plate6gauge :=         13/64 in   // 130 oz / ft^2
plate7gauge :=         12/64 in   // 120 oz / ft^2
plate8gauge :=         11/64 in   // 110 oz / ft^2
plate9gauge :=         10/64 in   // 100 oz / ft^2
plate10gauge :=         9/64 in   //  90 oz / ft^2
plate11gauge :=         8/64 in   //  80 oz / ft^2
plate12gauge :=         7/64 in   //  70 oz / ft^2
plate13gauge :=         6/64 in   //  60 oz / ft^2
plate14gauge :=         5/64 in   //  50 oz / ft^2
plate15gauge :=         9/128 in  //  45 oz / ft^2
plate16gauge :=         8/128 in  //  40 oz / ft^2
plate17gauge :=         9/160 in  //  36 oz / ft^2
plate18gauge :=         8/160 in  //  32 oz / ft^2
plate19gauge :=         7/160 in  //  28 oz / ft^2
plate20gauge :=         6/160 in  //  24 oz / ft^2
plate21gauge :=        11/320 in  //  22 oz / ft^2
plate22gauge :=        10/320 in  //  20 oz / ft^2
plate23gauge :=         9/320 in  //  18 oz / ft^2
plate24gauge :=         8/320 in  //  16 oz / ft^2
plate25gauge :=         7/320 in  //  14 oz / ft^2
plate26gauge :=         6/320 in  //  12 oz / ft^2
plate27gauge :=        11/640 in  //  11 oz / ft^2
plate28gauge :=        10/640 in  //  10 oz / ft^2
plate29gauge :=         9/640 in  //   9 oz / ft^2
plate30gauge :=         8/640 in  //   8 oz / ft^2
plate31gauge :=         7/640 in  //   7 oz / ft^2
plate32gauge :=        13/1280 in //   6.5 oz / ft^2
plate33gauge :=        12/1280 in //   6 oz / ft^2
plate34gauge :=        11/1280 in //   5.5 oz / ft^2
plate35gauge :=        10/1280 in //   5 oz / ft^2
plate36gauge :=         9/1280 in //   4.5 oz / ft^2
plate37gauge :=        17/2560 in //   4.25 oz / ft^2
plate38gauge :=        16/2560 in //   4 oz / ft^2

// Zinc sheet metal gauge

zinc1gauge :=          0.002 in
zinc2gauge :=          0.004 in
zinc3gauge :=          0.006 in
zinc4gauge :=          0.008 in
zinc5gauge :=          0.010 in
zinc6gauge :=          0.012 in
zinc7gauge :=          0.014 in
zinc8gauge :=          0.016 in
zinc9gauge :=          0.018 in
zinc10gauge :=         0.020 in
zinc11gauge :=         0.024 in
zinc12gauge :=         0.028 in
zinc13gauge :=         0.032 in
zinc14gauge :=         0.036 in
zinc15gauge :=         0.040 in
zinc16gauge :=         0.045 in
zinc17gauge :=         0.050 in
zinc18gauge :=         0.055 in
zinc19gauge :=         0.060 in
zinc20gauge :=         0.070 in
zinc21gauge :=         0.080 in
zinc22gauge :=         0.090 in
zinc23gauge :=         0.100 in
zinc24gauge :=         0.125 in
zinc25gauge :=         0.250 in
zinc26gauge :=         0.375 in
zinc27gauge :=         0.500 in
zinc28gauge :=         1.000 in

// USA ring sizes.  Several slightly different definitions seem to be in
// circulation.  According to [15], the interior diameter of size n ring in
// inches is 0.32 n + 0.458 for n ranging from 3 to 13.5 by steps of 0.5.  The
// size 2 ring is inconsistently 0.538in and no 2.5 size is listed.  
//
// However, other sources list 0.455 + 0.0326 n and 0.4525 + 0.0324 n as the
// diameter and list no special case for size 2.  (Or alternatively they are
// 1.43 + .102 n and 1.4216+.1018 n for measuring circumference in inches.)  One
// reference claimed that the original system was that each size was 1/10 inch
// circumference, but that source doesn't have an explanation for the modern
// system which is somewhat different.
//
// This table gives circumferences as listed in [15].  

size2ring :=           0.538 in pi
size3ring :=           0.554 in pi
size3_5ring :=         0.570 in pi
size4ring :=           0.586 in pi
size4_5ring :=         0.602 in pi
size5ring :=           0.618 in pi
size5_5ring :=         0.634 in pi
size6ring :=           0.650 in pi
size6_5ring :=         0.666 in pi
size7ring :=           0.682 in pi
size7_5ring :=         0.698 in pi
size8ring :=           0.714 in pi
size8_5ring :=         0.730 in pi
size9ring :=           0.746 in pi
size9_5ring :=         0.762 in pi
size10ring :=          0.778 in pi
size10_5ring :=        0.794 in pi
size11ring :=          0.810 in pi
size11_5ring :=        0.826 in pi
size12ring :=          0.842 in pi
size12_5ring :=        0.858 in pi
size13ring :=          0.874 in pi
size13_5ring :=        0.890 in pi

// Old practice in the UK measured rings using the "Wheatsheaf gauge" with sizes
// specified alphabetically and based on the ring inside diameter in steps of
// 1/64 inch.  This system was replaced in 1987 by British Standard 6820 which
// specifies sizes based on circumference.  Each size is 1.25 mm different from
// the preceding size.  The baseline is size C which is 40 mm circumference.
// The new sizes are close to the old ones.  Sometimes it's necessary to go
// beyond size Z to Z+1, Z+2, etc.  

sizeAring :=           37.50 mm
sizeBring :=           38.75 mm
sizeCring :=           40.00 mm
sizeDring :=           41.25 mm
sizeEring :=           42.50 mm
sizeFring :=           43.75 mm
sizeGring :=           45.00 mm
sizeHring :=           46.25 mm
sizeIring :=           47.50 mm
sizeJring :=           48.75 mm
sizeKring :=           50.00 mm
sizeLring :=           51.25 mm
sizeMring :=           52.50 mm
sizeNring :=           53.75 mm
sizeOring :=           55.00 mm
sizePring :=           56.25 mm
sizeQring :=           57.50 mm
sizeRring :=           58.75 mm
sizeSring :=           60.00 mm
sizeTring :=           61.25 mm
sizeUring :=           62.50 mm
sizeVring :=           63.75 mm
sizeWring :=           65.00 mm
sizeXring :=           66.25 mm
sizeYring :=           67.50 mm
sizeZring :=           68.75 mm

// Japanese sizes start with size 1 at a 13mm inside diameter and each size is
// 1/3 mm larger in diameter than the previous one.  They are multiplied by pi
// to give circumference. 

jpsize1ring :=         39/3 pi mm
jpsize2ring :=         40/3 pi mm
jpsize3ring :=         41/3 pi mm
jpsize4ring :=         42/3 pi mm
jpsize5ring :=         43/3 pi mm
jpsize6ring :=         44/3 pi mm
jpsize7ring :=         45/3 pi mm
jpsize8ring :=         46/3 pi mm
jpsize9ring :=         47/3 pi mm
jpsize10ring :=        48/3 pi mm
jpsize11ring :=        49/3 pi mm
jpsize12ring :=        50/3 pi mm
jpsize13ring :=        51/3 pi mm
jpsize14ring :=        52/3 pi mm
jpsize15ring :=        53/3 pi mm
jpsize16ring :=        54/3 pi mm
jpsize17ring :=        55/3 pi mm
jpsize18ring :=        56/3 pi mm
jpsize19ring :=        57/3 pi mm
jpsize20ring :=        58/3 pi mm
jpsize21ring :=        59/3 pi mm
jpsize22ring :=        60/3 pi mm
jpsize23ring :=        61/3 pi mm
jpsize24ring :=        62/3 pi mm
jpsize25ring :=        63/3 pi mm
jpsize26ring :=        64/3 pi mm
jpsize27ring :=        65/3 pi mm
jpsize28ring :=        66/3 pi mm
jpsize29ring :=        67/3 pi mm
jpsize30ring :=        68/3 pi mm

// The European ring sizes are the length of the circumference in mm minus 40.

eusize1ring :=         41 mm
eusize2ring :=         42 mm
eusize3ring :=         43 mm
eusize4ring :=         44 mm
eusize5ring :=         45 mm
eusize6ring :=         46 mm
eusize7ring :=         47 mm
eusize8ring :=         48 mm
eusize9ring :=         49 mm
eusize10ring :=        50 mm
eusize11ring :=        51 mm
eusize12ring :=        52 mm
eusize13ring :=        53 mm
eusize14ring :=        54 mm
eusize15ring :=        55 mm
eusize16ring :=        56 mm
eusize17ring :=        57 mm
eusize18ring :=        58 mm
eusize19ring :=        59 mm
eusize20ring :=        60 mm
eusize21ring :=        61 mm
eusize22ring :=        62 mm
eusize23ring :=        63 mm
eusize24ring :=        64 mm
eusize25ring :=        65 mm
eusize26ring :=        66 mm
eusize27ring :=        67 mm
eusize28ring :=        68 mm
eusize29ring :=        69 mm
eusize30ring :=        70 mm

//
// Abbreviations
//

mph :=                 mile/hr
mpg :=                 mile/gal
kph :=                 km/hr
fL :=                  footlambert
fpm :=                 ft/min
fps :=                 ft/s
rpm :=                 rev/min
rps :=                 rev/sec
mi :=                  mile
mbh :=                 1ee3 Btu/hour
mcm :=                 1ee3 circularmil

//
// Radioactivity units
//

becquerel :=           s^-1         // Activity of radioactive source
Bq :=                  becquerel    //
curie :=               37ee9 Bq   // Defined in 1910 as the radioactivity
Ci :=                  curie        // emitted by the amount of radon that is
                                    // in equilibrium with 1 gram of radium.
rutherford :=          1ee6 Bq      //

gray :=                J/kg         // Absorbed dose of radiation
Gy :=                  gray         //
rad :=                 1ee-2 Gy     // From Radiation Absorbed Dose
rep :=                 8.38 mGy     // Roentgen Equivalent Physical, the amount
                                    //   of radiation which , absorbed in the
                                    //   body, would liberate the same amount
                                    //   of energy as 1 roentgen of X rays
                                    //   would, or 97 ergs.

sievert :=             J/kg         // Dose equivalent:  dosage that has the
Sv :=                  sievert      //   same effect on human tissues as 200
rem :=                 1ee-2 Sv     //   keV X-rays.  Different types of
                                    //   radiation are weighted by the
                                    //   Relative Biological Effectiveness
                                    //   (RBE).
                                    //
                                    //      Radiation type       RBE
                                    //       X-ray, gamma ray     1
                                    //       beta rays, > 1 MeV   1
                                    //       beta rays, < 1 MeV  1.08
                                    //       neutrons, < 1 MeV   4-5
                                    //       neutrons, 1-10 MeV   10
                                    //       protons, 1 MeV      8.5
                                    //       protons, .1 MeV      10
                                    //       alpha, 5 MeV         15
                                    //       alpha, 1 MeV         20
                                    //
                                    //   The energies are the kinetic energy
                                    //   of the particles.  Slower particles
                                    //   interact more, so they are more
                                    //   effective ionizers, and hence have
                                    //   higher RBE values.
                                    //
                                    // rem stands for Roentgen Equivalent
                                    // Mammal

roentgen :=          258ee-6 C / kg // Ionizing radiation that produces
                                    //   1 statcoulomb of charge in 1 cc of
                                    //   dry air at stp.
rontgen :=             roentgen     // Sometimes it appears spelled this way
sievertunit :=         8.38 rontgen // Unit of gamma ray dose delivered in one
                                    //   hour at a distance of 1 cm from a
                                    //   point source of 1 mg of radium
                                    //   enclosed in platinum .5 mm thick.

eman :=                1ee-7 Ci/m^3 // radioactive concentration
mache :=               3.7e-7 Ci/m^3

//
// Atomic weights.  The atomic weight of an element is the ratio of the mass of
// a mole of the element to 1/12 of a mole of Carbon 12.  The Standard Atomic
// Weights apply to the elements as they occur naturally on earth.  Elements
// which do not occur naturally or which occur with wide isotopic variability do
// not have Standard Atomic Weights.  For these elements, the atomic weight is
// based on the longest lived isotope, as marked in the comments.  In some
// cases, the comment for these entries also gives a number which is an atomic
// weight for a different isotope that may be of more interest than the longest
// lived isotope.
//

g/mol ||| molar_mass

actinium :=            227.0278 g/mol
aluminum :=            26.981539 g/mol
aluminium :=           aluminum
americium :=           243.0614 g/mol   // Longest lived. 241.06
antimony :=            121.760 g/mol
argon :=               39.948 g/mol
arsenic :=             74.92159 g/mol
astatine :=            209.9871 g/mol   // Longest lived
barium :=              137.327 g/mol
berkelium :=           247.0703 g/mol    // Longest lived. 249.08
beryllium :=           9.012182 g/mol
bismuth :=             208.98037 g/mol
boron :=               10.811 g/mol
bromine :=             79.904 g/mol
cadmium :=             112.411 g/mol
calcium :=             40.078 g/mol
californium :=         251.0796 g/mol    // Longest lived.  252.08
carbon :=              12.011 g/mol
cerium :=              140.115 g/mol
cesium :=              132.90543 g/mol
chlorine :=            35.4527 g/mol
chromium :=            51.9961 g/mol
cobalt :=              58.93320 g/mol
copper :=              63.546 g/mol
curium :=              247.0703 g/mol
dysprosium :=          162.50 g/mol
einsteinium :=         252.083 g/mol     // Longest lived 
erbium :=              167.26 g/mol
europium :=            151.965 g/mol
fermium :=             257.0951 g/mol    // Longest lived
fluorine :=            18.9984032 g/mol
francium :=            223.0197 g/mol    // Longest lived
gadolinium :=          157.25 g/mol
gallium :=             69.723 g/mol
germanium :=           72.61 g/mol
gold :=                196.96654 g/mol
hafnium :=             178.49 g/mol
helium :=              4.002602 g/mol
holmium :=             164.93032 g/mol
hydrogen :=            1.00794 g/mol
indium :=              114.818 g/mol
iodine :=              126.90447 g/mol
iridium :=             192.217 g/mol
iron :=                55.845 g/mol
krypton :=             83.80 g/mol
lanthanum :=           138.9055 g/mol
lawrencium :=          262.11 g/mol      // Longest lived
lead :=                207.2 g/mol
lithium :=             6.941 g/mol
lutetium :=            174.967 g/mol
magnesium :=           24.3050 g/mol
manganese :=           54.93805 g/mol
mendelevium :=         258.10 g/mol      // Longest lived
mercury :=             200.59 g/mol
molybdenum :=          95.94 g/mol
neodymium :=           144.24 g/mol
neon :=                20.1797 g/mol
neptunium :=           237.0482 g/mol
nickel :=              58.6934 g/mol
niobium :=             92.90638 g/mol
nitrogen :=            14.00674 g/mol
nobelium :=            259.1009 g/mol    // Longest lived
osmium :=              190.23 g/mol
oxygen :=              15.9994 g/mol
palladium :=           106.42 g/mol
phosphorus :=          30.973762 g/mol
platinum :=            195.08 g/mol
plutonium :=           244.0642 g/mol    // Longest lived.  239.05
polonium :=            208.9824 g/mol    // Longest lived.  209.98
potassium :=           39.0983 g/mol
praseodymium :=        140.90765 g/mol
promethium :=          144.9127 g/mol    // Longest lived.  146.92
protactinium :=        231.03588 g/mol
radium :=              226.0254 g/mol
radon :=               222.0176 g/mol    // Longest lived
rhenium :=             186.207 g/mol
rhodium :=             102.90550 g/mol
rubidium :=            85.4678 g/mol
ruthenium :=           101.07 g/mol
samarium :=            150.36 g/mol
scandium :=            44.955910 g/mol
selenium :=            78.96 g/mol
silicon :=             28.0855 g/mol
silver :=              107.8682 g/mol
sodium :=              22.989768 g/mol
strontium :=           87.62 g/mol
sulfur :=              32.066 g/mol
sulphur :=             sulfur
tantalum :=            180.9479 g/mol
technetium :=          97.9072 g/mol     // Longest lived.  98.906
tellurium :=           127.60 g/mol
terbium :=             158.92534 g/mol
thallium :=            204.3833 g/mol
thorium :=             232.0381 g/mol
thullium :=            168.93421 g/mol
tin :=                 118.710 g/mol
titanium :=            47.867 g/mol
tungsten :=            183.84 g/mol
uranium :=             238.0289 g/mol
vanadium :=            50.9415 g/mol
xenon :=               131.29 g/mol
ytterbium :=           173.04 g/mol
yttrium :=             88.90585 g/mol
zinc :=                65.39 g/mol
zirconium :=           91.224 g/mol

//
// Before the Imperial Weights and Measures Act of 1824, various different
// weights and measures were in use in different places.
//

// Scots linear measure

scotsinch :=    1.00540054 britishinch
scotsell :=     37 scotsinch
scotsfall :=    6 scotsell
scotschain :=   4 scotsfall
scotslink :=    1/100 scotschain
scotsfoot :=    12 scotsinch
scotsfeet :=    scotsfoot
scotsfurlong := 10 scotschain
scotsmile :=    8 scotsfurlong

// Scots area measure

scotsrood :=    40 scotsfall^2
scotsacre :=    4 scotsrood

// Irish linear measure

irishinch :=   britishinch
irishpalm :=   3 irishinch
irishspan :=   3 irishpalm
irishfoot :=   12 irishinch
irishfeet :=   irishfoot
irishcubit :=  18 irishinch
irishyard :=   3 irishfeet
irishpace :=   5 irishfeet
irishfathom := 6 irishfeet
irishpole :=   7 irishyard     // Only these values
irishperch :=  irishpole       // are different from
irishchain :=  4 irishperch    // the British Imperial
irishlink :=   1/100 irishchain// or English values for
irishfurlong :=10 irishchain   // these lengths.
irishmile :=   8 irishfurlong  //

//  Irish area measure

irishrood :=   40 irishpole^2
irishacre :=   4 irishrood

// Modern US Beer capacity
beerbarrel := 31 gallons     // A full beer barrel
keg        := 1/2 beerbarrel // The standard "keg" is a half barrel
beerkeg    := keg
ponykeg    := 1/2 keg
case       := 24 12 floz     // Why not?
beercase   := case

// English wine capacity measures (Winchester measures)

winegallon := 231 britishinch^3 // Sometimes called the Winchester Wine Gallon,
                             // it was legalized in 1707 by Queen Anne, and
                             // given the definition of 231 cubic inches.  It
                             // had been in use for a while as 8 pounds of wine
                             // using a merchant's pound of 7200 grains or
                             // 15 troy ounces.  (The old mercantile pound had
                             // been 15 tower ounces.)
winequart :=  1/4 winegallon
winepint :=   1/2 winequart
winerundlet :=18 winegallon
winebarrel := 31.5 winegallon
winetierce := 42 winegallon
winehogshead :=    2 winebarrel
winepuncheon :=    2 winetierce
winebutt :=   2 winehogshead
winepipe :=   winebutt
winetun :=    2 winebutt

// English beer and ale measures used 1803-1824 and used for beer before 1688

englishbeergallon := 282 britishinch^3
englishbeerquart :=  1/4 englishbeergallon
englishbeerpint :=   1/2 englishbeerquart
englishbeerbarrel := 36 englishbeergallon
englishbeerhogshead :=    1.5 englishbeerbarrel

// English ale measures used from 1688-1803 for both ale and beer

alegallon :=  englishbeergallon
alequart :=   1/4 alegallon
alepint :=    1/2 alequart
alebarrel :=  34 alegallon
alehogshead :=1.5 alebarrel

// Scots capacity measure

scotsgallon :=827.232 britishinch^3
scotsquart := 1/4 scotsgallon
scotspint :=  1/2 scotsquart
choppin :=    1/2 scotspint
mutchkin :=   1/2 choppin
scotsgill :=  1/4 mutchkin
scotsbarrel :=8 scotsgallon

// Scots dry capacity measure

scotswheatlippy :=    137.333 britishinch^3   // Also used for peas, beans, rye, salt
scotswheatlippies :=  scotswheatlippy
scotswheatpeck :=4 scotswheatlippy
scotswheatfirlot :=   4 scotswheatpeck
scotswheatboll :=4 scotswheatfirlot
scotswheatchalder :=  16 scotswheatboll

scotsoatlippy := 200.345 britishinch^3   // Also used for barley and malt
scotsoatlippies :=    scotsoatlippy
scotsoatpeck :=  4 scotsoatlippy
scotsoatfirlot :=4 scotsoatpeck
scotsoatboll :=  4 scotsoatfirlot
scotsoatchalder :=    16 scotsoatboll

// Scots Tron weight

tronpound :=  9520 grain
tronounce :=  1/20 tronpound
trondrop :=   1/16 tronounce
tronstone :=  16 tronpound

// Irish liquid capacity measure

irishgallon :=217.6 britishinch^3
irishpottle :=1/2 irishgallon
irishquart := 1/2 irishpottle
irishpint :=  1/2 irishquart
irishnoggin :=1/4 irishpint
irishrundlet :=    18 irishgallon
irishbarrel :=31.5 irishgallon
irishtierce :=42 irishgallon
irishhogshead :=   2 irishbarrel
irishpuncheon :=   2 irishtierce
irishpipe :=  2 irishhogshead
irishtun :=   2 irishpipe

// Irish dry capacity measure

irishpeck :=  2 irishgallon
irishbushel :=4 irishpeck
irishstrike :=2 irishbushel
irishdrybarrel :=  2 irishstrike
irishquarter :=    2 irishbarrel

// English Tower weights, abolished in 1528

towerpound :=   5400 grain
towerounce :=   1/12 towerpound
towerpennyweight :=  1/20 towerounce

// English Mercantile weights, used since the late 12th century

mercpound :=  6750 grain
mercounce :=  1/15 mercpound
mercpennyweight :=  1/20 mercounce

// English weights for lead

leadstone := 12.5 lb
fotmal :=    70 lb
leadwey :=   14 leadstone
fothers :=   12 leadwey

// English Hay measure

newhaytruss :=  60 lb            // New and old here seem to refer to "new"
newhayload :=   36 newhaytruss   // hay and "old" hay rather than a new unit
oldhaytruss :=  56 lb            // and an old unit.
oldhayload :=   36 oldhaytruss

// English wool measure

woolclove :=    7 lb
woolstone :=    2 woolclove
wooltod := 2 woolstone
woolwey := 13 woolstone
woolsack :=2 woolwey
woolsarpler :=  2 woolsack
woollast :=6 woolsarpler

//
// Ancient history units:  There tends to be uncertainty in the definitions
//                         of the units in this section
// These units are from [11]

// Roman measure.  The Romans had a well defined distance measure, but their
// measures of weight were poor.  They adopted local weights in different
// regions without distinguishing among them so that there are half a dozen
// different Roman "standard" weight systems.  

romanfoot :=296 mm         // There is some uncertainty in this definition
romanfeet :=romanfoot      // from which all the other units are derived.
pes :=      romanfoot      // This value appears in numerous sources. In "The
pedes :=    romanfoot      // Roman Land Surveyors", Dilke gives 295.7 mm.
romaninch :=  1/12 romanfoot // The subdivisions of the Roman foot have the
romandigit := 1/16 romanfoot // same names as the subdivisions of the pound,
romanpalm :=1/4 romanfoot    // but we can't have the names for different
romancubit :=    18 romaninch   //   units.
romanpace :=5 romanfeet    // Roman double pace (basic military unit)
passus :=   romanpace
romanperch :=    10 romanfeet
stade :=    125 romanpaces
stadia :=   stade
stadium :=  stade
romanmile :=8 stadia       // 1000 paces
romanleague :=   1.5 romanmile
schoenus := 4 romanmile

// Other values for the Roman foot (from Dilke)

earlyromanfoot :=29.73 cm
pesdrusianus :=  33.3 cm   // or 33.35 cm, used in Gaul & Germany in 1st c BC
lateromanfoot := 29.42 cm

// Roman areas

actuslength :=   120 romanfeet    // length of a Roman furrow
actus :=    120*4 romanfeet  // area of the furrow
squareactus :=   120^2 romanfeet^2// actus quadratus
acnua :=    squareactus
iugerum :=  2 squareactus
iugera :=   iugerum
jugerum :=  iugerum
jugera :=   iugerum
heredium := 2 iugera         // heritable plot
heredia :=  heredium
centuria := 100 heredia
centurium :=centuria

// Roman volumes

sextarius :=   35.4 in^3     // Basic unit of Roman volume.  As always,
sextarii :=    sextarius     // there is uncertainty.  Six large Roman
                              // measures survive with volumes ranging from
                              // 34.4 in^3 to 39.55 in^3.  Three of them
                              // cluster around the size given here.
                              //
                              // But the values for this unit vary wildly
                              // in other sources.  One reference  gives 0.547
                              // liters, but then says the amphora is a 
                              // cubic Roman foot.  This gives a value for the
                              // sextarius of 0.540 liters.  And the
                              // encyclopedia Brittanica lists 0.53 liters for
                              // this unit.  Both [7] and [11], which were
                              // written by scholars of weights and measures,
                              // give the value of 35.4 cubic inches.  
cochlearia :=  1/48 sextarius
cyathi :=      1/12 sextarius
acetabula :=   1/8 sextarius
quartaria :=   1/4 sextarius
quartarius :=  quartaria
heminae :=     1/2 sextarius
hemina :=      heminae
cheonix :=     1.5 sextarii

// Dry volume measures (usually)

semodius :=    8 sextarius
semodii :=     semodius
modius :=      16 sextarius
modii :=       modius

// Liquid volume measures (usually)

congius :=     12 heminae
congii :=      congius
amphora :=     8 congii
amphorae :=    amphora     // Also a dry volume measure
culleus :=     20 amphorae
quadrantal :=  amphora

// Roman weights

libra :=       5052 grain  // The Roman pound varied significantly
librae :=      libra       // from 4210 grains to 5232 grains.  Most of
romanpound :=  libra       // the standards were obtained from the weight
uncia :=       1/12 libra  // of particular coins.  The one given here is
unciae :=      uncia       // based on the Gold Aureus of Augustus which
romanounce :=  uncia       // was in use from BC 27 to AD 296.  
deunx :=       11 uncia
dextans :=     10 uncia
dodrans :=     9 uncia
bes :=         8 uncia
seprunx :=     7 uncia
semis :=       6 uncia
quincunx :=    5 uncia
triens :=      4 uncia
quadrans :=    3 uncia
sextans :=     2 uncia
sescuncia :=   1.5 uncia
semuncia :=    1/2 uncia
siscilius :=   1/4 uncia
sextula :=     1/6 uncia
semisextula := 1/12 uncia
scriptulum :=  1/24 uncia
scrupula :=    scriptulum
romanobol :=   1/2 scrupula

romanaspound :=4210 grain   // Old pound based on bronze coinage, the  
                             // earliest money of Rome BC 338 to BC 268. 



// Egyptian length measure

egyptianroyalcubit :=  20.63 in   // plus or minus .2 in
egyptianpalm :=        1/7 egyptianroyalcubit
epyptiandigit :=       1/4 egyptianpalm
egyptianshortcubit :=  6 egyptianpalm

doubleremen :=         29.16 in // Length of the diagonal of a square with
remendigit :=   1/40 doubleremen// side length of 1 royal egyptian cubit.
                                 // This is divided into 40 digits which are
                                 // not the same size as the digits based on
                                 // the royal cubit.

// Greek length measures

greekfoot :=           12.45 in     // Listed as being derived from the 
greekfeet :=           greekfoot    // Egyptian Royal cubit in [11].  It is
greekcubit :=          1.5 greekfoot// said to be 3/5 of a 20.75 in cubit.
pous :=                greekfoot
podes :=               greekfoot
orguia :=              6 greekfoot
greekfathom :=         orguia
stadion :=             100 orguia
akaina :=              10 greekfeet
plethron :=            10 akaina
greekfinger :=         1/16 greekfoot
homericcubit :=        20 greekfingers // Elbow to end of knuckles.
shortgreekcubit :=     18 greekfingers // Elbow to start of fingers.

ionicfoot :=           296 mm    
doricfoot :=           326 mm

olympiccubit :=        25 remendigit   // These olympic measures were not as
olympicfoot :=         2/3 olympiccubit// common as the other greek measures.
olympicfinger :=       1/16 olympicfoot// They were used in agriculture.
olympicfeet :=         olympicfoot
olympicdakylos :=      olympicfinger
olympicpalm :=         1/4 olympicfoot
olympicpalestra :=     olympicpalm
olympicspithame :=     3/4 foot
olympicspan :=         olympicspithame
olympicbema :=         2.5 olympicfeet
olympicpace :=         olympicbema
olympicorguia :=       6 olympicfeet
olympicfathom :=       olympicorguia
olympiccord :=         60 olympicfeet
olympicamma :=         olympiccord
olympicplethron :=     100 olympicfeet
olympicstadion :=      600 olympicfeet

// Greek capacity measure

greekkotyle :=         270 ml          // This approximate value is obtained
xestes :=              2 greekkotyle   // from two earthenware vessels that
khous :=               12 greekkotyle  // were reconstructed from fragments.
metretes :=            12 khous        // The kotyle is a day's corn ration
choinix :=             4 greekkotyle   // for one man. 
hekteos :=             8 choinix
medimnos :=            6 hekteos

// Greek weight.  Two weight standards were used, an Aegina standard based
// on the Beqa shekel and an Athens (attic) standard.

aeginastater :=        192 grain       // Varies up to 199 grain
aeginadrachmae :=      1/2 aeginastater
aeginaobol :=          1/6 aeginadrachmae
aeginamina :=          50 aeginastaters
aeginatalent :=        60 aeginamina

atticstater :=         135 grain       // Varies 134-138 grain
atticdrachmae :=       1/2 atticstater
atticobol :=           1/6 atticdrachmae
atticmina :=           50 atticstaters
attictalent :=         60 atticmina


// "Northern" cubit and foot.  This was used by the pre-Aryan civilization in
// the Indus valley.  It was used in Mesopotamia, Egypt, North Africa, China,
// central and Western Europe until modern times when it was displaced by
// the metric system.

northerncubit :=       26.6 in          // plus/minus .2 in
northernfoot :=        1/2 northerncubit

sumeriancubit :=       495 mm
kus :=                 sumeriancubit
sumerianfoot :=        2/3 sumeriancubit

assyriancubit :=       21.6 in
assyrianfoot :=        1/2 assyriancubit
assyrianpalm :=        1/3 assyrianfoot
assyriansusi :=        1/20 assyrianpalm
susi :=                assyriansusi
persianroyalcubit :=   7 assyrianpalm


// Arabic measures.  The arabic standards were meticulously kept.  Glass weights
// accurate to .2 grains were made during AD 714-900.

hashimicubit :=        25.56 in         // Standard of linear measure used
                                         // in Persian dominions of the Arabic
                                         // empire 7-8th cent.  Is equal to two
                                         // French feet.

blackcubit :=          21.28 in
arabicfeet :=          1/2 blackcubit
arabicfoot :=          arabicfeet
arabicinch :=          1/12 arabicfoot
arabicmile :=          4000 blackcubit

silverdirhem :=        45 grain // The weights were derived from these two
tradedirhem :=         48 grain // units with two identically named systems
                                 // used for silver and used for trade purposes

silverkirat :=         1/16 silverdirhem
silverwukiyeh :=       10 silverdirhem
silverrotl :=          12 silverwukiyeh
arabicsilverpound :=   silverrotl

tradekirat :=          1/16 tradedirhem
tradewukiyeh :=        10 tradedirhem
traderotl :=           12 tradewukiyeh
arabictradepound :=    traderotl

// Miscellaneous ancient units

parasang :=            3.5 mile // Persian unit of length usually thought
                                // to be between 3 and 3.5 miles
biblicalcubit :=       21.8 in
hebrewcubit :=         17.58 in
li :=                  10/27.8 mile // Chinese unit of length
                                    //   100 li is considered a day's march
liang :=               11/3 oz      // Chinese weight unit

//  From Encyclopedia Dictionary of the Bible
chomer := 21/2 bushels
homer  := chomer         // Alternate spelling, used in many translations
letech :=  1/2 chomer
ephah  :=  1/5 letech
seah :=    1/3 ephah
gomer :=  3/10 pecks
cab  :=   1.86 quarts

kor :=  97.5 gallons
bath := 9.8 gallons
hin  := 1.62 gallons
log  := 1/12 hin

artaba := 1.85 bushels
chenice := .03 bushels

// Medieval time units.  According to the OED, these appear in Du Cange
// by Papias.

timepoint :=           1/5 hour // also given as 1/4
timeminute :=          1/10 hour
timeostent :=          1/60 hour
timeounce :=           1/8 timeostent
timeatom :=            1/47 timeounce

// Given in [15], these subdivisions of the grain were supposedly used
// by jewelers.  The mite may have been used but the blanc could not
// have been accurately measured.

mite :=                1/20 grain     
droit :=               1/24 mite
periot :=              1/20 droit
blanc :=               1/24 periot

// Resolution 12 of the BIPM 21st Conférence Générale des Poids et Mesures
// 11-15 October 1999 endorses uses of katal as SI derived unit:
// http://www.bipm.org/enus/2_Committees/cgpm21/res12.pdf
katal := mol/s
kat   := katal         // SI symbol for katal

// Some silliness:

smoot := 5 feet + 7 inches  // Height of Oliver R. Smoot Jr. see:
           // http://aether.lbl.gov/www/personnel/smoot/smoot-measure.html

//
// Some definitions using special Unicode characters.  These are currently
// commented-out.
// At some point, I may scour Unicode symbols for things like the
// Letterlike Symbols, Currency Symbols, Number Forms, etc. to find more
// symbols that can be unambiguously parsed.
//
//  Letterlike symbols:  https://unicode.org/charts/PDF/U2100.pdf
//  Currency symbols:    https://unicode.org/charts/PDF/U20A0.pdf
//  Number forms:        https://unicode.org/charts/PDF/U2150.pdf
//
// or whatever may be found in the Unicode charts:
//  https://www.unicode.org/charts/

//¼-                   1/4
//½-                   1/2
//¾-                   3/4
//¢                    cent
//£                    britainpound
//¥                    japanyen
//ångström          angstrom
//röntgen              roentgen
//°C                      degC
//°R                      degR


// Function to convert Richter Scale numbers to energy.
//
// This functions can take either a dimensionless number, which
// indicates a number on the Richter Scale, or a unit with dimensions of
// energy.  If a dimensionless number is passed in, this returns an energy.
// If an energy is passed in, this returns a dimensionless number which is
// the number on the Richter scale.
//

// The Choy-Boatwright approximation (1995) assumes higher-frequency components
// and is thus more realistic.  This returns the amount of energy radiated
// as seismic energy, not the total energy of the earthquake, which would of
// course be much higher (and dissipated as sound, gravitational potential
// energy changes, heating, and so on.)
Richter[n] :=
{
   if (n conforms 1)             // Passed in dimensionless.  (Richter number)
      return 22387 e^(3.45388 n) J  // Convert to energy.

   if (n conforms joule)        // Passed in energy.  Convert to Richter.
      return -2.9 + 0.28953 ln[n/J]

   return "Error:  Richter[$n] expected dimensionless number or unit with dimensions of energy."
}

// Function for parsing degrees, minutes, seconds
//
// This returns a unit with dimensions of angle.  (Radians, in this file.)
// The convolutions below are necessary to try to "do the right thing" if the
// degrees value is negative.
//
// You'll need to define your own sign convention.  For example, you might
// want to try the lines:
//  
// North := +1
// South := -1
// West := +1
// East := -1
//
// So you can write 
//    DMS[105, 10, 3] West
//
DMS[d,m=0,s=0] :=
{
   if d<0 degrees
      -(-d degrees + m arcmin + s arcsec)
   else
      d degrees + m arcmin + s arcsec
}


// Function for displaying angles broken up into degrees, arcmin, arcsec
// 
// usage:
//   angle -> DMS
//
// This returns a string.
//
DMS[angle] := 
{
   if (angle > 0 degrees)
      angle -> ["degrees", "arcmin", "arcsec"]
   else
      "-" + DMS[-angle]
}


// Function for displaying angles broken up into degrees and arcmin
// 
// usage:
//   angle -> DM
//
// This returns a string.
//
DM[angle] := 
{
   if (angle > 0 degrees)
      angle -> ["degrees", "arcmin"]
   else
      "-" + DM[-angle]
}

// Function for parsing hours, minutes, seconds
//
// This returns a unit with dimensions of time
// The convolutions below are necessary to try to "do the right thing" if the
// hours value is negative.
HMS[h,m=0,s=0] :=
{
   if h<0
      -(-h hours + m min + s sec)
   else
      h hours + m min + s sec
}

// Function for parsing days, hours, minutes, seconds
//
// This returns a unit with dimensions of time
// The convolutions below are necessary to try to "do the right thing" if the
// days value is negative.
DHMS[d,h=0,m=0,s=0] :=
{
   if d<0
      -(-d days + h hours + m min + s sec)
   else
      d days + h hours + m min + s sec
}


// Function for displaying times broken up into hours, min, s
// 
// usage:
//   time -> HMS
//
// This returns a string.
//
HMS[time] := 
{
   if time > 0 hours
      time -> ["hours", "min", "sec"]
   else
      "-" + HMS[-time]
}

// Function for displaying times broken up into days, hours, min, s with
// unused fields being suppressed.
// 
// usage:
//   time -> DHMS
//
// This returns a string.
//
DHMS[time] := 
{
   if time > 0 days
      time -> [0, "days", "hours", "min", "sec", 0]
   else
      "-" + DHMS[-time]
}

