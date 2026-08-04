Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4740314A4CC;
	Tue,  4 Aug 2026 21:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877808; cv=none; b=Wv3ZTcsSKX1H3eaNDhWAON7NHAoZScRGrDj7H+C2i0fIFY4n4sLMimrsnZJNbmzqOS6BgQYSEmmnFz9ZrHcEwhp8XTBXczCbMIpc6ZWTbWd9AyVKjGSRX4w2kK9OXv+yzgUDJ9Oe1yba4eznDeyaZSrsGnlW3TbgBkngO5t5++I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877808; c=relaxed/simple;
	bh=p21xn3ANRr/rDsUpY7mGg7nHcVzm/XwjDJAPRvfUtYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TORq1WQ7EP5+dFsfRy1VREpU0jGmhJEL87URd1uM2vOyM6alx9GDta5YpzVd4TNJyTMPnVJdc3XWRkLtoKg+OTElmbEQvrk2yzGrgwh3vtRSFG37MNmgAclyIyMIwUUnf97aG5vBi5KMXz1ApViWRcL5pgRaThkf/Yw88QEa6+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=d+W8Eiw8; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="d+W8Eiw8"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JoFRA1859954;
	Tue, 4 Aug 2026 21:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gsCLzT
	pMJgV67osbyvmlNcrn0+/sxcgEEJzRrPXjuOc=; b=d+W8Eiw8IWzkLPbme0vcvo
	6RttnxhjpkcpFrx4TvmU+dgqkyEv8m0btw6V24BM1Ul0XRIID5xEZScK/BJZQfr6
	iEoNfblS9Tl3rYsVkDymxkzrsDurVmJ4Udor216leC3hOGFbeEIQz5YY3whtjO8Y
	I18hrRoW5e0qDZBIxOoYzpGInCmnsPZtBb+XLxbpzF2jBD6iLtYQBYm+f0xZ4mPa
	0hq5P/LYIAOMdPYPWuA1NdE5yY7ZF9DY/0Qn/096tboutIm+WgzmRjFG27NS42Ci
	NAnDn+G2xn1Ysd7xZ9gzIc9OBudEu6Pol/gI/NsMW51EtfVV8GZEEwWRNJISkazg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8euqg37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 21:09:27 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 674KuNfe012949;
	Tue, 4 Aug 2026 21:09:27 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsvmhbpcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 21:09:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 674L9Ooj50921926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Aug 2026 21:09:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D14B720043;
	Tue,  4 Aug 2026 21:09:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA89020040;
	Tue,  4 Aug 2026 21:09:21 +0000 (GMT)
Received: from [9.39.27.209] (unknown [9.39.27.209])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Aug 2026 21:09:21 +0000 (GMT)
Message-ID: <3513cd3b-5b6a-4a3a-bf56-79bbd40b3bec@linux.ibm.com>
Date: Wed, 5 Aug 2026 02:39:20 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/17] preempt: Introduce
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
To: Boqun Feng <boqun@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
        Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-11-boqun@kernel.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260804161447.84806-11-boqun@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 3WVDB3_2oemN9kxlqobNdIknYuZC8xu-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2OCBTYWx0ZWRfXweoznKLHCVwq
 PmUUCw0gF1sGjZlx2CdiwxS58MI5Cs69gJeO43qnOrRGgiJPeZ+ZjI6H1L3JqR2hVMMptHqLqpm
 LuCMK5Iw5o8ERpFARquU9ESasTqNAgc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2OCBTYWx0ZWRfX8objfRGwVARa
 PhF/pjX6jxZTrOWqHkh0YpAv3uRd50Sta4ItqS/Ybp1JL9oOx8pdF7AXZUBuRnbnke/pfWiD2eE
 X6LeEuNamfiewtuUPbUHY/49p4RJm7wi8+vHcRKqxWEIGXE2IqW5EscXVHDPgMj9MaCnP94UaTa
 UJF7vbOkBezcVpHdX+vII6ZwUhZctfvsOzXppy/1vbjbEnjX/nlCyTA2lniaeTMZjf+lM40MQfW
 gRKDUxskfVg603KfFY3qZ7TvN6aEQN4I1/sty5bUWCWmdXHHKHBdumB0fr4xb4/CJSNS0hIC4GA
 NXhByMvXw6DndasoN/iUZOlFa2sWyL135JD6BnI/zDDFNlvRrXhh70JaxMfUGP8VUMFEsS2AuN0
 sxmu+cG1S0BOu+03sMaYAxaC49C8EfFtRnizwCOEnrDqoKrhviJ+Aq8mGACh9FiT87oDj3YVWWg
 zVIAIwoWVM6GHbTHLoA==
X-Proofpoint-GUID: r6sf1QmHOf47dkELY-vOZ9GNazkSonmm
X-Authority-Analysis: v=2.4 cv=KfzidwYD c=1 sm=1 tr=0 ts=6a725508 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=842yOFTvAI7AQeWsB24A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040168

Hi.

> diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> index 33fc4c814a9f..8299657f0f86 100644
> --- a/include/linux/preempt.h
> +++ b/include/linux/preempt.h
> @@ -34,14 +34,31 @@
>    *         SOFTIRQ_MASK:	0x0000ff00
>    * HARDIRQ_DISABLE_MASK:	0x00ff0000
>    *         HARDIRQ_MASK:	0x0f000000
> + *
> + * When HAS_SEPARATE_PREEMPT_RESCHED_BITS=y, PREEMPT_NEED_RESCHED is put in a
> + * separate word and that allows 64bit load-store architectures to 'set'
> + * PREEMPT_NEED_RESCHED without messing up the otherwise symmetric
> + * modifications used on preempt_count and still load the whole thing
> + * (single-copy) atomically, without having to resort to full atomic
> + * operations.
> + *
> + * Because of the above, NMI_MASK bits are different depending on
> + * HAS_SEPARATE_PREEMPT_RESCHED_BITS:
> + *
> + * - HAS_SEPARATE_PREEMPT_RESCHED_BITS=n:
> + *
>    *             NMI_MASK:	0x10000000
>    * PREEMPT_NEED_RESCHED:	0x80000000
> + *
> + * - HAS_SEPARATE_PREEMPT_RESCHED_BITS=y:
> + *             NMI_MASK:	0xf0000000
> + * (PREEMPT_NEED_RESCHED is in a different word)
>    */
>   #define PREEMPT_BITS	8
>   #define SOFTIRQ_BITS	8
>   #define HARDIRQ_DISABLE_BITS	8
>   #define HARDIRQ_BITS	4
> -#define NMI_BITS	1
> +#define NMI_BITS	(1 + 3*IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
>  


Shouldn't testing/selftests/bpf/bpf_experimental.h also be updated with 
same?


>   #define PREEMPT_SHIFT	0
>   #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
> @@ -116,8 +133,8 @@ static __always_inline unsigned char interrupt_context_level(void)
>    * preempt_count() is commonly implemented with READ_ONCE().
>    */
>   
> -#define nmi_count()	(preempt_count() & NMI_MASK)
> -#define hardirq_count()	(preempt_count() & HARDIRQ_MASK)
> +#define nmi_count()		(preempt_count() & NMI_MASK)
> +#define hardirq_count()		(preempt_count() & HARDIRQ_MASK)
>   #ifdef CONFIG_PREEMPT_RT
>   # define softirq_count()	(current->softirq_disable_cnt & SOFTIRQ_MASK)
>   # define irq_count()		((preempt_count() & (NMI_MASK | HARDIRQ_MASK)) | softirq_count())
> diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
> index 88c594c6d7fc..35f546a042b1 100644
> --- a/kernel/Kconfig.preempt
> +++ b/kernel/Kconfig.preempt
> @@ -122,6 +122,10 @@ config PREEMPT_RT_NEEDS_BH_LOCK
>   config PREEMPT_COUNT
>          bool
>   
> +config HAS_SEPARATE_PREEMPT_RESCHED_BITS
> +	bool
> +	depends on PREEMPT_COUNT && 64BIT
> +
>   config PREEMPTION
>          bool
>          select PREEMPT_COUNT
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 9b3f1764fa9e..6d88343c3bad 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5973,8 +5973,13 @@ void preempt_count_add(int val)
>   #ifdef CONFIG_DEBUG_PREEMPT
>   	/*
>   	 * Underflow?
> +	 *
> +	 * Cannot detect underflow based on the current preempt_count() value
> +	 * if using HAS_SEPARATE_PREEMPT_RESCHED_BITS because preempt count takes all 32
> +	 * bits.
>   	 */
> -	if (DEBUG_LOCKS_WARN_ON((preempt_count() < 0)))
> +	if (!IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS) &&
> +	    DEBUG_LOCKS_WARN_ON((preempt_count() < 0)))
>   		return;
>   #endif
>   	__preempt_count_add(val);
> @@ -6006,7 +6011,10 @@ void preempt_count_sub(int val)
>   	/*
>   	 * Underflow?
>   	 */
> -	if (DEBUG_LOCKS_WARN_ON(val > preempt_count()))
> +	unsigned int uval = val;
> +	unsigned int pc = preempt_count();
> +
> +	if (DEBUG_LOCKS_WARN_ON(pc - uval > pc))
>   		return;
>   	/*
>   	 * Is the spinlock portion underflowing?
> diff --git a/kernel/softirq.c b/kernel/softirq.c
> index 0c9b2269a8d6..7980a4a232f9 100644
> --- a/kernel/softirq.c
> +++ b/kernel/softirq.c
> @@ -103,7 +103,13 @@ void _local_interrupt_enable(void)
>   }
>   EXPORT_SYMBOL(_local_interrupt_enable);
>   
> +#ifndef CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
> +/*
> + * Any 32bit architecture that still cares about performance should
> + * probably ensure this is near preempt_count.
> + */
>   DEFINE_PER_CPU(unsigned int, nmi_nesting);
> +#endif
>   
>   /*
>    * SOFTIRQ_OFFSET usage:
> diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
> index bfafe1204c7b..c3d976c801bb 100644
> --- a/lib/locking-selftest.c
> +++ b/lib/locking-selftest.c
> @@ -1429,7 +1429,7 @@ static int unexpected_testcase_failures;
>   
>   static void dotest(void (*testcase_fn)(void), int expected, int lockclass_mask)
>   {
> -	int saved_preempt_count = preempt_count();
> +	long saved_preempt_count = preempt_count();

nit: Isn't preempt_count still returns int?

>   #ifdef CONFIG_PREEMPT_RT
>   	int saved_mgd_count = current->migration_disabled;
>   	int saved_rcu_count = current->rcu_read_lock_nesting;

