Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3823539F19E
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 14:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669947; cv=none; b=G3JDdukZNP2izNg5QVPM4YjGTlgh7YZkHN0+en0UgxSzdJFbYZwgE2NY1OapyVnBy3XSFHiOywhhAX9IK7GpIAOzap6d1CW0tH97RRpYwioKS+rd2RjBW40FZbyo80Qh4Dgu9Lc12zqNlHVvF00APenJKbLfKcLvAz7GVJHAnck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669947; c=relaxed/simple;
	bh=S+D8dSLW8oWKsKSTJ1PKigEnOCf3XPfVYvzqfqISQaU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hoCQnHr3KLs8Rro2olvYwL3BJrSVy4DWIrRLn4VhMjDIzwvde9pA/HJCRIUsWL5kABA6Ac6hYWK3mo8No/CNxeCyqqTZeiNJ20FVlZZDKtE2eyYzy9qdUvHO3qb4u4f6fl2PVWgmZgM52fdHTsl+A44RCG12dG1sHC2nWY3ctVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZvqBxHQu; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZvqBxHQu"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4853b00f9f5so49385565e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773669943; x=1774274743; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KPjHmgruixhmkQjw04sh9Mjy1u+NZy/GWXT+thsthOE=;
        b=ZvqBxHQukFU93I/gPsZYLd5MR0bzK6ax2krIrR+3t6HKAfIRmI/LwMbnG/7K8ZuXOD
         ZM86TCM46gxdbhKAvXAZbbjD0ZWHdsYJ1fYUF9dwxDS722GffSZC+ztJz/RY1TnL77b6
         hXAPCTJvl/zInACwYmqiF5+dIf+uyiOEw+ZOFTSZCM8o4JvULCTxb6TpCTgacvF+pNT/
         AnbFdzSNn8QeDSG39YkvGBK5E5bFmSFxvagEEGrkDP3zIzVFjmmQ08fmtBnZPFpx1F2G
         MkUoMbGTNxy3fs5n5I9lD2NtiPfGMhNmFBY6CCQVKXSWuaCb1WClGmxojHeYlEVd/KUl
         OSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669943; x=1774274743;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KPjHmgruixhmkQjw04sh9Mjy1u+NZy/GWXT+thsthOE=;
        b=gctfbcVSS4rfGY0SHI5NoYDg3Il6d0MBkC+HCRmPaxMyqMsT2qy07mDHoxSZQq44fY
         2KHSew1WhJSUongv2k7Nw/1PHXgLUFo+u4iuF+AXZCTctMaIyZAsdrUxNPvfudfMOuCa
         MsIAdyh8q/jm0fb2ip2b3aDuQ8HmPgrk+3YBK4o0C9+6Nu+i1GO5om6JuUumdpdNmZ5Y
         kQ9ynyGYQXWXtmbZUyg30wbzfIPJ0nLpQwz5Ce+4q/R1LaMn5X5HbhbKuPKqazDSz0T7
         l836akSa/iatCoGaf209RV5xQenMXwqqPZEx/CSQTCbQpKq31bPmZv62H4WJHA8wHFwK
         cbQg==
X-Forwarded-Encrypted: i=1; AJvYcCXjzo10EK60G95tjtIUSGcc0jJ8u3yMUMaPfdUURFlCQjUYy5lfM6NOgNzz9j2tJ8pTbqeRY/pt5lZVhvn1PA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRWx9Ar14soEOnELZVjqkTTXwZRTbFPRvJ2wI+b7Y+nzQ+kBd/
	sTwS5gAYJMver9+BgRMCFuCuCIhy4VEQz8hbhgpPHFgEUTzUqrBqwjwzSp8gU3jOUqgv9ZWQpWD
	kIDh9N3XUkjESGkOlgQ==
X-Received: from wmqy12.prod.google.com ([2002:a05:600c:364c:b0:485:408f:802f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64ce:b0:485:3b34:2f62 with SMTP id 5b1f17b1804b1-485566d0c13mr212567075e9.14.1773669940884;
 Mon, 16 Mar 2026 07:05:40 -0700 (PDT)
Date: Mon, 16 Mar 2026 14:05:39 +0000
In-Reply-To: <87cy13swpw.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org>
 <20260216-rnull-v6-19-rc5-send-v1-15-de9a7af4b469@kernel.org>
 <Y7WTRL6v0WsR-DWju2vumM1EBu4KZgQzE0VJul7mK3pUwD6ba0UuQO8sclDzOaeLGGh9u3WG5iSKq9T3kQqH-Q==@protonmail.internalid>
 <abfe2LbhLzXiGCkA@google.com> <87cy13swpw.fsf@t14s.mail-host-address-is-not-set>
Message-ID: <abgOM3k4hmDCSkon@google.com>
Subject: Re: [PATCH 15/79] block: rnull: add `use_per_node_hctx` config option
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 16, 2026 at 02:57:47PM +0100, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
> 
> > On Mon, Feb 16, 2026 at 12:35:02AM +0100, Andreas Hindborg wrote:
> >> Add a configfs attribute to enable per-NUMA-node hardware contexts.
> >> When enabled, the driver creates one hardware queue per NUMA node
> >> instead of the default configuration.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > This and other patches make me think that module parameters should have
> > value() return a copy of the value (and require Copy). For non-copy
> > types, there can be a separate value_ref() method. You would avoid *so*
> > many asterisks by doing that.
> 
> Makes sense, I'll send a patch.

Nice!

> >> +        use_per_node_hctx: u8 {
> >> +            default: 0,
> >> +            description:
> >> +        "Use per-node allocation for hardware context queues, 0-false, 1-true. Default: 0-false",
> >> +        },
> >
> > formatting (rustfmt ignores macros)
> 
> This is intentional. The line gets too long if I pull it up, and I don't
> think I can break the string in any way. I think it would require
> changes to the module parameter macro.

Just keep the wrong line. Checkpatch will complain, but it's standard to
ignore that checkpatch warning in C code for long strings to keep them
greppable, so I think it's fine here too.

Alice
