Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6342E8DEB;
	Wed,  5 Aug 2026 14:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941841; cv=none; b=r+IKO+zSeUBX8d6yo+rQLD9CImMP3I/dV0Nn0kXX1GmTaF9inuiYw4zD1IbLzSIfWhZQ+WNtgmwGjutuuTCjU0+yvsYjp3cl5nrW9Juzcwk1quij0dqQEgzGFa49eTnKAR/IFXN5NDYXGDIWioyN30KZ+9/sDuTVTulZtLoLhxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941841; c=relaxed/simple;
	bh=oqUjLj1DOQdQ5XTYxdqaGu64zDtcQxo8aeD+Nh4GfWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QodN9rX3091nPtYDTe8dLlPzg7ZWtwxoWQXgWMsIDWSjFOdEzVXK7bvsKTmgjbFVpO3ReHVDn2FMMjDR306QFsNBZQ/VafaXDpD8TkmJu+gAnz3fBmTXPHYxfdyH7F2KcNBANh30+JBIHQ/6lyoP46/vskHJrOwNv3KchsxwrPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mATarVUp; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mATarVUp"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675CI0Ov3876144;
	Wed, 5 Aug 2026 14:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=uCLQIt
	LxORjhEbzHmN4WitYSCnXLTB0i1ft+CxfnYzE=; b=mATarVUp00Ntw39AEjic8C
	3abh2n405xHvedRGHQvPFTLioFgt8bHwctBi1CcjIWijT81OMkxBqg00fP+vBzfy
	z9EFt1gmR3D0nKYa4Ih8wXIkV4XbBpMVhpsI90bs4zDOO+XY6mYKdOw2SRZ7U7a2
	T1ujEXNSZhJ5i9efQ9T5gBEw1eICKWGbbacRTXf+ChdR1vSPnoSihQJ1/0tWi3P2
	rqs9RhoIFdJP3Q6LqtVSiJTUFrX6X9CE+f9D3oIacZEqJ+m1Xk3hWahZuxi4NZyC
	GdZPHViy8CP588I52XkdJPgbocTvrObTOkO0ciV93Y6obD+vqdKEvNvmfEIpZHnw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8euu2w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 14:56:57 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 675EuN0j013716;
	Wed, 5 Aug 2026 14:56:56 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fswbgeuak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 14:56:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 675EusfC27656926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Aug 2026 14:56:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0B4A20043;
	Wed,  5 Aug 2026 14:56:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 865E720040;
	Wed,  5 Aug 2026 14:56:50 +0000 (GMT)
Received: from [9.39.28.91] (unknown [9.39.28.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Aug 2026 14:56:50 +0000 (GMT)
Message-ID: <0367352e-5578-4d70-88ae-1bfa446ec377@linux.ibm.com>
Date: Wed, 5 Aug 2026 20:26:49 +0530
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
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-6-boqun@kernel.org>
 <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>
 <anJUuzBcWRwyw6NJ@tardis.local>
 <20260805063645.GO776954@noisy.programming.kicks-ass.net>
 <anLhM8xTlB6bN2N7@tardis.local>
 <1a6dd561-f529-433d-bc09-094924d861fe@linux.ibm.com>
 <anLj_Ryl635sxvI8@tardis.local> <anNAWmjK4_jfMHkl@tardis.local>
 <1eccb39d-f4bf-41d3-a999-e4bf45833c04@linux.ibm.com>
 <anNGwaegou9WJHC_@tardis.local>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <anNGwaegou9WJHC_@tardis.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ewd4czvLh5lBv9OyUj_lXQB5-79Ktgg1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEyMCBTYWx0ZWRfX1G2kcklr9Qm7
 /vFCOMH22Ttm3AchgZDtuEa2oLKAst7Xcwerq0tEcSA95pr2Ogpm7KmfWbXUqGDkrI/rCRzzy4u
 7knswXNLgWsYhsSHsD+uPwDn0fLz8SA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEyMCBTYWx0ZWRfX6EHnV/076nKQ
 5D0UtXj63Jjw5Bk7Q4Y+zhoz90tnMb3JXi5q9rqIlp/p5F0MmurMrRM65x2WY01gGbD8FZzDJfr
 E8nDI/ZkVjKbhEQqnZ4g/hE0cuxhsJtWHmDM48XxxwFXfSxlaegQOQ3q/mVlLXxaz0+6ZtuWyWt
 hf2vdXCvYF0u2qUqdr3bOWuVt7eFqZHDxN6rqT7GeQwpSHI23vKemo67ETHJ3gQxWDAXiH0ouEd
 MZ8Xa6SZRFRBADlLJsYLvQl3F6y/6xR5dp9gBdlFBhHTEw5Pn5Hi7Q9gJzzs0z2gwEnCMFDVgAJ
 klpVN50Apz5gIwLn68h7jihaHU0kkbhylvbXbwfeAJ9BWlWiDCJe2cGTjNp7wYtLp5HrmYmwed6
 BCfuzc/+e3n1Z87ZYPt0ULWx1KIrVZww5E7YgoO8jm7BkxIM1C8fUjUhc3t1ctp4Ho7DYNvuUlf
 W0NLRTymWgn4BFo0UBw==
X-Proofpoint-GUID: 6g1LTHkP280Cb_WM4OaWKzGMtOBq0XRW
X-Authority-Analysis: v=2.4 cv=KfzidwYD c=1 sm=1 tr=0 ts=6a734f39 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=paTTvvJ5BHoDIQFr8ucA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050120



On 8/5/26 7:50 PM, Boqun Feng wrote:
> On Wed, Aug 05, 2026 at 07:40:18PM +0530, Shrikanth Hegde wrote:
>>
>> Hi Boqun,
>>
>>>
>>> Something as below? Going to send it to kernel build bot and see if it
>>> works for all configs.
>>>
>>> ----------------->8
>>> diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
>>> index b9a7f05ecf42..39f30bc65548 100644
>>> --- a/include/linux/interrupt_rc.h
>>> +++ b/include/linux/interrupt_rc.h
>>> @@ -12,6 +12,7 @@
>>>     */
>>>
>>>    #include <linux/irqflags.h>
>>> +#include <linux/debug_locks.h>
>>>    #include <linux/preempt.h>
>>>    #include <linux/processor.h>
>>>    #include <linux/smp.h>
>>> @@ -63,6 +64,12 @@ static inline void local_interrupt_disable(void)
>>>
>>>           new_count = hardirq_disable_enter();
>>>
>>> +       /* Is hardirq disable count overflow soon? */
>>> +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT))
>>> +               DEBUG_LOCKS_WARN_ON((new_count & HARDIRQ_DISABLE_MASK) +
>>> +                                   (10 << HARDIRQ_DISABLE_SHIFT) >
>>> +                                   HARDIRQ_DISABLE_MASK);
>>> +
>>
>> This needs a return here right? Else we will see warning for 10 times
>> and then overflow happens and we will call _local_interrupt_disable. No?
>>
> 
> DEBUG_LOCKS_WARN_ON() uses debug_locks_off() to avoid this, so we won't
> see it 10 times. The reason not using return here, because we would
> introduce unpaired local_interrupt_disable() if we returned:

Yes, it could be a weird case if the overflow actually happens.
So just warning maybe enough to catch such callers.

Maybe your kunit test can actually help test the behavior with the loop
count.

> 
> 	// hardirq disable count is n
> 	local_interrupt_disable(); // hardirq disable count is n + 1
> 
> 	local_interrupt_disable(); <- trigger the warning, if we return
> 				   // hardirq disable count is n + 1

Likely i am missing to understand.

Isn't the count incremented earlier than return?
I.e even if return happens it should be n + 2 right?

> 
> 	local_interrupt_enable(); // hardirq disable count is n
> 
> 	local_interrupt_enable(); // hardirq disable count is n - 1
> 
> Regards,
> Boqun
> 
>> Not sure, if below is any better? (Igore whitespace mangling)
>>
>> if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
>>      DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) >=
>> 			 HARDIRQ_DISABLE_MASK - (10 << HARDIRQ_DISABLE_SHIFT)))
>> 	return;
>>
>>>           /* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
>>>
>>>           if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
>>> @@ -73,6 +80,11 @@ static inline void local_interrupt_enable(void)
>>>    {
>>>           int new_count;
>>>
>>> +       /* Unpaired local_interrupt_enable()? Warn and abort. */
>>> +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
>>> +           DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) == 0))
>>> +               return;
>>> +
>>>           new_count = hardirq_disable_exit();
>>>
>>>           if ((new_count & HARDIRQ_DISABLE_MASK) == 0) >
>>

