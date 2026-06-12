Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB902874E3
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781247395; cv=pass; b=sMtiQWtq6TCg71bsrW2QUT2gReRCIVNki+4logCKbkgbGBYMSSSMdBRTjey7WNw7jEQRQJ0gEP4BrUxVsU14sDSVzSoKNyEPe5cTFfTI/folZ3OnNRJsR4kz6BpOvxCTz4YFtRlKhZuLdSIZtHGErapoPtTL1XNXawztffJnIyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781247395; c=relaxed/simple;
	bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+rjp/pYUHRr3VwJEESOhSMg7A1qq3mm/wLrNCaomJhTv6JqQd6LmQUt+cqdhyKUK8M5xO5hnoM6Q3GhJhv6hKINT8hAkvMa3WOY3iQKU0s0eAjdwp4Qp2HcbUg1EttmuzkibiLh4ZvkxnO9rh1HnKMm60WZM3oPmOZDnZUsShs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EqDjjaIn; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EqDjjaIn"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68e5f7c1131so1064706a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 23:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781247393; cv=none;
        d=google.com; s=arc-20240605;
        b=SCU1Abpka9NsfzbN+2wsYIX+T/fMTWM/1LLN/YgqM+w0uktvRJs2G0vq7PK0360y8a
         BnpxlPJphTmu8TahRT0B4X68Jfj6IzFEYQ/OaY/iAprxTERBMEda3f43f8B3ZPEcp9Tu
         VI+kuDZ8YPS+dyAFY/JR1r4jX5w1kimHNcnzIwDrWfiFxCJ6pJkng/EU+Wb76bkIPpAV
         e15X28W2Z8INdkwmB7UA8sk3lN2nD99rwtbt+k+Xw0qoT7I3moDPSOdZ2H03TayDvPgn
         2+KNTDUjGEpiucmSPp5siIFNclKMRSajEa3juGkBpDcTRzqzoQ+q3Kqcd/7gUJl7oKsg
         2dUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        fh=EDZyYK2TpuhhX4il7A5VvNE8Zc8b44R812NwOQg5D7s=;
        b=SA3syIpev8jARK/HnqIJO7G3KCdJziK/bGtdG/2UsiBe7EoBiEOF/He0Gr8YozwQpR
         Dj/ZML9SkpoekXQUxgU2i9MLftaRJLU7/d3Tlf6H6XqKAs/5QzWqxeYkEgDiiZ8Tu7D0
         w1ejgNe0aQN6KJzby9L1YzwxEa7Js0yNsUuSgS3NkTQXD/LrnL2Ajf1OhioMTvDjCZXj
         NkJux9mghVDSNLChoz7N4VHzMKlS9yQRoJkTfNUyyl4yzkcJOuuW9Vdf6tejnpiOjkoB
         BzF2DVxoPvY4451rLjJfXjt8/N8ObUtNWrS6xcNkq9T5+Vtgv8mw01r/ESpTCv5O61jz
         Lrzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247393; x=1781852193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        b=EqDjjaInov0ka4alN+yEFWBFuaxhdbrfTeM99dBjBHVH1TGqPNOwMXvp3aBAtkNwGy
         wuUszsiCnccC+mXgVgklYrmJpM4ITNLR+1Pdq81iYB9iH8fIQ4Bj7siJSio/GUKufXNx
         uXLplkNvuYKJ356p1ai5tl+9d3qggFzGRiMQ0Y85CiE+L3Q12ToW+x1COpZlQo+fpOZE
         Apr3vb1VXwL/9IHBFx3WjOH6ceWGtdi2t3QdLCyf1j21yuQZfrSPzo1HjsEevZyy96Wl
         FDOKchXplfC1MTsnyxN7ZPsFme7ZJTfu3QPEZC/sMXV7SCV1Jl+fh+kNG5QUGdXfpb45
         NfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247393; x=1781852193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        b=o1De6xYmT93ducxoOYTSnx4Ozm/3O34gCAHYP8KzqphWnv6BQkjKirrwJkmGEyiXbD
         8bZH1vdTowDkNhQDEliV5Ms2prthuETP2wQPojAznWJD4VB8mi6e0gt9jQOwEbJ9Hw6R
         mdQHwWec6nz8dnVpmJXQEW6xrcOHjuXqXURfGDp6ZY13R1X4h6+mFoZU4QnSMvF/sMO4
         2urrpt7AVhrMSzTQMkGwRSSmAQ7egpmzAix+xN9w/OWQrAmTh5iy50wm3yHTjKUSeqai
         bEyX6ryyZeTO3fKp26uEqMe/tRjMxifLfcJ6Dv6R/lftYTEqpYPz4zZ9SAX+2qWE0U8l
         Rqhg==
X-Forwarded-Encrypted: i=1; AFNElJ+LqPGaBy70Nr0FY0RHt+3aisF+MAZpxiKkIP3Ptq1+UbIoxTXGTtlXTN5BNBwAIcjW0keB4UTLEjGjZ/j0nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgFYcwmcuctPYJ8EV43s8L3ya7oHIo4nuKnAgnSJeWwA12QbQA
	FW70ktFLHZfuEwkFG1hs/1IhvSkg9/bC2h7W/blZkdp5U2XxKH0dnq/ZfOf3TzR6x3okTSj7umE
	U99YBdbTeF5/aCAU2OUbeS3wfXzd/Oo7UFo5vvt29
X-Gm-Gg: Acq92OHMw/kdxv/Fr6YkApARiu1ofgL/Xzu/JZ5bdWTA03ZGxLnnSq8WK69VRtn5Vh4
	fU8VlcdqcQZDQJH0IZp6iuLoNf2EKstvaOBU2+L5gge3d6SUwjLIG9O2Lj5+I0HvGCziWQyHYvf
	zlZPm79hZSxP6panjdbOD+iDyVQlCwYktz3yHDeC04UHPZgcog/ff3aaXWEbK7BednUU5tmVs5k
	47y0OnYe/dtGC5NoKgrUuwGmhjHN3aQURvCAuGcQMfPtCydALBaYGotYFXRHYd8x+U5E/SvHdvr
	UVwV7RVN3lkAJ6dH+4BZZf6/9Wq56JXBibz9GQ==
X-Received: by 2002:a05:6402:434b:b0:68b:d10a:a48a with SMTP id
 4fb4d7f45d1cf-693784fb02dmr602313a12.11.1781247392123; Thu, 11 Jun 2026
 23:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 08:55:54 +0200
X-Gm-Features: AVVi8CdLRn3HUIKr4oSFNxeMmeQ95IhSWpzIU1V25ylhb68DqGsVy-9EpMVuQUY
Message-ID: <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/14] kcov: fix INIT_TRACK race in kcov_dataflow
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>, 
	sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Two threads calling KCOV_DF_INIT_TRACK concurrently could both observe
> df->area =3D=3D NULL, drop the lock to allocate, and then both assign the=
ir
> allocation to df->area, leaking one buffer.
>
> Fix by rechecking df->area after re-acquiring the lock. If another
> thread won the race, free the allocation and return -EBUSY. This
> matches the pattern used by KCOV_INIT_TRACE in kernel/kcov.c.
>
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202606=
03-v2-0-fee0939de2c4%40est.tech
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>

Can we please avoid this?
kcov_dataflow.c is being introduced in the same series, there is no
need to send a buggy commit and a follow-up fix - just squash the two
together and note the changes after Signed-off-by: separated by a
triple dash.
