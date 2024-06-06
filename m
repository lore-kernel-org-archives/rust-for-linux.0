Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C45199390
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Jun 2024 16:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717690641; cv=none; b=k/gsy2SxkXU/FBU2BQKrWTtd71yfCWBEF81thwnS1KGXcx+gweZ7KbcY5FR3ipZsdAW0pGApS1kpbLlLgleTEwgIvE1HkCZGJJhLgyEYGv8iqrfczW0aoVUg1lx85ctGnpPYPWh6x23/FINLRpyuVtgZgvtB6Qde6vufIOomKyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717690641; c=relaxed/simple;
	bh=mbAkMeRLThLu27MNnTKFl5hpf8DLAB4Oi0XQp+8bSYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKCXxEawms4TESqP+B2kfk3pcZCpFdhKy/V/wNKOJ3KwzWsrlvvzaBYQY1PgLU/Ryqy+GMeiSMS8nwhpPvIHS9ez+vQZ1STF4VTUXrc6vxTU1dbJI1wUFIfjxdR4wJDxx3Qf2wAS7JBC0pgATJ2Tgi7wrI+pdBllsUxutGny4Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JK11S6P0; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JK11S6P0"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6c9e8c0a15bso876594a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 09:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717690639; x=1718295439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B06vkocA1DDiV610x8U4TAD5hd5vXgCgru9dB0vKQw=;
        b=JK11S6P0Yp3gbEUmw89NN4iW3GwbyC8m5eAoFHxgNjHLL19pjlaTlWz22WzDX+Ojmd
         jMLPxemUZv1DPQ/rWl4iYxOSmeKMFQbV0PMjw2QzA7ZWn5iRt3tn029bo56UT3s7o47T
         5ASidPUMq+tXqLyROwf0xGwSMiPQP7cvThjjxrzBdVxcI73DF0sG7JlSSc50Dy79tqEM
         MTDMmcIUqJm5rhJuRVoybDBgm/+SYzHdfn7x9t+EjXVqc1QdvyFbwXWzVGmn9h6g5HpA
         GruDLKS4Dzm/B/ZnoOprPxFtvvKRAO3EiFkrkQwsc3Il5zGlIIUNxzedJb+XtsvRVJUF
         h5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717690639; x=1718295439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6B06vkocA1DDiV610x8U4TAD5hd5vXgCgru9dB0vKQw=;
        b=PHN5kcV531EKGzhTsUHoIO+kKJV+N6JzknxAu1upfcxkAuwmmFoFiCpP96wCR8fpxq
         k2ClcO9ukuAwQrP7lUYnHjitFxuzZNO4tVyvkD1QjCs+J9Ur9H7RNy3OUu7KSMlRsdug
         tdzv8Ce4kmJet9v1NRU7xNRc3yX97kRyX5XRPUPiX1jWKJhjOAaVNWvDH2jhM1QwV/Wb
         IqvBwuGuJ+LFhgOYDurEEOJIP2oZfNowAvw3oRrwcZ5QtYDLo0ciwFcVF/lvr3Wg/iVQ
         /HEooLkhRF0gXSh+2HCM4DyMWKvkyBzcw5seJrWOT+Yn8pJFMYnxrRrWr6yZpQNunLg3
         gZLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaPIuhf7A3mg63bz5oiHrhqH0vKi8/rrdjCyfeVG2AiW5GJhXNz9x/DgwJ0hrITvDJWb12UYSitudLUjogpog5G12je0n+7AamNdwd5MA=
X-Gm-Message-State: AOJu0YwStidRHl0OOxc2vF36QSp+VU1E4Xr3agj5NShIo57eMJuLdKyB
	fuupC/cFrTNqmPLpCpVFg6Kh8Yb1GMAg5dW+Dq+vmRnaYP1wPe4Fpg1W/JpUDigK8nuVZh8so7o
	kFO2hlzpKLvJYC1YhOVGzEaN3i636a1UghUbp
X-Google-Smtp-Source: AGHT+IHcdIKWECVRfkS49VoI1MkpGTE3+L1UOCM3hKmnmAXjbXPzujbCAkv0x9spbamGCxAs9KNC6QO1BLGzfwWnhsI=
X-Received: by 2002:a17:90a:788d:b0:2bf:7eb7:373b with SMTP id
 98e67ed59e1d1-2c27db55dc9mr5876731a91.33.1717690638412; Thu, 06 Jun 2024
 09:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606-tracepoint-v1-0-6551627bf51b@google.com>
 <20240606-tracepoint-v1-3-6551627bf51b@google.com> <389a8c55-a169-47ef-99c0-48f58003b40c@efficios.com>
In-Reply-To: <389a8c55-a169-47ef-99c0-48f58003b40c@efficios.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 6 Jun 2024 18:16:51 +0200
Message-ID: <CAH5fLghG8VpUnHbigO28k9nE9ZFS3EHGT2SE-0mZG1NtHF0qKg@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: add tracepoint support
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 5:29=E2=80=AFPM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2024-06-06 11:05, Alice Ryhl wrote:
> > Make it possible to have Rust code call into tracepoints defined by C
> > code. It is still required that the tracepoint is declared in a C
> > header, and that this header is included in the input to bindgen.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> [...]
>
> > diff --git a/rust/helpers.c b/rust/helpers.c
> > index 2c37a0f5d7a8..0560cc2a512a 100644
> > --- a/rust/helpers.c
> > +++ b/rust/helpers.c
> > @@ -165,6 +165,30 @@ rust_helper_krealloc(const void *objp, size_t new_=
size, gfp_t flags)
> >   }
> >   EXPORT_SYMBOL_GPL(rust_helper_krealloc);
> >
> > +void rust_helper_preempt_enable_notrace(void)
> > +{
> > +     preempt_enable_notrace();
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_preempt_enable_notrace);
> > +
> > +void rust_helper_preempt_disable_notrace(void)
> > +{
> > +     preempt_disable_notrace();
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_preempt_disable_notrace);
> > +
> > +bool rust_helper_current_cpu_online(void)
> > +{
> > +     return cpu_online(raw_smp_processor_id());
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_current_cpu_online);
> > +
> > +void *rust_helper___rcu_dereference_raw(void **p)
> > +{
> > +     return rcu_dereference_raw(p);
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper___rcu_dereference_raw);
>
> Ouch. Doing a function call for each of those small operations will
> have a rather large performance impact when tracing is active. If it is
> not possible to inline those in Rust, then implementing __DO_TRACE in
> a C function would at least allow Rust to only do a single call to C
> rather than go back and forth between Rust and C.
>
> What prevents inlining those helpers in Rust ?

There's nothing fundamental that prevents it. But they contain a large
amount of architecture specific code, which makes them a significant
amount of work to reimplement in Rust.

For example, rcu_dereference_raw calls into READ_ONCE. READ_ONCE is
usually a volatile load, but under arm64+LTO, you get a bunch of
inline assembly that relies on ALTERNATIVE for feature detection:
https://elixir.bootlin.com/linux/v6.9/source/arch/arm64/include/asm/rwonce.=
h#L36

And preempt_enable_notrace has a similar story.

The solution that Boqun mentions is nice, but it relies on rustc and
clang using the same version of LLVM. You are unlikely to have
compilers with matching LLVMs unless you intentionally take steps to
make that happen.

But yes, perhaps these helpers are an argument to have a single call
for __DO_TRACE instead.

Alice
