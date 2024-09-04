Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A7A1CF5FB
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Sep 2024 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725445801; cv=none; b=FZukqbrcB0NW4/JXFNSdoagWRct7XqoUoj5/uhPVU2HQ62rZI8IjhpiL5ep6f0wodNBwMEiRlv5nBXQhaEiugDza0rxfAYO7kSPYFjgM2SeJwjpRyVjSmLxRrYj1Nq/6ukRxfqvC+h6w6fpQryKLpIrNjEh+nLinmVEbJglZYYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725445801; c=relaxed/simple;
	bh=xOaRnjRgKSTBXoBrckkAh6k5MeQKaIjjbdVTeFSuRLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+U7dYP6fY8zQc5yxv1mk0u+gE/Ez3p6JYEmuinysdppnAGb0v1nV6t8Uz1GRzFudt5BFsO2O7RODQe7fYRcolq5VTkL6kviVJPvFBI15GByaX4matJEL9PqpeDZXSTK8RZCKK1iNHafZXELHdp5rITNktkbZ3xB0pAOTw01f64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fO21in6D; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fO21in6D"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-374ba74e9b6so3596524f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Sep 2024 03:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725445798; x=1726050598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/KVUrCheFbwrwKIW01tEK7XS9zRlh9AQQ32oNA94o8=;
        b=fO21in6D601eFwdmVvUagDPHBa5pyr1rDJSQEUpzgIbhxH2xUgsWOj6Mc6VIMkPYs/
         GZ7inn/Z69lqb++/D+Jp5/kTXdPP+vTLmzugGauHss6sEgr49xOB38UPppmgih7rZyRH
         ph023WNO3jvqHIKaUrCcMDlwtBy2E5xdNtsagCQzkGB6CoLetkg5mrO6LX39xLHaMJsV
         hQQ9qPLrBUFUqJ0DqYnyFp9DgPlhXOtccbsul3PG53B1Z4nLJgDjdzyjtuPcl+PPt02O
         +QRME61fLdeJATY+VFO/iE1Ac5JOQprUB6k55YXdnYa3R/18P0fk9nqoiXry/yLYfarx
         q4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725445798; x=1726050598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/KVUrCheFbwrwKIW01tEK7XS9zRlh9AQQ32oNA94o8=;
        b=wSzNjivyKAMnCRM1s+ZsZOTk7hs7WbqoGlBSQfO9SoEflI1dzC9lHXZmVrpxdmzRIb
         cgTiOu7Uw4PXT/bLzsHbgI5MuJDpkFAarMJD0iif3HZrn8RBluZCbo/AM3vjFRBIPxZf
         GaQZyYSUiPdwwCGqCM4TbuH71vosRTuGO/k5jrHPQogYRFm0rPAN3f53MH7uwU6TcmHs
         JFDCPAD2YUuC0elZsYBI+Zet8dXBaMtDTXNweNeGUzGuAcYtIuFK4cenQhUO/w7bgk5A
         xWLZAj34hLaK4GXTJ5adeYtBtubCWK8ZZbf59jw5CUILbNGUqfBo1WsrXtNuKdv9h+LJ
         JlCA==
X-Forwarded-Encrypted: i=1; AJvYcCUo7CefDQutgUKSv7dQfB6w6wH4RpbFfrjMsRDD8OCu69AmmDMPuEfAMoRVrdLWnB2t/6PoKSZyrjtWFZ4VFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5f68Y3nXLs8jbCZKKIY7EZ2Y5Vx1Oy+3kljqyvcj8x0Xnk7a6
	asOaFr+fl/6BcZYICKsbxhNpfDlZCyuJc58rKzXq64w3s6X/VbVSK/UQzJ9CeytIEGAd3zxUnTM
	Yji/jfFTZvRiQ+MYBs0Mxjn07HjBbl31EgMv5
X-Google-Smtp-Source: AGHT+IE6W9vQz1y68yO5qeHUn4/djJSdduZOAYLjB/UAITY2qd74Q9MXHNnrgxlzMmuajj/inFZcuqlopvdC7XxN3r8=
X-Received: by 2002:adf:e6c8:0:b0:374:c3cd:73de with SMTP id
 ffacd0b85a97d-374c3cd74d5mr9938028f8f.35.1725445797876; Wed, 04 Sep 2024
 03:29:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816001216.26575-1-dakr@kernel.org> <20240816001216.26575-15-dakr@kernel.org>
In-Reply-To: <20240816001216.26575-15-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 4 Sep 2024 12:29:44 +0200
Message-ID: <CAH5fLghJznTQ1r5cAHWywsdgEP13s1=9q7P9StTp8Mt4CbjRFw@mail.gmail.com>
Subject: Re: [PATCH v6 14/26] rust: alloc: implement `IntoIterator` for `Vec`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 2:13=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Implement `IntoIterator` for `Vec`, `Vec`'s `IntoIter` type, as well as
> `Iterator` for `IntoIter`.
>
> `Vec::into_iter` disassembles the `Vec` into its raw parts; additionally,
> `IntoIter` keeps track of a separate pointer, which is incremented
> correspondingsly as the iterator advances, while the length, or the count
> of elements, is decremented.
>
> This also means that `IntoIter` takes the ownership of the backing
> buffer and is responsible to drop the remaining elements and free the
> backing buffer, if it's dropped.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

This looks ok to me. One nit below, though. Either way:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/alloc.rs      |   1 +
>  rust/kernel/alloc/kvec.rs | 184 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 185 insertions(+)
>
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index e88c7e10ee9b..4ff4df4597a3 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -19,6 +19,7 @@
>  pub use self::kbox::KVBox;
>  pub use self::kbox::VBox;
>
> +pub use self::kvec::IntoIter;
>  pub use self::kvec::KVVec;
>  pub use self::kvec::KVec;
>  pub use self::kvec::VVec;
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 89afc0f25bd4..3b79f977b65e 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -11,6 +11,7 @@
>      ops::DerefMut,
>      ops::Index,
>      ops::IndexMut,
> +    ptr,
>      ptr::NonNull,
>      slice,
>      slice::SliceIndex,
> @@ -627,3 +628,186 @@ fn eq(&self, other: &$rhs) -> bool { self[..] =3D=
=3D other[..] }
>  __impl_slice_eq! { [A: Allocator] [T], Vec<U, A> }
>  __impl_slice_eq! { [A: Allocator, const N: usize] Vec<T, A>, [U; N] }
>  __impl_slice_eq! { [A: Allocator, const N: usize] Vec<T, A>, &[U; N] }
> +
> +impl<'a, T, A> IntoIterator for &'a Vec<T, A>
> +where
> +    A: Allocator,
> +{
> +    type Item =3D &'a T;
> +    type IntoIter =3D slice::Iter<'a, T>;
> +
> +    fn into_iter(self) -> Self::IntoIter {
> +        self.iter()
> +    }
> +}
> +
> +impl<'a, T, A: Allocator> IntoIterator for &'a mut Vec<T, A>
> +where
> +    A: Allocator,
> +{
> +    type Item =3D &'a mut T;
> +    type IntoIter =3D slice::IterMut<'a, T>;
> +
> +    fn into_iter(self) -> Self::IntoIter {
> +        self.iter_mut()
> +    }
> +}
> +
> +/// An `Iterator` implementation for `Vec<T,A>` that moves elements out =
of a vector.
> +///
> +/// This structure is created by the `Vec::into_iter` method on [`Vec`] =
(provided by the
> +/// [`IntoIterator`] trait).
> +///
> +/// # Examples
> +///
> +/// ```
> +/// let v =3D kernel::kvec![0, 1, 2]?;
> +/// let iter =3D v.into_iter();
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +pub struct IntoIter<T, A: Allocator> {
> +    ptr: *mut T,
> +    buf: NonNull<T>,
> +    len: usize,
> +    cap: usize,
> +    _p: PhantomData<A>,
> +}
> +
> +impl<T, A> IntoIter<T, A>
> +where
> +    A: Allocator,
> +{
> +    fn as_raw_mut_slice(&mut self) -> *mut [T] {
> +        ptr::slice_from_raw_parts_mut(self.ptr, self.len)
> +    }
> +}
> +
> +impl<T, A> Iterator for IntoIter<T, A>
> +where
> +    A: Allocator,
> +{
> +    type Item =3D T;
> +
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let v =3D kernel::kvec![1, 2, 3]?;
> +    /// let mut it =3D v.into_iter();
> +    ///
> +    /// assert_eq!(it.next(), Some(1));
> +    /// assert_eq!(it.next(), Some(2));
> +    /// assert_eq!(it.next(), Some(3));
> +    /// assert_eq!(it.next(), None);
> +    ///
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    fn next(&mut self) -> Option<T> {
> +        if self.len =3D=3D 0 {
> +            return None;
> +        }
> +
> +        let ptr =3D self.ptr;

Nit: It would probably be slightly clearer to rename this variable to `curr=
ent`.

> +        if !Vec::<T, A>::is_zst() {
> +            // SAFETY: We can't overflow; `end` is guaranteed to mark th=
e end of the buffer.
> +            unsafe { self.ptr =3D self.ptr.add(1) };
> +        } else {
> +            // For ZST `ptr` has to stay where it is to remain aligned, =
so we just reduce `self.len`
> +            // by 1.
> +        }
> +        self.len -=3D 1;
> +
> +        // SAFETY: `ptr` is guaranteed to point at a valid element withi=
n the buffer.
> +        Some(unsafe { ptr.read() })
> +    }
> +
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let v: KVec<u32> =3D kernel::kvec![1, 2, 3]?;
> +    /// let mut iter =3D v.into_iter();
> +    /// let size =3D iter.size_hint().0;
> +    ///
> +    /// iter.next();
> +    /// assert_eq!(iter.size_hint().0, size - 1);
> +    ///
> +    /// iter.next();
> +    /// assert_eq!(iter.size_hint().0, size - 2);
> +    ///
> +    /// iter.next();
> +    /// assert_eq!(iter.size_hint().0, size - 3);
> +    ///
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    fn size_hint(&self) -> (usize, Option<usize>) {
> +        (self.len, Some(self.len))
> +    }
> +}
> +
> +impl<T, A> Drop for IntoIter<T, A>
> +where
> +    A: Allocator,
> +{
> +    fn drop(&mut self) {
> +        // SAFETY: Drop the remaining vector's elements in place, before=
 we free the backing
> +        // memory.
> +        unsafe { ptr::drop_in_place(self.as_raw_mut_slice()) };
> +
> +        // If `cap =3D=3D 0` we never allocated any memory in the first =
place.
> +        if self.cap !=3D 0 {
> +            // SAFETY: `self.buf` was previously allocated with `A`.
> +            unsafe { A::free(self.buf.cast()) };
> +        }
> +    }
> +}
> +
> +impl<T, A> IntoIterator for Vec<T, A>
> +where
> +    A: Allocator,
> +{
> +    type Item =3D T;
> +    type IntoIter =3D IntoIter<T, A>;
> +
> +    /// Consumes the `Vec<T, A>` and creates an `Iterator`, which moves =
each value out of the
> +    /// vector (from start to end).
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let v =3D kernel::kvec![1, 2]?;
> +    /// let mut v_iter =3D v.into_iter();
> +    ///
> +    /// let first_element: Option<u32> =3D v_iter.next();
> +    ///
> +    /// assert_eq!(first_element, Some(1));
> +    /// assert_eq!(v_iter.next(), Some(2));
> +    /// assert_eq!(v_iter.next(), None);
> +    ///
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    ///
> +    /// ```
> +    /// let v =3D kernel::kvec![];
> +    /// let mut v_iter =3D v.into_iter();
> +    ///
> +    /// let first_element: Option<u32> =3D v_iter.next();
> +    ///
> +    /// assert_eq!(first_element, None);
> +    ///
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    fn into_iter(self) -> Self::IntoIter {
> +        let (ptr, len, cap) =3D self.into_raw_parts();
> +
> +        IntoIter {
> +            ptr,
> +            // SAFETY: `ptr` is either a dangling pointer or a pointer t=
o a valid memory
> +            // allocation, allocated with `A`.
> +            buf: unsafe { NonNull::new_unchecked(ptr) },
> +            len,
> +            cap,
> +            _p: PhantomData::<A>,
> +        }
> +    }
> +}
> --
> 2.46.0
>
