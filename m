Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7328E4137B0;
	Mon,  3 Aug 2026 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785760965; cv=none; b=bjAfs1dpnbgsil6kkbsJEc5Acsqh+tXJv0QO0zi86rdnZww4CJwT4s7bzgSCBU6gJKV3KlXs7zVi6R622jWRz2ZFGlUtX+aRk2fs2KCH3xzbqav+Z1CE7Ii2nI63JW23ZcnA24d6gN+Abv9oi+Ql8j1wG4WqB15+YzA4WIfzV/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785760965; c=relaxed/simple;
	bh=qmsuEV+bp0/q8D7ofuZkzrp6vPYie8RxygDkcJ6QirA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoHeZ4GIfBDDMOwVIS4AfGsVi9qvPHzpxL2zQ89tgl/iYH5Hf2JDYbeIsWDDTGYccc6EhysZQ1Do9tv0ih0F++R4Fyb70CXvgQASj07EZapqPnqk47+0mKzGNXMcZQhIqG2OybKARFBJ33ze/Relpqny8QbeO1x1BiP9iCIREWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LsKSXulL; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LsKSXulL"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673CIHmU1939178;
	Mon, 3 Aug 2026 12:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=IPehTeyd9fD12V4YG+PaH+z+/0/db5
	MRBksmfQUr3vw=; b=LsKSXulLT5FCXavn6ufQ1TIRJRR/bQT+Xp7RLMWw86xhk7
	FanoXvsJdEOr7UYtqglT0FmOtpIaRqCWeOqICU0BaF5R+++bLtJBXLTuTaI4yS/E
	Os/whTRvxhX3waX8zdR8CiI4ERpWkfRdmT4tBpm/19SBQqn6vFoRcsyRcEILPpyf
	AtEcNPyXmOzA5W/dVfdRZLo1m/eWH+FCYP39cLEO1a6OAvmsNFJbH6fOEK6xb8Vc
	qrW0x87T5b7LtnKXiixgHceYbPG4kqiGopPPGHv4R1EBXuOYDGfP26eQ2tE8OoJE
	yuGtucAI4wAUuqsXr/BgjjEUOvcHIUR9JvJjzUiw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs67hgqkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 12:42:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 673CfJt9027897;
	Mon, 3 Aug 2026 12:42:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsvmh59y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 12:42:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 673CgK8B25887110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Aug 2026 12:42:20 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79E1C2004B;
	Mon,  3 Aug 2026 12:42:20 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01DF620040;
	Mon,  3 Aug 2026 12:42:20 +0000 (GMT)
Received: from osiris (unknown [9.111.54.91])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  3 Aug 2026 12:42:19 +0000 (GMT)
Date: Mon, 3 Aug 2026 14:42:18 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
        Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
        Lyude Paul <lyude@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
        Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 12/24] s390/preempt: Enable
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
Message-ID: <20260803124218.14792D9d-hca@linux.ibm.com>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-13-boqun@kernel.org>
 <20260803114032.GC687043@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803114032.GC687043@noisy.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExMCBTYWx0ZWRfX6qvSVzlZ+Eyo
 zZs9svSabCiTxRnddEc8R2/aNIM03mhJiQNBm1GJh8iSsWw9ghc9bHZPPHbuhoWNnrBBowaMOWo
 OJdsXze8M4FUpaHXEIADVh6e+ZdQmS8=
X-Authority-Analysis: v=2.4 cv=I7VVgtgg c=1 sm=1 tr=0 ts=6a708caf cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=csveCD0TJrq5keC42VAA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExMCBTYWx0ZWRfXya3Tgv7of0Ij
 HOkc2wTvQVnzwuzfss9m6sxJvq6nJ5OaQ2qZNYPK+R1JKCd6sPfzVH16X7CR0gJsytfJyVIK2sb
 q93NLICXeVpxXJbQxFisemxh+2ZQe0aUnkqt7phsijC15IujgduFUcDKi6mue6lVUetqST3ULoG
 dB6dLqf/9ex8xVSTgb21tEXrvuH4pwRLbRa4kF/KQXKEeidr1AlURm14F3lhdIDq6D2uKV9jcrn
 SIm9q3W5JsNPpb2vKOjZ+bgNFrYcJo0LofQgb5DouFXDAiEN1nqd/CIR+XJKzrQsu7XPFGlA7Qp
 8IykrwsJwsV9uj/JbzHtDNDZwcdobSBjycaXyJ6xaUOLHmemyT8w8/mzv77LA8pt0C7yIf2dXqx
 blfNe6IMT/AvKp7pV+/IqqQU0pvGIxTDqsjkH88sK7Ru8nZajrumSGg/EAfOCYnxZR0HM3N8nYy
 LvxLEEY/auxJojweysA==
X-Proofpoint-ORIG-GUID: iQtphIMzdyn36CQrAuvIMeg3nnYM3N_u
X-Proofpoint-GUID: KOh4Q5_5sk-g9411JdzStURiIJhf4W2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030110

On Mon, Aug 03, 2026 at 01:40:32PM +0200, Peter Zijlstra wrote:
> On Fri, Jul 31, 2026 at 01:30:13PM -0700, Boqun Feng wrote:
> 
> > @@ -26,25 +23,25 @@
> >   */
> >  static __always_inline int preempt_count(void)
> >  {
> > -	unsigned long lc_preempt, count;
> > +	unsigned long lc_preempt;
> > +	int count;
> >  
> > -	BUILD_BUG_ON(sizeof_field(struct lowcore, preempt_count) != sizeof(int));
> > -	lc_preempt = offsetof(struct lowcore, preempt_count);
> > +	lc_preempt = offsetof(struct lowcore, preempt.count);
> >  	/* READ_ONCE(get_lowcore()->preempt_count) & ~PREEMPT_NEED_RESCHED */
> 
> If I'm not mistaken, this comment is no longer accurate, since
> NEED_RESCHED lives in the high word and you're only loading the low
> word.

True. Something like

  	/* READ_ONCE(get_lowcore()->preempt.count) (without PREEMPT_NEED_RESCHED) */

might be better.

> >  	asm_inline(
> > -		ALTERNATIVE("llgt	%[count],%[offzero](%%r0)\n",
> > -			    "llgt	%[count],%[offalt](%%r0)\n",
> > +		ALTERNATIVE("ly		%[count],%[offzero](%%r0)\n",
> > +			    "ly		%[count],%[offalt](%%r0)\n",
> >  			    ALT_FEATURE(MFEATURE_LOWCORE))
> >  		: [count] "=d" (count)
> >  		: [offzero] "i" (lc_preempt),
> >  		  [offalt] "i" (lc_preempt + LOWCORE_ALT_ADDRESS),
> > -		  "m" (((struct lowcore *)0)->preempt_count));
> > +		  "m" (((struct lowcore *)0)->preempt.count));
> >  	return count;
> >  }
