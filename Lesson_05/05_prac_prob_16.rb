=begin

Practice Problem 16
A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.

Thinking out aloud:

- Create an array called 'chars_for_uiud' which consist of the digits 0 to 9 and the small case alphabets from a-z
- create an empty string called 'uiud'
- intialize a variable called counter to 0
- write a loop, in which for every iteration you randomly sample from the 'chars_for_uiud' and append the char to 'uiud', unless the counter has a value of 8, 13, 18 or 23. In the cases when the counter is equal to either 8, 13, 18 or 23, append the char '-' to the string 'uiud'
- break out of the loop, when counter = 36

=end

CHARS_FOR_UIUD = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z)

# p CHARS_FOR_UIUD

uiud = ''
counter = 0

while (counter < 36)
  if [8, 13, 18, 23].include?(counter)
    uiud << '-'
  else
    uiud << CHARS_FOR_UIUD.sample
  end
  counter += 1
end

p uiud
  
