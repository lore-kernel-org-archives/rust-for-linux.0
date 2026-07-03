Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FD51D63F0;
	Fri,  3 Jul 2026 22:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783117976; cv=none; b=gj2OEmEId2zrh0rcDurIo3h5o5t6pWvg1OCD5tNvkdODNd/Y7i5bQjrZ1xSwmdiz4ARu5kztN3k1iiPqRUa+hwErqnE9+Nhyf7t4xxkyIcW0h8USAJxgN4mthp0p1j5oPAwsLaF4x8s6Bbsg//mhs9v/JRayjOKJsRdaulfEPFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783117976; c=relaxed/simple;
	bh=4X09gVt1UoY6Ff764K6DTqWFamtYNvofqDsH615/wh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjLHX/wqrWEOwFYnnWHqcqbYJtHOADrA9/ZH5lya/NVx/VNVKkOusSqhLbZVgP29QfrXvcmWW9LYGauQzA3/mVcXAhwbM0dsgCbzZiddIRZUG051fvPZ0747T2G9fEbvWbWYr5vJhpXxeItbQ1/w+AaRdfB6gv2p7ATCBE4P9uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pG+1RknT; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pG+1RknT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RE2FImyZlyDvXJTGVrg+zlaB1zvdctOTq/7XrcgA4R0=; b=pG+1RknTu6fABOsnJ6feBF5G+Z
	5BXakbeBeyIpD4Lrl6w5obQpXDURVsRjM1Z6QLaQn9kUBtpgLX2oOuDcmYMRC00r9SSNBZU044XUZ
	kHiw/w7LFtuicYRhnxEU1mPZ0KOpU78T94l4sAsjn6sYRCw50SOj1xbXOyv5aPwpLB4WaLdz1o2Bb
	uijVaHHnxO7lhLtSzk9SEaFqgfrq3H9RQBL6S6RYQPGtgQOUM1Y6T7cw+YypyKHCg+DgQe7kKc/+U
	st3ZTLIg27ew+fWdZNiixnI86RMegQ2CLIxpZROa5/+ICab447vuHdYR2CRKFIpRiQLVsLC0HR8je
	u3noZO6g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfmR9-0000000Ay4m-0Nz3;
	Fri, 03 Jul 2026 22:32:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 297AA300402; Sat, 04 Jul 2026 00:32:42 +0200 (CEST)
Date: Sat, 4 Jul 2026 00:32:42 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Gary Guo <gary@garyguo.net>
Cc: Boqun Feng <boqun@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] rust: sync: create lock class using
 `#[track_caller]`
Message-ID: <20260703223242.GS751831@noisy.programming.kicks-ass.net>
References: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
 <20260703140140.GE651302@noisy.programming.kicks-ass.net>
 <DJP06ILK15W3.2XGWM3VAKNF04@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJP06ILK15W3.2XGWM3VAKNF04@garyguo.net>

On Fri, Jul 03, 2026 at 03:24:29PM +0100, Gary Guo wrote:
> On Fri Jul 3, 2026 at 3:01 PM BST, Peter Zijlstra wrote:
> > On Fri, Jul 03, 2026 at 02:47:25PM +0100, Gary Guo wrote:
> >> Currently we're adding more and more macros so that lock classes can be
> >> created. The only purpose served by these macros are to create names and
> >> static lock classes so they can be tracked by lockdep.
> >> 
> >> I've come up with an approach that uses `Location::caller` and Rust's
> >> `#[track_caller]` feature for this purpose instead. `Location::caller()`
> >> will return a `&'static Location<'static>` that lives in `.rodata`. As
> >> only addresses matter for static objects, the address of the `Location`
> >> themselves could be used for lock classes. The `Location` is of 2 * usize +
> >> 8 bytes, so they could host 2 lock class keys, so `DelayedWork` which needs
> >> two lock classes can also use this mechanism.
> >> 
> >> The `Location::caller` could also be used to provide the name; currently,
> >> `optional_name` just uses `file_name:line_number` as the name, and this
> >> information is available in `Location`. However, `Location` encodes them
> >> using file name as a C string plus two `u32`'s for line and column number,
> >> so it cannot provide a single name. I came up with an alternative method,
> >> which is to use a special string, which lockdep can recognize and delegate
> >> back to Rust to print it.
> >
> > Perhaps add some sample output so us simple folk that still think rust
> > looks like line noise can have an idea of what it'll look like. Because
> > I just cannot make much sense of the above.
> 
> The above is mostly about the Rust implementation detail. On the lockdep side,
> essentially the name will be "(rust)", while the actual name can be retrieved
> from the lock class key.
> 
> So for
> 
>     let foo = KBox::pin_init(Mutex::new(42));
> 
> in, say, foo.c:123
> 
> it will eventually call
> 
>     struct rust_location *loc = /* static generated by the Rust compiler */;
>     mutex_init_lockdep(foo, "(rust)", (struct lock_class_key *)loc)
> 
> And when "(rust)" is encountered as lock class name, instead of printing the
> string as is, lockdep will call
> 
>     lockdep_print_rust_name(loc)
> 
> which will be doing essentially
> 
>     pr_cont("foo.c:123");

That seems quite terrible. The C names are based on the expression used
to initialize the class and are thus somewhat descriptive. But file:line
combos are horrid identifiers for locks.

Why would you want to do this?
