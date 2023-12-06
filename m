Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vWdnhMnK"
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63002D3;
	Wed,  6 Dec 2023 08:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GDb7VcIuAlj7p6a+uRK8czAqVjt+vCV92iGoS2eIJsE=; b=vWdnhMnKagysIvOHbp7KeWA46B
	pzZhVeoYXslp+ZfacdNXyKWWFf5IG2XagfhGB15eZTWexsOZBVImNvJAY2dv/3eEknOL1WQqtolnF
	WvU1fwFzV7F2Dk0ZsL5aYCzYtPNt3CF9Vm0lomRIW5ZTNSQE1xWSrjNq6Zr/r8NrVylXKUEtb0usK
	bMD4HCpqmseWudNQrZDjiPV8oIjxHCwFIJA4aY/4MK2HhQrH/3ukIpk+0/QCU1FAiOHusVh8fmrQ1
	/v4oW2vUKrnyyLFIJOZ76Kd6oa55a0BAHry2nPN9B9IBZm5LBZ1MWlp9HvIbmMAXqhaF4R6ePaTf1
	5DMT/yOQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rAv98-00358V-Li; Wed, 06 Dec 2023 16:53:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4F93E300451; Wed,  6 Dec 2023 17:53:14 +0100 (CET)
Date: Wed, 6 Dec 2023 17:53:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/2] rust: sync: add `CondVar::wait_timeout`
Message-ID: <20231206165314.GD36423@noisy.programming.kicks-ass.net>
References: <20231206-rb-new-condvar-methods-v1-0-33a4cab7fdaa@google.com>
 <20231206-rb-new-condvar-methods-v1-2-33a4cab7fdaa@google.com>
 <ZXChjmoKPj3XnJgG@Boquns-Mac-mini.home>
 <20231206163945.GC36423@noisy.programming.kicks-ass.net>
 <CAH5fLgi56i70MaFaoLcWVw+nf-ZvOLpmA8bHNVX=VXTBkcSa4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgi56i70MaFaoLcWVw+nf-ZvOLpmA8bHNVX=VXTBkcSa4Q@mail.gmail.com>

On Wed, Dec 06, 2023 at 05:42:29PM +0100, Alice Ryhl wrote:
> On Wed, Dec 6, 2023 at 5:39 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Wed, Dec 06, 2023 at 08:30:06AM -0800, Boqun Feng wrote:
> > > On Wed, Dec 06, 2023 at 10:09:24AM +0000, Alice Ryhl wrote:
> > > [...]
> > > > +
> > > > +/// The return type of `wait_timeout`.
> > > > +pub enum CondVarTimeoutResult {
> > > > +    /// The timeout was reached.
> > > > +    Timeout,
> > > > +    /// Somebody woke us up.
> > > > +    Woken {
> > > > +        /// Remaining sleep duration.
> > > > +        jiffies: u64,
> > >
> > > I have a Jiffies definition in the my upcoming timer patchset:
> > >
> > > /// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
> > > pub type Jiffies = core::ffi::c_ulong;
> > >
> > > Maybe you can add that (in a separate patch) in kernel::time?
> >
> > Urgh, why are we using jiffies in 2023?
> 
> I assumed that the correct thing here would be to accept the same unit
> as what schedule_timeout takes. Should I be doing something else?

Bah, so we have schedule_hrtimeout() that takes ktime/u64 nsec. But the
'problem' is that hrtimers are written with the expectation to fire,
while the old timers are written with the expectation to not fire.

Timeouts are typically best done with the latter, so in that regard
using schedule_timeout() is right. But it is sad to inflict the
brain-damage that is jiffies onto new code.

Perhaps add schedule_timeout_*msec() wrappers around schedule_timeout*()
and use a consistent sane time unit?

Thomas?
