<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%

String query = request.getAttribute("javax.servlet.error.request_uri").toString().replace("/StixMaster", "").replace("/StixWeb", "");
String[] req = query.split("/");
//System.out.println(query);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PHP Documentation | Stix</title>
<link rel="Shortcut Icon" href="/StixMaster/img/logo.png" >
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/StixMaster/styles/main.css">
<link rel="stylesheet" href="../main.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>

<nav class="navbar navbar-fly" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">St&parax</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Github
        <span class="caret"></span></a>
         <ul class="dropdown-menu" role="menu">
            <li><a href="https://github.com/cheikhshift/ZenServer">ZenServer</a></li>
            <li><a href="https://github.com/cheikhshift/StixServer">Embedded Server</a></li>
            <li><a href="https://github.com/cheikhshift/stixclient">API Client</a></li>
              <li><a href="https://github.com/cheikhshift/Havokjs">Havok.js</a></li>
          </ul>
        </li>
        
         <li class="dropdown"><a href="../php">PHP Documentation</a>
        </li>
        <li><a href="../tutorials">Tutorials</a></li>
      </ul>
    
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"> Signin </a></li>
         <li><a href="#"> Signup </a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="pretext-node-animate white-box">
<div class="container">
<%
if(req[2].equals("starting")){
	%>
	<div class="page-header">
	<h2> Getting started </h2>
	</div>
	<div class="row">
	<div class="col-md-3">
	<ul class="nav nav-stacked fixeds">
	<li><a href="#setting-up-the-stix-server"><b>1.</b> Setting up Server </a></li>
	<li><a href="#booting-up-a-virtual-server"><b>2.</b> Setting up Virtual Server </a></li>
	<li><a href="#setting-up-an-application"><b>3.</b> Setting up application </a></li>
	<li><a href="#setting-up-a-context"><b>4.</b> Setting up context </a></li>
	<li><a href="#testing-the-page"><b><span class="glyphicon glyphicon-ok"></span></b> Testing page </a></li>
	</ul>
	</div>
	<div class="col-md-9">
	<div id="setupserver">
	<h1 id="setting-up-the-stix-server">Setting up the Stix Server</h1>

<p>Requirements for this tutorial</p>

<ol>
<li>Local MongoDb Server</li>
<li>Embedded Tomcat Libraries</li>
<li>Server Java sources ( <code>https://github.com/cheikhshift/StixServer</code>)</li>
</ol>

<p>Afterwards launch the application from the class <code>com.stix.server.InitClass</code> <br>
You will be prompted for a default MongoDb as well as port number. <br>
We recommend you use Stix as the database name and port 80 as defaults.</p>

<p>The server runs from a command line based interface, Once it’s booted up your command line output should be as follows</p>

<pre><code>Which MongoDB should be used for VM tracking
stix
Which port?
80
TimerTask started (memory logger)
Tomcat is Up on port 80
Jul 21, 2014 2:13:42 AM org.apache.coyote.AbstractProtocol init
INFO: Initializing ProtocolHandler ["http-bio-80"]
Jul 21, 2014 2:13:42 AM org.apache.catalina.core.StandardService startInternal
INFO: Starting service Tomcat
Jul 21, 2014 2:13:42 AM org.apache.catalina.core.StandardEngine startInternal
INFO: Starting Servlet Engine: Apache Tomcat/7.0.16
Jul 21, 2014 2:13:43 AM org.apache.coyote.AbstractProtocol start
INFO: Starting ProtocolHandler ["http-bio-80"]
</code></pre>

<p>You should now go to your browser and type 127.0.0.1 and if you see a 404 page your server has successfully powered up.</p>

<h1 id="booting-up-a-virtual-server">Booting up a Virtual Server</h1>

<p>On Stix a virtual server enables the user to run different server hosts on the same port with different applications running side by side. It allows the user to run multiple websites and applications alongside each other. </p>

<p>Before proceeding please make sure that you’ve downloaded the Stix command line client from here <code>https://github.com/cheikhshift/Stixclient</code>.</p>

<p>From the command line type in the command <code>vm/create</code>. You will be prompted for a nickname, ram size, max space size and host name. The ram and space size are used as benchmarks for the system to better increase the embedded server’s awareness of the resources that it has available to it. The host name is how the server is referred to via DNS. for example if sample.org was set a hostname the server would show a 404 page for a request to <code>127.0.0.1</code>. In this example we will set the host name to 127.0.0.1, nevertheless you can alter your DNS settings to setup custom hostnames.</p>

<pre><code>vm/create
# What should be this Virtual Machine's nickname?
sample
# Ram size (in MB)?
64
# space size (in MB)?
64
# What is this server's hostname
127.0.0.1
</code></pre>

<p>Afterwards to activate this virtual machine use the command <code>vm/on/(VMID or nickname)</code>. In this example we will replace <code>(VMID or nickname)</code> with <code>sample</code>. The output should be as follows :</p>

<pre><code>vm/on/sample
# saving server credentials to master database
# Filebase set and host name mapped to master database.
# Server available at host : 127.0.0.1
# API Ready
</code></pre>

<p>And since no context has been binded yet, the previous 404 page is now a 401 page.</p>

<p>You now have a virtual machine running with hostname <code>127.0.0.1</code></p>	
	
	</div>
	<!-- New app -->
	<div id="setupapp">
	<h1 id="setting-up-an-application">Setting up an application</h1>

<p>An application on Stix is a set of web compatible files as well as Java and PHP sources for backend server tasks. The difference between an average FTP configuration with Apache is that the application sources need to be saved onto gridfs for Stix server to be able to locate it. This new method of serving web data brings new level of cache and request management that MongoDB delivers.</p><div class="se-section-delimiter"></div>

<h3 id="requirements">Requirements</h3>

<ol>
<li>Running Stix server (<code>https://github.com/cheikhshift/StixServer</code>)</li>
<li>Local MongoDb</li>
<li>Stix API Client (<code>https://github.com/cheikhshift/Stixclient</code>)</li>
<li>Text Editor</li>
</ol><div class="se-section-delimiter"></div>

<h3 id="step-1">Step 1</h3><div class="se-section-delimiter"></div>

<h4 id="create-application-from-api-cmd">Create application from API cmd</h4>

<p>All client responses are denoted with ‘#’  <br>
In the code block below, app/create is used to create a new application. You will be then prompted for a nickname.</p>

<pre><code>app/create
# What should be this Application's nickname?
app1
# Application 'app1' added with ID 53ccb26a361e6879b3d631cb

# API Ready
</code></pre>

<h3 id="step-2">Step 2</h3>

<h4 id="creating-source-folder">Creating source folder</h4>

<p>After your app has been created, let’s say you made a directory at <code>c:\stix\app1\</code> <br>
We will then make a file called core.php which will send an email to dummy@gmail.com <br>
In the example below we imported a Java class to handle our email to showcase how using Java can add a new level of freedom to PHP.</p>

<pre><code>&lt;?php
import com.stix.mailer.coreMailer;
$mailman = new coreMailer();
    $mailman-&gt;sendMail("dummy@dummy.com","dummy@gmail.com", "Sup", "Who dat");
?&gt;
&lt;h4&gt;Hello&lt;/h4&gt;
</code></pre>

<p>A few other files have been added to show how files are represented and accessed through Stix server.</p>

<h3 id="step-3">Step 3</h3>

<h4 id="saving-the-files-to-gridfs">Saving the files to GridFS</h4>

<p>Use the <code>app/commit/(APPID or nickname)</code> call to save your files into gridFS. In the example, <code>(APPID or nickname)</code> would be replaced by  <code>app1</code>. Once inputed you will be prompted for the application’s root, in the example the response would be <code>c:\stix\app1\</code>. <br>
<em>* Please make sure you don’t forget the last / or \ of your application root path *</em></p>

<hr>

<p>After the import, you can review the files by calling <code>app/files/(APPID or nickname)</code>. If the import worked you should see your files listed. In this example the response from the client was :</p>

<pre><code>app/files/app1
# Files for application 'app1'
# Filename : index.php Path:[index.php] GridFS ID :53cc62d2361e6879b3d631bb
# Filename : sample.html Path:[sample.html] GridFS ID :53cc62d2361e6879b3d631be
# Filename : core.php Path:[core.php] GridFS ID :53cc62d2361e6879b3d631c1
# Filename : alerter.php Path:[alerter.php] GridFS ID :53cc62d2361e6879b3d631c4
# Filename : map.json Path:[map.json] GridFS ID :53cc62d2361e6879b3d631c7
# API Ready
</code></pre>

<p>These files are now accessible to the server, please setup a context to make it accessible to the public.</p>	
	</div>
	
	<div id="setupcont">
	
	<h1 id="setting-up-a-context">Setting up a context</h1><div class="se-section-delimiter"></div>

<h3 id="checklist">Checklist</h3>

<p>Before attempting to setup a context, please make sure the tasks listed below were performed.</p>

<ol>
<li>Booted up the Stix Server</li>
<li>Setup a virtual server</li>
<li>Setup an application</li>
<li>Commit files into application</li>
</ol>

<p>To start simply type on the Stix APi cmd <code>app/bind/(APPid or nickname)</code>, in this case we will replace <code>(APPid or nickname)</code> with <code>app1</code> with the previous examples taken into consideration. <br>
You will be then prompted to choose which virtual server to bind it to. In our example we chose vm1 by typing 0 as a response. </p>

<p>Afterwards you will be asked which context do you want this application to be at. To make it the root application simply type <code>/</code> then press enter to apply. Your output should be similar to this</p>

<pre><code>app/bind/app1
# Please type in the integer between the brackets to select a server.
# [0] sample with ID : 53cb3070361e12f6f729a293
# [1] vm1 with ID : 53cc5cee361e6879b3d631b9
# Which server?
0
# Context path of application, use '/' for root.
/

API Ready
</code></pre>

<hr>

<p>Your context should now be working.</p>

<h2 id="testing-the-page">Testing the page</h2>

<p>Try <code>127.0.0.1</code> and your index.php of your project should execute. <br>
Following the PHP code snipped used above your browser output should be as follows</p>

<pre><code>Hello
</code></pre>
	</div>
		
	
	
	
	
	</div>
	
	</div>
	<%}
else if (req[2].equals("advance")) {
	
	%>
<div class="page-header">
	<h2> Performing advance tasks</h2>
	</div>
	<div class="row">
	<div class="col-md-3">
	<ul class="nav nav-stacked fixeds">
		<li><a href="#including-php-scripts">	Including PHP scripts </a></li>
		<li><a href="#timertasks"> TimerTasks </a></li>
		<li><a href="#post-get-from-server">	Post &amp Get (From server) </a></li>
		<li><a href="#post-get-parameters-from-client">	Post &amp Get (From client) </a></li>
		<li><a href="#sending-an-e-mail"> Sending email </a></li>
		<li><a href="#stix-server-running-scripts-on-trusted-servers"> StixServer </a></li>
		<li><a href="#accessing-your-local-mongo-database"> Mongo database </a></li>
		<li><a href="#session-management">Session management </a></li>
	</ul>
	</div>
	<div class="col-md-9">
	
	<h3 id="requirements">Requirements</h3>

<ol>
<li>Basic understanding of the Stix API cmd. (Please see Getting Started section of tutorials)</li>
<li>Running Stix Server</li>
<li>Running Stix Stix API cmd</li>
</ol><div class="se-section-delimiter"></div>

<h1 id="including-php-scripts">Including PHP scripts</h1>

<p>Since MongoDB is used to store the files that Stix server is executing the page include mechanism is performed a bit differently. <br>
The syntax for page inclusion is as follows :</p>

<pre><code>/filetoinclude;
/otherfiletoinclude;
/somefiletoinclude;
@endInclude
&lt;html&gt;
&lt;?php echo 200; ?&gt;
&lt;/html&gt;
</code></pre>

<p>The Include will only work if it is the very first part of your script, even before the <code>&lt;html&gt;</code> portion of your page.</p>

<p>Pages that are included that have included files will be loaded as well. Please remember to start with <code>/</code> to indicate the root of the application. relative paths will not work.</p>

<hr>

<h1 id="timertasks">Timertasks</h1>

<p>A timertask in Java is a job that is repeated at an interval by  Java’s timer class.</p>

<p>That repetitive nature at which Java’s timer class can perform tasks at an interval can be used by PHP to dynamically setup pseudo cron tabs on behalf of the php script to enhance you application’s user experience.</p>

<p>Before creating a timertask in php please make sure that you’ve downloaded the appropriate libraries from <a href="https://github.com/cheikhshift/ZenServer">here</a> and add them into your Stix Server JAVA path. You will need the TimerThread class from ZenServer.</p>

<p>In the code snipped below, we initialize the TimerThread class below and schedule a task to be executed every 15 minutes (every 900000 milliseconds). We will have it repeat itself 5 times and then delete itself.</p>

<pre><code>&lt;?php

import java.util.Timer;
import java.util.TimerTask;
import com.stix.launcher.TimerThread;
import java.util.concurrent.Callable;

    // parameters are as follows TimerThread ("appid","account id (me/)", "local path with \\", "request uri to be passed to script")
    $timer = new TimerThread("53cb33d0361e5e557b01f69a" ,"53cb21e3361e70ba8ad27018","core.php","/hmm/foo");
        $timer-&gt;repeat = 5; // Repeat it 5 times
    $timertest = new Timer();
        //Schedule timer every 9 seconds. Units in milliseconds.
        $timertest-&gt;scheduleAtFixedRate($timer, 0, 9000);


    ?&gt;
</code></pre>

<p>Afterwards save the php file and save it into your application by typing <code>app/commit/(APPId or nickname)</code>, remember to replace <code>(APPId or nickname)</code> with the correct application ID or nickname. Then run the script below by navigating to the script from your browser. In our application we’re using coreMailer which by default logs each email being sent to the programs default console. The output from the server console is as follows :</p>

<pre><code>Working on 53cb21e3361e70ba8ad27018/53cb33d0361e5e557b01f69a/core.php/hmm/foo
Email sent to dummy@gmail.com from dummy@dummy.com
Working on 53cb21e3361e70ba8ad27018/53cb33d0361e5e557b01f69a/core.php/hmm/foo
Email sent to dummy@gmail.com from dummy@dummy.com
Working on 53cb21e3361e70ba8ad27018/53cb33d0361e5e557b01f69a/core.php/hmm/foo
Email sent to dummy@gmail.com from dummy@dummy.com
Working on 53cb21e3361e70ba8ad27018/53cb33d0361e5e557b01f69a/core.php/hmm/foo
Email sent to dummy@gmail.com from dummy@dummy.com
Working on 53cb21e3361e70ba8ad27018/53cb33d0361e5e557b01f69a/core.php/hmm/foo
Email sent to dummy@gmail.com from dummy@dummy.com
Working on 53cb21e3361e70ba8ad27018/53cb33d0361e5e557b01f69a/core.php/hmm/foo
Email sent to dummy@gmail.com from dummy@dummy.com
</code></pre>

<p>By using Timerthreads you can setup cron-like php tasks directly within your php scripts.</p>

<hr><div class="se-section-delimiter"></div>

<h1 id="post-get-from-server">Post &amp; Get from Server</h1>

<p>Performing web requests from your server can be useful for working with APIs online. <br>
To start we will create a page and import Stix’s httpManager class based on David Webb’s Java URL request executor.</p>

<p>The PHP of the snippet below performs a request  to <code>http://localhost:8080/StixMaster/get/verify/</code>. <br>
We will submit a fake API key and the server should response with an Invalid API Key response. </p>

<pre><code>&lt;?php
 import com.stix.server.httpManager;
 $web = new httpManager();
     $web-&gt;url = "http://localhost:8080/StixMaster/get/verify/";
 $web-&gt;post-&gt;put("test", "hmm");
     $web-&gt;post-&gt;put("somevariable", "and another");
 $web-&gt;post-&gt;put("apikey", "yo");
     $web-&gt;post-&gt;put("apimode", "ensure");
 print_r($web-&gt;executeUrl());
?&gt;
</code></pre>

<p>If there is an issue with the url you are requesting the page will crash and return an empty page.</p>

<p>To setup a GET request to PHP script would appear as follows</p>

<pre><code> &lt;?php
     import com.stix.server.httpManager;
     $web = new httpManager();
         $web-&gt;url = "http://localhost:8080/StixMaster/get/verify/";
     $web-&gt;GET = true;
         $web-&gt;get-&gt;put("test", "hmm");
     $web-&gt;get-&gt;put("somevariable", "and another");
         $web-&gt;get-&gt;put("apikey", "yo");
     $web-&gt;get-&gt;put("apimode", "ensure");
         print_r($web-&gt;executeUrl());
    ?&gt;
</code></pre>

<h1 id="post-get-parameters-from-client">Post &amp; Get Parameters from client</h1>

<p>In the example below we will travel to the following url</p>

<pre><code>http://127.0.0.1/clientpost.php?then=%20f
</code></pre>

<p>The PHP script’s source is as follows : </p>

<pre><code>&lt;?php
echo $request-&gt;get("then");
?&gt;
</code></pre>

<p>The output from the server should be :</p>

<pre><code>f
</code></pre>

<p>By default you can access both POST and GET parameters from the <code>$request</code> object. You can also retrieve the request as an array by accessing the basicDBObject <code>$request-&gt;reque</code>.  <br>
Feel free to adjust the coreServlet class to better suit your needs.</p>

<hr><div class="se-section-delimiter"></div>

<h1 id="sending-an-e-mail">Sending an E-mail</h1>

<p>The default mail php option is available, however there is another Java based mail class that build called coreMailer.</p>

<p>In the example below we imported the class <code>import com.stix.mailer.coreMailer;</code> and initialized it as the variable $mailman. To send the E-mail with HTML we called on the <code>sendMail</code> method. The method variables are commented above it to state their intended use. If the email was sent you should see a log report from your server’s default console as coreMailer by default logs everything.</p>

<pre><code>&lt;?php

import com.stix.mailer.coreMailer;

$mailman = new coreMailer();
    // sendMail(From, target, subject, body);
    $mailman-&gt;sendMail("dummy@dummy.com","dummy@gmail.com", "Sup", "Who dat");


?&gt;
&lt;h4&gt;Mail Sent&lt;/h4&gt;
</code></pre>

<hr>

<h1 id="stix-server-running-scripts-on-trusted-servers">Stix Server Running scripts on trusted servers</h1>

<p>Running scripts on another server lets the server conserve resources and focus on another task. You can run any PHP script that is in your MongoDB’s gridFS. The code snipped below shows the execution of a script named out.php. Please remember to use the application’s MongoDB generated ID. </p>

<p>Stix Server by default comes with an active clustorHost at port 4444. You can edit the port it occupies by simply editing the server’s source files. The method work is called to run a php Script. <code>$appPath</code> is a PHP global set by the server to denote the application path of the script being executed. </p>

<p>The stop method will close the connection between the server and the script.</p>

<pre><code>&lt;?php

import com.stix.server.clusterClient;
// new clusterClient(serverName, port);
$cluster = new clusterClient("127.0.0.1", 4444);
    $cluster-&gt;work($appPath."out.php");
    //$cluster-&gt;stop(); 

?&gt;
</code></pre>

<p>Please remember to give the server executing the script permission into the target server’s workgroup. use the %allow-/(IP) to give a computer permissionm, and %revoke-/(IP) to remove a computer.If the computer attempting to access the server does not have permission it will be rejected and noted in the log. </p>

<hr><div class="se-section-delimiter"></div>

<h1 id="accessing-your-local-mongo-database">Accessing your Local Mongo Database</h1>

<p>In an average PHP configuration to use MongoDB you would need to download, compile and add an additional driver to your PHP ini.</p>

<p>To Access MongoDB on Stix server you would need to import the Java class <code>import databaseHelper.Valve;</code> as well as Mongo’s BasicDBObject to be able to create new MongoDB objects. Valve by default connects to your mongodb through the default localhost configuration. Initialize a new Valve connection with a database name as a parameter. </p>

<p>The example below initializes the class, creates a new BasicDBObject (Mongo document) and saves it to the table named targettable. The method called here is called syncDB which just adds a row to a collection. You can access the Java based Mongo connection with the public variable <code>connection</code> for any further experimentation. Also feel free to view and edit the source code on our Github repo.</p>

<pre><code>&lt;?php
import databaseHelper.Valve;
import com.mongodb.BasicDBObject;

    $valve = new Valve("dbname");

    $alert = new BasicDBObject("title", "Sample");
    	$alert-&gt;append("text","Hello World");
    $alert-&gt;append("level","alert alert-warning");
    	$alert-&gt;append("type","app");
    $alert-&gt;append("ref","53c3423a361eef5bf9600690");
    	$Valve-&gt;syncDB("targettable", $alert);
?&gt;
</code></pre>

<p><em>Also don’t forget to close your Valve connection after your script has finished executing to better save resources.</em></p>

<pre><code>&lt;?php
    $Valve-&gt;connection-&gt;close();
?&gt;
</code></pre>

<hr>

<h1 id="session-management">Session Management</h1>

<p>Tomcat’s default HttpSession powers Stix session handling. While using PHP call on the session object as if you were using it on a jsp page. The PHP code snippet below shows an example of a variable being set and then later printed on the screen.</p>

<pre><code>&lt;?php
//Set attribute with Key 'test'
$session-&gt;setAttribute("test", "g");
    echo $session-&gt;getAttribute("test");
?&gt;
</code></pre>
	
	</div>
	</div>
	
	<%
}
%>

</div>
</div>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="/StixMaster/havokjs/init.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>

$(document).ready(function(){
$(".pretext-node-animate").css('min-height', '700px');
$("div").removeClass('pretext-node-animate');
});
</script>
</body>
</html>