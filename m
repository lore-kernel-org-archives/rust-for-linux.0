Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B095918DB35;
	Sat, 14 Feb 2026 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771070208; cv=none; b=jY5j6/EO8AzZ/00d8zpcDrJP9cVnLpGPdzDtjm5BRk6LPMFwC/Rq/cTVT71NG0DJ+RtwVM+91HcejKTGnIrlyKhE/Bm1UJklm8YlydMQhvhsebbkPMZtR0EPKK91U39D4iDs3dWvwUbqfafGR50hoFNwtMLvLx3VwV+SFLs5sTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771070208; c=relaxed/simple;
	bh=T0EuXyqZIYD9w1OG1pMXJAVZ7pF+UaKUPfpI/yBYWI0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fgzlo2rOjI7Bkc47UJngKtlA8p/FTeyOk8NUenKM+lmQi2Av7P0moc8U4M+n8lfbtWI+gP77l3FMuxb4nnj8fQ8s0TQcJBktUEUlcXJ6r/XeA44TpyE5z8R9gzhKjdyZnJzK3onQsuod58lc+zyniUoyUoHMDx2A67GoqehXQms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvoUaEuB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvoUaEuB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536EEC16AAE;
	Sat, 14 Feb 2026 11:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771070208;
	bh=T0EuXyqZIYD9w1OG1pMXJAVZ7pF+UaKUPfpI/yBYWI0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=CvoUaEuBm3hIsg63LhhO+DCkp1uSygjjZOBschImH4cpHGwguedYEgmWUx6XSD0jw
	 YSm4a8J/lssaX7mPVVHdJ6Tdk6zT1ppfvXLHQw3mg/jfwl61knf3s8a5AKIgg5T7YG
	 FwnDfvOAlTDoS0+AHDu6cwSzRgFEQznsd4zRHG7HztEw+Vym2KwyBjVhbb9aaBQuu3
	 sEG+ctzgHv0gVoVVxhRy+o2iD+JYss24apAZb0WGrYsFx6EjWK8hiThXz5YOVXGo+F
	 uiDPdUBUxsaO/MPMIdrwY+jYD12GaXeKi1vxshTTFy8Xk0hKCGoA9Lq2nIKbn7GHKO
	 euLfNGh6DOCwg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 12:56:44 +0100
Message-Id: <DGENZNRDFU2U.34JH68EN7YK04@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: irq: add `'static` bounds to irq callbacks
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260214092740.3201946-1-lossin@kernel.org>
 <DGEM0E00MCEP.130GP2WIISA3V@kernel.org>
In-Reply-To: <DGEM0E00MCEP.130GP2WIISA3V@kernel.org>

On Sat Feb 14, 2026 at 11:23 AM CET, Danilo Krummrich wrote:
> On Sat Feb 14, 2026 at 10:27 AM CET, Benno Lossin wrote:
>> These callback functions take a generic `T` that is used in the body as
>> the generic argument in `Registration` and `ThreadedRegistration`. Those
>> types require `T: 'static`, but due to a compiler bug this requirement
>> isn't propagated to the function. Thus add the bound. This was caught in
>> the upstream Rust CI [1].
>>
>> Signed-off-by: Benno Lossin <lossin@kernel.org>
>> Link: https://github.com/rust-lang/rust/pull/149389 [1]
>
> IIUC, the current code will not compile with a fixed compiler, right?

Correct.

> If this is correct, this needs to be backported; I can add the Fixes: tag=
 and
> Cc: stable when I apply the patch.

Oh yeah I forgot about that, good catch. I think it should be

    Fixes: 29e16fcd67ee ("rust: irq: add &Device<Bound> argument to irq cal=
lbacks")

Since that introduces the usage of the `[Threaded]Registration` types
in the function bodies.

It can also be backported further, but then it needs to be split into
threaded and non-threaded variants:

- 135d40523244 ("rust: irq: add support for threaded IRQs and handlers")
- 0851d34a8cc3 ("rust: irq: add support for non-threaded IRQs and handlers"=
)

Cheers,
Benno
