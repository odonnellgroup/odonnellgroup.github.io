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
<h3>Principal investigator</h3>
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
  <li>2018/19: <a href="https://www.linkedin.com/in/panagiotis-dimitriou-504817144/">Panagiotis Dimitriou</a>, Jiaxuan Yin, Yini Zhang.</li>
  <li>2017/18: <a href="https://www.linkedin.com/in/ivan-chelombiev-5a7790a9/">Ivan Chelombiev</a>, Benjamin Exley, <a href="https://si.usi.ch/research/groups">Nargiz Humbatova</a>, <a href="https://www.linkedin.com/in/adammatheson1/">Adam Matheson</a>, <a href="https://www.linkedin.com/in/greatdevaks/">Anmol Krishnan Sachdeva</a>, Zihao Wang.</li>
  <li>2016/17: <a href="https://www.linkedin.com/in/drew-campbell-29226111a/">Drew Campbell</a>, <a href="https://www.linkedin.com/in/julianferry/">Julian Ferry</a>, Akingbolade Shada, Anqi Wang, Tonia Zhang.</li>
  <li>2015/16: Kai Gillam, Xinyu Wang.</li>
</ul>
<p>Undergraduate project students</p>
<ul>
  <li>2018/19: <a href="https://odonnellgroup.github.io/people/Sydney_Dimmock">Sydney Dimmock</a>, <a href="https://www.linkedin.com/in/william-rollason-55b758145/">Will Rollason</a>, <a href="https://www.linkedin.com/in/rajat-subhra-roy-a61b8b131/">Rajat Subhra Roy</a>, <a href="https://www.linkedin.com/in/stefan-klas-00a0a7183/">Stefan Klas</a>.</li>
  <li>2017/18: <a href="https://www.linkedin.com/in/sam-coward-aa91b2124/">Sam Coward</a>, <a href="https://www.linkedin.com/in/marah-faron-/">Marah Faron</a>, <a href="https://www.linkedin.com/in/daniel-keitley/">Dan Keitley</a>, <a href="https://www.linkedin.com/in/shun-peng-5a653a140/">Sonny Peng</a>.</li>
  <li>2016/17: <a href="https://www.linkedin.com/in/thomascamp333/">Thomas Camp</a>, <a href="https://www.linkedin.com/in/eleftherios-christodoulou-b58287a6/">Eleftherios Christodolou</a>, <a href="https://www.linkedin.com/in/robert-eyre/">Robert Eyre</a>, Mami Takechi.</li>
  <li>2015/16: Kai Gillam, Xinyu Wang.</li>
  <li>2015/16: <a href="https://www.linkedin.com/in/matthewfoer/">Matthew Foer</a>.</li>
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
