# Simple time format rack app
On request, GET <b> /time </b>
with the query string parameter format
will return the time in the specified format

<p> For example, the GET request <b> /time?format=year%2Cmonth%2Cday </b>
will return a response with the type text / plain and body 1970-01-01.
</p>

<ul>
<li> Available time formats: year, month, day, hour, minute, second </li>
<li> Formats are passed in the query string parameter of format in any order </li>
<li> If there is an unknown format among the time formats, you must return a response with a status code of 400 and the body "Unknown time format [epoch]" </li>
<li> If there are several unknown formats, they must all be listed in the response body, for example: "Unknown time format [epoch, age]" </li>
<li> When requesting any other URL, you must return a response with a status code of 404 </li>
</ul>

Installation<br/>
<b>
bundle install
<br/>
rackup
</b>