Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC028DCB
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Aug 2024 20:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724270449; cv=none; b=QK2t/OIrQrnvPQSDQQSOxf9xmbQvxYvKJee4XBLJk5LZUb3rXLEh/xu+SV2GL26cBUbHJu56IGE69YPwCgvaNLPCjn3NQAaVxhcVL6En263Lo1zauOlpWGSicdiIP4g+CxDMU9hcbmyAxY3mlAW0JOWt9QYMylmFazcKDKoqHIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724270449; c=relaxed/simple;
	bh=+HWWiaAzODGzDWy79YS/gg3OBoKASZ5Zpe0gfJpTTFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=azUAeFtnm3FYhSvFipIBGqL0GoiZuvlrlXmVV1Acg9vguSjsyuPRkJuiqdlBxlt1T9rRWhcgryl/CcucwytJI7WX4KA2vt3R+Y+po2w+pEMWUKlN2cgGBs7vNzqkcyN6rFR0Fc3+HViIgqzUiK11AQWXfUK/hrkJ3kHvxSZYVns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WkisNe7d; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WkisNe7d"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42809d6e719so285625e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Aug 2024 13:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724270446; x=1724875246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGI07cGsP8fcnXC9uCsOF2ZwFAGWeT83v1bHOqfySF8=;
        b=WkisNe7d3klyNk2MFeShHc7MyoHkLOKnoQUjWP7ND/QahpmzilCSiNIJISYAz3gZhq
         yxxMQSJD+gqUVNsq/8dHNVDprP8NqRwpneiCPw31Wx7nH1EKZ5JLZoEBnETd2/JpPSFd
         TAzMh5CU3p4/iZd+67dRbX9LXmsBoH46ix6+ig2tpu40s/9GmCzoFBRQqQ1nv9ptjB6R
         KLPgz8qog31pF9dvGW8t3Ngt0gaaANgq/f7KgVuL2FO/LYmO4Z7W9/2ZPP9IOqiZydJn
         uTMdu+4QwNFkT/NtrT/9aBhsGdG9EYkBkPKJOtFmzW45vdUxPkFz53c9/GTJxiVaCkv6
         Fd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724270446; x=1724875246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGI07cGsP8fcnXC9uCsOF2ZwFAGWeT83v1bHOqfySF8=;
        b=SsTfspG9V0pSuGlaSuPHnbxkhinsXfzNb9zYUHfAgQzfd1X4d2dymBRyuEzLuyj9Xh
         l//rrhkVnQAxSlJAuDs5ryYYVbnEHZrqubzuIpgPOL0aLPGw0ifmaqpX2cZs/pr5+19P
         QtO3cRYjImeFNMEDUmlYDQMLcW9XOKbH1VXXoRmsKa3Fd0NjaZyhOxQ+GK0m7cNCvJX8
         CdymKxjmAOZNndEJ1PzcoDtqO0lXqKKq2qN9has8f6l3xqp/iTWHUDONI+xvBKAoSbH4
         P48fndF3D4MSonhqWbSEQpDXR45ZVv13ZJb7BskjJma93t/hcqwO7Mry16jpcDokEyvT
         I5Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWrlk4l5pLXxh9nixGA3Q7ubtaCLDHnFF9D9a1gwqqoXXpFIQ6zr9IqHj/mKZRLwXkWSaMNkdETI/6B8rJduQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHro2u2GV8AQtU/T6lBvhm++G0cHJtkU0l2ssQ0sz5h8+pu4/V
	yzVHfM3qLG9BeYg+y06FI4qtPHNyjbf9sJVF4d72wrAQ1wldAhZaKSNbB11hicryjlMxI5aVbXS
	jYLaHETpaHre2vL/q2je8IHy5tt02w/xMt2XG
X-Google-Smtp-Source: AGHT+IHF6bEK97j6q5rJJHszD7Q0DT/zPxbvla38Ox+4RoCHHA8Jj7yhglmGVyu8uhsy37yhgKP8qt4gLdW2Q9/OKek=
X-Received: by 2002:a05:600c:4f4d:b0:426:5b21:9801 with SMTP id
 5b1f17b1804b1-42abd25ddcfmr21801745e9.27.1724270445212; Wed, 21 Aug 2024
 13:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821-aref-into-raw-v2-1-9215bbca5720@google.com>
In-Reply-To: <20240821-aref-into-raw-v2-1-9215bbca5720@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 21 Aug 2024 22:00:33 +0200
Message-ID: <CAH5fLgh2Epv_XOEyEibiZMwhKX0yxSXxr1tf6BC+a4sxU=fLzA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add `ARef::into_raw`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kartik Prajapati <kartikprajapati987@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 9:59=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> From: Kartik Prajapati <kartikprajapati987@gmail.com>
>
> Add a method for `ARef` that is analogous to `Arc::into_raw`. It is the
> inverse operation of `ARef::from_raw`, and allows you to convert the
> `ARef` back into a raw pointer while retaining ownership of the
> refcount.
>
> This new function will be used by [1] for converting the type in an
> `ARef` using `ARef::from_raw(ARef::into_raw(me).cast())`. The author has

Oh, this should refer to me, oops.

> also needed the same function for other use-cases in the past, but [1]
> is the first to go upstream.
>
> This was implemented independently by Kartik and Alice. The two versions
> were merged by Alice, so all mistakes are Alice's.
>
> Link: https://lore.kernel.org/r/20240801-vma-v3-1-db6c1c0afda9@google.com=
 [1]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1044
> Signed-off-by: Kartik Prajapati <kartikprajapati987@gmail.com>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Sending a v2 that is merged with [1]. I didn't realize that I was
> duplicating work, sorry! I'll update the author information to list
> Kartik as the primary author. I kept my function body so that it returns
> NonNull to mirror the type used by `ARef::from_raw`.
>
> This change was previously included in
> https://lore.kernel.org/all/20240801-vma-v3-1-db6c1c0afda9@google.com/
> but is being split out in its own commit at Danilo's suggestion.
>
> Link: https://github.com/Rust-for-Linux/linux/pull/1056 [1]
> ---
> Changes in v2:
> - Add example from [1], and fix the imports in the example so it compiles=
.
> - Update author information to reflect merge with [1].
> - Link to v1: https://lore.kernel.org/r/20240801-aref-into-raw-v1-1-33401=
e2fbac8@google.com
> ---
>  rust/kernel/types.rs | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index ee7dd1f963ef..9e7ca066355c 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -7,7 +7,7 @@
>  use core::{
>      cell::UnsafeCell,
>      marker::{PhantomData, PhantomPinned},
> -    mem::MaybeUninit,
> +    mem::{ManuallyDrop, MaybeUninit},
>      ops::{Deref, DerefMut},
>      pin::Pin,
>      ptr::NonNull,
> @@ -396,6 +396,35 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>              _p: PhantomData,
>          }
>      }
> +
> +    /// Consumes the `ARef`, returning a raw pointer.
> +    ///
> +    /// This function does not change the refcount. After calling this f=
unction, the caller is
> +    /// responsible for the refcount previously managed by the `ARef`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use core::ptr::NonNull;
> +    /// use kernel::types::{ARef, AlwaysRefCounted};
> +    ///
> +    /// struct Empty {}
> +    ///
> +    /// unsafe impl AlwaysRefCounted for Empty {
> +    ///     fn inc_ref(&self) {}
> +    ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
> +    /// }
> +    ///
> +    /// let mut data =3D Empty {};
> +    /// let ptr =3D NonNull::<Empty>::new(&mut data as *mut _).unwrap();
> +    /// let data_ref: ARef<Empty> =3D unsafe { ARef::from_raw(ptr) };
> +    /// let raw_ptr: NonNull<Empty> =3D ARef::into_raw(data_ref);
> +    ///
> +    /// assert_eq!(ptr, raw_ptr);
> +    /// ```
> +    pub fn into_raw(me: Self) -> NonNull<T> {
> +        ManuallyDrop::new(me).ptr
> +    }
>  }
>
>  impl<T: AlwaysRefCounted> Clone for ARef<T> {
>
> ---
> base-commit: e26fa546042add70944d018b930530d16b3cf626
> change-id: 20240801-aref-into-raw-e0518131442f
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
