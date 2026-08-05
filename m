Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC5E3E1230;
	Wed,  5 Aug 2026 07:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913806; cv=none; b=MXDeBsfymvLbl656Xq5ty5JU7UOaOXym/1Mw/3SQ5wJ+98z8ev32pA2WxANJS0sgyCRuff5nM6+gjEI1wDa5P9J6CLxC5/KZkmSvQZRoyWj+vjuIRPZFu6ZHZF4mQ0iht6A5lSZ0Sa+Y8SuHc4ms327zi3un1sRN9P9WPWfyYP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913806; c=relaxed/simple;
	bh=ZRgcu/++YGJghC2UQDdTvIdBipz3Lc1yBjtKgxYb+GE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVlBEKD59tCwb9SwxlYgnv9ENP2FtJ3tUbrmS+AUsq0LiT/3aB4Y/AZ9Wbg15Jk/8ZX9KprnlmxxtSkvscOJIFZA7E9Ko2RRPApsoq+LQ6/qnRfSPfUUN9GRwjon5PZNJpI52Y6cAWNJUYxXL+GjLsSgfDxloGIeTKAWWNhOQd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rp5W4x4C; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rp5W4x4C"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755lcG83005302;
	Wed, 5 Aug 2026 07:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9C0tfI
	MjvQvAkBT54fKZbqKNg6gXZW10TzWcacWiyfc=; b=rp5W4x4C/eTRdtKcwgk4KU
	Z+ypgaYkeGXypEt71Qc2r4ssdPhy3WGW23DNPJCG3Xy0BtH/AyC23kwIoCw9rcHf
	nawDFsE6S+Yj4Q4CsyXhvy2fg0Y9w3v2i2b5AkbzGmfJUp8iaT3Ug0Y/PFd0ak5b
	1sqYSQ0rGqKSL0WgfgsCsiaH2Mq6cw5OFq4aoQDPtfTSTEHwGrmQN90Iu1/DCkhj
	lF0v2ke6qPFrNzvzJdZTUSoqAHOp6ar+dwDhP9fOX1ybkDc4jSJI3X2hUYONAdDm
	GftBiDHgzZnKOgp6z5D5tKllnpzNDIve2kwrnrkeCAxDGA+UgxaJwVlso6c/Vhqg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8h51tmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:09:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6756uF9K013356;
	Wed, 5 Aug 2026 07:09:46 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsugw5k6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:09:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67579iZ649480040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Aug 2026 07:09:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B83A2004E;
	Wed,  5 Aug 2026 07:09:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0FAA20043;
	Wed,  5 Aug 2026 07:09:38 +0000 (GMT)
Received: from [9.39.28.91] (unknown [9.39.28.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Aug 2026 07:09:38 +0000 (GMT)
Message-ID: <1a6dd561-f529-433d-bc09-094924d861fe@linux.ibm.com>
Date: Wed, 5 Aug 2026 12:39:36 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/17] irq & spin_lock: Add counted interrupt
 disabling/enabling
To: Boqun Feng <boqun@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
        Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-6-boqun@kernel.org>
 <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>
 <anJUuzBcWRwyw6NJ@tardis.local>
 <20260805063645.GO776954@noisy.programming.kicks-ass.net>
 <anLhM8xTlB6bN2N7@tardis.local>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <anLhM8xTlB6bN2N7@tardis.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA1MSBTYWx0ZWRfX2Y1RFaos79vm
 1Qqj0oE3MAvts7NvrSV3ajdREi5G5w3kAXjZEZ42GYGeUrdQChPf7IHNnsAtax8A1GtK0PoLqwC
 xCqkfmUHL92TiqqR6kq8C7c9AtGPJm4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA1MSBTYWx0ZWRfX2mPDAh6Yt/yF
 8iAfCpr6ByCsWk7kMa/5YBGAGbsNdWs7yuhVanVMfZ6jjCz05xGeMD+nuxciiq9OVHEQEssDTkD
 8oMQyq3H5GrcfU8P5qEpWE0mR3lcrKk3OTNGt0SzGVIdu3ZgLwNcieY3AyK/9yfNFHnzhTaOtWP
 6gdZuRDvShWxJm874+Md7a2dlFM1u85bzUjQgIAxRppUp8yLvWwt96Oa1JGmU2JRs6z2Dmj055J
 4fipt6N1qAe7Hv7ueFC3XwBvKUJowyhMB+cBpDVxeMJntEDVP0QfD1tvBs3B9L7UNWXh1Wk4IXf
 67qjS5O3vl4Lr6EO0x5EDwOAbmF1YHu+upDFSCRkKFsgZ6JQJqYuajOA+1aj4Ak4GD8jpDs+dpu
 2Ulaf1WhLdVKi0PNF6MkNMvTtR/xn533MhF+g8pwjcDcXRLrsiv84APPIHiqwhLO20OX9oV/x4J
 BU5qkuQYShNBXIa078g==
X-Authority-Analysis: v=2.4 cv=SI1ykuvH c=1 sm=1 tr=0 ts=6a72e1bc cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=1piVZe82tsHeqK_2eX4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: n308oW4qHgKqrmwJSbP7DRyitp7lugLB
X-Proofpoint-GUID: AzzTBLHlUffgZCZvF9VtR4XH5GmeCHqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050051



On 8/5/26 12:37 PM, Boqun Feng wrote:
> On Wed, Aug 05, 2026 at 08:36:45AM +0200, Peter Zijlstra wrote:
>> On Tue, Aug 04, 2026 at 02:08:11PM -0700, Boqun Feng wrote:
>>
>>>>> +	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
>>>>> +
>>>>> +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
>>>>> +		_local_interrupt_disable();
>>>>> +}
>>>>
>>>> Maximum nesting possible is 256 right? Whats is stopping here to do more than that?
>>>
>>> Yes. Currently similar as softirq, we don't detect the overflow.
>>>
>>>> Should there be a warn_on?
>>>
>>> A simple warn_on could be problematic because warn_on() itself may take
>>> an irq-disabling lock, and that may trigger another overflow on top of
>>> the existing overflow. It's a bit tricky to do a proper detection. But
>>> I'm open to ideas.
>>
>> DEBUG_PREEMPT's preempt_count_add() does:
>>
>>          DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >= PREEMPT_MASK - 10);
>>
> 
> Yeah, but this is behind a kconfig (DEBUG_PREEMPT), so not sure whether
> it's what Shrikanth asked here.
> 

I was suggesting to have a mechanism which allows to debug it/
find the callers.

> Regards,
> Boqun
> 
>>

