Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19ED2836A6;
	Fri, 28 Aug 2026 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901991; cv=none; b=iXDzxtyRIJDB1YLZl3o28CzQPOwAU9nf9Ojs9bHQTFGR6JuyRfxJnOjjCikWAzCg2RgOkUrYC8yLF1OdN+jKqUSTGk3eee77PsO73WcRGAW+1JoP4kheZHhazcAwdKFHzhkav7mKChxIOuBoC2iMTF/USYSB5guNg0AK62ibhec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901991; c=relaxed/simple;
	bh=ex6Sy2hqtfD1Zec2Gqgz3Urw9u+2vmPtk2jinG1sy2k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kgYRrpo5S+moIdeyogKQsd0LTvwfXjlGQDgFNo5acpHf7UPzvimVHVuC+/loMJUwg/3aIWoLTJJ8FNHl5vey5bv6fDoyzF4KQPjHfdcq0xF9OcmCjLd3gVkqkH/P0DQLz3FfmpOGyKXDA7vo2pSiNI/WqZ0yPenoG9vA5rnltIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geLi/UIH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geLi/UIH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE261F000E9;
	Fri, 28 Aug 2026 07:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787901990;
	bh=ex6Sy2hqtfD1Zec2Gqgz3Urw9u+2vmPtk2jinG1sy2k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=geLi/UIHExJytJEB9UrWGKZPP8xJxNXHobKsxEWsSYbEoscffOgds8grTCQkmEMAc
	 WEsKK+AfgULw9wwQ2DVnuPOZ0TBZnldjCKNCoFr0W1GELldRQ+3U9FVMdFLRS+h3dz
	 /KkXQSTC8Ufwa/jpNNdhLAe+qJiPKlOvzX3sn3WAOFzp/5sdUD/HTBSqbSkVKAf/ws
	 DbNJit4JFpqacGG+926L6ZCwu5tLb3VPeE85O1ZYfuGLU+UimdQCB6hwNGwnfGTlln
	 QOt+/TvtP3ohvZe3ZwjcESm9cImB3iY7S7/u4NVIjqm9JLbU07p+5ileFeozMFcGTC
	 cY+HOdDWY81XQ==
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
Subject: Re: [PATCH 9/9] rust: time: add ktime_get_real_seconds
In-Reply-To: <20260826162851.2497-10-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
 <-MGvfW7sYYLrXTWvmTSX5lTwjEMfK97Q5QgNWBrHikC8aI_fyF3Sa3qzN4A9Th5lK46jMOYU4KjO59m00z4P9A==@protonmail.internalid>
 <20260826162851.2497-10-mike@fireburn.co.uk>
Date: Thu, 27 Aug 2026 15:39:53 +0200
Message-ID: <877blb1y3a.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Mike Lothian" <mike@fireburn.co.uk> writes:

> Reading an `Instant<RealTime>` is the wrong tool for a caller that only
> wants a calendar time in seconds: it takes a full nanosecond timestamp and
> then needs a 64-bit division to get back to what the timekeeping core
> already maintains as a plain seconds field.
>
> Wrap `ktime_get_real_seconds()`, which is that field. Document the property
> that matters at the call site and that the type cannot express: the value
> follows CLOCK_REALTIME, so it is not monotonic and can move in either
> direction.

We recently added the concept of `TimeUnit`. For now it is exposed via
`Delta<U: TimeUnit>`. We could extend this to `Instant` as well to have
a seconds based `Instant`.


Best regards,
Andreas Hindborg


