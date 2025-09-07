/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Varrying text via loops
 - Functions
 
 In the assignment:
 - A story with at least 6 knots
 - Vary some text via a loop
 - Create a function that serves as a timer. (This is shown in the video)
*/


VAR time = 0 //  0 Morning, 1 Noon, 2 Night
VAR counter = 0
VAR shells = 0


-> seashore

== seashore ==
    ~ time_counter()
{time == 0: It is morning}
{time == 1: It is noon}
{time == 2: It is night}
{time == 3: -> Home}
You are sitting on the beach. 

+ [Wait] -> seashore
+ [Swim] -> swim
+ [Pickup Shells] -> shellsPickup
+ [Observe Surroundings] -> observe
-> DONE

== talk_to_locals ==

{ time == 0:
     {~Nobody except us is here right now|Nobody else is here right now|We are the only ones at this beach currently|You dont see anybody else around to talk to}
 - else:
  {~You talk to some of the people at the beach|You chat with some of the people at the beach|You converse with people at the beach|You find some stranger at the beach to talk to}
    { time == 1:
    {~"The beach is so sweet dude, these waves are crazy!"|"What brings you here"|"You look great"}
    - else:
       {~"Im getting ready to pack up, need anything?|"The ocean is beautiful when its dark out, I love coming back to see it"|"what are you looking at, dont you got places to be?"|"Im heading out for a drink, the bars are lively around this hour"}
    }
}
-> seashore

== swim ==
{You decide to go swimming|You go swimming|You get up to swim in the ocean|You want to swim in the ocean}
{time == 0: {The water is cold, the sun has not gotten a chance to heat up the water|The water is somewhat cold, taking a swim helped aclimate to the cold temperature}}
{time == 1: {The water is nice and warm, perfect to swim in|The water is still nice and warm, great to soak your feet in}}
{time == 2: {The water is cold and calm, still settling down from the beachgoers|The water got colder, but there are a few people still hanging around}}
+ [Head back] -> seashore

== observe ==
{ time:
 - 0:
    {~The sun has just Awoke from its slumber|You can start to feel the heat of the sun hitting your skin|Theres nobody else here, just you and the water|The water is calm, a flat plane that has yet to be disrupted}
  - 1: 
    {~The sun is directly ontop of you, its warm embraces you|You start to see other people arrive at the beach|The water is crystal clear, flowing with the tides}
    - 2:
    {~The moon has now appeared, it appears bright in the sky|The water is calm now, the tides slow down.|People are packing up their belongings and leaving, maybe its time we do the same}
    

}
-> seashore

== shellsPickup ==
{~You find some shells to pick up| you look for some shells|You find some shells on the beach|You take a look around the beach for some shells}
~ shells = shells + 1
You now have {shells} shell{shells > 0:s}
-> seashore

== function advance_time ==

    ~ time = time + 1
    { time >= 3:
        ~ time = 3
    }

    /*
    {    
        - time == 0:
            ~ return "Morning"
        
        - time == 1:
            ~ return "Noon"
        
        - time == 2:
            ~ return "Night"
        - time == 3:
            ~ return "Home"
    
    }
    */
    
        
    ~ return time
    
== function time_counter ==
    ~ counter = counter + 1
    { counter >= 6:
        ~ advance_time()
        ~ counter = 0
    }
    

    
== function timeOfDay ==
    {    
        - time == 0:
            ~ return "Morning"
        
        - time == 1:
            ~ return "Noon"
        
        - time == 2:
            ~ return "Night"
    
    }

== Home ==
It is time to go home. It is late
The beach is now empty, nobody is there anymore. 
You pack up your stuff and head home.

Its a calm night, The town is usually mostly this quiet around this time.
There a few people up partying at this hour, but most people have gone to bed.
They live their own lives, and you live yours.

__________

Shells Collected: {shells}

-> END