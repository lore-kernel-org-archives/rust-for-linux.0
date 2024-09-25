Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E9180043
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727259666; cv=none; b=ORTHNlPUzli3m5f+Lemgp+jDEu+3bhPRiGSbw+KBLj3WZ8xjDeWSX+/RNAc4Qr9/85gZ/yKvJyqovQQWoqKimCJByv1fscVcO4ERfRcfgoaIaLE65rMpz4TQ1563O09Qj02EN7jxm4RE4n0Z7pm1pPASuivMKDjXqPIYZRHVnvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727259666; c=relaxed/simple;
	bh=TCDnE5O1Qj4Sx4FFyUqVkcdfYPO8wvEkGDEg/b8x6RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qItglTk8DPatppgsreKsTEW1OKOrPyNDyndSpgH/2ckhyel4VdZxvHLOxIzyTaVmFBfMnumoUxTseChnbI3mDHgTMkALnc5KfTR0dv4+Vlvaf1WC2sWsI8CJi1czYpKGezaPsJdEaQNBX8UyKQXF5FYHiPnreg38vhpMWGEcebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxBaG2Eh; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxBaG2Eh"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7db3e962c2aso529402a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 03:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727259664; x=1727864464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCDnE5O1Qj4Sx4FFyUqVkcdfYPO8wvEkGDEg/b8x6RM=;
        b=KxBaG2Eh+70+OkbrNIltMwsPrICJcVqeM9U3KSgrbFJmFRXCyAqLJCBNr317Lz3fnf
         gr23iLAv88Hc/KKjKLCq0mgs69wQDEoXFadMuRm2d73CL3OSYtCNHdd/VjJpttKxRlBn
         4pZ8fVauBd80RolQapPRAQYFISlu4j4OZsbvluagbctMkjyAUBbNXYkrf0f3Iar1QSH9
         hi5DUbwguGrGjaNUuedKoRM3yhAzs+nfZOrJVp1aAJBND9b+3DS3zf5tBZ6qZ6Y6nkWd
         buQrpHer/rkDZAHqMgBsLlROdX/Ftfzv/4OXd1sHecBe2HXfwYY9L14iN9fou3Vi4V5x
         GbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727259664; x=1727864464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCDnE5O1Qj4Sx4FFyUqVkcdfYPO8wvEkGDEg/b8x6RM=;
        b=FS1JOzoidabcII6f67TPBrrFT8el4t3JsJKXfdUqy+91KC8RhaskcSu+DtH00JMiqc
         zt4+nb/ZGI3bQOGTeKiKFZwQqRBCfw1Z0WSuWuBCWt3NQsgTE5hUZC/VS/xt83IH5Uug
         gO42IT7089dQ1YfcGksgahUdXzf67q+AQw45ctAK+I4Req12K/Qi1JVhvdksiO/MpEXE
         gLVZNvXv3oozjY1/Fea3rI6uhcFfeqzm4vAwjiIJ0s1rEjMZ1ofoxGfqXCYgiRTdYcDY
         viIxeQHS6rLk6ooVuarf0/sTZMwW2GLxwrW8vQMNQQDwdFovKWSYBQNNzhFWhEgCULgS
         ToAA==
X-Forwarded-Encrypted: i=1; AJvYcCV5MxNlnHyPEzImfDUE2dLRlV+6RfZ4mMtnr67Zt8J9nx8g7CUePfcDkI5UP6eYteN6XI09VNf6inyjm2oaOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ8uwoEX90+e8ZHZZ4VfcYxSCdkLwH3fEMgwdasFki+KSzLBcs
	+W4Pb/JzKcctdEGtnLJQsQ51K6P7zza53yFcnfKrGNiMZeMpF3DU/No1YTk1oeSknYPfCtmbp+G
	zJJnxR55RcdIT1M03VFLSy11QJU4=
X-Google-Smtp-Source: AGHT+IHrc4qeLncDvmI5by0PktN7ToaZFg+oGS0r8KUPyktOQT8smdBpXd4RQ/kBZQLt1sN+Zznoq/2KTkDYdaikT8c=
X-Received: by 2002:a05:6a00:1149:b0:70d:140c:7369 with SMTP id
 d2e1a72fcca58-71b0ac5a8c4mr1439818b3a.3.1727259664158; Wed, 25 Sep 2024
 03:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com> <CANiq72mv5E0PvZRW5eAEvqvqj74PH01hcRhLWTouB4z32jTeSA@mail.gmail.com>
 <CANiq72myZL4_poCMuNFevtpYYc0V0embjSuKb7y=C+m3vVA_8g@mail.gmail.com>
 <CAH5fLgheG47LdgJGX6grHXL6h08tsSM1DACRkkzQk_1U8VAOxQ@mail.gmail.com> <CAH5fLgj7E03DKBcptgmZ8SLgco=Qs4puO=O6=v9=-3SSuqJyUQ@mail.gmail.com>
In-Reply-To: <CAH5fLgj7E03DKBcptgmZ8SLgco=Qs4puO=O6=v9=-3SSuqJyUQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Sep 2024 12:20:50 +0200
Message-ID: <CANiq72mFKE4tLp1bgr+c0-Hi+dmReFT4m5RcV6MigjyiAiuwmg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Rust KASAN Support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, andreyknvl@gmail.com, ojeda@kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, dvyukov@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 12:00=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I posted a fix:
> https://github.com/rust-lang/rust/pull/130824

Reviewed, tagged and added to the lists -- thanks!

> We'll need a check on RUSTC_VERSION in Kconfig for this. If the PR
> gets merged within the next 22 days, this will land in 1.83.0. Would
> you like me to send a fix with that version number now or wait for it
> to get merged before I send that fix?

Perhaps it could also go into 1.82.0 since it is a fix? (there are
still a couple weeks for that)

In any case, I think we can put 1.83 in the fix already and modify
later if needed. Even then, I am not sure if the requirement is a big
deal, i.e. I guess we could keep the warning and avoid adding the
restriction. But since this is for KASAN-enabled, I guess it is fine
adding the restriction and being safe & proper.

Cheers,
Miguel
