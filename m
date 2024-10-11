Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7992F28EB
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Oct 2024 10:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728641788; cv=none; b=Wf/hBYTaRW/cmEEa3LF+BM1GQXFYiYVKruKYt+yCl8JSFB0BlEq9BNhRv6pd7/SP6nMtvbv/kiq9s1drPJOm6UxpqrdzAKpMs1QLL81mDqFL7o4GY3dLrl2/FwVXXE/NulRa5qoyQhefEvQkL95LYBx3LpnXyCqTdq6FhKzGSOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728641788; c=relaxed/simple;
	bh=VnRcOvG00eDk9unXV1hgFBknglSVE5O1qDH//99Y1Rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOkqWDO3JI5p3QteQSZpNoCiYyG/v1sPeFSY6Ou5q+djKThKu1t7c1zli/fCSdVVDzwMBOa4QRGUrZ0tkx8kgvzVbJOBY7qcjFd5EIOhTEHTdTULzU2tCKLCKirPpYzUkvpOVSEPwJGYGQX+amDFLerMYC3lLEI0Xmt3ME6/2OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dHsPmUvu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dHsPmUvu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-430576ff251so16208295e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Oct 2024 03:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728641785; x=1729246585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnRcOvG00eDk9unXV1hgFBknglSVE5O1qDH//99Y1Rw=;
        b=dHsPmUvuEGrSeb222HJsh48e4OS2YwbZb/ba8QgQO7B+sRVD80Wae8KSrCv6aINT1E
         Lm4HaARgBoTn5D8OknLykrc+bhqpWw95UzgkYxte1Ff2ILb6rNdUqywO7hKDwJVfHv2q
         T49+2eMAvdisJQtEEq/NrhRk7MNuZCekZdGEI3L45SLUvpx6DTG4D6vMMgb7GJP+gYU5
         MVqqldBidARWrQgDAiP3XcPMlLfW0/lhSu3eAESosLArMXgKJ9HfH7qRtb9V7v9Ojxmu
         HN1/qrnzRFz+NsbiH3BEjCcW8VccLaunw6h2ELn7XWy8yKbvmNhs2RztkBf8Um/3/KdG
         npCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728641785; x=1729246585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnRcOvG00eDk9unXV1hgFBknglSVE5O1qDH//99Y1Rw=;
        b=UvvxYIG8Y9AhZRSnf6SUZOGWN2DB4w3fFhXlkrZlLeUQpjdzJmwSGJ8OYe3TK3LLHD
         gCdXfBw2BH9AOzba+Cn0oykvfLm1+SzSlGIxY/aWTFLDKV602FT9Ib4BRS09l9MCzVIO
         r6Ert4YU7dZIyIfa9fNxaXnHwoJUG/CKnrEx37Yc1kGN718RiwNM4YAzoAArHlGoHeGg
         N47ixZ1rb403N2l+Wla2BngrU9Bz6yK/atiMdZphEUjXCvZsy74V5owt50kOlR9PgUKk
         sWvQ+BcUmapfXg7/y5+IbNIcdYYQamVmJTQLVvp4nzAQO4Y+wJfKY4RZd6oR95IMYIBs
         oqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuEbQcg9A+JHJVyjvvD4sFraFRhmUyZl+zkcDNkkqSgwsaDdJiS8j8KKnoB7b8c3n5UrmwYcVNUkKjpx4eqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYb2zrxE4YGKHBnQBiJ3m6ftRLBu8mxMjWvVR0m/xI71AFVacj
	RiyIh4uJHDfi2Rmz2TnAAbPOlM2ktaFwvYUwVMp0WZ3ZLbd+gHdj7uIWN+XGCMP3qQV8BrCvHor
	zpoS3WKuP7HHRb/HRs+3IE/6MWRvpucYwIEL3
X-Google-Smtp-Source: AGHT+IGMNjtCG9rpECyAAco9DzsrUijuUFkuK2ogFVx/VRCgWggYYygWbJym2kgBDSGBNFLXnFb7cUmfBa/gllnaBLs=
X-Received: by 2002:a05:600c:4e8a:b0:42c:af06:718 with SMTP id
 5b1f17b1804b1-4311df435e7mr16515715e9.28.1728641784578; Fri, 11 Oct 2024
 03:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
 <20241001-tracepoint-v9-1-1ad3b7d78acb@google.com> <20241001211543.qdjl4pyfhehxqfk7@treble>
 <20241010154320.6d17ba69@gandalf.local.home>
In-Reply-To: <20241010154320.6d17ba69@gandalf.local.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Oct 2024 12:16:10 +0200
Message-ID: <CAH5fLgiW-AEN-YN3YoW66hV2w6eEP03OC4oefg0N-tdwyLx8cA@mail.gmail.com>
Subject: Re: [PATCH v9 1/5] rust: add generic static_key_false
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Thu, Oct 10, 2024 at 9:43=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Tue, 1 Oct 2024 14:15:43 -0700
> Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> > On Tue, Oct 01, 2024 at 01:29:58PM +0000, Alice Ryhl wrote:
> > > Add just enough support for static key so that we can use it from
> > > tracepoints. Tracepoints rely on `static_key_false` even though it is
> > > deprecated, so we add the same functionality to Rust.
> >
> > Instead of extending the old deprecated static key interface into Rust,
> > can we just change tracepoints to use the new one?
> >
> > /me makes a note to go convert the other users...
> >
> > From: Josh Poimboeuf <jpoimboe@kernel.org>
> > Subject: [PATCH] tracepoints: Use new static branch API
> >
> > The old static key API based on 'struct static_key' is deprecated.
> > Convert tracepoints to use the new API.
> >
> > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
>
> Alice,
>
> Can you send a v10 with the added acks and whitespace fixes as well as
> using static_branch_unlikely(), and I'll pull it into my tree.
>
> Base it off of v6.12-rc2.

Here you go:
https://lore.kernel.org/all/20241011-tracepoint-v10-0-7fbde4d6b525@google.c=
om/

Alice
