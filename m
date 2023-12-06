Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nv65MBxA"
X-Greylist: delayed 311 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 Dec 2023 12:04:31 PST
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F78718D
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Dec 2023 12:04:31 -0800 (PST)
Date: Wed, 6 Dec 2023 14:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701892756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OKWTVUD6pNI5sfwR2s7nHIQDUaGAUMh3NMmi/eQhsxU=;
	b=nv65MBxAAe0NCibcnLcAiwM+n4KDdBAaLeRDHm2ExyqPwZbt/zn4HI8VawRezcuijp/IeD
	7xPLBTHfO+LQZeXqrFoC2uIRW/27aP7n9yXPcM6VnBg2zMwQ19bwaLXeqwaqTz7548VI9L
	aFdp78NbXUkqAcN4j/oC9zlqf4F+37k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Christian Brauner <brauner@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Kees Cook <keescook@chromium.org>,
	Matthew Wilcox <willy@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 5/7] rust: file: add `Kuid` wrapper
Message-ID: <20231206195911.vcp3c6q57zvkm7bf@moria.home.lan>
References: <20231129-alice-file-v1-0-f81afe8c7261@google.com>
 <20231129-alice-file-v1-5-f81afe8c7261@google.com>
 <20231129-etappen-knapp-08e2e3af539f@brauner>
 <20231129164815.GI23596@noisy.programming.kicks-ass.net>
 <20231130-wohle-einfuhr-1708e9c3e596@brauner>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130-wohle-einfuhr-1708e9c3e596@brauner>
X-Migadu-Flow: FLOW_OUT

On Thu, Nov 30, 2023 at 01:46:36PM +0100, Christian Brauner wrote:
> On Wed, Nov 29, 2023 at 05:48:15PM +0100, Peter Zijlstra wrote:
> > On Wed, Nov 29, 2023 at 05:28:27PM +0100, Christian Brauner wrote:
> > 
> > > > +pid_t rust_helper_task_tgid_nr_ns(struct task_struct *tsk,
> > > > +				  struct pid_namespace *ns)
> > > > +{
> > > > +	return task_tgid_nr_ns(tsk, ns);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(rust_helper_task_tgid_nr_ns);
> > > 
> > > I'm a bit puzzled by all these rust_helper_*() calls. Can you explain
> > > why they are needed? Because they are/can be static inlines and that
> > > somehow doesn't work?
> > 
> > Correct, because Rust can only talk to C ABI, it cannot use C headers.
> > Bindgen would need to translate the full C headers into valid Rust for
> > that to work.
> > 
> > I really think the Rust peoples should spend more effort on that,
> > because you are quite right, all this wrappery is tedious at best.

I suspect even if the manpower existed to go that route we'd end up
regretting it, because then the Rust compiler would need to be able to
handle _all_ the craziness a modern C compiler knows how to do -
preprocessor magic/devilry isn't even the worst of it, it gets even
worse when you start to consider things like bitfields and all the crazy
__attributes__(()) people have invented.

Swift went that route, but they have Apple funding them, and I doubt
even they would want anything to do with Linux kernel C.

IOW: yes, the extra friction from not being able to do full C -> Rust
translation is annoying now, but probably a good thing in the long run.

> The problem is that we end up with a long list of explicit exports that
> also are all really weirdly named like rust_helper_*(). I wouldn't even
> complain if it they were somehow auto-generated but as you say that
> might be out of scope.

I think we'd need help from the C side to auto generate them - what we
really want is for them to be inline, not static inline, but of course
that has never really worked for functions used across a single C file.
But maybe C compiler people are smarter these days?

Just a keyword to to tell the C compiler "take this static inline and
generate a compiled version in this .c file" would be all we need.

I could see it being handy for other things, too: as Linus has been
saying, we tend to inline too much code these days, and part of the
reason for that is we make a function inline because of the _one_
fastpath that needs it, but there's 3 more slowpaths that don't. 

And right now we don't have any sane way of having a function be
available with both inlined and outlined versions, besides the same kind
of manual wrappers the Rust people are doing here... so we should
probably just fix that.
