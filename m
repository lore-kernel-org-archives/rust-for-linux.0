Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778461AE84F
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727348964; cv=none; b=TN7ITHqtxW6KKr6VuK/+TeZTJlEpv02ReWp77XNfa3qD6uzgPh9C7gWkcWd7OUSXn+c+GN2kdicN4I4UXAW44AwjF753ZC52u712QY/Zw+75VwDYLOgNI5vy20rDEI9hqRm+MBKNJL0cLpX49/xKg3DnOa7dTWz3uLsqzYdswKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727348964; c=relaxed/simple;
	bh=SmEaFQKCRpKYa6xLJmLBj8BWOLbh+BfuX0TYs6cXx+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKYby5WHfkR8Hjesi0fIfoeWQndZ1rnN9fpCmuLvz7aY6dxC6lfK2jYipmU7OwGAEc0ezycwh4O2POSCJw+gydrF07lSByDhlaykLW4Qngvocs5drH+d8J/N2ri8HmfFz1xGStnurubQqm0qzoDrEzUyDeHbUXQeqMAyQmMt4wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=lTOLSrXw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="lTOLSrXw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so7484775e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 04:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1727348961; x=1727953761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=taVLt61l0t80NT6UNoOtlHMxeGp/JeIzeGPePicovLw=;
        b=lTOLSrXwsTdK9zVFobFvwDgV+PDabTwwGAgzb1EsZePTTKh4CQY8qskmbCc2uVij6E
         drNZDbfdKVz/rY5OXVVz2q+xohrRm+wML1+sjnW9327u+gGCHrpJ+aCx70gtJam3NuXB
         S2F252NHXn5hvUKUnfeVFcJl98MN2JIIdKJFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727348961; x=1727953761;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=taVLt61l0t80NT6UNoOtlHMxeGp/JeIzeGPePicovLw=;
        b=Fq+Vx0fTr/Ob5OUveVqXHzeNJaf6a4sTRAA9D0TbDB+lyCcL6pdU3pa1wtWXUhUWB7
         LR2/z/xjWPaubX1nqzJCT5t9pNUiXnz3qSg/BwUx5syqt81Q9AJ1JmI6wLW+39eBSKqo
         Vuo7Hd5d5xcUcwp6e5VucWpNIctUOXGzUzHgfIH4KfsM4ce26lWNYENZLRRXTXMomhl4
         7SGmBCUd6YTWQttlXs2yhe0rXef4YknJ2vOZ2Y5fvbR0SoJNe+Fke8GMF9hc/XFQxTkE
         OR3Emrv7QTSgeAWoLTZ/Ff7zlym2Hcaev2cGAckFzxgvK+bpf3Qyui9Fi89IDi6s5e1a
         8N8w==
X-Forwarded-Encrypted: i=1; AJvYcCW3kdMNT6ICuLrKuAjeJW+MHyxAtMY7A/sNQhu8hLb6/Z+VsDEaYUxQyznUiP5xdHSsw2HYSJ91BbrBPUtIRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyFaJVKZu3/k9F3kdY1qQRwRX2QnhImgwIrHbkM5Jw66VcafOE
	Dn211a7ea6yrKgNKL5r7daiqLjTGRqvDJlOURp94glhT8/ZG7AJrPwIA+LMcv8Y=
X-Google-Smtp-Source: AGHT+IGLJlDM5bR9tZQUJY9EKpZaD8DANQnER0arEp2cZ7H5uFxBRpVwYyq/hZbeiC3yFult4Thi2g==
X-Received: by 2002:a05:600c:468b:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-42e96103b5emr39448315e9.7.1727348960470;
        Thu, 26 Sep 2024 04:09:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969e188csm44174785e9.3.2024.09.26.04.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 04:09:19 -0700 (PDT)
Date: Thu, 26 Sep 2024 13:09:17 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg KH <gregkh@linuxfoundation.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rust: switch uaccess to untrusted data API
Message-ID: <ZvVA3cCcqJr70OV4@phenom.ffwll.local>
Mail-Followup-To: Benno Lossin <benno.lossin@proton.me>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg KH <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240925205244.873020-1-benno.lossin@proton.me>
 <20240925205244.873020-3-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925205244.873020-3-benno.lossin@proton.me>
X-Operating-System: Linux phenom 6.10.6-amd64 

On Wed, Sep 25, 2024 at 08:53:11PM +0000, Benno Lossin wrote:
> Userspace is an untrusted data source, so all data that can be read from
> there is untrusted. Therefore use the new untrusted API for any data
> returned from it.
> This makes it significantly harder to write TOCTOU bug, the example bug
> in the documentation cannot easily be converted to use the new API. Thus
> it is removed.
> 
> A possible future improvement is to change how `UserSliceWriter` exposes
> writing to userspace: a trait `ToUserspace` TBB (to be bikeshed) could
> allow users to write untrusted data to a userpointer without adding more
> methods to it.
> 
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
>  rust/kernel/page.rs    |   8 ++-
>  rust/kernel/uaccess.rs | 135 +++++++++++++++++++++--------------------
>  2 files changed, 74 insertions(+), 69 deletions(-)
> 
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 208a006d587c..74ce86326893 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -5,9 +5,9 @@
>  use crate::{
>      alloc::{AllocError, Flags},
>      bindings,
> -    error::code::*,
> -    error::Result,
> +    error::{code::*, Result},
>      uaccess::UserSliceReader,
> +    validate::Untrusted,
>  };
>  use core::ptr::{self, NonNull};
>  
> @@ -237,8 +237,10 @@ pub unsafe fn copy_from_user_slice_raw(
>              // SAFETY: If `with_pointer_into_page` calls into this closure, then it has performed a
>              // bounds check and guarantees that `dst` is valid for `len` bytes. Furthermore, we have
>              // exclusive access to the slice since the caller guarantees that there are no races.
> -            reader.read_raw(unsafe { core::slice::from_raw_parts_mut(dst.cast(), len) })
> +            let slice = unsafe { core::slice::from_raw_parts_mut(dst.cast(), len) };
> +            reader.read_raw(Untrusted::new_mut(slice))
>          })
> +        .map(|_| ())
>      }
>  }
>  
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index e9347cff99ab..3d312f845269 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -10,10 +10,12 @@
>      error::Result,
>      prelude::*,
>      types::{AsBytes, FromBytes},
> +    validate::Untrusted,
>  };
>  use alloc::vec::Vec;
>  use core::ffi::{c_ulong, c_void};
>  use core::mem::{size_of, MaybeUninit};
> +use init::init_from_closure;
>  
>  /// The type used for userspace addresses.
>  pub type UserPtr = usize;
> @@ -47,59 +49,39 @@
>  ///
>  /// ```no_run
>  /// use alloc::vec::Vec;
> -/// use core::ffi::c_void;
> -/// use kernel::error::Result;
> -/// use kernel::uaccess::{UserPtr, UserSlice};
> +/// use core::{convert::Infallible, ffi::c_void};
> +/// use kernel::{error::Result, uaccess::{UserPtr, UserSlice}, validate::{Unvalidated, Untrusted, Validate}};
>  ///
> -/// fn bytes_add_one(uptr: UserPtr, len: usize) -> Result<()> {
> -///     let (read, mut write) = UserSlice::new(uptr, len).reader_writer();
> +/// struct AddOne<'a>(&'a mut u8);
>  ///
> -///     let mut buf = Vec::new();
> -///     read.read_all(&mut buf, GFP_KERNEL)?;
> +/// impl<'a> Validate<&'a mut Unvalidated<u8>> for AddOne<'a> {
> +///     type Err = Infallible;
>  ///
> -///     for b in &mut buf {
> -///         *b = b.wrapping_add(1);
> +///     fn validate(unvalidated: &'a mut Unvalidated<u8>) -> Result<Self, Self::Err> {
> +///         // We are not doing any kind of validation here on purpose. After all, we only want to
> +///         // increment the value and write it back.
> +///         Ok(Self(unvalidated.raw_mut()))
>  ///     }
> -///
> -///     write.write_slice(&buf)?;
> -///     Ok(())
>  /// }
> -/// ```
> -///
> -/// Example illustrating a TOCTOU (time-of-check to time-of-use) bug.
>  ///
> -/// ```no_run
> -/// use alloc::vec::Vec;
> -/// use core::ffi::c_void;
> -/// use kernel::error::{code::EINVAL, Result};
> -/// use kernel::uaccess::{UserPtr, UserSlice};
> +/// impl AddOne<'_> {
> +///     fn inc(&mut self) {
> +///         *self.0 = self.0.wrapping_add(1);
> +///     }
> +/// }
>  ///
> -/// /// Returns whether the data in this region is valid.
> -/// fn is_valid(uptr: UserPtr, len: usize) -> Result<bool> {
> -///     let read = UserSlice::new(uptr, len).reader();
> +/// fn bytes_add_one(uptr: UserPtr, len: usize) -> Result<()> {
> +///     let (read, mut write) = UserSlice::new(uptr, len).reader_writer();
>  ///
>  ///     let mut buf = Vec::new();
>  ///     read.read_all(&mut buf, GFP_KERNEL)?;
>  ///
> -///     todo!()
> -/// }
> -///
> -/// /// Returns the bytes behind this user pointer if they are valid.
> -/// fn get_bytes_if_valid(uptr: UserPtr, len: usize) -> Result<Vec<u8>> {
> -///     if !is_valid(uptr, len)? {
> -///         return Err(EINVAL);
> +///     for b in &mut buf {
> +///         b.validate_mut::<AddOne<'_>>()?.inc();
>  ///     }
>  ///
> -///     let read = UserSlice::new(uptr, len).reader();
> -///
> -///     let mut buf = Vec::new();
> -///     read.read_all(&mut buf, GFP_KERNEL)?;
> -///
> -///     // THIS IS A BUG! The bytes could have changed since we checked them.
> -///     //
> -///     // To avoid this kind of bug, don't call `UserSlice::new` multiple
> -///     // times with the same address.
> -///     Ok(buf)
> +///     write.write_untrusted_slice(Untrusted::transpose_slice(&buf))?;

See below and in my previous mail, I think with the right amount of traits
you can rewrite this as

	write.write(&buf)?;

and it will all just neatly work.

> +///     Ok(())
>  /// }
>  /// ```
>  ///
> @@ -130,7 +112,7 @@ pub fn new(ptr: UserPtr, length: usize) -> Self {
>      /// Reads the entirety of the user slice, appending it to the end of the provided buffer.
>      ///
>      /// Fails with [`EFAULT`] if the read happens on a bad address.
> -    pub fn read_all(self, buf: &mut Vec<u8>, flags: Flags) -> Result {
> +    pub fn read_all(self, buf: &mut Vec<Untrusted<u8>>, flags: Flags) -> Result {
>          self.reader().read_all(buf, flags)
>      }
>  
> @@ -218,38 +200,47 @@ pub fn is_empty(&self) -> bool {
>      /// Fails with [`EFAULT`] if the read happens on a bad address, or if the read goes out of
>      /// bounds of this [`UserSliceReader`]. This call may modify `out` even if it returns an error.
>      ///
> +    /// Returns a reference to the initialized bytes in `out`.
> +    ///
>      /// # Guarantees
>      ///
>      /// After a successful call to this method, all bytes in `out` are initialized.
> -    pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
> -        let len = out.len();
> -        let out_ptr = out.as_mut_ptr().cast::<c_void>();
> -        if len > self.length {
> -            return Err(EFAULT);
> -        }
> -        let Ok(len_ulong) = c_ulong::try_from(len) else {
> -            return Err(EFAULT);
> +    pub fn read_raw<'a>(
> +        &'a mut self,
> +        out: &'a mut Untrusted<[MaybeUninit<u8>]>,
> +    ) -> Result<&'a mut Untrusted<[u8]>> {
> +        let init = |ptr: *mut [u8]| {
> +            let out_ptr = ptr.cast::<c_void>();
> +            let len = ptr.len();
> +            if len > self.length {
> +                return Err(EFAULT);
> +            }
> +            let Ok(len_ulong) = c_ulong::try_from(len) else {
> +                return Err(EFAULT);
> +            };
> +            // SAFETY: `out_ptr` points into a mutable slice of length `len_ulong`, so we may write
> +            // that many bytes to it.
> +            let res =
> +                unsafe { bindings::copy_from_user(out_ptr, self.ptr as *const c_void, len_ulong) };
> +            if res != 0 {
> +                return Err(EFAULT);
> +            }
> +            self.ptr = self.ptr.wrapping_add(len);
> +            self.length -= len;
> +            Ok(())
>          };
> -        // SAFETY: `out_ptr` points into a mutable slice of length `len_ulong`, so we may write
> -        // that many bytes to it.
> -        let res =
> -            unsafe { bindings::copy_from_user(out_ptr, self.ptr as *const c_void, len_ulong) };
> -        if res != 0 {
> -            return Err(EFAULT);
> -        }
> -        self.ptr = self.ptr.wrapping_add(len);
> -        self.length -= len;
> -        Ok(())
> +        out.write_uninit_slice(unsafe { init_from_closure(init) })
>      }
>  
>      /// Reads raw data from the user slice into a kernel buffer.
>      ///
>      /// Fails with [`EFAULT`] if the read happens on a bad address, or if the read goes out of
>      /// bounds of this [`UserSliceReader`]. This call may modify `out` even if it returns an error.
> -    pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
> +    pub fn read_slice(&mut self, out: &mut Untrusted<[u8]>) -> Result<&mut Untrusted<[u8]>> {
>          // SAFETY: The types are compatible and `read_raw` doesn't write uninitialized bytes to
>          // `out`.
> -        let out = unsafe { &mut *(out as *mut [u8] as *mut [MaybeUninit<u8>]) };
> +        let out =
> +            unsafe { &mut *(out as *mut Untrusted<[u8]> as *mut Untrusted<[MaybeUninit<u8>]>) };
>          self.read_raw(out)
>      }
>  

You didn't update the typed read here, intentionally? Should be something
like:

-    pub fn read<T: FromBytes>(&mut self) -> Result<T> {
+    pub fn read<T: FromBytes>(&mut self) -> Result<Untrusted<T>> {

> @@ -291,13 +282,15 @@ pub fn read<T: FromBytes>(&mut self) -> Result<T> {
>      /// Reads the entirety of the user slice, appending it to the end of the provided buffer.
>      ///
>      /// Fails with [`EFAULT`] if the read happens on a bad address.
> -    pub fn read_all(mut self, buf: &mut Vec<u8>, flags: Flags) -> Result {
> +    pub fn read_all(mut self, buf: &mut Vec<Untrusted<u8>>, flags: Flags) -> Result {
>          let len = self.length;
> -        VecExt::<u8>::reserve(buf, len, flags)?;
> +        VecExt::<_>::reserve(buf, len, flags)?;
>  
>          // The call to `try_reserve` was successful, so the spare capacity is at least `len` bytes
>          // long.
> -        self.read_raw(&mut buf.spare_capacity_mut()[..len])?;
> +        self.read_raw(Untrusted::transpose_slice_uninit_mut(
> +            &mut buf.spare_capacity_mut()[..len],
> +        ))?;
>  
>          // SAFETY: Since the call to `read_raw` was successful, so the next `len` bytes of the
>          // vector have been initialized.
> @@ -333,8 +326,18 @@ pub fn is_empty(&self) -> bool {
>      /// bounds of this [`UserSliceWriter`]. This call may modify the associated userspace slice even
>      /// if it returns an error.
>      pub fn write_slice(&mut self, data: &[u8]) -> Result {
> -        let len = data.len();
> -        let data_ptr = data.as_ptr().cast::<c_void>();
> +        self.write_untrusted_slice(Untrusted::new_ref(data))
> +    }
> +
> +    /// Writes raw data to this user pointer from a kernel buffer.
> +    ///
> +    /// Fails with [`EFAULT`] if the write happens on a bad address, or if the write goes out of
> +    /// bounds of this [`UserSliceWriter`]. This call may modify the associated userspace slice even
> +    /// if it returns an error.
> +    pub fn write_untrusted_slice(&mut self, data: &Untrusted<[u8]>) -> Result {

I think this one we don't need, but instead we need:

unsafe impl<T: AsBytes> AsBytes for Untrusted<T> {}

and you get the untrusted write for free.

Cheers, Sima

> +        let data_ptr = (data as *const _) as *const [u8];
> +        let len = data_ptr.len();
> +        let data_ptr = data_ptr.cast::<c_void>();
>          if len > self.length {
>              return Err(EFAULT);
>          }
> -- 
> 2.46.0
> 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
