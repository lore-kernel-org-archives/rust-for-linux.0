Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D3A368D59;
	Mon,  3 Aug 2026 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767025; cv=none; b=PECqc2HHh+9XBEC3nbtfqINlvac7N8KAcnMjTWEFn1Gy1ZLRTCz72CGUFtJi6iq5cJwgLpbU0zMwG1eADJLuJL59fXsXTyzQa3/fA2FB0gsMDwU72p06ZqTG+prlDaL6GXqTM2H+ceh6XzqJOo7HgKS/z5XgE0RgWFxtL3OBhik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767025; c=relaxed/simple;
	bh=fxkQonVO9Rff1Y9V8bg6kixmfUGo70RKbQuuTZH9JTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2KyTiFVk7PmznzlPrsvXqO+N0xSLjIAei2zE9lAQsEbiuSX5mQvWmC9rDb7Ty+/A+FSVnei2Wur9Bs5tfQApOWXUM/mxclsMLo9vSmMTDtR1YbqpCStdWSWqF9wg8kLuuOk+ZxORB6kgmeV9fyWz6fJY3zFpOE56Tv20nvoFp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXwvmP7I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXwvmP7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5763A1F000E9;
	Mon,  3 Aug 2026 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785767023;
	bh=p4M5Ck3vaFA1ijzvvyQQ87ztJ0uCW3dfEB6ZYqWcQsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oXwvmP7Igqol0GEgRaf62V/g8otyRzOzycLrBFQ8xOcdSvP1zw0feg5M1L6nuGTo6
	 yfOAwaanUZdi2D84X0ky3bAePlfXNcadVQtV/fidh3qUcSFbxDOTqLcV+1bWZL0Ky6
	 Fhl666cehngpZw2QBw7RTQVHElQPMGAUrrDrePsCcIQUw1mvOy5GUksw1c+aHsfcEl
	 C32/cPRWsGQt417sItvP2vrdOp5G7rIlsGS9RuA5YCilxHXHIpV0dt/fjqPsuapkuz
	 YPhR+3ZssWtFOrD2uZ40sASJ7fCVy0FfGOHS+gpfHLW43Dxk5JCgAjKvhIHJuxeYT9
	 t7F7p96HCcyRA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8550BF40066;
	Mon,  3 Aug 2026 10:23:42 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 03 Aug 2026 10:23:42 -0400
X-ME-Sender: <xms:bqRwajJPdKB0OP6Tx50CdXWJCYDiJ3Tg1g9QdCWNNCLw4M0y-dQPig>
    <xme:bqRwajB3qSUFLEPZ4KLsrxvBzxtR_E0VtV0HpYeZY1e7sCNpU-MVTOd_k9Oi_gROa
    -M1nNpKB2l97aaGruI5VCTND8PPFxQIk9c1lyjgHYBM-wP-kqulRXg>
X-ME-Received: <xmr:bqRwaov6R5rC0zqDIA9eIiWRQAUAfiaUDGMePbZJpDlBBdjdZDBcx3Uhrlhv2zJ_p3FgLQ-OagEajlXzh4OSnJOjYGfjusBS>
X-ME-Proxy-Cause: dmFkZTFOIMa5HkOlsByHIHFkyZkwbu+g3jJmeZzKNGu7erJa/Zz47nrsFx4C6pdhBM0Nmy
    b011kwlZIibyywX+jGInz8bZ/f7MNYAqro48Y3VhgcOCinNqgtyyfpAyDRA5HbhX3EYAB5
    hkq3mdOYiX2UvFKA/dlguC87Upa2avZM7c+i1X9ywYTVLmarsDCvilWY+zh4oqzh/42yh+
    l2CCaAV8538xlMPvvpMKUC93aagVndBw4eKPxcb401evLHULE10xbPuvVMHrPs7Eun6P1h
    aovPizZBSLPUtuiI1zVcoY5s8YJB+ttPhAB50O5Nb0P4frF+MIu0qfzmpxXmmNMGFVxJVL
    f7BHTGsWjoGwe8+eWUnIIl8tGJL3WiAHPVTP9rm5b6402VTrz15PMicq5lqWvL8sDFC57i
    VErHfCzouq9sPqVA2g2XmUGY9tMuuRunKlnmMgJo2UM0dR65rF1K2H33j9rsrzntMDmaWg
    r0qYKby0OSRivdjKGAQQZGja8Ip1uogy/PgfAXQLZic1+e/gowENR2g0TAHflMbp6bypJN
    MZqEJzmMCEHaoxS0iXuedLPTDXwMWllv1Fjnezg60LatgBRRPGWQABQwiv2ZIAtkQqBId9
    LseXpSc48NKG3cDWsxarsm8h6uQK6O7xBb6JSNhBiY48OZPwkxKwWSPsLW/g
X-ME-Proxy: <xmx:bqRwahT6E5siaTy85tO19qxdxLDrA-uBiLhixQ7La-g99tsPCYTkrw>
    <xmx:bqRwavKr8KQXCiKOILFI8AFl_AevIvowh46KyYhbkg3Xk4tEQ4y9tg>
    <xmx:bqRwakvfugZN04-VRyiHp3DcPsBZ8_q42qAK5g5QcfKECZ4LGRqCOg>
    <xmx:bqRwam8L3euu2bFtLkxgzWnNcqzoezJYeEnO0t0nYnWnqZh3W5Uf0g>
    <xmx:bqRwau1ptvy5LmY6n-myP4CajL-ZKsgaVQSS8yaFtEGq1Q1JJO82pGv8>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 10:23:42 -0400 (EDT)
Date: Mon, 3 Aug 2026 07:23:40 -0700
From: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Bert Karwatzki <spasswolf@web.de>, Harry Yoo <harry@kernel.org>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org
Subject: Re: rust compile failure in next-20260730
Message-ID: <anCkbMyUIscmAheK@tardis.local>
References: <20260731122826.737703-1-spasswolf@web.de>
 <20260731192522.GA1014697@ax162>
 <DKFD0ZKHC2I8.19PUYUR6N6KFN@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKFD0ZKHC2I8.19PUYUR6N6KFN@garyguo.net>

On Mon, Aug 03, 2026 at 02:57:49PM +0100, Gary Guo wrote:
> On Fri Jul 31, 2026 at 8:25 PM BST, Nathan Chancellor wrote:
> > + folks from e5e86df8b666
> >
> > On Fri, Jul 31, 2026 at 02:28:25PM +0200, Bert Karwatzki wrote:
> >> With next-20260730 building a kernel with CONFIG_RUST=y fails with
> >> the following error:
> >> 
> >>  RUSTC L rust/kernel.o
> >> error[E0308]: mismatched types
> >>      --> rust/kernel/sync/poll.rs:175:44
> >>       |
> >>   175 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
> >>       |                  ------------------------- ^^^^^^^^^^^^^^^^ expected `*mut kvfree_rcu_head`, found `*mut callback_head`
> >>       |                  |
> >>       |                  arguments to this function are incorrect
> >>       |
> >>       = note: expected raw pointer `*mut bindings::kvfree_rcu_head`
> >>                  found raw pointer `*mut bindings::callback_head`
> >> note: function defined here
> >>      --> /mnt/data/linux-forest/linux-next/rust/bindings/bindings_generated.rs:73708:12
> >>       |
> >> 73708 |     pub fn kvfree_call_rcu(head: *mut kvfree_rcu_head, ptr: *mut ffi::c_void);
> >>       |            ^^^^^^^^^^^^^^^
> >> 
> >> error: aborting due to 1 previous error
> >> 
> >> For more information about this error, try `rustc --explain E0308`.
> >> make[5]: *** [rust/Makefile:781: rust/kernel.o] Fehler 1
> >> make[4]: *** [Makefile:1420: prepare] Fehler 2
> >> make[3]: *** [debian/rules:80: build-arch] Fehler 2
> >> 
> >> Reverting the following commits:
> >> ef32a74f8f6a ("mm/slab: introduce kfree_rcu_nolock()")
> >> bdd0cc9f0ffc ("mm/slab: introduce struct kvfree_rcu_head for kvfree_rcu batching")
> >>     
> >> make the compilation work again.   
> >
> > This is a collision between commit e5e86df8b666 ("rust: poll: use
> > kfree_rcu() for PollCondVar") in the char-misc tree and the
> > aforementioned commit bdd0cc9f0ffc ("mm/slab: introduce struct
> > kvfree_rcu_head for kvfree_rcu batching") in the slab tree.
> >
> > Something like this avoids the error for me but I am not sure if it is
> > a proper fix.
> >
> > diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
> > index 684dfa242b1a..5b12d5d4e9af 100644
> > --- a/rust/kernel/sync/poll.rs
> > +++ b/rust/kernel/sync/poll.rs
> > @@ -124,6 +124,9 @@ pub struct PollCondVarBox {
> >  struct PollCondVarBoxInner {
> >      #[pin]
> >      inner: PollCondVar,
> > +    #[cfg(CONFIG_KVFREE_RCU_BATCHED)]
> > +    rcu: Opaque<bindings::kvfree_rcu_head>,
> > +    #[cfg(not(CONFIG_KVFREE_RCU_BATCHED))]
> >      rcu: Opaque<bindings::callback_head>,
> 
> We could also unconditionally use `kvfree_rcu_head` here, and
> add
> 
>     #[cfg(not(CONFIG_KVFREE_RCU_BATCHED))]
>     pub type kvfree_rcu_head = callback_head;
> 
> to bindings.rs?
> 

This option is currently not maintainable unless it becomes a
maintainer-aware way to handle things like this.

> (Or even better, changing `#define` to `typedef` so bindgen takes care of
> everything).
> 

Yes, this is better IMO, but it's up to slab maintainers. :-)

Regards,
Boqun

> Best,
> Gary
> 
