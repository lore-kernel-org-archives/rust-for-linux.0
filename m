Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4F03BD232;
	Mon, 23 Mar 2026 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283518; cv=none; b=N5FoF98Fd1NEhM9DStRoAJ15E1NuNq2hCcbk6skb8+TtrgYoCohdw5o7JaBVjqJtRFaZRm0NZPPXceQI9mKeZz7pVR1D2W3zIhe5rM3fMfs4uXHEL9QlEsRXmWex1UxI3AbqhYpTdY+jLQijozfIJVmGVnLtIDjU700CJAfOMr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283518; c=relaxed/simple;
	bh=rbSydu6aSB/HmG8vbObDXSBFhh6QzYXKDhoGhmfARCw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=gJAwi5pcuIzoaUP1t5DrFDfhfSNKoCdTQdtcRPsHAVEjiOLduCPNb4sMYhgXOikAtLTO0CU4LN/CMryVIFd7QpqBFgRp1aaaqLxoI86CErjySM9F3NO1egEO5mFP9RMtTussrcqIjcFWJx98Bcj4EiJxrBIL9rekQ1wDcWSwDUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlWU9HGE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MlWU9HGE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC5AC4CEF7;
	Mon, 23 Mar 2026 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774283517;
	bh=rbSydu6aSB/HmG8vbObDXSBFhh6QzYXKDhoGhmfARCw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=MlWU9HGEWYonIOkYMGW0JlAoNv/vYnoueDFqG2ZaJwKmXcou+VDqXg0DmpzJf/MSc
	 jWpgRHyE11c2Q/qEWFM2/J1qnOIZ3H+Vyq8LdrXjGC5zSCyfFXFsUcLB+jEWeMflxH
	 7ROW5fai8/Oxb8uThVMSlf+cqYA0Imt7AIqRE/mA02ucgbqFnbkbp/uiZoF2bQ5p1Z
	 MG2pCALR59D4wsU1ond2dCFIzI42++Xbpe2c6CBDnmEWwgBLJKA5fMkUCeXHHOErD2
	 9ZAPPhOqtvfM9lFi/WAovVK7uMWXcBrhN9cXgOgHSLJfcbiJ8JU0nFqb0jZLiNt0qE
	 9uvu6Tr5BcvTg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 17:31:53 +0100
Message-Id: <DHAB0HOXQJIV.2ZRJ1VMNEIEA6@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update Rust I2C Subsystem entries
Cc: <igor.korotin.linux@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Wolfram
 Sang" <wsa+renesas@sang-engineering.com>
To: "Igor Korotin via B4 Relay"
 <devnull+igor.korotin.linux.gmail.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260323-update-rust-i2c-maintainers-v1-1-0744ce44f846@gmail.com>
In-Reply-To: <20260323-update-rust-i2c-maintainers-v1-1-0744ce44f846@gmail.com>

(Cc: Wolfram)

On Mon Mar 23, 2026 at 5:06 PM CET, Igor Korotin via B4 Relay wrote:
> +T:	git https://github.com/ipv6forever/linux.git rust-i2c-next

I assume you plan to send the corresponding PRs to Wolfram?
