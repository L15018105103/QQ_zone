package entity;

public class Messager {
private String name;
private String memo;
private String time;
private String count;
private String reply;
private String replyTime;
public Messager()
{
	
}
public String getName()
{
	return name;
}
public String getMemo()
{
	return memo;
}
public String getTime()
{
	return time;
}
public String getCount()
{
	return count;
}
public String getReply()
{
	return reply;
}
public String getReplyTime()
{
	return replyTime;
}
public void setName(String name)
{
	this.name=name;
}
public void setMemo(String memo)
{
	this.memo=memo;
}
public void setTime(String time)
{
	this.time=time;
}
public void setCount(String count)
{
	this.count=count;
}
public void setReply(String reply)
{
	this.reply=reply;
}
public void setReplyTime(String replyTime)
{
	this.replyTime=replyTime;
}
}
