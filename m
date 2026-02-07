Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29EF2F1FEF;
	Sat,  7 Feb 2026 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770484992; cv=none; b=WdVWtuZznBJxAXI50ctakAuh7wBrZwxGRu8I5MdcQvum5PqpqBBTF0mGPgwTpXvEoTk/zcYVq/tluSBUZmM1gzDVdyrf0MzijY4eha7W86RTnkdFZKVy8aQ2E4fhsptA7mz3iGu2xEKqTNK7iZtM2Kvn+HL/uYqwP878XjSJRUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770484992; c=relaxed/simple;
	bh=Ttcxe8/1hOA+BYfLLbdeSrZPazFYl5UiwlHlKmZvAkI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=bIoC+Or0f9nNZnE3Swraa9eXgRdTSfofGFHKBnvttpfEUvWSzgsnJwOiDfopmX/P2szDnU5Gk3ZKM8qrbtjL+TInqwr4V/1Oo66unggJ9j73HR3crMqDceaPyvHNRX5SOQNVq/NgWcjVGiDLtDxFp6t0k4cNWQkljxghtTHOjts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jguw9qss; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jguw9qss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F47C116D0;
	Sat,  7 Feb 2026 17:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770484991;
	bh=Ttcxe8/1hOA+BYfLLbdeSrZPazFYl5UiwlHlKmZvAkI=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=Jguw9qss6MqpWHFRmhstwWMlY5LPBGZGo8+L5+GaKCP2DqeyFICKZvbmdN9yGX6GD
	 anzuRYtsYn8hFxvqA+CgeSqtG/i7jkB+Dthn33VqDOV6rKhXtKakrgRgpjCcu8wQoe
	 LPq48Rd0pT0+iw3m6h2dCvfIlVBICMdPkKP4QUiu/buDbwjIITB2kbicBdR4O0HfOq
	 OkZcvT/kS+5nJfSVUVuYZXvdQl3jkxQJav2cltO9ROSrmXJDHb9aAbrYIxDJl2HCZ7
	 /RY37woGUDBGKSiU4bGkdKUXZh8forwYG42Sk0QOspyZPrqF897sg/kfLNpQ6CQshg
	 NYA4xUR1oeFsQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Feb 2026 18:23:05 +0100
Message-Id: <DG8WJPYVA0H1.1PO95BAW0TK3Y@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 2/4] rust: kvec: implement shrink_to and
 shrink_to_fit for Vec
Cc: <shivamklr@cock.li>, "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Christian Brauner"
 <brauner@kernel.org>, "Carlos Llamas" <cmllamas@google.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Shivam Kalra via B4 Relay" <devnull+shivamklr.cock.li@kernel.org>
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <20260207-binder-shrink-vec-v3-v3-2-8ff388563427@cock.li>
In-Reply-To: <20260207-binder-shrink-vec-v3-v3-2-8ff388563427@cock.li>

On Sat Feb 7, 2026 at 12:32 PM CET, Shivam Kalra via B4 Relay wrote:
> +impl<T, A: Shrinkable> Vec<T, A> {

I don't think we should have a Shrinkable trait with is_shrinkable(). This =
is a
decision taken by the backing Allocator's realloc() function already.

Instead, shrink_to() should be a normal method of Vec<A, T> and just call
A::realloc().

For the temporary workaround we can have a temporary ShrinkQuirk trait that=
 has
methods that take the same arguments as shrink_to().

In Vec::shrink_to() we can then hook in before calling A::realloc() and app=
ly
the quirk.

	fn shrink_to() {
	    if self.shrink_needs_quirk() {
	        return self.shrink_quirk();
	    }

	    // Allocator backend decides.
	    A::realloc();
	}

> +    pub fn shrink_to(&mut self, min_capacity: usize, flags: Flags) -> Re=
sult<(), AllocError> {
> +        let target_cap =3D core::cmp::max(self.len(), min_capacity);
> +
> +        if self.capacity() <=3D target_cap {
> +            return Ok(());
> +        }
> +
> +        if Self::is_zst() {
> +            return Ok(());
> +        }
> +
> +        // SAFETY: `self.ptr` is valid by the type invariant.
> +        if !unsafe { A::is_shrinkable(self.ptr.cast()) } {
> +            return Ok(());
> +        }
> +
> +        // Only shrink if we would free at least one page.
> +        let current_size =3D self.capacity() * core::mem::size_of::<T>()=
;
> +        let target_size =3D target_cap * core::mem::size_of::<T>();
> +        let current_pages =3D current_size.div_ceil(PAGE_SIZE);
> +        let target_pages =3D target_size.div_ceil(PAGE_SIZE);

This is the specific heuristic we use for the Vmalloc shrink workaround
(including when for KVmalloc is_vmalloc_addr() is true) and it doesn't belo=
ng
into the common code path.

But this goes away anyways with the above changes.

> +        if current_pages <=3D target_pages {
> +            return Ok(());
> +        }
> +
> +        if target_cap =3D=3D 0 {
> +            if !self.layout.is_empty() {
> +                // SAFETY: `self.ptr` was allocated with `A`, layout mat=
ches.
> +                unsafe { A::free(self.ptr.cast(), self.layout.into()) };
> +            }
> +            self.ptr =3D NonNull::dangling();
> +            self.layout =3D ArrayLayout::empty();
> +            return Ok(());
> +        }
> +
> +        // SAFETY: `target_cap <=3D self.capacity()` and original capaci=
ty was valid.
> +        let new_layout =3D unsafe { ArrayLayout::<T>::new_unchecked(targ=
et_cap) };
> +
> +        // TODO: Once vrealloc supports in-place shrinking (mm/vmalloc.c=
:4316), this
> +        // explicit alloc+copy+free can potentially be replaced with rea=
lloc.
> +        let new_ptr =3D A::alloc(new_layout.into(), flags, NumaNode::NO_=
NODE)?;
> +
> +        // SAFETY: Both pointers are valid, non-overlapping, and properl=
y aligned.
> +        unsafe {
> +            ptr::copy_nonoverlapping(self.as_ptr(), new_ptr.as_ptr().cas=
t::<T>(), self.len);
> +        }
> +
> +        // SAFETY: `self.ptr` was allocated with `A`, layout matches.
> +        unsafe { A::free(self.ptr.cast(), self.layout.into()) };
> +
> +        // SAFETY: `new_ptr` is non-null because `A::alloc` succeeded.
> +        self.ptr =3D unsafe { NonNull::new_unchecked(new_ptr.as_ptr().ca=
st::<T>()) };
> +        self.layout =3D new_layout;
> +
> +        Ok(())
> +    }
> +
> +    /// Shrinks the capacity of the vector as much as possible.
> +    ///
> +    /// This is equivalent to calling `shrink_to(0, flags)`. See [`Vec::=
shrink_to`] for details.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::alloc::allocator::Vmalloc;
> +    ///
> +    /// let elements_per_page =3D kernel::page::PAGE_SIZE / core::mem::s=
ize_of::<u32>();
> +    /// let mut v: Vec<u32, Vmalloc> =3D Vec::with_capacity(elements_per=
_page * 4, GFP_KERNEL)?;

You can just use VVec<u32>.

> +    /// v.push(1, GFP_KERNEL)?;
> +    /// v.push(2, GFP_KERNEL)?;
> +    /// v.push(3, GFP_KERNEL)?;
> +    ///
> +    /// v.shrink_to_fit(GFP_KERNEL)?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn shrink_to_fit(&mut self, flags: Flags) -> Result<(), AllocErr=
or> {
> +        self.shrink_to(0, flags)
> +    }
> +}
> +
>  impl<T: Clone, A: Allocator> Vec<T, A> {
>      /// Extend the vector by `n` clones of `value`.
>      pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> R=
esult<(), AllocError> {
>
> --=20
> 2.43.0

