Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9762217727
	for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 19:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838281; cv=none; b=oq2UFJYcKwqTh1k12k31GuMl9j7wWdcX8FIS+WNOmilndl47rYsSQ3Ro15WQxdfXHYLcb7Mm5vQAv1aiH+8DoXciDaXD0LsDvDgtPCb17iNb2whoF0qhDChGy+iJ48d6HYO33Tw92uo64etbOXB9qwGaf4+GdikmZVLTS4k0pso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838281; c=relaxed/simple;
	bh=WkedUkF9mq+XlA/wnL+9O4N3eIlO5nCIzGJiZfRCHpE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eRbFvcTb9fukx+LjZuIGmeyLtO3SnYeIFNRWAcHWwdNWbOWqANFMXIZ2VkLfpfdvaDLfj3zACFSfnLsQekSMDZKY+Yn0Xykd89oe3YGa+DNqrztPfcMWKVWMv6WKUT3Zu0Yc7WNnbZZ8ZlKWc6pQGbH1p9RRPby5HjVTHeoICNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=SeTZIJpZ; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="SeTZIJpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1716838276; x=1717097476;
	bh=WkedUkF9mq+XlA/wnL+9O4N3eIlO5nCIzGJiZfRCHpE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SeTZIJpZSpBvLscS2gvC8Kb5QzaajdB89Ljy6yFGrmh10EVM92VhVoPbPjpRnuvLj
	 jgCCHoCe1uhPXxzN0U3zSmid/kfXrpN15wSqhIdVMU305TY1q1YNTWpv3HOaWsJbWD
	 9L2luKzDE7+ZSRNPWKndataOuH2sE69nx0izbEXkvos+vSJ2nPadhwXMWFgLxFDY/l
	 5+dOyCBGbK23XwsldSRnELVLDGq4NMXdkT1vixqQLa2xWHWfhf0vSAS9e/oV+T7lj+
	 AB+dXQMnN6STy97tHKDzTpQ13jZbbhhX2vHdHLlHZIXnD095Tn1lqAZ5o8cmwPhjje
	 7gINW5/gbTPAw==
Date: Mon, 27 May 2024 19:31:10 +0000
To: Aswin Unnikrishnan <aswinunni01@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: add example for `alias` argument in `module` macro documentation
Message-ID: <c2d845a0-11fd-496c-8436-1168eec4d540@proton.me>
In-Reply-To: <20240512112324.8514-1-aswinunni01@gmail.com>
References: <20240512112324.8514-1-aswinunni01@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 89cad7aa612ecee814cb876e8ec54e0eaaf6c59b
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12.05.24 13:23, Aswin Unnikrishnan wrote:
> Add example for `alias` argument supported by `module` macro.
> `alias` accepts an array of alternate names for the module as string.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

