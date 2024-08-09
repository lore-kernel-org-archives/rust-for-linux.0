Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3217A14F126
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Aug 2024 18:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723227687; cv=none; b=lnzdZ7zWNpV+o0fQ7gcpr6m86fvDOaRr5V+z+4oCI4nuYqBA4BSKzdAqBN1ZeGhyMO0rFzfuDY7LDahliM8mp2crSMbLFHtWEWSgYMepIek4eW4Wp8yQCUZM3rX1tEdn2crEHi2UTx81frwmH2krdfzbAz1Ic4cjwKdxEL+xFOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723227687; c=relaxed/simple;
	bh=yrIcLQX/cGReHkkuFz6o+An8j150bAv3nUdA7o3gDL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yt7zHF2FZOgFF/huiTnx2dt900Fa5S647Z1SxhfdTlUjp9nyD5jkMjHO8gQTX39O13YSN9e1i2mjgMSxfUK+6PkTMAOso7IEa0oNgwaNciKkLASX/iLRAhNx7R54MFb+2TkYJKzDpdzfwbKlrXX++OM5GTrxtWX7U4p1VFG608c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sJcmtJDO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sJcmtJDO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3685a5e7d3cso1337995f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Aug 2024 11:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723227683; x=1723832483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5aSgr88/PRGVfxdX8pAdBy1fV+mFF55FgD+2QlLqzo=;
        b=sJcmtJDO6IcdSHbFJHJFTerN1lwcpGV1kzIY54hTYTt9b8jdx4PlyzAAo8AD2J1giG
         Yxd0irUSMQn31741vmkZvTDLKMiQKO3RNvrvDGhCuzNSiGNmWscnjex4l0o+rD0ZZ0Xf
         iCZ+HCqfj/ZvtWYTXNQLSvBJx9K5W1lE3EE8++/1rlwoKW//YFlhku3AcY4I8zhA5Yp6
         0sKf2a/J9AUbun0fdVxbf2iAXb8xZp/uJbREx/g/D+FpT/XaHoR3uRU2+MUAd5HGVnXM
         HVDA/cRQtCbEy14Lg0STVLMTRCHZG+Glxc7HMivTAToE5jnCU3WEjsAfIWZNP4psaRFD
         Qitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723227683; x=1723832483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5aSgr88/PRGVfxdX8pAdBy1fV+mFF55FgD+2QlLqzo=;
        b=Oop54t0XGhR8mEFf94OBgtwKl/uj+yIo3KnzjXaU/0FewhZUDQ1QFzvEa3m4V23325
         08M+702altHscphsozVKPfj6xgSYrI6ePYKtGXpU2/zet8ymGh/7mmae6mRsoXQv65Uo
         kmgqJK8TurnxSE+GcvGLlM408NGBsUcF5SWO8GcY45krVsGvd08judkX1K+Oaw9iC2yI
         KnLA7ebis+Gw9gkI1hHGberaQOwAf5r+a1UEvPFLYCvR60sSMn/O1vYlTbO/jEth91s9
         M3ZY2D5RtQ4zfVerHivpuRbvIHYGHu9Q47Lv+KfXZbtj56+CCkHCYWghfXuWp7a3OrYq
         +60Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUj1Q+hmBTsW1I6IswR0Tpj3f3R0BjG4lqVmcNywOaEiERfPUv96GtNaz6tAFt361/uXC166U4xQDKtf9MjZdHV8AFdq9/Wl6mHqivWUU=
X-Gm-Message-State: AOJu0Yzho5G5T6aUJJBuAjuchEwsWqFsZV+GAhkS+PM/HakpIAYgJXrn
	O42mO8fr/PPs9j7ZqKP30BzV8jWTxeiARLRj17yLDmuMO1gKYhZASN0LEFV0zVBObCLA+iT9TQm
	z7wawD05C/P2/cgJsR8a6XcJQfyeWHkq8VhY6
X-Google-Smtp-Source: AGHT+IH5Ep/88bbCWZXRUVBPEQ+tzupqROr5HmyaRJfMyZWiEj8it63tIiOzqdgNyDMpwvhyZfPAAiV2XhcMqLgvZrs=
X-Received: by 2002:a5d:4642:0:b0:362:8201:fa3 with SMTP id
 ffacd0b85a97d-36d5ff6f35bmr1589390f8f.34.1723227683079; Fri, 09 Aug 2024
 11:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
 <20240808-tracepoint-v6-1-a23f800f1189@google.com> <20240809191601.3d15e3af.gary@garyguo.net>
In-Reply-To: <20240809191601.3d15e3af.gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 Aug 2024 20:21:10 +0200
Message-ID: <CAH5fLgi7dy9PV+YfCJuVoH98M0z2FUnOAjBoFKkqyG8P9iPSEQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] rust: add generic static_key_false
To: Gary Guo <gary@garyguo.net>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
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

On Fri, Aug 9, 2024 at 8:16=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu, 08 Aug 2024 17:23:37 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > Add just enough support for static key so that we can use it from
> > tracepoints. Tracepoints rely on `static_key_false` even though it is
> > deprecated, so we add the same functionality to Rust.
> >
> > This patch only provides a generic implementation without code patching
> > (matching the one used when CONFIG_JUMP_LABEL is disabled). Later
> > patches add support for inline asm implementations that use runtime
> > patching.
> >
> > When CONFIG_JUMP_LABEL is unset, `static_key_count` is a static inline
> > function, so a Rust helper is defined for `static_key_count` in this
> > case. If Rust is compiled with LTO, this call should get inlined. The
> > helper can be eliminated once we have the necessary inline asm to make
> > atomic operations from Rust.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/bindings/bindings_helper.h       |  1 +
> >  rust/helpers.c                        |  9 +++++++++
> >  rust/kernel/arch_static_branch_asm.rs |  1 +
> >  rust/kernel/jump_label.rs             | 29 +++++++++++++++++++++++++++=
++
> >  rust/kernel/lib.rs                    |  1 +
> >  5 files changed, 41 insertions(+)
> >
> > diff --git a/rust/kernel/arch_static_branch_asm.rs b/rust/kernel/arch_s=
tatic_branch_asm.rs
> > new file mode 100644
> > index 000000000000..958f1f130455
> > --- /dev/null
> > +++ b/rust/kernel/arch_static_branch_asm.rs
> > @@ -0,0 +1 @@
> > +::kernel::concat_literals!("1: jmp " "{l_yes}" " # objtool NOPs this \=
n\t" ".pushsection __jump_table,  \"aw\" \n\t" " " ".balign 8" " " "\n\t" "=
.long 1b - . \n\t" ".long " "{l_yes}" "- . \n\t" " " ".quad" " " " " "{symb=
} + {off} + {branch}" " - . \n\t" ".popsection \n\t")
>
>
> I believe this file is included by mistake, given it's added to
> gitignore in patch 5.

We may have to rethink the file extension used here. You have no idea
how many times I've deleted that file from this commit.

Alice
