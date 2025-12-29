Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53E83128B7
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767024039; cv=none; b=oS6+F35aM5GUGgC/2k09Z4TOCrpSnJenUk9QiWxliodw+qj/rLmRq6ctFwIJF6zR2hzlrlr82EWYvIkXOsuMjPoIyc5OedabsWC/qLLOJX2QnVZ5jaQPZs1lpkC+vtcQYtiBfsFj8bwoueZ/m8nYdRw4vJCSMx/nl95fagQamv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767024039; c=relaxed/simple;
	bh=n7i2fzBbJbe3+5C4PcbNAoSdmqwyu1VCShRhiguvvlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gn4UrAuSmOH16ZjkfWDJ8dbciPrJGbgyheKVbuaaI6u9pgLe0NizRYIIr8EKef4tjHLkicLU46v08+9QiRegbsp6E7RE2qMD+3vWNugxQmuVfPTWktSvZl+TY31bnCdhOVtNZIbSBeUmb8a8X0KrxlM6tWfi7p6seM9Kgld93Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgMCod7t; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgMCod7t"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37bac34346dso68388811fa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 08:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767024036; x=1767628836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+ylEWkv538m8gFh5166NDRdFPGt8shZlOXGBrAkWqU=;
        b=hgMCod7tAL1y+xKDBJJEr62avO955hE8E83RwlubezTxlEFoAdMGnxYlVYbwT/3iwu
         DOJoexMVLE2gjcpcwe5vW/VFYUBFucQgjSyt37H50AD0eepD64kAyMk19FhVuCLBkgc4
         iGikSJmLS6YdwODcY9V9Jvjng9xd4CLWAvuAfcAkIlRojJoFz2RH99Zce9LpjqDpz4FS
         xPJJUtBcUWIhBr/C2YISF98HRo6p35JZHn1b4kSCaB8dWvIbutXSkwLwd4Jqeq/DZ1FS
         d22jiu9afb+uQwSg2LpUFPBHksIp816PQ7NYyWzPp5RVrg7ofabzywruT/znmtzdWxMY
         Uj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767024036; x=1767628836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+ylEWkv538m8gFh5166NDRdFPGt8shZlOXGBrAkWqU=;
        b=OrAeFbkl7epI/7clQRDurwV4LfXMf9iVSUx6m5qmiHYg959mB+fgTtCqcS8my+ajh4
         h1aCxtEsSxa7Y/JEsZ5hR/72OOfMwUFRt8Kxy23si9hcsve9HymGpQeMGCRwkyoaRAPh
         ixD8lQHvc+WXRg3zuAdOKgrM3Ddqum6lf15n7brvL86t421yOQzz46hwZEMKCkThifN0
         OX6pvUssTFNyfUqc8l0DaaVcY4RwarF3o6chWKXFXNEOVx562Gzbb9grT2TKjIlMW5wv
         rA9yNsTRFoWSfUv6OZhrMa11EH1LvoRXbB2I29AAXjeEAeGa5K/ha/wgqlJXDnM+DbUr
         k60g==
X-Forwarded-Encrypted: i=1; AJvYcCVs+YLaHAA8YI7zw/hVbVoJIKLshRblPgosrk8KASBALRMVZ8IG/NFe/EqB6+8AvfgrTSJf3GAJgwNqcII9+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYWaMx8T7p8PORy36xX1YH/twnRxxeUICgC8IfAdcFnWQlN2YI
	rRv6ckZ/2AjZkMFPkBW/Ewq9qf/eH3/hiNbM8ag51QfV/IMiov2StRCQ3ad46F8vWtCA9jWvlDH
	ojV9pgzsa4cGP4HgAu3ygD+RkLdgva4M=
X-Gm-Gg: AY/fxX61ONMBhAmjZOK16NkWfMr/Qrk0kgCKOtaesDXK6ejNBhAY1gbdUSHI3socMrq
	CJhB2K3X6d8+FpIy+60VXU8I480aNoO1jKNvDDELh+UuWgZqrKNYCQ50MI1yEyuMCnA9L6ipvV+
	wGR36MZKNoDczR5ZvmDOmfaLs1vBGSYlbMSuZytmz9o5Hi0osqPjtyxLOUb2N6hxn7FLPLHeMSQ
	fsROho+JETigT+5I8pU9icq6DQWW+HepdbtezHLWI0xNlXcqiAyTrA/kHdM1SgCV82CB/SOxqLr
	DGgHuhikIoAOhSL+D5xAtIbc49YWcY4RkN8oi32NNAf55Ge+eJK/bmUIMrCPd4viYyJMBSObYDd
	Vji7PhuyCrSfsXp9eOkRMKWnj+hdp+v3EPXbASZB2nQ==
X-Google-Smtp-Source: AGHT+IE7554E5GVGLNAtXJAWtTnB3io8UW3P8uTXYcTg5VVbQ9j0Ufxjfm1TNNg3i1XSr2R3Pzw1UZgOb16RAiBKq+U=
X-Received: by 2002:a05:651c:1b13:b0:381:800:910f with SMTP id
 38308e7fff4ca-3812158e821mr90238121fa.17.1767024035648; Mon, 29 Dec 2025
 08:00:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org> <20251203-xarray-entry-send-v1-3-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-3-9e5ffd5e3cf0@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 29 Dec 2025 10:59:59 -0500
X-Gm-Features: AQt7F2qngmKldBDhrTW2byL6SIclNWzCEV7Qa-6jmkWIgt_QMBLz_oJ2OtXPYL8
Message-ID: <CAJ-ks9mqwaWMc0MTGOk+rKSM8W8spRmwiLGCkEjcSvF+d7QW7g@mail.gmail.com>
Subject: Re: [PATCH 03/10] rust: xarray: add `contains_index` method
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
> Add a convenience method `contains_index` to check whether an element
> exists at a given index in the XArray. This method provides a more
> ergonomic API compared to calling `get` and checking for `Some`.

It isn't clear when you'd want this API, and neither this nor the
example are particularly motivating.

>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/xarray.rs | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index d9762c6bef19c..ede48b5e1dba3 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -218,6 +218,27 @@ fn load<F, U>(&self, index: usize, f: F) -> Option<U=
>
>          Some(f(ptr))
>      }
>
> +    /// Checks if the XArray contains an element at the specified index.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{alloc::{flags::GFP_KERNEL, kbox::KBox}, xarray::{=
AllocKind, XArray}};
> +    /// let xa =3D KBox::pin_init(XArray::new(AllocKind::Alloc), GFP_KER=
NEL)?;
> +    ///
> +    /// let mut guard =3D xa.lock();
> +    /// assert_eq!(guard.contains_index(42), false);
> +    ///
> +    /// guard.store(42, KBox::new(0u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    ///
> +    /// assert_eq!(guard.contains_index(42), true);
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn contains_index(&self, index: usize) -> bool {
> +        self.get(index).is_some()
> +    }
> +
>      /// Provides a reference to the element at the given index.
>      pub fn get(&self, index: usize) -> Option<T::Borrowed<'_>> {
>          self.load(index, |ptr| {
>
> --
> 2.51.2
>
>
