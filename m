Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E063B343D75;
	Wed,  5 Aug 2026 14:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939051; cv=none; b=Xqe5ojegMSf5wvRwpsdRSaEwFQ9gEka5GjZA6Wrizi6V0CoiHtf7XNulOiUUgbgYpDmoLBjPrDm063KUYA87PNygMae/fDo/PfLuspT+tbCAfGMr45Xzha6eF9AWol/15yKft5PSwXdBFIf0fdoWh0Mmsp2mD3nhM9cbSRAcKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939051; c=relaxed/simple;
	bh=VsTTwDhDqPrpa6tCh5HL6Xkh9fVFu8+dBPhoP5uyD58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EbrbNB2weE2XsVVcSvxg/4oWoWuLhFF32B6KGGW2i8Mx79i3tSIfFQsUId0RPwKm+4Pylib2821GSTmPwPG3zogFDwGr6eLlDmW2B2LrwNP3qjd1uQU3zllzjfbP4OrF2PvkUFirCnCdlv+eRbwGKG0kppMSIlPdbnzFw340aM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=NJj8tHPU; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="NJj8tHPU"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675CHdW23725283;
	Wed, 5 Aug 2026 14:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qo1gJM
	MCsAZ1yvevoK0L3CRdEtvjSLGcWA6nJk/eQsg=; b=NJj8tHPUxnkHR5tl/7d1eq
	UQozvI5GU2Mf8HfE9ZilHW9B8J4uxkOl0aOvnGdX2qb4KzIGE7Wvo3RspdPFTXRt
	8YAIi+f3+P6Dn4CFkozhf8T4VG0wudf10oi0PXef156sTR6gBAcR0lAAnqB5x11R
	aa3LNmNsMYaX+cv1Ad+DGgDl89SnVdL28qKoukNRpbeHlxwMZnKQnOEhM0v+9Xf9
	bv/zOpRKB8djZw+ilv5WeXT2m3LzgzplaiDQfio/J3wulyIA+23Ixzt0H++lVhyY
	57u7w/YIVtLZ6hgGwoW510vQm60w0zjBtvkcvXGFi85vsQP37YLKDCGcLYn4IJLQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs67hu66q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 14:10:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 675DuKM5010371;
	Wed, 5 Aug 2026 14:10:24 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsv4k6uxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 14:10:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 675EAMNw49807746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Aug 2026 14:10:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 624282005A;
	Wed,  5 Aug 2026 14:10:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34D012004B;
	Wed,  5 Aug 2026 14:10:19 +0000 (GMT)
Received: from [9.39.28.91] (unknown [9.39.28.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Aug 2026 14:10:18 +0000 (GMT)
Message-ID: <1eccb39d-f4bf-41d3-a999-e4bf45833c04@linux.ibm.com>
Date: Wed, 5 Aug 2026 19:40:18 +0530
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
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <anNAWmjK4_jfMHkl@tardis.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfX74Ec7Q1hiLaa
 yl74p0SWZA5fL8AgIewl6akwOSIoOQXBluTYoZA8CKIM+Gr6ABXVne7TAsZOoAcrrbLpMZvn+Pf
 z2cHDk0X1JOg7wWaxCUKbx/Bt/Oy/n4=
X-Authority-Analysis: v=2.4 cv=I7VVgtgg c=1 sm=1 tr=0 ts=6a734451 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=hEbQ7Tl1ZR_Rb_8NvXQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfXzhZYdR5pKfuy
 8EaNnwHoOo78XnxFtgDXD8rbqUpq22fjNRNauJe/yEy4DEE8W/pCla4CxyOW8MnEfDbruK5SzLX
 ZQJX7I6nSTlhYCH4yqdOMewdNAFjIyvDqs93ZKzu/YAqpDKJfAhBf1Z1B9GDBcys98CpPlo8j9e
 sCSQrAsUgt4mq/UB/weW/sCI/J5aFkMEBxdYVPVUo66pltGKkER/artluYkHMlS6gpytiBlBW5Z
 q8USwKKQXKM1J2zRzLHzBXwUBoS7bg64NkbUCKLNukk3RqRWPeYaCivXnskYn0iKx6E+g48dZak
 c8Kldo4l3EoFL+ptqy/m9b9/U008bug55mdfylQ7Mnw+IFaH7vAvI0sWPtgw7kD1OtOTqUo4Bs8
 H9J58jUt83GvlPE31HNOQvyb9vkMfgOfzcVnj7pCz4IF/EaRkMIEB8Aqkw8W9bryO2TDU40QPTS
 Q+cP1QZYUi0PMIBNITw==
X-Proofpoint-ORIG-GUID: Hk-BXlC6adMQK1bTkCSweXPMbPY0fGSz
X-Proofpoint-GUID: rbY_2OXMoandAqJWvY8VErLtKCwBKVe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050111


Hi Boqun,

> 
> Something as below? Going to send it to kernel build bot and see if it
> works for all configs.
> 
> ----------------->8
> diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
> index b9a7f05ecf42..39f30bc65548 100644
> --- a/include/linux/interrupt_rc.h
> +++ b/include/linux/interrupt_rc.h
> @@ -12,6 +12,7 @@
>    */
> 
>   #include <linux/irqflags.h>
> +#include <linux/debug_locks.h>
>   #include <linux/preempt.h>
>   #include <linux/processor.h>
>   #include <linux/smp.h>
> @@ -63,6 +64,12 @@ static inline void local_interrupt_disable(void)
> 
>          new_count = hardirq_disable_enter();
> 
> +       /* Is hardirq disable count overflow soon? */
> +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT))
> +               DEBUG_LOCKS_WARN_ON((new_count & HARDIRQ_DISABLE_MASK) +
> +                                   (10 << HARDIRQ_DISABLE_SHIFT) >
> +                                   HARDIRQ_DISABLE_MASK);
> +

This needs a return here right? Else we will see warning for 10 times
and then overflow happens and we will call _local_interrupt_disable. No?

Not sure, if below is any better? (Igore whitespace mangling)

if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
     DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) >=
			 HARDIRQ_DISABLE_MASK - (10 << HARDIRQ_DISABLE_SHIFT)))
	return;

>          /* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> 
>          if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> @@ -73,6 +80,11 @@ static inline void local_interrupt_enable(void)
>   {
>          int new_count;
> 
> +       /* Unpaired local_interrupt_enable()? Warn and abort. */
> +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
> +           DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) == 0))
> +               return;
> +
>          new_count = hardirq_disable_exit();
> 
>          if ((new_count & HARDIRQ_DISABLE_MASK) == 0) >

