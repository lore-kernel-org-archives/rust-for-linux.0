Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E593F81724;
	Sat, 14 Feb 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771073364; cv=none; b=SQEa2JSI6TenMRCZiJSKzzwqS3VLUtZfUpxwm8yanXarF257dOgs3jjZVgnpKR9U2ff1FvLbjdvG6JqSu7SR0jQNotyJ56KTMPgKJRVEn/bp4R3+2DxzXB2MRw4+SyOzR6NBYWOXfWf1hpVVdRkjN6KJ2lnIpv05D1MBQzQiziI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771073364; c=relaxed/simple;
	bh=bYgCNpkwue6C0EW0TSwpNsjYcvyP6pnt8Q5YCf3N/i0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=BePMncAodqg+rxF0xDZh1RCAU+OlvXVc0sXYyHDlYagRqxSEd/CiyQQDnmWIomF24qHUymKJMLpUfHmRFVbF3pONgBGuqCJrt9SP/13I8ERnyXe+aobjzR0i86F6lZg/UDzPOCLizrDwOmcTEOFdiOWib69vm/vaBRz01IJcQ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJEClmms; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJEClmms"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611BBC16AAE;
	Sat, 14 Feb 2026 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771073363;
	bh=bYgCNpkwue6C0EW0TSwpNsjYcvyP6pnt8Q5YCf3N/i0=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=lJEClmms/zgI8uNUp8IVAoRCAG3uXjO4TcApy66qAJMk8v7suokkQPEcnAqsBnjah
	 9vgSEcCfo2SEfWmLlutKoJ+kgYlh/USlaBu7GwoZHvatFPWYBjK8JH3wgfBQaBoSpm
	 93lyH4LjJ7X7Py3xgX+YTJcdKKAWKrtteH/kP+IzgdYa+/UtN8Qz7aBGHNMTnchhZV
	 dOf50DyqCKNhayso7uXt9z8dPLHsGZIVOEMXwK7OWvfGYiSjzAaSmwwhfgMuZJKjdg
	 bi1W8POSatkAXsVrcixKPRVDL+ewupm6NGfMyZOgMRiYUah1fjKvFMhBEkKjRq2hYx
	 vyMt0bz6KGTtQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 13:49:19 +0100
Message-Id: <DGEP3X3WQROR.26BFH2XI3XO0R@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: irq: add `'static` bounds to irq callbacks
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260214092740.3201946-1-lossin@kernel.org>
 <DGEM0E00MCEP.130GP2WIISA3V@kernel.org>
 <DGENZNRDFU2U.34JH68EN7YK04@kernel.org>
 <DGEOG8J4CF1U.3EVS9UT98ORYF@kernel.org>
In-Reply-To: <DGEOG8J4CF1U.3EVS9UT98ORYF@kernel.org>

On Sat Feb 14, 2026 at 1:18 PM CET, Danilo Krummrich wrote:
> On Sat Feb 14, 2026 at 12:56 PM CET, Benno Lossin wrote:
>> Oh yeah I forgot about that, good catch. I think it should be
>>
>>     Fixes: 29e16fcd67ee ("rust: irq: add &Device<Bound> argument to irq =
callbacks")
>>
>> Since that introduces the usage of the `[Threaded]Registration` types
>> in the function bodies.
>>
>> It can also be backported further, but then it needs to be split into
>> threaded and non-threaded variants:
>
> All commits were introduced in v6.18, so technically there is no "backpor=
ted
> further".
>
> But IIUC, with a fixed compiler, it also would not compile without commit
> 29e16fcd67ee ("rust: irq: add &Device<Bound> argument to irq callbacks"),
> correct? I.e.  the two commits below are the correct Fixes: tags.
>
>> - 135d40523244 ("rust: irq: add support for threaded IRQs and handlers")
>> - 0851d34a8cc3 ("rust: irq: add support for non-threaded IRQs and handle=
rs")

With a fixed compiler these two would also still compile. It's just that
the callbacks will only ever be called with `T: 'static`, since that is
a bound on `[Threaded]Registration`, which stores these functions in the
C side. So from a purely no-compile-error perspective, 29e16fcd67ee is
the correct fixes. But from a "good API design" perspective, we could
choose the two other commits.

But since all commits are in v6.18, it doesn't matter all that much.

Cheers,
Benno
