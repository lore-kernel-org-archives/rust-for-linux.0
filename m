Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADC82147FB
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874405; cv=none; b=h4rw0C0aVPCAST6ClBFHkA1q167WBmirLs7COBCOsuoxJKJTfTRp8/VljkNwPe5hyYFRQWkyAsqouVJKUSr1HQxrYvWqqonXeio56T3OWIYGSgSjilInv5kd9JuFWDM1w//dnYNAKtc9fr4n82nyX6vCNmF7wIMQ+TOJ1F4GnSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874405; c=relaxed/simple;
	bh=rvbzzbyIt38638XUwt2IokS25EPoQQKWLDft0IbfC3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exZ/cZpMSj5oBhTcbAxho7xrxtQoC8yTNgUK42d/H+cxtp8mGW6f/jkyq7mDtIUf9oAgkBcl/n0aScewNbIkHyP2yFhLprls9g/ggNYqPRR+6CD3aRHvBmc5+lakcBT4zXW2ca7o6FTaKz62UauqFnkf+tQJnMt1i1ecmhwuF8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=Y3oA72xK; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Y3oA72xK"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e728841ed96so142052276.3
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 00:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744874402; x=1745479202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yu0QNh1tbtBnsibOOQ7JhloRzOCSdcHTsH/2taEqzT8=;
        b=Y3oA72xKM7d90dc4xU9IrFvxOpgFCUNGtlc8mWkKHA/ZALMDfUs7V1wjf1ZuCLF6qB
         9yy1DIX3i8924oVaVsn4V3A+tRmvoUJI3Ni2+Fk7DCgNzprRJblYXurwIa9Z5nVg6lzg
         LEkJ2DfoxgZV/7zJLDWwlZlgmLy1fBLw0wXptcc0v6WK+emDg84AJqLeSvlFegpIOib2
         7NxxVaQziBK/gtd0MU5JWvxjK1nzwXAivpyC9U/YXVFp0V/CG4ED24Cm2yMS+ZiY9AOL
         zy9TmG/K79ifxoIxTQTUwA4Yagnr6Fw8eHVDJoXj597aeVmDth723WUOoorDrIC2aUBl
         F50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874402; x=1745479202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yu0QNh1tbtBnsibOOQ7JhloRzOCSdcHTsH/2taEqzT8=;
        b=qeD2UzRPJz/N+RuFxrm7kkYrfOqz7nHGEuYdDbXTkUjPGTp1BhKIM6U9m3T+q2c4hD
         jBc/KaeOxwtJi1Bxjct6LQ0Jpk3G+LEqVX9h4Lj4TCBmWu0weBYlteLyQC0of/ZAgFGs
         7tZYv9OCgHmiw1Lsw91adJnPR1Gijut80+bB/0eQV1iuusgZuIDECwgnqTub6NB7u/ia
         N4KdA2B0bDlC6hwv4ENdSUrs0LOWi2S8eHtf8MX8KzdTh6CVQzxf2CvxtDGBzxBngHGY
         usHQDF5eJDKp8vV8+abinI2Nvm6GT3oGUjvi9pBb19lIAAZc2pDNKd8iJ+uqRw1wH3rQ
         aGlw==
X-Forwarded-Encrypted: i=1; AJvYcCWioHJnSAcAnMHnzHK/M+aRIyZYT85cbFcnMeOVLtuSa/RkiwziRoDEQJCOQCHSA7ACi2Kp5V99YS6b6Nnohw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0oE0Y26vmLH26PluIgNGvA18qBJf+xNw414Llkg/ozthsXj1r
	vd3RbIiNc/aWdaalo/ADVe/1rUX8lTfz2+M+ErDS7N7BIBa6IQEyrYy7UtmEiUAFsY53aLPKEBF
	l5IohVsxgchn0/p3JFd9AkS/Fvowh7ySsKYndxw==
X-Gm-Gg: ASbGnctY71QBZPFeEOq0L3MinEBn1CTksNCo2KeAT9HOKnvpzz2oFUEAZV/W7SgzP3t
	MN25KLK7/XHwBRBtgr8s69SkTtVJyh25EKnG9Th/OsZBHJBGy1C8Pj7OCZB3qmwzbCrXcOmO4eP
	XaVz5Ud9pdPQbTVxIkU1nOOg==
X-Google-Smtp-Source: AGHT+IGJQAARqDZoOSPzwzCpDAzhpoGiPTB9Z+UpBz1/KjS/Xy32RpLnadI9jr0F9SZTmBleBsB0xGvMkaLK027XqjY=
X-Received: by 2002:a05:6902:15c7:b0:e60:a16c:d017 with SMTP id
 3f1490d57ef6-e7275f01225mr7332971276.49.1744874402570; Thu, 17 Apr 2025
 00:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-11-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-11-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:19:51 -0500
X-Gm-Features: ATxdqUGjGjoAzKGuMfy_tgb3N3bcwvdlNAOSKPXLcZL1a1OnfJ-Q-7dmbokdxkA
Message-ID: <CALNs47t-VEBO__NL=CM5ty-x4naHonKSPnri8uLL5j7JrpEdeg@mail.gmail.com>
Subject: Re: [PATCH v5 11/13] scripts: generate_rust_analyzer.py: avoid FD leak
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Use a context manager to avoid leaking file descriptors.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
