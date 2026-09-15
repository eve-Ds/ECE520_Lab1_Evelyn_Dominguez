# ECE520\_Lab1\_Evelyn\_Dominguez

# Overview
In this lab, students will be introduced to sequential logic design. Students will design a module that blinks an LED every second. They will also learn how to use the Zybo Z7's switches to select different colors from red, green, and blue. 

# Design Summary
For the blinking led task, I created an if else statement to toggle the LEDs and clear/increment the counter. For the task I used a switch statement to create a case for each color. Then, I added the blinking_led file and instantiated each color. 


# Verification and Results
I tested the blinking led by creating three test cases: Reset Behavior, Disabled Output, and LED Toggling. I ran the simulation and looked at the waveform to make sure it was operating as intended:

Blinking LED:
<img width="1020" height="515" alt="Blinking_LED_Waveform" src="https://github.com/user-attachments/assets/56b1b303-679a-480e-99e4-8348be715481" />
<img width="550" height="440" alt="image" src="https://github.com/user-attachments/assets/d47e6691-804e-45a6-819c-4ead16ebf0f3" />
<img width="447" height="80" alt="Screenshot 2026-09-14 221925" src="https://github.com/user-attachments/assets/296a95e1-57ab-43d7-b1dd-36b8fc09eafb" />
<img width="847" height="195" alt="Screenshot 2026-09-14 222108" src="https://github.com/user-attachments/assets/c8ecc671-f7b9-4cc9-82e2-d2b80dc2f564" />


For the RGB LED, I created a test case for each color/switch. I also made a case for  multiple switches being on. First, I ran the waveform, then I connected the board and programed it. Once the board was programed, I tested each switch individually and made sure the correct color was being shown. Then, I turned on two switches to see if the LED would turn off. I also tested the reset button by flipping one switch then clicking the reset button. The LED turned off when the reset button was switched. 

RGB LED:
<img width="1122" height="632" alt="Screenshot 2026-09-13 221219" src="https://github.com/user-attachments/assets/6cc31b16-8b21-414f-9df7-486b26e23b98" />
<img width="570" height="325" alt="Screenshot 2026-09-14 220504" src="https://github.com/user-attachments/assets/2e59ad07-55eb-4d5b-9463-0781be2050d3" />
<img width="527" height="160" alt="Screenshot 2026-09-14 221440" src="https://github.com/user-attachments/assets/b3f2e517-d9a7-4481-99ac-dd8cace0f76f" />
<img width="803" height="192" alt="image" src="https://github.com/user-attachments/assets/6959a575-32e2-4b57-8b8d-44059f57d3c3" />


