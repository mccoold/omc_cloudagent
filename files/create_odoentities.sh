#!/bin/sh
basedir=/home/oracle/scripts/odo

$basedir/add_odocampaign.sh
$basedir/add_odoengine.sh
$basedir/add_odoengineasap.sh
$basedir/add_odoenginedbinstance.sh
$basedir/add_odoengineosm.sh
$basedir/add_associations.sh

#touch success script for chef
touch $basedir/success
