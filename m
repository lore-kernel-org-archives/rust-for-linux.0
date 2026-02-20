Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F2833769B
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771582829; cv=none; b=DrVsuvtGDEL0i0FZlGMkdsTuLbm6FrYScHzu0SkJjiubtUbGxaBBhaWfAB6NGSRFlEB9t7eVU1BDV6DRHAFHbDwAypYa4F5UrfCSfV37jDa5v6tgHA7m8rvglPrxaluaRKQjo+vGoMbhJHEHp+B38s90tIWyNqDipY3d001S4hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771582829; c=relaxed/simple;
	bh=6KmU1AWVJiEbouJMx51Kj0j5yR+X1ELGGptVwWk1JuQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TDKbzgdSH0ZivJGsGwSG0qC5lMJpOYg4yHfJ7MUvD5OJ1XbyxDe2u4LRIkc/3gjVZDsOwjG70SeS4viWW4O6VSAE8gscYuS5j2Mhi9zzVPJOgGv3dUAIqxpugzZEmebayCkYJnEhCIM10EC0uDcUxFCxRkbNlMjdXX4R6sNPd7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rRG9JM//; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rRG9JM//"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836bf1a920so22200805e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 02:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771582826; x=1772187626; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgOF25WsqAV2m3jmjI8ZSzjN6VVlBAtKwBvn34jgo2I=;
        b=rRG9JM//t9y8LpEYP9CMggKYCo2/f2lelOyadsm7+0hQKylOgJTCnE+GlfUQkPZCem
         OXU+3pq1CEJ3qQ81sHTB35bREzaMYfvGoDjg3iqUoB/45DkSCwSqbXwy9SIcyBNeQN+1
         GDGwKadmhNY4l80sG5fQVSHqZIZ6qfWfwOkMSz0FjFytAPP29Ux8bE/+C3g6L8Sj+7uy
         LwF/KEUxjqMwYL2MOJLDTWrgVrT9stxju9SQASfKn8gBJxe9oQa5f9rjJv53bVX5gnHd
         Fonili8nFokyQLyjQZoY0SK9qXQ8Vb/FkrLn98aD6qYACRkeT4Tmw0r2Rqh75XebdRjM
         re+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771582826; x=1772187626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgOF25WsqAV2m3jmjI8ZSzjN6VVlBAtKwBvn34jgo2I=;
        b=JeMSE0BEi88aqQs91sql2tU7nipaKHk3Pcg4b/jAr2UI3XBGO13GXJeq0D+ZSpCleU
         Y4qVmN9/nyo5x+5XZ2qGvzH/NO7D3bRL1fIAPxe6OBf/J3b79qp4ISIuKKJ7HvbVR0eD
         UVzZrrk8wlFTV892Zy2e2VpC3ZiZY38/IXj6v4Z//n9F0VryK/oVs1pEEji5F3AcoURS
         EiaXhkbQK8nKylu7IAjEbascLgX1U0+A9kxOsN7vQ2yiPF2YOxsNGyMPLrpWZik7d5sm
         px9Ec3MRsEEJTupqFfY57/AzNbmeZDramHloox5JL7TiZu80uR+qrWjUIPz1oQNy1XNJ
         4L7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9vJGiHa1XaeJS4acgVXptrPQCCEoLGN6JnEL7gb03L2nhI/Dxlo7dTLY5Zx065a7CSwizYgSa3a32O48ryQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2M8z+fV8iyDUlUUVpRXWcwQlTrBlY1XLu2RimMRwlRS+nFNre
	IG65smQXpgc7qQARS20mrlPd13sT2oulzqEgg8SkuE/qMqHtMa3KQ6vKX5hSjcWhC1TrurZBRmm
	vvHMNaaY4+RBcB0Hp1g==
X-Received: from wmpr35.prod.google.com ([2002:a05:600c:3223:b0:477:9f92:40da])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b61:b0:480:1b65:b744 with SMTP id 5b1f17b1804b1-48379bf7907mr315705125e9.28.1771582826283;
 Fri, 20 Feb 2026 02:20:26 -0800 (PST)
Date: Fri, 20 Feb 2026 10:20:25 +0000
In-Reply-To: <20260220-atomic-sub-v3-3-e63cbed1d2aa@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org> <20260220-atomic-sub-v3-3-e63cbed1d2aa@kernel.org>
Message-ID: <aZg1aSHfrvZPaao0@google.com>
Subject: Re: [PATCH v3 3/3] rust: atomic: update a safety comment in impl of `fetch_add`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 20, 2026 at 09:06:22AM +0100, Andreas Hindborg wrote:
> The safety comment used in the implementation of `fetch_add` could be read
> as just saying something it is true without justifying it. Update the
> safety comment to include justification.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/sync/atomic/internal.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
> index a094f704be0ce..67745c44e710b 100644
> --- a/rust/kernel/sync/atomic/internal.rs
> +++ b/rust/kernel/sync/atomic/internal.rs
> @@ -258,7 +258,7 @@ fn add[](a: &AtomicRepr<Self>, v: Self::Delta) {
>          /// Atomically updates `*a` to `(*a).wrapping_add(v)`, and returns the value of `*a`
>          /// before the update.
>          fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) -> Self {
> -            // SAFETY: `a.as_ptr()` is valid and properly aligned.
> +            // SAFETY: `a.as_ptr()` guarantees the returned pointer is valid and properly aligned.

Perhaps more natural wording is:

	SAFETY: `a.as_ptr()` always returns a pointer that is valid and properly aligned.

Because I doubt `as_ptr()` documents these things explicitly. (To be
clear, I don't think as_ptr() needs to do so - that'd be really
verbose.)

Anyway, it's fine like this too.

Alice
