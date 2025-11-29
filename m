Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214884A23;
	Sat, 29 Nov 2025 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764431201; cv=none; b=iR3luxvLb19riBvq9hDpyx4RBh9jqdd7415o8p5nH6gxfXzNEmGfUM3xQRXzQh2LxqqBDBYpCaS9z+p7dRg5Y6BpH4U6TqHuaJ3cW/xx0GJ5KPooZhQGDUbZB1p1CrUQQt2h2mI27uwbz/+5+zacjFSSP08lYZ7FPwc+ns+FNzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764431201; c=relaxed/simple;
	bh=Pu228IKjjP9wfLyw+qoHdP2x873bedNQ6c0tn8bGeJk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FQS1bNVyObbpX8EA22NuH09e4+kGo9iF72sUsbPnlZXdv7xA1u7ar98IqHnlo3xu1eD08hCcIH7bdb/UhJqVMuuLUz1my/tHc0HXhAbZKevm6XXFRTQg48tehDMjQCYyLcwq8t9mqxjS+BvXk3YOm3kKXBbOlH3Baxf3z2MzuZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dw2f4KLz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dw2f4KLz"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 41777406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1764431199; bh=DaBm0dYX+mOjDsOP9Q9L2WjGNrzHN0Sjw0foPa6Hwdo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dw2f4KLzwqvdR7OFLmCqrDhwjaGtUvdE93M9f8AAV6l4c5bThMcK3SSloeljCpDmQ
	 QEtdFnfTlKhyWzfoO76goajaxkkQjJJn+ctUFBjHHq/0TQy923XAuxC3Z34xCRhAqv
	 BTRdDZiOk9DapCx/iRsimJteUOKRRS/616RC+STJQH1xpU/3wb6VRUCXnbFxl/SPW9
	 LDF7lhmgNsrqPjomkeM9r1q6ReYdEHMVeqkJV84mibpGOuVpZyJLYy3rp8XrjmowDb
	 f9YiYufKScfdP3NUAXrv6p5RqNhy/3WduP/5nVXNEmoE4kRGTVQTl2UWK3GRl1TGYV
	 FK6nZDOaybkhQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 41777406FB;
	Sat, 29 Nov 2025 15:46:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] docs: makefile: move rustdoc check to the build
 wrapper
In-Reply-To: <c06b1834ef02099735c13ee1109fa2a2b9e47795.1763722971.git.mchehab+huawei@kernel.org>
References: <cover.1763722971.git.mchehab+huawei@kernel.org>
 <c06b1834ef02099735c13ee1109fa2a2b9e47795.1763722971.git.mchehab+huawei@kernel.org>
Date: Sat, 29 Nov 2025 08:46:38 -0700
Message-ID: <87sedwq1sx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> The makefile logic to detect if rust is enabled is not working
> the way it was expected: instead of using the current setup
> for CONFIG_RUST, it uses a cached version from a previous build.
>
> The root cause is that the current logic inside docs/Makefile
> uses a cached version of CONFIG_RUST, from the last time a non
> documentation target was executed. That's perfectly fine for
> Sphinx build, as it doesn't need to read or depend on any
> CONFIG_*.
>
> So, instead of relying at the cache, move the logic to the
> wrapper script and let it check the current content of .config,
> to verify if CONFIG_RUST was selected.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/Makefile          |  6 -----
>  tools/docs/sphinx-build-wrapper | 41 +++++++++++++++++++++++++--------
>  2 files changed, 32 insertions(+), 15 deletions(-)

Applied, thanks.

jon
