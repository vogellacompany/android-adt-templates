<?xml version="1.0"?>
<recipe>

    <#if appCompat?has_content><dependency mavenUrl="com.android.support:appcompat-v7:+"/></#if>
    <#if !appCompat?has_content && hasViewPager?has_content><dependency mavenUrl="com.android.support:support-v13:+"/></#if>
    <#if !appCompat?has_content && navType == 'drawer'><dependency mavenUrl="com.android.support:support-v4:+"/></#if>

    <merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <merge from="res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

    <merge from="res/values/dimens.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />
    <merge from="res/values-w820dp/dimens.xml"
             to="${escapeXmlAttribute(resOut)}/values-w820dp/dimens.xml" />

    <!-- TODO: switch on Holo Dark v. Holo Light -->
    <#if navType == 'drawer'>
        <copy from="res/drawable-hdpi"
                to="${escapeXmlAttribute(resOut)}/drawable-hdpi" />
        <copy from="res/drawable-mdpi"
                to="${escapeXmlAttribute(resOut)}/drawable-mdpi" />
        <copy from="res/drawable-xhdpi"
                to="${escapeXmlAttribute(resOut)}/drawable-xhdpi" />
        <copy from="res/drawable-xxhdpi"
                to="${escapeXmlAttribute(resOut)}/drawable-xxhdpi" />

        <instantiate from="res/menu/global.xml.ftl"
                to="${escapeXmlAttribute(resOut)}/menu/global.xml" />

    </#if>

    <!-- Use simple layout -->

    <instantiate from="res/layout/activity_simple.xml.ftl"
                  to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <!-- Add activity code to add -->
    
    <instantiate from="src/app_package/SimpleActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
   
</recipe>
