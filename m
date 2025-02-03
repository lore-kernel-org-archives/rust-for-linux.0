Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FC820551E
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Feb 2025 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590112; cv=none; b=kyvwK8m5MdAZnYL0SkIGK/LwXTtIu5mh8IouYGTAvdMTVYz0IgJ7Fovnl5M3AILCoK1nwJhHCKEUgEcLd5DcijMUrND/UDN4OUomrvDuUEHgTa2GGmHSSceQxQEY2KbQ0djBAHPE1Sgjq/OhNSzvFWoyGVGRlBbJrMisZlfh8MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590112; c=relaxed/simple;
	bh=v6TgPqyqI6z9a/E6p1DALgpcD1zjh1dlYZRXglg2K5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ur4ykryNGvCBLU0H7H+NuIBhHy0olAzqolPYLk58Tdthcjqd2mgzqeQ6DXILK6u+8ixXzD79aygzX4yKxGJ0Q1TShbfi2WrH6GaS1IGwvNCzQKS40i/c5Vdg+qOeB7tP+lknDMHcbeMyguO9zkjS59CTVq9iSGAb+NkmJ/SM80Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wz+uClh+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wz+uClh+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43634b570c1so31396915e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Feb 2025 05:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738590109; x=1739194909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6TgPqyqI6z9a/E6p1DALgpcD1zjh1dlYZRXglg2K5A=;
        b=wz+uClh+rPAxdeVQnHNrAwOpF5fa7q+AHDXJHawSAw/3ONuxzST4Y/g3X/JlyznRm5
         Af1joA921LXFTb9TEPF/33KF9UjVk49GYVZHK99MDR8gA2Kp1OB02YrYPvlsaFx8wjZg
         EaeXBCbpuON5KTXgHMaqql3jczDxwaV874/n3WqEel9YYM9nIZYyDMZ6N3YAJqZm9L+X
         ARdHqrCRu4JSZSBnfDG0ReVdEPT9/dnwtmQyeR0Wr/Qd3RvB2hrlIveCy1Td39lipDgD
         mtA+NaWvLWcllIeVPt6pJN8yU7vHHpBN14XUthGrmcz0SbDfY/P2z30OjqywtSdF+77I
         ByZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590109; x=1739194909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6TgPqyqI6z9a/E6p1DALgpcD1zjh1dlYZRXglg2K5A=;
        b=aQwZaqjqTaYVPXds1/Y9wDZNGx5CrJp/aZy+kRPiAUZlKJ54JOj06FWM8QgdGxZQ7U
         bcaxJMqIgY33Qo6XWk6ljk7PH1pD8SoI8rQ+magNrge9X+O+2sparWtpEs+9oGrqqGE3
         F7oarxiOcWaLENYAk6y4k2ognAxAt2fx+ggyH+semQUNYjQOruSnmUNTznV8WbX0WzkT
         kQg2+S4BNdvaRrF2VC2qM48WV6eiBKEVk3lBWhtmTongMOg+rmxRRinVBoxkBmiXmkLj
         nHORl5HA0aNao73DIYVj5OnzxZ7BEBpSsA1NqAym89QahlQUIYRmr1p8jbu9YGMlIrqz
         uKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg+rzM3RElFw2849w6Kpw4cKJpAL8U6arlDtS6nzH5qsnIZBYa6ZPPFrgQbIdTbYyZpoFfNak1fJFIX/nDhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkOcrS/QDhkmYAlGxuN+TD8XVw7CoW1PvoufwyUIQFikMtm847
	W7tdpPrDVwJwaaGgykFKZnf/2xGvO7+kl4u7ZPjemMV2j+zx88xYJqZfV2F8j9SENyaqWBbW4kU
	HzT2YMUl3e9ohdzdKyvDCXgXZRD+lLAoCDYvd
X-Gm-Gg: ASbGncvvtHH9inwqwlg0FBMEjW7zzF/62W96l7dnQpglF8nrrJAVyx/ZKD27jTkwAm+
	xq2DuR4QstqFyQN+BByw998FkSMwsSMAWgj4I9EFhlPgQyH4YMBtj1d0svleEOmUdlR3qI9WCES
	tlPgs/NY9hcjRn2mYiZDwwBgnj
X-Google-Smtp-Source: AGHT+IEjmWafnYE3gVHPH780xuQ/9qMpdcutW2fe7sKkR8WKePwHyeh/8BkO2yZsnTLme0J5G3FY4KvMLuM4rLT7C+8=
X-Received: by 2002:a05:6000:1447:b0:38b:d765:7046 with SMTP id
 ffacd0b85a97d-38c51b638bfmr19561062f8f.33.1738590108780; Mon, 03 Feb 2025
 05:41:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-condvar-freeze-v1-1-a91d5661d505@google.com>
 <20250203115418.GB14028@noisy.programming.kicks-ass.net> <CAH5fLggyyP1A=uNxr2iYNKOj0V5rxZRU83TRgs6Ah1uJ=Ee2uA@mail.gmail.com>
 <20250203133843.GG7145@noisy.programming.kicks-ass.net>
In-Reply-To: <20250203133843.GG7145@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 14:41:37 +0100
X-Gm-Features: AWEUYZnr201N-8YTrWiZ0I8mIX9bHMmJfAZdw9dqrtfEbciGVjjKqWGWERc9fKI
Message-ID: <CAH5fLgjVyCSTyZqS7uSzWMTKvrxPL55PKUyM-H0RrnuZiU9VEg@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add wait_interruptible_freezable
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 2:38=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Mon, Feb 03, 2025 at 12:56:05PM +0100, Alice Ryhl wrote:
> > On Mon, Feb 3, 2025 at 12:54=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > On Thu, Jan 30, 2025 at 11:30:44AM +0000, Alice Ryhl wrote:
> > > > Binder allows you to freeze a process where some of its threads are
> > > > blocked on the Binder driver. To make this work, we need to pass
> > > > TASK_FREEZABLE when going to sleep in the appropriate places. Thus,=
 add
> > > > a new method wait_interruptible_freezable for the condition variabl=
e so
> > > > that sleeps where this is supported can be marked as such.
> > >
> > > The constraint on freezable is that you must not hold locks. There is=
 a
> > > lockdep check for this in the code, but it would probably make sense =
to
> > > teach Rust about this constraint as well, hmm?
> >
> > Unfortunately, I don't think there's any way to enforce this at
> > compile time, but I'm definitely happy to add this in the
> > documentation.
>
> Ah, ISTR people talking about teaching Rust about the whole raw_spinlock
> vs spinlock vs mutex nesting order and figured if it can do that, then
> this should be doable too.
>
> But perhaps that never quite happened.

There isn't too much progress on that front lately, but you are right
that this work could be extended to support this case too.

> Yes, documentation would be good. Just in case it isn't obviuos,
> freezing a task that holds a lock can trivially deadlock vs another task
> that needs that lock to complete before it too can hit freezable.

I'll include those details, thanks!

Alice
