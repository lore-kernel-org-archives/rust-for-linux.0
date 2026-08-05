Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229ED429CC7
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927692; cv=none; b=UJiQAIGRfYJJNJFsfiDgmeK6J40/z0490Si5C+niQiGyFM/bDs7MvT8ZlTve597pMPXlZOlb2PsH3lihD2yhvJczS1XFQbfbzJcle5NQYLOOcOwg7AkVPhggyIx6fDR/UJjRa1m/BLBNVZuWKQT3bKOjjK/88AVX1RqGEPd4o20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927692; c=relaxed/simple;
	bh=SPFAGYPoiQadFdcMQxKnpPzyA/BRKqVhYXErge2ypEQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nE6Nv8mMPfRFjRDW4ujxbO6ujnnv1z0QJYCk8iVqROg4jKeqjieq6F8po5YcTN5MQ9PinhWZZnoDRKfNRo5clp+z+JK7HWGOFSzAUxL1WsX730eD0UKKuUm6fOsZk4cOJNKsbflG9mrpce3q31uZ3+6NmhFtYA0p86JgKiTkb+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdFGuyBL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdFGuyBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B891F000E9;
	Wed,  5 Aug 2026 11:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785927687;
	bh=SPFAGYPoiQadFdcMQxKnpPzyA/BRKqVhYXErge2ypEQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=EdFGuyBLkFDGQ9DJSsE1+oHWxOIJm2K8bPF4nRLyWTBBqtxGzC0Oh1WL7kJK7uKfY
	 xCyULqiiXKdmPZfjebgPidftQc0SRkwPLC6MrKZKG7y9IjqNZVseW5kt+ddJxiBDki
	 jxzQc7EVHtvSZNUkoGhaQIDAoiS0zuoBcpFSw/5mU+wjZE1RpGxaXkEtu5kj9Mxs8B
	 yjWDPTlsCi4sKjmVlFA9TdT5b5QodEmLPtIdEGFtoMG11kIZfjcZwDGA4f2g+bUbU1
	 XGQ+yjVbjfpbzyDbTXR2enz7K+raJ20Yr9jrM9s8tyZ4KAhZuqpehhOcr5Fz9JjezT
	 2gZPQemnbR06w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org, jstultz@google.com
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: time: rename ClockSource trait to ClockId
In-Reply-To: <20260722001050.4115708-1-tomo@flapping.org>
References: <Xb3BqlziN0dz1513y4Pf4QcsWU4wtV9yldqqJnRxpJpDfcu8sMggyUlvbLFPRAVBPyTI698uvBbWntyliXl7Qg==@protonmail.internalid>
 <20260722001050.4115708-1-tomo@flapping.org>
Date: Wed, 05 Aug 2026 13:01:17 +0200
Message-ID: <87ecgc96gy.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> The `ClockSource` trait has nothing to do with the C `struct clocksource`
> in `include/linux/clocksource.h`, which abstracts the hardware counter
> used as a source of time for the majority of the clockids. The trait
> instead carries a `clockid_t` `ID`, i.e. one of the IDs of "the various
> system clocks (for POSIX.1b interval timers)" as described in
> include/uapi/linux/time.h (CLOCK_MONOTONIC, CLOCK_REALTIME, ...). It thus
> plays the role of a `clockid_t`, and the `ClockSource` name overlaps
> confusingly with the C `clocksource` concept when reading across C and
> Rust code.
>
> Rename the trait to `ClockId` to reflect that it represents a
> `clockid_t`. This is a pure rename; there is no functional change.
>
> Suggested-by: John Stultz <jstultz@google.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Link: https://lore.kernel.org/rust-for-linux/CANDhNCrKMdHCmL76LWCROVF2Ly-9NxmfmQ2T+P=iv34aVkO2uQ@mail.gmail.com/

Makes sense to me.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg



