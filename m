Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617A4346E4F;
	Fri,  6 Feb 2026 19:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770404557; cv=none; b=uiBPpW1lmj0jkXmnf/aXbJ1SFFINaFYwIxj1TUejt7uJbAN9TcBuHJeQVDswja/tyBzfzJj0jpIUbDvYiSKNNnYA8QpHTiAWTxsUj7yKCuuGq6nAipt7eQgDK0KrpsyB1qWlTR/B5d98dYRYfikyJiI9aMcbjQB/95Ny0n4zdQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770404557; c=relaxed/simple;
	bh=FAZio5L7yuQ7Mx9sh3HCB3Z92+t4KDLDjlTb4SvFlh0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=i9/HXgqrVNfvu9PiY8RLBlbfiml4WegeGG7SBk8AOfLF+85bysc0eSMZjGnROUYDLrVArrlMpDVSHKZHiE4cC6M+dXAxw8pmvZ7wm0SScDW57OgMsppiQVIBdFdnRz52pOQZXHlA8f3NrhKZViv1qLwfTdtJ6+1kpkmcZMkL8a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixoLVdwl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixoLVdwl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38B5C116C6;
	Fri,  6 Feb 2026 19:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770404557;
	bh=FAZio5L7yuQ7Mx9sh3HCB3Z92+t4KDLDjlTb4SvFlh0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ixoLVdwlRULn7SJS80RugxOYzhfqDwcrQ6Mbj32OlsxZsp4wPwobX2IMIlWXtfPK5
	 XMEqXrBZfsl4MSy8Oer/0mk+5f3kM+1vrG6KfQWxNm71M1/7GwjVyY/yCvLPRRVRmn
	 bUtlBDy0NMzPTog2/p9IAbKEa1r0zjA+YqxcqErxlmPs7Hz8gsuEHyifzFQQlEE6uX
	 Ocpl5buG0hTEJXoYuP185AoJq5ohquaA+grgkVfIo9ZOa+FdXEKODAH1uxuZNDdrfs
	 3TQs/RMxxlXNJ9q0C4tA3G/onswwjfEZ5mEQjHPBgonRPX5Drz0ctvM7x6IY7Sp3gb
	 ErC7xeybCYOlg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 20:02:31 +0100
Message-Id: <DG841AYDNK08.SKE8W6746GRZ@kernel.org>
Subject: Re: [PATCH v5 5/7] rust: io: add `register!` macro
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260129-register-v5-0-c4587c902514@nvidia.com>
 <20260129-register-v5-5-c4587c902514@nvidia.com>
In-Reply-To: <20260129-register-v5-5-c4587c902514@nvidia.com>

On Thu Jan 29, 2026 at 2:32 PM CET, Alexandre Courbot wrote:
> Add a macro for defining hardware register types with I/O accessors.
>
> Each register field is represented as a `Bounded` of the appropriate bit
> width, ensuring field values are never silently truncated.
>
> Fields can optionally be converted to/from custom types, either fallibly
> or infallibly.
>
> The address of registers can be direct, relative, or indexed, supporting
> most of the patterns in which registers are arranged.
>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://docs.kernel.org/gpu/nova/core/todo.html#generic-register-abst=
raction-rega

I assume you will remove this task once we land your nova-core patch that u=
ses
the register!() macro, so maybe this link makes more sense:

Link: https://lore.kernel.org/all/20250306222336.23482-6-dakr@kernel.org/
