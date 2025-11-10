Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D133128C8
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 14:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762783218; cv=none; b=nK3h2ZwIi3jktu69HJcipWJYte4VcqisqukbNbHXr9NKyTKquR8k8UbF3Jy0jsR+4DwWoGJ75Is3DATv9Nnu1mZ0brnws1dv5lXOIiLyt3Bk/uOT7U1dTh/OkPdzjnZ4Mm6Clt84vhstggE3PS4tWpPrioB+ewbA2TM5PoiDTWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762783218; c=relaxed/simple;
	bh=eJov8sxXTi+Gh2pduYWspNCV5kJK7k2jP3ctRTuMhbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNBY7ZEmtyR5lm9gI4R40JYro2/XAiCLKyoDm1WatPEkx1xnPG7QUnpODwM/iyN2u2JeNH0vqYPc1RaBnd1g0DmwhZXYkwAy0SIzvCmXdClH+zSSB+B223pj+/8zogC6ZPGGwW1LB/1GDDJ76gzkejN2y0ZxeZ7J0xPlw9Papf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGN2IhBl; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGN2IhBl"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-378e8d10494so39119601fa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 06:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762783213; x=1763388013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVYT/VhEIVxQzUBJybe7sV/3JdR14wUuU6Ka/GjxVLk=;
        b=TGN2IhBlaTEbjc22PmaK5T3Uv0PWywKRJxaFXHacGXNmZak5RuwMau/1w93gK7eMUo
         ElWkdtx382OBMgX8bXNYeujzuI3x70CGbYur5MCsVoFjHfusgIg7PglzerJsZKbNrCkU
         wq2uXmV+azNguZdkRqMjFuKJBf+eLz2hZtIIeyxt4WpOKuMgFwnm9FlardHreLrXPgvz
         dYzgprn5TTn+bcxo3/igcRQWKXWa1qYxSLTGxNNq6zM7X0YFZe1BiWTusjEEsjKp0R6E
         jgCSYgiREwoyYHrV1B+LMvCHI8xXhkIcTQYMYXwAISp/n3FltuzG7glB54wB+gl5ZZjK
         QdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762783213; x=1763388013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LVYT/VhEIVxQzUBJybe7sV/3JdR14wUuU6Ka/GjxVLk=;
        b=vUH2GMjFNueGI+WQkmsJS2dHqwe6a/9TO4XBp2D2mDH64Wgg8tp4dslduUMYrJVHUz
         zVcNhwxHPGvU3NAGsoAe/vC2iGmsCfW/f+jOhbA0Y2uX+QBTkZn9cF9cjFc7E0JO9VMi
         ntl1aMUuI7sOt3MAvzK79EsZ5HxdRXUEW8TwnI66t3gBDRs6slNXDsMjhl2MQ8K0cdEG
         2whJK5RxQtrDX97y2NgIb9qszbDnV2Ep9/+VRDqfWfueg046CnFFii30Jqzrpl/N5uN0
         ou6Ih07w1PCPJ3Aj3EShwvtlib8KVhEqeLAvSkDMxebjFq0EsAZu/M+4Bcjfy1LQf8zE
         IOpA==
X-Forwarded-Encrypted: i=1; AJvYcCVEGCqqzpEViQDSt6/GK0CSErWMM9zhgxge8r5N6txbqCr+5KGPA1xJ4C2OYy/dtnLqgRiIn2WTLONp3rxIvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlnOBn/ySkX/yEaYNWYLjVdNodStuXyazmS46r1QKVIvPK2Qc+
	lWsxJjM3FMFxyNgVpYSu6KjRiKjvmqYMCjjxcLJm3U9mgHyO/+tw54hCRvc2LRrVcWWU+/5wmqI
	T7aUKaB5wi2bAZLngb/WtLBF8hUG/Y40=
X-Gm-Gg: ASbGncsyDT5uj0C2o+QEX1TSN7W422IX5n7sJJrb8OmFHMe1hopXk+sPy2LlskBTunZ
	HXn2zXwo+uDCsL745D12BdGJAIAFoExKjqewGgtKdBRgCGeWiybDT8QNohs0U9TL8vLRWTRVim7
	EXpmcbL6wFkW9eYmYE/7Nu7KzKw8dHryYsAM4XpIVpnIj/poy351JZm5CTEODF9RaTDORRFlTge
	4ZQGF3PM/V3ZXt+DfSIb2lB0Y3ngR8UGqAWFGJuZh/z9W/YT+rPhZkB6UH54Nr+6ARtk6nXzmV9
	E8weP+9laRVWVJxkeZycn5/WJytFJIVSWnNEnl4f3BrOkDBDornOQscgyikQSmmVvw0fxDThJIb
	8DQG2pR0ysiQUPqh+Vpk38heB0EG0AGI=
X-Google-Smtp-Source: AGHT+IFDSVuabqggh+mSc9Cv0gLX88JlD+yln8mfSrZ8kHv17LjSYjMkiPz68si9VVh7YDPXvAkd3eIBuIqRDwIHPn0=
X-Received: by 2002:a05:651c:1108:10b0:373:a465:292c with SMTP id
 38308e7fff4ca-37a7b1f8bedmr17249661fa.21.1762783212505; Mon, 10 Nov 2025
 06:00:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110-binder-bitmap-v4-0-5ed8a7fab1b9@google.com> <20251110-binder-bitmap-v4-1-5ed8a7fab1b9@google.com>
In-Reply-To: <20251110-binder-bitmap-v4-1-5ed8a7fab1b9@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 10 Nov 2025 08:59:36 -0500
X-Gm-Features: AWmQ_bnU77btn6iIIiqDuiXBr5_iNKPL8eMsWf2Y-R6Qo-sEwQVCFdTpga5wfIs
Message-ID: <CAJ-ks9kvMQ9tUMZyM07jRr8O+pJ6RRvCZodenB==tzDChhHT=A@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] rust: bitmap: add MAX_LEN and NO_ALLOC_MAX_LEN constants
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 8:06=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> To avoid hard-coding these values in drivers, define constants for them
> that drivers can reference.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Burak Emir <bqe@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/bitmap.rs | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> index aa8fc7bf06fc99865ae755d8694e4bec3dc8e7f0..15fa23b45054b9272415fcc00=
0e3e3b52c74d7c1 100644
> --- a/rust/kernel/bitmap.rs
> +++ b/rust/kernel/bitmap.rs
> @@ -149,14 +149,14 @@ macro_rules! bitmap_assert_return {
>  ///
>  /// # Invariants
>  ///
> -/// * `nbits` is `<=3D i32::MAX` and never changes.
> +/// * `nbits` is `<=3D MAX_LEN`.
>  /// * if `nbits <=3D bindings::BITS_PER_LONG`, then `repr` is a `usize`.

Should this and other references to bindings::BITS_PER_LONG be
`NO_ALLOC_MAX_LEN` instead?

>  /// * otherwise, `repr` holds a non-null pointer to an initialized
>  ///   array of `unsigned long` that is large enough to hold `nbits` bits=
.
>  pub struct BitmapVec {
>      /// Representation of bitmap.
>      repr: BitmapRepr,
> -    /// Length of this bitmap. Must be `<=3D i32::MAX`.
> +    /// Length of this bitmap. Must be `<=3D MAX_LEN`.
>      nbits: usize,
>  }
>
> @@ -226,10 +226,16 @@ fn drop(&mut self) {
>  }
>
>  impl BitmapVec {
> +    /// The maximum possible length of a `BitmapVec`.
> +    pub const MAX_LEN: usize =3D i32::MAX as usize;
> +
> +    /// The maximum length that avoids allocating.
> +    pub const NO_ALLOC_MAX_LEN: usize =3D BITS_PER_LONG;
> +
>      /// Constructs a new [`BitmapVec`].
>      ///
>      /// Fails with [`AllocError`] when the [`BitmapVec`] could not be al=
located. This
> -    /// includes the case when `nbits` is greater than `i32::MAX`.
> +    /// includes the case when `nbits` is greater than `MAX_LEN`.
>      #[inline]
>      pub fn new(nbits: usize, flags: Flags) -> Result<Self, AllocError> {
>          if nbits <=3D BITS_PER_LONG {
> @@ -238,11 +244,11 @@ pub fn new(nbits: usize, flags: Flags) -> Result<Se=
lf, AllocError> {
>                  nbits,
>              });
>          }
> -        if nbits > i32::MAX.try_into().unwrap() {
> +        if nbits > Self::MAX_LEN {
>              return Err(AllocError);
>          }
>          let nbits_u32 =3D u32::try_from(nbits).unwrap();
> -        // SAFETY: `BITS_PER_LONG < nbits` and `nbits <=3D i32::MAX`.
> +        // SAFETY: `BITS_PER_LONG < nbits` and `nbits <=3D MAX_LEN`.
>          let ptr =3D unsafe { bindings::bitmap_zalloc(nbits_u32, flags.as=
_raw()) };
>          let ptr =3D NonNull::new(ptr).ok_or(AllocError)?;
>          // INVARIANT: `ptr` returned by C `bitmap_zalloc` and `nbits` ch=
ecked.
>
> --
> 2.51.2.1041.gc1ab5b90ca-goog
>
>
