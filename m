Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F1D30AD0B
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849466; cv=none; b=Q7h/0IM1lG9TwnDsVgy3LpcJgAWklZcQconzvddjrGnd27UUS/02ps77gvbX6QvO1rh4AQgCziz9+SU3BRUrkrGUy8V9kU0aGIBmIA29QkTYfFa6Bx2Qh5yP3B8v4NBQSdInYuwkG8SxJ5i7XqLRbN/3FNdUI3cIA2WJhsnFFZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849466; c=relaxed/simple;
	bh=pphVR1kisW1rn59IwFVxryo0TAPKvUFI46MwfIkrRm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KX7Nx/wzdlljtAPKDV5fYT/iOn5ntUIEsSFKcqM/7LXBU6aJNu9dNwrmGdlNbfYq+7B+IiP/och9YgtHTlnieN0TtZDGBugcDPY88aHEWuIpBggASGrnnOvi/Bcbf6v40LVdsahfKpbFEgmtboaKWs5KB2brScQIrm9wd9/3HkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXJapIvo; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXJapIvo"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b827ff341cso69798b3a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 03:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764849463; x=1765454263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy74VhsBG2iXSHso83Jci8BnfjXIZJpeGjIa5hx2ujU=;
        b=jXJapIvozbiUJjPnYGgeVVbEfCNry0N6v6zsU6E2aA8NPhHuwlVisHklOBe0v/LcYa
         tmu9x2IwgahU9tryhRm1Jx3YOwXYJkkie1VmqtCp2Vul548q4Gg7+18bH0rblgSwHi2q
         Z+PXsskav1u1ji027gEI7wLCPMx+9cuSdeNprFDx/T99auJinttibRfwKxLtMP2GJBLH
         BblnptLNIFv7QtzanDpBTLgwvgF7W3ukuXSMNgJWfSkmBOzF2aQl9OpAfrBgtqANuN+u
         +C8W1Ye0XDgTPJfAfpcFB9QwLLh9Jj8hwB6Bw6tBepE+Wbt9vuJXq9wBnXcGGCNdD+ic
         LTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764849463; x=1765454263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jy74VhsBG2iXSHso83Jci8BnfjXIZJpeGjIa5hx2ujU=;
        b=Gg1IDW7eflQZCHI1+ub7KNGBDg0TymJ/dGFdiOjUOmcuB9a1OULqfY6vPkdOVOEZfP
         DQK+gxtSCm9INFwHIgGVcgYAxgzPx7PWRTZZnxxHsqr7aiCufRWY2goeqDWcjZTKQM/q
         NVrldoB4qQEmSpftayAqNAwYFs0IRD2RN4QDd5XH+pDnJ7qMKoSaZdhfLNY+5nRP0/ta
         aBSO4AKTls1JC++HMLiDp6q6S4s50gWeQohK2iiMznSaaIC30a6tS6ICfGKNIzuF7yef
         RYIyc/upBG4LvImhPOhEQQG8CKv1QudljblwFqQ6kglkzmUkODxmr8cMFHHaV2EaR90Y
         v8Ww==
X-Forwarded-Encrypted: i=1; AJvYcCURFmLu3yfYZVu3lduVSsXF1OXgwSxk7NUvzNefOUWX9eEgK6fw4D7bQYm+AXUUpJXH6k/nf5uxugFZzOnGsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9i23HPd2tk9KtKQ20Umfh0RuAYYk+VkXPbxfJh3AkdhRae7rc
	z3lh7/IoHbiV6PzV49Jjx0xolZSp3vDCxz2QK0INGPIdLq0eVluIv9Rdolh4n+toq8aDB90FaGs
	nPxUpcAbFuoLz2KVc1ovqhT+K/XRhw20=
X-Gm-Gg: ASbGnctAfLRgIXrAfh+f/T+JZX3RxySaoX8zVSj32Vk11uLhQ8yCOS81Wg5W5+Yruz7
	COsJbX8CWISPCFdqWN+al9tiA42ROlqzNYn10ECMhl9czd0HITo4ufezKyVEw34O3aWa0NWIWU/
	+4P8wtGEDHKG3j+X7y577OFJasljNI3zF5PtMEoerqW4XIjXvpVuDGtVHf1ol77hUEvp65otafi
	71PlEd+eMeI5zGRRKP553m+NkoRj4aGWb2H8LXfSEZquYTQTXlVyhx+ge0CYHEn0VINjqTuL3HI
	E/pzQc6qhUpEbuGflwNTvnyhik/qJmtZ224EZQklemwQjbcwRhbj/jFp0DFxOhki832fn6inV02
	YfPI8hv9yCJCTQw==
X-Google-Smtp-Source: AGHT+IGeyoDrjBm9pUlwr3L1lIhuYxiVR/nMKBo3Q8beIteuq1z76e1BQfFIgP3nnV9ieQFXYxZbKA8xY2mkFTTQZGc=
X-Received: by 2002:a05:7022:49a:b0:11b:98e8:624e with SMTP id
 a92af1059eb24-11df25f6eb3mr3361650c88.4.1764849463230; Thu, 04 Dec 2025
 03:57:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com> <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
In-Reply-To: <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Dec 2025 12:57:31 +0100
X-Gm-Features: AWmQ_bndz8ZZuXxUaBe-jxDMfOtEPNEq7y8MIf5_IqbpeKBzcbrA6kGhc4U4gvc
Message-ID: <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Peter Zijlstra <peterz@infradead.org>, Antoni Boucher <bouanto@zoho.com>, 
	=?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>, 
	Arthur Cohen <arthur.cohen@embecosm.com>, Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Josh Triplett <josh@joshtriplett.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Right. Earlier I also proposed using libclang to parse the C header and
> inject that. This might be a little simpler, in that..

Yeah, that would be closer to the `bindgen` route in that `libclang`
gets already involved.

> ... if you build rustc against libclang they are necessarily from the
> same LLVM build.

So currently there are 3 "LLVMs" that get involved:

  - The one Clang uses (in LLVM=3D1 builds).
  - The one `rustc` uses (the LLVM backend).
  - The one `bindgen` uses (via libclang).

If that is all done within `rustc` (so no `bindgen`), then there may
still be `rustc` vs. Clang mismatches, which are harder to resolve in
the Rust side at least (it is easier to pick another Clang version to
match).

For those using builds from distros, that shouldn't be a problem.
Others using external `rustc` builds, e.g. from `rustup` (e.g. for
testing different Rust versions) it would be harder.

But I mean, anything approach that gets us into a better position is
welcome and I think requiring people to match LLVM everywhere should
be easier now that distributions are starting to enable Rust (even
Debian).

We have been talking about this since the very beginning of the
project -- e.g. I remember Wedson and I talking to Josh et al. about
improving the situation here (in particular, talking about integrating
a solution into `rustc` directly) long before Rust was merged into the
kernel. Even on things like a `rustc cc` or `cImport` like Zig (but
Zig moved on the other direction since then), which I recall Gary
having opinions about too.

There is also the question about GCC. A deeper integration into
`rustc` would ideally need to have a way (perhaps depending on the
backend picked?) to support GCC builds properly (to read the header
and flags as expected, as you mention).

And finally there is the question of what GCC Rust would do in such a
case. Things have substantially changed on the GCC Rust in the last
years, and they are now closer to build the kernel, thus I think their
side of things is getting important to consider too.

Cc'ing Emilio (`bindgen`), Antoni (GCC backend) and Arthur (GCC Rust)
so that they are in the loop -- context at:

    https://lore.kernel.org/rust-for-linux/20251204111124.GJ2528459@noisy.p=
rogramming.kicks-ass.net/

Cheers,
Miguel
