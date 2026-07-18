+++
title = "Hermes AI agent: How do I use it"
date = 2026-07-18

[taxonomies]
tags = ["productivity"]

[extra]
song = "7empest ⋅ Tool"
+++

## What Is Hermes?
[Hermes](https://hermes-agent.nousresearch.com/docs/) is an agentic AI, from Wikipedia:

> In the context of generative artificial intelligence, AI agents (also
> referred to as compound AI systems or agentic AI) are a class of intelligent
> agents that can pursue goals, use tools, and take actions with varying
> degrees of autonomy. In practice, they usually operate within human-defined
> objectives, constraints, and available tools.

In my specific case, it's a Docker container on one of my servers, and I chat
with it via Telegram, but there are a lot of messaging gateways to choose from
(Matrix, Slack, Signal…).

It's powered by Deepseek v4 Flash through [OpenRouter](https://openrouter.ai/).

What it does, basically, is to automate some tasks for you, limited by the tools
you provide.

In other words, it's my personal assistant. So no, I don't use it for code.

## Why I Use It
Over the last 5-6 years, I've tried my best to keep notes on various topics,
organize my thoughts and ideas, keep track of the tasks I'm working on, and
pursue some sane habits like weekly and monthly reviews, distilling ideas, and
trying to find connections between them (I'm a huge graph theory fan).

The problem? I'm a _reeeeeally_ lazy person, and it looks like I'm allergic to
keeping the motivation up. In my defense, the number of tools needed to achieve
my dream workflow is quite high, and usually they don't integrate well together.

A "Second Brain" or "PKM" is useful only if it's constantly maintained, that's
probably why some people call it a "digital garden".

I tried different approaches, but I can't rely on myself. A personal assistant
keeps me in line, asks what I'm doing, keeps a record of my bookmark, reminds me
to write down tasks or ideas…

It's a motivator, or at least, I use it this way.

It doesn't do the heavy lifting for me: I still have to read the articles, watch
the videos, write down notes, ideas, reminders, and keep track of what I'm
doing, but Hermes facilitates the flow.

## My Daily Tools
So, as I said, Hermes lives on one of my servers. Along with it, I use the
following tools:

- [Silverbullet](https://silverbullet.md/): this is the core of my notes.
  Silverbullet is a Programmable, Private, Browser-based (with PWA for Mobile),
  Open Source, Self Hosted, Personal Knowledge Database. It's easy to selfhost
  (Docker again), uses pure Markdown, supports bi-directional links, can be
  extended with Lua, and it has a query language similar to Obsidian Bases.

  In other words, it's wonderful.

  Here I have some macro-categories: Ideas, Bookmarks, Journal, Projects,
  Resources, Companies, and People.

  The categories are quite self-explanatory:
  - **Journal**: some kind of daily scratchpad where I take notes about my day in
    a random fashion. A daily inbox, if you want, works as my main entry point.
  - **Ideas**: it's where I keep ideas and thoughts that pop into my mind about
    a topic.
  - **Bookmarks**: a random collection of links I want to read/watch/keep along
    with a brief summary of what they are about.
  - **Projects**: here I keep a single file for each project I'm working on. For
    example, I may take notes of a meeting in a Journal note, tagging the
    relevant Project and then summarize the meeting notes there.
  - **Resources**: this is where I keep nested notes on topics that I'm interested
    in. For example, I have a "Programming" resource with sub-notes, like
    "Programming/Clojure", "Programming/Go", or "Programming/Algorithms". When
    I distill Ideas, Bookmarks, or Journals, that's where I keep the important
    and general bits.
  - **Companies** and **People**: that's where I keep record of the customers and
    suppliers, and some kind of "contacts" of the people I work with. This way
    I keep some history of the interactions or pending tasks with them. For
    example: Project Foo is linked with Company Bar and the contact is Person
    Baz.

- [TickTick](https://ticktick.com/home): this is where I organize tasks per
  project, setting priorities, and reserving some time every day to consume the
  bookmarks I saved.

  Why a different application? I learnt that applications that do one thing and
  one thing only are more usable and practical than generic purpose ones.

  An improvement would be adopting a CalDAV server and save the tasks there,
  just to have ownership over my data without extra costs. I have yet to find
  an MCP server or a skill good enough to manage a CalDAV server.

- [Letterly](https://letterly.app/): I was lucky enough to get a lifetime subscription to this via AppSumo.
  It's simply a transcription app that has a native MCP server, and it's quite
  good. I use it to record my notes and meetings with multiple speakers.

- [Clockify](https://clockify.me/): this is an old companion to keep track of my
  time spent on each task. Thanks to their OpenAPI, I vibecoded an MCP server to
  let Hermes interact with it, you can find it [here](https://github.com/mdallastella/clockify-mcp).

  I have never been able to find a selfhosted solution good enough to replace
  it. Anyway, I use the free plan and it's more than enough for my purposes.

## How Hermes Helps Me
Hermes has access to all of these tools and orchestrates them via MCP servers,
so I can either interact with each tool directly or ask Hermes to do it for me
via Telegram.

My daily workflow looks like this:

- In the morning, I record all my thoughts, tasks, ideas, whatever using
  Letterly while I drive to work. Once there, I ask Hermes to get the
  transcription, identify and extract each "context" and write them down in my
  journal (or in Silverbullet, generally speaking). It also creates the
  corresponding tasks in TickTick and prepares the time entries in Clockify.

- In the meantime, Hermes has a cronjob that checks pending tasks in TickTick,
  reschedules them and takes notes in the daily journal. I don't let Hermes
  decide when to do what, I spend the first 15 minutes at my desk to review what
  it did and schedule everything to my taste.

- Every 30 minutes Hermes checks if there are a running timer on Clockify, if
  not it reminds me to start one or to tell it on which one I'm working and
  forget to start, so it does it for me.

  Hermes knows my working hours, the "cronjob" doesn't bother me when I'm not
  at work, but I should probably refine this skill to bother me if there are
  pending tasks and what to do with them. Is it maybe too much? :thinking:

- Whenever I send Hermes a link, a new bookmark is created and noted in the
  journal. As I said, it also grabs some info and provides a small summary.

- At the end of the day, Hermes checks the closed tasks and the timers and
  summarizes everything in the journal, so I can jump back to any day and see
  what I have done and how much time I spent on tasks.

  It's not a metric about productivity: I track everything, not only the
  scheduled tasks but also interruptions, calls, meetings, coffee breaks,
  whatever. Helps me keep up with strategies to work only on what I really
  want to. "How many times have I been interrupted this week?" is a common
  question I submit to Hermes.

Every Sunday, Hermes does another summary job for the whole week. Plus, it
includes links to ideas I've worked on, bookmarks I collected, resources
I improved.

One last useful skill I use is "Learning from Notes": Hermes asks me questions
about a topic I covered in my notes and suggests where I should dig deeper and
writes down what I forgot and must review.

As you can see, Hermes interacts mostly in the daily journal. It is my
responsibility to refine and distill everything that happens during the day or
week. I need a tool that holds the pieces and scraps of information together,
but I'm the one that should explore and consume them.

That's all for now, it's already a quite long post.
