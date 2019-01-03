
class Tool{
  static String readTimestamp(int timestamp) {
    String temp = "";
    if (timestamp == null || timestamp == 0) {
      return temp;
    }
    timestamp = timestamp ~/ 1000;
    try {
      int now = (new DateTime.now().millisecondsSinceEpoch ~/ 1000);
      int diff = now - timestamp;
      int months = (diff ~/ (60 * 60 * 24 * 30));
      int days = (diff ~/ (60 * 60 * 24));
      int hours = ((diff - days * (60 * 60 * 24)) ~/ (60 * 60));
      int minutes = ((diff - days * (60 * 60 * 24) - hours * (60 * 60)) ~/ 60);
      if (months > 0) {
        if(months == 1){
          temp = months.toString() + "月前";
        }
        else{
          final time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
          return "${time.year}年${time.month}月${time.day}日";
        }
        
      } else if (days > 0) {
        temp = days.toString() + "天前";
      } else if (hours > 0) {
        temp = hours.toString() + "小时前";
      } else {
        temp = minutes.toString() + "分钟前";
      }
    } catch (e) {
      e.toString();
    }
    return temp;
  }
}