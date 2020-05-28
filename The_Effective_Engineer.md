## 1.Leverage
	Leverage = Impact Product / Time Invested
	3 questions:
		1. how can i complete this activity in a shorter amount of time?
		2. how can i increse the value produced by this activity?
		3. Is there something else that I could spend my time on that would produce more value?
	
	focus on high-leverage activities.

> "If you want to have a big impact, you need a leverage point-a way to put in a dollar of funding or an hour of 
 effort and benefit society by a hundred of a thousand times as much"  -- Bill Gates.

## 2.Optimize for Learning
	Optimizing for learning is a high-leverage activity.
	Adopting a growth mindset is a prerequisit for improving out abilities.
	
	Compounding , Exponential Growth
	1. learning follows an exponential growth curve.
	2. even samll deltas in your learning rate make a big difference over the long run.
	3. the earlier, the better. A good first job make it easier to get a better second one.
	
	Coninuous iteration. behave as a startup. long term success.

### Seek work environments conducive to learing.
Six factors to consider when choosing a new job  
1. Fast growth. "If you're offered a seat on a rocket ship, you don't ask what seat."  
2. Training
3. Openness
4. Pace
5. People
6. Autonomy

### Dedicate Time on the job to Develop new Skills.
20 % time to do a side work.
learning adjacent disciplines.
- Study code for core abstractions written by the best engineers at your company.
- write more code.
- Send your code reviews to the harshest critics.
- Participate in design discussions of projects you'r interested in.
- Work on a diversity of projects.
- Make sure you'r on a team with one you can learn from.
- Jump fearlessly into code you don't know.

### Always Be Learning
- Learning new programming languages and frameworks.
- Invest in skills that are in high demand.
- Read books.
- Join a discussion group.
- Build and maintain a strong network of relationships.
- Follow bloggers who teach.
- Write to teach.
- Tinker on side projects.
- Pursue what you love.

## 3.Prioritize Regularly

Woring on a task means not working on another.So regular prioritization is a high-leverage activity.

Hard, require practice.

### Track Todos in a Single, Easily Accessible List.

- checklists drastically reduce errors.Pilots check pre-flight lists, surgeons check operation list, construction manager check safety list.
- The first step of effective prioritization is listing every task.
- short memory, 7 items, deliberate remembering reduce our attention, inpair decision-making abilities.free the mind
- Task list should be simple, and only one master list.(只记录在一个地方)
- 用leverage来判断优先级，只需要排序最高的几个就可以了

### Focus on What Directly Produces Value

- meeting，writing status reports...only hava a weak and indirect connection to creating value.
- When you get the important things right, the small things often don't matter.
- Prioritize the ones that produces the most value with the least amount of effort.
- Don't try to get everthing done. Focus on what matters-produces more value.

### Focus on the Important and Non-Urgent.

- Investing in Quadrant 2 solutions can reduce urgent task and stress. 

- Planning / Building relations / New opportunities/ Personal development are things in Quadrant 2.

### Protect Your Maker's Schedule

- create block time. protect your time.

### Limit the Amount of Work in Progress

- Increasing work linearly increases the likelihood of failure exponentiallly.
- 《your brain at work》working memory like a small stage, When we work on many things simultaneously, we spend most of our brain resources moving actor on and off rather that outwork.

### Fight Procrastination with If-Then Plans
- It's difficult to start a difficult task.
- If-Then plan: If you want do sth, write down **when,where,how** you do it.
- Ex:"If 9 pm, Then I will coding", "If I have 20 minutes, I will remember Japanese word."

### Make a Routine of Prioritization
- If it's beginning of the week, then I add tasks I want to accomplish this week, put unfinashed work from previous week.

## 4.Invest in Iteration Speed

Continuous deployment

- allow incremental, small changes.
- instantly

### Move Fast to Learn Fast

learning compounds.

### Invest in Time-Saving Tools

> I've found that almost all successful people write a lot of tools..A very good indicator of future success was if the first thing someone did on a problem was to write a tool.

> If you have to do something manually more than twice, then write a tool for the third time.

Time-saving tools pay off large dividends.

Start small, find an area where a tool could save time, build it, and demonstrate its value.

### Shorten Your Debugging and Validation Loops

Much of our engineering time on these two activities.

after repeatedly going through the same motion, take a moment to think through where you able to tighten that testing loop.

> Effective engineers hava an obsessive ability to create tight feedback loops for what ther're testing.

### Master Your Programming Environment

Mastery is a process, invest some time.

Be mindful of which of your common, everyday actions slow you down, and how to do efficiently.

- Get proficient with your favoiter text editor or IDE.
- Learn at least one productive, high-level programming language.
- Get familiar with unix shell commands.
- Prefer the keyboard over the mouse.
- Automate your manual workflows. Like shells, extensions, etc.
- Test out ideas on an interactive interpreter. Compile is costing.
- Make it fast and easy to run just the unit tests associated with your current changes.

### Don't Ignore Your Non-Engineering Bottlenecks

Identify the biggest bottlenecks, figure out how to eliminate them.

Communication is critical for making progress on people-related bottlenecks.

Be active when depend on others.

## 5.Measure What You Want to Improve

The best indication of user happiness is the the "long click" for search on Google.

Choose different metrics can completely change what work gets prioritized.

### Use Metrics to Drive Progress

> If you can't measure it, you can' t improve it.   --- Peter Drucker

1. good metrics help you focus on the right things.
2. help guard against future regressions.(like the regression test.)
3. can drive forward progress.
4. let you measure your effectiveness and compare the leverage of your choice. 

### Pick the Right Metric to Incentivize the Behavior You Want

Selecting what you measure is as important as measuring itself.

Choose metric that: 1) maximize impact, 2) are actionable, 3) are responsive. 

### Instrument Everything to Understand What's Going On

When setting our goals, choose carefully what core metrics to measure and optimize, when it comes to day-to-day operations, measure and instrument as much as possible.

Open-source tools like Graphite, StatsD, InfluxDB, Ganglia, Nagios, and Munin make it easy to monitor systems in near real-time.

### Internalize Useful Numbers

| Access Type                             | Latency                 |
| --------------------------------------- | ----------------------- |
| L1 cache reference                      | 0.5 ns                  |
| Branch mispredict                       | 5 ns                    |
| L2 cache reference                      | 7 ns                    |
| Mutex lock/unlock                       | 100 ns                  |
| Main memory reference                   | 100 ns                  |
| Compress 1K bytes with Snappy(压缩软件) | 10，000 ns = 10 μs      |
| Send 2K bytes over 1 Gbps network       | 20,000 ns = 20 μs       |
| Read 1 MB sequentially from memory      | 250,000 ns = 250 μs     |
| Round trip within same datacenter       | 500,000 ns = 500 μs     |
| Disk seek                               | 10,000,000 ns = 10 ms   |
| Read 1 MB sequentially from network     | 10,000,000 ns = 10 ms   |
| Read 1 MB sequentially from disk        | 30,000,000 ns = 30 ms   |
| Send packet CA → Netherlands → CA       | 150,000,000 ns = 150 ms |

### Be Skeptical about Data Integrity

> All data can be abused.People interpret data the way they want to interpret it.

Untrustworthy data gets into decision-making processes provides negative leverage.

## 6. Validate Your Ideas Early and Often

### Find Low-effort Ways to Validate Your work

The shorter iteration cycle, the more quickly we can learn from our mistakes.

> What’s the scariest part of this project? That’s the part with the most
>
> unknowns and the most risk. Do that part first.

Invest a small amount of work to gather data to validate your project asuumptions and goals.

### Continuous Validate Product Changes with A/B Testing

In an A/B test, a random subset of users sees a change or a new feature.

Experiment-driven.

### Beware the One-Person Team

It adds friction to the process of getting feedack.

strategies for setting up feedback channel:

- Be open  and receptive to feedback.View feedback and criticism not as personal attacks but as opportunities for improvement.
- Commit code early and often.
- Request code reviews from thorough critics.It's better to get harsh feedback from a teammate early on than from users when something doestn't work.
- The most direct path to getting feedback is to request it.
- Design the interface or API of a new system first.
- Send out a design document before devoting your energy to your code.

### Build Feedback Loops for Your Decisions.

> A feed back loop is necessary for all aspects of a job. Otherwise, you're just...gursssing.

1. Formulate a hypothesis about what might work.
2. Design an experiment to test it, understanding what good and bad outcomes look like.
3. Run the experiment, learning from the result