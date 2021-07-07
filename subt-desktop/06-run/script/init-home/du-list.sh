# 统计磁盘空间
 
# debug
# du -h --max-depth=2 /volume1 | sort -hr

du -h --max-depth=2 /volume1 | sort -hr > /volume2/NFS-ds3617xs/01-desktop/du-volume1-$(date +%Y%m%d-%H%M%S).txt
du -h --max-depth=3 /volume2 | sort -hr > /volume2/NFS-ds3617xs/01-desktop/du-volume2-$(date +%Y%m%d-%H%M%S).txt