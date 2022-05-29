select 
    * 
from 
    facebook_posts
where 
    post_id in  
(select 
    post_id 
from 
    facebook_reactions 
where 
    lower(reaction)='heart');
