Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22955253340
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508389; cv=pass; b=jkTx8X4CHZj+XNQ1vyfKuSxNbyGv8iJ6POHUTVjTs0JhJsjA1KZwEfa3vJHCnT96qGlkslzAoTsBT+tPUrfjlE3rfvZAmRTsF1k6SzwmHPslj4qntxxx9Xiy3VvfOi7hOZfjBqaa3yubPLHctOgV3Cwf8VNSiAI0ckgCXlpYj0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508389; c=relaxed/simple;
	bh=gpEhtYuWUt5BY+7UPS3BH79I/leAvG6DqKM16FTji1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjEl6PGK68zVeB+stlIbIT/xS2jXj7udD3GdaMnZT2QXHzsj84RsJz5n7hewQt63TNtIVj2jZNEhEzeg6tJc3S6cKU51K0XMbSNeQ5QhrIlNI8BnSuoPGe8+l8xMAs5PJvO+r6UNT7M9Ch9ZHclp556X37GZQPbYK7E0sbNALvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JsVeqsYd; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JsVeqsYd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4837907f535so8806895e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 05:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771508386; cv=none;
        d=google.com; s=arc-20240605;
        b=SLHjceftSzailpjLyCDiP+1kSlPNU6x9Euf0jPPxk8HUKd4IzcXnwJhrMk2f4A0TIF
         LDgvAbOljb+ijIu/pIQAJgoa9XlRbXsjnT0O3xRrQc1ux5Q77R+AjZEdgkRKNEfbMH2b
         XOV+QUsLWRpgVS6CVdI+T46y9LkCjTb4Pcke2lwLLqHWXT/dD2X+zBcMIRtrNTDG+3Lb
         ZcqWYOg0iWrB+i26IPWK8ScgcdhWpUx8yS359KOLJhMJs5pOqDc+pHeccgC8/N+mZZMp
         Vgj0F1faXp7zRt0UypGVn3TrczkeeUYLG6+vkRNL5jtlkrTwukt27g837U6bVEPIf+z5
         U6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GoFJ2Zlxc2cN1sz7T43rieh905vxPHApihyMax+5x6s=;
        fh=AyO1H5ui53sGy6C63uB8RLA/SZ8pwEvyL6LyoaI9Ctk=;
        b=lgeamlHMJaEkXPKWjl3rCh7iNS78EXufb63C+rj1mrnAGdQ4apwD/6+taXyixd8KmF
         Qf8cz21VKTntsS56i7NzDTX+CPiBtxGFumYI2424hs5+gdHzAEdpjWkl1H8nZtoeGo3B
         9ui9eS1rXAtlEn++1x5rxUFmGVk1QHedI2G6Kng6q9UubWBT8KggBoxDwShLfybEsPZq
         EaXTEEZxs9XQ5tVM1+yv3lQjMAqpytE38gvofMeILn1rgeSkbS1Z9p8CB2UkJ88jsPfh
         DQi6YRACHLbodxC5bvrSFFJMEXF0sVmo8KnuQmEc23tzhvImUs3G8f/Cmkvl4pPC7ZLT
         uNCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771508386; x=1772113186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoFJ2Zlxc2cN1sz7T43rieh905vxPHApihyMax+5x6s=;
        b=JsVeqsYdaVM8Wna33DATPPmppUIIBVnuGOyF5LB7VdzoBAX3hy2x5kC2+jjW+Y6xBX
         wRWhyoFxk4umgWvOiPXXXMUZ/hJ88O7amYruzlB3wEjt00gcuEL9H06IHs/WCq/7v8LG
         3m3NgWqh1UHkUKJQSeWFm7QPzisfKydOctzCoGYoRW17m8KQxEkhDC27Dpi/0tVGgymu
         7qzz2NsmPnPnMhFM8syRJXD4Qm2WVg0QzV2yQ/dTG7ER77q4i0ai/bT8jXbcAb05ItFM
         bySIbQ4WA/9sPIUs/j+w7VdOlbQRmFAmmKnCUV8eFHtpfEMSlLwMWwTD90KigeCduV9h
         Kxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771508386; x=1772113186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GoFJ2Zlxc2cN1sz7T43rieh905vxPHApihyMax+5x6s=;
        b=XJ7Wk06h6fW5c+goYIacNz+n7+H+6BeNYdSpEc2Bnh4M48/Zr0jTxKNa4ma00UUF9e
         7OHKaHC1TJMexMtzeFIWqWIEab8nF8EC9MGT7MFjuI7vcSrE+fn9Bx43EUJiYK26fw2J
         L3/xj10NY7AZoEtEvcSz2He56KDIxCiwUo552k6wjTG3q86hXcrBduZ1pXo+UAOgpNdB
         DZ9UPA029zT8segiDANEoz+rrl7JFCosE9QaICF1kUS1FveM2lmRSmq06T2x8/KafR+7
         yzC1sJOljlLWUI3crcJMQWLBme+vmI5a8WREDsN1azEj1cFg0SY9kVcvd2ypp8Ot99HH
         8R2w==
X-Forwarded-Encrypted: i=1; AJvYcCWPQVMtHZ45QWnvgMnMralSkb7U86EJ+qIYpWKWs1zL/l0DuroVG5BGB3U7n4ZYX4nwY4jIt+WBlJamMuQVTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ18V/EAo5/HgslqrlgHtHTy5D6VP+qPKVcFeELWxUEZifqotC
	PruPnCTeXoPWLYmgfkWCtwu6gTpyZlQ4tXxdwXbNKY3/Jx6YcAuOJSHEb8AXxkE2yUa/A80Iu2K
	UCyYsMh1m+qRseNdJoLA+X+5QaKmdm46grts7ARBT
X-Gm-Gg: AZuq6aJJuUk5Hs/xhYZtnxD61hTZwKl2aw3JADO1knqRzfQHUi7NHP7ucEF4YZh7PF5
	4DJniu++y4+NnAEYB13osbTXsLQZyZ/tYIYj8uv0KXjT3ZgRNjENvCfXGq9Vsq/7mgF9YhtyxTt
	I9JUGl4kZB7Q1mlWrwJ1N7HbzH4cjs+qoZBjf77mIX+wI1wd6oYzl87AexSfi9dzIwCKF1e//fA
	qZPt0bLhuhKTbm1An7F0FaqEWMr8wu2Ulq0ZFRX4+4/gbnsUUaJKkAYjr3t2pJGU9QHScI+pj0t
	NR2nMfSm9A1q3brK5LyMe0vhzP175nQEOcsJM37ER5Wqku+K8pdADTPjtCQ9T7coeuft/g==
X-Received: by 2002:a05:600c:1c08:b0:47a:8cce:2940 with SMTP id
 5b1f17b1804b1-48379b991c6mr307616995e9.14.1771508385768; Thu, 19 Feb 2026
 05:39:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-hrtimer-examples-v6-19-rc1-v2-1-810cc06ca9f6@kernel.org>
 <FjU46Lj_VkBzcrM_lgxJ5yKxckcS_Mn_BmlpYOBGilyRIAmNQgbu5Sh0hxLkTzcazazZr9j6ZhD0dg9Djz3Iuw==@protonmail.internalid>
 <aZcChDe_Y3eyLuYS@google.com> <87o6lkamac.fsf@kernel.org>
In-Reply-To: <87o6lkamac.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Feb 2026 14:39:34 +0100
X-Gm-Features: AaiRm50sSwE8eGXsFQOsSdOdw-gGXss2mlUsCoq1-33q19WdI8QJ_nf4fd29c3o
Message-ID: <CAH5fLgg2b+ohQmRNhFfFXs6DWrbLfOQLuUo3L=set-5=in+d1w@mail.gmail.com>
Subject: Re: [PATCH v2] hrtimer: add usage examples to documentation
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 2:35=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Thu, Feb 19, 2026 at 12:57:45PM +0100, Andreas Hindborg wrote:
> >> Add documentation examples showing various ways to use hrtimers:
> >>
> >> - Box-allocated timers with shared state in Arc.
> >> - Arc-allocated timers.
> >> - Stack-based timers for scoped usage.
> >> - Mutable stack-based timers with shared state.
> >>
> >> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> >> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> >> ---
> >> Changes in v2:
> >> - Sprinkle blank lines for readability
> >> - Change heading for Arc example
> >> - Fix error handling.
> >> - Link to v1: https://lore.kernel.org/r/20251217-hrtimer-examples-v6-1=
9-rc1-v1-1-4ad0e7e4c4e0@kernel.org
> >> ---
> >>  rust/kernel/time/hrtimer.rs | 336 +++++++++++++++++++++++++++++++++++=
+++++++++
> >>  1 file changed, 336 insertions(+)
> >>
> >> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> >> index 856d2d929a008..2d7f1131a8131 100644
> >> --- a/rust/kernel/time/hrtimer.rs
> >> +++ b/rust/kernel/time/hrtimer.rs
> >> @@ -66,6 +66,342 @@
> >>  //!
> >>  //! A `restart` operation on a timer in the **stopped** state is equi=
valent to a
> >>  //! `start` operation.
> >> +//!
> >> +//! When a type implements both `HrTimerPointer` and `Clone`, it is p=
ossible to
> >> +//! issue the `start` operation while the timer is in the **started**=
 state. In
> >> +//! this case the `start` operation is equivalent to the `restart` op=
eration.
> >> +//!
> >> +//! # Examples
> >> +//!
> >> +//! ## Using an intrusive timer living in a [`Box`]
> >> +//!
> >> +//! ```
> >> +//! # use kernel::{
> >> +//! #     alloc::flags,
> >> +//! #     impl_has_hr_timer,
> >> +//! #     prelude::*,
> >> +//! #     sync::{
> >> +//! #         atomic::{ordering, Atomic},
> >> +//! #         completion::Completion,
> >> +//! #         Arc,
> >> +//! #     },
> >> +//! #     time::{
> >> +//! #         hrtimer::{
> >> +//! #             RelativeMode, HrTimer, HrTimerCallback, HrTimerPoin=
ter,
> >> +//! #             HrTimerRestart, HrTimerCallbackContext
> >> +//! #         },
> >> +//! #         Delta, Monotonic,
> >> +//! #     },
> >> +//! # };
> >> +//!
> >
> > Either do not hide the imports, or remove this empty newline.
>
> This got me a few times already.
>
> I'm undecided if it is better to hide the imports or not. What do people
> think?

I think including the imports is useful to the reader.

Alice
