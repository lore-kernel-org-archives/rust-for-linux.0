Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9CF2E3377
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 21:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742159862; cv=none; b=jaG9s8VPvN5JftB4XVTVB8McFfHwVBmIFzGeJy3jqYgzPrqi5tdpBPuEC07WinyB8LP/OXA9MXIJexzImJXRjzvEg4SWpeYvXSFJalNlCzgwFVibjSy/8TAgbVXNZSp6sY836SI2L3bIqmZgskq+hxR6sqKfUpd7fxxApEdWdIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742159862; c=relaxed/simple;
	bh=lPJshHhUrsfpBFjP5Uc1F5Fknx1r6lSbSEsu4mTwygA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lM0FSb8RlyAwlvvAm7DJOPJbU4Huw6CY1lQTJCZ2pMiT8yMQR3XatZsDS+TiqL0szt77AtXqRTWkXGYQyDkwDFaXioGcnxvufskHoTKRpqOmIeQNJyvKZJKX7wa72liSXgn10epTT2DMJ+d8soT0jcKs/6AFt5dBw9BBWagBbwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iINjC/Td; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iINjC/Td"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950DCC4CEDD;
	Sun, 16 Mar 2025 21:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742159862;
	bh=lPJshHhUrsfpBFjP5Uc1F5Fknx1r6lSbSEsu4mTwygA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iINjC/TdzxW3ATAhzpSQwcoiIgltSO0v9UhO5dR+A5zq7eFfRcZebD7uNXtT59Qqx
	 r45I+lhWs19NFK88XfbPmxTikig/JWCEkCQ/bJYFSVDbITw/a8PiIvnn8vVvo2UY6B
	 Eh1svD53JQQUMP8i+84E3Lf2mjs/7yDU/lbaoDR3PalqzY2sUciE8QwQd1ZqYLFkuy
	 XZAJ3TUl41NugZ8u6zQkqLVHlWwZrVrJm68RjkB4Cu515E8jQW53FXCnuPLGjZJvzc
	 tV+C70WF4E6ngjOhKr8p9QBx3MuuGsvFWu+2ZyUSUL0tyC15kQRJaIeu01n4I4FGlr
	 ybosiSuO8aQ9Q==
Date: Sun, 16 Mar 2025 22:17:36 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of
 Vec::set_len()
Message-ID: <Z9c_8AQWgW70XH1U@pollux>
References: <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com>
 <Z9bLtgJa3PNB0bkf@pollux>
 <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com>
 <Z9bWODCNNEq3xI51@pollux>
 <D8HVI9K91JWV.NHOPVELH5JE5@proton.me>
 <Z9cfkKTVKtc3imyK@pollux>
 <Z9ch0fgUI-V-rlGr@pollux>
 <CAJ-ks9=b-uMCLMMKT-9emgrrUXeaA50DBSEAWjSD+uHHZu-i9Q@mail.gmail.com>
 <Z9c6e8cbdFMTT6K0@pollux>
 <CAJ-ks9=J1hsnFvKzAOwi918UiP49-mmSki=aH2dhiSr7WAqrPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9=J1hsnFvKzAOwi918UiP49-mmSki=aH2dhiSr7WAqrPQ@mail.gmail.com>

On Sun, Mar 16, 2025 at 05:10:30PM -0400, Tamir Duberstein wrote:
> On Sun, Mar 16, 2025 at 4:54 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Sun, Mar 16, 2025 at 03:30:27PM -0400, Tamir Duberstein wrote:
> > > On Sun, Mar 16, 2025 at 3:09 PM Danilo Krummrich <dakr@kernel.org> wrote:
> > > >
> > > > On Sun, Mar 16, 2025 at 07:59:34PM +0100, Danilo Krummrich wrote:
> > > > > But let's define it then; what about:
> > > > >
> > > > > "[`Vec::set_len`] takes (or kepps) ownership of all elements within the range
> > > > > [0; `new_len`] and abandons ownership of all values outside of this range, if
> > > > > any."
> > > > >
> > > > > The caller may take ownership of the abandoned elements."
> > > > >
> > > > > I'd argue that giving up ownership, while offering someone else to take it means
> > > > > that it implies that otherwise we'll just end up forgetting about the value.
> > > >
> > > > Btw. I'd still prefer if we could enforce that the caller has to document what
> > > > should happen to the abandoned value. But I acknowledge that the safety comment
> > > > isn't the scope for it.
> > > >
> > > > It'd be great if e.g. clippy would give us a tool to do something analogous to
> > > > safety comments.
> > > >
> > > > It think it would be useful to enfoce some additional safety documentation. For
> > > > instance, I think the kernel would much benefit if we could enforce that
> > > > mem::forget() must be justified with a comment, since as mentioned ina previous
> > > > mail, it can cause fatal bugs, for instance when used on lock guards.
> > >
> > > There are other examples; ManuallyDrop and Box::leak are two that
> > > immediately come to mind.
> > >
> > > But focusing on Vec::set_len again, could we return a mut slice to the
> > > tail when new_len < old_len? Something like:
> > >
> > > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > > index c12844764671..e5f857d723ec 100644
> > > --- a/rust/kernel/alloc/kvec.rs
> > > +++ b/rust/kernel/alloc/kvec.rs
> > > @@ -191,9 +191,16 @@ pub fn len(&self) -> usize {
> > >      /// - If `new_len` is greater than `self.len`, all elements
> > > within the interval
> > >      ///   [`self.len`,`new_len`) must be initialized.
> > >      #[inline]
> > > -    pub unsafe fn set_len(&mut self, new_len: usize) {
> > > +    pub unsafe fn set_len(&mut self, new_len: usize) -> &mut [T] {
> > >          debug_assert!(new_len <= self.capacity());
> > > -        self.len = new_len;
> > > +        let old_len = core::mem::replace(&mut self.len, new_len);
> > > +        match old_len.checked_sub(new_len) {
> > > +            None => &mut [],
> > > +            Some(len) => {
> > > +                // SAFETY: ...
> > > +                unsafe {
> > > slice::from_raw_parts_mut(self.as_mut_ptr().add(new_len), len) }
> > > +            }
> > > +        }
> > >      }
> > >
> > > Would that sufficiently communicate to the caller that they should
> > > deal with this memory?
> >
> > I think that is a good idea. I'm not sure I like that this is useless when
> > new_len > self.len, but it also doesn't hurt too much, I guess.
> >
> > Feel free to send the corresponding patch. Also, feel free to add the
> > corresponding comment about ownership while at it.
> >
> > I'd just drop this patch then.
> 
> Looking at the usages of `set_len` that we have today (excluding the
> pending nova patches for truncate and resize), they all amount to
> `v.set_len(v.len() + n)`. What do you think about replacing this
> method with `inc_len`? In the nova patches the only need for
> decrementing the length would be in `truncate`, so `dec_len` can be
> introduced there or the length can be decremented there directly.

I think splitting it in inc_len() and dec_len() is good. Note that other methods
need dec_len() too, e.g. [1].

[1] https://lore.kernel.org/rust-for-linux/20250311-iov-iter-v1-4-f6c9134ea824@google.com/
