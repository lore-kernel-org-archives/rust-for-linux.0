Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62DB420E79
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 13:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432328; cv=none; b=Lc3IUEoby08HuWUgZX2R+TApQbS9184Rn2Q2vBMYHj1shWj5CdqHpzGJXfYtvWCxjEOXngEiGsO65bT1Co+ruc/4LlWENMTeMlQEeusIYM/u+SIymLuYyLq3vaJ+tBovSzQ/EjijDyYKwcZZQLNb9FbLiHWOva4xi2J7cq0hmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432328; c=relaxed/simple;
	bh=rMQ98mRE2XrEvznbyOklGb3MGHkp5+Poyzt0IT+v3wA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zm/ffTAol2+DrJCipwig5rqAa25f8+JyqvxR0lJH4yRPrQYqKvcWRIp2QIdohSS6uRA3DPIeKmdr7Tk+c+qfBWrNjtz7HXgxGhvRB7Ta5pmIXp/CSqgge+QmYJKbVy7uWYovBuErENNVjXCSbSiJHI2KiCPHgIIHy5to+Tyf+DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TSvJAG/3; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TSvJAG/3"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493d742c668so20404095e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 06:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783432325; x=1784037125; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UFLcAizdI5u9a5xpu8qFGVUAGWCdpGmgnq4xS9dUPUI=;
        b=TSvJAG/3HO3wmnH6VVtr6TV7NRPaDCapnTChdV1sfoXuwbqflrYyHYjHgjoD6807uQ
         LmETNGZsru209cEjpTL8H53P2C1LYNr7XKBJWejwFp6aCY/AmYi5UxGIuT6t60GzOTun
         lRUs2MoHukbNxRPXsCbXOiLaqJr9mDBNQH7nQWcCNyGnV0lj3fnF/VcdkRydqHvsDZZQ
         gCHs2cdsy4i40dl89KsNgT+8jyXJ2YA6guXpP9GuJrJMbBkgrxhLjeo8YHmIRWCRkhFW
         d1W+SMKbqqZVSTLzDmWsr65jN8Et4Y6kfBandIq/yo6auIctihrjmKyxAWU9MSh9oPVa
         hTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432325; x=1784037125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFLcAizdI5u9a5xpu8qFGVUAGWCdpGmgnq4xS9dUPUI=;
        b=CCRneaZ3FaTYkR1ymKaPBvOkhkQfMbA1utGKgq2QMWxaVfRP6BPwRnQwsm4erUFwCc
         qRIqorim+/xbRgQTQqmX6leVdYp4yyy/OZcqDhn4/+e1jYRAblmpZpguS+TewTyEawe+
         bdvr1yHVd0gckALHrmZ4ol7fTcHA/vJNsOYfF3cMI+6ocxB8BYyiOkryN12N3UCUMWjd
         w/J9T66KQQqBQ4D4oopC3cm0o+ei4neD9JzwiQpCSAvjCKncyUlq+Wi2BGXfQuGMoaU4
         1mLWOMji0oHpdTfusnAEdzcdBAe6VxOaNr+ecYU3OrzCGQUvjkzFqbZJOCERUaAcOqLr
         wj4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqR9zAmpSSjH8Yeh0W6ncbwqNVDkW7MRdU5yAd1L3Q6w9p5rUAeWKX7cKVDjnBiZdGru1Vhp3BsoGdzK3yrvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBzqVWLNmbX5+8BfkD2bURrs9Lf79Mti0FoqLQEnP8NaLd8FnV
	O5qIcMs3vS0NJPtp8NjQJMVVn/7tgBdA/6XNgAFHJuEOCnabIF70jVPRrPNeMCmxBktWx/XTpUX
	xr6KQq8L4ot0y749Swg==
X-Received: from wmbej14.prod.google.com ([2002:a05:600c:3e8e:b0:492:6f9d:ffa4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:198b:b0:493:b61c:72c3 with SMTP id 5b1f17b1804b1-493df099ef7mr59399775e9.32.1783432324828;
 Tue, 07 Jul 2026 06:52:04 -0700 (PDT)
Date: Tue, 7 Jul 2026 13:52:04 +0000
In-Reply-To: <DJSDLLJAHFQC.3S56X1Q9MU2T2@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-2-cc922f544dc0@google.com> <DJNDAQX71WG8.3UILF89WQD532@garyguo.net>
 <akz8g-zAeNuvBiF3@google.com> <DJSDLLJAHFQC.3S56X1Q9MU2T2@garyguo.net>
Message-ID: <ak0EhIBEUx-IjMMH@google.com>
Subject: Re: [PATCH 2/5] rust: sync: add const constructor for raw_spinlock_t
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 07, 2026 at 02:33:26PM +0100, Gary Guo wrote:
> On Tue Jul 7, 2026 at 2:17 PM BST, Alice Ryhl wrote:
> > On Wed, Jul 01, 2026 at 05:15:55PM +0100, Gary Guo wrote:
> >> On Tue Jun 23, 2026 at 4:38 PM BST, Alice Ryhl wrote:
> >> > The abstractions for pr_*_ratelimited! need to construct a global
> >> > `struct ratelimit_state`, which contains a `raw_spinlock_t` field. Thus,
> >> > add a const constructor for the `raw_spinlock_t` type.
> >> >
> >> > The SPINLOCK_OWNER_INIT constant isn't mirrored via a const helper
> >> > because bindgen generates a 'static mut' instead of a constant from the
> >> > pointer constant.,
> >> >
> >> > The __ARCH_SPIN_LOCK_UNLOCKED constant cannot be translated by bindgen
> >> > because it's a define for a struct without type annotations, so it's
> >> > explicitly declared in Rust.
> >> >
> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >
> >> > +/// Helper for creating a raw unlocked `bindings::raw_spinlock_t`.
> >> > +///
> >> > +/// For use in statics containing raw spinlocks.
> >> > +pub const fn raw_spin_lock_unlocked(name: &'static CStr) -> bindings::raw_spinlock_t {
> >> 
> >> These functions (incl. raw_lockdep_map) should really be private functions.
> >
> > Hmm, I think there could be cases where a driver needs to interact with
> > C code directly where this is useful. Even if use from drivers is
> > discouraged, I don't think we need to go out of our way to prevent it.
> > It's like the bindings crate.
> 
> I think a theoretical use case is not a justification for exporting such
> low-level functions. If such need arises, we can export them by then.

You're the one who wants extra characters ;)

I can make them private, but I say stuff like this because I've had to
change methods such as into_raw() or as_ptr() from private to public a
few times and I think it's annoying when I have to do that because it
brings changes that are otherwise driver-only to touch other random
files.

Alice
