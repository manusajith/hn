# Hacker News API

## Minimum Requirements and dependencies

Elixir version: 1.13.1 or above

## Setup

### Setup using nix

Install [nix](https://nixos.org/guides/install-nix.html)

Enter nix-shell, which will install all the dependencies, and will provide a shell with all the shims setup.

```
nix-shell
```

#### Installing dependencies

```
mix deps.get
```

#### Environment variables.

`.env.sample` contains all the required env variables for running the application. Copy `.env.sample` to `.env`

```
cp .env.sample .env
```
## Running the application

```
iex -S mix
```

## API endpoints

### Root url
```bash
http localhost:4000

HTTP/1.1 200 OK
cache-control: max-age=0, private, must-revalidate
content-length: 6
date: Thu, 06 Oct 2022 06:04:59 GMT
server: Cowboy

HN API
```

### Listing all stories

```bash
http localhost:4000/stories
HTTP/1.1 200 OK
content-length: 3802
content-type: application/json
date: Thu, 06 Oct 2022 06:05:31 GMT
server: Cowboy

[
    {
        "by": "thunderbong",
        "id": 33016217,
        "text": null,
        "title": "RootMyTV is a user-friendly exploit for rooting/jailbreaking LG webOS smart TVs",
        "url": "https://github.com/RootMyTV/RootMyTV.github.io"
    },
    {
        "by": "going_ham",
        "id": 33025446,
        "text": null,
        "title": "DreamFusion: Text-to-3D using 2D Diffusion",
        "url": "https://dreamfusion3d.github.io"
    },
    {
        "by": "ducktective",
        "id": 33033017,
        "text": null,
        "title": "Get things done with Emacs",
        "url": "https://www.labri.fr/perso/nrougier/GTD/index.html"
    },
    {
        "by": "kiyanwang",
        "id": 33034351,
        "text": null,
        "title": "Select * from cloud",
        "url": "https://steampipe.io/"
    },
    {
        "by": "curiousfab",
        "id": 33034631,
        "text": null,
        "title": "OpenStreepMap 2012 vs. 2022",
        "url": "https://2012.osmz.ru/#15/40.7822/-73.9685"
    },
    {
        "by": "leeoniya",
        "id": 33035580,
        "text": "Hello HN!<p>I became frustrated with the unpredictible&#x2F;poor match quality and opaqueness of &quot;relevance scores&quot; in existing fuzzy and fulltext search libs, so I tried something different and this is the result. The main selling point is the result quality &#x2F; ordering, with best-in-class memory overhead and excellent performance being bonuses. The API is pretty stable at this point, but looking for feedback before committing to 1.0.<p>TL;DR<p>The test corpus is a 4MB json file with 162k words&#x2F;phrases, so give it a second for initial download. You can also drag&#x2F;drop your own text&#x2F;json corpus into the UI to try it against your own dataset.<p>Live demo&#x2F;compare with a few other libs (there are many more in the codebase, in various states of completion, WIP):<p><a href=\"https:&#x2F;&#x2F;leeoniya.github.io&#x2F;uFuzzy&#x2F;demos&#x2F;compare.html?libs=uFuzzy,fuzzysort,QuickScore,Fuse&amp;search=super%20ma\" rel=\"nofollow\">https:&#x2F;&#x2F;leeoniya.github.io&#x2F;uFuzzy&#x2F;demos&#x2F;compare.html?libs=uF...</a><p>In isolation for perf assessment:<p><a href=\"https:&#x2F;&#x2F;leeoniya.github.io&#x2F;uFuzzy&#x2F;demos&#x2F;compare.html?libs=uFuzzy&amp;search=super%20ma\" rel=\"nofollow\">https:&#x2F;&#x2F;leeoniya.github.io&#x2F;uFuzzy&#x2F;demos&#x2F;compare.html?libs=uF...</a><p>To increase fuzziness and get broader results, try setting intraMax=1 (core) and enable outOfOrder (userland):<p><a href=\"https:&#x2F;&#x2F;leeoniya.github.io&#x2F;uFuzzy&#x2F;demos&#x2F;compare.html?libs=uFuzzy&amp;outOfOrder&amp;intraMax=1&amp;search=super%20ma\" rel=\"nofollow\">https:&#x2F;&#x2F;leeoniya.github.io&#x2F;uFuzzy&#x2F;demos&#x2F;compare.html?libs=uF...</a><p>Also play with the sortPreset selector to swap out the default Array.sort() for one in userland that prioritizes typehead-ness (the resultset remains identical).<p>Still TODO:<p><pre><code>  - Example of stripping diacritics\n  - Example of using non-latin charsets\n  - Example of prefix-caching to improve typeahead perf even further\n  - Example of poor man&#x27;s document search (matching multiple object properties)\n</code></pre>\nThat&#x27;s all, thanks!",
        "title": "Show HN: uFuzzy.js – A tiny, efficient fuzzy search that doesn't suck",
        "url": "https://github.com/leeoniya/uFuzzy"
    },
    {
        "by": "elashri",
        "id": 33037171,
        "text": null,
        "title": "Microsoft bakes a VPN into Edge and turns it on",
        "url": "https://adguard-vpn.com/en/blog/vpn-built-browser-microsoft.html"
    },
    {
        "by": "mooreds",
        "id": 33037463,
        "text": null,
        "title": "Great Works in Programming Languages (2004)",
        "url": "https://www.cis.upenn.edu/%7Ebcpierce/courses/670Fall04/GreatWorksInPL.shtml"
    },
    {
        "by": "homarp",
        "id": 33037975,
        "text": null,
        "title": "Junior Designers vs. Senior Designers",
        "url": "https://vanschneider.com/blog/young-designers/junior-designers-vs-senior-designers/"
    },
    {
        "by": "rntn",
        "id": 33038015,
        "text": null,
        "title": "Limits of Language-Thought Influences and the Constraints of Embodiment (2021)",
        "url": "https://www.frontiersin.org/articles/10.3389/fpsyg.2021.593137/full"
    }
]
```

### Listing stories with pagination

```bash
http localhost:4000/stories?page=4
HTTP/1.1 200 OK
content-length: 1631
content-type: application/json
date: Thu, 06 Oct 2022 06:05:56 GMT
server: Cowboy

[
    {
        "by": "gjvc",
        "id": 33044885,
        "text": null,
        "title": "Seer – a GUI front end to GDB for Linux",
        "url": "https://github.com/epasveer/seer"
    },
    {
        "by": "Tomte",
        "id": 33044913,
        "text": null,
        "title": "DVD drives turned into microscopes",
        "url": "https://hackaday.com/2022/10/01/dvd-drives-turned-into-microscopes/"
    },
    {
        "by": "rcarmo",
        "id": 33045219,
        "text": null,
        "title": "The 'Egg' Laptop",
        "url": "https://www.ikejima.org/projects/2022091-egg-laptop.html"
    },
    {
        "by": "Kaibeezy",
        "id": 33045371,
        "text": null,
        "title": "The lost art of handheld demakes",
        "url": "https://wireframe.raspberrypi.com/articles/the-lost-art-of-handheld-demakes"
    },
    {
        "by": "marban",
        "id": 33045372,
        "text": null,
        "title": "Companies are paying huge sums to show their ads to bots",
        "url": "https://www.wired.com/story/bots-online-advertising/"
    },
    {
        "by": "cinquemb",
        "id": 33045530,
        "text": null,
        "title": "Values Are Facts",
        "url": "https://www.overcomingbias.com/2022/09/values-are-facts.html"
    },
    {
        "by": "imartin2k",
        "id": 33045539,
        "text": null,
        "title": "Impoverished Emotional Lives",
        "url": "https://theconvivialsociety.substack.com/p/impoverished-emotional-lives"
    },
    {
        "by": "jlpcsl",
        "id": 33045763,
        "text": null,
        "title": "Enhanced noise suppression in Jitsi Meet",
        "url": "https://jitsi.org/blog/enhanced-noise-suppression-in-jitsi-meet/"
    },
    {
        "by": "helsinkiandrew",
        "id": 33045872,
        "text": null,
        "title": "How to turn waste polyethylene into something useful",
        "url": "https://www.economist.com/science-and-technology/2022/09/29/how-to-turn-waste-polyethylene-into-something-useful"
    },
    {
        "by": "rcarmo",
        "id": 33045956,
        "text": null,
        "title": "The Eleventh Commandment (2004)",
        "url": "https://taoofmac.com/space/blog/2004/04/24#the-ten-commandments"
    }
]
```



## Websocket

```bash
websocat ws://localhost:4000/websocket
{"stories":"[{\"by\":\"thunderbong\",\"id\":33016217,\"text\":null,\"title\":\"RootMyTV is a user-friendly exploit for rooting/jailbreaking LG webOS smart TVs\",\"url\":\"https://github.com/RootMyTV/RootMyTV.github.io\"},{\"by\":\"going_ham\",\"id\":33025446,\"text\":null,\"title\":\"DreamFusion: Text-to-3D using 2D Diffusion\",\"url\":\"https://dreamfusion3d.github.io\"},{\"by\":\"ducktective\",\"id\":33033017,\"text\":null,\"title\":\"Get things done with Emacs\",\"url\":\"https://www.labri.fr/perso/nrougier/GTD/index.html\"},{\"by\":\"kiyanwang\",\"id\":33034351,\"text\":null,\"title\":\"Select * from cloud\",\"url\":\"https://steampipe.io/\"},{\"by\":\"curiousfab\",\"id\":33034631,\"text\":null,\"title\":\"OpenStreepMap 2012 vs. 2022\",\"url\":\"https://2012.osmz.ru/#15/40.7822/-73.9685\"},{\"by\":\"leeoniya\",\"id\":33035580,\"text\":\"Hello HN!<p>I became frustrated with the unpredictible&#x2F;poor match quality and opaqueness of &quot;relevance scores&quot; in existing fuzzy and fulltext search libs, so I tried something different and this is the result. The main selling point is the result quality &#x2F; ordering, with best-in-class memory overhead and excellent performance being bonuses. The API is pretty stable at this point, but looking for feedback before committing to 1.0.<p>TL;DR<p>The test corpus is a 4MB json file with 162k words&#x2F;phrases, so give it a second for initial download. You can also drag&#x2F;drop your own text&#x2F;json corpus into the UI to try it against your own dataset.<p>Live demo&#x2F;compare with a few other libs (there are many more in the codebase, in various states of completion, WIP):<p><a href=\\\"https:&#x2F;&#x2F;leeoniya.github.io&#x2F;uFuzzy&#x2F;demos&#x2F;compare.html?libs=uFuzzy,fuzzysort,QuickScore,Fuse&amp;search=super%20ma\\\" rel=\\\"nofollow\\\">https:&#x2F;&#x2F;leeoniya.github.io&#x2F;uFuzzy&#x2F;demos&#x2F;compare.html?libs=uF...</a><p>In isolation for perf assessment:<p><a href=\\\"https:&#x2F;&#x2F;leeoniya.github.io&#x2F;uFuzzy&#x2F;demos&#x2F;compare.html?libs=uFuzzy&amp;search=super%20ma\\\" rel=\\\"nofollow\\\">https:&#x2F;&#x2F;leeoniya.github.io&#x2F;uFuzzy&#x2F;demos&#x2F;compare.html?libs=uF...</a><p>To increase fuzziness and get broader results, try setting intraMax=1 (core) and enable outOfOrder (userland):<p><a href=\\\"https:&#x2F;&#x2F;leeoniya.github.io&#x2F;uFuzzy&#x2F;demos&#x2F;compare.html?libs=uFuzzy&amp;outOfOrder&amp;intraMax=1&amp;search=super%20ma\\\" rel=\\\"nofollow\\\">https:&#x2F;&#x2F;leeoniya.github.io&#x2F;uFuzzy&#x2F;demos&#x2F;compare.html?libs=uF...</a><p>Also play with the sortPreset selector to swap out the default Array.sort() for one in userland that prioritizes typehead-ness (the resultset remains identical).<p>Still TODO:<p><pre><code>  - Example of stripping diacritics\\n  - Example of using non-latin charsets\\n  - Example of prefix-caching to improve typeahead perf even further\\n  - Example of poor man&#x27;s document search (matching multiple object properties)\\n</code></pre>\\nThat&#x27;s all, thanks!\",\"title\":\"Show HN: uFuzzy.js – A tiny, efficient fuzzy search that doesn't suck\",\"url\":\"https://github.com/leeoniya/uFuzzy\"},{\"by\":\"elashri\",\"id\":33037171,\"text\":null,\"title\":\"Microsoft bakes a VPN into Edge and turns it on\",\"url\":\"https://adguard-vpn.com/en/blog/vpn-built-browser-microsoft.html\"},{\"by\":\"mooreds\",\"id\":33037463,\"text\":null,\"title\":\"Great Works in Programming Languages (2004)\",\"url\":\"https://www.cis.upenn.edu/%7Ebcpierce/courses/670Fall04/GreatWorksInPL.shtml\"},{\"by\":\"homarp\",\"id\":33037975,\"text\":null,\"title\":\"Junior Designers vs. Senior Designers\",\"url\":\"https://vanschneider.com/blog/young-designers/junior-designers-vs-senior-designers/\"},{\"by\":\"rntn\",\"id\":33038015,\"text\":null,\"title\":\"Limits of Language-Thought Influences and the Constraints of Embodiment (2021)\",\"url\":\"https://www.frontiersin.org/articles/10.3389/fpsyg.2021.593137/full\"},{\"by\":\"jarrenae\",\"id\":33038117,\"text\":\"Hi HN, this is an early version of what we’re imagining as a truly functional stock photo platform using Stable Diffusion.<p>We’re doing our best to hide the customization prompts on the back end so users are able to quickly search for pre-existing generated photos, or create new ones that would ideally work as well.<p>If we keep going with it, in future versions we’d like to add voting, better tags, and more varied prompts, or maybe whatever you recommend!\",\"title\":\"Show HN: Stock Photos Using Stable Diffusion\",\"url\":\"https://www.ghostlystock.com/\"},{\"by\":\"Tomte\",\"id\":33038139,\"text\":null,\"title\":\"How roasted almonds become marzipan (2018)\",\"url\":\"https://www.cnn.com/videos/cnnmoney/2018/09/19/how-marzipan-is-made-lon-orig.cnn\"},{\"by\":\"Tomte\",\"id\":33038143,\"text\":null,\"title\":\"Domain Pascal Language Reference (1987) [pdf]\",\"url\":\"http://bitsavers.informatik.uni-stuttgart.de/pdf/apollo/000792-04_DOMAIN_Pascal_Language_Reference_Jan87.pdf\"},{\"by\":\"kiyanwang\",\"id\":33039106,\"text\":null,\"title\":\"Pessimism is a barrier to progress\",\"url\":\"https://bigthink.com/progress/pessimism-is-a-barrier-to-progress/\"},{\"by\":\"PaulHoule\",\"id\":33039245,\"text\":null,\"title\":\"Keeping cool: A common refrigerant shows promise for metal recycling\",\"url\":\"https://phys.org/news/2022-09-cool-common-refrigerant-metal-recycling.html\"},{\"by\":\"anigbrowl\",\"id\":33039904,\"text\":null,\"title\":\"Advanced Scientific Data Format\",\"url\":\"https://github.com/asdf-format/asdf\"},{\"by\":\"vitabenes\",\"id\":33039967,\"text\":null,\"title\":\"How We Read Now\",\"url\":\"https://charlesschifano.substack.com/p/how-we-read-now\"},{\"by\":\"Stratoscope\",\"id\":33040505,\"text\":null,\"title\":\"'A fluke': The oldest webcam is still watching over San Francisco\",\"url\":\"https://www.sfgate.com/obscuresf/article/oldest-webcam-watches-san-francisco-17467544.php\"},{\"by\":\"rbanffy\",\"id\":33040830,\"text\":null,\"title\":\"Deepcake – Al solutions for video production\",\"url\":\"https://deepcake.io\"},{\"by\":\"avrionov\",\"id\":33040873,\"text\":null,\"title\":\"Citrix acquired and merged with Tibco for $16.5B\",\"url\":\"https://www.cloud.com/news/press-release.html\"},{\"by\":\"HieronymusBosch\",\"id\":33041114,\"text\":null,\"title\":\"Lyra V2 – a better, faster, and more versatile speech codec\",\"url\":\"https://opensource.googleblog.com/2022/09/lyra-v2-a-better-faster-and-more-versatile-speech-codec.html\"},{\"by\":\"ZacnyLos\",\"id\":33041355,\"text\":null,\"title\":\"The Other Internet\",\"url\":\"https://www.robinrendle.com/notes/the-other-internet/\"},{\"by\":\"sylvainkalache\",\"id\":33041644,\"text\":null,\"title\":\"Co-Founding Considered Harmful\",\"url\":\"https://florentcrivello.com/co-founding-considered-harmful/\"},{\"by\":\"mlajtos\",\"id\":33041714,\"text\":null,\"title\":\"Eye-tracking is a missing input device for VR experiences\",\"url\":\"https://mlajtos.mu/posts/gaze-contingency\"},{\"by\":\"foxTN\",\"id\":33041733,\"text\":null,\"title\":\"Hacking Google\",\"url\":\"https://h4ck1ng.google\"},{\"by\":\"respinal\",\"id\":33042253,\"text\":null,\"title\":\"Jagua fruit makes tattoos, antibiotics, and dessert\",\"url\":\"https://www.atlasobscura.com/foods/jagua-tattoo\"},{\"by\":\"jelliclesfarm\",\"id\":33042258,\"text\":null,\"title\":\"New DNA analysis shows how cats spread around the world (2016)\",\"url\":\"https://www.smithsonianmag.com/smart-news/dna-study-details-spread-cats-around-world-180960573/\"},{\"by\":\"conanxin\",\"id\":33042725,\"text\":null,\"title\":\"Aristotle influenced the computer (2017)\",\"url\":\"https://www.theatlantic.com/technology/archive/2017/03/aristotle-computer/518697/\"},{\"by\":\"herbertl\",\"id\":33042732,\"text\":null,\"title\":\"Too Much Internet\",\"url\":\"https://edzitron.medium.com/there-is-simply-too-much-internet-7ed232938709\"},{\"by\":\"fortran77\",\"id\":33043489,\"text\":null,\"title\":\"Cloning a Rare ISA Card to Use a Rare CD Drive [video]\",\"url\":\"https://www.youtube.com/watch?v=0W1t2_EJG9w\"},{\"by\":\"mooreds\",\"id\":33043513,\"text\":null,\"title\":\"Identity and Access Management Workforce Planning\",\"url\":\"https://bok.idpro.org/article/id/85/\"},{\"by\":\"gone35\",\"id\":33043737,\"text\":null,\"title\":\"The Golden Tearoom (1989) [video]\",\"url\":\"https://www.youtube.com/watch?v=h8zCz3KlV6M\"},{\"by\":\"samclemens\",\"id\":33043883,\"text\":null,\"title\":\"Early Cormac McCarthy Interviews Rediscovered\",\"url\":\"https://www.nytimes.com/2022/09/30/books/early-cormac-mccarthy-interviews-rediscovered.html\"},{\"by\":\"respinal\",\"id\":33043945,\"text\":null,\"title\":\"The 'attention economy' corrupts science\",\"url\":\"https://bigthink.com/the-present/attention-economy-science-damaged/\"},{\"by\":\"paulpauper\",\"id\":33044167,\"text\":null,\"title\":\"The banker who caused the 1929 stock crash\",\"url\":\"https://thehustle.co/the-banker-who-caused-the-1929-stock-crash/\"},{\"by\":\"gok\",\"id\":33044427,\"text\":null,\"title\":\"A study of lights at night suggests dictators lie about economic growth\",\"url\":\"https://www.economist.com/graphic-detail/2022/09/29/a-study-of-lights-at-night-suggests-dictators-lie-about-economic-growth\"},{\"by\":\"rntn\",\"id\":33044492,\"text\":null,\"title\":\"Software, not hardware, will drive quantum and neuromorphic computing\",\"url\":\"https://www.nextplatform.com/2022/09/30/software-not-hardware-will-drive-quantum-and-neuromorphic-computing/\"},{\"by\":\"trollied\",\"id\":33044753,\"text\":null,\"title\":\"The Lilium Jet\",\"url\":\"https://lilium.com/jet\"},{\"by\":\"zeristor\",\"id\":33044767,\"text\":null,\"title\":\"The City of London’s oldest document is currently on public display\",\"url\":\"https://www.ianvisits.co.uk/articles/the-city-of-londons-oldest-document-is-currently-on-public-display-57746/\"},{\"by\":\"henning\",\"id\":33044772,\"text\":null,\"title\":\"Xonsh: I don't remember how to write a for loop in Bash [video]\",\"url\":\"https://www.youtube.com/watch?v=x85LSyCxiw8\"},{\"by\":\"gjvc\",\"id\":33044885,\"text\":null,\"title\":\"Seer – a GUI front end to GDB for Linux\",\"url\":\"https://github.com/epasveer/seer\"},{\"by\":\"Tomte\",\"id\":33044913,\"text\":null,\"title\":\"DVD drives turned into microscopes\",\"url\":\"https://hackaday.com/2022/10/01/dvd-drives-turned-into-microscopes/\"},{\"by\":\"rcarmo\",\"id\":33045219,\"text\":null,\"title\":\"The 'Egg' Laptop\",\"url\":\"https://www.ikejima.org/projects/2022091-egg-laptop.html\"},{\"by\":\"Kaibeezy\",\"id\":33045371,\"text\":null,\"title\":\"The lost art of handheld demakes\",\"url\":\"https://wireframe.raspberrypi.com/articles/the-lost-art-of-handheld-demakes\"},{\"by\":\"marban\",\"id\":33045372,\"text\":null,\"title\":\"Companies are paying huge sums to show their ads to bots\",\"url\":\"https://www.wired.com/story/bots-online-advertising/\"},{\"by\":\"cinquemb\",\"id\":33045530,\"text\":null,\"title\":\"Values Are Facts\",\"url\":\"https://www.overcomingbias.com/2022/09/values-are-facts.html\"},{\"by\":\"imartin2k\",\"id\":33045539,\"text\":null,\"title\":\"Impoverished Emotional Lives\",\"url\":\"https://theconvivialsociety.substack.com/p/impoverished-emotional-lives\"},{\"by\":\"jlpcsl\",\"id\":33045763,\"text\":null,\"title\":\"Enhanced noise suppression in Jitsi Meet\",\"url\":\"https://jitsi.org/blog/enhanced-noise-suppression-in-jitsi-meet/\"},{\"by\":\"helsinkiandrew\",\"id\":33045872,\"text\":null,\"title\":\"How to turn waste polyethylene into something useful\",\"url\":\"https://www.economist.com/science-and-technology/2022/09/29/how-to-turn-waste-polyethylene-into-something-useful\"},{\"by\":\"rcarmo\",\"id\":33045956,\"text\":null,\"title\":\"The Eleventh Commandment (2004)\",\"url\":\"https://taoofmac.com/space/blog/2004/04/24#the-ten-commandments\"}]"}
```
