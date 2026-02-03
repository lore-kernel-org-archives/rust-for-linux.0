Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3132D3EF2;
	Tue,  3 Feb 2026 12:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120934; cv=none; b=jQl+pkVhMHQRTUmrvOTurubKULNmY4/D1rseZFPc2L1+Y4LEM6WFyRQ1uZKY0ZscbqF4ibOaqUIWdZBu4WLKkG8N6W18E1dCw86EyHPolBnsJgVtEFqr/ia+vg8GE4g+/vItblX8+j2fM9dTORQCEbyHI99u5lPomkVLC/TXc7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120934; c=relaxed/simple;
	bh=9/dIHv91x7NR/DRXkEqu/jGuSlV1B1B/eaMjxNrbnTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHy8TOI+babHDXnDumR6dO9rVrknx1ksYaktnJojwpcv2Rsxn6pHtxs8XjQq8s33hmfazBK/jV+b9aq6xDGlbzXkBU6lN+gUA205L/yMS7dNXA7sUDBZ0PkBqgTshT5xA+kMcjdsyJ/dbpf3KuPR5pF4GYqkZo5zxuDhg21AOKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oydIj9yq; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oydIj9yq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GLw0gE9nYQbGwxGuhcmiUO331yv5j837xj6yNb2hXE0=; b=oydIj9yqjdHiQ68X3AkNQgUm9m
	RjC8C9QixlHxeZqJp3hyaYVHFNSf/Jgzy6Y9M1BWXdG3AP5eucJcrLJcWREi+0ZLhEby/v1Fi1N1i
	Et0ILH68p04iYa5ymRSQJgWqFVwkRv0ptJbZJyKmeWI0i1bkD6KNxg4A8t1MEwuXd9r8sZmkINFm/
	0FIyLUYeNcIP6dTcx/vZRX+hZfyzrmPuqm4ZlIpgyY8qfUqBuvf0bhKUe9sm1CWdVulaBkofLVmh4
	8e0+YWOdfMujwf5tjgDQMlY7o4eFLBm/pST2B/jFS9wCDDjkBDrfRbqzpnEgqJeI9ATJogVvchJId
	wr52yhBA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnFJS-0000000GCqC-0HiV;
	Tue, 03 Feb 2026 12:15:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0428E30033D; Tue, 03 Feb 2026 13:15:21 +0100 (CET)
Date: Tue, 3 Feb 2026 13:15:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
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
Message-ID: <20260203121520.GN1282955@noisy.programming.kicks-ass.net>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121223933.1568682-3-lyude@redhat.com>

On Wed, Jan 21, 2026 at 05:39:05PM -0500, Lyude Paul wrote:

>  #define __nmi_enter()						\
>  	do {							\
>  		lockdep_off();					\
>  		arch_nmi_enter();				\
> -		BUG_ON(in_nmi() == NMI_MASK);			\
> -		__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);	\
> +		BUG_ON(__this_cpu_read(nmi_nesting) == UINT_MAX);	\
> +		__this_cpu_inc(nmi_nesting);			\
> +		__preempt_count_add(HARDIRQ_OFFSET);		\
> +		preempt_count_set(preempt_count() | NMI_MASK);	\
>  	} while (0)
>  
>  #define nmi_enter()						\
> @@ -124,8 +128,12 @@ void irq_exit_rcu(void);
>  
>  #define __nmi_exit()						\
>  	do {							\
> +		unsigned int nesting;				\
>  		BUG_ON(!in_nmi());				\
> -		__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);	\
> +		__preempt_count_sub(HARDIRQ_OFFSET);		\
> +		nesting = __this_cpu_dec_return(nmi_nesting);	\
> +		if (!nesting)					\
> +			__preempt_count_sub(NMI_OFFSET);	\
>  		arch_nmi_exit();				\
>  		lockdep_on();					\
>  	} while (0)

While not wrong like last time; it is pretty awful. 

preempt_count_set() is a cmpxchg() loop.

Would not something like so be better?

#define __nmi_enter()                                           \
        do {                                                    \
+               unsigned int _o = NMI_MASK + HARDIRQ_OFFSET;    \
                lockdep_off();                                  \
                arch_nmi_enter();                               \
-               BUG_ON(in_nmi() == NMI_MASK);                   \
-               __preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);       \
+               BUG_ON(__this_cpu_read(nmi_nesting) == ~0U);    \
+               __this_cpu_inc(nmi_nesting);                    \
+               _o -= (preempt_count() & NMI_MASK);             \
+               __preempt_count_add(_o);                        \
        } while (0)


 #define __nmi_exit()                                           \
        do {                                                    \
+               unsigned int _o = HARDIRQ_OFFSET;               \
                BUG_ON(!in_nmi());                              \
-               __preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);       \
+               if (!__this_cpu_dec_return(nmi_nesting))        \
+                       _o += NMI_MASK;                         \
+               __preempt_count_sub(_o);                        \
                arch_nmi_exit();                                \
                lockdep_on();                                   \
        } while (0)


But I'm really somewhat sad that 64bit can't do better than this.


