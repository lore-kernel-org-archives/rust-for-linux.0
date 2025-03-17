Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A058D229B28
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 11:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209981; cv=none; b=G5a0L9itxihKqnjm9uJyeEq9rpNjHV3JbuJ4+k2XogZhoIwb8ECuYBtf0hh49cxgiSR40SrwgmWpYcbwMZMpH+Gc+uzIzyj7ndWZY6D1OR+VsCPq05iLP1OHoYaRtjZf9bz8JjQbcsnjce7TLgCWyWmEL/G0K5O4xkt324WeEBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209981; c=relaxed/simple;
	bh=skbqU8Aid3VbmBA1rh2Y0hg2XUYSEXPn7CD/ZKSkzN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7aT1Ipb7Corddz1dQ5C3xE5w8PZsjoLoAN/7PafcYE9+Ko98oQy4vfSHNbnj2xIdaMHFInhdfl4H6asDgXfdyDqd6gGlhmfAqZDhLZsBkGPg3JJjIbGrlsERT/4NjG6JMF9r8biES9vt/XnOv90Vh9arT99Uw0jqwOrsA1YJsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yaz9v2pF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yaz9v2pF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF58C4CEE3;
	Mon, 17 Mar 2025 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742209981;
	bh=skbqU8Aid3VbmBA1rh2Y0hg2XUYSEXPn7CD/ZKSkzN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yaz9v2pFVfugW6S/r8XhRGrOddpAIdgqolKIbPHxjllaLDMeLvEv0XAKvUZlM7DT0
	 RRFAquwjMCGuiM8YK2E011oolcuJfrQSgzHMV06Kc1x9bq8v2cr5ioEEyW7Lwwb9PA
	 eIaE4aTsampQQF5lV5AzXJUuJ5zkwUTsXShCsAYIPhMdQKOoPrnKD9LRn7KWhO4lnr
	 /v0//E2vMuttk+AW3+GgpXo3LJrPMoTwGy4qo7A5EVV3wzclPAPgJSF6DGC3r4+fyt
	 A69MfyVFpn6hAG5pNK2872wVUFnht75m5/JylkqD/sCoBEiugLWi5uNwXnW5rm0tJr
	 H2941owBVJOmQ==
Date: Mon, 17 Mar 2025 12:12:55 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Tamir Duberstein <tamird@gmail.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of
 Vec::set_len()
Message-ID: <Z9gDt9JbqvoTFORV@pollux>
References: <Z9XIk3WpzruUfh6O@pollux>
 <Z9bEosVk8-0sgSbw@pollux>
 <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com>
 <Z9bLtgJa3PNB0bkf@pollux>
 <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com>
 <Z9bWODCNNEq3xI51@pollux>
 <D8HVI9K91JWV.NHOPVELH5JE5@proton.me>
 <Z9cfkKTVKtc3imyK@pollux>
 <Z9ch0fgUI-V-rlGr@pollux>
 <D8IG67RM4H53.2K2AW01FZLWJM@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8IG67RM4H53.2K2AW01FZLWJM@proton.me>

On Mon, Mar 17, 2025 at 09:52:07AM +0000, Benno Lossin wrote:
> On Sun Mar 16, 2025 at 8:09 PM CET, Danilo Krummrich wrote:
> > On Sun, Mar 16, 2025 at 07:59:34PM +0100, Danilo Krummrich wrote:
> >> But let's define it then; what about:
> >> 
> >> "[`Vec::set_len`] takes (or kepps) ownership of all elements within the range
> >> [0; `new_len`] and abandons ownership of all values outside of this range, if
> >> any."
> >> 
> >> The caller may take ownership of the abandoned elements."
> >> 
> >> I'd argue that giving up ownership, while offering someone else to take it means
> >> that it implies that otherwise we'll just end up forgetting about the value.
> >
> > Btw. I'd still prefer if we could enforce that the caller has to document what
> > should happen to the abandoned value. But I acknowledge that the safety comment
> > isn't the scope for it.
> >
> > It'd be great if e.g. clippy would give us a tool to do something analogous to
> > safety comments.
> >
> > It think it would be useful to enfoce some additional safety documentation. For
> > instance, I think the kernel would much benefit if we could enforce that
> > mem::forget() must be justified with a comment, since as mentioned ina previous
> > mail, it can cause fatal bugs, for instance when used on lock guards.
> 
> I get where you're coming from, but this probably will very quickly get
> out of hand.
> 
> For example, I can define `forget` safely:
> 
>     fn forget<T>(value: T) {
>         struct Cycle<T> {
>             this: RefCell<Option<Arc<Self>>>,
>             value: T,
>         }
>         let cycle = Arc::new(Cycle { this: RefCell::new(None), value });
>         *cycle.this.borrow_mut() = Some(cycle.clone());
>     }
> 
> How would you ensure that this kind of pattern doesn't get written
> accidentally (or with many indirections)?

I don't think that the possibility of writing safe (but yet buggy) code is an
argument against having the possibility of enforcing that a caller must write a
comment for justification on certain things, such as mem::forget().

But there's another reason I think having something like this could be
problematic: It might set the wrong incentive, as in "hey, I can just use a
"sanity requirement" in my function rather figuring out how to ensure it through
the type system, etc.".
