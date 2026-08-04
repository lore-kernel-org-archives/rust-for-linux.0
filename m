Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132AB377AB6;
	Tue,  4 Aug 2026 20:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876739; cv=none; b=HzpJrWoD3KAKumR64Fd7c0e4Zyw1Ce+qXXGSA1jtbSV6Y2oPFxMC4pAWq/i6GJiMxBm/jpj2J82Qcvb+oAU8gJxD3rdbIMyPW1tBfi3MmXXvTnsMqUbGGldh4PGvpnlTqCY/I2TX8iRKDDQXCCr+kG3uCmSGCrNucOHf7MUrhDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876739; c=relaxed/simple;
	bh=+rpBN9K0Z2Pzxtxld8VFk2lsr3GsE8HkdDZmN3fzDys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTUzNvARBvXw1gJ7AxunTMOb4X2GNZIbYxDeTP8DdzG1GNdrpDPjQ2MzspU35Tc+fiQVCu12GPHxkJ3D9qwN7RuJri3zfwhUksmFMbrSue8PO3CYI5nxbTAddLYftuZke7h0EHTsdUTfbrZE5MDqSorS7PQB6YSOHZcTYa4EKkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WHdWE34Z; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WHdWE34Z"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JmsvQ1710143;
	Tue, 4 Aug 2026 20:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7ernFk
	cOyRRCLc7tBBUvxlQN9jOsH7jMwwZNZwn9xTE=; b=WHdWE34ZTexHZBdejI16Ci
	nUmpH0QJ7Rn+562igV+JeFizToVylKraapEh06fVqhpTvYdWhbMJPOozTzCdPcWt
	yWaLibPXEA3KC75LtO8c3Ql7QHWWtfQsd8Wrsj6f6ZqwNBHxLTh/GO2mQQKeEAfS
	DERffYf3AmhdxUDgoWq0FkmGvjC7oMdw8Zq1F/W1l73e4DWNerP//eGA0lOuxVVb
	i6SP91AyhOTjAkAQOCW9BkksNfrNxVMJkyPeDEJ1WrWgNSB2veqyOnm0ZqsuCAtT
	f7m5zhH+SQ26vPgIF7/cLGQgRuYcx5ueo+CtJdx5mUDDFLarEDvslo89k3kT86Lw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs77g7kmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 20:51:56 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 674KfJIb012603;
	Tue, 4 Aug 2026 20:51:55 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fsu4qkuux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 20:51:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 674KprdT31195490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Aug 2026 20:51:53 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51AB020043;
	Tue,  4 Aug 2026 20:51:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24AA820040;
	Tue,  4 Aug 2026 20:51:50 +0000 (GMT)
Received: from [9.39.27.209] (unknown [9.39.27.209])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Aug 2026 20:51:49 +0000 (GMT)
Message-ID: <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>
Date: Wed, 5 Aug 2026 02:21:49 +0530
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
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260804161447.84806-6-boqun@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2OCBTYWx0ZWRfX8VyPACoiTaCz
 PwhPHY4TUhnvIqr+poeRbgSuMixhbjy1+MY+ToONH/Wz6WqHF/sYhhCtCdfZhXVfzt6M+lrAP+S
 QmGZAZImhZe869VrUTQDaFQ/rK0qMkgwxBIlVww98IhSrig/3YB6qiI92G2bXpKfs/+Xj9mfltw
 XSR2ueCICs8G9maqZD4uT6lXJJYzcA6MWCZIWK5DLzHVxSqust9N5o/A017G+cyx6Oi5NnkoNR4
 bdFd5BStTwqvIlTfjhmPplCvQwBaO99zOVcRhGtx2mOc8BJiBTRnaqZnwYuKlZ85qtDJKLX6rcd
 lrbpoK9wNOO8gvItgI0r103ckM+TJPOvb17CXbSdo9J08krrglGKIsJrZfpcXjHsxmhJQ6qrsQU
 cwWSe16gytf0Tt9+HxyEQAV7173rtmAY3RNGCXyn8d+JWQ7aMHzC6ARf7N0x5/BGgG4XdY1VLHk
 8bd3vtJfagmt1ONqWig==
X-Authority-Analysis: v=2.4 cv=WIFPmHsR c=1 sm=1 tr=0 ts=6a7250ec cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=20KFwNOVAAAA:8
 a=VwQbUJbxAAAA:8 a=2vqum4C1kBejP-TQVIIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: CjkkpoR1FGW3yIXqPSXrz6EXZS6xEbtY
X-Proofpoint-ORIG-GUID: v7_nEA06XWm63XYkS_6T6lunReV-h7ln
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2OCBTYWx0ZWRfXz+HnSlxt4I7j
 aPGXkiy7mmj2pOduzWpt6VdSXa32/E6KaUeC+Pl+ICAQdjcYxoYdfx8OkBjA1zPWTFnrqVsL6d3
 xvZajAWQPn97oURh946xKXfmw3XIQhA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040168



On 8/4/26 9:44 PM, Boqun Feng wrote:
> Currently the nested interrupt disabling and enabling is represented by
> _irqsave() and _irqrestore() APIs, which are relatively unsafe, for
> example:
> 
> 	<interrupts are enabled as beginning>
> 	spin_lock_irqsave(l1, flag1);
> 	spin_lock_irqsave(l2, flag2);
> 	spin_unlock_irqrestore(l1, flags1);
> 	<l2 is still held but interrupts are enabled>
> 	// accesses to interrupt-disable protected data will cause races
> 
> This is even easier to trigger with guard facilities:
> 
> 	unsigned long flag2;
> 
> 	scoped_guard(spin_lock_irqsave, l1) {
> 		spin_lock_irqsave(l2, flag2);
> 	}
> 	// l2 locked but interrupts are enabled.
> 	spin_unlock_irqrestore(l2, flag2);
> 
> (Hand-to-hand locking critical sections are not uncommon for a
> fine-grained lock design)
> 
> And because of this unsafety, Rust cannot easily wrap the
> interrupt-disabling locks in a safe API, which complicates the design.
> 
> To resolve this, introduce a new set of interrupt disabling APIs:
> 
> *	local_interrupt_disable();
> *	local_interrupt_enable();
> 
> They work like local_irq_save() and local_irq_restore() except that 1)
> the outermost local_interrupt_disable() call saves the interrupt state
> into a per-CPU variable, so that the outermost local_interrupt_enable()
> can restore the state, and 2) a per-CPU counter is added to record the
> nest level of these calls, so that interrupts are not accidentally
> enabled inside the outermost critical section.
> 
> Also add the corresponding spin_lock primitives: spin_lock_irq_disable()
> and spin_unlock_irq_enable(), as a result, code as follows:
> 
> 	spin_lock_irq_disable(l1);
> 	spin_lock_irq_disable(l2);
> 	spin_unlock_irq_enable(l1);
> 	// Interrupts are still disabled.
> 	spin_unlock_irq_enable(l2);
> 
> doesn't have the issue that interrupts are accidentally enabled.
> 
> This also makes the wrapper of interrupt-disabling locks on Rust easier
> to design.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> [boqun: Apply Peter's feedback and fix spell errors reported by Ingo]
> Signed-off-by: Boqun Feng <boqun@kernel.org>
> ---
>   include/linux/interrupt_rc.h     | 82 ++++++++++++++++++++++++++++++++
>   include/linux/preempt.h          |  4 ++
>   include/linux/spinlock.h         | 23 +++++++++
>   include/linux/spinlock_api_smp.h | 43 +++++++++++++++++
>   include/linux/spinlock_api_up.h  | 15 ++++++
>   include/linux/spinlock_rt.h      | 18 +++++++
>   kernel/locking/spinlock.c        | 31 ++++++++++++
>   kernel/softirq.c                 | 28 ++++++++++-
>   8 files changed, 242 insertions(+), 2 deletions(-)
>   create mode 100644 include/linux/interrupt_rc.h
> 
> diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
> new file mode 100644
> index 000000000000..b9a7f05ecf42
> --- /dev/null
> +++ b/include/linux/interrupt_rc.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_INTERRUPT_RC_H
> +#define __LINUX_INTERRUPT_RC_H
> +
> +/*
> + * include/linux/interrupt_rc.h - refcounted local processor interrupt
> + * management.
> + *
> + * Since the implementation of this API currently depends on
> + * local_irq_save()/local_irq_restore(), we split this into its own header to
> + * make it easier to include without hitting circular header dependencies.
> + */
> +
> +#include <linux/irqflags.h>
> +#include <linux/preempt.h>
> +#include <linux/processor.h>
> +#include <linux/smp.h>
> +
> +#ifndef MODULE
> +/* Per-CPU interrupt disabling state for local_interrupt_{disable,enable}(). */
> +DECLARE_PER_CPU(unsigned long, local_interrupt_disable_state);
> +
> +static __always_inline void __local_interrupt_disable(void)
> +{
> +	unsigned long flags;
> +
> +	local_irq_save(flags);
> +	raw_cpu_write(local_interrupt_disable_state, flags);
> +}
> +
> +static __always_inline void __local_interrupt_enable(void)
> +{
> +	unsigned long flags = raw_cpu_read(local_interrupt_disable_state);
> +
> +	local_irq_restore(flags);
> +}
> +
> +#ifndef INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
> +static __always_inline void _local_interrupt_disable(void)
> +{
> +	__local_interrupt_disable();
> +}
> +
> +static __always_inline void _local_interrupt_enable(void)
> +{
> +	__local_interrupt_enable();
> +}
> +#else
> +extern void _local_interrupt_disable(void);
> +extern void _local_interrupt_enable(void);
> +#endif
> +
> +#else /* !MODULE */
> +extern void _local_interrupt_disable(void);
> +extern void _local_interrupt_enable(void);
> +#endif /* !MODULE */
> +
> +static inline void local_interrupt_disable(void)
> +{
> +	int new_count;
> +
> +	WARN_ON_ONCE(in_nmi());
> +
> +	new_count = hardirq_disable_enter();
> +
> +	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> +
> +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> +		_local_interrupt_disable();
> +}

Maximum nesting possible is 256 right? Whats is stopping here to do more than that?
Should there be a warn_on?

> +
> +static inline void local_interrupt_enable(void)
> +{
> +	int new_count;
> +
> +	new_count = hardirq_disable_exit();
> +
> +	if ((new_count & HARDIRQ_DISABLE_MASK) == 0)
> +		_local_interrupt_enable();
> +}
> +
> +#endif /* !__LINUX_INTERRUPT_RC_H */
