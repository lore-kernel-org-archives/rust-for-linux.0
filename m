Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B67255E4D
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732457; cv=none; b=myRTFeqIj4YXM77NW4XVzsehNyRCLzJlR9s4vh0K6wtV2F972XGqDBPPf5/qsB3qR7A+OJKAxtIvDBmQ0A62sgqy1s9+d4OepNDYAz512m0hc1edRtTxD9wj69xcWq70x7QWWazNuiS7tdaWdQ7rTy1l9o1uNZiZNR7JKdATe38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732457; c=relaxed/simple;
	bh=1OVn0KFkB01R+Uuw/kKOKy7v+s712lF+9kQIDXUwMBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwjTXSacHCePmDZLBpcH6qmly5fUS9lEnAJIO1lmJ/Ik01ZpR/3+4xTKkDHeU9zVDvgXTQajhAMz4VT1iOEO4oxP1uPoxkRWCPPmT/CKug0XrvCVnV6TqgInh/XQmkFlmd21zoLEmCH4uOQ+U/qE7kx9GWj1jJfBquALNhli23A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PvHNopjC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PvHNopjC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso12258825e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 00:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740732454; x=1741337254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kl2IwG7HZDSCHcpQxlhObcRhTNm+twA6A6MmUqt9Yl0=;
        b=PvHNopjC+wa2RpGw3cu4DvQL6/whJ+WBeFYnAn7pyGAPD1XbKB3+mOdkdHlTENrGHf
         qRvEzlSEWraNJO7bpDcwYtV2xnAiqymb1VePiSIp/D9y7Ef7wgjQk4jbzQfyFiDQjXYL
         cRqyzCqJxx7/nOtx5cWpwSUNWKNfeCELNo7WjBp2Blkkw1YruUcoHoQdOqLIgTS/zkId
         TVLxIEO1k/fd8CALKrHLMlVQgdY1sur5XjcGMomwDLUNdNmubmMVHvELVYH3pSXU6P+s
         HGcpW0rcOLlFq8o5RPQ4jlY8n8z9BjFbq2Vy7t3njF/TgzcvRK1pV1Sl+D/j1oUfD773
         HKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732454; x=1741337254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kl2IwG7HZDSCHcpQxlhObcRhTNm+twA6A6MmUqt9Yl0=;
        b=BsIUKxALsZcxzkX0OsHyJM0nFf6PN612buuvAQXhhxPv733HopjHkVpFNqWTVTRJhA
         /9JadLBXbFowWoj7UoffEN8fYlJKDjs/3clFKkMzbYDvauVJi/iTaasfjff4KiC7QbjW
         fdEyL/UiW5EtAHp+wswIoW4Tv6bbW+FRjri2zR/HDpc1vjQ7bfxUJFY11zJUcX6uHsUt
         jviTVHprFR2sECMwnAw2JJ4awgjlT9E0gG1l0jHqJ9PHk+f4PL8nm60qQQ5+AlHSmLc5
         PlIpcvtc74OBntOyaM4JYnyvNXRozcoRKOrudX3DPzw4c8g8wxy9q2U4pS0Pxh7EUk0M
         sPBA==
X-Forwarded-Encrypted: i=1; AJvYcCXcsNEmaDHZe9usfEBUAf6v8NQWneSS3wSRiMHriJi+QDFKFXdcxdu7U2Pt0FGzgQ3alQL0YMGqg94Wf9bI8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxKsERqVsofsAzb0ink2poFc/dVVRGcZyNPuyqri/SrPqt0j7y
	oHcuIqjK43h3Iwua+4J3E9Jf1A7Qhtbh2xzWcCISsH+FBvHRV49dZY0MfAKmbeEQZ988+plSFfu
	UkY1mYE4FERP6CALHj8W9WzKkwVWPXSScXEUc
X-Gm-Gg: ASbGnctp0Wl/G794BI/eMEIIE49IcycITgrbmzgV5iExzoNBgrUGpu4U3PXvBMpUArK
	70uMNEZ4WioEmKwFPBLd93HnTIGwk1GCdEOXL753fveVHavP8nxy+nANGP3caKj7fz2bwLRciZ0
	cuGlQoDE4hFN24dwJTv7y0Nr3yMAgWafjTmCQM
X-Google-Smtp-Source: AGHT+IGwcgUW5OnvmV3QPHuKOrrO6Iuoq2TPQDupN4J9DP9Kay+XkSy1sz9g+96PyICWN0k33yRcOLiRB6A5tuChr1M=
X-Received: by 2002:a05:600c:1c93:b0:439:a1ef:c238 with SMTP id
 5b1f17b1804b1-43ba6704511mr18768095e9.13.1740732449733; Fri, 28 Feb 2025
 00:47:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com> <2025022714-specked-refocus-b701@gregkh>
In-Reply-To: <2025022714-specked-refocus-b701@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 09:47:17 +0100
X-Gm-Features: AQ5f1JpfAFri8l7nY7vFVmBZQXd_HNmIqbMhkShc48OxhVuvQ8No9II9fNH8noU
Message-ID: <CAH5fLgiFEUrKRdOPJ7HLaD5GqgOmz8wPNXqvkREksL=C1KmvMg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Check Rust signatures at compile time
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 8:31=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 27, 2025 at 05:01:58PM +0000, Alice Ryhl wrote:
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> It's a bit odd to sign off on a 0/X email with no patch or description
> :)
>
> Seriously, nice work!  This resolves the issues I had, and it looks like
> you found a needed fix already where things were not quite defined
> properly.
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Greg, did you have any input on the choice of header file in the third patc=
h?

Alice
