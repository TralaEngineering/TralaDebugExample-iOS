# Trala Debug Example

A bunch of branches are waiting to be committed to this project, but each has had a serious bug found in in. Please select a bug from the list of bug reports below, switch to its indicated branch, and fix it (with a thought to preventing regressions via tests).

## Bug Reports


### Unending Pull to Refresh
Branch: `unending-pull-to-refresh`

Pull-to-refresh seems to reload the page, but the spinner never disappears.

This seems to make multiple reloads impossible.

---

### Crash on Launch
Branch: `crash-on-launch`

Our app has suddenly started crashing on launch.

All the developers swear there were no deploys or changes to the codebase before the crashes started rolling in.

---

### Inconsistent Cell Highlighting
Branch: `inconsistent-cell-highlighting`

Our app is supposed to highlight customers it would expensive to visit to (those from Alaska or Hawaii). But users are reporting that other customers are randomly being highlighted as well.

The developers swear they tested for this.

---

### Edits not Reset on Cancel
Branch: `edits-not-reset-on-cancel`

Our testers have reported the following bug:

1. Tap on a cell to edit it.
1. Make a change to either name.
1. Tap “Cancel” to cancel — do not tap “Save”
1. Scroll the table down and then up again.
1. Note that the cancelled change is now somehow displayed in the cell?

---

### Poor Scrolling Performance
Branch: `poor-scroll-performance`

Users on older devices are complaining of stuttering and poor performance when scrolling through our table view. What can we do to improve our scroll performance?

---

### Intermittent Crash on Reload
Branch: `intermittent-crash-on-reload`

The app crashes sometimes when reloading the table view. But the the problem seems to be intermittent.

Reproduce the crash and then fix it.

---

### Cells Not Loading
Branch: `cells-do-not-load`

The cells of the table don’t display on lunch.

Scrolling the table will cause them to suddenly appear.

