Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B740169AD2;
	Mon, 22 Dec 2025 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766385413; cv=none; b=PsQ7raKzMZCjgrLJy1CUFeYluY7DcX4w9LKHEUjemVnC2qE/qUPEgWpS6sNlpDsfR/B+yrLXUI5RYuc0FxFFiwQB5N4n4YjsfClqxaVQ3eiaLzaxoQcLvlIZwKPRbUgOOS8dQsJqx07NIL6lPVS7VwlO0TRCROlh6PPF6C8NUak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766385413; c=relaxed/simple;
	bh=MiGpSuDab+6gvrPTkpVEa60cYu2fHp6va8S+eaxmzrk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=MLk45UsJAXZCdkTn6+cec9VpO77buJrxvb5dGBdBL1gtOYg3rHU24JAeQWmQHLkV8fwkriLOinO7iVlGhT9f6nz6kyqM+t9QqKRi3m8mSHjq2Wl/sHHIW1kCT+dqJLSVQcg2NHpJBXVFOOy4n/vIvqq/13PTVqtmGsYakkGpH1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHzijgJh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHzijgJh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB086C4CEF1;
	Mon, 22 Dec 2025 06:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766385412;
	bh=MiGpSuDab+6gvrPTkpVEa60cYu2fHp6va8S+eaxmzrk=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=iHzijgJhtRTAwEkJee+xzgsmy5r4w+rfC9YvbuVllWuY1muMzIizqBDGVU4DwYfLd
	 rWfptVt8saNmFLwjCaVjvcx0rSm5MdTVF1AQ9AFsgbNCJAHkhpS2w25UmY9irg8HBu
	 eQsWRTAROSC3bsbAOCGdEaxDI8/eVkcBcDn2mofIbq768l1q/CQAXUSsDcJbPawZxq
	 mv9MoWBCm43SvCfPG6P5hcjfGbKdbp/eUHFTVG9P5tzX3419baUf1onTtUnrps1XQ6
	 Q8+1h+oV6++4ysPQN/kCgIAP2d6GHpQsrLiADm7L+GZrJYESfFWxvOPOVPE1oqr/dj
	 oUKs80qJLy8lg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 07:36:48 +0100
Message-Id: <DF4JDA84MLQ4.30LLCBXJWS7MT@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Guilherme Giacomo Simoes"
 <trintaeoitogc@gmail.com>, "Tamir Duberstein" <tamird@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/11] rust: macros: allow arbitrary types to be used in
 `module!` macro
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251211185805.2835633-1-gary@kernel.org>
 <20251211185805.2835633-10-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-10-gary@kernel.org>

On Thu Dec 11, 2025 at 7:56 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Previously this only accepts an identifier, but now with `syn` it is
> easy to make it accepts any type.
>
> With this change, the span of types are preserved -- as a benefit, Rust
> analyzer will be able to use the "navigate to definition" feature on
> type name inside `module!` macro invocation.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  rust/macros/module.rs | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
