Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5272F99B3
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762415648; cv=none; b=ey5sGrhZFz+2coOeiy80/rKebTrRz1A6EhxWYqSbv+NqvGM82ziHdbXBO4ylEnvUnCFLO3I+QDwgXlvU2JKqVmO4lkBKC2x7cdAtye/XC+iZKjn/HFELuWoMCs5wrg/COXfP0RyBuLSZ4YlUNvkeVgNHQyQvjI6z+YM+uvjYaj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762415648; c=relaxed/simple;
	bh=IZ+SZ5WObLmkLgoqRPE5ZvHJJ2WyODKYa/Y7NUKVwC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RcCvxaxE0q4XmVFSSQRl3MVTREF5LnlrUqEEkMA4pRJqFvON6XmDpx1HbSaJ2l0xY1k6OdGrAucllHz7rbNL1eE8MnjvBlHCJPW4YAYhm05fOr71rvfc2WMoMgUB7aBvz3trxkszHyKDlY1YAVyQ61y5eZC518sM7qMzD6V1fro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sbRof2VX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sbRof2VX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so3324195e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 23:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762415642; x=1763020442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+2ar18tr6b962L15dLxJpfxEfWpKtIrcxwp6VAnJlI=;
        b=sbRof2VXhhRwti25Q0VmMiQQFITQEcTPotFaDPrtlrmLZ2UU4iOoZh2SWa46znkeVh
         uswI65V1Tuwm1dOVqXS0OOMzPynHM0vxfm8+gXybx8ZMw6Zj5bteTwiac8/FdCwpXWvF
         7+Fj2RqCRWh40nfRfRpHZ7c3Xc4hdq0z8IZ30wkzbBA/7TihBLvFODsgmiKlMMDJw8mq
         8TVo2saxzEPRvom4LfE1kQuYFXdLszTDu9fEJkjMN8tEEvY2VRNacP4kkrUacEt84UDP
         FVsTRklfhattMPJirM+tOE6y3jn9Sdz4YAh8Avx1iStOvQ5yaH174PZkKn8khuy/vpAr
         LmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762415642; x=1763020442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+2ar18tr6b962L15dLxJpfxEfWpKtIrcxwp6VAnJlI=;
        b=twK+QL/fIrYA10NXs46/qoMXl9ca5EbBBL6UGE47it7nt9FqDb+egbj+YClq07jpn7
         iIp3CHsE5778BmJGGk+XSQSr5yYWSvfIor7Jf7wyhTXKO5GkuYHw27Vbq3Tyc0WveWyz
         NyuHLkgUZ6AQV/kizTs/OdC08k0WXkhVT5t1gUziASUJCH7mSKqqH4puVCcNqjHGRWBl
         l366MYfgNYMjtyBCR+jKoJK0PKp+22fkrFZbQ0eG3BHbFZ1fKqRVTe0C9UvRVpC8xZRz
         uT0sVT3y8O4sqQbxyUhG3WZUa2ZbI+UjZGsiWBOrfzXwP6xCd4H1QQZaV6ueR11sq1+2
         tdLw==
X-Forwarded-Encrypted: i=1; AJvYcCWUE+KyQgC27oi29WGpz6rFqmFtIkNBJSSM8we08BznOQ2kW5CxaqKsjzZgR/A14rzsZG8B79JQuYa1AUba0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygrbprl7BuK9N/d+3ahKjv1ntDU+bYGERIaaXkIuwM4jzNWT8G
	9eMzSX+7RcWzdBJiGSZpE9MPAxL1/GLLerTydHwhTIl9T6AinbW5kBMTaun81ATI05ItqU5mm6e
	w5O2obS0flIB8Io0YOyCGbsXbhq23e6NKQK5i9Bzv
X-Gm-Gg: ASbGncvvmPYEFn8kSkk4RrPZ8eivKaG7Pbt4ie0pIVG8ILyvk2uRBQkCgHHp9wEzf8n
	MCIUZV3FMfQC+9vtcVOlGlsQhPXBEAoQvnAe1vdW5iwpbF/cjLalCvmXNIInbgRH2RfnPfljxSN
	9aVMb6mWo2iFXERsrADYVzkAhZ6mdtjfPIVK7P1Rfe65uiX+nQeUitIQYc1Co6V+5hLIXbcoLzw
	QB+MINj2EA6lud6Hvwgtpwsv7wdl5RBeVaVhj8n1JOekheHtrAidZ7b80dLnufw9iervosW
X-Google-Smtp-Source: AGHT+IEjUyFU89nMa+q5df2qUBnqXwId1/eHxAYmD1edApkV0pnuDrta64OSQlPJebpI7md4qTtQXkuypkJRNoQCvJs=
X-Received: by 2002:a05:600c:8414:b0:471:1d8e:3c4f with SMTP id
 5b1f17b1804b1-47766986793mr5309775e9.24.1762415642292; Wed, 05 Nov 2025
 23:54:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924193643.4001-1-git@elijahs.space> <20251001044508.23126-1-git@elijahs.space>
In-Reply-To: <20251001044508.23126-1-git@elijahs.space>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 6 Nov 2025 08:53:49 +0100
X-Gm-Features: AWmQ_blEJvV78Y_pK8S2wijCI3QywPGzT7z7xdYg28jPz0DOAgq4L25bYhQJkTE
Message-ID: <CAH5fLgiDwghSy_P3ER8WAYyAtRPgVji_wsmkiNfvc5HHpUpGnA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: slab: add basic slab module
To: Elijah Wright <git@elijahs.space>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 6:45=E2=80=AFAM Elijah Wright <git@elijahs.space> wr=
ote:
>
> this revision adds gen_kmem_cache_allocator, a macro that implements
> Allocator::realloc for kmem_cache. the one concern that I did have was re=
alloc()
> for resizing, since that obviously isn't possible for slab
>
> Signed-off-by: Elijah Wright <git@elijahs.space>

When you send a new version, please don't reply to the previous
version. It's too easy to miss the ne version if you do.

> ---
>  rust/kernel/slab.rs | 52 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/rust/kernel/slab.rs b/rust/kernel/slab.rs
> index 8b418f9db7cb..3f1310f309c5 100644
> --- a/rust/kernel/slab.rs
> +++ b/rust/kernel/slab.rs
> @@ -83,3 +83,55 @@ fn drop(&mut self) {
>          unsafe { bindings::kmem_cache_destroy(self.cache.as_ptr()) };
>      }
>  }
> +
> +// SAFETY: The pointer does not change after creation, so `Slab<T>` may
> +// be used from multiple threads.
> +unsafe impl<T> Send for Slab<T> {}
> +unsafe impl<T> Sync for Slab<T> {}
> +
> +/// Generates a zero-sized allocator type that allocates from a given
> +/// `Slab<T>`.
> +#[macro_export]
> +macro_rules! gen_kmem_cache_allocator {
> +    (struct $name:ident for $cache:expr $(,)?) =3D> {
> +        #[derive(Clone, Copy, Default)]
> +        pub struct $name;
> +
> +        // SAFETY: Allocation and free happen through kernel APIs which
> +        // provide guarantees. The ZST carries no state, so it can be
> +        // duplicated freely.
> +        unsafe impl $crate::alloc::Allocator for $name {
> +            #[inline]
> +            unsafe fn realloc(
> +                ptr: Option::<::core::ptr::NonNull<u8>>,
> +                layout: ::core::alloc::Layout,
> +                old_layout: ::core::alloc::Layout,
> +                flags: $crate::alloc::Flags,
> +            ) -> ::core::result::Result<::core::ptr::NonNull<[u8]>, $cra=
te::alloc::AllocError> {
> +                if layout.size() =3D=3D 0 {
> +                    if let Some(p) =3D ptr {
> +                        // SAFETY: Caller promises `p` came from this al=
locator.
> +                        unsafe {
> +                            $crate::bindings::kmem_cache_free($cache.as_=
ptr(), p.as_ptr().cast());
> +                        }
> +                    }
> +                    let dang =3D $crate::alloc::dangling_from_layout(lay=
out);
> +                    let slice =3D ::core::ptr::NonNull::slice_from_raw_p=
arts(dang, 0);
> +                    return Ok(slice);
> +                }
> +
> +                if ptr.is_some() {
> +                    return Err($crate::alloc::AllocError);
> +                }
> +
> +                let raw_ptr =3D unsafe {
> +                    $crate::bindings::kmem_cache_alloc($cache.as_ptr(), =
flags.as_raw())
> +                };
> +                let nn =3D ::core::ptr::NonNull::new(raw_ptr.cast())
> +                    .ok_or($crate::alloc::AllocError)?;
> +                let slice =3D ::core::ptr::NonNull::slice_from_raw_parts=
(nn.cast::<u8>(), layout.size());
> +                Ok(slice)

Hm, this is kind of tricky. We specify a size when calling this, but
kmem caches only support one single size. I don't know what to do
about that.

Alice
