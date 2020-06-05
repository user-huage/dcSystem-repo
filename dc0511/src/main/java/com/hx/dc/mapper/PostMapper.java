package com.hx.dc.mapper;

import com.hx.dc.entity.Dept;
import com.hx.dc.entity.Post;

import java.util.List;

public interface PostMapper {
    public List<Post> queryPost(Post post);
    public Post queryPostByPostName(Post post);
    public List<Dept> ajaxQueryTotalDept();
    public List<Dept> ajaxQuerySubDept(String depName);
    public Dept ajaxQueryTotalDeptByTotalName(Post post);
    public int addPost(Post post);
    public int updatePost(Post post);
    public int deletePost(int[] postIds);
}
