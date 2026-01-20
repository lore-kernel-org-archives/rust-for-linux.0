Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FCD34FF63
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 17:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929081; cv=pass; b=Ljtv0IDYXk/O9ezdQJANE1bo0CsWv/dbT7iF/j8uCjMeQFG9pJBv/3Z5WqH+vK6Pc5Yf1Z/Xuuqs4JfFjbJayma/aZXlLpWXWwpDtggDH/PAzl3BDFq9TKdWeBRKGDUICLbZS76JQd+k6IxiJIm2ifcE4ZBAOfz6rkcAoAj4KHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929081; c=relaxed/simple;
	bh=wBc9P3Wa/E5HztaOHrKq0qUCfPSUiP/k0OBPrspdgyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ledbjYU/WbOqd2reEvyxq+obfWHadG9U725uHSiiB1vARBogD6l1RTXx/3gp4cgpJo1S7J48JBE8ByGQZMd9xhHsVOWylZfCTDaCigozG4aV+ul3RiYkvAOtmRoRO+PzUGbeuSEix45Fq+q3Vt7EIsVXwYaeNrG/m0c70dB55tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cAduhc4W; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cAduhc4W"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-121a0bcd364so7123890c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 09:11:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768929078; cv=none;
        d=google.com; s=arc-20240605;
        b=egio3li1kabXexHlleip+euMTHcuklfJv2QsFKVYv+iYRFpekvuU0mYDvy7Yx/Hh+z
         opwyyMlGCNfIz0393PsGh+saY6TxSrHlvDqLkS1nUR8jgMnSQw9MjV5Q1sFXtJ8389H9
         gjeHAiBbVW6PPumalhuu//wYBFa5YOAF5cDyIO9o97CldWriRM3Hfsczr509VNKbM2+q
         6pnqm9DsB1c0qNdZX41/W3hMgStTOXwwz/w1e8eK6/NCT1MPXptJOrX1UJ/b9B/8Ejz6
         auQgwBdVU1J4ZrGIIvaNS0LyCo90NqrAkWYozTLl7TmYC+QAFoKkeJAe0Bz51CYptWM3
         qdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g4kM6F8fKl+Qeywz6sdK1X/LSmekcFRs5fj3WsFdO/s=;
        fh=1Umesn6Hm0JdXrgoEGktquzyAnPJc7WpMER3vX9xa60=;
        b=F3duHRtwgyXyEHWZyzAGtcAm0VKQoX3UC1bHOkXaOaXT1etlefgDkCmL706ID8JL5z
         CBzgjtOJvQaJAiEceS6weP5Liixt74VFhj3SN74znNXK0Dr5yW1gwzbto+AL/R6Cp3/1
         tQW/VJmIhqXSQjFERifQ9vqAjaG4vtse3iBz3N1a2RyX0LOn1WVEDIU6viCcO746VOxZ
         A5Wt/AF/+shhK+wX9Z9ksAU59fuN91A/c9Ff4lb2rXaqr75M1jVk7VPszaGqoFOQ8015
         vDZ5gZKGuJYiYtviDXP3U9QJSkIgRw+5YM64ud2aN+d6gDFSkopGjrA67lU0ODaOkK45
         +ADg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768929078; x=1769533878; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g4kM6F8fKl+Qeywz6sdK1X/LSmekcFRs5fj3WsFdO/s=;
        b=cAduhc4WWHaT3rj3l8WO/Wij2nq43B6VQfDT837HyhucGymmHq86KuiVewbM1qEzDY
         K/+cKikLqQF/69g9eprbakxGzlhejFZvNIUHgfpJc5qqptFZOZh1JVKAt2diIqXcdaWK
         /SH0KjZKg+TazDuHLWBjRVSqgTD9T/YVJN3McUpo6dnHcbLxBtWFWaC4J4fex7Swf7QK
         Moq2mRMkN/2O8lhPmrJkJH7QwTMpH/yA8H27b5k03kVlahtmO9+7+Bbmb1Nt3I50lNPg
         gzGz+JW1ysvHHCviJSMU5pzd2hL1Ej6t8ZHbaRtn0gmlQBa4pEw8K3QPd8O8nBoMUDAy
         grww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768929078; x=1769533878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4kM6F8fKl+Qeywz6sdK1X/LSmekcFRs5fj3WsFdO/s=;
        b=kYdxjkLwuM+KeQM+qomhLWM9k+3woL3htBR0HAlxN4KtQ+lILO5W8uI+Js5WhOZ1OY
         D4tzh+ek0SjmVlDco1cR42CKropJx2R4BAtFJMQSdpGGmR0Hkwz5VZuvMuQjaaLPf2ko
         rmpWFdPxDq7b6PwgdXPau7Vk44VyV6fLyoO7onN2qGuMgjW3FRX6HAbfp8DUcGRwODiU
         fUuVBjC1M+T65dpHPF5/SMClMYuu0RGhcJbnxVS2sRTrhFrXTuJTeGE9ZyuRTkAcg6my
         n/iir4zsSxrOjwxHqk5yD4oQtfgHsmjXHWqfQjWXOAmApliEo8KWrZtAbZMQGYXd7yds
         CX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeelhyfecaKZDtesYOc7Lw+DukUmvFV20jYFsYBgy//1s5mHc/imigxgjm0siKvFl4Ch8dVeGv2XbKXJ4ZYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOEDejbRVtYNXfPShPj8MmfcJLB+ZX5kiFQ6qDzaHCKyR8emBu
	Hrc+O6i4NBJJYZhnO/meG+cnzFKPSz35DsESkp3hxpXgjCVlbZD1pLp9+iX/tVa4QZcDQH574UN
	Z0Oj0lbPQ2lPPslroAnc/rsXdW/M3caRhbKuICXJK
X-Gm-Gg: AY/fxX7Ru3ErzQWwInRYs6QwIgHbB9iaSC8+qt7D7I7dv0JnTV3v8dphZ7l52Za2hbs
	/haJnnK92kRXFHgvM1duasx9uGeL/qE2t5+DAfuzILwde3a0bWfIVM0QYbJvutDwW8pqv5H83zY
	7Dm9PRZ2YVsWr/+fG2bVRSbsXXGl2AyRQ7WuG3xJ6jLxF8rHQ0Eypx9ZSJrRgpQ6dt9w2vXs5c9
	V3s+lA8MK3RhYef8aHO75BUr1qM0W2+x6Q3A79zp0MhlBkLVu8ExRffw1MaX/4+9d8n1KE//1yr
	A9Z66WJeoBLcrjLuDZoICCp99P0=
X-Received: by 2002:a05:7022:628d:b0:11b:a8e3:8468 with SMTP id
 a92af1059eb24-1244a779a72mr13184278c88.33.1768929077367; Tue, 20 Jan 2026
 09:11:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115207.55318-1-boqun.feng@gmail.com> <20260120115207.55318-3-boqun.feng@gmail.com>
 <aW-sGiEQg1mP6hHF@elver.google.com> <DFTKIA3DYRAV.18HDP8UCNC8NM@garyguo.net>
In-Reply-To: <DFTKIA3DYRAV.18HDP8UCNC8NM@garyguo.net>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Jan 2026 18:10:40 +0100
X-Gm-Features: AZwV_Qj8_3cuVM1FyOzfrOkRiYXrFtw2NSR95u4VFEpxArqad_WPWywp-t-FlH0
Message-ID: <CANpmjNN=ug+TqKdeJu1qY-_-PUEeEGKW28VEMNSpChVLi8o--A@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: atomic: Add atomic operation helpers over
 raw pointers
To: Gary Guo <gary@garyguo.net>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	"Paul E. McKenney" <paulmck@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Jan 2026 at 17:47, Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Jan 20, 2026 at 4:23 PM GMT, Marco Elver wrote:
> > On Tue, Jan 20, 2026 at 07:52PM +0800, Boqun Feng wrote:
> >> In order to synchronize with C or external, atomic operations over raw
> >> pointers, althought previously there is always an `Atomic::from_ptr()`
> >> to provide a `&Atomic<T>`. However it's more convenient to have helpers
> >> that directly perform atomic operations on raw pointers. Hence a few are
> >> added, which are basically a `Atomic::from_ptr().op()` wrapper.
> >>
> >> Note: for naming, since `atomic_xchg()` and `atomic_cmpxchg()` has a
> >> conflict naming to 32bit C atomic xchg/cmpxchg, hence they are just
> >> named as `xchg()` and `cmpxchg()`. For `atomic_load()` and
> >> `atomic_store()`, their 32bit C counterparts are `atomic_read()` and
> >> `atomic_set()`, so keep the `atomic_` prefix.
> >>
> >> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> >> ---
> >>  rust/kernel/sync/atomic.rs           | 104 +++++++++++++++++++++++++++
> >>  rust/kernel/sync/atomic/predefine.rs |  46 ++++++++++++
> >>  2 files changed, 150 insertions(+)
> >>
> >> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> >> index d49ee45c6eb7..6c46335bdb8c 100644
> >> --- a/rust/kernel/sync/atomic.rs
> >> +++ b/rust/kernel/sync/atomic.rs
> >> @@ -611,3 +611,107 @@ pub fn cmpxchg<Ordering: ordering::Ordering>(
> >>          }
> >>      }
> >>  }
> >> +
> >> +/// Atomic load over raw pointers.
> >> +///
> >> +/// This function provides a short-cut of `Atomic::from_ptr().load(..)`, and can be used to work
> >> +/// with C side on synchronizations:
> >> +///
> >> +/// - `atomic_load(.., Relaxed)` maps to `READ_ONCE()` when using for inter-thread communication.
> >> +/// - `atomic_load(.., Acquire)` maps to `smp_load_acquire()`.
> >
> > I'm late to the party and may have missed some discussion, but it might
> > want restating in the documentation and/or commit log:
> >
> > READ_ONCE is meant to be a dependency-ordering primitive, i.e. be more
> > like memory_order_consume than it is memory_order_relaxed. This has, to
> > the best of my knowledge, not changed; otherwise lots of kernel code
> > would be broken.
>
> On the Rust-side documentation we mentioned that `Relaxed` always preserve
> dependency ordering, so yes, it is closer to `consume` in the C11 model.

Alright, I missed this.
Is this actually enforced, or like the C side's use of "volatile",
relies on luck?

> > It is known to be brittle [1]. So the recommendation
> > above is unsound; well, it's as unsound as implementing READ_ONCE with a
> > volatile load.
>
> Sorry, which part of this is unsound? You mean that the dependency ordering is
> actually lost when it's not supposed to be? Even so, it'll be only a problem on
> specific users that uses `Relaxed` to carry ordering?

Correct.

> Users that use `Relaxed` for things that don't require any ordering would still
> be fine?

Yes.

> > While Alice's series tried to expose READ_ONCE as-is to the Rust side
> > (via volatile), so that Rust inherits the exact same semantics (including
> > its implementation flaw), the recommendation above is doubling down on
> > the unsoundness by proposing Relaxed to map to READ_ONCE.
> >
> > [1] https://lpc.events/event/16/contributions/1174/attachments/1108/2121/Status%20Report%20-%20Broken%20Dependency%20Orderings%20in%20the%20Linux%20Kernel.pdf
> >
>
> I think this is a longstanding debate on whether we should actually depend on
> dependency ordering or just upgrade everything needs it to acquire. But this
> isn't really specific to Rust, and whatever is decided is global to the full
> LKMM.

Indeed, but the implementation on the C vs. Rust side differ
substantially, so assuming it'll work on the Rust side just because
"volatile" works more or less on the C side is a leap I wouldn't want
to take in my codebase.

> > Furthermore, LTO arm64 promotes READ_ONCE to an acquire (see
> > arch/arm64/include/asm/rwonce.h):
> >
> >         /*
> >          * When building with LTO, there is an increased risk of the compiler
> >          * converting an address dependency headed by a READ_ONCE() invocation
> >          * into a control dependency and consequently allowing for harmful
> >          * reordering by the CPU.
> >          *
> >          * Ensure that such transformations are harmless by overriding the generic
> >          * READ_ONCE() definition with one that provides RCpc acquire semantics
> >          * when building with LTO.
> >          */
> >
> > So for all intents and purposes, the only sound mapping when pairing
> > READ_ONCE() with an atomic load on the Rust side is to use Acquire
> > ordering.
>
> LLVM handles address dependency much saner than GCC does. It for example won't
> turn address comparing equal into meaning that the pointer can be interchanged
> (as provenance won't match). Currently only address comparision to NULL or
> static can have effect on pointer provenance.
>
> Although, last time I asked if we can rely on this for address dependency, I
> didn't get an affirmitive answer -- but I think in practice it won't be lost (as
> currently implemented).

There is no guarantee here, and this can change with every new
release. In most cases where it matters it works today, but the
compiler (specifically LLVM) does break dependencies even if rarely
[1].

> Furthermore, Rust code currently does not participate in LTO.

LTO is not the problem, aggressive compiler optimizations (as
discussed in [1]) are. And Rust, by virtue of its strong type system,
appears to give the compiler a lot more leeway how it optimizes code.
So I think the Rust side is in greater danger here than the C with LTO
side. But I'm speculating (pun intended) ...

However, given "Relaxed" for the Rust side is already defined to
"carry dependencies" then in isolation my original comment is moot and
does not apply to this particular patch. At face value the promised
semantics are ok, but the implementation (just like "volatile" for C)
probably are not. But that appears to be beyond this patch, so feel
free to ignore.
