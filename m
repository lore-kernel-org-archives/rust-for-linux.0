Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20182D7387
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 08:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766477074; cv=none; b=Az00H83/z0WkxZ20RCENyLRdLW2ZWy5q8JDhH2NYVthC0va8LMXLrRNLmdlExPENfguIT5XmRJvPInSs6N9kEAGZ/LssHKRjuvl8ZxNl+qUIiOOv1nk/ZlWiMI6VjoyLnjJBgUx2fW0++/ioUPTgl3XWPkVPxGX8Cl9bmuoxPps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766477074; c=relaxed/simple;
	bh=pzI6MFBD2HfNW/UVss9pCSvhJMAZMpDILf8VJQt7sa8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=kLp1ReGlEn0PblWDoVXRxiUtNCQ0IVRZVTjDKVRaONfuMhqX1lMRhDGVdixRPOlOBdiDo4RC/Ygw8OvYlji18RW5A4h9T/f0KN7eeeSnw+m3DOha6TEf/2YeEByOGFNechw7evz2Tt7Bq6DP2e7dbnL/zu0tZNvwtwshcw6RpHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nu7AtV+V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nu7AtV+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25D7C113D0;
	Tue, 23 Dec 2025 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766477074;
	bh=pzI6MFBD2HfNW/UVss9pCSvhJMAZMpDILf8VJQt7sa8=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=Nu7AtV+VBxedHoD1NX4xmTCSDHHfavxn+HxJutDFhc2IsYkcOHTiJgTWGwOwEecgJ
	 TKPmoLymCLwjy4fhPqEyIxpAF+fPHSOZbiGgFHb70saSD85goKwm/OcxUPqBoSu1tG
	 SyFIXpHp/e2GivdMQU0PthsFHVl5f6j1HywQE5I8bTkSgKwocLEcC9ogeWxr8yieos
	 Z+ZIlZwCkfcmQX6y439ZSPa6wCAhkUNUBogxAJxI1WAyB9F60P6wRVfxt4Wa1bcEtP
	 biq80NrGw6ERAM9iIU0Fm/jWp1JyAu7DgI30PtXWDv0MRVIIGQ//Caj9XYYONzON19
	 0TSbRh7UDMwtA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 09:03:02 +0100
Message-Id: <DF5FTUW7WN59.1YJXZUL5F5LD5@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Ke Sun"
 <sunke@kylinos.cn>, "Gary Guo" <gary@garyguo.net>, "Trevor Gross"
 <tmgross@umich.edu>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Tamir Duberstein"
 <tamird@gmail.com>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: fmt: reject {:p} format specifier for raw
 pointers
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251223033018.2814732-1-sunke@kylinos.cn>
 <CANiq72nZp-ULXMV9yG_PP=gkr0HUPTcE6ZRQhtgRp5Zk5SR6sA@mail.gmail.com>
In-Reply-To: <CANiq72nZp-ULXMV9yG_PP=gkr0HUPTcE6ZRQhtgRp5Zk5SR6sA@mail.gmail.com>

On Tue Dec 23, 2025 at 7:41 AM CET, Miguel Ojeda wrote:
> Regarding the patch itself, ideally what we probably want is to do
> something similar to the C side, i.e. by default hash the pointers
> like C does, and then have an explicit way to request the real address
> when really needed.

Could that just be some kconfig option or do people want to do that
without recompiling? But yeah, as always with these things, we should
use the principle of "add those capabilities, which already are
available on the C side to Rust".

> For the real address case, we could require wrapping the pointer-like
> argument into another type, so that it is very explicit and opt-in
> (since having our own custom formatting is harder, though perhaps we
> should finally look into that -- Cc'ing Gary/Benno may have some ideas
> in this domain).

Well, we could have something like `PrintRealPointerAddress`. But if
someone would really want to print the address of a pointer without
using it, they could just do:

    let ptr: *mut T =3D ...;
    pr_info!("pointer value: {:x}", ptr.addr());

So unless we also have a lint on printing `<*mut T>::addr`, then I'd say
it's only useful for people that know of it and reviewers still need to
be on the lookout for people trying to print pointers. (but I guess this
is similar to the C side, where you can just cast to an size_t or
whatever is the correct thing, right? (or are there lints for that?))

> Otherwise, if we land something like this, how does one print a
> pointer when needed without having to manually replicate the
> formatting? `:?` perhaps? But that is almost as easy to make a mistake
> with as `:p`, so that should probably be included. It is actually what
> was done in https://github.com/rust-lang/rust-clippy/pull/14792, i.e.
> both are caught by the lint. Cc'ing Trevor who was involved in
> reviewing that one.
>
> Speaking about the lint: since it got implemented, assuming it works
> well, then we could just use the lint, which allows developers to at
> least opt-out when needed, e.g. debugging, until we get the hashing
> etc.

We'd still need something for the older compiler versions, or is it
enough to have the lint in the latest/only in some stable releases?

> Finally, when the macro shouldn't work, normally we just panic the
> macro, is the `compiler_error` meant for diagnostics?

Emitting a `compiler_error` normally is more ergonomic wrt. diagnostics,
since the erroneous code still gets emitted, which prevents other errors
from occurring. Here it probably isn't necessary, but an example where
it is important is `#[pin_data]`, if it panics, it also doesn't emit the
struct definitions, leading to undefined type errors everywhere the type
is used.

Cheers,
Benno
