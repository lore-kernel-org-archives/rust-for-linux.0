Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A41732ED28
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767024703; cv=none; b=PY1Iz32L03sqXqZ/LcpTf3Hl674dYW9VBJev1LrUBAd4WjEg+6zbmdh5dyvJK7kHreuOUOdh1nW6sONTf+C/kKxbqRxzeXrLs0FbJlm38eaf6+ld6buM7a5QFPTztPrwYIE5fqLeBu65/O7BPKgBOleZxFJNPOA7J8qusJUtQtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767024703; c=relaxed/simple;
	bh=XlEHiAxz1EUfcnr45Z4xPmWNS+OrG7y6/E99EvVZqEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTd0tSewYr2EhIL+8RbB9nn4xnuXC9aKTnkA7d/2Q4+m21DPkcnvsKQXD8VhszH37oW1m4dcoadytqcV5rPmCTcUfXU7Z50jZSGwv92QRh2iHfFK4kjaV1St6WsXLA+bjnvn2/uKkaQLlJjInpb/FDkkrcHKGNVk20dJx3y5OFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNhOUHjQ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNhOUHjQ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5945510fd7aso7443660e87.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 08:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767024699; x=1767629499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CO3SIDg+lB7ZkulLfOUbcN3pKdby5uJloK0qKTRr0ew=;
        b=jNhOUHjQx3/W4kLCFlwKJMbd13Y8P++m4F8eGQtJyNcm/D5hfOlfMAp3cx2TdqJcnm
         mDMz/A8mcBAXhZxWc5BG70L1eqEUZ4wFai522wURBup0eo7VCotglcW77Cg/j75Z3hDI
         dOLplvKZXr/6du7Vnb/0TYYUGcIX+/CdDtex6Jfw9u9OYlV57UIWpwQxiaMtEi0t2IU7
         j+xJKYsMqU9JHSL86jMtj99rQm1q8KXy2Y9kS35ntvm59SS+6bMdxHc0zxVa7yUgtNEL
         vlUXcnf88AdMnKhGYAiQxAl2Gsdn7Yvnmssk3zQTlS0gETDM44EFsWcAeZ5wFPaKGi16
         CYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767024699; x=1767629499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CO3SIDg+lB7ZkulLfOUbcN3pKdby5uJloK0qKTRr0ew=;
        b=jNjLC7VCRZnLJ5joAQ4gKXY+kNXJT3CQZ0nxb2Cf/ZNSmaAIVYLPlNlKFz2QQEOdNb
         mI50wC+bUYIaG+Hofg5tnaZf1qHkzk2tx1OKsz545I1kErlMA4dTP0/jKEwgExOJdhYu
         jHJ/CrEcmgkoewMowQr/u1XxpFtXAM899w9RqnmGEih8BNbzBRQcM60u3PYLmGKCZsTv
         mBlYQHDn6Vfns1NSbE36XYj8ON8l5kLyMEnEbOoWn5GavFptT23N0VBu12L5gjD80fot
         cuB6FbEgFpDc1D/LbMAVKRQF+1j806D4jMqD/YMCEFsZOZgYGIiqQ7dhYeZ/swY4ygB0
         MDXA==
X-Forwarded-Encrypted: i=1; AJvYcCXgPXGTCAXYpD6abgyzvlOJXVq4a6GU6MrE6ZjyJk0D1cdVTEBV4JEX3Ym3ouVM3tSZxx6DgSM+vgh8Lb10yA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy8jF/OmHvaRr0jlDhL2HyqgWRVDflzUBDegA/NLqsOx/YRJNt
	pI5Kth92MswAzCEga+NPnJq3It8GkqhtVOdnhxBMI4iHg7C9k+RMD5DuI8aYdbgQ+1dL6dUpgan
	yXgYQwJvC2ySmrJlvX95fHNNe5b2Moio=
X-Gm-Gg: AY/fxX6B1K0I1Uo1+8Kru78DknDoRZhz5T2WZ69NLlo73QeHLQm8E2Cq+3sEgH469QE
	nmTWOHYNI9+m0TAPSbqBayr0j/uu9vGbzCQaX3PRjkfaLTWQstUCjeCnfPMipJXkbr1qoLSiPWp
	mT1HuYcyBH6UOcmmqQAg01bqFzq0S5y2eZeqSBd2a3pOGjgeSIqSM3+mHmkUSo1Xsdb7lqJhPrP
	2ACJ8HT6B9yvAwDR5D1N65EycbLj4ciXNj5QJB2Ilh/jFtN7XCsS0O7JJaTvwB4prxH4CChhWqI
	6+77UQx/3um98Z9ZqocFYZDgVTOhmdFwIGEInkZd5TiLhCgaSfhrjdFzbxjw3m/AUHHikM+VmEm
	Qmw3uXn7CPUiPI89wzh2BmQWbZWDhD0XRaw0oMAzB7w==
X-Google-Smtp-Source: AGHT+IF+PE1YobYR5Y7ULQPjSSgAmWNmji/DE9oPBGYiwayUYLswlCXDQ0jBZfElqmTPH5AxYCAFn2MeSM2GzHkWbSE=
X-Received: by 2002:a19:ee0b:0:b0:59a:1a65:7a89 with SMTP id
 2adb3069b0e04-59a1a657b2fmr6236454e87.30.1767024699359; Mon, 29 Dec 2025
 08:11:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org> <20251203-xarray-entry-send-v1-7-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-7-9e5ffd5e3cf0@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 29 Dec 2025 11:11:03 -0500
X-Gm-Features: AQt7F2pku79q-ol0CUlrZbzcikBM27RMK-kxtITa1sX8iXzwc3iDBZgY6bYYcTY
Message-ID: <CAJ-ks9=gx=Qea4NYSLwTfZtQkwgV-WOjR_A_d2US=ZCNP9jxCQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] rust: xarray: add `find_next` and `find_next_mut`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Add methods to find the next element in an XArray starting from a
> given index. The methods return a tuple containing the index where the
> element was found and a reference to the element.
>
> The implementation uses the XArray state API via `xas_find` to avoid taki=
ng
> the xarray lock that is already held by `Guard`.

Similarly to the commit message introducing the use of `xas_load`,
this is not correct because `xa_find` takes and release the RCU lock
only, not the XArray lock.

>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/xarray.rs | 65 +++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index ca97134ba2bd0..9d4589979fd1d 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -255,6 +255,71 @@ pub fn get_mut(&mut self, index: usize) -> Option<T:=
:BorrowedMut<'_>> {
>          Some(unsafe { T::borrow_mut(ptr.as_ptr()) })
>      }
>
> +    fn load_next(&self, index: usize) -> Option<(usize, NonNull<c_void>)=
> {
> +        let mut state =3D XArrayState::new(self, index);
> +        // SAFETY: `state.state` is always valid by the type invariant o=
f
> +        // `XArrayState` and the caller holds the lock.
> +        let ptr =3D unsafe { bindings::xas_find(&raw mut state.state, us=
ize::MAX) };
> +        NonNull::new(ptr).map(|ptr| (state.state.xa_index, ptr))
> +    }

Can this be a method on XArrayState? It seems odd to document a remote
type's invariant here when we could put that justification on the type
itself.

> +
> +    /// Finds the next element starting from the given index.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// guard.store(10, KBox::new(10u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    /// guard.store(20, KBox::new(20u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    ///
> +    /// if let Some((found_index, value)) =3D guard.find_next(11) {
> +    ///     assert_eq!(found_index, 20);
> +    ///     assert_eq!(*value, 20);
> +    /// }
> +    ///
> +    /// if let Some((found_index, value)) =3D guard.find_next(5) {
> +    ///     assert_eq!(found_index, 10);
> +    ///     assert_eq!(*value, 10);
> +    /// }
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn find_next(&self, index: usize) -> Option<(usize, T::Borrowed<=
'_>)> {
> +        self.load_next(index)
> +            // SAFETY: `ptr` came from `T::into_foreign`.
> +            .map(|(index, ptr)| (index, unsafe { T::borrow(ptr.as_ptr())=
 }))
> +    }
> +
> +    /// Finds the next element starting from the given index, returning =
a mutable reference.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// guard.store(10, KBox::new(10u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    /// guard.store(20, KBox::new(20u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    ///
> +    /// if let Some((found_index, mut_value)) =3D guard.find_next_mut(5)=
 {
> +    ///     assert_eq!(found_index, 10);
> +    ///     *mut_value =3D 0x99;
> +    /// }
> +    ///
> +    /// assert_eq!(guard.get(10).copied(), Some(0x99));
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn find_next_mut(&mut self, index: usize) -> Option<(usize, T::B=
orrowedMut<'_>)> {
> +        self.load_next(index)
> +            // SAFETY: `ptr` came from `T::into_foreign`.
> +            .map(move |(index, ptr)| (index, unsafe { T::borrow_mut(ptr.=
as_ptr()) }))
> +    }
> +
>      /// Removes and returns the element at the given index.
>      pub fn remove(&mut self, index: usize) -> Option<T> {
>          // SAFETY:
>
> --
> 2.51.2
>
>
