Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9733E33CE9A
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 12:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767960059; cv=none; b=RWAsUOojGgaZKp0MlT+UwXDBQ2F2ldvsTmqFjRQU7JDr0f/Ds4kZfUt4y6zKxVpQAXcnCuY4wn8wVdTfp8kdJ/ZwdWvhsHojIN7buwnLhtyaWUaKi9ADeNExi9xc/1blmkgQnHXfpA1gPpx4xVi56ondMKRi1Ev1hTlaGTme8R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767960059; c=relaxed/simple;
	bh=UznriGhvPdMXopWmxqdYE06e8kOqyoTAoTC4x2EkwLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMxVLluIq+/7/GmdedEXBQus5EMAzp6dM0w4Y7myWs01gUA6DrMB/1RlLvGL3+GuLDM+RMWulOnboYtNN9IM1HHjWZTQGKW4P+7BBU7zpQQSjACylG/1zEUlFu7Qbwq0Gf6EIMummFV6zjNvLB8KuLZCzTHbJ+Flzfe/vpUgqNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XZBZs4jd; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XZBZs4jd"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-121b14efeb8so382217c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jan 2026 04:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767960056; x=1768564856; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8T/N0YjJdMPLkCw5fXXL5pxg8eGLGcQ3fujG7tmwcHw=;
        b=XZBZs4jd/NZb/iqRwFPkNZUUJFiE1DnErHneL1RAwWUm/Qj4BHH+PDBwkbMFERlxSp
         LyqZ4Xh+/xk4172pColrwodzXAn0zOR/UvTJXJ/z+ZH2s1Ny2/RprCmZYaiD8G4jUzEr
         0kkcQ98VxSB/vLAKgDWcH16L0E/TlcVHRlFp0AAr8fD61swyopfLe7vx4D8agKnI6udj
         gQoKBPwUTy3oD6mZ3MR0lA6eSjsA+jdjvCsQEj5O/deQlqKBLcL6fy8aL3awWtqjjaJy
         +vPeFd1DPL+8zAgit/JkTi1NdDKsSvxVFj8t9VBngfKjAy9B8kR3JGfdt2LoOB6ezQDy
         nm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767960056; x=1768564856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T/N0YjJdMPLkCw5fXXL5pxg8eGLGcQ3fujG7tmwcHw=;
        b=LLqgnWTO8Xs625E7u0kZbCaoAduQWHdkpDTF+RKInW4qhwEDRt82A5JloYoW1jwUmu
         izOU9rT/C1uXO0u/ZjINffouS95K3PUuZJxJQQ48J6odrUKnD95ad4mvT6IJ/yMDx9y8
         VPflNjN97EPAKtDI04HEx3oM3NT+jTDhDpGPlAonNnVhyRIOr6D9Vzbo55KievZ7VG+B
         UBBsYA7Pxm5hZOLzsMf9YME2BC9725fhhzxBfZFfdxKvPw6S6Nd28kM2MDHcYYXL5MKu
         e4JaxDjYrpTq6rK+H1q7gthfeild94RVyzEok9Qz8Ku2GlzBYvCu2YNUOLpuJ1stykTV
         UtzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWajHkyvLU55EXyR0LrjrCphWMfQloVOKMLdc89QWrCGvIbAkrQzNw4+uyvdECOtnHvJArvV4O/WoJtpBnKLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymNuc8Gu9fNe18YFdyhNMBD9A5mZEa7g+HMMksB59ZiTUl/fso
	v8Jm4I0lwrEM/qB024vm8gTUOewDfVLxkh/jak6PnHkU8AVa7HQaJUbkR+iG0coxN2IrX4ZrZTM
	mQ+xoh3gIiO7HBFhFIW+Y4RiXNXSOGTbVmiPAg3qW
X-Gm-Gg: AY/fxX6x1HNsDUTNf4NBnbphUrOzhpXSArqYuSxW2qkOHAqN2zX8wbMvKQF3NR1YldR
	rVb3lbWbfsWv0KEBJSb6OHLiixoSBdGnn7t8sRhaCQx+BWHTHk4t3+7zKBEHf5Ggf1WSmL6XD/J
	MYqnMoIQLsRclVG9k0rjHLGu6sobV/xxob2sRN2TLdBoQOKOlJd7SgS6rjQ1st60aRNAEzFVjlX
	LMJYifmo4F8GaQGRtM9JGwYyaLzicvcSVbEXI4Z3R89MCBKvQix3FvyhSV8CFnxtsVMYK32+tFq
	89UZxCHDs2zz5WiyiIpTkNSkj70=
X-Google-Smtp-Source: AGHT+IHkqsIfmF0FluQuDu53MIRkzwgbeeQdzuawZsTGXquSsN/434sV7j/4310j+FEbQ9rNU7DnJdRzHaNlwPlcWDM=
X-Received: by 2002:a05:7022:4199:b0:11b:ca88:c4f7 with SMTP id
 a92af1059eb24-121f8b67cc0mr8303949c88.40.1767960054556; Fri, 09 Jan 2026
 04:00:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com> <20251231151216.23446b64.gary@garyguo.net>
 <aVXFk0L-FegoVJpC@google.com> <OFUIwAYmy6idQxDq-A3A_s2zDlhfKE9JmkSgcK40K8okU1OE_noL1rN6nUZD03AX6ixo4Xgfhi5C4XLl5RJlfA==@protonmail.internalid>
 <aVXKP8vQ6uAxtazT@tardis-2.local> <87fr8ij4le.fsf@t14s.mail-host-address-is-not-set>
 <aV0JkZdrZn97-d7d@tardis-2.local> <20260106145622.GB3707837@noisy.programming.kicks-ass.net>
 <7fa2c07e-acf9-4f9a-b056-4d4254ea61e5@paulmck-laptop> <CANpmjNPdnuCNTfo=q5VPxAfdvpeAt8DhesQu0jy+9ZpH3DcUnQ@mail.gmail.com>
 <b0f3b2a6-e69c-4718-9f05-607b8c02d745@paulmck-laptop>
In-Reply-To: <b0f3b2a6-e69c-4718-9f05-607b8c02d745@paulmck-laptop>
From: Marco Elver <elver@google.com>
Date: Fri, 9 Jan 2026 13:00:00 +0100
X-Gm-Features: AQt7F2pBr33IaeEZzEbVtkwEGkq72MjCI-S9aarJ4oQjqFT6bTaIuZHUMWVHI0k
Message-ID: <CANpmjNNSCNm+A=nKdeSDAkcgiKXMEdcQUeMb4PZxWoP2t-z=3A@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add READ_ONCE and WRITE_ONCE to Rust
To: paulmck@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, Will Deacon <will@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Jan 2026 at 03:09, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Tue, Jan 06, 2026 at 08:28:41PM +0100, Marco Elver wrote:
> > On Tue, 6 Jan 2026 at 19:18, 'Paul E. McKenney' via kasan-dev
> > <kasan-dev@googlegroups.com> wrote:
> > > On Tue, Jan 06, 2026 at 03:56:22PM +0100, Peter Zijlstra wrote:
> > > > On Tue, Jan 06, 2026 at 09:09:37PM +0800, Boqun Feng wrote:
> > > >
> > > > > Some C code believes a plain write to a properly aligned location is
> > > > > atomic (see KCSAN_ASSUME_PLAIN_WRITES_ATOMIC, and no, this doesn't mean
> > > > > it's recommended to assume such), and I guess that's the case for
> > > > > hrtimer, if it's not much a trouble you can replace the plain write with
> > > > > WRITE_ONCE() on C side ;-)
> > > >
> > > > GCC used to provide this guarantee, some of the older code was written
> > > > on that. GCC no longer provides that guarantee (there are known cases
> > > > where it breaks and all that) and newer code should not rely on this.
> > > >
> > > > All such places *SHOULD* be updated to use READ_ONCE/WRITE_ONCE.
> > >
> > > Agreed!
> > >
> > > In that vein, any objections to the patch shown below?
> >
> > I'd be in favor, as that's what we did in the very initial version of
> > KCSAN (we started strict and then loosened things up).
> >
> > However, the fallout will be even more perceived "noise", despite
> > being legitimate data races. These config knobs were added after much
> > discussion in 2019/2020, somewhere around this discussion (I think
> > that's the one that spawned KCSAN_REPORT_VALUE_CHANGE_ONLY, can't find
> > the source for KCSAN_ASSUME_PLAIN_WRITES_ATOMIC):
> > https://lore.kernel.org/all/CAHk-=wgu-QXU83ai4XBnh7JJUo2NBW41XhLWf=7wrydR4=ZP0g@mail.gmail.com/
>
> Fair point!
>
> > While the situation has gotten better since 2020, we still have latent
> > data races that need some thought (given papering over things blindly
> > with *ONCE is not right either). My recommendation these days is to
> > just set CONFIG_KCSAN_STRICT=y for those who care (although I'd wish
> > everyone cared the same amount :-)).
> >
> > Should you feel the below change is appropriate for 2026, feel free to
> > carry it (consider this my Ack).
> >
> > However, I wasn't thinking of tightening the screws until the current
> > set of known data races has gotten to a manageable amount (say below
> > 50)
> > https://syzkaller.appspot.com/upstream?manager=ci2-upstream-kcsan-gce
> > Then again, on syzbot the config can remain unchanged.
>
> Is there an easy way to map from a report to the SHA-1 that the
> corresponding test ran against?  Probably me being blind, but I am not
> seeing it.  Though I do very much like the symbolic names in those
> stack traces!

When viewing a report page, at the bottom in the "Crashes" table it's
in the "Commit" column.
