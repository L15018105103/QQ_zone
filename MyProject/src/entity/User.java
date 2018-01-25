package entity;

public class User {
private String id;
private String name;
private String password;
private String nickName;
private String birthday;
private String place;
private String constellation;
private String blood;
private String profession;
public String getId() {
return id;
}
public void setId(String id) {
this.id = id;
}	
public String getName() {
return name;
}
public void setName(String name) {
this.name = name;
}
public String getPassword()
{
	return password;
}
public void setPassword(String password)
{
	this.password=password;
}
public void setNickName(String nickName)
{
	this.nickName=nickName;
}
public void setBirthday(String birthday)
{
	this.birthday=birthday;
}
public void setPlace(String place)
{
	this.place=place;
}
public void setConstellation(String constellation)
{
	this.constellation=constellation;
}
public void setBlood(String blood)
{
	this.blood=blood;
}
public void setProfession(String profession)
{
	this.profession=profession;
}
public String getNickName()
{
	return nickName;
}
public String getBirthday()
{
	return birthday;
}
public String getPlace()
{
	return place;
}
public String getConstellation()
{
	return constellation;
}
public String getBlood()
{
	return blood; 
}
public String getProfession()
{
	return profession;
}
}
