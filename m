Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3EE27462;
	Thu, 11 Sep 2025 21:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757626361; cv=none; b=Olq5Gbcx6nPpDPbYF6XwNhBYeB7w1iOxfLROeho/oMPVzAUqnHKNq8GYzZz7rDWMtkoYAFs2QpKyzPmfZsux8CusfF0FSb6u67Ik0pamRxn1N0s29Ulw5bSmrClHjVxZ24dZkpAeAXtNbOs7KFAx3vLU1//29CKzm/iZX9G56no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757626361; c=relaxed/simple;
	bh=zHKQ/lJZZHwmGkoSwM84pB95zih0+MaHIVZV9oX+bMw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=CT5Jh24wPfPZ/MrP1JQxYmwWcElQJMvWRWAXKG8g12f78jDF8qCqnPJFFtCcKdeuuoORjNJeKz5wk/7YJon2t+RiNlSIKaucqIXG9BAgkUdyrbQPISfFK9UjKAKb3XZFOvTllo7zuoZ9Lpkn4NHKkruyBeeruBzRSz6rVePNxSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sUJQT24V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sUJQT24V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D22AC4CEF0;
	Thu, 11 Sep 2025 21:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757626361;
	bh=zHKQ/lJZZHwmGkoSwM84pB95zih0+MaHIVZV9oX+bMw=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=sUJQT24V8DEAH7XQiJSliUbDTjdO8Qt7nI4MKf0hr1UbVV/WD6tfiy1qiwMd0LYXr
	 QYNjZOC2jDQEodBE4c63rMT9tVBUE2WIYog9LZREwENnwFFQ+Jj9aEJXyG6IVAscuT
	 gNStyH8PGpP6czaH1yRol49RFxm8I7ssWKoMrOYwIjJcfB17lFzq8rGgafIqLLRe9Z
	 KIxI8wfhn/S7O04jiw0mBA7YpHQVHYellF3+13xqs6UP6CYs7OQbApNxWyyaL1xr+x
	 wliZUBBbmUWXImQOi3FWjCwYzpxHNTuJ8hPtfi9Vja/PstPFmMceW5mk4SJNP60CH6
	 zr148JCJ1x4OQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 23:32:33 +0200
Message-Id: <DCQAJK47X6N6.34J94D8MPZARW@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: pin-init: rename `project` -> `project_this`
 in doctest
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20250905171209.944599-1-lossin@kernel.org>
In-Reply-To: <20250905171209.944599-1-lossin@kernel.org>

On Fri Sep 5, 2025 at 7:12 PM CEST, Benno Lossin wrote:
> The next commit makes the `#[pin_data]` attribute generate a `project`
> function that would collide with any existing ones.
>
> Link: https://github.com/Rust-for-Linux/pin-init/pull/75/commits/67fc9031=
2149fd797078578612aac83b459a6ca4
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Applied to pin-init-next, thanks everyone!

[ Removed spurious comment in patch 2 ]

---
Cheers,
Benno
