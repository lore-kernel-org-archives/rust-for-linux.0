Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA33334C35
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 22:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770329264; cv=none; b=A1XtP5gz0Mqqa+LXS/TaeuVLugfVoaOAUnbB9arcJV0T6UblQ3Pz3GkOd6l0kmm98n8iWPM7Fcbey6YX21ZvUKa0UVWHiEhWKIG3wUveCMKRQjKncbujoLbHOoqP++Avs7PyqEK8bfs9qtFk/8TbcNjYjmlazrbEXvGXtHrLjiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770329264; c=relaxed/simple;
	bh=hlT4wa+bnKQ92ZzrPZUb/vbH+3YiWNNzj8TtOrlZTSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6CfO7ZQdZNy6f9vhojRhUYXKYVJthHE68MZfJ9um7lLGZJoJVhbHC7PylMm3LB1icGaCQ7J5HMhujHC9egeZtId68O0FoWdi8wrULdVpgDrQor1hh8z2zxC2wPdhFGBeHREOmNq13ZgHBVtVRRXKEpi3O+FcXzYhKvoSQ/fWSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4vkRFE2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4vkRFE2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CE5C4AF0C;
	Thu,  5 Feb 2026 22:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770329264;
	bh=hlT4wa+bnKQ92ZzrPZUb/vbH+3YiWNNzj8TtOrlZTSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k4vkRFE2N0Hn/8xgUWbVQWtFg65+XdZfMSod0Ks0QQXYM4pj5kI4DtKn1RnQp9QDK
	 GzSFyYuua8b6rjQNqJwLpU0YaFnkVT+EBjBT+/yiFWoPnuYfvOtY9VM816/Gna4w0V
	 82tVDxedWmDpkMqXbI13VqjejngNSlNNogKF22B8QkY2dra5pANX3lwwJF29A05san
	 RtuHfgCgGSQJum8s1/9LKd5dlOjjlEfOMWts90moknyhU0hMF/mpZ6GqkgQU8zLmvp
	 yZMZccdmSbuJe7c6ueTyHQP9Tz5c8HnLHOd3HkjSlEdPXO1sKAO3p2dKXDL6vDPPh6
	 6hSbciSqgJfNA==
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8B328F40070;
	Thu,  5 Feb 2026 17:07:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Thu, 05 Feb 2026 17:07:42 -0500
X-ME-Sender: <xms:rhSFadC7rz-1jNLKtnerfddreiGapHfgbVrqUTPQz1GXfdgWZszYFg>
    <xme:rhSFac2IISI7ot7y-UQLHxhvmLrt3BTzWVZKmDcymDVPV7Y5y-oQzT7AjynG9e00n
    rjpRp__QfihCT8ipftzE2lHToJY0wtVbBCXyvHO2qrwBPr9BtQhKJY>
X-ME-Received: <xmr:rhSFadNxWidRhdmBRumowIPGmcgRti7kMfeCWjQ8U5FHonUxv9vTeW9X4Ispp-BLPfGd_D72R6Y_i_-R6o5t_F0Pdu9CtbqB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeeigeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgv
    thgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhihuhguvgesrhgvug
    hhrghtrdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidr
    uggvpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpdhrtghp
    thhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrg
    ihnhhorhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:rhSFaaewBZdDJJeU49jkjnph8uyfaCCjsjFgt_uKXSdLkiNjZEiL5A>
    <xmx:rhSFaZPeO1wbN-y8F6D1jm0m90WuiEBS_GXaEo11mMTsomHXEn4KNg>
    <xmx:rhSFacadZtRvkQYsSFY-fdMcxdLZ8wKqJmqgI1HSuRklrlnX9h81rw>
    <xmx:rhSFadtUt5yeItjw7-Ltn-PVgES0IapBMPHXer_vEv5JXnkCZZXeHg>
    <xmx:rhSFaTo6aKrYBCCR2SYt6zKtbT3oIsFiSqC8QE5U2LbokJzzzR_TQWgv>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 17:07:41 -0500 (EST)
Date: Thu, 5 Feb 2026 14:07:40 -0800
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
Message-ID: <aYUUrHQliNIoe9eQ@tardis.local>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
 <20260203121520.GN1282955@noisy.programming.kicks-ass.net>
 <20260204111234.GA3031506@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204111234.GA3031506@noisy.programming.kicks-ass.net>

On Wed, Feb 04, 2026 at 12:12:34PM +0100, Peter Zijlstra wrote:
[...]
>  DEFINE_PER_CPU_CACHE_HOT(unsigned long, cpu_current_top_of_stack) = TOP_OF_INIT_STACK;
> diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
> index d57cab4d4c06..77defd9624bf 100644
> --- a/include/linux/hardirq.h
> +++ b/include/linux/hardirq.h
> @@ -108,15 +108,14 @@ void irq_exit_rcu(void);
>  	do {							\
>  		lockdep_off();					\
>  		arch_nmi_enter();				\
> -		BUG_ON(in_nmi() == NMI_MASK);			\
> -		__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);	\
> +		__preempt_count_nmi_enter();			\
>  	} while (0)
>  
>  #define nmi_enter()						\
>  	do {							\
>  		__nmi_enter();					\
>  		lockdep_hardirq_enter();			\
> -		ct_nmi_enter();				\
> +		ct_nmi_enter();					\
>  		instrumentation_begin();			\
>  		ftrace_nmi_enter();				\
>  		instrumentation_end();				\
> @@ -125,7 +124,7 @@ void irq_exit_rcu(void);
>  #define __nmi_exit()						\
>  	do {							\
>  		BUG_ON(!in_nmi());				\
> -		__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);	\
> +		__preempt_count_nmi_exit();			\
>  		arch_nmi_exit();				\
>  		lockdep_on();					\
>  	} while (0)
> diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> index d964f965c8ff..7617ca97f442 100644
> --- a/include/linux/preempt.h
> +++ b/include/linux/preempt.h
[...]
> @@ -132,6 +145,27 @@ static __always_inline unsigned char interrupt_context_level(void)
>  # define in_task()		(!(preempt_count() & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET)))
>  #endif
>  
> +#ifndef CONFIG_PREEMPT_LONG
> +DECLARE_PER_CPU(unsigned int, nmi_nesting);
> +
> +#define __preempt_count_nmi_enter()				\
> +	do {							\
> +		unsigned int _o = NMI_MASK + HARDIRQ_OFFSET;	\
> +		__this_cpu_inc(nmi_nesting);			\
> +		_o -= (preempt_count() & NMI_MASK);		\
> +		__preempt_count_add(_o);			\
> +	} while (0)
> +
> +#define __preempt_count_nmi_exit()				\
> +	do {							\
> +		unsigned int _o = HARDIRQ_OFFSET;		\
> +		if (!__this_cpu_dec_return(nmi_nesting))	\
> +			_o += NMI_MASK;				\
> +		__preempt_count_sub(_o);			\
> +	} while (0)
> +
> +#endif
> +

We need to move it into include/linux/hardirq.h because percpu is not
included in <linux/preempt.h>.

Regards,
Boqun

>  /*
>   * The following macros are deprecated and should not be used in new code:
>   * in_softirq()   - We have BH disabled, or are processing softirqs
