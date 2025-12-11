Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A4D283FF1
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 01:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416429; cv=none; b=kr03wq2Y7qsZXlTdu+oYxRASlsTrZ5I6McyaBPIFTrBGEIMllx4gUspMCeYBdkLQCkR8kI4mbnaMiaDT9qxsLKhil6jq3EisCnxRjGAN6gXZTcfBc0UgwtxAGzy5wEAIdYHyw5MjVbSNm9NpzcTK23Kz5a7tBt/r6l2BCJgVUEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416429; c=relaxed/simple;
	bh=FtvR3TcXmArFBAGCWvI7194TwzmNDHpOH4im/F1ixdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPyvyInNQxWxjdUWzGXOFGEuR9YCHu9isuq3/aF9iFz5r5b9LacKestNjjoRScD1Aqe5HnCBaop1fqeOdKTNHu5W4Q+Nt2B9zED36HW+oM5Rg6Gn6Do3KXffl5KDrZ7ZOCyo4hillCHlNAkcrpLCF17qv23ya9EDypm3gBUN+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HGMK3uVM; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HGMK3uVM"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e2d44c727so145803f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 17:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765416426; x=1766021226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cg1YsISuOnCUtqvnZMML82MlmfwHoeNJCmajJONCOpo=;
        b=HGMK3uVM6JV0uUBWpmf91YPbDsexsdtdwHCMkOLeFCoSjowGaR/mJAiem+gCISh/gJ
         twwewvmm6AOA8Aoq87eRwEQ6EbE1zN6NVqFLhWDyrSWEDsG7EslGv1utDRJZQ3xQcFMR
         icnWKmhiE2Sgzlw4J+vd6uxLT3Q9QyDhchmGj/FN1woT3cyZ7EuUIpOHxj/jY6vTbans
         b+ZyWk5IcVJtlINiJi3K75kMrGMTBnp+5y+SbzQ/6Bwa6+tqEYiJ+BFRIhRmgzYQmaNd
         6pJG9v7dB9b+3sSX/lnsZDN6OFJmPch2yw2kPhuj1n8idG4q/qi9gNzLLpdRedQm6Edf
         d0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765416426; x=1766021226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cg1YsISuOnCUtqvnZMML82MlmfwHoeNJCmajJONCOpo=;
        b=MYvjasnEYkxPczcppOydUdFKFdT7EVno8MBs3tBoutzSdcGlWAgzrk9qupH5RNrW0C
         wus73C22Zy947PeVWgg923gGrIWLL02Qh6MWaSi25SrI7D1eiM3hy+jih2j6D9h9/5c0
         DmmA15WFjRhmOqLcLX62fk8qbIKTlbglNIHvecbOzIVlzhBhuLuTKh9/rJinwmrfvzSj
         KwRhWSrGShCUV2qO0HmreLrnGhx+oGD9uqvTYPcFbpR+ADamDvxDu6kfP+NubqTqS5Et
         Fi3mVUkuE8gGl6qnJK0XZcC4LLQWfy3LwMqCAsXeoKnCa63jGfJ4Bn4FcWGjAe3mHZhN
         VyFA==
X-Forwarded-Encrypted: i=1; AJvYcCXT2/SJ1Rfu1PzS742N8OkPEE6jpZ/NE/z3pNuBtozxF7Ghir4Dgo954RZpwxGaxBE93gD8hlhQauJ1DRtfVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2BIOi+q36+pcCU5j2ymEAGaJ5roX/KeRTTTQU6rHHTXfAjidN
	DVPmKxRqMwDCPabqoOV/jgJIp9kg9Qp3IEW2YUuna6yfUn+q82J57FRBvR+OEH3vih8ktiEqTbK
	tCH65RGSR5YN8ehZIubOyONGoKtIaB4q+JoXJz7AD
X-Gm-Gg: AY/fxX6qi1Jd/kqzysmij1wxPDxFQQUjJnxpr/ZHWUL42eQUQyx9xnSPJ4LIMLkTcBy
	aSbweWebrmKMGTkKzkg/RZGTiyK7V3DdYiz7XjJq28RZzdgHmcC/t2auKNPXP6zatBjR5vtUH3i
	1iCX25DVmLcQIGGPx/PKvY95uP+JoKBm6QD0rObcX2oudZxoRFeDbSfUcSePaFmCaUJ+0/dAFFi
	cHz0HknGrCHFFIZHKHlBbZ1gGZS5DjLkUUCTqTQ2A42F28eq/AdsZLzfsPhFyCB3kdoEaaZ665P
	zRq07w/CZC1X1MXV5H7YVylU4mXrIA==
X-Google-Smtp-Source: AGHT+IEkPrObU4LOsralZszxoL+/0wR9jmBsyTvSNG+zgAyCHSCocYJceeycj2ERlpWd+v4ydylPnqE5DukdwysBKgo=
X-Received: by 2002:a05:6000:2002:b0:42b:2dd5:42be with SMTP id
 ffacd0b85a97d-42fa39d9345mr3567379f8f.8.1765416426005; Wed, 10 Dec 2025
 17:27:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
 <CAHirt9i3q2Ny=m_kjCO=ARnO22Kmf-f2jVSGmYATG61euzh2gQ@mail.gmail.com> <aTodMdEWuXQXuLyy@google.com>
In-Reply-To: <aTodMdEWuXQXuLyy@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 11 Dec 2025 10:26:52 +0900
X-Gm-Features: AQt7F2rK7pXCmA7VyJjwGa7eI1ghKkOyj9hqhJdsTRSoN7q4YTUxXw49mbaTXa4
Message-ID: <CAH5fLggC88btfpe0Z+4+AB2SRWRwejCk9afVSymMDUzKE-7DvA@mail.gmail.com>
Subject: Re: Mainline loongarch64 defconfig+Rust build error
To: hev <r@hev.cc>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, loongarch@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 10:24=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Tue, Dec 09, 2025 at 08:20:46PM +0800, hev wrote:
> > On Tue, Dec 9, 2025 at 6:58=E2=80=AFPM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > Hi all,
> > >
> > > I am seeing in mainline loongarch64 defconfig+Rust the following buil=
d
> > > error [1].
> > >
> > > Cheers,
> > > Miguel
> > >
> > > [1]
> > >
> > >  error[E0425]: cannot find value `compat_ptr_ioctl` in crate `binding=
s`
> > >      --> drivers/android/binder/rust_binder_main.rs:317:38
> > >       |
> > > 317   |         compat_ioctl: Some(bindings::compat_ptr_ioctl),
> >
> > It looks like the rust binder driver also needs to handle
> > !CONFIG_COMPAT. Here's a reference for that:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/rust/kernel/miscdevice.rs?h=3Dv6.18#n410
>
> Yeah, it just needs a `#[cfg(CONFIG_COMPAT)] like miscdevice. Do you
> want to add it? Otherwise I'll get to it soon.
Oh looks like there is already a patch for it.

Alice
