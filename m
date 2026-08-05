Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176CF348C6F;
	Wed,  5 Aug 2026 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948832; cv=none; b=fQP6TXK+PEWggQoYrkNJWmhf2o19fch2zcJ4ExKvpHKes2yH8xzzf2MfnJlIgdF7oLzgSMucP7VvSZ/lOlc4ZyOy4rS6UvYXGD51SY6gLKXrDhPRSbidbf1aPfJNjC2aqtPD3DnPbjIgVVBpBiMurtl8lz/iSGz/spQswAd1FZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948832; c=relaxed/simple;
	bh=pdMwAEJd8sc8yST7RvpsNFWrOCEY5Qim4bS8kK5JYrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDX7MQUac6O9HOaK8nwcrmDXnrAar0TWEFhyDSMbFA/dY4C5YvhmkRPJr2uHuPt3dQkQgLUJqUPj9KyFaPJ3+GcrI0nkAprjCZ1C9hht8AcylUUAowEJDU3XOnuqqOeMmqAdXHSR8Ur0KZcUBVq32+5nbnRhQFpR7vn1RXOX8ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qgldQs+p; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qgldQs+p"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FmajK4181773;
	Wed, 5 Aug 2026 16:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Pn1c/k
	XApYGS0Zv+2uIioCKpVjhKMb737yS1GxCXR7g=; b=qgldQs+pBSFTNoou3QeBpk
	XzoBJFV/RUzoMZkHn+7q2CxIB9BxbJ8Nx+RDgDzO7r4xQkiQAaJ7Es6E2VQvNqSf
	WnsvYe4iUvVJzFmJhjdjW4xIpWm2A7RJyE387gjiiikgnR3SAc7SBNyRDKdB+I/J
	r7sFYEnjE4YTOYjZ6D53aRO9sPZKgPinM73iGMyQ8TRS7O6pl/cVtp0U3lQeT4Fo
	TlAFeDI4NGMuPkp6m5IC8D5TAQHYxtN/uMRxAQp7WkEhe11TEIAYn7S6fSIWdipF
	dfY4LMftIPnKU+sty5O2l1gE6DmRXD69fHERzNEqeSwEV7QRP3zGE5M6hDLR8wkA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs67huusk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 16:53:28 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 675GfJOx032408;
	Wed, 5 Aug 2026 16:53:28 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsvmhfbk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 16:53:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 675GrPSM42402048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Aug 2026 16:53:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D774A2004F;
	Wed,  5 Aug 2026 16:53:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD5602004B;
	Wed,  5 Aug 2026 16:53:21 +0000 (GMT)
Received: from [9.39.28.91] (unknown [9.39.28.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Aug 2026 16:53:21 +0000 (GMT)
Message-ID: <f1d73456-73ee-46e3-aaf7-6a6fe40f3196@linux.ibm.com>
Date: Wed, 5 Aug 2026 22:23:20 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/17] irq & spin_lock: Add counted interrupt
 disabling/enabling
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
        Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
        Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
        Lyude Paul <lyude@redhat.com>,
        Daniel Almeida
 <daniel.almeida@collabora.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>,
        Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>
 <anJUuzBcWRwyw6NJ@tardis.local>
 <20260805063645.GO776954@noisy.programming.kicks-ass.net>
 <anLhM8xTlB6bN2N7@tardis.local>
 <1a6dd561-f529-433d-bc09-094924d861fe@linux.ibm.com>
 <anLj_Ryl635sxvI8@tardis.local> <anNAWmjK4_jfMHkl@tardis.local>
 <1eccb39d-f4bf-41d3-a999-e4bf45833c04@linux.ibm.com>
 <anNGwaegou9WJHC_@tardis.local>
 <0367352e-5578-4d70-88ae-1bfa446ec377@linux.ibm.com>
 <anNSocuKlbA7cLKk@tardis.local>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <anNSocuKlbA7cLKk@tardis.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfXzw1FmmuazF0I
 rya6iHsRUMVO0XYvLT0g/TNS7umd2wuJvjeuWhesWEBPR7JjNkj7Yz9AJ5VRdroXPPhxf44lplc
 9XfZ6P7yP3yM3mlB+phVp6R2RIg1q00=
X-Authority-Analysis: v=2.4 cv=I7VVgtgg c=1 sm=1 tr=0 ts=6a736a89 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=zzF01kqBtHAwm6PMAN8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfX8bK1qG4xzq4M
 +YbzQkrj+ClSL3LTEVRG5KQGsq+8tS/mSb0ojvmLnRVmOS+obNwFpRKDMEy6bb0/tQw1HTJi3Ix
 v2SNaQSBkUaFhCo40wvdqRqdLPv45m+CQ3FJMQgcXo3Nt8UEvqToC8YiuXRMHO2xoKgEIAgmXfT
 4GnZE69u7R0k+2Rb5XgAWtDpEmmHT9WOhr9/4b3JXv7ZoeyX7ESNv+bWbCNuHCXPSl09aQIE7Tz
 8HM9R6QoLVgQbN4p/MS21LQ1wEe3GZCuSgQg7JUUdB++ZK4jFk1sTjZK68UvsxHf1qv0glyxuik
 9OQjornvJQkQb/bP2QTFn/qimwcbTqegNzlreVnyE1WFW9XGav4bsCdwYH+VU92fJr0++AS0sxq
 eUmCv2ZwxdjWkBkqaa/hdZoRpgG6B+pV/kmdBATPNctiKNhBWRN9+45KmyqyUa2OK+OxD2DNBC2
 CrgLwBTY7V/WdB2/YzQ==
X-Proofpoint-ORIG-GUID: UYagqJUwepW1B4XGg9sFbPrj4yiz_VQl
X-Proofpoint-GUID: rVPgtFMWkQEN6x6VgwKH1zIt28ic1reO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050137

Hi Boqun.

On 8/5/26 8:41 PM, Boqun Feng wrote:
> On Wed, Aug 05, 2026 at 08:26:49PM +0530, Shrikanth Hegde wrote:
>>
>>
>> On 8/5/26 7:50 PM, Boqun Feng wrote:
>>> On Wed, Aug 05, 2026 at 07:40:18PM +0530, Shrikanth Hegde wrote:
>>>>
>>>> Hi Boqun,
>>>>
>>>>>
>>>>> Something as below? Going to send it to kernel build bot and see if it
>>>>> works for all configs.
>>>>>
>>>>> ----------------->8
>>>>> diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
>>>>> index b9a7f05ecf42..39f30bc65548 100644
>>>>> --- a/include/linux/interrupt_rc.h
>>>>> +++ b/include/linux/interrupt_rc.h
>>>>> @@ -12,6 +12,7 @@
>>>>>      */
>>>>>
>>>>>     #include <linux/irqflags.h>
>>>>> +#include <linux/debug_locks.h>
>>>>>     #include <linux/preempt.h>
>>>>>     #include <linux/processor.h>
>>>>>     #include <linux/smp.h>
>>>>> @@ -63,6 +64,12 @@ static inline void local_interrupt_disable(void)
>>>>>
>>>>>            new_count = hardirq_disable_enter();
>>>>>
>>>>> +       /* Is hardirq disable count overflow soon? */
>>>>> +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT))
>>>>> +               DEBUG_LOCKS_WARN_ON((new_count & HARDIRQ_DISABLE_MASK) +
>>>>> +                                   (10 << HARDIRQ_DISABLE_SHIFT) >
>>>>> +                                   HARDIRQ_DISABLE_MASK);
>>>>> +
>>>>
>>>> This needs a return here right? Else we will see warning for 10 times
>>>> and then overflow happens and we will call _local_interrupt_disable. No?
> 
> Oh, seems I overlooked something... could you elaborate on this? What's
> the scenario in your mind? You said we hit 10 times warning and *then*
> overflow?
> 


(the “10 times” wording was for the possible wraparound.
I didn't know DEBUG_LOCKS_WARN_ON() will turn debug_locks
off after the first warning, I thought it will print 10 times.)

Main concern is the wraparound itself. If the HARDIRQ_DISABLE field reaches
0xff and we increment it once more, the field becomes zero after masking
(ff + 1 -> 100 in the shifted field). Then local_interrupt_enable() can
observe:

         (new_count & HARDIRQ_DISABLE_MASK) == 0

and treat it as the outermost enable, potentially calling
_local_interrupt_enable() while there are still outstanding logical
local_interrupt_disable() users.

So I think the useful debug check is one that catches the count before it
gets close enough to wrap. Thing I wanted to avoid is silently making the
HARDIRQ_DISABLE field look like zero after overflow.

Whether it returns or just warns, I am not sure. As recovery may
not be easy. It is meant more to be a damage contol than recovery.


My line of thought is,

If we return after debug checks in local_interrupt_disable(), we wont advance the preempt count
further, so it wont wrap around. Now, there will be corresponding local_interrupt_enable(),
at some point it will reach 0, we enable the interrupts. There will be some more
local_interrupt_enable() still, but they will be caught with your debug check in
local_interrupt_enable() and preempt count won't be decremented further.
So if we put return we may have a damage control.

>>>>
>>>
>>> DEBUG_LOCKS_WARN_ON() uses debug_locks_off() to avoid this, so we won't
>>> see it 10 times. The reason not using return here, because we would
>>> introduce unpaired local_interrupt_disable() if we returned:
>>
>> Yes, it could be a weird case if the overflow actually happens.
>> So just warning maybe enough to catch such callers.
>>
>> Maybe your kunit test can actually help test the behavior with the loop
>> count.
>>
>>>
>>> 	// hardirq disable count is n
>>> 	local_interrupt_disable(); // hardirq disable count is n + 1
>>>
>>> 	local_interrupt_disable(); <- trigger the warning, if we return
>>> 				   // hardirq disable count is n + 1
>>
>> Likely i am missing to understand.
>>
> 
> No, it was me who misunderstand ;-)
> 
>> Isn't the count incremented earlier than return?
>> I.e even if return happens it should be n + 2 right?
>>
> 
> Yeah, you're right, but then why do we want to return earlier? Since the
> following if:
> 
> 	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> 
> will be false, and we will just return from the function, no?
> 
> Regards,
> Boqun
> 
>>>
>>> 	local_interrupt_enable(); // hardirq disable count is n
>>>
>>> 	local_interrupt_enable(); // hardirq disable count is n - 1
>>>
>>> Regards,
>>> Boqun
>>>
>>>> Not sure, if below is any better? (Igore whitespace mangling)
>>>>
>>>> if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
>>>>       DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) >=
>>>> 			 HARDIRQ_DISABLE_MASK - (10 << HARDIRQ_DISABLE_SHIFT)))
>>>> 	return;
>>>>
>>>>>            /* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
>>>>>
>>>>>            if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
>>>>> @@ -73,6 +80,11 @@ static inline void local_interrupt_enable(void)
>>>>>     {
>>>>>            int new_count;
>>>>>
>>>>> +       /* Unpaired local_interrupt_enable()? Warn and abort. */
>>>>> +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
>>>>> +           DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) == 0))
>>>>> +               return;
>>>>> +
>>>>>            new_count = hardirq_disable_exit();
>>>>>
>>>>>            if ((new_count & HARDIRQ_DISABLE_MASK) == 0) >
>>>>
>>

