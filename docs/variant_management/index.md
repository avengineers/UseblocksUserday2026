## Advanced Variant Management with Sphinx-Needs

One feature model for the code, the tests and the documentation

<hr>

useblocks User Day 2026 in Munich <!-- .element: class="talk-event" -->

<div class="talk-logos">
<img src="../images/RMT-Logo_TransparentBG.png" alt="RMT logo">
<img class="wordmark" src="../images/useblocks_logo.svg" alt="useblocks logo">
<img src="../images/Marquardt-100-Years-Keyvisual-white-gold.png" alt="Marquardt logo">
</div>

Note:

Welcome the audience. Say the title of the talk.

---

### Who are we?

<div class="speakers">
<div class="speaker">

![Judith](../images/judith.png)

[Judith](https://www.linkedin.com/in/judith-reichwein-873665258/)

</div>
<div class="speaker">

![Karsten](../images/karsten.png)

[Karsten](https://www.linkedin.com/in/karnangue/)

</div>
<div class="speaker">

![Philip](../images/speaker_placeholder.svg)

Philip

</div>
</div>

Note:

Each speaker says who they are in one or two sentences.

---

### Where we left off

Note:

(Karsten) CodeDays 2024 and the user day 2025: the feature model drives the build, the IDE
and the tests. The documentation followed through Jinja.

---

### SPLED in one slide

Note:

(Karsten) Disco, Sleep and Spa: their features and their components.

---

### One feature model, three artifacts

Note:

(Karsten) The feature model selects the code, the tests and the documentation.

---

### Documents as templates

Note:

(Karsten) What Jinja does to the documents, and what breaks.

---

### Declarative instead

Note:

(Philip) Before and after: the Jinja condition becomes an `{if}` block.

---

### The variant as data

Note:

(Philip) One generated file per variant. One file selects the variant.

---

### Whole components in or out

Note:

(Philip) One generated rule per component, read by Sphinx and by ubCode.

---

### The editor knows the variant

Note:

(Philip) ubCode switches between Disco and Sleep.

---

### What if?

Note:

(Philip) `ubc diff` without a build.

---

### Code and tests trace per variant

Note:

(Judith) A one-line `@need` in the code, a test specification in the test.

---

### Test results are needs

Note:

(Judith) The component report, built on the developer's machine.

---

### Covered in every variant?

Note:

(Judith) The traceability matrix per variant, and the next step: a schema rule.

---

### Two readers, one answer

Note:

(Judith) CI builds every variant with Sphinx and with ubc and compares the needs.

---

### Adopt it, and what's next

Note:

(Karsten) Three mandatory changes. What comes next.

---

### Try it

Note:

(Karsten) The guided tour in SPLED.

---

### Questions?

<div class="qr">

![QR code of the slides](../images/qr_variant_management.png)

</div>

https://avengineers.github.io/UseblocksUserday2026/docs/variant_management/ <!-- .element: class="deck-url" -->

---

### Some Links

- [We@GitHub](https://github.com/avengineers)
- [Printable Slides](https://avengineers.github.io/UseblocksUserday2026/docs/variant_management/?print-pdf)
