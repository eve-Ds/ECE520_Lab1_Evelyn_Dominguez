# ECE520\_Lab1\_Evelyn\_Dominguez

# Overview
In this lab, students will be introduced to sequential logic design. Students will design a module that blinks an LED every second. They will also learn how to use the Zybo Z7's switches to select different colors from red, green, and blue. 

# Design Summary
For the blinking led task, I created an if else statement to toggle the LEDs and clear/increment the counter. For the task I used a switch statement to create a case for each color. Then, I added the blinking_led file and instantiated each color. 


# Verification and Results
I tested the blinking led by creating three test cases: Reset Behavior, Disabled Output, and LED Toggling. I ran the simulation and looked at the waveform to make sure it was operating as intended:
Blinking LED:
<img width="1020" height="615" alt="Blinking_LED_Waveform" src="https://github.com/user-attachments/assets/56b1b303-679a-480e-99e4-8348be715481" />

<img width="660" height="440" alt="image" src="https://github.com/user-attachments/assets/d47e6691-804e-45a6-819c-4ead16ebf0f3" />

<img width="1122" height="632" alt="Screenshot 2026-09-13 221219" src="https://github.com/user-attachments/assets/6cc31b16-8b21-414f-9df7-486b26e23b98" />
