Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2C4383A5
	for <rust-for-linux@vger.kernel.org>; Sat, 30 Mar 2024 11:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711799934; cv=none; b=sITgGERyKASDKFLI4wz9/zTi99cuiQ13j1pPq92D1XofYUwiOn5HMFadZH9OxT1AjlZ8MeoIVWg5OJEpZXgD5f9E3iUmJwFFi/Xh20SMZ6Jee6IRWaRoZ96g5yqL/U72k7GuR5owy2Q86Sk8zJGgTOtOxgkvRH2rKwCbFvFTswg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711799934; c=relaxed/simple;
	bh=kiSdp5wgahJrdAgVwOmpWR86ieCs7wkic4oDURmLcZM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pmaD8SiqFuD1ksfcu+DgRaf/nxfERhgdJxdRqC+NUCXEcc33Vy4TnX4HExTLWXS67P6Y+EXNvAYM1+DeEHv6ngJf0sQ0wsZJgyyki9HMbCjain/AH8svwM6FdE7snQAMrrGonsq6e16moTtHUFLnC6HeCRg7/9HR4iphTm0TYnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=nsru7nrL; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="nsru7nrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1711799930; x=1712059130;
	bh=u77fpTTMNz3LT1eN+TJD4Ft6+92v6mNwqOjQGXSD8MM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nsru7nrLnxNc1XHi8AxKUUmTDdAi6XJlrMNKNQLwHlXZE97IcvE+2p/84IfZsnu9b
	 498n/qEWieuUy9NAVqnp8EvhI9F3Wkp6HG1uC4Hgyhym2ewbrUnEYlGVvANdtZRR7B
	 80p4JVOQ3AAkig0zyYJGx8KMOQ8DSVx+62ARyscil/GkHcgnvYuO3lXEGL+UNCPjR7
	 oQae3IoDbXnsCMt2r7XczLVC2UPrqctrj0orRRzisycqe9inEIzibkuIjnkQwevBFA
	 +RS4p6KxweYrLY2MmB0HC4R/GYxTGVNf/vTyqzw3j7jX3F0e+l52vrvWTDgK8kmLRc
	 eB7SikMKryy8A==
Date: Sat, 30 Mar 2024 11:58:46 +0000
To: Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [PATCH v2 2/5] rust: kernel: require `Send` for `Module` implementations
Message-ID: <f0606995-18d5-4663-9882-a8349bbc1328@proton.me>
In-Reply-To: <20240328195457.225001-3-wedsonaf@gmail.com>
References: <20240328195457.225001-1-wedsonaf@gmail.com> <20240328195457.225001-3-wedsonaf@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28.03.24 20:54, Wedson Almeida Filho wrote:
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>=20
> The thread that calls the module initialisation code when a module is
> loaded is not guaranteed [in fact, it is unlikely] to be the same one
> that calls the module cleanup code on module unload, therefore, `Module`
> implementations must be `Send` to account for them moving from one
> thread to another implicitly.
>=20
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> ---
>   rust/kernel/lib.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

As already said by Valentin, this should go to the stable tree. (and
patch 1 should also go to stable 6.8.2, since IIRC the phy-driver is in
that tree)

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

--=20
Cheers,
Benno

