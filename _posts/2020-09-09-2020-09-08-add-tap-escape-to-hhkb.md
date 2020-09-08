---
layout: post
title:  2020-09-08-add-tap-escape-to-hhkb
date:   2020-09-09 00:58:31 +0200
---
# Easy Escape on the HHKB

I configure all apps I can to use *vim* keybindings. Which means I use the
*Escape* key very often.

On my custom keyboards I have usually QMK or similar available to remap the keys
and use a tap on the CapsLock to mean *Escape* and hold to mean *Control*. On
the macbook pro I used *Karabiner* to program the same effect. And even on
Windows I found a *AutoHotKey* script. On Linux I use an event interceptor
between the keyboard and the rest of the OS.

So either the keyboard does it natively or the useless CapsLock is remapped to
the much more useful Ctrl/Esc combination.

# Happy Hacking Keyboard

This year I got a HHKB for my birthday. I have been wanting one of those for a
real long time, but choice anxiety and the new models arriving last year
prevented me from pulling the trigger so my family conspired to end my suffering
by buying me Hybrid Type-S. Super happy with it.

Of course it took some time to get used to the different location of the
backspace, and the practical use of the 2 keys top right. However my muscle
memory really expects the *Esc* to be under my pinky.

No problem I thought a quick Google will sort that out. Nope...

Been looking on and off for about a week before posting something in the
subreddit. No reply, probably because I forgot to add a nice picture.

The general consensus is to just buy an Hasu controller and use QMK to implement
the tap dance. However I do not want to rip out the guts of my new keyboard, and
ordering one will take some time too.

# My Solution

A thought crossed my mind to just try to do the same with the Control as I do to
the CapsLock in my autohotkey script. So I copy pasted the CapsLock remapping to
the end of the file and replaced CapsLock with Control in the copy. Reloaded the
script and everything seemed to work.

Waited a few days to confirm, and wrote it down before I forget.

Here is the relevant part:

~~~
Control::Send {esc}
Control & a::Send ^a
Control & b::Send ^b
Control & c::Send ^c
Control & d::Send ^d
Control & e::Send ^e
Control & f::Send ^f
Control & g::Send ^g
Control & h::Send ^h
Control & i::Send ^i
Control & j::Send ^j
Control & k::Send ^k
Control & l::Send ^l
Control & m::Send ^m
Control & n::Send ^n
Control & o::Send ^o
Control & p::Send ^p
Control & q::Send ^q
Control & r::Send ^r
Control & s::Send ^s
Control & t::Send ^t
Control & u::Send ^u
Control & v::Send ^v
Control & w::Send ^w
Control & x::Send ^x
Control & y::Send ^y
Control & z::Send ^z
Control & 0::Send ^0
Control & 1::Send ^1
Control & 2::Send ^2
Control & 3::Send ^3
Control & 4::Send ^4
Control & 5::Send ^5
Control & 6::Send ^6
Control & 7::Send ^7
Control & 8::Send ^8
Control & 9::Send ^9
Control & '::Send ^'
Control & ,::Send ^,
Control & .::Send ^.
Control & /::Send ^/
Control & -::Send ^-
Control & =::Send ^=
Control & [::Send ^[
Control & ]::Send ^]
~~~

Not elegant, but works fine for me.
