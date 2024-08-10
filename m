Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2970913E3F3
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Aug 2024 21:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723326269; cv=none; b=Ifjf8D+LhdJGqcYIWdK4ZTc1IkFfIR6cKl+rS5RTYJUKAChG/iEQE/L4VOKBrc8bCVVuxHKBiHSWqxOayuPlTwrIxSIHkTwdUvMUDuU+RnFXWAa/43TxYeYy2XB9mq1JcEhl7Ag8fhIJ9rP7FME9ITORKraNha7g40jw69TGdEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723326269; c=relaxed/simple;
	bh=o5sNdLFUsj4H2nGmCRIF+Fg4V3G93ruUtbv8yzqr3dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQ/bD+GUOHESQMogjVBs+MxY6KGArytl39YqPMEpP2IHHjXaFIKPptGooqjbPG7ATx5jbRED0oT3954jC9+5ohcH0J7p1kQtZH29Tw7c7sZ7EAJAp3s8aGsNvw8N4R+7iG4/RhIl+q58MdEn2HLYErLL9193mPNKPCaz1/4q4bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HWO7NqBo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HWO7NqBo"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so21162495e9.2
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Aug 2024 14:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723326266; x=1723931066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aegy8mTt/HGU3nb35OmsyGSQvTR/N6vYdmjG0ALaZCI=;
        b=HWO7NqBoDdOOv3uzJOHB6qVLyF6MzVffEpukJehRVwuqIpA28t11N4emgXY1UJLpTX
         5NnMu4ZPEWEgv+xi8otvYsHUQezYGqXI2yNx6hjHokVBaASoD21YCjkS4VhlVdu87rzF
         pyexBODwFN1X9up55iM6rvAhq21uX6DDYou2O+8hODk7g9yjro7/anhWw5Ej/IHskIKk
         WG6vOsZIaMRvqhDNlFTe+H1UJ5K2UoWATWCACSh0NQnSIYmMWQhxCvtKBfeNYvTsfxeR
         psA4/uvGwYRKnyChaeN4jMdT7yHTqxSC0GTTJJJdmLFF76v3MTJP3g00Zj9BKww6BT7q
         E/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723326266; x=1723931066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aegy8mTt/HGU3nb35OmsyGSQvTR/N6vYdmjG0ALaZCI=;
        b=mCZYL4y8sjY/iZ7votkVcb8RsaEYvJbkHBQdOTja31D6z9lSs1nDlRhcDBudq6ZG3s
         GDE+jU8ALwWeQ9qdBv5l7eGzBbNDKhgWnZXyA2tuFlag/cFm4gIpZ8c2E/elJSec8LKa
         gb2VR5fMwYTT5wTNnaZytNO76hxCygL4c0DIv0JTBY4D8xYmfQ2PR5l5Cg3f5fMLMUY+
         4aFCo8zRs7xey3GN+DskJ/WGTt+pojg0gQ9gjWsOw94PPA1PjvdA3RvwB0MNG6ffQEJK
         pcjau/DkcCTKBreDkr1KdRn+2JMT28wP4n3xmBv44d/a0j3F79atrgKEoZk6k9K2sx40
         7ZQw==
X-Forwarded-Encrypted: i=1; AJvYcCWag6qiFcNuBYCVGG0xdhLEGqQafAiLSvAO42xxee+2Ya470+O2MM/wQvztiZQKWOuauAJ6w57KBMUkyoaM4qMikQCqHebSZ1lhH8eDdpA=
X-Gm-Message-State: AOJu0YyxTdhPwNPkgt46oF4UoDqcPSXZSjl4F7Hu9ucN8JQx3jMkqbas
	uE+IURvY9glMce6BiROkJtELEP9PRYTE730g5SecfkwWdIWq2KVo41O4mr/Ni7LCbMbZh9dZnEo
	PRK2Af5iV5XiyMcA6DVf2QiQjY17grf8TbRfD
X-Google-Smtp-Source: AGHT+IGcGrvANhieaJ2VWvct+JSOLceO+y8m3RToV1+qGvsi7vy01ylyw5ydwKNucZvA36ZyGsWfJP7DYr6LPaNbUDo=
X-Received: by 2002:a5d:4562:0:b0:368:6337:4226 with SMTP id
 ffacd0b85a97d-36d5f2d0fb8mr2949257f8f.12.1723326266116; Sat, 10 Aug 2024
 14:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
 <20240808-tracepoint-v6-5-a23f800f1189@google.com> <20240810210359.GD11646@noisy.programming.kicks-ass.net>
In-Reply-To: <20240810210359.GD11646@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 10 Aug 2024 23:44:13 +0200
Message-ID: <CAH5fLggwLOhP_6b==dc73uJCUBcu2fNQ7SCnqovv2hVXFtUHEQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] rust: add arch_static_branch
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 10, 2024 at 11:04=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Thu, Aug 08, 2024 at 05:23:41PM +0000, Alice Ryhl wrote:
>
> > +/// Wrapper around `asm!` that uses at&t syntax on x86.
> > +// Uses a semicolon to avoid parsing ambiguities, even though this doe=
s not match native `asm!`
> > +// syntax.
> > +#[cfg(target_arch =3D "x86_64")]
> > +#[macro_export]
> > +macro_rules! asm {
> > +    ($($asm:expr),* ; $($rest:tt)*) =3D> {
> > +        ::core::arch::asm!( $($asm)*, options(att_syntax), $($rest)* )
> > +    };
> > +}
> > +
> > +/// Wrapper around `asm!` that uses at&t syntax on x86.
>
> ^ the above line seems out of place given the 'not' below.

Comments with three slashes are what gets rendered in the html version
of the docs [1]. This way, the rendered docs will say that the `asm!`
macro is a wrapper around the built-in `asm!` that uses at&t syntax on
x86 regardless of which platform you build the docs on.

[1]: https://rust.docs.kernel.org/kernel/

> > +// For non-x86 arches we just pass through to `asm!`.
> > +#[cfg(not(target_arch =3D "x86_64"))]
>          ^^^
> > +#[macro_export]
> > +macro_rules! asm {
> > +    ($($asm:expr),* ; $($rest:tt)*) =3D> {
> > +        ::core::arch::asm!( $($asm)*, $($rest)* )
> > +    };
> > +}
