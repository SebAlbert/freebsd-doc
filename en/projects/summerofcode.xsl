<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE xsl:stylesheet PUBLIC "-//FreeBSD//DTD FreeBSD XSLT 1.0 DTD//EN"
				"http://www.FreeBSD.org/XML/www/share/sgml/xslt10-freebsd.dtd" [
<!ENTITY title "FreeBSD Summer Projects">
<!ENTITY email "freebsd-www">
<!ENTITY % navinclude.developers "INCLUDE">
<!ENTITY % developers SYSTEM "../developers.sgml"> %developers;
]>

<!-- $FreeBSD: www/en/projects/summerofcode.xsl,v 1.18 2009/03/16 13:42:23 rwatson Exp $ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:cvs="http://www.FreeBSD.org/XML/CVS">
  <xsl:import href="http://www.FreeBSD.org/XML/www/lang/share/sgml/libcommon.xsl"/>

  <xsl:variable name="date">
    <xsl:value-of select="//cvs:keyword[@name='freebsd']"/>
  </xsl:variable>

  <xsl:param name="ideas.xml" select="'ideas/ideas.xml'" />

  <xsl:output type="html" encoding="&xml.encoding;"/>

  <xsl:template match="ideas">
    <html>
      &header1;
      <body>

	<div id="CONTAINERWRAP">
	  <div id="CONTAINER">
	    &header2;

	    <div id="CONTENT">
              <div id="SIDEWRAP">
                &nav;
              </div> <!-- SIDEWRAP -->

	      <div id="CONTENTWRAP">
		&header3;

<p>The FreeBSD Project is looking forward to participating as a mentoring
  organization in <a
  href="http://code.google.com/summerofcode.html">Google Summer of
  Code</a> 2009.  This program funds students to contribute to an open
  source project over the summer break.  We have had over 70 successful
  students working on FreeBSD as part of this program in <a
  href="&base;/projects/summerofcode-2005.html">2005</a>, <a
  href="&base;/projects/summerofcode-2006.html">2006</a>, <a
  href="&base;/projects/summerofcode-2007.html">2007</a>. and <a
  href="&base;/projects/summerofcode-2008.html">2008</a>.</p>

<ul>
  <li><a href="#benefits">Benefits of Participating</a></li>
  <li><a href="#students">Past Student Projects</a></li>
  <li><a href="#ideas">Example Proposal Ideas</a></li>
  <li><a href="#mentors">Possible Mentors</a></li>
  <li><a href="#proposals">Proposal Guidelines</a></li>
  <li><a href="#infrastructure">Infrastructure Provided to Students</a></li>
  <li><a href="#faq">Frequently Asked Questions</a></li>
  <li><a href="#advertise">Advertise on Your Campus</a></li>
</ul>

<a name="benefits"></a>
<h2>Benefit of Participating</h2>

<p>Google Summer of Code is an exciting opportunity for students to
  "intern" with an open source project for a summer.  The FreeBSD
  Project, as one of the most successful and oldest open source projects,
  is an excellent place to do this internship.  Founded in 1993, the
  project now consists of several hundred "committers" and tens of
  thousands of contributors.  FreeBSD is the foundation for many
  commercial products, including Apple's Mac OS X, NetApp's OnTap/GX,
  Juniper's JunOS, as well countless other products, and is widely used
  in the Internet Service Provider and corporate IT worlds.  Many of
  these sponsors participate daily in the FreeBSD community, and students
  have the opportunity to develop software ideas in an exciting
  environment with many real world applications, and under the mentorship
  of experienced developers.</p>

<p>After the summer ends, many of our students are sponsored by Google or
  the FreeBSD Foundation to attend operating systems and open source
  conferences to present on their work, and a significant number go on to
  become FreeBSD developers.  It's also a great job networking
  opportunity!</p>
 
<a name="students"></a>
<h2>Past Student Projects</h2>

<p>For a complete list of student projects from previous years,
visit:</p>
<ul>
  <li><a href="&base;/projects/summerofcode-2008.html">Summer of Code 2008 FreeBSD
  Projects Summary</a></li>
  <li><a href="&base;/projects/summerofcode-2007.html">Summer of Code 2007 FreeBSD
  Projects Summary</a></li>
  <li><a href="&base;/projects/summerofcode-2006.html">Summer of Code 2006 FreeBSD
  Projects Summary</a></li>
  <li><a href="&base;/projects/summerofcode-2005.html">Summer of Code 2005 FreeBSD
  Projects Summary</a></li>
</ul>

<p>See also our wiki pages for student projects [<a
href="http://wiki.freebsd.org/moin.cgi/SummerOfCode2008">2008</a>,
<a
href="http://wiki.freebsd.org/moin.cgi/SummerOfCode2007">2007</a>,
<a
href="http://wiki.freebsd.org/moin.cgi/SummerOfCode2006">2006</a>, and 
<a
href="http://wiki.freebsd.org/moin.cgi/SummerOfCode2005">2005</a>].</p>

<a name="ideas"></a>
<h2>Example Proposal Ideas</h2>

  <p>The following example project ideas are a subset of the general
    <a href="&base;/projects/ideas/index.html">FreeBSD Project
    Ideas</a> list that we think are the most suitable for Summer of
    Code projects.  You are not required to submit a proposal using one of
    these ideas - original ideas, if of interest to the project, are
    most welcome.</p>

  <xsl:for-each select="document($ideas.xml)//descendant::category[child::idea[@class='soc']]">
    <h3><xsl:value-of select="title"/></h3>

    <ul>
      <xsl:for-each select="idea[@class='soc']">
      <li><xsl:element name="a">
	<xsl:attribute name="href">
	./ideas/index.html#p-<xsl:value-of select="@id" />
	</xsl:attribute>
	<xsl:value-of select="title" />
	</xsl:element>
      </li>
      </xsl:for-each>
    </ul>
  </xsl:for-each>

  <p>For additional ideas about upcoming development projects in
    FreeBSD, take a look at recent <a
    href="&base;/news/status">Developer Status Reports</a>.</p>

<a name="proposals"></a>
<h2>Proposal Guidelines</h2>

<p>Students are responsible for writing a proposal and submitting it
  to Google before the application deadline.  The following outline
  was adapted from the Perl Foundation <a
  href="http://www.perlfoundation.org/gc/grants/proposals.html">open
  source proposal HOWTO</a>.  The objective of the proposal is to identify
  what is to be done, explain why this needs to be done, and convince us
  that:</p>

  <ul>
    <li>You are qualified to do this project. This means both having the
      necessary background and demonstrating a general understanding of the
      problem.</li>
    <li>You have the resources (especially time!) needed to complete the
      project within the working period of the Summer of Code.</li>
  </ul>

  <p>A strong proposal will include (at least):</p>

  <h3>General Information</h3>
  <ul>
    <li><strong>Name</strong></li>

    <li><strong>Email</strong></li>

    <li><strong>Phone</strong></li>

    <li><strong>IM/IRC</strong></li>

    <li><strong>Availability</strong>

      How many hours per week will you spend working on this? How many on
      other things? What other obligations (work, school, vacation, weddings,
      etc) do you have this summer? Be as specific as possible: when will the
      project begin and and?  You should be ready to produce a day by day
      schedule before the program starts.)</li>

    <li><strong>Bio</strong>

      Who are you? What skills do you bring to this project? What is your
      past involvement with The FreeBSD Project?  (Past involvement is not
      required, but ideally you will have at least installed FreeBSD and
      perhaps fixed a bug or two)  If your project includes programming in a
      particular language, such as C, or in a specific environment, such as
      the kernel or an embedded platform, what experience do you have working
      in that area?  Are you familiar with or a user of revision control
      systems?  Have you completed courses that will be relevant to your
      project idea?  What do you think you will need to learn to complete
      this project?</li>

    <li><strong>Possible Mentor</strong>

      Optional, but highly recommended. Do not put a name here if you have
      not contacted them.</li>

    <li><strong>Project Title</strong></li>
  </ul>

  <h3>Project Information</h3>
  <ul>

    <li><strong>Project Description</strong>

      A few paragraphs describing your project. Direct copies from the ideas
      page will be rejected - proposals should reveal that you have done
      some research into the problem and its solutions.  Include both what
      you will be doing and why it is a good thing for The FreeBSD Project.
      </li>

    <li><strong>Deliverables</strong>

      A list quantifiable results and related code milestones. We suggest at
      least two milestones before the mid-term evaluations and two after.
      Where appropriate, this schedule should include multiple committable or
      releasable points so people can benefit from and/or test your work as
      early as possible.</li>

    <li><strong>Test Plan</strong>

      What parts of your code need testing and how do you plan to test them?
      This might include both functionality and performance tests.</li>

    <li><strong>Project Schedule</strong> - How long will the project
      take? When can you begin work?</li>

    <li><strong>Availability</strong> - How many hours per week can
      you spend working on this?  What other obligations do you have
      this summer?</li>

    <li><strong>Bio</strong> - Who are you? What makes you the best
      person to work on this project?  Do you use FreeBSD already?</li>

  </ul>

<a name="mentors"></a>
<h2>Mentors</h2>
 
<p>A number of FreeBSD committers are willing to mentor students.  A
  good place to start is the 'Technical contacts' listed with the
  example projects on the <a
  href="&base;/projects/ideas/index.html">Ideas page</a>.</p>

<a name="infrastructure"></a>
<h2>Infrastructure Provided to Students</h2>

<p>In previous years, the FreeBSD Project provided access to the FreeBSD
  Perforce revision control infrastructure in order to facilitate
  student collaboration, provide public access and archiving for the
  on-going student projects, and to help mentors and the community
  monitor on-going work.  It is expected that students participating
  in future programs will be offered the same facilities.  Students
  will also be asked to maintain wiki pages on their on-going
  projects.  In the past, e-mail, IRC, and instant messaging have
  proven popular among students and mentors, and students
  participating in the FreeBSD summer program are encouraged to use
  these and other electronic communication mechanisms to become active
  in the community.</p>

<a name="faq"></a>
<h2>Frequently Asked Questions</h2>

<ul>
  <li><p><strong>When are proposals due, and how do I submit mine?</strong>
    </p>

    <p>At the time of writing, Google has announced the following dates of
      interest relating to the application process:</p>

    <ul>
      <li><p><strong>18 March</strong> - Google to announce what open source
	organizations will participate in Google Summer of Code 2009.</p></li>

      <li><p><strong>23 March</strong> - Student application period opens.
	</p></li>

      <li><p><strong>3 April</strong> - Student application period closes.
	</p></li>

      <li><p><strong>15 April</strong> - Organizations finish reviewing
	applications an mentors registered.</p></li>

      <li><p><strong>20 April</strong> - Accepted students announced.</p>
	</li>
    </ul>

    <p>Note that these dates may change, and the Google FAQ timeline is the
      authoritative source of detailed schedule information:</p>

    <ul><p><a href="http://socghop.appspot.com/document/show/program/google/gsoc2009/faqs#timeline">GSoC FAQ: Important Dates</a></p></ul>

    <p>All students must register with, and submit applications via, the
      Google Summer of Code home page:</p>

    <ul><p><a href="http://socghop.appspot.com/program/home/google/gsoc2009">Google Summer of Code Home Page</a></p></ul></li>

  <li><p><strong>What advice do you have for a student who might want to
    submit a proposal?</strong></p>

    <p>Experience suggests that the strongest proposals come from students
      who contact FreeBSD developers and potential mentors well in advance
      of submitting their proposal, seek feedback on their proposal ideas,
      and write proposals that reflect time spent exploring and understanding
      the problem area to be addressed.  Even if the FreeBSD developer(s) you
      contact aren't the eventual mentor of the project, their feedback can
      be invaluable.</p></li>

  <li><p><strong>Can I submit multiple project proposals to the FreeBSD
    Project?</strong></p>

    <p>Yes, but do make sure you invest adequate time in each proposal so
      that we can evaluate them properly.  We will only be able to accept
      one proposal from any given student, so you may do better writing just
      one or two detailed proposals than submitting lots of less detailed
      ones.</p></li>

  <li><p><strong>Will the FreeBSD Project accept more than one student for
    the same idea?</strong></p>

    <p>In general, we will accept only one student for any given proposal
      idea, as most proposal ideas in our ideas list are sized with a single
      student summer project in mind.  This is a good reason to consider
      coming up with your own idea, or at least, making sure that your
      proposal for one of our project list ideas reflects your unique
      contribution and viewpoint.  If you plan to submit multiple proposals,
      you might consider doing one with an idea from the list, and another
      with an original idea.</p></li>

  <li><p><strong>What if my proposal is not selected in the application
    process?  Can I still participate?</strong></p>

    <p>Unfortunately, we always have more good applications than student
      places, but that doesn't mean you can't do the project anyway.  The
      FreeBSD Project always welcomes new volunteers to work on projects, and
      is generally happy to provide mentoring and support for students whose
      proposals could not be selected in order to allow them to work on their
      project anyway.  You will need to work with the FreeBSD Project GSoC
      administrators to identify a possible mento.  However, Google will not
      fund that participation.</p></li>

  <li><p><strong>What projects were completed successfully by students
    in previous summers?</strong></p>

    <p>Please see the <a href="summerofcode-2008.html">2008 FreeBSD
      Summer of Code</a> page, as well as older project pages from <a
      href="summerofcode-2007.html">2007</a>, <a
      href="summerofcode-2006.html">2006</a>, and <a
      href="summerofcode-2005.html">2005</a> for a list of the
      completed projects from previous years.</p></li>

  <li><p><strong>How can I learn more about FreeBSD?</strong></p>

    <p>The <a href="http://www.FreeBSD.org/">FreeBSD Project Home Page</a>
      is the best way to learn more about the project -- from there you can
      reach the FreeBSD Handbook, FreeBSD Developer's Handbook, project
      mailing list archives, regular project status reports, and more.  If
      you have questions about specific project ideas, e-mail the technical
      contacts for those ideas.  If you have general GSoC questions relating
      to FreeBSD, such as if you are unable to reach a project technical
      contact, need help finding documentation, or want to know who might be
      a good person to talk to about your idea, send them to <a
      href="mailto:soc-admins@FreeBSD.org">soc-admins@FreeBSD.org</a>.</p>
      </li>

  <li><p><strong>Is there an IRC channel I can join to talk about proposal
    ideas or get help finding out more?</strong></p>

    <p>Yes, you can join #freebsd-soc on the efnet IRC network to chat with
      FreeBSD developers interested in mentoring student proposals and
      projects, past FreeBSD/GSoC students, and other students applying to
      FreeBSD/GSoC this year.</p></li>

</ul>

<a name="advertise"></a>
<h2>Advertise on Your Campus</h2>

  <p>Please help us advertise Google Summer of Code with FreeBSD at your
    local university or college campus!  You can forward around our e-mail
    announcement to department and club mailing lists, and to department
    secretaries to distribute.  You can also print out and post copies of the
    <a href="2009-freebsd-gsoc.pdf">FreeBSD GSoC 2009 poster</a>.</p>

  <p><a href="2009-freebsd-gsoc.pdf" align="left"> <img
    src="2009-freebsd-gsoc-thumbnail.jpg"
    alt="[FreeBSD GSoC 2009 poster thumnail]" height="248" width="192"
    border="0" /></a></p>

	      </div> <!-- CONTENTWRAP -->
	      <br class="clearboth" />
	    </div> <!-- CONTENT -->

            <div id="FOOTER">
               &copyright;<br />
               &date;
            </div> <!-- FOOTER -->
        </div> <!-- CONTAINER -->
   </div> <!-- CONTAINERWRAP -->

      </body>
</html>
  </xsl:template>
</xsl:stylesheet>
