Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34E02475E3;
	Mon, 16 Feb 2026 07:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771226019; cv=none; b=L2sR/GyGug9AUcpMMzGTO7Xq8Q62tDB6TA9q3WnB1OCcYJ9sqdivNeSdmjS4EswPR5fdid7OhufjqtrVAxvdzf6S/Ko/rgxSXQn1k94PKYP5Ay+boWA1bzpd5qX5CPREw0qmrfashyNJ/EmjcGIVdxK9GI9ffNV5qdS6pxesRO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771226019; c=relaxed/simple;
	bh=njd9zmg9FLjx8to7SOsETvlRnun7BFASOBU26aGIV9Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AYSrysPks5HtILieCYtW3Bg7jAuyaQ69lSlEJc3s9LhAO2ny1b/yguCFFILvb0QJd/RU2KB1NWUSkYdR9VEjVJ4vO/nZVjD6L4gZ26qnUSp+mwAP+AqPRnxwrrQGjyLa7w2GwkZCA+m24hiwfzGDQiLgPdlTAFsfY/2cPIjFz2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kD+z/RN8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kD+z/RN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B8FC19424;
	Mon, 16 Feb 2026 07:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771226019;
	bh=njd9zmg9FLjx8to7SOsETvlRnun7BFASOBU26aGIV9Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kD+z/RN85dbhPrYi1JfvrXiYMCm4UwMLi/suz+2mc99c559wx6UZ0O0SMfSrvqyLj
	 gK54T7aZwVzJioEGtEnxNg32zBZRXyze7b++rvEfuHObrinONyqrx7e03CVJS2ROuM
	 kS8uFxrWu47ISijmoORFEM6QVxb9prlNxJrXqW3ws493N/zRPOrz68ATRYbAbcFRCs
	 LcqkT9PxkNgTDBzbKypM2e2tK2TmeVgQSehsBjFZUPSMFmVchdiYIv17jtRKH9Ozs4
	 5KCSCDEOgTce6IEUgz/8VlxkdvvBDBgQ/KpnUH/1K274dZ9enXrwRTg3cIhRmQrM2o
	 OMk4vewgsggMQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add a ring buffer implementation
In-Reply-To: <5FC9A56C-2CC0-478E-B2F9-33C326C219B7@collabora.com>
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
 <pnCs7tr4HC4x4Q6QHj5MfSOQjkOJkoFHC5NMmJ4RpFXB64nd3ciS49MN2G_-z99jHJmu_OvlKDKhjx5A9M9eXA==@protonmail.internalid>
 <5FC9A56C-2CC0-478E-B2F9-33C326C219B7@collabora.com>
Date: Mon, 16 Feb 2026 08:11:21 +0100
Message-ID: <87ikbxduxy.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Daniel Almeida" <daniel.almeida@collabora.com> writes:

> Hi Andreas,
>

<cut>

>
> (sorry for the formatting, replying from my phone)
>
> We should probably make the backing memory configurable from the get go instead of hardcoding KVec. It will be cumbersome to retrofit this change later on, IMHO. I assume that others agree?
>
> For example, we can immediately use this in Tyr if you let the backing memory be a mapped GEM object. Having it be DMA memory is probably also going to be useful for others.

It should at least take flags.

iQe can make the backing completely configurable. We could have an
unsafe initializer that require just a pointer and size at the lowest
level. The current version is using array indexing to access the memory.
We could overlay a mutable slice on the pointer and continue using array
accesses. Or we could change it to just pointer offset calculations, but
that seems less idea.


Best regards,
Andreas Hindborg


