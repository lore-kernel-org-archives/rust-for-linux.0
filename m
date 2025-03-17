Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF5E1A23BC
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742227062; cv=none; b=f3L2usPVl6LlGy04CE4cCxlD8SmX9LIeQ2n3o0UFxuId7MqezJeQ6TCXtiYwPjoXn/7xewykStUL4WcaDMOtAl8fqKKk5uFf82ORwpjWnoAwHfPcWVvOcKLibtBc815uG1ZkohWHbXHjMPku0jR3RWSyypZkc8VZh6LTIAcrj3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742227062; c=relaxed/simple;
	bh=aUudgjOcvTZiN6mU88lVsQQdkvHbFOpLLZ4QggN5sNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MF+r/eY8bFGMN3/StHhEH1OKkaX73tt66yCJ+Ivk9IcuRbFMQK6uGVgLrDUb/DOGCrrG/YkeEJcHuEaSrq5GQ/3r7fNW2CpozAIkschdCDLL+h63r6GGNgI3PEag9lJd007slxjKjpLiBiM9/yp0IqUcedJ+Sp+F3l3sNa7O8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPP8M4m5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPP8M4m5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248E9C4CEE3;
	Mon, 17 Mar 2025 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742227061;
	bh=aUudgjOcvTZiN6mU88lVsQQdkvHbFOpLLZ4QggN5sNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aPP8M4m5L0zeXAzS9nyTopaHUImju13vKGyMpwQoGQ9wDMxNgFj0u+k+LFBg89kE3
	 vXUtDtU5Ztw64YOrs7rnSZR3MjyZd1aWDHtlNv9+3yE3JrNRi0QzokG8spEJb50Djy
	 8MBHQM4nZKPgxZ9/yl1DW1yy+oytPzIR1dXhxpvCdmLj6hdWc91vd9aSA1eTapoLhM
	 cXPDYZbJSO+0mS3IjcLsK+/e8MxFoxByYa7n1N3eglyvL67I/smQLgoKFkprk6x5SQ
	 /KiJH7hOl7EaQFBo0SLbkL2/hpm1wSy88fGdNfLPB+YxxLNZkdcO0nRX56NGqwolvo
	 BIX8vIVbysDIQ==
Date: Mon, 17 Mar 2025 16:57:36 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Tamir Duberstein <tamird@gmail.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of
 Vec::set_len()
Message-ID: <Z9hGcClQXpEYUYZp@cassiopeiae>
References: <Z9XIk3WpzruUfh6O@pollux>
 <Z9bLtgJa3PNB0bkf@pollux>
 <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com>
 <Z9bWODCNNEq3xI51@pollux>
 <D8HVI9K91JWV.NHOPVELH5JE5@proton.me>
 <Z9cfkKTVKtc3imyK@pollux>
 <Z9ch0fgUI-V-rlGr@pollux>
 <D8IG67RM4H53.2K2AW01FZLWJM@proton.me>
 <Z9gDt9JbqvoTFORV@pollux>
 <D8IMOAKHKYGP.32PTT2W55UH6L@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8IMOAKHKYGP.32PTT2W55UH6L@proton.me>

On Mon, Mar 17, 2025 at 02:57:51PM +0000, Benno Lossin wrote:
> On Mon Mar 17, 2025 at 12:12 PM CET, Danilo Krummrich wrote:
> > On Mon, Mar 17, 2025 at 09:52:07AM +0000, Benno Lossin wrote:
> >> On Sun Mar 16, 2025 at 8:09 PM CET, Danilo Krummrich wrote:
> >> > On Sun, Mar 16, 2025 at 07:59:34PM +0100, Danilo Krummrich wrote:
> >> >> But let's define it then; what about:
> >> >> 
> >> >> "[`Vec::set_len`] takes (or kepps) ownership of all elements within the range
> >> >> [0; `new_len`] and abandons ownership of all values outside of this range, if
> >> >> any."
> >> >> 
> >> >> The caller may take ownership of the abandoned elements."
> >> >> 
> >> >> I'd argue that giving up ownership, while offering someone else to take it means
> >> >> that it implies that otherwise we'll just end up forgetting about the value.
> >> >
> >> > Btw. I'd still prefer if we could enforce that the caller has to document what
> >> > should happen to the abandoned value. But I acknowledge that the safety comment
> >> > isn't the scope for it.
> >> >
> >> > It'd be great if e.g. clippy would give us a tool to do something analogous to
> >> > safety comments.
> >> >
> >> > It think it would be useful to enfoce some additional safety documentation. For
> >> > instance, I think the kernel would much benefit if we could enforce that
> >> > mem::forget() must be justified with a comment, since as mentioned ina previous
> >> > mail, it can cause fatal bugs, for instance when used on lock guards.
> >> 
> >> I get where you're coming from, but this probably will very quickly get
> >> out of hand.
> >> 
> >> For example, I can define `forget` safely:
> >> 
> >>     fn forget<T>(value: T) {
> >>         struct Cycle<T> {
> >>             this: RefCell<Option<Arc<Self>>>,
> >>             value: T,
> >>         }
> >>         let cycle = Arc::new(Cycle { this: RefCell::new(None), value });
> >>         *cycle.this.borrow_mut() = Some(cycle.clone());
> >>     }
> >> 
> >> How would you ensure that this kind of pattern doesn't get written
> >> accidentally (or with many indirections)?
> >
> > I don't think that the possibility of writing safe (but yet buggy) code is an
> > argument against having the possibility of enforcing that a caller must write a
> > comment for justification on certain things, such as mem::forget().
> 
> My argument is that the problem of forgetting a value is not
> self-contained like `unsafe` code is. Even if we were to document all
> `forget` or `ManuallyDrop::new` invocations (which we definitely should)
> we wouldn't get the security that one can't accidentally forget a lock
> guard. I'm totally in favor of mandating an explaining comment above
> `forget` calls (but not as a `SAFETY` comment).

Oh, I see where the misunderstanding might lie.

Let's take a look at FileDescriptorReservation::fd_install(). My proposal is to
have something like:

	// SANITY: `fd_install` consumed file descriptor
	core::mem::forget(self);
	// SANITY: `fd_install` consumed file reference
	core::mem::forget(file);

Where we have e.g. clippy to complain if there is no "SANITY" (or whatever we
call it) comment for mem::forget().

I'm not proposing a SAFETY comment.

> 
> > But there's another reason I think having something like this could be
> > problematic: It might set the wrong incentive, as in "hey, I can just use a
> > "sanity requirement" in my function rather figuring out how to ensure it through
> > the type system, etc.".
> 
> I don't understand your point here, can you explain it more?

Does the explanation above make this concern clear for you?
