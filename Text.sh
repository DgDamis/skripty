#!/bin/bash
text="Dobrý:den:zdraví:Vás:děda:Mráz"
echo $text
echo $text | awk -F ":" '{print $2}'
echo $text | awk -F ":" '{print $6}'
