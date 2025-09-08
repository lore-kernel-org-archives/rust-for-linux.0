Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51652F3C28
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757342185; cv=none; b=getucAQBqAQxMvUjQtgzmGN5MX4LCjD6iaEiR38jZyfXR7TF6KmI7Fdj0m5NMZ+siB/Tvvp1qjkKH/uCxz+SOjqKGWS88j7dxD2DYZTS6c9B1s+f5y8C30MM/lk+iBjHmKCueAATQw73pOMOUa9Ij/ftFbRoZkesE93m2ZlCSEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757342185; c=relaxed/simple;
	bh=FIVWf3bpKmjp75cp07PUchurcybMcPfdUSIyZqVIJkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chasSbeZwA3uaaYJbS95UfuUAgXuqdsW/EtmRWNtFrbKxdVfVa7px6FXVfE6YlNnk1x9E0gUhNNE2rR7Qtgmo1lorqt9ybWM3YVwS60Yt7V3jFFVFT8jMR4Hks2LB1tByRB3HuCqND1IPDOreRjXCvfI7s9ZALTr9pD6JrHb7dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dq9uiiLA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dq9uiiLA"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-248e01cd834so10357145ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757342183; x=1757946983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIVWf3bpKmjp75cp07PUchurcybMcPfdUSIyZqVIJkQ=;
        b=dq9uiiLAjR/CbvAOQQzSo1VK+g0xTKHqekzCU6+IC80BGopFl9ZKRmA9n4BkaBZe1N
         JXhT0BeV+NUavAhsksV4vEs6kR9vsmVqy14DnyW2gJvJBkSKOkSlVFrXiUnL2gPz5qf+
         TQxMe3CvNto7wI40jFEk5ANiNIZTaZPJXhJ7ORss7R0mZacGtxbc+zZ7nEf1XN8Uq/HT
         87KGhX/Bv60blIu+Sp58DhbJU+BKPaetIvjfgsuaB17ZRxtaBObE3wc8vRVChuOsJyDf
         9+dVudcAsuwEwqacU4CtCtznaMXOuBcHbS6wBg6IUt0tk5p2fQRVOiAkjHTO9WWRZfHL
         WzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757342183; x=1757946983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIVWf3bpKmjp75cp07PUchurcybMcPfdUSIyZqVIJkQ=;
        b=OYfP6iXDKaE/gBZDOIcGPKHLzJPVmg1mV8S17eppJnVt9BaNpCesgadHMhCdTzZsMc
         hvkLALe2lNWtAMn/6Hg/flfNg95BZnTxiU/jJAnUgEEgZ/pmpP8OYQhhj3hTsSTxm7I0
         rHob070nw2DfDHLl5a1qRYAwVWcKw1caPFq/no6s5R8rixoQmvAShouD8zuiXy3zgtui
         H23xtTKlKH0t3X4bOA0Hya3mC9mpuwoEq3l7kSLr0D70RIlATcDktbXf32Fsy7NURR9o
         9/mvfAMuw8Ow38lLKAqql5VEaNf+/Ua1OM9Nb1JOLL3D9Fc/Al2zAInL2KE2AVk+Wthf
         PjNw==
X-Forwarded-Encrypted: i=1; AJvYcCWP4DJC/X/nYo3V9szC2q9uE68udtioWMr5irfVESyLHsDJ0guE48os2j4AyEnXdJztp55wqM+XpSqsbuQsIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7gM5yUtENPVV/u+g+hnJ8QTo/1KNVb6Cmrq0QFBy3nb5hoX8Z
	sbBrDMDMc9tRAjkQ/wx6Gz/f0bK9fUooV6b/hm2w0NNOU4BfP8zMu7byggTWR9oir+0Axo0sysx
	pJ9m+GLDkYe2V0ZvJ4O9rkuKUibuwWgQ=
X-Gm-Gg: ASbGncvcq/uJkZ4Y85CwI4UTvkwopGVvJkOd4KT93J3dpNGniHyLtUKdA+y5/bT5yMO
	/2Fg9asWZbuy1ZqG/GdGxCJpJRfLefgn9N0uvnWImOJKShWkE7zsMQA/CFsYZPm46QKBnbiyhli
	8ImIV5CcPa0nB8A0jLFQZRWGmAbgq/NBWMEBetbSM8rhuCmo/mE2TBaqEQuMA1bMrtwVHsF7rUu
	DUDLZ0mB5vd/1N+Y8ksDMqi4q0R6eiQvspOiOGDEDp+BgBoag6MXu2T+7Vkd/sSI7OHaxe2aq6J
	zHxZcmmUwUEUS90BbwrNqATW5g==
X-Google-Smtp-Source: AGHT+IEds3iCyTuDUwiTjHRJ7lLf/Q2xjxTJDIKMpnFx1aFKpliIcBsGFm3iFx+addcMcQGerU8ggQutMgqEUUjcd3Y=
X-Received: by 2002:a17:903:18c:b0:24c:cc2c:9da5 with SMTP id
 d9443c01a7336-25173ea24a3mr62209635ad.6.1757342183075; Mon, 08 Sep 2025
 07:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-distill-lint-1ae78bcf777c@spud>
In-Reply-To: <20250908-distill-lint-1ae78bcf777c@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 16:36:09 +0200
X-Gm-Features: AS18NWB-MWPE9egfDgR8swoEM8VNIC5oT99W_zIRlpTR_s6ZNeMwU8I66RyA-sw
Message-ID: <CANiq72mw36RzCtNVax650fJ=+cYjuGNF722_Mn2Oy1FAvxWc8Q@mail.gmail.com>
Subject: Re: [PATCH v1] rust: cfi: only 64-bit arm and x86 support CFI_CLANG
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	stable@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Matthew Maurer <mmaurer@google.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 3:13=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The kernel uses the standard rustc targets for non-x86 targets, and out
> of those only 64-bit arm's target has kcfi support enabled. For x86, the
> custom 64-bit target enables kcfi.
>
> The HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC config option that allows
> CFI_CLANG to be used in combination with RUST does not check whether the
> rustc target supports kcfi. This breaks the build on riscv (and
> presumably 32-bit arm) when CFI_CLANG and RUST are enabled at the same
> time.
>
> Ordinarily, a rustc-option check would be used to detect target support
> but unfortunately rustc-option filters out the target for reasons given
> in commit 46e24a545cdb4 ("rust: kasan/kbuild: fix missing flags on first
> build"). As a result, if the host supports kcfi but the target does not,
> e.g. when building for riscv on x86_64, the build would remain broken.
>
> Instead, make HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC depend on the only
> two architectures where the target used supports it to fix the build.
>
> CC: stable@vger.kernel.org
> Fixes: ca627e636551e ("rust: cfi: add support for CFI_CLANG with Rust")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

If you are taking this through RISC-V:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
