Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB37528684
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Oct 2024 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660241; cv=none; b=tOGFVgL1I9sYRkMGTCays8ref6QwI8tTf2JiLSTiY/LlY9atexu99bXqqNzeS8RZ5o1OT91nZRERPNsOG2p6PmunHyHRMRrnRk4OAzys7/UT4TgptpMTfSHaj9Cx/g5C9o6rkY3AGLbNYEVJAXIz1ih/BnEgFBe1ZyKDo7zM+ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660241; c=relaxed/simple;
	bh=rSznrDKSY4WrxXDZ8t7gM3RFnJVuejTr6MEOcAB6fmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwLgR6jo79mRpkhaFTgyPBz0ulwAFQFnra2Kmhe9gU0454O8Aym/IVGLQb7PIcC0KB6pttYwbml5BXP0lWWEHemvKapS4MnJNjFO0cUviCuEclnPArQIgk4tGCiq9/QpuVWnzzLJV62hAQMTMPdxPb3QCahZV81SJstbWkYXnJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0ZwkN+mh; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0ZwkN+mh"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4603d3e0547so307681cf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Oct 2024 08:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728660238; x=1729265038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJyLD+5sCaVL1I/s6JcwhAzF4bt83zRxkYYkYug2NjQ=;
        b=0ZwkN+mhKvCPoqKU7gQXN4FwHUul3KbBPwzynky9Mb71XGEHBPFgDEUT3Ffyh3ctHU
         djlWQHkPlbFjSVQjVf5LfAwyNhoEQmPGXdr0iQB63b4u2qPKH/J6BSuOycZXscLBKmFB
         s049UsZT9aLOA+T49P8IOen3FNgz3npnnt80UlENyu2KnpTEyS6h73hzCKVrAHYU2lak
         WasREDXUYcPf33yA4S903GqZWzlQFTuSDKOvHHtEPbkxX6UW7R7+mPv6YlE8b3nGeeSe
         ntT+iBDn5U9yEdYN1BZcZ3YGBUp1YAhhf1q1US3wY/2WkjW2BzYBE2TvCNsIuYTObWOR
         CBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660238; x=1729265038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJyLD+5sCaVL1I/s6JcwhAzF4bt83zRxkYYkYug2NjQ=;
        b=G9nmix9WK7JVWZIgqc5lEl3yQ9ukclQT3BuixIRmb0uRlxvNyLkGf5Dax63/rt61wz
         Jwv3EcrPWsGGskP72oE8VhLcifzVHVUob968Irc0CqzLAIRfmP7RLBOE9YDhURjh6Beg
         KY6LLFlZcS3EJCxmPthm4/En6z2EHBTCieGF8//1QzsdVp2K4zLd/6gvEA1aKgAyFfkr
         1Jxo5DKlDR86eEhzSfIp7Qb3v7mlFkkGaS2INpu6U271c9HLmAt6viutlpnHhEoC1XWr
         hTDqP187b44vkoMJz61oI8OifW/EOxEnJg+/+B2dMjf30xoakYiTIJhyuQby0QWP2UYG
         d7Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVmwpclQQvBXjHWSxTmkBd/a2foXdPn0hmyw8pD2E5o9+62LZekyVhNqXqIaU68qoG9gKyBj587bgEDIQHygw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwP9DgH3cgu0mO37qnt0ckUKsJdFB4MjaEOxynNpDTQIDFXKwd
	F2bk7MHkrxOvd+k1ihQI2OBawtKJ/UloaUGF21jca4N4/n4Ub86nBrjA1mU/H7d1j7YHSC7S1sJ
	MlW40TWVMSvN5heuKRQSMZ8/7wdv0REHBlBEF
X-Google-Smtp-Source: AGHT+IHfcllIoreLPh5LQZRi63Z9gY+SjozCRNWADZolB8YwBJ2VdlJgtHx4ZWrWYxemGDRWFvy4vQZfgGpiBJs66xM=
X-Received: by 2002:ac8:7e4c:0:b0:45f:68d:f0e2 with SMTP id
 d75a77b69052e-4604ac3181amr4086721cf.2.1728660237401; Fri, 11 Oct 2024
 08:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
 <20241011-tracepoint-v10-1-7fbde4d6b525@google.com> <20241011131316.5d6e5d10@eugeo>
In-Reply-To: <20241011131316.5d6e5d10@eugeo>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 11 Oct 2024 08:23:18 -0700
Message-ID: <CABCJKuesYQWvfScFaqv_rW5ZqAJNn4zK9iOFAmyTaYKO3S5hgw@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] rust: add static_branch_unlikely for static_key_false
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
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

On Fri, Oct 11, 2024 at 5:13=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Fri, 11 Oct 2024 10:13:34 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > +#ifndef CONFIG_JUMP_LABEL
> > +int rust_helper_static_key_count(struct static_key *key)
> > +{
> > +     return static_key_count(key);
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_static_key_count);
>
> ^ Explicit export should be removed. This only works because we didn't
> remove export.h from all helpers.c yet, but there's a patch to do
> that and this will stop working.

What's the benefit of removing explicit exports from the Rust helper C
code? It requires special casing things like modversions for these
files, so I assume there's a reason for this. I asked about it here,
but never got a response:

https://lore.kernel.org/rust-for-linux/CABCJKudqAEvLcdqTqyfE2+iW+jeqBpnTGgY=
JvrZ0by6hGdfevQ@mail.gmail.com/

Sami
