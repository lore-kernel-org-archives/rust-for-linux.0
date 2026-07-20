Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEEB305684
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561241; cv=none; b=uxTc62LkWuxbr7965p5K+nN1Q9x7raHbTAN/DhEJh/Uf5QSPhQqvmoLDZFtR3tjgZ9VamgTg58kQMJKbBkKqkfPpYowJ39eP7pKwk4ndZcEhvO7twYPmdxYDd48PoYvn40BvZJrF7AFTWJTUZU2C/VKoLjnbp++18rXlkpzCEdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561241; c=relaxed/simple;
	bh=dbo34G+hq6nj2XXHxDBGWrjz72BgBHhEWkoD0msjstg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpaJ/XOfwstutFpdooEWc+c6sOjWS7yC6tJnM54cUBqmumJG/wOZA2PRTvUh9+G6q/7qrU8dMEmGB4oEFqHvkT6wE+O5anDBDEkE6emAYrt/NUAHXKbCZG4H/+i28dAVTIXbAftsXIli1VaC5mEaAsf7ubzwa9/3mvtzilM8cTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lo3NvqFO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lo3NvqFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB6D1F00A3A;
	Mon, 20 Jul 2026 15:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784561240;
	bh=4WmwLH2cURywrTNSdiADgQpNeoZ65ZUL0UI3rs7xo54=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=Lo3NvqFOe6JK/pxZWhzZ+sehIjxsEpdWS0TI0PUDGbUjwwdQHu9/03aLeBKSDPdlP
	 L/WdfqbErcRc4FMMYKn0aiT1KeD1Os6G8lFvuNVvDXSFVpZFWqdqOUm95GnRksQmou
	 bPlcLpWR+T8ntdzegykgpLOjAfoWHEkITu0u1/S516rDRFhAFUNiRB+p6zh5cGDPWd
	 ERMMikU5MNAf6QSrz0pj1mgv64cUoIHIEsFsDBjJkmFyy0UEI05gkjd8ZdNwd1ezTy
	 hOT3F1qUdTwsLeYwGeBarMD1JksDYjD+0ewxyZu9pMvdUDCjEa7jsDtgLu901XAvQ5
	 vyzc1nALuyvag==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 19F82CE0C57; Mon, 20 Jul 2026 08:27:20 -0700 (PDT)
Date: Mon, 20 Jul 2026 08:27:20 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org,
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org,
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org,
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: bug: prevent dead_code warning from warn_on!'s
 flags constant
Message-ID: <5387e239-5dac-45b7-b153-71e471aa2e4a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260720035510.4048145-1-tomo@flapping.org>
 <al24EJhLfbSoooSQ@MacBook-0RXW5>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al24EJhLfbSoooSQ@MacBook-0RXW5>

On Sun, Jul 19, 2026 at 10:54:24PM -0700, Boqun Feng wrote:
> On Mon, Jul 20, 2026 at 12:55:10PM +0900, FUJITA Tomonori wrote:
> > From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > 
> > Fix the following dead_code warning on some configurations in an
> > atomic development branch:
> > 
> > warning: constant `WARN_ON_FLAGS` is never used
> >    --> /linux/rust/kernel/bug.rs:126:19
> >     |
> > 126 |               const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
> >     |                     ^^^^^^^^^^^^^
> >     |
> >    ::: /linux/rust/kernel/sync/srcu.rs:106:12
> >     |
> > 106 |           if crate::warn_on!(
> >     |  ____________-
> > 107 | |             // SAFETY: By the type invariants, `self` contains a valid and pinned `struct srcu_struct`
> > 108 | |             // and `srcu_readers_active()` only checks the active reader count.
> > 109 | |             unsafe { bindings::srcu_readers_active(ptr) }
> > 110 | |         ) {
> >     | |_________- in this macro invocation
> >     |
> >     = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
> >     = note: this warning originates in the macro `crate::warn_on` (in Nightly builds, run with -Z macro-backtrace for more info)
> > 
> > The warn_on! macro always defines a WARN_ON_FLAGS constant and hands it
> > to warn_flags!. On configurations where warn_flags! does not reference
> > its flags argument (the LOONGARCH/ARM variant, which only calls
> > WARN_ON(), and the !CONFIG_BUG no-op variant), the constant is left
> > unused and triggers a dead_code warning.
> > 
> > The warning only surfaces for callers inside the kernel crate itself:
> > uses from other crates expand an external macro, so the lint is
> > suppressed there.
> > 
> > Rename the constant to _WARN_ON_FLAGS so the underscore marks it as
> > possibly-unused, matching the existing _COND_STR constant in the same
> > macro. The name is still referenceable, so configurations that do use
> > the flags are unaffected.
> > 
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> [Cc Paul]
> 
> Do we need a "Fixes" tag here?

Future bug-chasers would thank us for a "Fixes" tag.  ;-)

> FWIW:
> 
> Reviewed-by: Boqun Feng <boqun@kernel.org>

And thank you both for the fix.  I will keep the Rust-SRCU series.
Until further notice, anyway.  ;-)

							Thanx, Paul
> Regards,
> Boqun
> 
> > ---
> >  rust/kernel/bug.rs | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> > index ed943960f851..2fd7ee25abcb 100644
> > --- a/rust/kernel/bug.rs
> > +++ b/rust/kernel/bug.rs
> > @@ -123,9 +123,9 @@ macro_rules! warn_on {
> >          const _COND_STR: &str = file!();
> >  
> >          if cond {
> > -            const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
> > +            const _WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
> >  
> > -            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
> > +            $crate::warn_flags!(_COND_STR, _WARN_ON_FLAGS);
> >          }
> >          cond
> >      }};
> > 
> > base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed
> > -- 
> > 2.43.0
> > 
