# How I Work With AI

I lead operations and customer-facing work at a software company in the trading industry. I
also build software. Those two facts sit together only because of how I use AI, so this is a
description of the actual method rather than a list of tools.

## AI-assisted development is the method, not an accessory

I began building the operations platform about a year before the version that shipped. I
had some Python, a full-time job running support, and no real fluency with AI-assisted
development. The first attempt taught me that the method I was using was not enough to get
the work to production.

The second attempt became a production system. The difference was not more time or more
motivation. I stopped treating AI as something that helps with a hard function and started
treating it as the way the build happens. I scope the problem, describe what needs to exist
and under what constraints, direct the implementation, read what comes back, test it, and
decide whether it ships.

Most of what I do with AI is deciding whether the implementation should ship.

## I review everything before it ships

I set up a content sub-team from nothing and we produced more than 40 educational videos in
two months, using AI for scripting, voice, images, and editing, plus blog content on the
same basis. I read and corrected every script before it went out. Not spot-checked. Every
one.

That volume is only possible with AI, and it is only publishable because someone with the
domain knowledge read all of it. Where a script explained a trading concept in a way that
was technically defensible and practically misleading, the model had no way to know. I did,
because I had spent two years answering client questions about exactly that.

The key lesson I have learned about AI is not simply that output can be
bad. It is that output is confident and plausible whether or not it is correct. There is no
signal in the response that tells you which one you got. The only defence I have found is
to check against something real: run it, feed it a case where I already know the correct
answer, and see what comes back.

The sharper version of that is to check whether your check works. On a safety gate in the
platform I wrote the tests, then deliberately broke the code both ways — forced the guard
always-on, then always-off — and confirmed each turned the suite red before reverting.
Writing a test that passes proves nothing about whether it would have caught the bug.
Breaking the thing and watching the test fail is what proves it.

This generalises past testing. When you need a model *not* to do something, ask whether you
are requesting it or preventing it. In one tool the rule was that edits may only delete,
never rewrite — because the text belonged to the person who wrote it. The obvious
implementation is to tell the model that. It is also the wrong one: if it rewrites anyway
you get back plausible output and no error at all. So the model returns only which lines to
remove, and the code performs the edit.

## Record the learning before correcting the work

The discipline I would keep above all the others is a written ledger of lessons from the
work.

When I find something in my own work that needs correction — a number that no longer traces
to its source, a status reported from memory rather than checked, an item marked fixed that
was never actually deployed — the rule is that the learning gets written down before the
work is corrected. The entry names the pattern and includes a concrete check that would
have caught it.

Sessions end and context is lost. If the lesson only exists in the conversation where I
learned it, it is gone by next month and I may repeat the same pattern with total
confidence. Written down, it survives, and it can be checked mechanically before anything
ships. The ledger is append-only: if an entry turns out to be wrong, a correcting entry
goes underneath it rather than replacing it.

Two things I have since learned about ledgers through using them in practice.

**A correction is not finished until it reaches the artifact somebody loads.** I learned
that recording the correction accurately, in the right place, is not enough if the value in
the file that actually gets read has not also been updated.

**And the ledger itself needs to be kept current.** I keep a decisions file so settled
questions do not get relitigated. When I checked it against the code, a full sweep found
roughly 130 claims across 85 documents that no longer matched — and almost every one had the
same pattern: work that had shipped was still described as planned. One feature's planning
document still said "no implementation code exists yet" two months after it went live.
Nothing claimed to exist that did not, which is the direction you would choose. The lesson
is that writing decisions down does not keep them current.

## What I can and cannot do

I know basic Python and basic SQL. I can read code and understand what it does. That is the
ceiling and I state it because it is the useful fact.

What I did on the platform was learn enough of the concepts to reason about the system
independently: to know when a proposed approach did not fit the problem, to follow what the
code was doing, to test components against real operational cases, to troubleshoot when
they broke, and to decide what shipped. That is a real skill and it is not the same skill as
being an engineer. Conflating them would fall apart in the first serious conversation, so I
do not.

The part I am confident about is the judgment around the build. Knowing which problem is
actually worth solving, because I ran the operation the software is for. Knowing which
feature will not be used before it gets built. Knowing what "done" has to mean before
anyone declares it.

## The two rules I keep coming back to

Both of these predate the AI work. They come from running a team, and they turn out to
govern how I build software too.

**Policy is not followed by everyone automatically. You have to give a framework easy enough that the people working with you actually follow it.** I applied this principle by putting required context inside the workflow where the work already happens, rather than creating a separate task around it. A standard that sits off the path of least resistance is a standard that quietly stops being met, and then you are managing compliance instead of managing outcomes.

**Design the workflow so the work is repeatable, replicable and scalable.** One person
doing something well is not an achievement if it stops when they are on leave. This is why
the SEO audit I ran turned into a framework and a set of checklists rather than staying a
report. The report was worth something once; the framework is worth something every time
somebody else runs it.

AI has not changed either rule. It has made it much cheaper to act on them, because turning
a process into a working system used to require an engineer I did not have.

## What I am working on now

I am currently designing and building a new measurement capability with AI assistance. The work is in progress. Its purpose is to support future operational decisions.
