Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627343B7B7D
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 17:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777343; cv=none; b=h9oSoDRGWF9/KdJYlrACR4Wj3wDI3eVdj7y5iK+YrtTvTANO3kU0Qccs4GgHqLm5sZ0Cil+03p0BvT1rVsVF0/vF1gmIW5Rd7bUMbJbjHtZI49bs/WIca0KFu/dlUJUdufhQwBxM3OBKbXWgyoW8+3pT3rEZWy9WSKIJSzrAGvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777343; c=relaxed/simple;
	bh=eX715T8+SmFmkPesDh4+/RfW6S+NETonJo5pc1Ow8bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qz5cBZ4J8tM5wqLFm0WXH8qQQKevK5RH4AT2xT0gg/PM2YwkqeZmf67YzdQXQWfhoPhmw06si+rsByK5dOsoG5o9LkHuD9H1DQgX4uLa19dW2qrYS+X6GO6v52DYFFqytGlyqOUBl1G6BmuICbH2XX/uCkaDM1QU+gSAy5XQBbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUhzUKLo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUhzUKLo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B39F1F00A3A;
	Mon,  3 Aug 2026 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777341;
	bh=hfSsczhovVTZziD4hhYKSp8F7+46Okp9ibZaWcyeoMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UUhzUKLofFQRafmMsddDObU7RD0kuwDOEmnf1EDs9DulpUeaV6vAdbi9mmG5fxjad
	 pmBb83xXya7vzbv7Ph5y3znj6pMPCSdMKU6HNMk1jy7FyylAc7aet4qFpirsQgMRmi
	 bnWQqwvOrF/erin0tP7SNSs9FNxmIku2Uw7UI17gNWBby61jg98OM+8WoKQ6jlqP6c
	 W0bfv3bvSJXktgOqfAs+mvq9o9ul0JHNjafof02KdzlDv1muE6rqgQDTg3tYm79nAM
	 lnGXRAF8Z61wlikhxZT32ah+nB2yDtMpGFxCCpsTHkaxdCA2M3nZOVS2U6qZlVHzT5
	 rnEGZVlxeKUyg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9AFB8F40066;
	Mon,  3 Aug 2026 13:15:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 03 Aug 2026 13:15:39 -0400
X-ME-Sender: <xms:u8xwaqN7QqUI6p_tpwjO0bZBBbMGsNy-EUh8YIWA70MtA-bm_F_Kag>
    <xme:u8xwaoY6Doh4UScjPUqIqS4D1JKuv7gDvP1bSQ_TskvtksuZUHQb-SGHtOS1bxBJq
    Qn1GIxyMbRRGpTcn2pBBZKI8pCkpjkTqfESSS5q_srfIBd1ejH2RGQ>
X-ME-Received: <xmr:u8xwaiVUVnJGO5ZXuXwaDSYHC8Cqr5_VZ73u5g8qdCQy7yv2bmMbWzklehU-7LnYBTc1dEhNqakZgPR6vunuEAjgBY2XJVpJ>
X-ME-Proxy-Cause: dmFkZTE4xDmDxCMYKmQGTbLuKSHJtwHdIhBcP4nv9RjiVWTork+UZeECe9b6unISQWsBIR
    0o04dBdJCUIs4Pu1PMTC1wBWg+Xvt/JbMH07dBmMLm0Jq/CwPxYdo14Fw3lHx6FHAO6yi0
    gsPdncSL7LvPMPle9X8b7isw7AxZH+Ly+sL6V7WSMTvZT41iivmxFuKo8ezM9YeTZCxdou
    BODmJ0a2w37ExJzTMHXla7SssfafPFx2azyfHz4VZNPmL/kccJZRVFJrHmYioGWSriTOnH
    fEKeKXZN83t3AeNPzjtFBEaRW6HLtxaXqcWc+cuRHg6RGaXxv+cUryAvz9qFdL+4od6/IM
    u2Ti5tVvZ6ljZhq/eXLYGPgyd5d55Ou8VK4u3eIH8ssnlXUuFwy4UfmiTotIThfWyXAz0N
    88vD9jz5zx++lO66r1P5h+obhxycNG24csy+sBgkTlNZGGpkm/lxwcqmUyccPTItd3mU9T
    CslpQRoHLfFZA/MvymM/uiJDmp45qxTJdTFf16kkp8LSX4XxaQwGWBkGwxaTmIxRAUG5do
    YI3p5z2j/NgxQSUvsEV/RxnO1SCqfJbtm2cVlXHsVN06yoVkZzmfmHShOtqHwv9JTWGjfA
    6keVjey8M1AWx2mJck6M6d9XxPXG5RZZG/35UZWQ1w8y13mRRHEyuswxVlbQ
X-ME-Proxy: <xmx:u8xwavCEIRpOuxM9qvi0VMRP3NlN--gtBmE1HRi5Af1RSjUTFWLtgg>
    <xmx:u8xwamKq2EuXh1yzSGfa1KMx3pO6lJHQ07zgnq9l5vgUKzqfVeUnEA>
    <xmx:u8xwaltnPlkakA4wC6D6XjsylOqmLR47iiDTN0fnJvlpnd8k-rpNIQ>
    <xmx:u8xwamXO_FwFy3Eao0NLTkrWDiKXRphvMbtNiZq79fDfKXSVBTiIMw>
    <xmx:u8xwaoL-4Udp44CeINdy1-6Do2z4ZnX5kFgMjLuZVHsEPZLEtVzD61Sl>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 13:15:39 -0400 (EDT)
Date: Mon, 3 Aug 2026 10:15:38 -0700
From: Boqun Feng <boqun@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 12/24] s390/preempt: Enable
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
Message-ID: <anDMugszR3HoFGaZ@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-13-boqun@kernel.org>
 <20260803114032.GC687043@noisy.programming.kicks-ass.net>
 <20260803124218.14792D9d-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803124218.14792D9d-hca@linux.ibm.com>

On Mon, Aug 03, 2026 at 02:42:18PM +0200, Heiko Carstens wrote:
> On Mon, Aug 03, 2026 at 01:40:32PM +0200, Peter Zijlstra wrote:
> > On Fri, Jul 31, 2026 at 01:30:13PM -0700, Boqun Feng wrote:
> > 
> > > @@ -26,25 +23,25 @@
> > >   */
> > >  static __always_inline int preempt_count(void)
> > >  {
> > > -	unsigned long lc_preempt, count;
> > > +	unsigned long lc_preempt;
> > > +	int count;
> > >  
> > > -	BUILD_BUG_ON(sizeof_field(struct lowcore, preempt_count) != sizeof(int));
> > > -	lc_preempt = offsetof(struct lowcore, preempt_count);
> > > +	lc_preempt = offsetof(struct lowcore, preempt.count);
> > >  	/* READ_ONCE(get_lowcore()->preempt_count) & ~PREEMPT_NEED_RESCHED */
> > 
> > If I'm not mistaken, this comment is no longer accurate, since
> > NEED_RESCHED lives in the high word and you're only loading the low
> > word.
> 
> True. Something like
> 
>   	/* READ_ONCE(get_lowcore()->preempt.count) (without PREEMPT_NEED_RESCHED) */
> 
> might be better.
> 

Thanks, I will update it.

Regards,
Boqun

> > >  	asm_inline(
> > > -		ALTERNATIVE("llgt	%[count],%[offzero](%%r0)\n",
> > > -			    "llgt	%[count],%[offalt](%%r0)\n",
> > > +		ALTERNATIVE("ly		%[count],%[offzero](%%r0)\n",
> > > +			    "ly		%[count],%[offalt](%%r0)\n",
> > >  			    ALT_FEATURE(MFEATURE_LOWCORE))
> > >  		: [count] "=d" (count)
> > >  		: [offzero] "i" (lc_preempt),
> > >  		  [offalt] "i" (lc_preempt + LOWCORE_ALT_ADDRESS),
> > > -		  "m" (((struct lowcore *)0)->preempt_count));
> > > +		  "m" (((struct lowcore *)0)->preempt.count));
> > >  	return count;
> > >  }
