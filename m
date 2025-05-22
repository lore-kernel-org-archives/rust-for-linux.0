Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1115926E15A
	for <rust-for-linux@vger.kernel.org>; Thu, 22 May 2025 22:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952065; cv=none; b=tfwKfixX2pu1LhXMmhBmfB0gb03nCe98sor9bs2Wj8nXhky0wIkXRAsovS6+6dZemUypXuVWlSnTFqPuCnigNf8EHZ5if2NSrhtJIKS3FYK3v13h72HJrTwIOYdSPThOfTvuxu5B3BcDu0c5QAfkljqDkiDSTjqpgfBJoc7W7t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952065; c=relaxed/simple;
	bh=x6wxXDuMVX+OmfDt/ovHVstThij0g+Cx4xT2C755JDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quysS6TzE+IHJmuvXmXa+CLIqTeNNbSmMsFDeINy2oxnEOZYwp3inGbLSkesfnlIC15g50frGDLQr/IqBiGAtjVgvZWb2oAy+pVcMeYtfP/dri61mMlx79rYSLRV81p2ui8VnSNkRvqazUy9YswWbwq92G7FQAkZ97YqmCkVNuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DusnAOLZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DusnAOLZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23179999d4aso7851575ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 May 2025 15:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747952063; x=1748556863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SteAIc0aK3U11eG8bAWWiwo2hGup6SyoLTpBN7C0z5k=;
        b=DusnAOLZKlFW+ETGOvC8MMI28dGYVV9BSQHyH0/EMC+KLTDBSJDN7EcbsiQKI2xruz
         3EeWmm2upHD2go1SIVUP2E8+Aq1Ty6yW2a/AyCo+RanEYz19zjLTkeCnOm9VtXd1vamV
         bp5kkxmCkRdsy5nNxMJYsjMHkKiATr0AqINYTfEitXDkRMXbQxdVECZrYVtNf66odizd
         NKypXXryUgv4mOWXJyPU93AuLg2EnMbqW9RmJ3m/i55BgxBOI3PUflA2/cr+1SBWJtXc
         P9ftoibRg++HM5LnoAFKro1lC3YMrWuZj2LTZcB4Yn0m2lj06oUug0fW87i8Gc5rbwdh
         3H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952063; x=1748556863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SteAIc0aK3U11eG8bAWWiwo2hGup6SyoLTpBN7C0z5k=;
        b=EHLYp03mWNLspRziINxmx6Nk1of7QAU1DeV1jVaO3vwuvBA1EMFZcmrhwmWmMNZfr9
         kEPsjfBEI3Tpwr7qifab4cAvoHQCtfliZcfl7a7qiY76shYVm5rMC/i+gHl1Z5ovQd5p
         j1r5To9XsExwUufQsSXpJsv/Lij+1v+uxsIJLdEDVjGCtvlfIh1gmJ0yoYrrU6gxnh4r
         ETwGcPdFtoEr17RCZhYHy2EcNbqhEfE9BTe6XiLIGb6edYKPGdAe+l3FScSq3PjvO1tC
         Mq/k+czWa9NmZykQoTRS/DaZjE3B5WrPieXM6tlBtbpxl6/DwzMKwvdInQ2RvM1QEmHd
         xzhw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ6NVvf6Xeb0QqEvykiO9ntwed3acAJbwVv4FvYCoyMGVekynCFxhKWr0NgUvtB0fKYGIVS4+jnIeNfawyjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvzAv8i4wNm+3671pf2eIF105joc2DUm2uBAqLIMz8Y+1dOvkH
	yAqn+BnH+ksSAJ8Jwf5gmt19h0LB4GeLvaLU88RzGGdXFg3rAyeaX+CYeiD7dPiwD0CPnJqKlJz
	ujuQqBhsgW8HwizccTy3oyDcgf0JP7XI9q2XCCo8KMg==
X-Gm-Gg: ASbGnctkkaWvnrfcpkKWfUtgwlttX3uldtQr41M//wy0jAgfDj6VS1xUTHl3m6IgPu5
	ViVMBOqDv6c+Cj3x7U7kUR2Ail9NitcFcw/I8yiC3wuG3cpuSSIptm0kBPapD3uDpbVioqznrVQ
	RUpgwfHtPaFrTK4T8uKdtoXr/2qLUjxskE
X-Google-Smtp-Source: AGHT+IGBXYuDWd/iRt0hALutBbr73I/+w1xgElVahE8xlMu5Kt74/TfBeV3TM0fpbAApxbAorVd1M4/si+mNW+oqBVA=
X-Received: by 2002:a17:903:41d0:b0:224:1005:7281 with SMTP id
 d9443c01a7336-231d43c3d88mr133963825ad.7.1747952063194; Thu, 22 May 2025
 15:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516122349.1944895-1-igor.korotin@yahoo.com> <20250519164615.3310844-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20250519164615.3310844-1-igor.korotin.linux@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 May 2025 00:14:10 +0200
X-Gm-Features: AX0GCFsbYxW10RiEe0xJSdce6PudH4KA085D6GUGbBxbPnFpt1xNUwDdRCHRP40
Message-ID: <CANiq72m77gLJRD+On=k+M1ZFLZAkRz=d0mzspr59FR6+VV2qOQ@mail.gmail.com>
Subject: Re: [PATCH v5] rust: macros: Fix macro referencing core and kernel crates
To: igor.korotin.linux@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:49=E2=80=AFPM <igor.korotin.linux@gmail.com> wrot=
e:
>
> From: Igor Korotin <igor.korotin.linux@gmail.com>
>
> Fix macros and auto-generated code to use absolute paths, `::core::...`
> and `::kernel::...`, for core and kernel references. This prevents issues
> where user-defined modules named `core` or `kernel` could be picked up
> instead of the `core` or `kernel` crates.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1150
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Applied `rustfmt`. Reworded slightly. - Miguel ]

I picked up Benno's review from v4.

If KUnit does not want this in, please shout.

Cheers,
Miguel
