---
layout: reference
title: /may_nav/global_planner/parameter_updates
category: topic
tags: 
- ${tag}
---

## Description
${description}

## Usage
#### Console
```
rostopic echo /may_nav/global_planner/parameter_updates
```

#### rospy
```
awake_sub = rospy.Subscriber("/may_nav/global_planner/parameter_updates", ${message}, parameter_updates_cb, 1)
def ${topic name}_cb(msg):
    print "${message} message was published"
```

#### roscpp
```
void ${callback}(const ${message-shared-ptr}& msg)
{
    cout ${${ "${message} message was published";
}
ros::Subscriber sub = nh.subscribe("/may_nav/global_planner/parameter_updates", 1, ${callback});
```

#### Related Documentation
``${message}``  