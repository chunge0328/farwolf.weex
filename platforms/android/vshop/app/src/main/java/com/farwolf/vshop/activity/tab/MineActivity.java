package com.farwolf.vshop.activity.tab;

import com.farwolf.vshop.R;
import com.farwolf.weex.activity.WeexActivity;

import org.androidannotations.annotations.EActivity;

/**
 * Created by zhengjiangrong on 2017/5/23.
 */
@EActivity
public class MineActivity extends WeexActivity {


    @Override
    public void init() {
        this.title.setTitle("我的");
//        render("app/busi/tab/mine.js",false);
    }




    @Override
    public int getViewId() {
        return R.layout.mine_activity;
    }
}
