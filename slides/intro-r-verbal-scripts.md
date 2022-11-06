---
nav_exclude: true
---


# waiting and [pre-workshop setup](https://ubc-library-rc.github.io/data-analysis-r/#pre-workshop-setup)
Hello, this is <ins>presenter name</ins>. I'm the presenter today. We are going to get started in just a few minutes. Thank you so much.

Before getting started, we'd like everyone to take the time to make sure that you **have R and RStudio installed** on your computer. 
- If you haven't, the link to the web page I am sharing now is on the chat. Please click on the link to visit the web page and follow the instructions to download and install R and RStudio.
- If you have already installed them. That's great. You may also click on the link and take a look at the other content on this page. You can see from the left panel of the page that this page is actually the overview of the Data Analysis in R workshop series. Scroll up a bit and you can see the four workshops. Click on the name of the workshop will take you to the subpage of each workshop which contains the materials such as slides, R markdown files and some resources. We will work on the intro part today. The main material we will use is the R markdown file shown here, you may download and preview it.

Again. Hello, my name is <ins>presenter name</ins>. I'm the presenter today. We are anticipating another few folks to join us. We're gonna give them just another minute or 2 and then we'll get started. We want to be very respectful of your time. 

**Recording:** Today's workshop will be recorded and the recording will be made available to you. If you don't want to show your face, feel free to turn off your camera. If you don't want to show your name, feel free to rename yourself. <ins>coordinator name</ins>, could you start recording? Thank you.

Alright, let's get started. Thank you for joining us today. The link on the chat will take you to the materials for today's [intro to R and RStudio workshop](https://ubc-library-rc.github.io/data-analysis-r/intro-to-r/introduction.html), which is the page I am on now.

The slides here contain some preparation steps,  description of goals and outline of today's workshop. The R markdown file will be the main document we will work on later. Let's look at the slides first.

# Slides
## [title page](https://ubc-library-rc.github.io/data-analysis-r/slides/intro-r-studio.html)
**Self-intro:** Today's workshop is provided by the UBC library research commons. My names is <ins>presenter name</ins>. I work for the research commons data team. I will be the presenter today, and with us is my colleague, <ins>coordinator name</ins>, who also comes from our data team. <ins>coordinator name</ins>, do you wanna say a few words? 

**Workshops:** The first link shown here will take you to the overview of our four-part workshop series on Data Analysis in R. We are on the intro to R and RStudio today, and we will provide workshops such as  Visualization with R, R for statistical analysis in the future, You are welcomed to register for those workshops as well if you are interested. Click on "intro to R and RStudio" here takes us back to our initial page and let's look at the slides again.

**Consultations:** The second link shown here is for appointment of individual consultation. It's another service provided by the research commons. If you have specific questions about learning and using R, you are encouraged to book an appointment with us.

## [land acknowledgement](https://ubc-library-rc.github.io/data-analysis-r/slides/intro-r-studio.html#/1)
I would like to acknowledge the traditional, ancestral, unceded territory of the Musqueam people on which we are learning, working and organizing today.

## [participating online](https://ubc-library-rc.github.io/data-analysis-r/slides/intro-r-studio.html#/2)
Active participation enlivens the session with other voices and perspectives. We encourage you to engage with me and with each other.

The toolbar at the bottom of the zoom window provides several ways to be part of the conversation. The one we will use the most often would be the reactions. Your microphones are muted by default to improve sound quality. You can raise your hand if you wanna ask questions or give comments. And I may ask you to give me a yea/no answer, or an indication of whether you wanna me to go slower or faster.

I may also invite you to participate through Annotation. At the upper middle of the zoom window, there is a view option button. If you click it, you can choose to annotate.

## [learning objectives](https://ubc-library-rc.github.io/data-analysis-r/slides/intro-r-studio.html#/4)
The objectives today is ...

## [outline](https://ubc-library-rc.github.io/data-analysis-r/slides/intro-r-studio.html#/5)
The workshop will take about 2 hours, with a five minutes break halfway. 
In the first part, we will talk about ... 
In the second part, we will learn how to ...

## [pre workshop setup](https://ubc-library-rc.github.io/data-analysis-r/slides/intro-r-studio.html#/6)
We assume you have already installed R and RStudio on your computer. That's the requirement shown on the registration page. Having them installed can let you follow me along the way to get some hands-on experience.

However, if you haven't installed them. No worries, it's fine. You may just watch my screen, and try it on later by yourself. You will have access to all the materials needed.

## [R](https://ubc-library-rc.github.io/data-analysis-r/slides/intro-r-studio.html#/7)
R is a programming language developed by statisticians for data analysis. 

It has several attactive features,
1. It's free and open source. Whenever you open it, there is an description shown automatically in the R console, telling you the version, copyrght, platform and free.
2. **R console** executes commands as you type them. It provide an interactive environment. The interactivity enables you to quickly explore data. 
3. One of the great advantages of R over point-and-click analysis software is that you can save your work as scripts that can be easily executed at any moment. These scripts serve as a record of the analysis you performed, a key feature that facilitates reproducible work. 

## [R Studio](https://ubc-library-rc.github.io/data-analysis-r/slides/intro-r-studio.html#/8)
R Studio makes it easier to work with R. [R vs RStudio:](https://mgimond.github.io/ES218/R_vs_RStudio.html)
- R is the actual programming language. It’s the workhorse. Without R installed on your computer or server, you would not be able to run any R commands.
- RStudio is a convenient interface in which to use R. It’s sometimes referred to as an Integrated Development Environment (IDE). RStuio is not needed if you feel comfortable working with R directly.

Once again, let's **open RStudio** together to have a look at its interface. When you start RStudio for the first time, you will see three panes. 
- The left pane shows the R console. The same as the console we saw in R. It's where to execute the code and give the results.
- On the right, the top pane includes tabs such as Environment and History. The Environment tab allows you to see what objects are in the workspace. The History tab allows you to see the commands that you have entered. 
- The bottom pane shows tabs such as File, Plots, Packages and Help. You can browse the various files and folders on a computer in File. In Plot, you can obtain the plots. In Packages, you can view the list of all the installed packages. In help, you can can browse the built-in help system of R with this command ? followed by something you wanna ask. For example, let's type ?mean() in the console and see what's come up in the Help. So it tells you, this is a generic function for the arithmetic mean from the base package (if you don't know what the package is yet, don't be scared, we will talk about it more later).

To start a new script, click on File, then New File, then R Script. It shows up in the top left pane. Script is recommmended if you wanna save your work for future use. R console is recommended if you wanna have a quick exploration and it does not need to be saved. And of course, they can be used together. 
You can also create a R Markdown file. Once a markdown file is created, you can see a brief introduction about it. 


## [R Markdown](https://ubc-library-rc.github.io/data-analysis-r/slides/intro-r-studio.html#/9)
R Markdown is a specific type of file format designed to produce documents that include both code and text/narratives are in the same document. 
- Although you can also put text as annotation in R script with a # sign,  R Markdown allows results to be automatically generated from the source code. For example, if you click on the **run** button here (keyboard shortcuts are available, refer to the drop-down menu on run in the upper right corner of the pane), the results show just beneath the code. Let's just **minimize R console** to increase visibility. It shows repetitive information of the code executed and the results.
- Besides, R Markdown supports dozens of static and dynamic/interactive output formats. For example, if you click **Knit** here, you can render it as html, pdf, or word document, etc. 

From now on, we will work on the R markdown file prepared for the intro R workshop. Up to now, do you have any questions?

# move on to the R Markdown file

Great, let now go back to the web page for today's [intro to R and RStudio workshop](https://ubc-library-rc.github.io/data-analysis-r/intro-to-r/introduction.html). The link is on the chat. Download the R Markdown file and put it on the file folder where you intend to save the file. When the file is on your target folder, open it with RStudio.
