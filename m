Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B682819D07A
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Sep 2025 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758483225; cv=none; b=bvzQdLvlflhLpRN1vr3n8xVr7rYXM9ZR/mW0S8HKybXLA+fyk3VAOmqmYNuhFbiHqQOKR6IuEJJwo1ndAH74yXX7Ft1/f8rs9rjavXBu46Pzvg13G115Y7o6N6jglvhUDrrasOIlJcLWjbSbEzGtnz24uyf/a9e4SesbGHVz00k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758483225; c=relaxed/simple;
	bh=2m+X/nfuv9HOhbheWVXsceeU1oB9iRe5Dx2bNoWj8Nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEW5/XYhM7E9watQ4BwhWP3sLWLekhd5XCBHGoHrNEW+UxmuMGDYhYqrikqxUPkguZt78yN9wcPd7etCgCdKPvo6v0Gx9oKFoe4WkzqyGMsH2YEbabHw0S6M1ERzjpHyRVrVN24YOHbSazvyeZ5+DLakIgpgSLWmm/mQxSOl3rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVrYsPlH; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVrYsPlH"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b5235737aedso324413a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Sep 2025 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758483223; x=1759088023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2m+X/nfuv9HOhbheWVXsceeU1oB9iRe5Dx2bNoWj8Nk=;
        b=iVrYsPlHUKHFnbAiVhbYhvmklGBuwzao+VxaBFs5HshgvkoEltUflAIWD2EBMGmHpP
         +Fue7Vw5Oh4WYx9r7/8OxZwZCgIcqvlaxj2LldgnNGWagm2Ot5h5h5PAPNoL7B3Kbw3w
         Q6jvLKDUM5Rsb0LBtrav+O93R2v+csm93AiF4NmqiHpsKjNIA0JUqBtDKHiJ1OjiOXaZ
         RjxUvxIY8fYb/6d48fdqIrL+GkGC/wVYZ4izq3DygmMIFV9aKaPD5zCucJTzQVhMR+bn
         gTS0CqBmqCRyjRKSt/MoyRz4JhFzSS98Q4D77jXT77qbl6eMyZuKhf7w7ROCkuKrO9oa
         Lyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758483223; x=1759088023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2m+X/nfuv9HOhbheWVXsceeU1oB9iRe5Dx2bNoWj8Nk=;
        b=dubDt+0T8jnwx0I0sSgC+DgtK2KrClqNVUJ3u0pPmiBkJ4/CmsQnW/5FtpLtoUMqRJ
         JoXq7fnyk22DV/eHzxm8j3ca0Ovj6RnxAneRUC0DdzEhRkFjZrcWfJB80NOC/1GV4TkT
         4n96c2Gizjxdlp9uld7mCgF+qcLW3eTrEzOvEETf0Xt1xNiuhTiKoW/M5QiLliRqJAjX
         veGPjr/nuLXU+2hraXnTctFu8wYNq9acrnmzTt4rbT/qBgiCh+LHwaFKz1D3FPQI477B
         90uHHZkNuczSt4fd58Y9gOhm48Isi0CTczSoVxOXssyovD4W0fMFaukkGq957S0R80XY
         8j1g==
X-Forwarded-Encrypted: i=1; AJvYcCXKIpwA1vR2guq96K4mivIaQdd0nGekKusJnIIcGv+feSNSHEIB8DR0Exb2Vb6QZQhPtnMGx3N1mau5NEXCew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwocrR1m4N5At8oTH9TftJTzyQehOYv0Z1Ys09ghk9TqH7Er0an
	W5yAYwGByReBwFw2I823MihsEiYe1YG7IyNJXUNrGE0ibXOXbP6+nUR0zK5fXuxosLaq9/x14QC
	TvzfYz11usw+BiEnYM3Os7MLvQe/rZk4=
X-Gm-Gg: ASbGnctIrfEh6/Yz9UGT/gX/htmY7eqYTS8M9GoOMdoInjysy70kk8K/+bFQaifI9tf
	aVEQiA3JvpL36lv/hf50TjMxmg1bb3nRiMq/V3RVRqJKXrC/P5qFhxr2AQDMt+6uDZwd5FGpV/Q
	rdt0rq/yB8ckiE3F4wONSJPPB5Zu8Pn58z/LaZuUmNXHfVpQbewiIYxwYI6+JI8kPX286FmawFH
	u1ssO71A8ph5yBSq8kD4dc+sTOjM8KbKVq1E+8PmBMUZIDssCVjwseq9KSl7p7p1TXhbFxqucV4
	DAZpNv6N0iB/LMWXGnl+YPXykQ==
X-Google-Smtp-Source: AGHT+IG4kRzeiPGLm59ZZQszVAWsNaDqqCH2KI2Z0y+NJALvZL1xRg5SeR7LL082wuOV46ofwPf8NpR+imqiZxjX0Qk=
X-Received: by 2002:a17:902:f68e:b0:269:96d2:9c96 with SMTP id
 d9443c01a7336-269ba2611c1mr76464005ad.0.1758483223077; Sun, 21 Sep 2025
 12:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com> <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
In-Reply-To: <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 21 Sep 2025 21:33:30 +0200
X-Gm-Features: AS18NWAcFs0MDi_Dw6rCzaLkE9gp-FV3yn7YymzJYRPsBMfxvetkj0p00jJxboU
Message-ID: <CANiq72n6_JdbgBiZHHiTg4vqnFHdfQhHcV2JpyQ0pz2J+KBSDw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Asuna Yang <spriteovo@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Han Gao <rabenda.cn@gmail.com>, Jason Montleon <jmontleo@redhat.com>, 
	Conor Dooley <conor@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 7:21=E2=80=AFAM Vivian Wang <wangruikang@iscas.ac.c=
n> wrote:
>
> Is this necessary? Maybe this can go in a separate patch, or even
> submitted separately entirely - it's unrelated to "RISC-V: re-enable gcc
> + rust builds" and would be weird to see in git blame.

Agreed, I mentioned the same in a previous version of the patch.

Cheers,
Miguel
