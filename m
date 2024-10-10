Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F4E1C0DC1
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557904; cv=none; b=lPB5djXVzjitptqsIAySRLNy4tHGKXmO7bXB3r679yYPFXPXNWxDZvZypAsdJdJVStHwVQFI/U6qc2V+8iaT1puFEJA20BKCU+F0JAWVXMJoegkgkDhyU52tGP/cdMgWWI0zUIYqIxZ/bcw3vIjOfXo9/O8qMgTdxPtcf4TJ9d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557904; c=relaxed/simple;
	bh=StoaWEIYCCwjnd/+Bfx66/ND8mpJjgF5frrP6tUdr44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8paxVhEcaEdHJa+o9aEPxAGtkgippb+kuxe3xbdSjYbDNpZ35LI5026DMBTAMmCEWHzTuEb3NIksmpS9NNofzGdABP+XiopoUv3+hZ78kAg1yn9wjFzNckRO/sA14nBMd9XIlKuyWaV/vtGooZCrHPNvDPaWK/jpKs99mNkK40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oyriwGmb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oyriwGmb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-431160cdbd0so4556425e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 03:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728557900; x=1729162700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StoaWEIYCCwjnd/+Bfx66/ND8mpJjgF5frrP6tUdr44=;
        b=oyriwGmb0SYdoNYaKJKK0DV/Nsq8B6E5ts/qZXwUjE+eYIRG9iHrBHSm2NuOvEJLT0
         W4vMmx3v0ZAO2pWTMuFsWpnIw7oRzJddO0KaSk03bZ2oEE4/ug8uOQg6ySQL9qWhgnNz
         bi51pKldd10Dr6knemch1BJcSkzRF91IAn/t+nJf28tNTz3PLL39XI1dEodlCTHGxMfE
         i/Od99sw/meHoiux+1nme7YH7cTfuCPa0XXOta1VuO4ivTzBX9aMll/fhALyHLZSQtCE
         rVCO3hGowiG23KJk01F3LlgAsvBAzpR8uuTnEgAVKRjGZpgzNqBMSSFmpSFfLlxnhy6n
         Uf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728557900; x=1729162700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StoaWEIYCCwjnd/+Bfx66/ND8mpJjgF5frrP6tUdr44=;
        b=a3a6n7qdCnDKj/7QuPBxrQJEHk7N6HVHEWvAiRp2DiTvGLb9Kr5V/X0M6B1MoReW7W
         ZLBaYqE3GpdD7xJ0gBZ9vmZHQNK6+pCTrHGio7jAtbeW9ycXqdqNYelnP4abEZC98QBW
         cpTQDbcmdsb7oIGlx9ZR1SKnXsOJhz7zlphM/0xzlpJcoApE/QasG+K8byyWFyscldbu
         hOsIx39HQ3m2Kp/kG394N/KNi9M6OoD0o8q2Sr5PDK2SM+rYAykPrUc/M4PFlCxF9jPu
         +EpVUgCEj4ZdLeSLtlrrIbCIiSh3zXiqJfDz+adNBrJQiKQ8x0v7yLY+EUmMV4chw3Vf
         OfnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSiL25E306JN7X6h2FumUKAF/1Vzub/DGlIFcpChHjJ+lsUqm8xqDbW+rbBqez2aGIDVgdBbWzDz/69JVcJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYJq4nPQ61GBKgFmgGIUM7kbN+UOJz2sato9DmnvJiuBN/Yzui
	zG8AqUHrvPEuaNgjGWD0xXhL3B5zOB0Ln4SYZ9S9Y8T8w6EDRwPYY6Rud7HGLVC7YN3p/DUkVeG
	Bd58zkZRSL//IkApVdjHe14Hc76Wbw4alXl2D
X-Google-Smtp-Source: AGHT+IG6zteYy0eiXshByN3a31ubFooYapYA71mK/l2zbvcpHK0YoSgYWnV/kyVCloGT0HPQCGElonWjcU/HzmR4ZZE=
X-Received: by 2002:a5d:4092:0:b0:374:c613:7c58 with SMTP id
 ffacd0b85a97d-37d481d300dmr2263009f8f.29.1728557900384; Thu, 10 Oct 2024
 03:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
 <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com> <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
In-Reply-To: <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Oct 2024 12:58:07 +0200
Message-ID: <CAH5fLgiqwdKgEux9A-SFAWmhbosW15Ey8j8deKtQa9r336vXZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 12:55=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Oct 10, 2024 at 11:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > From: Gary Guo <gary@garyguo.net>
> >
> > Each version of Rust supports a range of LLVM versions. There are cases=
 where
> > we want to gate a config on the LLVM version instead of the Rust versio=
n.
> > Normalized cfi integer tags are one example [1].
> >
> > For consistency with cc-version and ld-version, the new version number =
is added
> > to the existing rustc-version script, rather than being added to a new =
script.
> >
> > The invocation of rustc-version is being moved from init/Kconfig to
> > scripts/Kconfig.include to avoid invoking rustc-version.sh twice and fo=
r
> > consistency with cc-version.
> >
> > Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-0328=
985cdf33@google.com/ [1]
> > Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Alice: when I apply this, I will need to add your Signed-off-by here
> (i.e. when handling patches from others, you need to add your SoB
> too).

Oh, sorry I forgot about this.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
