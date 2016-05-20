
-- Declaring functions in haskell
doubleMe x = x + x  -- the formulae is funcName parameters = action (code that will take place in the function)
-- doubleUs x y = x*2 + y*2
doubleUs x y = doubleMe x + doubleMe y -- redefining doubleUs using doubleMe

-- going into the if relm
doubleSmallNumber x =
    if x > 100
    then x
    else x*2

-- using ' in a function's name is completely valid in haskell
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

-- functions in haskell can't start with a capital letter

daraO'Briain = "It's a-me, Dara O'Briain" -- This is a function not a variable
-- but we could think of the above as a variable
-- Bering in mind that it's value can't be changed
-- because it's a function that returns a value

-- the following is a list declaration
lostNumbers = [4,8,15,16,23, 42] -- list are homogenous in haskell

-- strings are just list of charecters in haskell
-- meaning we can use list functions on strings
-- it also means the following "hello"
-- is the same as ['h', 'e','l', 'l', 'o']
lilNumbers = [1,2,3]

-- example of combining a number to a list
-- when ever this is done haskell has to go through the whole list form left to the end of the list
combinedNumb = lilNumbers ++ lostNumbers -- this can be a problem depending on the size of the list
-- and how many times it's been done

-- example of preappending something to a list (putting it at the begining)
combinedNumb' = 7:lostNumbers

-- if you want to  remove an item from a list use the !! operator
-- the following will extract the 5 element of the list (remember in programming we start form 0)
extractedItem = lostNumbers !! 4

-- it's possible to nest lists within lists
listSeption = [[[234],[4553],[34]],[[345.5]]] -- all the lists inside the list must contain the same type
-- so either a number or string (remember Haskell doesn't really deferenciate between float and int)

-- you can also do comparison with lists
-- here's a function that compares if an element is bigger than the other
comparingList el1 el2 =
    if el1 > el2
    then True
    else False
-- if we parse two list to this argument (that contains stuff that can be compared with eachother)
-- the comparison happens in a lexicographical order meaning that the first elements are compared first
-- and than the following ones one by one

-- the first elements of a list is called head and the last one is called tail
-- elements from the head to the element before the tail is called init
-- there are functions to retrieve all of the above and they are named after there concepts

lilHead = head lilNumbers
lostTail = tail lostNumbers
lostInit = init lostNumbers

-- we can also get the length of a list
lostLenght = length lostNumbers

-- we can check if a list is empty or not by using the null function

listEmpty list =
    if null list
    then "HAHAHAHAHA! True"
    else "HAHAHAHAHA! False"

-- we can also reverse a list
reversedLost = reverse lostNumbers

-- we can also get a specific amount of elements from the begining of the list with take
top3Lost = take 3 lostNumbers

-- we can also drop the first n amount of numbers and get the rest of them
noTop3Lost = drop 3 lostNumbers -- this will return all elements except the first 3

-- we've also got the maximum and minimum functions
-- they return the biggest and smallest value in a list respectevily
bigestLost = maximum lostNumbers
smallestLost = minimum lostNumbers

-- we can sum up all the numbers in a list with sum
-- and we can return the product of number values in a list
sumLost = sum lostNumbers
productLost = product lostNumbers

-- elem finds out if an element is inside a list or not it takes an element and a list
bool = elem 4 lostNumbers
-- or we could use it as an infix
bool' = 5 `elem` lostNumbers

-- to make it easier to have a list of values in a sequence we can use ranges
range = [1..99]
-- we can also specify a step value
steppingRange = [3,6..99]
-- we can use reversal rangese but we need to show the compiler a step
reversedStep = [100, 99..1]
-- it is not recomended to use floating point numbers in range b
--  floats are not precise and can have some wierd side effects in range

-- infinite lists
-- usually making a program enter an infinite loop of any kind is a bad thing (there are exceptions)
-- because Haskell is lazy making it enter an ifinite loop of a kind is not nececerarly a bad thing
-- here is an example of it being good

fromInfinity = take 24 [13,26..] -- this will give us the first 24 multiples of 13
-- we could have done the obove like
fromInfinity' = [13,26..24*13] -- but this is not the best way to do it

-- here are a couple of functions that can help you create infinite lists

-- cycle takes a list and cycles it into infinity (generates an infinit amount of that list)
-- remember that a string in Haskell is a list of chars so we're able to use cycle on strings also
cycle123 = take 36 (cycle [1,2,3])
cycleLol = take 100 (cycle "LOL ")

-- there is also the repeat function that takes any element and generates an infinit list of said element
trolRepeat = "tro" ++ take 99 (repeat 'l')

-- although not an ifinite list generator theres also replicate
-- replicate returns a list of n amount of number x
replicated = 10 `replicate` 99 -- or we could have written it as replicate 10 99

-- NOTE: Am not too comfortable with list comprehensions, my mental model for it is very incomplete
-- and there for am unsatisfied with my understanding of the topic

-- example of a list comprehansion
comprehensing1 = [ x*2 | x <- [1..10] ] -- my understanding of this is the following
-- things before the | is the operation that will take place on the elements
-- after this we're binding each element in a list (which in this case we used a range to create) to x

-- we can also give the list comprehension a condition to follow
-- here's an example of how to get all the multiples of 2 (up to 2 * 10)
-- that are over the value of 12 as a list
comprehensing2 = [x*2 | x <- [1..10], x*2 >= 12]

-- here are all odd numbers between 1 and 100
comprehensing3 = [x | x <- [1..100], x `mod` 2 /= 0] -- not equals to in haskell is /=

divBy7 = [x | x <- [1..100], (x `mod` 7) == 0] -- all numbers between 1 and 100 that are divisible by 7
-- this condition in a list conprehention is know as a predicate

-- it's also possible to assign a comprehension to a function

-- heres a function that takes a list
-- it replaces all the numbers above 10  with bang and all numbers bellow 10 with boom
-- but only does it to odd numbers
boomBang xs = [if x < 10 then "BANG" else "BOOM" | x <- xs, odd x]
-- odd is an inbuilt function tha returns true if the number is odd or false if not (it's in the name)

-- a list comprehension can have several predicates
-- here's an example, all numbers between 1 and 20 except those that are multiples of 7 and 9
manyPredication = [x | x <- [1..20], x `mod` 7 /= 0, x `mod` 9 /= 0]

-- List comprehensions can also have many lists we draw elements from
-- heres an example that uses 2 lists with number elements in them
-- that multiplies one element from the first list by another element in the second list
-- but making sure we don't have any 0 values in the resulting list
-- in this case it'll first cycle through all elements in the second list
-- and multiply them by the first element in the first list
-- than it'll go to the second elemrnt of the first list and go through all the items of the second list again
-- and so on, on each cycle of it'll apply the operation,
-- the resulting list will have the length of list1.length * list2.length
manyComprehensing = [x*y | x <- [5..15], y <- [-5..5], x*y /= 0]

-- heres another example using strings that'll will show this better
nouns = ["hobo", "frog", "pope"]
adjectives = ["lazy", "grouchy", "scheming"]
phrases = [adjc ++ " " ++ noun | adjc <- adjectives, noun <- nouns]

-- now heres a function that works out the length of a list
-- when we put a _ as a binding of an element it's telling haskell that
-- we don't really care what we draw from the list so we aren't going to bother naming it
-- the actual functionality is it produces a list of the same legnth as the one being parsed
-- but all it's elements will be 1, it than sums up all the elements of the list resulting in the lists length
length' xs = sum [1 | _ <- xs]

-- here's a function that filters out all of the non capital letters from a list using list comprehentions
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

-- it's also possible to have nested list comprehensions in case your working with a list that contains other lists

-- list of lists of numbers
listListNumbs =
    [
        [1,3,5,2,3,1,2,4,5],
        [1,2,3,4,5,6,7,8,9],
        [1,2,4,2,1,6,3,1,3,2,3,6]
    ]
-- list comprehension that works in nested lists
comprehensingListnception xxs = [ [ x | x <-xs, even x ] | xs <- xxs ]
-- list comprehentions always results in a list of lists

-- NOTE: A list comprehention is a way to manipulate lists. we bind each element of a list to a variable while cycling through said list
-- we can specify a rule to be applyed to each of these elements and a conditional for choosing what gets returned in the new list that is being produced

-- TOPLES
-- toples are used to  store many heterogeneous (diverse) elements
-- toples are of fixed sizes, they can contain elements of different kinds
-- toples are declared with a set of parentheses and each of its elements are separated by a comma
aPair = ("one", 1) -- a tople with two elements is also know as a pair
-- pairs are used quite often in haskell
aTriple = (1, "two", 3)

-- it's possible to create a list of pairs, each set of combination of topple are of a different kind
-- so a (1, 2) tople is considered a different type compared to a ("one", "two") so it's not possible to put both on the same list
-- heres an example of a list of toples
vectList = [ (23, 54), (19, 3), (14, 7), (9, 17) ]

-- the use of pairs in haskell is so common it has useful functions that can be used on pairs (NOTE that these can only be used on tople pairs)
firsElemPair = fst aPair
secElemPair = snd aPair

-- zip can be used on toples (this function can be used on a tople of any size)
-- it takes to lists as it parameters and it makes it easy to create a list of pairs
-- it cycles through each list element and paires it with the element in the same index of the other list

counting = zip [ 1..5 ] [ "one", "two", "three", "four", "five" ]

-- exercise finding a right angle that meets the folowing requirements
-- +The lengths of the three sides are all integers
-- +The length of each side is less than or equal to 10
-- +“The triangle’s perimeter (the sum of the side lengths) is equal to 24.”
-- Remembering that “Right triangles have the useful property that if you square the lengths of the sides forming the right angle and then add those squares,
-- that sum is equal to the square of the length of the side that’s opposite the right angle”
-- lets gen all triples that it's elements less than or equal to 10
triples = [ (a, b, c) | c <- [1..10], b <- [1..10], a <- [1..10] ]
-- now we are going to add a predicate that checks if the triangles are right angles by using pythagorus theoream
-- rightTriangles = [ (a, b, c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2 ]
-- now we will modify the above so we get only triangles that it's paremeter equals to 24
rightTriangles = [ (a, b, c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a+b+c == 24 ]
