Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629906;
	b=21iIQYna9oXPqGradgGbUAh7ETwQzfhKeNXi0sWyWUy/dc/vBKNnteWRGFIG90R4eTtv
	 AehqgMzomgHhKIrvUWXZ5Epyvhleytajyd1s5dP25kRJ3JxNCBT8ccM7Ndx+2oY6V1pwn
	 36WsiFoXUf/4Ie7ewgGcBV7mkwRqXnXdiebIRBZoUX1P5aiH7HaD0asSnI1btlGr0QsvX
	 +YBq9StifjMy0rMCBwxJPWw8G0NjbBxOD9fOfmWsXxHI06PGnwr8uzglnM5dxYqJpHA4x
	 ENhy6rCqClJCVgEhvmHctQnNVKLqLUzlnwQ9oQDodGQlMwxi/Nila1uvPCT8YaP5uXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629906;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=4yd5OOWVGx6NJ28rnykr9HN9IAlcNo2roq2kY+xZeTg=;
	b=at4RqjIz8xpYDVLBswSx1jtBIY/EtxjFIK5APokEIgP26mdSzQV7gqvGbxWtT5pbs/t8
	 htjNQcMTOfN6gAOrh/B+4wVN2kTvnD89uILv5GO960K00Yxi3+hM9HWEOpRMrVooXWpVK
	 vd4isdu0hAHzfiCdl/aCY+73JVn4M79DOsaFKPwVLO0HKGKrUKpdevwD7XwRXNhMN7git
	 QnX1RJKfmIVvbmfd8YUInnnHNpoKSfnEGEH+0hMUPz+t/BXG5I3IvwrukAnDqW9uPU8rz
	 N5qZicfFp8XzxsbB/8uK+9ZxeMjJXNr/+zJ0eezL98xU0H6tVKVNXqpy06Ima8ES6mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjUtfPkz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF656606A33F;
	Mon,  2 Nov 2026 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjUtfPkz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB6F1F00A16;
	Mon,  2 Nov 2026 14:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629905;
	bh=4yd5OOWVGx6NJ28rnykr9HN9IAlcNo2roq2kY+xZeTg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TjUtfPkzFGcklHcow+HO0jNiztCkuSGX6+ubfR7GFyGWmAlOCq/6i/nitctX2cLkS
	 /jsmHnp8kNFT6NvTbsIIxe7YX7qRW0QRlmsr0l7O1GJf+IgF1eDsb/gnAsrse3Mx80
	 mDuRRw4tbNflT61Y1hF2nd6s1CPvweV79kgYntA0dPXJd0ecT+eeOaS+MSA2A445Mr
	 OvuIIF6wcL1pjTP8vDNSw+rODBa+KjeEY5WRJVa7JtftAuJqyI4E3kIJzH8zEJtm8m
	 0lXZW4WpYMeqdSFM4WWwWGz0+Mi1YeeqGGpbKX/+moeWiISrelz6b87u/HNgQcxeZ3
	 Ax0naBF85v7og==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Gomez <da.gomez@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Younes
 Akhouayri <git@younes.io>
Subject: Re: [PATCH v2 0/2] rust: str: parse_int: match kstrtol() sign and
 newline handling
In-Reply-To: <20261101-b4-parse-int-sign-v2-0-0fd827f52070@younes.io>
References: <PGNAQEojwnccOLf5-V1Qu8OYULewlWcavisB7AXtAvg8nGRfqVufK3xLJpXjalzS1JGhaSf5YhYkiQbz9yjejg==@protonmail.internalid>
 <20261101-b4-parse-int-sign-v2-0-0fd827f52070@younes.io>
Date: Mon, 02 Nov 2026 13:37:40 +0100
Message-ID: <87wlqvmmsr.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Younes Akhouayri via B4 Relay" <devnull+git.younes.io@kernel.org>
writes:

> The documentation of `ParseInt` says that any string parsed by
> `kstrtol()` or `kstrtoul()` is also parsed by `from_str()`. That does
> not hold today, and `from_str()` also accepts strings that `kstrtol()`
> rejects:
>
>     input     kstrtol()     i32::from_str()
>     "0x-5"    -EINVAL       Ok(-5)
>     "0x+5"    -EINVAL       Ok(5)
>     "-+5"     -EINVAL       Ok(-5)
>     "+0x5"    5             Err(EINVAL)
>     "5\n"     5             Err(EINVAL)

The documentation says that `from_str` will parse at least the set
parsed by `kstrtol`, so the first three cases are in line with the
documentation.

For the last two lines, we can strip leading "+" and trailing newline
before invoking the existing implementation.

Best regards,
Andreas Hindborg


