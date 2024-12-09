Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1EA1F931
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 11:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745489; cv=none; b=IFxpuJ7wuxpSHmE3qWpfIsuwMBtTIRMxcrO2rGeBiLlIvBswGqLjXXZPVpWXwYS1Eow4k4iy0A2btgQwHX62kmBu5v/S/wDnLMhcE0AzFscVzYmJMnqQyw+Geysws1vP0VkKZsm7P3WSCnS3zZLxd51BNrg5R3lGAgdYKF2iwlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745489; c=relaxed/simple;
	bh=Injq0ic2zq7l/C3nBoXE8epOqswcUlw+UPMoQYPHk4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gANq1wRGU7XAXPFTf2DXaKIMA8ad9nLrU/9JJTRDhp7QRu/OQALQ9CyHNZYbI6ViXrDjUo4n23nCQb9lfMVLu10PA4XNKiqOG/n9gGZHwaGOLdOV1GVA+0Eq4oNIvALkVRHFH6ToFGpnr4BSfNR7N1BMt0EpIUUkxLkg7SiZ4SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYjhsqpA; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYjhsqpA"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee94a2d8d0so653778a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Dec 2024 03:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733745488; x=1734350288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQ83LJ9CRvB7xfZb9hAy4il+2weRX41oHS90MBfSDFg=;
        b=RYjhsqpAl76P5DpeMkdE4P/1lXswNSiC/zbZqpQSBKq1xMkPP7tSGT6PXEFxUkNcYq
         leutJbjxMvGKWjFBML74JuZC3Cps8j7a1WuXXhh8KvkpZemBUviGNKClAdS8K5RbdZbw
         LWRgLFbnuOo13VIw5xJ2Vg3gA1pn+NRrNe6hwfUtN+ajUhzVj0kJF0jdYnTbe3PFQ51l
         nU5kWpWxXmObMeu7uo7OMsjSCEH5zvrbMwl563DHrZUteRiPrfYV6GxZiXvlxAOuAaZM
         qEhd/K3sG4DN/cJEkZxqHcMLzXg78EPo7v+sDXR9I6lWz1C0Kwk0fid0F8+KlngQzZ2x
         ASSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745488; x=1734350288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQ83LJ9CRvB7xfZb9hAy4il+2weRX41oHS90MBfSDFg=;
        b=KD3YMAPwkd9BNpGUTZlSePjrhL6RaC+6alNAryPqoruXzsNPGvgAE8w+3TtuzImg9t
         ypahzCTjF+qu2VBvMj6VVhMQMeQnClrGrqiC3FlRoNP0Hg6hWrIgOF1JzTSrSKQHkGv5
         nh1SrrGb9/1lxp/DmDj57a0uW4l2Z8+vsBm744R5qLcGMIl4L0m0aPiGTB95cGcMjnEW
         Y1hB/l6wjDWAKfAzoV01u8cJw2ZtowwYaUPhX6Vdihy5IbyU4pHbMrpXRJNNTrtci3pG
         RgSR4GiaKB+LKbPZiOoz4w+ZAqbQzAGNz+JfPIGBAUL649DWtwEJTc/Gpi222hknufWU
         padg==
X-Forwarded-Encrypted: i=1; AJvYcCUapoTxTFnbQbEQYiStUn8/M25iHDHSHz0F9z/fDkCmUlJgj4i47dsqKxgaGxxBkquSVnjodYzITWMMaldu7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc124uyqhKCYMqh1fhgUhZ5KkvJw5g7BKI8mKYv296u5sCHN12
	O7Zvq95/PSxfbCXe1f6KU1uFMmulesltgPlTN28dHROqMF4m0NeFiHPShUGxFdXGOzrCMMtaix2
	PkVmBKKOfrMRsgiP6R39iHEURpys=
X-Gm-Gg: ASbGncvcQX0gBTb4uj8rnYy6VYoS/ycOggq4ZrdSCYf4kvUbsW+6FfVuRtFe/IytEZw
	wbFc3QpyKs4XoG2xfjd9aOLod1HFBdwY=
X-Google-Smtp-Source: AGHT+IEWy/hoNlM+P2A7OEz0ONtz3jitn+CvoTdKJ71AabbQTQ7t8W8tNUrU95tq2zePuV0WzMg1Vgqx9iBnsV3EOKM=
X-Received: by 2002:a17:90b:1b50:b0:2ee:d372:91bd with SMTP id
 98e67ed59e1d1-2ef69462652mr7143602a91.2.1733745487843; Mon, 09 Dec 2024
 03:58:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
 <20241208222623.54714-1-dev.json2@gmail.com>
In-Reply-To: <20241208222623.54714-1-dev.json2@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Dec 2024 12:57:55 +0100
Message-ID: <CANiq72=F1WCFbU6XuZNtXj97eQ7Pd9kh4sxVMyZVkJv4Eedbpg@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add #[must_use] to Lock::try_lock
To: Jason Devers <dev.json2@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 8, 2024 at 11:26=E2=80=AFPM Jason Devers <dev.json2@gmail.com> =
wrote:
>
> The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
> currently does not issue a warning if the return value is unused.
> To avoid potential bugs, the `#[must_use]` annotation is added to ensure =
proper usage.
>
> Note that `T` is `#[must_use]` but `Option<T>` is not.
> For more context, see: https://github.com/rust-lang/rust/issues/71368.
>
> Suggested-by: Alice Ryhl <alice@ryhl.io>
> Link: https://github.com/Rust-for-Linux/linux/issues/1133
> Signed-off-by: Jason Devers <dev.json2@gmail.com>

Please use the version option of `format-patch`, e.g. `-v4`, when you
send new versions, so that they are tagged as such. Otherwise, all the
patches look like they are the first version, which is confusing for
tooling (and people :)

Also, in general, it is best to wait a day or two to give people a
chance to review your patches, so that you do not need to accumulate
too many versions.

> +    #[must_use =3D "if unused, leading to an empty critical section"]

I am not a native speaker, but this sounds a bit strange. Is it
written like this due to how it gets "rendered" by the compiler later
on?

Thanks!

Cheers,
Miguel
