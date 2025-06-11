Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F481A7AF7
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668126; cv=none; b=BhF4Y7d/88EUY9VA0ehp9wF7DGDshLw98D1+3UBd0ceXR7V405R3rGKtzugVxQaJGOzah2TY9UxKxtgdd3yEdmSJ0SuBwjzgzwuvaa8FtClMTkgjSpO44uL6hPwPKdrC9e62KMtuSd4DhVmVNECUQZD1tGrx/Toy56leCqDbtaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668126; c=relaxed/simple;
	bh=wp8HZyLOC3rXTiPmHjUFoTJefTT1msqGjMmKBtHfquk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cciwg2/bnEXOuefR9SZBdjydlxSHdFNEQlZGNR4bP3MGk0392pXJugYCpK7ijZQjvY33pNnI6Gfn06HbLPBSqtL3/NdD0MzHT8FGT0nkakmYAfgm1zq93P71c/NpW3wjyiUlXz6X9TYGKTA0Xf2mdp0g+WVmTt3OHIh0e9Olzjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HIM5Fk3v; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HIM5Fk3v"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2ea08399ec8so75143fac.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 11:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749668124; x=1750272924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beC8Z65uROnyx1+hT6aGH8wiIbVvPAr55ja+xnQ3O4M=;
        b=HIM5Fk3vfRKh0lxCSAZeVDgIoHJVM+bp/0GwwlZ5JlZfDvUw9kxmQQ6TtVu3iTHQXv
         uj1kTSGyOsdtRdPsdVzWTMKH/R0Ttwc93jaJHlVD7etAsGOGEr7RwdNL7VAJVuESDmVM
         MzIWEnd1oIFAFn/J/mdcN6sEdVmCeAt+2XnBemqfn0lHukY/nscSvKzeUzhGJ8aJmYam
         SvO/LxpU/HZbufUNbUuBRHJPq18szAnvypoxY1hV+/Y+7BPsnimA8EhcIsX6uWhsJEM7
         n2khs4yOxMoTj5jf8RzAxMMP/nGNFIs+t6+YNHJDtSdrDiec3zXkB2ctVs7Dt8pSm6s3
         E/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749668124; x=1750272924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beC8Z65uROnyx1+hT6aGH8wiIbVvPAr55ja+xnQ3O4M=;
        b=XgaPjcMxDLx+kthufBMDxMYvJIitjjHR5FftoJLjEFHSoC195bJtYM9mSmwhkmzUi2
         1CXp3VaYj26UUCU3d2Lr7JOMrmerkFPiXvUrxhygwQVvUrjtqqfd5ce5urHAToQXorxj
         0KyZkiCowCUYFo2i2L5FEZZYz+RBA6uHXNDhiFbUYFLqVPwkmEsHJqTSRGDX1gt8dc+K
         IaOAsFPeIGZc7+J42PA3cC24m/gIBzJ/8P9DY02KWziLEvp8qduhFpbyfgxoePL3YsKR
         M5P/t61QJ8Hx3xkEtQjuRHHoTyEGJ1jt3tKk1r5T+1dENf18r46DBjc46ldyZOWKIWZ6
         3Rdg==
X-Forwarded-Encrypted: i=1; AJvYcCVJpVcJUfv8YudeUdpRLVagm4yCC4WIVnj6B0S+ZEHElUQ1okqZQ4IZ/4kJR9RZ6MWk2ypVn0u6pMi9fq8mBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2JvOB1bsHzTye9BmTehB98oQvJdTy+csyz5sAursfVRHyO0cs
	xTW2Da85BMgvTcTctif5NxzAQDH8fiooPmjO1x//xwKRm3G/Z/mlfQ1zzx63Ll8WeGa5adrnPti
	o8umvCCxK4h4UgvejCWog2socv99/7yWweNVBcWvV
X-Gm-Gg: ASbGncvJGa/SAt8tjjSS3GeSzcNq8RKqNV8cuai9Q6SmeRo1oDoKOrXoF+Su/y/f8oN
	So5O9mP/5TijVmVLjA0FStgvJ9lpx/ItUz35sircamFZyo5ZSokfCyBzrz4ZM31e2nD59IfaFvH
	HOuWKE15TpG305szdOusxDktq/0LXsjUncf6j7Pf8sq45974YI8EmTkgdmzqKJHNoWkcmYd8ZX2
	g==
X-Google-Smtp-Source: AGHT+IFm5koQ1am9XzCkDYWSKKHdTnpCmDx3ukx8uUs89uQXT6FQEXhC8vQNZ/zb7P0GTM6dRbspZekaaZ+IVXid7JU=
X-Received: by 2002:a05:6870:9a21:b0:2a3:832e:5492 with SMTP id
 586e51a60fabf-2ea96e50019mr2720181fac.25.1749668123822; Wed, 11 Jun 2025
 11:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602135231.1615281-1-bqe@google.com> <20250602135231.1615281-5-bqe@google.com>
 <pXt1ZkjyScL3fnnuyw12MHGyxxDunKpUjhGl_tL4kg8FpobamrUohmzQyqMxtCPfgbUmmPl4ZE6wco8Yqs6aLD5jLTD5ZL-zeNo8wk0uKUM=@protonmail.com>
In-Reply-To: <pXt1ZkjyScL3fnnuyw12MHGyxxDunKpUjhGl_tL4kg8FpobamrUohmzQyqMxtCPfgbUmmPl4ZE6wco8Yqs6aLD5jLTD5ZL-zeNo8wk0uKUM=@protonmail.com>
From: Burak Emir <bqe@google.com>
Date: Wed, 11 Jun 2025 20:55:12 +0200
X-Gm-Features: AX0GCFusngWoMukaoowA3Y9KxP77OHDb2fRjiDbystdMuSVSbnZshuD95D1DnoM
Message-ID: <CACQBu=UqBHD6XfVbjGfc+0i93TLJNrrHCrzHuzkd=vVU8H+RVQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/5] rust: add find_bit_benchmark_rust module.
To: Pekka Ristola <pekkarr@protonmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Carlos LLama <cmllamas@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 11:37=E2=80=AFPM Pekka Ristola <pekkarr@protonmail.c=
om> wrote:
>
> On Monday, June 2nd, 2025 at 16.53, Burak Emir <bqe@google.com> wrote:
[...]
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index f9051ab610d5..3f826a73bdbf 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2605,6 +2605,19 @@ config FIND_BIT_BENCHMARK
> >
> >         If unsure, say N.
> >
> > +config FIND_BIT_BENCHMARK_RUST
> > +     tristate "Test find_bit functions in Rust"
> > +     depends on CONFIG_RUST
>
> The `CONFIG_` prefix should be removed.

Done.

[...]
> > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > index 28c11e400d1e..9fefb2473099 100644
> > --- a/rust/kernel/bitmap.rs
> > +++ b/rust/kernel/bitmap.rs
> > @@ -252,6 +252,20 @@ pub fn new(nbits: usize, flags: Flags) -> Result<S=
elf, AllocError> {
> >      pub fn len(&self) -> usize {
> >          self.nbits
> >      }
> > +
> > +    /// Fills this `Bitmap` with random bits.
> > +    #[cfg(CONFIG_FIND_BIT_BENCHMARK_RUST)]
> > +    pub fn fill_random(&mut self) {
> > +        // SAFETY: `self.as_mut_ptr` points to either an array of the
> > +        // appropriate length or one usize.
> > +        unsafe {
> > +            bindings::get_random_bytes(
> > +                self.as_mut_ptr() as *mut ffi::c_void,
> > +                usize::div_ceil(self.nbits, bindings::BITS_PER_LONG as=
 usize)
> > +                    * bindings::BITS_PER_LONG as usize,
>
> I think the second argument to `get_random_bytes` should be in bytes, not
> bits. So it should be multiplied by "bytes per long", not "bits per long"=
.

Thanks for catching this. At least I had memory safety in mind when I
overflowed the buffer (facepalm)!
Fixed.

Cheers,
-- Burak
