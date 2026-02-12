Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB818F4FA;
	Thu, 12 Feb 2026 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890895; cv=none; b=FfKqDCb/djO1A2C0ziqZ1+uxNJAeDOz+BTXOMpwFZ1DRRFzoPaRcoYpsamw4GBZYPaB90sCXQhq6l/aiRtQUj8NfAfrANuVcpAt55KbuOPnNf1GI6ktTQ+TVGVuh511F5I4vQBgWggz4Z+TKe0ze4QBf65HlC/69Cpm5mm9kvbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890895; c=relaxed/simple;
	bh=qPB+/xUaO2BHIvui/E9cRzjBdjbzHXf3E3P+M2lmwgM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=llPyhVWHtj9vpJCRyCI4+voxKuJznD4vbQEK/Kgl7DGkFD9GecH+ZpNXAYULQg964VdktW8V7x1dTjRqdNtV4IiIVswQbZsD1Zt026KzGddL5UrZyRnfNS/nQP9i37oh2L+fAn1CxxgjC+WP5qxp9Rqh+ZWIvYRmtGLyqM+Md8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXmycGC7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXmycGC7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960C4C4CEF7;
	Thu, 12 Feb 2026 10:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770890895;
	bh=qPB+/xUaO2BHIvui/E9cRzjBdjbzHXf3E3P+M2lmwgM=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=eXmycGC7jHzdOHGBkHxhr/hOTAs2eJbM0TD2D8ZcGa3zTMqMrdsnHPKvtHFOSBOrH
	 VT9ECudwzzRIvOTBTbPewXfLlTzNVHvH5Tn/Atgn4zRmw7V9Ld/W7/H50nP3gX6xKe
	 3/JXLdJM5ZNWS34alqu3N+SSELPe+28apjQMYXa+dn+PgPZ2VsOjUHDheDanuYzQi3
	 OQj0vFKZbdq4g65vEDSlxaZpZDI9UPKkZ+q8AWJv1iD840CRXNZNRtOLyBXapnCcFe
	 VfW3YSOD0IURZe00EE5r30AtG78M3L6wu3dvgaei/Wo/k5RPPwm2Zu374j5SV3Fol+
	 Rx7axk/tQQexQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 11:08:09 +0100
Message-Id: <DGCWFFTC3TNK.32I96GCV77PFH@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 1/3] rust: kvec: implement shrink_to for KVVec
Cc: <shivamkalra98@zohomail.in>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Christian Brauner"
 <brauner@kernel.org>, "Carlos Llamas" <cmllamas@google.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Shivam Kalra via B4 Relay"
 <devnull+shivamkalra98.zohomail.in@kernel.org>
References: <20260212-binder-shrink-vec-v3-v4-0-bd02f06bf2cd@zohomail.in>
 <20260212-binder-shrink-vec-v3-v4-1-bd02f06bf2cd@zohomail.in>
In-Reply-To: <20260212-binder-shrink-vec-v3-v4-1-bd02f06bf2cd@zohomail.in>

On Thu Feb 12, 2026 at 9:17 AM CET, Shivam Kalra via B4 Relay wrote:
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ac8d6f763ae81..8524f9f3dff0a 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -9,7 +9,7 @@
>  };
>  use crate::{
>      fmt,
> -    page::AsPageIter, //
> +    page::{AsPageIter, PAGE_SIZE},

Please keep the kernel import style [1].

[1] https://docs.kernel.org/rust/coding-guidelines.html#imports

>  };
>  use core::{
>      borrow::{Borrow, BorrowMut},
> @@ -734,6 +734,82 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -=
> bool) {
>          self.truncate(num_kept);
>      }
>  }
> +// TODO: This is a temporary KVVec-specific implementation. It should be=
 replaced with a generic
> +// `shrink_to()` for `impl<T, A: Allocator> Vec<T, A>` that uses `A::rea=
lloc()` once the
> +// underlying allocators properly support shrinking via realloc.
> +impl<T> Vec<T, KVmalloc> {
> +    /// Shrinks the capacity of the vector with a lower bound.
> +    ///
> +    /// The capacity will remain at least as large as both the length an=
d the supplied value.
> +    /// If the current capacity is less than the lower limit, this is a =
no-op.
> +    ///
> +    /// Shrinking only occurs if the operation would free at least one p=
age of memory.

Since this is now specific to Vec<T, KVmalloc>, the correct statement would=
 be
that for kmalloc() allocations realloc() takes the decision and for vmalloc=
()
allocations it will only be shrunk if at least one page can be freed. Pleas=
e
also add that in the vmalloc() case, we are doing a deep copy.

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// // Allocate enough capacity to span multiple pages.
> +    /// let elements_per_page =3D kernel::page::PAGE_SIZE / core::mem::s=
ize_of::<u32>();
> +    /// let mut v =3D KVVec::with_capacity(elements_per_page * 4, GFP_KE=
RNEL)?;
> +    /// v.push(1, GFP_KERNEL)?;
> +    /// v.push(2, GFP_KERNEL)?;
> +    ///
> +    /// v.shrink_to(0, GFP_KERNEL)?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
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

We should check for is_vmalloc_addr() here and just call realloc() if it is
false.

The reason is that this will ensure that the semantics of this function wil=
l be
as close as possible to the final implementation, which will fully rely on
realloc().

I also understand that calling realloc() if !is_vmalloc_addr() seems
superfluous, but I don't want this code to make assumptions about the seman=
tics
of the backing allocators.

> +        // Only shrink if we would free at least one page.
> +        let current_size =3D self.capacity() * core::mem::size_of::<T>()=
;
> +        let target_size =3D target_cap * core::mem::size_of::<T>();
> +        let current_pages =3D current_size.div_ceil(PAGE_SIZE);
> +        let target_pages =3D target_size.div_ceil(PAGE_SIZE);
> +
> +        if current_pages <=3D target_pages {
> +            return Ok(());
> +        }
> +
> +        if target_cap =3D=3D 0 {
> +            if !self.layout.is_empty() {
> +                // SAFETY: `self.ptr` was allocated with `KVmalloc`, lay=
out matches.
> +                unsafe { KVmalloc::free(self.ptr.cast(), self.layout.int=
o()) };
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

I'd drop this comment as it reads as if this function should be changed, ev=
en
though the TODO comment above already explains that it should be replaced.

> +        let new_ptr =3D KVmalloc::alloc(new_layout.into(), flags, NumaNo=
de::NO_NODE)?;
> +
> +        // SAFETY: Both pointers are valid, non-overlapping, and properl=
y aligned.

If a safety comment justifies multiple things, we usually structure it as a
list.

> +        unsafe {
> +            ptr::copy_nonoverlapping(self.as_ptr(), new_ptr.as_ptr().cas=
t::<T>(), self.len);

NIT: Please move the semicolon at the end of the unsafe block.

> +        }
> +
> +        // SAFETY: `self.ptr` was allocated with `KVmalloc`, layout matc=
hes.

Same here.

> +        unsafe { KVmalloc::free(self.ptr.cast(), self.layout.into()) };
> +
> +        // SAFETY: `new_ptr` is non-null because `KVmalloc::alloc` succe=
eded.
> +        self.ptr =3D unsafe { NonNull::new_unchecked(new_ptr.as_ptr().ca=
st::<T>()) };
> +        self.layout =3D new_layout;
> +
> +        Ok(())
> +    }
> +}
> =20
>  impl<T: Clone, A: Allocator> Vec<T, A> {
>      /// Extend the vector by `n` clones of `value`.
>
> --=20
> 2.43.0

