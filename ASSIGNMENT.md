# Delta Debugging exercise

## High-level goal

Delta debugging is a technique for minimizing input files -- typically failing
test cases, to find a smaller input with the same behavior.

The high-level goal of this exercise is to learn about automated debugging and
how to use the delta debugging approach to systematically minimize ("isolate")
failure-inducing inputs.

## Background (story time)

Your company uses a sorting program named `mysort.pl`. The program
works most of the time, but a user ran into a problem with it. In
the spirit of following best practices, they provided instructions with a
concrete test case that shows the problem:  a file named `failing.txt`.

You have been assigned to fix this bug.  The source code is unintelligible (it's
written in Perl, after all), so you decide to minimize the test input in hopes of
easing the debugging task or giving hints about the underlying defect.

A delta-debugging implementation is provided in the repository.
Your goal in this exercise is to apply delta debugging to
the input `failing.txt`.


## Instructions

Use a Unix environment (e.g., Linux, macOS, WSL, or attu.cs.washington.edu)
or git bash for Windows.

0. **Read the entire assignment and ask any clarifying questions that you might have.**

1. Ensure that [perl](https://www.perl.org/get.html) is installed.
   It is already installed on many Unix environments.

2. In the top-level directory (`delta-debugging`), run:

   * `perl mysort.pl passing.txt`

   * `perl mysort.pl failing.txt` (does not terminate; use ctrl-c to interrupt)

3. Use delta debugging to minimize `failing.txt`.
   Here are the steps to do so:

    * Write an **interestingness test script** that executes `mysort.pl`.
    * Edit file `dd-wrapper.sh` (in the top level of the repository) to call your interestingness test script, by replacing the text "`<your test oracle script>`" or "`your_interestingness_test_script`" by your script's file name.
    * Execute `dd-wrapper.sh`.

   Hints:

   * You can write your interestingness test script in any way and any programming language.

   * The interestingness test script will be run with an input filename as a command-line argument.

   * What constitutes interestingness for your invocation of delta debugging?

   * How will your interestingness test script handle the fact that `mysort.pl` may not terminate?

   * The interestingness test script you write must work when run in any
     directory.  That is, don't use relative paths (for example, when calling
     `mysort.pl` from within your script).  Your interestingness test script
     will be run in a a subdirectory like `tmp0/arena/`

   * Documentation of the delta debugging implementation appears in file
     [`delta/doc/using_delta.txt`](https://bitbucket.org/rjust/delta-debugging/raw/dbfc54573a2f0ce81fecb093135b39ede6847529/delta/doc/using_delta.txt).
     This documentation includes an example interestingness test script, which you can also find in file `delta/test/delta0/hello.test`.

   **If you can't get your interestingness test script to work within 15 minutes, ask the
   course staff for help.**

4. The minimized test input is stored in file `min.txt`.
   Verify that `mysort.pl` does not terminate.
   Using `min.txt`, debug and fix the issue in `mysort.pl`. (See Questions 1-3 below.)

   Hints about Perl:

   * Here is some basic Perl syntax:

      * A variable is referenced using a dollar sign `$`.
        So, `$x` means a use of the variable `x`.

      * A field is referenced using `->{fieldname}`.
        So, `$x->{foo} + 1` is like `x.foo + 1` in many other languages.

   * We know it is frustrating to debug a program in a programming language you
     don't know well.  (This will happen often in your career!)  Don't panic.
     You do not need substantial knowledge of Perl in order to fix the defect.

5. Manually create two test input files that trigger the problem in the original
   `mysort.pl` and that have the following properties:

   * **both test inputs have four lines**;

   * **test input 1** represents the **best case** scenario -- that is, requires the fewest delta-debugging steps.

   * **test input 2** represents the **worst case** scenario -- that is, requires the most delta-debugging steps.

   Delta debugging implementations differ in the order in which they evaluate
   subsets and complements of the input. **Validate your test inputs for the
   provided delta-debugging implementation.**

## Questions

1. What is the root cause of the bug in `mysort.pl`?

2. Give a one-sentence explanation to characterize **all** test inputs
   (input files, or equivalently input lists)
   on which `mysort.pl` fails because of the root cause in Question 1.

3. Provide a fix to the bug as a [unified diff](https://en.wikipedia.org/wiki/Diff#Unified_format)
   (use `git diff` to create a unified diff).

4. Provide your two four-line test inputs and:

   * briefly explain why these test inputs are the best and worst case, respectively;

   * for each test input, list all inputs (subsets and complements) evaluated by
     the provided delta-debugging implementation (in order of evaluation);

   * for each test input and corresponding list of evaluated inputs, identify the
     steps that correspond to "increase granularity", "reduce to subset", and
     "reduce to complement".

## Tips

1. Carefully look at the documentation at `delta/doc/using_delta.txt`, and make sure you understand the example under `/delta/test/delta0`. Your understanding is crucial for building your test for this activity.

2. You do not need to follow the `README` file under directory `delta/`; the files are already unzipped and ready to use. However, note that actual file names are inconsistent with what has been mentioned in the documentation. `in.c` should be `hello.c`, and `testit` should be `hello.test`.

3. If you do not want to add `delta` command to your path, use `./delta/bin/delta` instead, as what 'dd-wrapper.sh' does.

4. You may construct your interestingness test script in any language, but a bash script is enough for this activity and is arguably the simplest one. The structure would be similar to the one for the example provided at `delta/test/delta0/hello.test`.  The course staff has provided some other [information about bash scripting](SH-SCRIPTING-RESOURCES.md) that you might find helpful for this exercise.


## Deliverables

1. A **plain-text file** with your answers to the four questions above.
   **Please list all group members**.

2. The interestingness test script you wrote.
