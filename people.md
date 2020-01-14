---
title: People
permalink: /people/
---

{% assign people_sorted = site.people | sort: "joined" %}
{% assign people_array = "pi|postdoc|gradstudent|masters|undergrads|alumni" | split: "|" %}


<!--
{% assign people_sorted = site.people | sort: "joined" %}
<ul>
{% for y in yearsSorted %}
  <li>{{ y.name }}
    <ul>
      {% assign yearTitlesSorted = y.items | sort: "title" %}
      {% for t in yearTitlesSorted %}
      <li>{{ t.title }}</li>
      {% endfor %}
    </ul>
  </li>
{% endfor %}
</ul>-->

{% for item in people_array %}

<div class="pos_header">
{% if item == 'postdoc' %}
<h3>Postdoctoral research associates</h3>
 {% elsif item == 'pi' %}
<h3>Group leader</h3>
 {% elsif item == 'gradstudent' %}
<h3>PhD students</h3>
{% elsif item == 'undergrads' %}
<h3>Undergraduates</h3>
 {% elsif item == 'masters' %}
<h3>MSc students</h3>
{% elsif item == 'alumni' %}
<h3>Former members</h3>
<p>MSc students</p>
<ul>
  <li>2018/19: Panagiotis Dimitriou, Jiaxuan Yin, Yini Zhang.</li>
  <li>2017/18: Ivan Chelombiev, Benjamin Exley, Nargiz Humbatova, Adam Matheson, Anmol Krishnan Sachdeva, Zihao Wang.</li>
  <li>2016/17: Andrew Campbell, Julian Ferry, Akingbolade Shada, Anqi Wang, Tonia Zhang.</li>
  <li>2015/16: Kai Gillam, Xinyu Wang.</li>
</ul>
<p>Undergraduate project students</p>
<ul>
  <li>2018/19: Sydney Dimmock, Will Rollason, Rajat Subhra Roy, Stefan Klas.</li>
  <li>2017/18: Sam Coward, Marah Faron, Dan Keitley, Sonny Peng.</li>
  <li>2016/17: Thomas Camp, Eleftherios Christodolou, Robert Eyre, Mami Takechi.</li>
  <li>2015/16: Kai Gillam, Xinyu Wang.</li>
  <li>2015/16: Matthew Foer.</li>
</ul>
{% endif %}
</div>

<div class="content list people">
  {% for profile in people_sorted %}
    {% if profile.position contains item %}
    <div class="list-item-people">
      <p class="list-post-title">
        {% if profile.website %}
          {% assign url_tmp = profile.website %}
        {% else %}
          {% assign url_tmp = site.baseurl | append: profile.url %}
        {% endif %}
        {% if profile.avatar %}
        <a href="{{url_tmp}}"><img width="200" height="250" src="{{site.baseurl}}/images/people/{{profile.avatar}}"></a>
        {% else %}
        <a href=""><img width="200" height="230" src="http://evansheline.com/wp-content/uploads/2011/02/facebook-Storm-Trooper.jpg"></a>
        {% endif %}
        <a class="name" href="{{url_tmp}}">{{ profile.name }}</a>
        {% if profile.affiliation %}
          <br><small><span style="color:#9d9d9d">{{ profile.affiliation }}</span></small>
        {% else %}
          <br><small><span style="color:#FFFFFF">.</span></small>
        {% endif %}
      </p>
    </div>
    {% endif %}
  {% endfor %}
</div>
<hr>
{% endfor %}

{% include footer.html %}
