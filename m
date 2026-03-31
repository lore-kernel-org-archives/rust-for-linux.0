Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C8D317153
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 22:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994825; cv=none; b=o1vPAiT3FO65ZqxpkrHxNMBIaWN2mVuLZUyAkuntLONhdycDTbbsjRn2/jf9ZyPo+xnVkYSbrPVG9kGnC8P0DH9Yiyd2m7EBotJ7OA0/LA4KBUpGFTmVlfj5Df+RO2sNza2JERm37gaBbszaGPnWJq8WmwMlTEgmcQqb3xa0LEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994825; c=relaxed/simple;
	bh=wdInfQg9kOcVxzyZxVKQ6bZ9VDCAaLB9QEe5MLgn8pM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=pYRgl2pc7TspSFQUCm1Z5BA7ww+Ph0R4SRciOFuZ8j04LxdU1hIER5g/wqTl4XU2PLHq1ObFDp9D54odZ0IDwhpzNC8+nj83/N8sYloknPU+bfJ49ifG0j3w90x4J54Y45/s6ujbM8ro0o4npQQhKdlW3hChNquH9EYt/ByhmIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGRuJlp8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGRuJlp8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472E3C19423;
	Tue, 31 Mar 2026 22:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774994825;
	bh=wdInfQg9kOcVxzyZxVKQ6bZ9VDCAaLB9QEe5MLgn8pM=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=jGRuJlp8nyd7J1CRPAbXY1gUQ5PoAXmToLqFSQR13IqFBJGYdB2B6SLst/MoLOig4
	 6rHI82IfJaRbcAIHDfjTMwLzLFOE0YweMWHg2jTANLb9KqC6kCgedYRxI2Sx3MhRQG
	 uLkzZUbhqMSL/dcgENYiisiCB4bwqJLou/2b9OSaaf/l0pcCjzj7Gf+yX61pJMtZn1
	 m0Su+nTkW900O7JFArC3lJLlohijOXVmOSKj5jO3AaXwBmyTPrZogJ59V/X+8S93gC
	 Cwz6+mGe3jJQ5i2H4kRynkyqLFzbIxa4YcxesCTywH+vlQzrShsIpYIPciALe+7M7P
	 IflCvpze7ONkA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 00:07:02 +0200
Message-Id: <DHHB5GGW1QOQ.2IXULYZWQX9MO@kernel.org>
To: "David Rheinsberg" <david@readahead.eu>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC 03/16] rust/alloc: add Vec::into_boxed_slice()
Cc: <rust-for-linux@vger.kernel.org>, <teg@jklm.no>, "Miguel Ojeda"
 <ojeda@kernel.org>
References: <20260331190308.141622-1-david@readahead.eu>
 <20260331190308.141622-4-david@readahead.eu>
In-Reply-To: <20260331190308.141622-4-david@readahead.eu>

On Tue Mar 31, 2026 at 9:02 PM CEST, David Rheinsberg wrote:
> Add `Vec::into_boxed_slice()` similar to
> `std::vec::Vec::into_boxed_slice()` [1].
>
> There is currently no way to easily consume the allocation of a vector.
> However, it is very convenient to use `Vec` to initialize a dynamically
> sized array and then "seal" it, so it can be passed along as a Box:
>
>     fn create_from(src: &[T]) -> Result<KBox<[U]>, AllocError> {
>         let v =3D Vec::with_capacity(n, GFP_KERNEL)?;
>
>         for i in src {
>             v.push(foo(i)?, GFP_KERNEL)?;
>         }
>
>         Ok(v.into_boxed_slice())
>     }
>
> A valid alternative is to use `Box::new_uninit()` rather than
> `Vec::with_capacity()`, and eventually convert the box via
> `Box::assume_init()`. This works but needlessly requires unsafe code,
> awkward drop handling, etc. Using `Vec` is the much simpler solution.
>
> [1] https://doc.rust-lang.org/std/vec/struct.Vec.html#method.into_boxed_s=
lice
>
> Signed-off-by: David Rheinsberg <david@readahead.eu>

Thanks for presenting a user! Please make sure to use scripts/get_maintaine=
r.pl.

Also, this patch has already been posted in [1], so it should be mentioned =
that
this is a v2 and it should include a changelog.

> ---
>  rust/kernel/alloc/kvec.rs | 67 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ac8d6f763ae8..b8b0fa1a7505 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -733,6 +733,73 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -=
> bool) {
>          }
>          self.truncate(num_kept);
>      }
> +
> +    fn shrink_to_fit(&mut self) -> Result<(), AllocError>  {
> +        if Self::is_zst() {
> +            // ZSTs always use maximum capacity.
> +            return Ok(());
> +        }
> +
> +        let layout =3D ArrayLayout::new(self.len()).map_err(|_| AllocErr=
or)?;
> +
> +        // SAFETY:
> +        // - `ptr` is valid because it's either `None` or comes from a p=
revious
> +        //   call to `A::realloc`.
> +        // - `self.layout` matches the `ArrayLayout` of the preceding
> +        //   allocation.
> +        let ptr =3D unsafe {
> +            A::realloc(
> +                Some(self.ptr.cast()),
> +                layout.into(),
> +                self.layout.into(),
> +                crate::alloc::flags::GFP_NOWAIT,

Why? This should be specified by the caller. Besides, I don't see how this =
could
ever end up in memory reclaim in the first place.

> +                NumaNode::NO_NODE,
> +            )?
> +        };
> +
> +        // INVARIANT:
> +        // - `layout` is some `ArrayLayout::<T>`,
> +        // - `ptr` has been created by `A::realloc` from `layout`.
> +        self.ptr =3D ptr.cast();
> +        self.layout =3D layout;
> +        Ok(())
> +    }
> +
> +    /// Converts the vector into [`Box<[T], A>`].
> +    ///
> +    /// Excess capacity is retained in the allocation, but lost until th=
e box
> +    /// is dropped.
> +    ///
> +    /// This function is fallible, because kernel allocators do not guar=
antee
> +    /// that shrinking reallocations are infallible, yet the Rust abstra=
ctions
> +    /// strictly require that layouts are correct. Hence, the caller mus=
t be
> +    /// ready to deal with reallocation failures.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v =3D KVec::<u16>::with_capacity(4, GFP_KERNEL)?;
> +    /// for i in 0..4 {
> +    ///     v.push(i, GFP_KERNEL);
> +    /// }
> +    /// let s: KBox<[u16]> =3D v.into_boxed_slice()?;
> +    /// assert_eq!(s.len(), 4);
> +    /// # Ok::<(), kernel::alloc::AllocError>(())
> +    /// ```
> +    pub fn into_boxed_slice(mut self) -> Result<Box<[T], A>, AllocError>=
 {
> +        self.shrink_to_fit()?;

As mentioned in [1], I think into_boxed_slice() should call A::realloc()
directly; at least use a separate internal helper. shrink_to_fit() will
eventually be exposed to users and the actual semantics is yet to be define=
d.
I.e. it may have additional logic.

The requirement here is not to actually shrink the backing memory, but to
satisfy the safety requirement of A::free(). And the best way to ensure thi=
s is
to call A::realloc() with ArrayLayout::new(self.len()).

IOW, please don't call the above method shrink_to_fit(), but maybe
realloc_to_fit(). If shrink_to_fit() will just end up calling realloc_to_fi=
t()
that's fine.

> +        let (buf, len, _cap) =3D self.into_raw_parts();
> +        let slice =3D ptr::slice_from_raw_parts_mut(buf, len);
> +
> +        // SAFETY:
> +        // - `slice` has been allocated with `A`
> +        // - `slice` is suitably aligned
> +        // - `slice` has an exact length of `len`
> +        // - all elements within `slice` are initialized values of `T`
> +        // - `len` does not exceed `isize::MAX`
> +        // - `slice` was allocated for `Layout::for_value::<[T]>()`

Thanks for adding this! Mind also sending a fix for Box::from_raw() which l=
acks
the safety requirement?

> +        Ok(unsafe { Box::from_raw(slice) })
> +    }
>  }

[1] https://lore.kernel.org/all/20260326095621.846840-1-david@readahead.eu/
