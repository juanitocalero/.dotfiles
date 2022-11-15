add_journal()
{
	echo $1 >> /mnt/c/Users/JCAL/Org/journal/$(date -u +"%Y-%m-%d").md
}
