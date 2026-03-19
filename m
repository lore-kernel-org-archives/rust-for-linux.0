Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F637DEA4
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920701; cv=pass; b=WmghrzHJDPT2McNg6Drcaue854w6/4KlDzxR6Tt6bfD/I8Zri4KCvKdFo43nkMkgPImhLhKhqiicfCForPxXL5/nMTJAIOgf0BQ+3IzY0nR4vVHFqJNI723mVUNypK3Zbd3hRJuEMpvFT2WF5xHoFMEIxs4kZnYuTKsoZN9HBe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920701; c=relaxed/simple;
	bh=jbaG/PqEIG21QZ3ePm59YLt1fbFqha0ZeCW2lG0i3w4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hi3qepeqncVj8foXBp8JI5AVHNIEpyktuyLJbfmtuBUbtjakGlL9ecWTKh4N54IZBGepaqhnJNDP2MDJ5KFJy4DS1P3AWyJpX7t9j3m25ItBULXUFS0OhhYqUY3Rjzkq4vIn7jvk0j7OfE2qe5m0lW7WMuneuibG7ri4rfao/n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FLeCxn+X; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FLeCxn+X"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4327790c4e9so379701f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 04:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773920698; cv=none;
        d=google.com; s=arc-20240605;
        b=hJ0Md3WQ2xWrtTBuPcrw69t4N07cMs1etDNWnHuvC1hq1oKBiIBnCEVfXISRn3SEEn
         Gx8l3VNQs+vf7RclYV8mzdpJrxA8U7VkE25+Z3aoAQHRbZu8hRycrh1Tm0h+Fu7GKODX
         s+6k8JLWonVQ7L0eKAWV31ciXXDZoggJ5Mi98b/XqGtaeygZx4Z8zhY/MNE//H/TSXNe
         aGo6yzuxI2paeL3yUzuVC+4wTW2CtaGBcP+L+BK0KW7GAuUl/iVlpaEs5fKsWddsTb7n
         KgAO0xHSdOUma1ur5hioVwUno9mO05l5wWBpvMWbNSaD9muY+6xsPTw/xidF1ozDbXad
         xtcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zbr1Hl/781eUqZ5+RYHCjUCdCxGAQ0+UKwddrWf252A=;
        fh=gtG//vl0QFQqoIrZJ6TnaWWN8TCHdQei3xMhquoTP/A=;
        b=aiG5bizBBt0CZ2EzNtSJR50WUp5IFMhsutJIlSKkLS+7icqsQnTvyNHaFaW6AeyFks
         EjhRjF/wRP/Op7L8k/odyTBH64zYzFVC4UVHcfp+pEkw5Wx7SsmiQhkKYQS6bzmo4m3A
         T0NWE6PS3XViF3DvjNQsNhuHfLHYS21zT0YHup8pZIk1QKPQctIjJmpA0SBimldUsu3T
         RS53Dt2rSPSCKh5zOyI6+d+J84ATQi7lnF7jiXg7r0gpfPpe+EaDBbH7qutZlz8IkyP8
         E+jFcdXrR8pTcnn4MI/OtQvLF2mnCwBOy72Eq5XmLTrAR3z1SrWKnkXrGXe/qlZwlSor
         g+2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773920698; x=1774525498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zbr1Hl/781eUqZ5+RYHCjUCdCxGAQ0+UKwddrWf252A=;
        b=FLeCxn+XIgRJjYzqz8w5eS/NRYcFBbRjYC0+znqoMxZTJVsIiZz7yi3uoJS0AhZRWV
         jYacsaGHWxrTOgJKvxZ7LxcT74g7Byce6jLT06mrj9MO7YvQ9DwxI9tZtMXPfDmafgvG
         WI/eYtBQIdILggwTaZj0xfKv4a6secGmsfFbtUK2it8eUEGuzno46Qd1LjY5PS4WWF+r
         d92QF5TJc4BdDlMqb8S+XMI4iycsvCOig+OVrhQsXm/dy6neu1U8uq2InrQ/6wwieKic
         5QMuUfWUcfpobneUGqgBAsu7rURLsiMFYDXd5epWvPxiakOqBKVYK9fCF+pn+rYLb1Rf
         QAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920698; x=1774525498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zbr1Hl/781eUqZ5+RYHCjUCdCxGAQ0+UKwddrWf252A=;
        b=OQdrZO6KmDNGISDnvhMDFEIDzTrHcun+/kiLuch5T+4BBSqkUjqYbnPCUwJQdmv0sv
         uwkic9bjU4oyFNY7bQJ+QuKMDd24FPXzvNujrtXR8qFdsUeZTfCMHD5EKn/OEU+BhJCC
         Teixn2HrzChELoZ7vk6lEyHChDZdr3BvlgDSgQQFdcReUosknVRcDk07r4ro5LBxqcDg
         CHDJ0/MZNRPd+/Zt2TdIzOyj3QNMg0XKnoPCTFXwJYKfMXr+BYF4YWTurApjFVwZl+3O
         TnCoDHiuA5/kn5btVdOVq04WkGBgd+KhiMAxqqYWRNFma1P/lJIqNmKucEz2qs/DKNjO
         S13A==
X-Forwarded-Encrypted: i=1; AJvYcCWn5jf8+boYN1Rn5KwmjdEFdBjdKB75KLfSOINY/fbecMqoWopebVAMC0BCFh5ieuhsjudtYHMdaLnZL0SrWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxyDrRpVE/7MSkdBX6hlMxZ9y4GpjMpGK0WLN+E9Owww7gQn1G
	QQhW6hcC9ICJh9EANooW2UIF53CtVGKMLmzPRBItxnHbFRQZonh6oQmdpTSvWlGXrEfbtrmy08w
	PSwCdBEkU6T+GY4DerOdxISy7QUbFn6Wzb8uprd01
X-Gm-Gg: ATEYQzxcFscnQMGwdIaNdmp5MohiJ1bDK8xsfX3BOg7eYQyyDCicEfRSr1eWVF6roqT
	/MdlZsc0i5G3ZfZvpF2gY878sMpBA1zfYOsNFuye2Hb6DmsIuBh/5eA4CopRmooRf0hXmQasrZ0
	wfKAKX+P1vKb14xFPDiwE1nBNB0ODB0xM5VJoCryD4r5FRduEchJh1ScyMe8OrWcyeNaBDMmLw7
	6hl3kQAIMqV2470Plr6hOE025iLcLwKB45lrYV46CbtyJBse5FWLIIhjkH+BLk6hQuRCbW1RftV
	egLE4EBo7dwHRSFD3U+yrzjfhP+tMkfQN7kHl0WceI/rlzduvjLZIivIJ2+Yb+m1ni2erQ==
X-Received: by 2002:a05:6000:b44:b0:43b:5765:96a9 with SMTP id
 ffacd0b85a97d-43b576597d1mr3995568f8f.24.1773920697944; Thu, 19 Mar 2026
 04:44:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com> <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net>
In-Reply-To: <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Mar 2026 12:44:43 +0100
X-Gm-Features: AaiRm51I9hCb6E-7s4x3bNWQlwrbdQCQ_wMEyJrtvica5oTfej5ghV1R_rZkleM
Message-ID: <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
To: Gary Guo <gary@garyguo.net>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 12:31=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Mar 19, 2026 at 11:22 AM GMT, Alice Ryhl wrote:
> > This patch enables AutoFDO build support for Rust code within the Linux
> > kernel. This allows Rust code to be profiled and optimized based on the
> > profile.
> >
> > This was verified by inspecting the object files and confirming that
> > they look correct. It was also verified in conjuction with my helpers
> > inlining series, and it also appears to have worked correctly when
> > combined with that series once one missing thing [1] was fixed in the
> > helpers inlining series.
> >
> > Link: https://lore.kernel.org/all/aasPsbMEsX6iGUl8@google.com/ [1]
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  scripts/Makefile.autofdo | 6 +++++-
> >  scripts/Makefile.lib     | 3 +++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> > index 1caf2457e585..3f08acab4549 100644
> > --- a/scripts/Makefile.autofdo
> > +++ b/scripts/Makefile.autofdo
> > @@ -3,14 +3,18 @@
> >  # Enable available and selected Clang AutoFDO features.
> >
> >  CFLAGS_AUTOFDO_CLANG :=3D -fdebug-info-for-profiling -mllvm -enable-fs=
-discriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue
> > +RUSTFLAGS_AUTOFDO_CLANG :=3D -Zdebug-info-for-profiling -Cllvm-args=3D=
-enable-fs-discriminator=3Dtrue -Cllvm-args=3D-improved-fs-discriminator=3D=
true
>
> I get that it's currently named as AUTOFDO_CLANG, but this really ought t=
o be
> AUTOFDO_LLVM...
>
> The flag translations look correct to me.

Do you think it's worth having Rust not match the CFLAGS here?

Alice
