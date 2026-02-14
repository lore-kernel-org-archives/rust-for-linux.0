Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE1054758;
	Sat, 14 Feb 2026 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771071507; cv=none; b=jR2uOOGzrLNPtkcX9ae4pwi6i13EdKuGtfgl07J4dMFE+NEOld/mj2i/NoUXf3i9sCtKntzxcqSkUqDL2YhPZxIZIhnePzG29sYpFB0NNRNn9UpmEBsPCX7RmADkepHtA+Di7MlThPuOXYCCFECqYUMKcBfi54mYyxwEX6JJbc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771071507; c=relaxed/simple;
	bh=ZCCgRQIOJevXTxSOzjI0fxdf0WC0ejnTPYVzpfhR93Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=t/Zr6L3cB0kfdVqmIBevw18LcyS+kZJRTTIoJRrEPj+RYk7KoEi1+YMNN4xCIVzTzz2++dsfdoqbDPrekpuFwBEXj/spm7GJouUmaqfBGsfL/xfFJQ5c/5rUQ2LfG0Q4QtLzy6BNMSdm234A04ok6XK9rvM4zuhfq5eshttm0n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W66e/Q3U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W66e/Q3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBEDC16AAE;
	Sat, 14 Feb 2026 12:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771071507;
	bh=ZCCgRQIOJevXTxSOzjI0fxdf0WC0ejnTPYVzpfhR93Y=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=W66e/Q3U4l0n8b47Yl7IbpAbpwBCLmd/cKZ5zRmw6MehnHurNFcCiUvU6yuzWbBBc
	 haVtJc26UzPHwGlk3QIrCApy6IQe0ggz8527Nc6SzaprkDArmMri9yhoMgZyJnvNB4
	 NYC4u+HbUeZ+BNnr7UhPfhTZnhh8+dJfXnY6GudGs87laHGavknOIPhjG+EgVN4jB5
	 syjjiilgvTVfvu8wEWl5A39wMtK4yuRZfxD5yv1UmG+2KOST8FBkE9e6PXsV1QNc+g
	 Mq0ayYu/+VJXATlWdaw6jpN/DD+R5JpO0lE+ApDftavii9dYAZ7svE9tWOlac/N/ax
	 3TlFLe6l8zNhw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 13:18:23 +0100
Message-Id: <DGEOG8J4CF1U.3EVS9UT98ORYF@kernel.org>
Subject: Re: [PATCH] rust: irq: add `'static` bounds to irq callbacks
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260214092740.3201946-1-lossin@kernel.org>
 <DGEM0E00MCEP.130GP2WIISA3V@kernel.org>
 <DGENZNRDFU2U.34JH68EN7YK04@kernel.org>
In-Reply-To: <DGENZNRDFU2U.34JH68EN7YK04@kernel.org>

On Sat Feb 14, 2026 at 12:56 PM CET, Benno Lossin wrote:
> Oh yeah I forgot about that, good catch. I think it should be
>
>     Fixes: 29e16fcd67ee ("rust: irq: add &Device<Bound> argument to irq c=
allbacks")
>
> Since that introduces the usage of the `[Threaded]Registration` types
> in the function bodies.
>
> It can also be backported further, but then it needs to be split into
> threaded and non-threaded variants:

All commits were introduced in v6.18, so technically there is no "backporte=
d
further".

But IIUC, with a fixed compiler, it also would not compile without commit
29e16fcd67ee ("rust: irq: add &Device<Bound> argument to irq callbacks"),
correct? I.e.  the two commits below are the correct Fixes: tags.

> - 135d40523244 ("rust: irq: add support for threaded IRQs and handlers")
> - 0851d34a8cc3 ("rust: irq: add support for non-threaded IRQs and handler=
s")
