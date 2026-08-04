Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D906747AF61;
	Tue,  4 Aug 2026 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874343; cv=none; b=nb3pUl37qfAvB99YcUHIh4qg8R6XZV6rQWZIUY8MZ4+7nV94Zi//ld0qs5smM4kFFvYPz7UKy4UEYyM6S06/7IDVzbHfXyDLzBF5EV0zcdZckFGv1+TXSO/7aGnsatB8xWBjoHORvZ/Bjmgmoc/II56AGVzeWoBj8F258JSHwCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874343; c=relaxed/simple;
	bh=nkVw3aMq7XatDKQwudkBZpNtmUVvJW5KamMz8jiIWKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FuqbEVw/+jPTZiXg95tRWuy3RxMc76OV5ou+Fi8J1bBInBUPjdzbSI8pzO2XGwulW0yiPeR62JStLKC94x8OtVO77cpQsyudaUovkW5ehFg0xcCZZdyyIlGL7jGiUN031EcldiCbkq7rMaQy0RINi9TvnA8MRqEc57NNlztRNV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nRF3NP8M; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nRF3NP8M"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674Jo5Pw1859543;
	Tue, 4 Aug 2026 20:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QBJDBN
	S/78YZvDno5mLz9Us9RPEoc05oaTYaNHUn5xA=; b=nRF3NP8M4nDconFvKfyFPj
	w7LLpu9z+k8YYkgQ2HWAuOzRQasalxGUcq2bzMvqFlOWXUdvpa3irDTIVKlo83/a
	6kih2mXyygZr6HpSwjPSVY/MpaeIRgsM5l+FActe2xdffSz0VFKBgKRXasP48dvw
	v74WJAcC4Qia9Fp0L4vSU7EKMXKKwXVvnlwifz8U6GHh0LjnU3FKsMjC7IOtGRwm
	Xrt1JMARvsRl7wMBy81wFlFx25mq+nPKkz5l/MhTfwV/8c8fW6sYI76N/Z3qLU/J
	mmIoLMCRGsRtECnzlqpLkgxZeVuiRsJri/NVeU+xJQCy9i5J5ETLR510kHJs9LBQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8euq9mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 20:11:55 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 674KBJYx025644;
	Tue, 4 Aug 2026 20:11:54 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsvmhbgpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 20:11:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 674KBq0i28442968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Aug 2026 20:11:52 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A48D820043;
	Tue,  4 Aug 2026 20:11:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41A1120040;
	Tue,  4 Aug 2026 20:11:49 +0000 (GMT)
Received: from [9.39.27.209] (unknown [9.39.27.209])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Aug 2026 20:11:49 +0000 (GMT)
Message-ID: <2a9aec78-fe1b-49c9-884f-a59eb36c8905@linux.ibm.com>
Date: Wed, 5 Aug 2026 01:41:48 +0530
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
X-Proofpoint-ORIG-GUID: Ens6O40a7TE4yzmYogM-L86PRSJ_GViP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MCBTYWx0ZWRfX+QDHBLCczLTB
 2N6J5++bGOByXufmDmaJ8UAwAkMobeNmnZLmjwPGuZHFE1wxN0K2ZmHlPt+CRbm6pzuyr3tFAFL
 hH5cTPlOACqgeNyaFB1WWBaEl32GsnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MCBTYWx0ZWRfX4227pYUAY40c
 Tv+p+TGPxGppqWDyOQUr6Rp5ttK8D2l5WjbGuvMILcbVLqZbXnOadgjZJclwyOafOByv+5vXtBB
 F/Sl4gJy8hpNws2vkiugXW/jfScbJQCvTaVuuNDFuLKMMXyyyOU8zzBKzvKpmnzo800ivjPEZ7F
 3ZmDKJUDBnoiu/O+5arVVb4avLZqHU2wpN2PoyGB3XkHGoNt6LKJILjT5k8vBy2Gu4r8HzG6l2G
 HJJYbyNRJD6Ta3VwZh1rwmKAY9PjUqavpDwpe/0koG9fcXFxdcViKRpqTI6k2DLkuVNBRH3jedo
 3HpxK0i2Czd8juN6rLnJ8w5Pg7JwIJNG2Jm/hC7cXCF1eiSg6olVOJLY22s2tC6pwUzwZfQJs8b
 wXnMKXRWEXmz+41vzk/ZzNwvwJrtupulfTpDDdpZVdCzFq8tzq2wrFAc5kmIllY+JPfNb0SFgak
 VioM+OvfAwnEZunvKZw==
X-Proofpoint-GUID: 7PjqqsxZLKef0b0JjLCFoG1bTFFDuvM8
X-Authority-Analysis: v=2.4 cv=KfzidwYD c=1 sm=1 tr=0 ts=6a72478c cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=8qcXNv606LjFGKxQDKUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1011 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040160

Hi Boqun,

On 8/4/26 9:44 PM, Boqun Feng wrote:
> With the changes that enable preempt count to track IRQ disabling
> nesting, we don't have enough bits in 32-bit preempt count
> implementation, as a result we move NMI nesting bits out of the 32-bit
> preempt count. However on the architectures that can support 64-bit
> preempt count implementation, we can keep the NMI nesting bits in the
> 32-bit preempt count and avoid maintaining NMI nesting bits outside of
> the same cache line.
> 

[...]

> --- a/include/linux/hardirq.h
> +++ b/include/linux/hardirq.h
> @@ -10,8 +10,6 @@
>   #include <linux/vtime.h>
>   #include <asm/hardirq.h>
>   
> -DECLARE_PER_CPU(unsigned int, nmi_nesting);
> -
>   extern void synchronize_irq(unsigned int irq);
>   extern bool synchronize_hardirq(unsigned int irq);
>   
> @@ -94,6 +92,37 @@ void irq_exit_rcu(void);
>   #define arch_nmi_exit()		do { } while (0)
>   #endif
>   
> +#ifdef CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
> +static __always_inline void __preempt_count_nmi_enter(void)
> +{
> +	__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);
> +}
> +
> +static __always_inline void __preempt_count_nmi_exit(void)
> +{
> +	__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);
> +}
> +#else
> +DECLARE_PER_CPU(unsigned int, nmi_nesting);
> +
> +#define __preempt_count_nmi_enter()				\
> +	do {							\
> +		__preempt_count_add(HARDIRQ_OFFSET);		\

nit: This limit is because to have the same behavior as other case when
NMI_BITS=4 right?
It is not easy to infer that from comment.

> +		/* Maximum NMI nesting is 15. */		\
> +		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
> +		__this_cpu_inc(nmi_nesting);			\
> +		preempt_count_set(preempt_count() | NMI_MASK);  \


Is there a reason preempt count updates are split rather than
folded into a single preempt_count update?

> +	} while (0)
> +
> +#define __preempt_count_nmi_exit()				\
> +	do {							\
> +		__preempt_count_sub(HARDIRQ_OFFSET);		\
> +		if (!__this_cpu_dec_return(nmi_nesting))	\
> +			preempt_count_set(preempt_count() & ~NMI_MASK); \
> +	} while (0)
> +
> +#endif
> +
>   /*
>    * NMI vs Tracing
>    * --------------
> @@ -110,18 +139,14 @@ void irq_exit_rcu(void);
>   	do {							\
>   		lockdep_off();					\
>   		arch_nmi_enter();				\
> -		/* Maximum NMI nesting is 15. */		\
> -		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
> -		__this_cpu_inc(nmi_nesting);			\
> -		__preempt_count_add(HARDIRQ_OFFSET);		\
> -		preempt_count_set(preempt_count() | NMI_MASK);	\
> +		__preempt_count_nmi_enter();			\
>   	} while (0)
>   
>   #define nmi_enter()						\
>   	do {							\
>   		__nmi_enter();					\
>   		lockdep_hardirq_enter();			\
> -		ct_nmi_enter();				\
> +		ct_nmi_enter();					\
>   		instrumentation_begin();			\
>   		ftrace_nmi_enter();				\
>   		instrumentation_end();				\
> @@ -129,12 +154,8 @@ void irq_exit_rcu(void);
>   
>   #define __nmi_exit()						\
>   	do {							\
> -		unsigned int nesting;				\
>   		BUG_ON(!in_nmi());				\
> -		__preempt_count_sub(HARDIRQ_OFFSET);		\
> -		nesting = __this_cpu_dec_return(nmi_nesting);	\
> -		if (!nesting)					\
> -			preempt_count_set(preempt_count() & ~NMI_MASK);	\
> +		__preempt_count_nmi_exit();			\
>   		arch_nmi_exit();				\
>   		lockdep_on();					\
>   	} while (0)
