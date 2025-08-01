Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B3015E5D4
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754038915; cv=none; b=XbqEIbt6FKMa7vObjvL+flg9h6hDzk0/TIwNdpF2WAu9U5brMdSIaYemioaI2KPX/AcnFCccVIDAeaLohoIs8SsKg4+THbKpSdRMglzyUUpYSUPBy4vthN2QGlbgjmlc87HeA0+H+t81VP0mpI0gGc+7MrTm8qEgx0iQyV1I/Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754038915; c=relaxed/simple;
	bh=kJK+rQkXpBpV/rwip2EUxwLS6eel1wFgg/6G3axRc4k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uvHW9H/enwdj2fuEPwS4bRsZGhejyXyh73XqIGu9x+s8/RBLBwveQPb8wdPbY4QhRYrkHPEJeZcid/rqAllFc4nWEs4D4eakJVOZJamXy9FvBwvd8w7xyTFnKJMGGutXzLhrF52DSsDrsxUOClGUATk5yfeFkU6gwhOb5OUCzdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QMcJ5I+/; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QMcJ5I+/"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-456267c79deso1609035e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Aug 2025 02:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754038912; x=1754643712; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kqS553FeKDYKCwtAkb20JFc25+oBMc4a/Aa0vW9Z30U=;
        b=QMcJ5I+/63JzyZOvTBx9QCrVDgK76EvEcoJfUuU5/+GSxrtCZnWumoFj/RYejp9HeG
         G7hX39U/qbcHn2BQrXCOTEMC6DnnJCrUNv8d53GFLVOiryv2T6seTTaKeocC5AN/TvVo
         hBe/T0uzI55mrs3HRBK/Afd90tUoT+8VuIP7SsZJ0NwD5bxX0WgGOvPGZ1WpA8b5xvq3
         P4AqnT8y6UEzLY2zFvxxgsyA/U/gxEod8Ey50LrbjlLduL9AFEhqpIKdSu0/7Ga9L7Lq
         XaqNWP5Lva5Ny4BbFvuU6j5UFh/C8WUGvcMqxSu3kvGAc5ax8rTvdMcd2NzcKEVqjdk8
         ZYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754038912; x=1754643712;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqS553FeKDYKCwtAkb20JFc25+oBMc4a/Aa0vW9Z30U=;
        b=dHTYdOGBIzOXmTfoD8pg+b9WwTKJebX+fWXhckTTjNey9C5Z1wgy+NPMKvFVQsIN3J
         h3F2UA/t5DskmOMx1HK0Jed8l1ELv2TSHZlQ8UWkz+so2sU0U4zMdNsKYhLpIAA1xnWs
         fJWRBoENkNQMYzIqFYytYZg3lXf4of6Ykhj+KJpKsSYN8MlMlOaAH72zP5dLTk8qT05g
         cASIkrt7T+cKmt9PKL3tmtQW7HI4kKQWlYO4TYOXH5XpSxfdUZDfrGeZvk17EbNM/sri
         3df44+Skr6uJM9v9ubY45s85UzCWOLSzDiIUMJbDfU1kaNuiRIkIVVWGhLkS1f9Qbi4f
         G7cg==
X-Forwarded-Encrypted: i=1; AJvYcCWe8y/43kYiS/ZIcvg8tspZp1XL0Ro0DXCHCyk0EifXNw2PGrKYznum96xSHnoAyoWxB+emJl4SQtQ0zovlnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmo2zJApuPEjpCAbpduCvznUJStjEn7VOPn1sldfeRlYKx1wqh
	Z1/upIcAfEulcz8u2mM1zmPYRTGOikbB81UE1Vr9nM4HpT4V5xHzQC2brGlXLyB/enn9+bd6WQo
	EUftODYsh3jD9AymA9w==
X-Google-Smtp-Source: AGHT+IEGSrHjQNIVZDe9AaJDH6jkeAL+E4bmquGJQcAIgyUXYfrcUzo8KPM7x7yoZFwquE6owm//RFtb5/69b2A=
X-Received: from wmbhj23.prod.google.com ([2002:a05:600c:5297:b0:456:21f4:7a98])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f09:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-458b0216ba7mr8716695e9.0.1754038912604;
 Fri, 01 Aug 2025 02:01:52 -0700 (PDT)
Date: Fri, 1 Aug 2025 09:01:51 +0000
In-Reply-To: <20250730-lock-t-when-t-is-pinned-v1-0-1b97d5f28aa2@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250730-lock-t-when-t-is-pinned-v1-0-1b97d5f28aa2@collabora.com>
Message-ID: <aIyCf85_Xe6etC8Q@google.com>
Subject: Re: [PATCH 0/3] Groundwork for Lock<T> when T is pinned
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jul 30, 2025 at 02:14:43PM -0300, Daniel Almeida wrote:
> It's currently impossible to have a pinned struct within the Lock<T> type.
> This is problematic, because drivers might want to do this for various
> reasons, specially as they grow in complexity.
> 
> A trivial example is:
> 
> struct Foo {
>   #[pin]
>   bar: Mutex<Bar>,
>   #[pin]
>   p: PhantomPinned,
> }
> 
> struct Bar {
>   #[pin]
>   baz: Mutex<Baz>,
>   #[pin]
>   p: PhantomPinned,
> }
> 
> Note that Bar is pinned, so having it in a Mutex makes it impossible to
> instantiate a Foo that pins the Bar in bar. This is specially undesirable,
> since Foo is already pinned, and thus, it could trivially enforce that its
> bar field is pinned as well.
> 
> This can be trivially solved by using Pin<KBox<Bar>> instead of
> structurally pinning, at the cost of an extra (completely unneeded)
> allocation and ugly syntax.
> 
> This series lays out the groundwork to make the above possible without any
> extra allocations.
> 
> - Patch 1 structurally pins the 'data' field in Lock<T>
> - Patch 2 constrains the DerefMut implementation for safety reasons
> - Patch 3 adds an accessor to retrieve a Pin<&mut T>
> 
> Note that this is just the beginning of the work needed to make a Pin<&mut
> T> actually useful due to pin projections being currently unsupported.
> 
> In other words, it is currently impossible (even with the current patch) to
> do this:
> 
> let mut data: MutexGuard<'_, Data> = mutex.lock();
> let mut data: Pin<&mut Data> = data.as_mut();
> let foo = &mut data.foo; // <- won't compile
> 
> The above is something that Benno is working on.
> 
> Thanks Boqun, Benno and the rest of the team for brainstorming the issue
> and for and laying out a series of steps to implement a solution.
> 
> ---
> Daniel Almeida (3):
>       rust: lock: pin the inner data
>       rust: lock: guard: add T: Unpin bound to DerefMut
>       rust: lock: add a Pin<&mut T> accessor

With the things that Benno said fixed:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
