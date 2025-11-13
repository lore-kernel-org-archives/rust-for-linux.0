Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113D12EDD64
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763047237; cv=none; b=ONNIoYqSZsDMX6ACU7V7MdgJceoMvEjC5pUOdx8H0EYG0zzkjwecET69aeDccHXfLXFKbnj8rxLLVzx1+dKkkc+0KTA0jXfZq4vm6gmMN13BQJf9cY1x7TxMOT8cSdOwJO0O+3cAJGSquSBz1GUeKkenTbdpcQ8kMTFHWSJTna8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763047237; c=relaxed/simple;
	bh=b356X5D3isz2xSnteCMXvxDYhGYh9dwGz1h1SAtyHsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akmTV2sQshWzcFJWPOZXOeAkQ5EqTV7f/jUfTFGVcIH+LBMxgpqlnN4pnyw0QcXg2eU0tecXDCHPslLfcKiCMiKf+kTVfSUq4QXdfFm8S5Zt1vkZNL9VRzPDl7Qcq+15MHFDU6MvOJiRU2hpJsKoHUwGWiARDdovkWkdW/oz6mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jospAGlx; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jospAGlx"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b26b12be9eso103054185a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 07:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763047235; x=1763652035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRyUjXAvhpSG29vYEZBVd+u1XwtDE8uLu09z3tfvcHE=;
        b=jospAGlxD622c/eMNpIQo+xHKyoLAT2iHssQ/ULhk3y4K9AtuDwaKP/kx8C75Tjo1O
         tKERN6FIXHLSEbG7QRD3j7boKOLoRz5nPBFUE7KAEC0CZX4Id23+v/Ml40P2hT6y05z8
         LExvHn/ihdM/zs9pgeCcLlNBdWVtSOnEhVOT/N2gUcDegvYbMFmTr4uAg+FGXOvCVz5+
         AUAiNNTAaGAb0jJ8aP+Y7u3webZ2uqj4lzaYC+D/r/mZ15cqjPXQ9aAfOaOdL+5pZDi1
         f9Tuqte54TnA6k/jYpdjUZcZAq1kJLS/YL2ouWdXA9pOiN3KnsDuQm8NipFxtYUI17cV
         JEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763047235; x=1763652035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rRyUjXAvhpSG29vYEZBVd+u1XwtDE8uLu09z3tfvcHE=;
        b=FwOgXLmetyxju8nJHEEQAyUlO5A9K9iuht1W3KMw0GQefPO8xuIgsSkTX7ggv/MCRk
         HajH3CGv6w/6+JCFAEc09RiXYyzFslGp0zklbOgMdl+7tcUrrKwPlh8LNrMU2JkXAUFE
         gey/xQ+bu1TRBV+Ww6B5Vvuz7ea7BqkmfpF/lBQy4VDZ8GecvlllCFwimYL+lzIALWzQ
         y2J3SMcmWY39w5F6pFR/8x8+Wa3wXKVKYUFzDMTUdXmNkbzc98wnJhiRRYeq2wfBmBLP
         RP88juMGcbteesC9fJuzKbkzglgMgEDUQOszpQpQ/RAtH/MJteiMdcmxyRgGKTyXofB5
         IX2g==
X-Forwarded-Encrypted: i=1; AJvYcCV8UqmDJqfaKNu7ItmPhGYRtYGMnJdx2NWsMYBE8Bl9WlVIaXsJSHouMhV2bruN+ANzqYtpMe2kiWru2jA7qA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzp65ZTMZwtKQvA2ojnWUrmTcPhDkB5dnsk1FqdQTmyMsqRunC
	L5pOmIRq/fxbZIjLApKAhh9pdwJIXkdoA9LBhZXp5dga3gxp+duOdt0e
X-Gm-Gg: ASbGncvUWsO7ajSEKl2JFvm9AMMoUBjzFvXrDVwimkNoq0Th1IL2Siihva5/yx299MB
	bZtU44sOGZXs5mlzqpGOqpqaVvJx/o6sU36amBy99+3PUZzq1uAbVX1Oo1N6dtS0o1K9Z/TMOvx
	msCWR9qGOKmxifCuUFFZfdIqhhoO/X4qtC9s+GyUktO91fhfORgLvVaItWkxqUH5k5lUjBGQ0B2
	SEGre63lFj5Rqiwi7chknYaOWY49Dlz3j45dm2Pp5obstDA7CDieMCsZegnm2pMm953y4GbFGGT
	HRFiWPdpMeAsin6Rh2Fya/bXpOQvvMhLGhp20HqedITO+T5DVp2Ur9fHpSZEQnZcoHU14enATbk
	5m/Q9q3TvafW/ads3osz3bMw6WSFjTm/sZCgBDpmt0VpL2n0XFUcmqLMImJfU9iRPnJVPvwWmaf
	cttbqjrGG4xwT9RV+oYTC6Y7Ywo1RUXlITbHKCWGrjZ0gFnkxYVflE5HNIN+eEq3a2S5MxcgI1C
	q6A
X-Google-Smtp-Source: AGHT+IHNDCJiPAwWRoIl0OS7yviB6riZ0xuoowYRA9vW6tyrGXLjV8YfJBUuxjs1LBLbOqxxiF/47A==
X-Received: by 2002:a05:622a:547:b0:4ed:bb39:9a67 with SMTP id d75a77b69052e-4eddbd9e878mr100333081cf.60.1763047230914;
        Thu, 13 Nov 2025 07:20:30 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ede86d46e2sm13623091cf.9.2025.11.13.07.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 07:20:30 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id D4856F40068;
	Thu, 13 Nov 2025 10:20:29 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 13 Nov 2025 10:20:29 -0500
X-ME-Sender: <xms:PfcVafa7b8fiYIjuuwhDhYEHCwSBlxWLQTJ5iR_dFHOdHtMaNUdxsg>
    <xme:PfcVaUyKpDoNYZWyk1__JPX4SxQrGSYjSs9G2Ox9TvHGrpka17P5DvBQnNPVU7dvP
    URLWOGednHhkyC_csh4iojBTMXCpbZC4bDKW6Y28_oW5UlTGkHOpbo>
X-ME-Received: <xmr:PfcVaeNLT68ZSuW0Gy6rRXt1fWEmGCezy3xbAAAcIZ83rk1vf4zt8Q0J7_sMCyU7NwCW_MGbfV2HvAFU7KxEY-9gE9UiY0pE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdejvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhujhhithgrrdhtohhmoh
    hnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohho
    ghhlvgdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghj
    ohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepuggrkhhrse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdp
    rhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhush
    htqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:PfcVaTfhoheqOoCzoB5zPrSMX0XKsmk5kAhAvmnkGKp3L6dqa4Rdbw>
    <xmx:PfcVaTRZT1D8jKWWSY38JbNrJII6k3AEIvsA7R2367D_s5_LU1iEVg>
    <xmx:PfcVaRf_h91F58cKnrxz7w3Ew0a96ylLkL7xbVRs0SMrf6Tqr8UqMg>
    <xmx:PfcVacspOBcHGFR0oM0Eq9yqBzUW_xNWM7pXI975TcbM0-gqQ0RybA>
    <xmx:PfcVadIgYIe4okw8wTZVPpSRx3FCGGwiVPmqIHPBZgepCz8bTg7xWVJE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 10:20:29 -0500 (EST)
Date: Thu, 13 Nov 2025 07:20:27 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu, jens.korinth.tuta.io@kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
Message-ID: <aRX3OzssgW4TN_ux@tardis.local>
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
 <aRWt6Ah8KuBXff8V@google.com>
 <20251113.201844.1009485179863259148.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113.201844.1009485179863259148.fujita.tomonori@gmail.com>

On Thu, Nov 13, 2025 at 08:18:44PM +0900, FUJITA Tomonori wrote:
> On Thu, 13 Nov 2025 10:07:36 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Wed, Nov 05, 2025 at 02:47:29PM +0900, FUJITA Tomonori wrote:
> >> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
> >> pr_*_once macros.
> >> 
> >> A proposal for this feature was made in the past [1], but it didn't
> >> reach consensus on the implementation and wasn't merged. After reading
> >> the previous discussions, I implemented it using a different approach.
> >> 
> >> In the previous proposal, a structure equivalent to std::sync::Once
> >> was implemented to realize the DO_ONCE_LITE macro. The approach tried
> >> to provide Once-like semantics by using two atomic values. As pointed
> >> out in the previous review comments, I think this approach tries to
> >> provide more functionality than needed, making it unnecessarily
> >> complex. Also, because data structures in the .data..once section can
> >> be cleared at any time (via debugfs clear_warn_once), an
> >> implementation using two atomics wouldn't work correctly.
> >> 
> >> Therefore, I decided to drop the idea of emulating Once and took a
> >> minimal approach to implement DO_ONCE_LITE with only one atomic
> >> variable. While it would be possible to implement the feature entirely
> >> as a Rust macro, the functionality that can be implemented as regular
> >> functions has been extracted and implemented as the OnceLite struct
> >> for better code readability.
> >> 
> >> Of course, unlike the previous proposal, this uses LKMM atomics.
> >> 
> >> [1] https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io/
> > 
> > There has been a fair bit of discussion below. Here is my take on the
> > way forward:
> > 

Thank Alice for putting together the summary of the discussion, add
Peter Cced as well. For context, Peter, this is about having the
pr_*_once() on Rust side. Also Alice has a reply to Tomo, but I'm
copying this to you because it contains more context.

> > 1. OnceLite should be it's own special type, and it should be in a
> >    printing-related module, not kernel::sync. The reason for this is
> >    that do_once_lite! is hooked up to a special section that allows you
> >    to reset the once status, and if someone used it for anything not
> >    related to printing, they would end up with being incorrectly reset
> >    when someone resets pr_warn_once calls.
> 
> Do you mean that only the do_once_lite! macro, which places the data
> in .data..once section, should live in a printing-related module? Or
> should everything including OnceLite struct itself, also be moved
> there?
> 

I know Alice mentioned in a reply that she prefers to moving both, but I
think with a reset() function [1] added, it's totally fine to keep
OnceLite in kernel::sync and make do_once_lite!() an internal macro
(i.e. not exposed) for pr_*_once!() only. But let's first focus on more
important differences below.

> > 2. I would suggest just using a relaxed load followed by store instead
> >    of xchg. This is what the C-side does, and I think there is no strong
> >    reason to deviate. It allows for a single byte of data instead of i32.
> 
> You meant best-effort try-once logic like C?
> 
> pub fn call_once<F>(&self, f: F) -> bool
> where
>     F: FnOnce(),
> {
>     if self.0.load(Relaxed) == State::Incomplete {
>         self.0.store(State::Complete, Relaxed);
>         f();
>         return true;
>     }
>     false
> }
> 

I understand Alice's point, but personally, I think the C's
DO_ONCE_LITE() was implemented wrongly, because it DOES NOT guarantee
"do something once", hence I suggested we don't repeat that logic in the
Rust version.

Speak of personal experience, sometimes I do need to provide an
educational guess of "what's going on" with only one copy of a kernel
log, and I think I'm not alone. For that purpose, the uncertainty of "it
may print more than once" does matter. My point is more about since it's
a logging mechanism, it better be accurate than efficient because the
logging itself would take more time and space.

> Using u8 as atomic type instead of i32 would require a fair amount of
> work, since at the moment only i32 and i64 are supported as atomic
> types, right?
> 

I agree with Alice in the other reply that u8 store and load (even
xchg() and cmpxchg()) are not hard to add. However, depending on which
logic we decide to use:

1. If we use the current C logic (i.e. no xchg() and it might do things
   more than once), then using u8 is fine and saves spaces.

2. If we use the correct "doing once" logic, that means we have to use
   xchg() and we need to notice that xchg() on certain architectures
   (RISC for example), will take more than 1 instruction on u8.
   Therefore although we save the 3 bytes by using u8 instead of u32, we
   will spend 4 more instructions. That's something to take into
   consideration. Maybe u8/u32 can be an architecture-specific thing.
   But we can push it as a future patch.

> 
> > 3. If we *do* decide to use xchg, then the xchg needs to be guarded by a
> >    load so that we avoid a write operation when it's already cleared.
> >    Many read ops are much cheaper than many read/write ops.
> 
> Make sense.

Agreed.

Regards,
Boqun

> 

[1]: https://lore.kernel.org/rust-for-linux/aRPvjQJLdzvxLUpr@tardis.local/
