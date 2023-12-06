Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dOEK3CCo"
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDC818D
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Dec 2023 12:02:32 -0800 (PST)
Date: Wed, 6 Dec 2023 15:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701892950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IoH7rlLBVR0CZdZD7I1aTbDejNohFwpjFpDildbciTg=;
	b=dOEK3CCoqwwxm9w4xFPD/78KwH+lY5Qdl4gkX+2N2i0EOFTM9ht+Tx5lMlPymo5St807I2
	G5WLl70n+/WTiAi/dp+eYLTDQzyXihLAvesSYdFpj3H7UC3w/KOz435KDSJJ3leJA0TXeG
	H0nTO3ZXz2pZtb2QLuVHx6EK2p1hwSs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
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
Message-ID: <20231206200224.rkdkuozztzg2wusj@moria.home.lan>
References: <20231129-alice-file-v1-0-f81afe8c7261@google.com>
 <20231129-alice-file-v1-5-f81afe8c7261@google.com>
 <20231130103635.GA20191@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130103635.GA20191@noisy.programming.kicks-ass.net>
X-Migadu-Flow: FLOW_OUT

On Thu, Nov 30, 2023 at 11:36:35AM +0100, Peter Zijlstra wrote:
> On Wed, Nov 29, 2023 at 01:12:17PM +0000, Alice Ryhl wrote:
> 
> > diff --git a/rust/helpers.c b/rust/helpers.c
> > index fd633d9db79a..58e3a9dff349 100644
> > --- a/rust/helpers.c
> > +++ b/rust/helpers.c
> > @@ -142,6 +142,51 @@ void rust_helper_put_task_struct(struct task_struct *t)
> >  }
> >  EXPORT_SYMBOL_GPL(rust_helper_put_task_struct);
> >  
> > +kuid_t rust_helper_task_uid(struct task_struct *task)
> > +{
> > +	return task_uid(task);
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_task_uid);
> > +
> > +kuid_t rust_helper_task_euid(struct task_struct *task)
> > +{
> > +	return task_euid(task);
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_task_euid);
> 
> Aren't these like ideal speculation gadgets? And shouldn't we avoid
> functions like this for exactly that reason?

I think asking the Rust people to care about that is probably putting
too many constraints on them, unless you actually have an idea for
something better to do...

(loudly giving the CPU manufacturers the middle finger for making _all_
of us deal with this bullshit)
