package com.cykj.javabean;


import java.sql.Timestamp;

public class TabUser {

  private int userId;
  private String account;
  private String name;
  private String password;
  private String sex;
  private String education;
  private String occupation;
  private String phone;
  private String email;
  private String regTime;
  private String userState;
  private int userIntegral;
  private int levelId;
  private TabLevel tabLevel;

  @Override
  public String toString() {
    return "TabUser{" +
            "userId=" + userId +
            ", account='" + account + '\'' +
            ", name='" + name + '\'' +
            ", password='" + password + '\'' +
            ", sex='" + sex + '\'' +
            ", education='" + education + '\'' +
            ", occupation='" + occupation + '\'' +
            ", phone='" + phone + '\'' +
            ", email='" + email + '\'' +
            ", regTime=" + regTime +
            ", userState='" + userState + '\'' +
            ", userIntegral=" + userIntegral +
            ", levelId=" + levelId +
            ", tabLevel=" + tabLevel +
            '}';
  }

  public int getUserId() {
    return userId;
  }

  public void setUserId(int userId) {
    this.userId = userId;
  }

  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }

  public String getEducation() {
    return education;
  }

  public void setEducation(String education) {
    this.education = education;
  }

  public String getOccupation() {
    return occupation;
  }

  public void setOccupation(String occupation) {
    this.occupation = occupation;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getRegTime() {
    return regTime;
  }

  public void setRegTime(String regTime) {
    this.regTime = regTime;
  }

  public String getUserState() {
    return userState;
  }

  public void setUserState(String userState) {
    this.userState = userState;
  }

  public int getUserIntegral() {
    return userIntegral;
  }

  public void setUserIntegral(int userIntegral) {
    this.userIntegral = userIntegral;
  }

  public int getLevelId() {
    return levelId;
  }

  public void setLevelId(int levelId) {
    this.levelId = levelId;
  }

  public TabLevel getTabLevel() {
    return tabLevel;
  }

  public void setTabLevel(TabLevel tabLevel) {
    this.tabLevel = tabLevel;
  }
}
