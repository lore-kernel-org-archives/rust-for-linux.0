Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C191A9FA0;
	Thu, 27 Aug 2026 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837668; cv=none; b=J1jO6Powue844RCLvFqUxPSoxN/8s1eMwkhYH918XaSyhJejsmtsBTjhjq0kdn3/ZEfo1hAiOhuNKctu+bdlmUvtthAFhXL1dvcc16+3d7j6U1mM1rnczBtNeE2xtkwZVSqDdywMhDocBgeh1u5DiPx/CtTpvbQyxadt2trAipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837668; c=relaxed/simple;
	bh=BDdjWP1gjcnpTiM6vEddjEVcmxzUt5q23TgrJw1hMsk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HgQIYWEaNXbH0xznYRito+/w/pln9ksYxgN67F05C8bnF1LRmZWpVlFgFpiCu2bCKOanelV3YP6fU7+ChAsPmLprXp4sBgbpeoHjBBQuh32Uzlss4LKuWZQkWD8NTdwEajz1NwPudKC/XIeS/Tgz/hJOe85mtxmicvWC1IH25gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWqCriVK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWqCriVK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C48D1F00A3A;
	Thu, 27 Aug 2026 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787837664;
	bh=BDdjWP1gjcnpTiM6vEddjEVcmxzUt5q23TgrJw1hMsk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=EWqCriVKuaosGQs7J/kulo7wrydWbcRf/zdjvt9o1X1aG0/hI1oK9J+chlW2N1Da2
	 nY1vm+kZ4sBSk1fuuGNQXuAqtXKyFWRX5RgTLr1n2USeECxD054AvbfDD8pN8wmjSG
	 JBB31tFLuhz9LCLk3GS0mw5BRfIQV2wOPtHnOXDfkApKoOca9hfV2sIpbdvHCQiHxM
	 8ZxZO17ocPt2lk99LeJUZ4fpXHjY9GBfZbJihQVw3AAncUzarVi4ehOfI4iB0O6H0Z
	 UIJavDA3iEjkbHnNDtIa7iMtzHVUxHxFQ/hGzMOyrVHGolYTInIn7yUIiDYkzU++YL
	 dMcg+0yI+5edg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Mike Lothian <mike@fireburn.co.uk>, rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>, Boqun Feng <boqun@kernel.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker
 <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, Thomas Gleixner
 <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, John
 Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] rust: hrtimer: add ArcHrTimerHandle::restart
In-Reply-To: <20260826162851.2497-3-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
 <PTgvpjjPiVHpV5cb5AFpiGEjRsWtsYwuSeJJ8jwp3nn0KknPmUp9oGo1V-8erfbr4OQrH0c_RPZYYJWi6yV9FA==@protonmail.internalid>
 <20260826162851.2497-3-mike@fireburn.co.uk>
Date: Thu, 27 Aug 2026 15:27:35 +0200
Message-ID: <87cxv31yns.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Mike Lothian" <mike@fireburn.co.uk> writes:

> Restarting an already-started timer through the safe API means dropping
> its handle and calling `HrTimerPointer::start()` again. Dropping the
> handle cancels, and cancelling blocks until a running callback returns,
> so this is unavailable to any caller that cannot sleep -- a driver
> re-arming its timer from a callback invoked with interrupts disabled,
> say. Such drivers fall back to the unsafe `HasHrTimer::start()`
> on a raw pointer.
>
> Add `restart()` on the handle. It re-queues the timer in place without
> cancelling first. It is safe because the handle already owns the
> `Arc` that keeps the timer alive and still cancels it on drop, which
> is exactly what `HasHrTimer::start()` requires of its caller.

The intention is that handlers use the `forward` method on the context
object in combination with return value `HrTimerRestart::Restart` to re
arm the timer.

However, we found a data race in the face of concurrent `start`
operations, so we are solving that over at [1].


Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/rust-for-linux/20260825-expires-v2-v1-0-90411c6217c7@kernel.org/T/#t

