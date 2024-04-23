# Makefile; see License.txt for copyright and terms of use

# Makefile for delta/test/delta0.
# Daniel S. Wilkerson dsw@cs.berkeley.edu

DELTA_BASE := ../..

DELTA := $(DELTA_BASE)/bin/delta

DELTA_FLAGS += -test=$(TEST)
DELTA_FLAGS += -quiet
#DELTA_FLAGS += -verbose
DELTA_FLAGS += -cp_minimal=$(MINIMAL)

MINIMAL := minimal_test.c
TEST := hello.test

.SUFFIXES:

.PHONY: check
check: clean
	$(DELTA) $(DELTA_FLAGS) < hello.c
	@if diff -u $(MINIMAL) minimal_test.c.correct; then \
	  echo "PASS"; \
	else \
	  echo "**************** FAIL ****************"; \
	  false; \
	fi

.PHONY: clean
clean:;
	rm -f core a.out minimal_test.c hello *.o
	rm -rf tmp0

# Build hello to see it run and check its return value.
hello: hello.c
	gcc $^ -o $@
