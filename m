Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D49E35BDB3
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 13:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828285; cv=pass; b=b1DP0jI4QkwSjta2cvq96c2WoLMhpMp9lcPPCfovhgEmRWZT6s/Kmz1cG+iWr//SLK8rRX5VIeO2+oLg1wqggjqA4UOedbgyHvECDYp5nODC61uO2GBABh7yUlj0AzB/55ODXucX/TAtpzOLnFiFD8Ox585p02YZameBCanXmRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828285; c=relaxed/simple;
	bh=PNgF525nEMWn7yk7+UOHz3mFUzkN6wx8TYDDOVLAreU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8YgLW1M9CIDdafDvVAf8Dqhn7cmEWb6woBrLisZxGQQ8mOfiDARJ1TZ4peYKNbDa0ylhJnWfT+rgD1ulRh7GWL1RP3jNZUAnBAHSKhvTKvAqQqBC3jKAfNvS2xOTmCf/z9N6lVmZrNLoyTTgy2SCYGavy/SEa0yytRmzX0T+vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+rwegnm; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+rwegnm"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-383251c34e6so32188671fa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 05:11:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768828282; cv=none;
        d=google.com; s=arc-20240605;
        b=ZFVKHOjmkb6wbakvrQLWGtbx8ne8RpuqNWw43lG9LTdmT5Vg/Xx4Vb9XSQUNIGlVj4
         Bba5wNpYukbL5HwZODE1pJyh5HtO3o6HvYWz3rHNfH0mzqq7/QLYqvGmlUDFsTs211RF
         oOf3vu9Y0ZSRX1Bgi1ibFl9JMP1p8AtJ08lVILV8GJIy/dpkAJgPJiW/xBthzpbkwa1W
         t5GkDrioIm5GqW4xH/KTGJtTV4mto7rNsEU5PYM//4HcFFjFA5NGeSWkot1jIiIedY03
         oG5Apvdn7Oj9QFZdLlUzQXzF6S1jMt6e1xLG1w6z5whkggu548N08oXBw5VaVjjAOEAe
         XjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ItwFYjfCOTBQszs6NfuxWxeLpFV+ebtIxsieRROea4Y=;
        fh=x4Nfb+ZugqoA4tVPNwRmEb7mv5hTJCZLzHck2xXmdsA=;
        b=YsON3k6RFVdzUIfv/522xxfD2KvKuOCJZwpiT/vgx1DFwoaKIN/471iSEUj+QlQfXI
         qa4jos6jdDSMsvd8L4+Wt6PvlAWK9oa+kXxbJb+FvBzCdH9vJOn/uCheannZFoxS82wM
         cOzllIaBdeMSHbUqxMjShSb72WvBOUuRHKubCCEN4RIDt/Mh4IlTBKVaqH4/RmaTjA++
         j8ADm1K9yOA76zsrJTCtbWApHJkkrYy8t6sLbBnh4QzEeeTCvOchYGvOPNaL2jCS9Ksg
         qHGY9V1lV0MIjh0CKVwpw4lYG3qWOFKBMHFQJeshV0rVCgHvQSLaaOOtxPLR8abHf1yi
         v0cA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768828282; x=1769433082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItwFYjfCOTBQszs6NfuxWxeLpFV+ebtIxsieRROea4Y=;
        b=A+rwegnmxYjVSAv7k807QX7+ovWRF2YvP88Fe2NNRFxSMFbz6mJQ/MG/e51le6zore
         GqVsQBTaCc2Fcj2UP6j969uoVHfk5XBE6EFec8zWY/0HiNHysIt6S/uZ2XR2K02e8foK
         qtx7/3TT0cTQp7KRWvwBcZoRu+QakJOWFaZ3xmm2WXIAJd6ZkXBqTVqpV1RT31NNEGQ0
         O/8NM3LSInVEi05JSCyArCW0Yx/CSeVimYvFU4wE5f0Kgx0ij8GaevydotSzqQzw6UQ6
         o6jH8kl+GLBkqyWSn3Kg7ZEjQq+NJbfRXbejzUhTxZPtEAHuwAbJsc0PYVPpgEpZkX/u
         FS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828282; x=1769433082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ItwFYjfCOTBQszs6NfuxWxeLpFV+ebtIxsieRROea4Y=;
        b=m6q+rRWQFyaLI/5R9AJoJZ3fPqi4krr1NfIsVwG1bcjEcxkXjsCne6EOF0q/BEd1g8
         +i9SG5cxBiQgPV5Cdk7lApAfEnQnciglS8Jhfktza19NHGNTyYrS+lK1SQAimzxgx4wt
         CYvLVqAxhxFmIQ1e6v6z4GabeyYQE04QU09dEc23E2BUuZ3mwYEizTZRAcSzCNw7bnMJ
         Fp8sqYfVAy5V5NrIjU+VWdu6u3oJ0Xblcx+psgz/u00Bo2R9RtHPTPaLddBOq60Zk7Q3
         3WlLrJmqtDYj3LYlkqTiBBDNpeRhk7k7Z+WL/SqoPvulejkTt5HsOdU7+UisY8eULEzo
         ZSww==
X-Forwarded-Encrypted: i=1; AJvYcCXs2/7+qO21lXo2GYMmKnPEDgOsSw3iFyMiO5r3/3rebdn4kRmm6L5DnnNUsc0S8qQU10AOyF+s/awBHWOmtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJoNDfte+prf9n3vgFEEb/8cy1FrjhJ5zBx5jbaIP/HH3vcc4U
	eXyFhYo9iquW2GlzgbSym8HxY7Urm+MZKsQ1LifcPmrgU+aqn/JCb1YyV4rtwR54yFntpv32VBP
	SumvPfe/jb9NnntyX+AFjZ7Ho9Ts4LXU=
X-Gm-Gg: AY/fxX6F32ZFUkuP1gA8qbplAzhYcgVOiT8B9ngkaJ1+exqQ6sJskUpB+Qadlk8Hi+l
	bYrPVCaRCjphfjvPe0+L39t46C3HSHdld+ofQMvcoH5vfdz2Fgknb8hL0EE4DAVoTzIdnJWKm+1
	mVdj+ephh3GnaGl9dJb3TAfzU403MOyPXvMBlansbQFGzK5NkZBSCDjC/Zap2eyrAJWWkFJ0Kmc
	YM6s73NZfvtZ9NrFWEG3XN91rnvuiYn+BxVb+9reqQAnN6h8Tm9w/FjnLo4zdOe2FEPh+Mhuj4t
	pRfDSbu/VsCF8cALshXQleHJtIA+EU95Ouz+7Z6jRkjQKTTuTZn+ve5BY0GBI2yKoszhOXPUjKE
	kWX/FLHyJ4MeYj+1JKhw5vqeGSHRWm+Ygk5+haExuFQ==
X-Received: by 2002:a05:651c:1446:b0:37b:b140:e512 with SMTP id
 38308e7fff4ca-383841aa2d5mr36132541fa.10.1768828281885; Mon, 19 Jan 2026
 05:11:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119033006.1453006-1-sunke@kylinos.cn> <20260119033006.1453006-3-sunke@kylinos.cn>
In-Reply-To: <20260119033006.1453006-3-sunke@kylinos.cn>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 19 Jan 2026 08:10:45 -0500
X-Gm-Features: AZwV_QhhoALVpAWNrp8lEkjK0sgRTg2af9r9XQh1G0CZwVsc6bvtlGTpI-Z353A
Message-ID: <CAJ-ks9mmk2sQF0nFQ0chz9=cuRUBf9KJKzk3thv3078isOMBnQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] rust: fmt: add HashedPtr for safe pointer formatting
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 10:30=E2=80=AFPM Ke Sun <sunke@kylinos.cn> wrote:
>
> Add HashedPtr type that formats pointers using kernel's pointer hashing
> mechanism. This type can be used to safely format pointers without
> exposing kernel memory layout information.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/kernel/fmt.rs | 57 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index 059c26dfcfa21..b3501a11c7a3c 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -6,6 +6,8 @@
>
>  pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
>
> +use crate::bindings;
> +
>  /// Internal adapter used to route allow implementations of formatting t=
raits for foreign types.
>  ///
>  /// It is inserted automatically by the [`fmt!`] macro and is not meant =
to be used directly.
> @@ -135,3 +137,58 @@ fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> c=
ore::fmt::Result {
>          )*
>      };
>  }
> +
> +/// A pointer that will be hashed when printed (corresponds to `%p`).
> +///
> +/// This is the default behavior for kernel pointers - they are hashed t=
o
> +/// prevent leaking information about the kernel memory layout.
> +///
> +/// # Example
> +///
> +/// ```
> +/// use kernel::{
> +///     fmt::HashedPtr,
> +///     prelude::fmt,
> +///     str::CString, //
> +/// };
> +///
> +/// let ptr =3D HashedPtr(0x12345678 as *const u8);
> +/// pr_info!("Hashed pointer: {:016p}\n", ptr);
> +///
> +/// // Width option test
> +/// let cstr =3D CString::try_from_fmt(fmt!("{:30p}", ptr))?;
> +/// let width_30 =3D cstr.to_str()?;
> +/// assert_eq!(width_30.len(), 30);
> +/// # Ok::<(), kernel::error::Error>(())
> +/// ```
> +#[repr(transparent)]
> +#[derive(Copy, Clone)]
> +pub struct HashedPtr<T>(pub *const T);
> +
> +impl<T> Pointer for HashedPtr<T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let ptr =3D self.0;
> +        // Buffer size chosen to accommodate pointer formatting
> +        // 32 bytes is sufficient for all pointer formats including hash=
 values

This needs a citation please. It also isn't clear if you took into
account the "0x" prefix used below.

> +        let mut buf =3D [0u8; 32];
> +
> +        // SAFETY: We're calling the kernel's scnprintf function which i=
s
> +        // safe to use.

> +        // The buffer is large enough to hold the formatted
> +        // pointer string.

Isn't the more relevant fact that scnprintf never exceeds size-1, as
you state below?

> +        // Using "%p" format specifier applies kernel's
> +        // pointer hashing automatically.

Irrelevant to safety, no?

> +        let len =3D
> +            unsafe { bindings::scnprintf(buf.as_mut_ptr(), buf.len(), c"=
0x%p".as_ptr(), ptr) };
> +
> +        // scnprintf returns the number of characters written (excluding
> +        // null terminator), and guarantees it never exceeds size-1

Please strive to keep comments as proper sentences, including
capitalization and punctuation.

> +        let formatted =3D core::str::from_utf8(&buf[..len as usize]).map=
_err(|_| Error)?;
> +
> +        // Use pad() to respect formatting options (width, alignment,
> +        // padding, etc.)
> +        f.pad(formatted)
> +    }
> +}
> +
> +impl_pointer_forward!(
> +    {<T>} HashedPtr<T>,
> +);
> --
> 2.43.0
>
