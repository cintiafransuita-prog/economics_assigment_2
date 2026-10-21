# Assignment 2: More efficient plants, less electricity?

Group assignment for *Economic Analysis for Data Scientists* (Unit 3). We evaluate a pilot energy-consulting programme for manufacturing plants, explain the firms' response with the Unit 3 production model, and advise the government on a follow-up. The full brief is in [energy_efficiency_assignment.pdf](energy_efficiency_assignment.pdf).

**What we hand in:** one self-contained R Jupyter notebook with code, selected outputs, economic diagrams, calculations, written interpretation and a 200–300 word policy briefing. It must run from the supplied CSV in `data/`, and it must state each group member's contribution.

## Prerequisites

Install these once on your machine:

- [Git](https://git-scm.com/downloads)
- [uv](https://docs.astral.sh/uv/getting-started/installation/), which manages Python and the Jupyter environment
- [R](https://cran.r-project.org/) 4.3 or newer, with `Rscript` available in your terminal
- An editor for notebooks: VS Code with the Jupyter extension, or JupyterLab

## Setup

Run these from a terminal, once per machine.

1. Clone the repo and enter it:

   ```bash
   git clone https://github.com/cintiafransuita-prog/economics_assigment_2.git
   cd economics_assigment_2
   ```

2. Create the Python environment (this also installs Jupyter's kernel tools):

   ```bash
   uv sync
   ```

3. Install the R packages and register the R kernel:

   ```bash
   uv run Rscript scripts/setup_r.R
   ```

4. Check that the R kernel is there. The list should include `ir`:

   ```bash
   uv run jupyter kernelspec list
   ```

You do this once per machine, not every time you work. After that, day-to-day work is: open the notebook, select the **R** kernel, run. The notebook loads its packages with `library(...)`; the setup script only makes sure they are installed.

Rerun step 3 only when someone adds a package to [scripts/setup_r.R](scripts/setup_r.R). It installs whatever is missing and skips the rest.

## Opening the notebook

- **VS Code:** open the `.ipynb` file, click *Select Kernel* → *Jupyter Kernel* → **R**.
- **JupyterLab:** run `uv run --with jupyterlab jupyter lab` and pick the **R** kernel.

Everyone must use the kernel named `ir` (the default that step 3 registers), so the notebook opens with the right kernel on every machine.

## Project structure

```
├── energy_efficiency_assignment.pdf   the assignment brief
├── assignment2_template.ipynb         complete first draft of all answers (Q1-9); the group splits and improves it
├── assignment2_<name>.ipynb           one draft per person
├── assignment2.ipynb                  the final notebook we hand in (created at the end)
├── data/
│   └── energy_firms.csv               one row per plant per month (480 plants × 16 months)
├── scripts/
│   └── setup_r.R                      installs R packages, registers the kernel
├── outputs/
│   ├── tables/                        generated, not versioned
│   └── graphs/                        generated, not versioned
├── src/                               Python package created by uv (unused so far)
├── pyproject.toml, uv.lock            Python environment
└── README.md
```

All notebooks live in the repo root, so they read the data with the same relative path, `data/energy_firms.csv`. Never use absolute paths: they only work on your machine.

## Notebook sections

The template follows the brief and already contains a complete first draft of every answer, with code, tables, figures and diagrams. We split the questions among us and each improves their part. Keep these headings in every draft so the drafts are easy to compare side by side:

- **Part 1: Explore the data**: Question 1
- **Part 2: Find the question, then develop an explanation**: Questions 2–4
- **Part 3: Turn your explanation into further evidence**: Questions 5–6, with 6(a)–(d) and the alternative explanation
- **Part 4: Use the model to advise**: Questions 7–8, the optional levy extension and the optional Question 9

## How we work

Each of us writes a full draft in our own notebook, on our own branch. Then we review the drafts together and build one final notebook. Because nobody edits anyone else's file, git never has conflicts to resolve.

1. **Create your branch and your draft** from the template:

   ```bash
   git switch -c <name>
   cp assignment2_template.ipynb assignment2_<name>.ipynb
   ```

2. **Work only in your own file.** Keep the section headings from the template.

3. **Commit and push your branch** as often as you like:

   ```bash
   git add assignment2_<name>.ipynb
   git commit -m "Draft questions 1-3"
   git push -u origin <name>
   ```

4. **Agree on Questions 1–3 before starting Question 4.** The brief asks for a first attempt at Questions 1–3 before the TA session: bring the pattern we want to explain and our proposed evaluation. Questions 4–7 build on that pattern and on the estimated effects, so our drafts must agree on them first.

5. **Review together and build the final notebook.** Everyone merges their branch into `main`, so all drafts sit side by side. We compare them, and one person assembles `assignment2.ipynb` from the best parts. That single file is what we hand in.

A few rules that keep this smooth:

- **Do not edit the template or someone else's draft.** If the template needs a change, agree on it first.
- **Before you commit:** restart the kernel and run all cells, so the saved outputs match the code.
- **Need a new R package?** Add it to the `packages` list in [scripts/setup_r.R](scripts/setup_r.R) and tell the group to rerun step 3.
- **Need a new Python package?** Use `uv add <package>` and commit both `pyproject.toml` and `uv.lock`.

## Troubleshooting

- **`jupyter: command not found` during step 3:** run the script through `uv run` as shown, not with plain `Rscript`. The kernel registration needs the `jupyter` command from the project environment.
- **The R kernel does not appear in VS Code:** rerun step 3, then reload the VS Code window.
- **A package fails to install:** read the error from `Rscript`; on macOS and Linux it usually names a missing system library.
