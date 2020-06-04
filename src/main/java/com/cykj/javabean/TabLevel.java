package com.cykj.javabean;


public class TabLevel {

  private int levelId;
  private String levelName;
  private int uploadIntegral;
  private int downloadIntegral;

  @Override
  public String toString() {
    return "TabLevel{" +
            "levelId=" + levelId +
            ", levelName='" + levelName + '\'' +
            ", uploadIntegral=" + uploadIntegral +
            ", downloadIntegral=" + downloadIntegral +
            '}';
  }

  public int getLevelId() {
    return levelId;
  }

  public void setLevelId(int levelId) {
    this.levelId = levelId;
  }


  public String getLevelName() {
    return levelName;
  }

  public void setLevelName(String levelName) {
    this.levelName = levelName;
  }


  public int getUploadIntegral() {
    return uploadIntegral;
  }

  public void setUploadIntegral(int uploadIntegral) {
    this.uploadIntegral = uploadIntegral;
  }


  public int getDownloadIntegral() {
    return downloadIntegral;
  }

  public void setDownloadIntegral(int downloadIntegral) {
    this.downloadIntegral = downloadIntegral;
  }

}
