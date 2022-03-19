#!/bin/bash

ping -c 4 8.8.8.8 | grep errors | cut -d ',' -f 4
