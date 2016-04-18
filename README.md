# What

This is a simple wrapper that reformats Sun Grid Engine queue status listings (`qstat`) to show more of the job name (50 characters) and delimit fields with single tabs (making it easier to parse).

Under the hood this is just a wrapper to an xslt script which can be modified as needed; to increase the job name field just increase the length of the `substring` parameter.

# Requirements

Must be run on the cluster (it calls `qstat` under the hood). Also depends on `xsltproc`.

# Usage

 * `qs.sh`: show `qstat` output
 * `qs.sh ARG`: show `qstat ARG output`
 
# Example

###Original qstat:

	[nobody@example.com ~]$ qstat -u $USER
	job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
	-----------------------------------------------------------------------------------------------------------------
	 573556 0.00050 com.amazon nobody       r     04/18/2016 15:52:51 short.q@nodexxxxxx.example,com     1 98
	 573557 0.00050 com.amazon nobody       r     04/18/2016 15:54:01 short.q@nodexxxxxx.example,com     1 29
	 573557 0.00050 com.amazon nobody       r     04/18/2016 15:54:21 short.q@nodexxxxxx.example,com     1 36
	 573557 0.00050 com.amazon nobody       r     04/18/2016 15:55:39 short.q@nodexxxxxx.example,com     1 63

### qs.sh:

	[nobody@example.com ~]$ qs.sh -u $USER
	    573556	com.amazonaws.util.StringUtils-toBigDecimal	nobody	r	2016-04-18T15:52:51	1	98
	    573557	com.amazonaws.util.StringUtils-replace	nobody	r	2016-04-18T15:54:01	1	29
	    573557	com.amazonaws.util.StringUtils-replace	nobody	r	2016-04-18T15:54:21	1	36
	    573557	com.amazonaws.util.StringUtils-replace	nobody	r	2016-04-18T15:55:39	1	63
	    573557	com.amazonaws.util.StringUtils-replace	nobody	r	2016-04-18T15:55:59	1	65
	    573557	com.amazonaws.util.StringUtils-replace	nobody	r	2016-04-18T15:56:09	1	69
	    573557	com.amazonaws.util.StringUtils-replace	nobody	r	2016-04-18T15:58:01	1	100

### qs.sh | column -t:

	[nobody@example.com ~]$ qs.sh -u $USER | column -t
	573556  com.amazonaws.util.StringUtils-toBigDecimal        nobody  r   2016-04-18T15:52:51  1  98
	573557  com.amazonaws.util.StringUtils-replace             nobody  r   2016-04-18T15:54:01  1  29
	573557  com.amazonaws.util.StringUtils-replace             nobody  r   2016-04-18T15:54:21  1  36
	573557  com.amazonaws.util.StringUtils-replace             nobody  r   2016-04-18T15:55:39  1  63
	573557  com.amazonaws.util.StringUtils-replace             nobody  r   2016-04-18T15:55:59  1  65
	573557  com.amazonaws.util.StringUtils-replace             nobody  r   2016-04-18T15:56:09  1  69
	573557  com.amazonaws.util.StringUtils-replace             nobody  r   2016-04-18T15:58:01  1  100
