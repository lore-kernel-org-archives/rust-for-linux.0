Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1692D315520
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Jul 2025 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470079; cv=none; b=Gjvedz5uihv2i0QCB+R0MFXgBAcxPBMyKrcjMcX/QCrJcPofyN0d3alMCdA4qQLbT3lFXicIcUPdUdpk3daYALgBCTBgwHwfyFDfDsIpmwDF9ZTbNHGT+dfM6wB/bh0liM20x11cRk0x4p3Zqer8YwzbEEK0o4CzijYOsmc3ctA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470079; c=relaxed/simple;
	bh=R3w2XCZ+9hC/UQRD0VOIOyl0Fwy/AYwdVSqZytDRbyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbFvdnugZ6CJ0PdkVTD7HQvkg7KL/S5sKy3SHF3DxmhmF7nXmMLcLHMAlRnk0Q5cl27i9TpmP6IJPQhRBlRGd9n/kwb5kmxW53yhro/OF0Rakzljnss4ss+LvcEBeDrvn8vBq5rpr65GkOLs6Iyv1KIs0BpNyedMOtpfJIUN+zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fSRIFJpu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fSRIFJpu"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so5828481f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Jul 2025 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751470073; x=1752074873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugfvMw37FYCbNgp16hJSt7OdezX3ZWc2zEhd8WWY3I4=;
        b=fSRIFJpuj7EbDCIioeymFx4JpGmeIBGUU8TNs2Sms+ZzpNxPexJaygwc5h8jJjC2kh
         h3GjtjDlVwuNtZAizzbxzdybHmIO5zRDx3J9V9c+jX8C+h648/XqhIWcA1jfPfeZR9O0
         keB+6i+zgTBlWaET3Y3/oPjvY9QcU1WUObl0VHr2uLw2rcSxNCKhF4w909PmbLbf8ysC
         66TrsnLYfhmQBMsy9rErWxotOedb5jOOI/j5kH0a+bOayASKLHwWyC5Dpf+E3gchb51M
         BHdprCwvo3QGnXASC1fryotJTfXSeMS4GadXHyyLduDGbkBw+7t2Td1WtIIsYIxaPDw2
         4KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470073; x=1752074873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugfvMw37FYCbNgp16hJSt7OdezX3ZWc2zEhd8WWY3I4=;
        b=tUIidhBj7Zf9p1+gRKX0kmNv9jhr7YixCq6nGrDKSijUFlWS5Hhy/G2l0cAhgSvE9D
         fpr4rFw3+73RLzg//WJY1kTMYbDEP4+gwtJUP1nga20jELUtBgWRB9THHXZKPHjPuJ6p
         P0aqirxYqfbBdmnrw0HYKQQvJqcTvYdGiC8z1LAVabX/UF9R2NeuQwMH7upniqYFWv9B
         oM8upv8/8DVzgyQ3G1/Ujss0IgE3h5PiDVCFcDuxgybpt9QSajDSSIgoVkm6dibvRX3h
         SrKopDQamk0dJFPdGW6QVO5QscXxGLW133qIZjHW3vjnUEByCmpciv3gK4xnkLSNYgHE
         XPgA==
X-Forwarded-Encrypted: i=1; AJvYcCXTfrJABYs9NNNdC9fptJzeNK3jk7HNk84jCRn9yIlCmf6eH2LO3F+TU/LuPUuKlXQLMgKL9cYRuJLMhJsJ5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0pWmtiK4xSJq61xU72fn5UqKFQAmKgCdZT59cizJsJJ4buefa
	OsFBoiN2Fa9rpDwrY4QdKhLN2WzDLQgSWE3m0zRnew0FI7Iim1dbUIBbXNe/HDray168dUowuCI
	kdGSMo2WqOit7mrki/UX0xlJzApXrXkD7uFVsnVDw
X-Gm-Gg: ASbGnctAEte6fdsoIzdkuxr/YeUK4OZjRW0uU0QB/vsNJ0u1UFFJzvvwBaAWRAODLL6
	nFgwFNSd7txhiYwBkw0y9O/U/wzmCoz5yXxJYrpt7xedbbO8R1PEwTCsnFcax/6YU03USxqVniI
	u3ZgCTFJ+NUUmxcc1oRMTCgkcXa9NjeeaBNbaX30iwRIj0
X-Google-Smtp-Source: AGHT+IEXxgvMAbbclIedX4dgfJFsqC/LVdMO+VKlBTNEwybEIPdTuBzGSh5PvnP88V7tuXnmlGMxd5H2vPZ17Yd18gg=
X-Received: by 2002:a05:6000:2891:b0:3a5:527b:64c6 with SMTP id
 ffacd0b85a97d-3b1fd74c9bbmr3330783f8f.1.1751470073141; Wed, 02 Jul 2025
 08:27:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org> <DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org>
In-Reply-To: <DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Jul 2025 17:27:41 +0200
X-Gm-Features: Ac12FXw61cMF6EsKoC5KmH0MvT9whf775volIzyT9NHNJ14IR5rW7yw5x1K4H9c
Message-ID: <CAH5fLgiOK-zA0qT1dis-BsrEAk96R+E8e_F_361w7kCq_uxn7g@mail.gmail.com>
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
To: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:07=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
> > +impl<T: Copy> OnceLock<T> {
> > +    /// Get a copy of the contained object.
> > +    ///
> > +    /// Returns [`None`] if the [`OnceLock`] is empty.
> > +    pub fn copy(&self) -> Option<T> {
> > +        if self.init.load(Acquire) =3D=3D 2 {
> > +            // SAFETY: As determined by the load above, the object is =
ready for shared access.
> > +            Some(unsafe { *self.value.get() })
> > +        } else {
> > +            None
> > +        }
>
> The impl can just be:
>
>     self.as_ref().copied()
>
> Would it make sense for this function to take `self` instead & we make
> the `OnceLock` also `Copy` if `T: Copy`? Maybe not...

Atomics are not Copy.

Alice
