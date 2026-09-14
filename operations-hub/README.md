# Case Study — Building an Internal Operations Platform

**No source code is included here.** The system is my employer's internal production software. What follows is the problem it solved, the decisions behind it, how I built it with AI assistance, what I learned while building it, and the operational capabilities that have shipped.

Built in personal time, outside my paid role, over roughly two years including an earlier attempt that changed how I approached the build. It runs in production today and has replaced the spreadsheet workflow it was built to retire.

---

## What I set out to build

I wanted the operation to run on one system instead of several, so that the work, the people and the outcomes were visible in the same place at the same time.

I consolidated several operational workflows I was responsible for into one system. I designed the system to coordinate those workflows automatically rather than relying on manual assembly each day.

I also brought customer communication into shared context so relevant history could be used during ongoing operational work instead of remaining isolated in separate tools.

The test I set for the system was that it should provide a real-time view of operational status, workload and bottlenecks without anyone assembling that picture by hand.

I built the system so that operational status, workload and bottlenecks could be read in real time from one place, rather than assembled on request.

---

## What I built

An internal web platform that replaced the spreadsheet workflow across several operational functions.

**Role-based dashboards.** Different operational roles need different views. I designed each view around the decisions its user needed to make rather than giving every user the same information.

**Ticketing and escalations.** Agents can raise tickets from inside the platform, with an active list and a paginated history. Tickets can also be raised as notices rather than issues to resolve, broadcasting a heads-up to the relevant team channel. Cross-channel and direct-message reporting for tickets has been built and tested through all six planned build stages.

**Inbound call case management.** Every inbound call is tracked as a case that can span several calls for the same client. A single case view shows the full history of a case across calls. Case statuses have been expanded and wired through the workflow end to end, and calls handled by several agents in sequence are attributed correctly to each agent. Inbound dashboards provide operational views, including call analytics and case distribution.

**Post-conversation resolution workflow.** I added a structured record after a conversation closes and gated it on the source system's confirmed state. The workflow therefore cannot record a conversation as complete while its source remains open.

**Task and working-hours tracking.** I built structured time tracking that captured work consistently and kept different categories of activity separate so bottlenecks could be measured rather than inferred.

**Mandatory-acknowledgement notifications.** I designed a mechanism for operational messages that genuinely required acknowledgement, with the acknowledgement enforced by the system rather than assumed.

**A customer CRM.** Customer profiles brought relevant information into one operational view and kept it current through automated updates. Each profile can also hold linked accounts, contact history and outcomes across chat, email and calls. A complete client contact log records each contact and its outcome, while follow-up tasks can be assigned and tracked when a client needs to be informed.

**Outbound email.** The platform can send outbound email from inside the operational workflow. The mail path has been proven working end to end. The broader mail management workflow is **in progress**.

**Quality and performance.** I built a chat audit workflow with manual feedback that has been reviewed and live-tested end to end, along with objective per-agent measures and customer ratings that are captured and reported.

**Leave management and role-based access control.** I built leave management with coverage and access controls that limited operational functions according to the user's authorised role. The administration layer also supports custom roles and a delegated administrative role.

**Workforce management.** The platform includes shift scheduling with standing schedules, one-off overrides and a full change audit trail. Flexible shifts support per-shift working days. An attendance and automatic marking engine applies leave, absence and break rules automatically and was verified against a month of real data. The platform also includes presence and session tracking.

**A companion mobile app** for recording activity that needed to be captured away from the desktop platform and brought into the same operational context. The app makes outbound call activity measurable by reading the phone's own call log, matching calls to clients server-side and submitting only confirmed matches. There is no manual entry, so call records cannot be typed in or guessed. The app also includes update gating so users run a supported version.

**Operational safety and administration.** The platform includes protections preventing users from extracting the complete client dataset in bulk, backup and restore safeguards, settings export and import, and notifications with per-user controls and team-channel delivery.

---

## What it is made of

Numbers counted from the repository, not estimated.

| | |
|---|---|
| Python | ~118,000 lines |
| Database tables | 78 |
| Schema migrations | 87 |
| Route modules | 25 |
| Page templates | 72 |
| Tests | over 3,000 |
| Project documentation | ~64,000 lines |

It is a Python-based application with a companion mobile app. The specific internal stack stays private.

**On the build.** Writing this is not a claim that I am a software developer — I am not. I know basic Python and basic SQL, I can read and review code, and I decided what shipped. The distinction matters and I would rather state it than have it inferred.

**Why I chose a lightweight approach.** I started before I fully understood what the finished processes would become, so I wanted an architecture I could change incrementally as the requirements became clearer.

That flexibility mattered as the system grew. I was able to change individual parts without replacing the application around them.

A more comprehensive framework would have provided useful capabilities earlier. Looking at the final requirements, though, I still preferred the flexibility of building the operational experience around the work rather than adapting the work to generic system conventions.

---

## The decision I am most confident about

Presence tracking took me three attempts, and the third one worked because I stopped trying to refine the approach and changed it.

I had been trying to infer operational presence from an input that could not reliably distinguish the states I needed. No amount of refinement could make missing information reliable, so I changed the mechanism rather than continuing to tune the same approach.

**The interesting part was the deployment.** The obvious implementation would have required changing a working part of the application to support a feature with a narrower scope.

Instead, I isolated the new capability so the existing application path remained unchanged. Rollback meant disabling the isolated component rather than reversing changes to the system already in use.

It is live in production.

**The general lesson:** when a mechanism has failed three times, stop improving the mechanism. And when the obvious implementation requires changing the part of the system that already works, look for the version that leaves it alone.

---

## Testing, and what it took to trust it

Over 3,000 tests, written alongside features in the same commit rather than as a later phase. The rules below are the ones I would keep anywhere, and each came from something I learned while building and verifying the system.

**Break the code to prove the test works.** I wrote the tests, then deliberately forced the safety condition both ways and confirmed each change made the suite fail before reverting it. **Writing a test that passes proves nothing about whether it would catch the bug.** Breaking the code and watching it fail is what proves it. I then verified the behaviour in an environment that reproduced the relevant production conditions rather than trusting the local run.

**A hung test must fail loudly.** A test that deadlocks does not error. It stops producing output, which is indistinguishable from still working. It gets diagnosed by theory instead of measurement. I learned that a timeout needs to produce diagnostic information on expiry so a failure identifies the blocked work instead of simply terminating it. Bisecting could then identify the problem quickly instead of turning a stalled run into a long investigation.

**A test must assert the quantity it names.** One of the lessons was that a test can appear to check a specific calculation while actually reading a nearby similar-looking number from the interface. Where the interface does not display what you are testing, capture the real computed value rather than pattern-matching the rendered output for something that looks close.

**Ban the convenient workaround explicitly.** A platform-dependent default produced failures that appeared only on one operating system. The lesson was to make the required setting explicit and forbid the easier option of suppressing the error, because that can turn the tests green while feeding corrupted data into the assertions underneath.

**Prove coverage on fixes.** For bug fixes, I also use mutation testing: the fix is removed to confirm that the new test fails. A test that remains green when the underlying fix is removed is not providing the protection it appears to provide.

Bug fixes follow a written process: reproduce the issue, map the impact, make the fix, and verify the result in an environment that reproduces production conditions.

---

## Design decisions

### The client profile, and the thirteen-agent problem

The feature I am most convinced by is the least technical one. Each client has a single profile holding their context and their complete service history, so whoever picks up the next conversation can see what happened in all the previous ones.

I designed the client history for conversations that pass between many people over time. One anonymised production record showed repeated handovers across a long service history.

At that point a shared history is worth considerably more than a set of separate conversation records. One profile holds the context from earlier interactions, so the next person can continue from the same history instead of reconstructing it from separate conversations.

The profile is supported by linked accounts, contact history and recorded outcomes across chat, email and calls, so related client activity can remain connected in the same operational context.

### Context capture had to sit on the path of least resistance

The obvious way to fix that is a policy: agents must record client context after each conversation. A rule that adds a separate task is the first one skipped on a busy day.

So client context is not captured through a separate task. I placed it inside work people were already required to complete, making the additional information part of an existing workflow rather than a separate obligation.

The policy had to fit inside work people were already doing. A standard held across a team has to sit on the path of least resistance.

### Gate the workflow on the source system, not on the agent

The workflow is gated on the source system's confirmed state. This was a deliberate constraint on users. It removes disagreement about whether work is complete and prevents two systems from recording conflicting versions of the same fact.

The same principle informed the pending resolution workflow: the required resolution record sits in the path of closing the work rather than relying on a separate reminder or later manual check.

### Build cheap, on purpose

I designed to minimise additional operating cost by extending capabilities already available rather than adding unnecessary commercial tooling. The result kept the additional system footprint small and avoided introducing new vendors.

---

## How I built it with AI

### What I learned from the first attempt

I first tried to build this about a year before the version that shipped. It went slowly and did not get there. I had some Python, no fluency with AI-assisted development, and a day job running support operations.

The central lesson was that more persistence with the same method was not going to solve the problem.

The second attempt worked because the method changed. AI-assisted development was the explicit build methodology, not an accessory to it — it is what turned a stalled personal project into a production system.

### How I directed it

The division of labour, stated plainly:

- **I scoped the problem.** I defined the operational need, the people affected by it and what a useful solution would have to achieve. I was able to do that because I ran the operation the system was built to support.
- **I designed the workflows.** What screens exist, what a role sees, what is required versus optional, what blocks what. Decisions about how people work, not about code.
- **I directed the implementation.** Described what to build, in what order, with what constraints.
- **I read the output.** Every time. I know basic Python and basic SQL and I can read code and follow what it does. That is enough to catch a lot, and it is not the same as being able to write it myself.
- **I tested components and troubleshot them.** Against real operational cases, with real data, before deployment.
- **I decided what shipped.** Including a fair amount that did not.

AI output can be confident and plausible even when it is wrong. The only defence I found is to check it against something real: run it, feed it a case I already know the answer to, and see what comes back.

### Engineering hygiene I directed and verified

Beyond features, I directed a round of cleanup work and reviewed the effect of each change before it shipped:

- Consolidated repeated timezone calculations into shared helpers
- Standardised repeated response handling
- Improved an inefficient data-access path on a heavily used page
- Centralised repeated access logic into one source of truth

To be precise about my own role: I identified that these were worth doing, directed the changes and verified the result. Performance improved, recurring timezone errors stopped, and repeated access behaviour became consistent. I am not going to present these as concepts I could lecture on. I can tell you what problem each one fixed and how I confirmed it was fixed.

---

## What I learned while building it

### Define the workflow before building the screen

Early dashboard work was reshaped several times because I had designed the screen before I had properly understood who was looking at it and what decision they were making. The agent card layout in particular went through repeated redesigns.

The lesson was to define the user's decision first: **what does this person need in the first three seconds?** The screens designed from that question were easier to build around the actual work.

### Decide the source of truth before building synchronisation

Keeping one system consistent with another system that is also being changed by people, in real time, is harder than it looks from the outside. State changes, delayed updates and changes of responsibility created cases that were not in the original plan and had to be handled.

The lesson was to decide the source of truth for every field before writing synchronisation around it. Most consistency problems become easier to reason about when it is clear which system owns each fact.

### A "done" is not the same as a verified result

A component that runs without an error is not necessarily a component that works.

I learned to test with a case where I already knew the correct answer, so the output had something concrete to be wrong against.

### Change the method when the method is the constraint

The earlier build attempt continued for longer than it should have because I kept applying effort without stepping back to ask what was actually blocking progress.

The lesson was that the constraint was the method, not the amount of effort. Changing the method made the second attempt possible.

### Keep decision records aligned with the implemented system

I checked the written decisions against the implemented system and found that some records no longer described the current state.

Almost every discrepancy had the same pattern: work that had shipped was still described as planned. Nothing claimed to exist when it did not, but documentation that describes finished work as pending can still mislead the next person who relies on it.

Another recurring source was renamed code still referred to by older names in current-state documentation.

The rule now is that a decision's status gets corrected in the same commit as the change.

---

## What I would carry forward

- **Write the workflow down before building the screen.** The screens I designed on paper first are the ones that did not need rebuilding.
- **Decide the source of truth for every field before writing any sync code.** Most of the consistency bugs came from two systems both believing they owned the same fact.
- **Ship narrower.** The version that got adopted was smaller than the version I first planned. Some of what I built early was never used and existed because I thought it would be needed rather than because anyone had asked.
- **Keep a written learning log from day one.** I started doing this later, in other work, and it is the single practice I would carry backwards.

---

## In progress

### International outbound sales workflow

I am working on an international outbound sales workflow inside the platform, including the import of existing sales records.

The work has been scoped and approved to build. It is **in progress** and is not yet shipped.

### Client journey view

A client journey view has been scoped.

It is deliberately not being built yet and remains **in progress** rather than shipped functionality.

### The next measurement layer

I am also working on the next measurement layer for the platform. The work is **in progress**, and the design stays internal.
