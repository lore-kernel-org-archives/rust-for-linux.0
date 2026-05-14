Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4133ADB9A;
	Thu, 14 May 2026 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755896; cv=none; b=k1uC1mJc9irsWZrnqvwgeaISVrraqEVh2M1AD31gvQS1ArrpfJZqa2tVdVk/hfQhudA/PvQMHaoxRZJpKkxOAHLbtkI4/TXHHIwqdBDQddj7fLOfBhGqw7tiQDP75d5mfqiHbfou0AZpxPiCiUVtTZgTsGENhMFu63Tm9AhHWmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755896; c=relaxed/simple;
	bh=t7Mf6gO0qLO9DDT9r+KMvEg2pPFc/idol/aa5LM/lbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTQ9VL7VyjPgpur70PXMKiYwIyoNh6pMNB7+/3ckMJKm4DaHkOit4El7dy3+Rgpnmnh0IDIRd+9ZmI0BOhAwNECseECLTJ6nWB6xdc2WqqFJB4zNH1ElltrKCTv5XovdOPc3i1/b2kfgqYD6Rn5Grp0K78WdYtx/RduMI19fxDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKopkAyu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKopkAyu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE156C2BCB3;
	Thu, 14 May 2026 10:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778755896;
	bh=t7Mf6gO0qLO9DDT9r+KMvEg2pPFc/idol/aa5LM/lbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKopkAyuWWp5LHI67PR6nwmxm5bsWriRheM3jLQvxjP+A0T9/X73BIBPBADsjqMil
	 bR0ityiEasLZNOKKCKiGE401b3Crs2xe1XLKy1FcJGJ0JbMo1of9ZfTrAGP9e2FrCF
	 go6/qu6k/9xkTqMSgKqTrJ5yD/KkXsrc92p/sOlx0bpbpsVbu+Fd3BN7q4eGA2U+xn
	 F/iEhcpnNg91FCW8l0oMl6vSod9VI314iaFokfHxu0dBCCHQ4+u8TFu4DpE8Wvy9kq
	 Jof9FtjrtyY9Vy4akDkxc81TMW3snlt0VQ/4z/wZm0cHGrxA99AZiF0ubuig5c09Xu
	 HbaJsHrPyTjMw==
Date: Thu, 14 May 2026 11:51:29 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust_binder: use lock_vma_under_rcu() in shrinker
Message-ID: <agWpH43TG-E331RP@lucifer>
References: <20260507-binder-shrinker-lockvma-v1-1-76e3406bbfa6@google.com>
 <agHUZ4AKQBgMecBY@lucifer>
 <agLrItFpcWD0N0pO@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agLrItFpcWD0N0pO@google.com>

On Tue, May 12, 2026 at 08:56:02AM +0000, Alice Ryhl wrote:
> On Mon, May 11, 2026 at 02:19:42PM +0100, Lorenzo Stoakes wrote:
> > On Thu, May 07, 2026 at 11:07:47AM +0000, Alice Ryhl wrote:
> > > The shrinker callback currently uses the mmap read trylock operation to
> > > attempt to access the vma, but it's generally better to only lock the
> > > vma instead of the whole mmap when you can.
> > >
> > > When lock_vma_under_rcu() fails, there is no reason to lock the mmap
> > > lock instead because it's already a trylock operation that is allowed to
> > > fail.
> > >
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >
> > This seems similar to Dave's patch [0], not sure if it was inspired by that? :)
> >
> > [0]:https://lore.kernel.org/all/20260429181957.7511C256@davehans-spike.ostc.intel.com/
>
> I was reminded by that change, but it's been on my list since commit
> a0b9b0f1433c ("rust_binder: use lock_vma_under_rcu() in
> use_page_slow()").

Fair :)

>
> > In any case the general approach seems sane to me, as rust code I can't really
> > review it properly, but aside from the comment below (presumably that's fine) it
> > conceptually LGTM so:
> >
> > Acked-by: Lorenzo Stoakes <ljs@kernel.org>
> >
> > > ---
> > >  drivers/android/binder/page_range.rs | 24 +++++++++++-------------
> > >  1 file changed, 11 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
> > > index e54a90e62402..e82a5523804f 100644
> > > --- a/drivers/android/binder/page_range.rs
> > > +++ b/drivers/android/binder/page_range.rs
> > > @@ -705,7 +705,7 @@ fn drop(self: Pin<&mut Self>) {
> > >      let page;
> > >      let page_index;
> > >      let mm;
> > > -    let mmap_read;
> > > +    let vma_read;
> > >      let mm_mutex;
> > >      let vma_addr;
> > >      let range_ptr;
> > > @@ -728,17 +728,18 @@ fn drop(self: Pin<&mut Self>) {
> > >              None => return LRU_SKIP,
> > >          };
> > >
> > > -        mmap_read = match mm.mmap_read_trylock() {
> > > -            Some(guard) => guard,
> > > -            None => return LRU_SKIP,
> > > -        };
> > > -
> > >          // We can't lock it normally here, since we hold the lru lock.
> > >          let inner = match range.lock.try_lock() {
> > >              Some(inner) => inner,
> > >              None => return LRU_SKIP,
> > >          };
> > >
> > > +        vma_addr = inner.vma_addr;
> > > +        vma_read = match mm.lock_vma_under_rcu(vma_addr) {
> > > +            Some(guard) => guard,
> > > +            None => return LRU_SKIP,
> > > +        };
> > > +
> >
> > One question here - are we good to do this _after_ locking the 'inner' lock
> > above?
>
> Well, it's a spinlock so unless lock_vma_under_rcu() can sleep it should
> be fine. Though we also hold *another* spinlock here, so if it can
> sleep, we couldn't take it before `inner` either.

Ack thanks!

>
> Alice
