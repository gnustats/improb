#!/bin/bash
pushd .
(
(([ "$1" == "clean" ] && git clean -xfd) || true) &&
python setup.py build &&
python setup.py install --user &&
pushd docs &&
make html &&
make latex &&
pushd _build/latex &&
make all-pdf &&
popd &&
make doctest &&
popd  &&
python setup.py sdist --formats=zip
) || popd

