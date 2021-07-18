{.compile: "widgets/slider.m".}

import NSFunctions

proc newSlider*(parent: ID; left, top, width, height: int, `func`: ACTION): ID {.cdecl, importc: "createSlider".}