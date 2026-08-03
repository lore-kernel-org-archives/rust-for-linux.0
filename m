Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7281236B912;
	Mon,  3 Aug 2026 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757243; cv=none; b=q5ZUTMT4yzkWrAP5TvQ4NOOXpuueAPDYfPMB2BP9tb9tI9ev4O3SJCDzvKCG9WCHFdGFk3O2ajwVqSCOiRFqSpNa68CzemdK74xuyaoJtr3uJMnpLuHYN+629xlxZ3TECy0RPFOPlPYXqEB0FdnxZfDg+v4233qRXyH66wTqNqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757243; c=relaxed/simple;
	bh=Qp2/haC2Hj7UXkllGQO3a79yOw04vm5NUXFRfVW7CnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhGAKM/z4g/QFPu/yPmrZB6IrhbpTDloyhnuKu+ZAYgjAQbqha18TIOdBF4caq2ZLjvM4X6wd7geVAvLp3uheX3N5/HlBYM8JbwfrodsKkzmt3zTCK3pi2nyhYeiDmKGommGXv7UY3pPxuQS8hJmfPJnI//3tgqFfjoKRRcWogo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dVJAlcFe; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dVJAlcFe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/sQA9tdOYyhNyNFU8p+WKZF7rg+yHpz+WIpSUv1xN6Y=; b=dVJAlcFegiRtXkXp3EwukOmLMF
	/hAbLw7oR+jhBSbv/hjhbzui5xpK6xmI3CRFXlpPMBSbnyJf13BIlQvDHVl9m0M5eT1EzDpViLnSN
	JBVQChGUM6U50ysIogzo+oYaLDqurjFzo020iZIAoJiMp1mG5tQ4JFLPlI7Jd6ckzy79kf+myBPh4
	HzR6EDvf9GfyK+FgBZDWq1vCse8LYkA8im1lwFeCYwf03eIZtdyuQAYDgxcjpeLvsWIlHSEI97Qpc
	h55hR2PvRmhKEXNH3mkP0WVKawrafk5QeUXhkueOwSkfUv6io4CVLaxgzWl7d9EWoPkL+2T4LpPgu
	XrwUrFqw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqr22-00000008va2-0Qvw;
	Mon, 03 Aug 2026 11:40:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C6B7A301127; Mon, 03 Aug 2026 13:40:32 +0200 (CEST)
Date: Mon, 3 Aug 2026 13:40:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH 12/24] s390/preempt: Enable
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
Message-ID: <20260803114032.GC687043@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-13-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731203031.13679-13-boqun@kernel.org>

On Fri, Jul 31, 2026 at 01:30:13PM -0700, Boqun Feng wrote:

> @@ -26,25 +23,25 @@
>   */
>  static __always_inline int preempt_count(void)
>  {
> -	unsigned long lc_preempt, count;
> +	unsigned long lc_preempt;
> +	int count;
>  
> -	BUILD_BUG_ON(sizeof_field(struct lowcore, preempt_count) != sizeof(int));
> -	lc_preempt = offsetof(struct lowcore, preempt_count);
> +	lc_preempt = offsetof(struct lowcore, preempt.count);
>  	/* READ_ONCE(get_lowcore()->preempt_count) & ~PREEMPT_NEED_RESCHED */

If I'm not mistaken, this comment is no longer accurate, since
NEED_RESCHED lives in the high word and you're only loading the low
word.

>  	asm_inline(
> -		ALTERNATIVE("llgt	%[count],%[offzero](%%r0)\n",
> -			    "llgt	%[count],%[offalt](%%r0)\n",
> +		ALTERNATIVE("ly		%[count],%[offzero](%%r0)\n",
> +			    "ly		%[count],%[offalt](%%r0)\n",
>  			    ALT_FEATURE(MFEATURE_LOWCORE))
>  		: [count] "=d" (count)
>  		: [offzero] "i" (lc_preempt),
>  		  [offalt] "i" (lc_preempt + LOWCORE_ALT_ADDRESS),
> -		  "m" (((struct lowcore *)0)->preempt_count));
> +		  "m" (((struct lowcore *)0)->preempt.count));
>  	return count;
>  }
