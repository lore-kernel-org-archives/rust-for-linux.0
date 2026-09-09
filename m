Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5DD3DA5A3
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982709; cv=pass; b=jJ9lezw1WIwUrOyiKemdpaC4Tq0Fj0M6ECXn9DLfsK3hNuKZbOUGazxdm+48tCucMTAvHuoWFWIPAGLarS35zEOqV2TyRC/wUJXH2F/ov0MihLk1RGRlRpFasVgrkw4NfG92BVMNlHjqnHtdr2XkfrgMYBfjsKTgcoSFD+D+RJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982709; c=relaxed/simple;
	bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROnuLeTdhT4niFNo/yqVejEEZH56SiM/RHE50LnksSn69sZMX75KxJSfstwZbvDGU/uLtUQiNJpeFSp9XljhaX5E+1G7uFedbdtKtZ4Kuz5djYXb874Xqzqz2vhh5UKf2vu4X7cvyTrW4WUJIndK3MQ88EYMb4M1FtAE16gbqEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9V1mn82; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9V1mn82"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff23d81cso4376445ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 12:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788982705; cv=none;
        d=google.com; s=arc-20260327;
        b=UAz6mAJmIvqpxdDPgt8Uu4i3pw0Ff5LxhZsh/HQjMXKhQgqfbCjbdn7rF60aR+3zDE
         QriiAU3cDGlet2gRfwb5eK9KuOo+17mmQNgUul8CcvabcDjwd2yCffyq4YTWiCp80n9c
         wp/eXyCib35j/xWQ+LVpUolvyszTG8XltWb15Yz+FQf7PQUxF4f6qV5Apmiy2wIT9Lao
         2iy45dj2KW2uena6q8dP24MGcQIf5YOm/aib6y/8QuZgp01gaYoBZ1iiNN8MUcfPDuPb
         lQjZvHh4YV62tJpyQzHxSQrUyCG/rQBQRsLSyaiITMQphSBMAY9CKtCpFXgL/hcr8c57
         xoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        fh=mzEqrbaLCAl6bqfgkVUZWmk2iwQxGofWTM2Duwup4Ew=;
        b=cvg9PPT9aapxbOojrN+In21+jgbFXAAXFzAp8f1T1oMeBAiF24j569tQj+m/rG/lkN
         y6KnNkQ9tlN6r+aDXgCheCABhUH9pibv7M5KZwXFcPA9Chu8R2mHZaA6E21ErXMJfPbV
         hu99iwNxfaXXuWCgjWw0jLn8VJI8IZwqm2VlmaPSPC6gsN0btVqLpBBgAQNAzeL8hoMy
         QQJ0rCgNZhIQNcJ7JZQMAgiXce9l9w6u2UgMg5/e0IDmlHFO2SeO1DnYWyfBfgV8kxix
         hDZkzTwXtVhLaEcYhF0onitSY0GnELKziCyovy6Pd4/aZTbn5/W0d5K3BYEYKRwmDx+A
         XedA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982705; x=1789587505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=O9V1mn82dLJDJpoWkpJ3uIqIF6FnMmw8HKITWUuf0+5gF9tsWFQvJeqtuvXWVufZ6M
         WV9sS6d8PY3FlMamLDg2/HWYu2ToFT5hITdCpWxDuCc+cL4fMdLCp5VGqvUOnJ6dXJ8C
         8hPDf0onGOvKjlaqh834XmZcICJPaGL6gkNzUTEND5TaAJdRp8B3DRjO8U5MgUy+VG/i
         vNUxzIuRGbgs/dQsoZjiOkN7PDRGh1JoMmOGgnGAj/YKMASmOnNmAK7yaZfExInbXu5a
         EyCvSXz88ovLxnHrYgc7y7jmMl60j4R55wVeecNSwYBDDPcZ8AeLU6oDoA0MRQqGMd3d
         95Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982705; x=1789587505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=MVc7KF2vG6EQjARLrpgtsgfRaQMGnX8yW9XtT2uHe1/3TIQIxmNVCx79BBFwKIUPEa
         zS2Yu3Q2iat7PkxBq6tK+0IEl0N6MsbzYmPaJzylTn26juo/ICo+YeYOy2txCQGAkuWR
         Ai775z7N2j8la9hauQvYr4UsaZFyYsd/dzjVB1y0N/KJNqc5uYR0mxUPxrRLd0+UR7KE
         aLwpQNa4d76OPQC2x7wneKvmwb9sCSIq1/JxlzGT5yqRs6wYUuta5ZA73czJnaG7NDNU
         WFkeKhE/tpc8TGUTGX3hu4RgR0eiZaVyT1DTmL2RZaTwmd55mGrHNrLTmbmvBmvtA5zF
         ShDA==
X-Forwarded-Encrypted: i=1; AKwUvBywAVLAMAaWEgNvugqLlhmOa8vrjbWV5ugklzHZ9eA8o2KJKGJoVbehNmW0B8SbfkvrsTwqLrlW6RnLKS3/Og==@vger.kernel.org
X-Gm-Message-State: AFuF++kb2BLxX1+tMfBzHw4P/T+L172f+z8L5KYoWn75nXI9th/n/XZe
	uw00sk8SvKdB6VzMJW0ReX2GUJwAhWChUBdKo/LjbDiNNHeNo8KAd74wOuAZGKoaGtAmX8xh73z
	w6D+3rz/2+EfN/xD95ndSglfIvVVIBlI=
X-Gm-Gg: AYBFou0CkODBhjM1Q3QRt51JOgzfUGGjUpFrDPV/pIV/s2vlo8htWUlc2HCU2rsI3Ga
	1bUnE1w8xdGS9QQWPLmJ7BF3QDGkUXHeZjp9yexnc/ifdttTnlqBc0KLXHfhM4eRvIAIrI67kRI
	7ZVnudrBMV5WvK5ys9wN3M8CPqog+o8ns29/7jh2tRCvjMAnbDrtBEkqzwGeix6kicuKX+W1AMK
	W2E/aiaL+ajlzwRtnh0HVKkMqn2+RzdI/J4kfPcI3Vdso5BJfsi7D+fp3d4GdL2Xe18NGlpItxK
	s+C/E3eks3QmihhM2IR4YsRk32HSorafhRiTySKWvELYtKsFOZ3isI/2SjSF+26DoPAllOQg/Em
	fHooFe7j2m/IAJyuUYMGUNgNUaRgwyB6FgqF559sgIMbvg952J9nIS7H5VWndnAOjJH0LTJy9yd
	p5sZz1bN8iRFMJqVqbQGU4yWiBpmylLUZBpv3cVPSPyowJsEFfJ3k=
X-Received: by 2002:a17:90b:3fcc:b0:39b:3505:c72f with SMTP id
 98e67ed59e1d1-39d77b83048mr824934a91.6.1788982705356; Wed, 09 Sep 2026
 12:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-12-3a93791af1cf@linutronix.de>
 <20260908071911.GU4120091@noisy.programming.kicks-ass.net> <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
In-Reply-To: <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 21:38:11 +0200
X-Gm-Features: AcwNN1V9A4D3jn7pum7crGv8bcA9jfLyy60O95H9hOe-jZGhQ7AzCwKSAv7z5Dg
Message-ID: <CANiq72=T1487Y7TpAa4c2eTJFMLHoe5Qc7+tRkbkmvrDjfmuvw@mail.gmail.com>
Subject: Re: [PATCH v5 12/24] vdso: Add the vdsocheck tool
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:33=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> It was going to happen, and now we'll have to suffer the instability of r=
ust...

What instability?

Cheers,
Miguel
