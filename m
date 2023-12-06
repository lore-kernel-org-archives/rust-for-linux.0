Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WWF8SqBR"
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F481D4B;
	Wed,  6 Dec 2023 08:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wozrE2JVwYdQea39v2odwAxayUucaERPPUek0lDwYT0=; b=WWF8SqBR/ol12mok8XrbFlc7fl
	YEOaC58edDRRgMxpvnnhTeDndYHyL6IFPhnbnJak0ECGFdjfnSbZsm/DgtWQHPQfyvHngJMSDpW4R
	H20VH7TT3uLbOsjTLdB3T0TL/Ub7uCPmjPui9606uR5ttR8eyhz68q7kmru/A7Sfk7in+lNjNHXHg
	wY4WkZXjOc1XsoVdvhcT0Bhn1eU6Ak5n/eGtVCgLHP8sDgsf2EtFaUyD5rtzSuXsFfL4ACpurcwBM
	5sz0j5NB+ZXH/e4d9Kq8vuCtFxK7GDS9ES253aGL/2I39+VCGPkiTSRPoolnNn3I9X6+BbPu49Fm8
	1Nm+8dZw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAuw6-005DDo-34;
	Wed, 06 Dec 2023 16:39:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B8EDC300451; Wed,  6 Dec 2023 17:39:45 +0100 (CET)
Date: Wed, 6 Dec 2023 17:39:45 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: sync: add `CondVar::wait_timeout`
Message-ID: <20231206163945.GC36423@noisy.programming.kicks-ass.net>
References: <20231206-rb-new-condvar-methods-v1-0-33a4cab7fdaa@google.com>
 <20231206-rb-new-condvar-methods-v1-2-33a4cab7fdaa@google.com>
 <ZXChjmoKPj3XnJgG@Boquns-Mac-mini.home>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXChjmoKPj3XnJgG@Boquns-Mac-mini.home>

On Wed, Dec 06, 2023 at 08:30:06AM -0800, Boqun Feng wrote:
> On Wed, Dec 06, 2023 at 10:09:24AM +0000, Alice Ryhl wrote:
> [...]
> > +
> > +/// The return type of `wait_timeout`.
> > +pub enum CondVarTimeoutResult {
> > +    /// The timeout was reached.
> > +    Timeout,
> > +    /// Somebody woke us up.
> > +    Woken {
> > +        /// Remaining sleep duration.
> > +        jiffies: u64,
> 
> I have a Jiffies definition in the my upcoming timer patchset:
> 
> /// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
> pub type Jiffies = core::ffi::c_ulong;
> 
> Maybe you can add that (in a separate patch) in kernel::time?

Urgh, why are we using jiffies in 2023?
