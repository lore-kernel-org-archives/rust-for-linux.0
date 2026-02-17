Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C46F14A62B;
	Tue, 17 Feb 2026 19:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771355469; cv=none; b=d+lBzQFvu9tg49wpEkYAfh1RSKhE7UWlKLhoihv8B0zoFcfNQvCVQzyhNmWwBwQ6nollj3nW03A4cClOhaDgYIFi66JnEWTqIM+F4yEGcyR8vfXYZGAY/UZos+zPg+V/OF7ecjTkq4B0B+UVhX5kAZ2KLWa3UNqFI0f3EAhBwzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771355469; c=relaxed/simple;
	bh=Fa+MZEMlciXoGwkQAuUZOCY5XpCMyNzjSBDCGGqCKLE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=elQB01xRmKy3UpbuwdZ1FHmXhADJLCV9hb2mmg1WHPvxyzhbMT0aTxDelwQ0eN4rapRsdtwwrok9G02QBuqCgRN1PBTdHzyaW/dnAYrUFJ1wIyMfFaj/q5lgu4WRydG4EVc3o8uw+2LJqKMRJJmU4uLoamLgZyypCitkFfI+8t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m96dHnFL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m96dHnFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA51FC4CEF7;
	Tue, 17 Feb 2026 19:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771355469;
	bh=Fa+MZEMlciXoGwkQAuUZOCY5XpCMyNzjSBDCGGqCKLE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m96dHnFLkM2x7H2tEGnLQG8HLyZ2FepYsecvGXDo7Q6fuMElSz2Q/eJ51gKJ/OU92
	 E2bJvF21pZUXegD4fjjHcxuy95/rrUBdh6UlDg93tmDprRZAO/AL/DNHH1VDYvEsQi
	 y5f6EyUdx2vti1MgzdxH9W6b/7XdG6BxXRY//mOQ5G2bn7aiGF2PnOBtAAjehYBJiF
	 oNwBli+UZ1YTtMkRIHfGdf/Tzgwu2Tr0lpw3LMj3E8cwdBjd7FxJTB2EGygWxE04OY
	 KQCHx+nFpO6bg9IyxEy4TM4iKDniaGVgDpzsDLjAB2QXtLpPvgYX0Yj6YEpVCAZcXh
	 FDjTn/J/AU3Cg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl
 <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add a ring buffer implementation
In-Reply-To: <DGHB1VEL6XTH.2W3803V58FUSH@kernel.org>
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
 <8tULWyvUTjVb3E_HFZeW2maApI87eYLZungGtJ6k9CVT9J-C-TzIqx5ShmHA5vS30yqZRq7TmaBd0AIg5V7u6Q==@protonmail.internalid>
 <aZMMyJofDKualqXw@google.com>
 <873430es2p.fsf@t14s.mail-host-address-is-not-set>
 <C82DE0A6-17FC-4FD9-A272-257B59129A7E@collabora.com>
 <DGGFZX5JLZ22.3E1C8OVLNUDD6@kernel.org>
 <3D7C5FE8-CA15-418B-B2F7-D0EA4C37E1F0@collabora.com>
 <DGGGPFU9E9VD.8TT3HZUWS100@kernel.org>
 <U-BIeJ2bi8_e-eMwrNeo2r12w5jDIlGja9E3QSTg2bgL7JYAp1lJtO6sPCvTGQsL1PCfkEkMHfR5eLVG3JPJaw==@protonmail.internalid>
 <71F89D79-DBE1-4617-B58A-8552D0F2B3A2@collabora.com>
 <87pl63d6xx.fsf@t14s.mail-host-address-is-not-set>
 <L27n6JvhX0qd0nYoc7OSvJJHPPjYRdUHiXcqL4l9FKkG52HCMa-qnOS33uUJtDu_Iayel2UgLad7yc5cWsOGHQ==@protonmail.internalid>
 <DGHB1VEL6XTH.2W3803V58FUSH@kernel.org>
Date: Tue, 17 Feb 2026 20:10:48 +0100
Message-ID: <87342zchjb.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

> On Tue Feb 17, 2026 at 11:02 AM CET, Andreas Hindborg wrote:
>> We can change the code down the road, no problem. It's not set in stone
>> just because we merge it without generic alloc support.
>
> Just to avoid any ambiguity, we should merge it with generic allocator support,
> but aiming for arbitrary I/O backend support would be a bit too much.

Right.

>
>> Perhaps one could imagine a simple API like in this patch being provided
>> by a configurable implementation behind the scenes.
>
> Yeah, in the future we could implement the system memory specific one with a
> type alias on top of the I/O backend agnostic one. But it remains to see if this
> will actually work out properly or if it's even worth in terms of
> maintainability etc.
>
> (E.g. one of the limitations that I've mentioned already is that I/O backends do
> not support growing and shrinking of the backing memory. And I'm not yet sure if
> they ever should.)

This particular ringbuffer* implementation does not support changing the
capacity after initialization, so I don't see that being an issue. For
applications that need to scale the size of the ring dynamically, we
could have another type. Or a generic parameter, if that makes sense.

Best regards,
Andreas Hindborg


* VecDeque? This kind of structure has always been a ring to me.

