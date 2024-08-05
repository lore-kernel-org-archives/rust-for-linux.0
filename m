Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7A62AD13
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Aug 2024 19:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722884955; cv=none; b=X2xlR4ETEBbrjjPqHKVk/8S9i/COJMIR0NacC8fmmNfc/hQagiLhbeXY8NEeynM63RS5Z+tSoULDIMH8tTJCIz6duQvAal7oUI9UJXk+V59sSTXH87huSHui9GG8K/jxILT2qnmSEx2mcGrVX0uOfzO/eXmJR7O4vDXWDZFS3Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722884955; c=relaxed/simple;
	bh=M5JRShJqbgmvXTkDlI8gf8oSvuSeekCQVjuvxjJdMog=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRahK5YW0+uOwbrP+6wMDwa+2SYTgO8ddgWQnVwcACAicQn8tXFo/s0Hnupxskm5TbhqZsE7f2oeKY6p+TY1snl4AXtaiUf6urPso5t/rng49ynDu5CCQV6HWps0zMXs10QG8hwalqHYytLchXGnjr6uec8KwzdPAbWk6puLtSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=VZd0akI+; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="VZd0akI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722884945; x=1723144145;
	bh=/Els57fcd1c+yYHp4eDlQ/rjaPw7DrFzNZpvnboyUs4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VZd0akI+XxCM2CmdaEOjn1z1m9Ra5xe007WtyDeRSDHwGx53JpJ6vlZUzlTBumAsW
	 lBS8Ofb996YsVqYBf5XoXRjEY7CwjoxobnvQ48cbJ4nypmfglHsY1PkjoaAxM28gPR
	 9a4wh+rxXHAc3QtjIX5FzvPNrTudffRURKaXPUyKPds4v9q89r0B/AvTFFd2i5/T/G
	 UXnWtDSOsDHsTB+QH3jnfVyiUfBQWGeXnP5FjAXus9vkA1O2fXwpXA8Ds+n6CsJSvB
	 dzr3E3wAVZtgQsnYpEP1Bcu6pe0A5P4YIzErF4MBHAowALfXn0pgXCnSbYEtbVyZ63
	 3pAFaQALl2Uhw==
Date: Mon, 05 Aug 2024 19:08:58 +0000
To: Matt Gilbride <mattgilbride@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Rob Landley <rob@landley.net>, Davidlohr Bueso <dave@stgolabs.net>, Michel Lespinasse <michel@lespinasse.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/6] rust: rbtree: add iterator
Message-ID: <8a0f94dc-ccf3-4387-8dd3-9a3d39fb1959@proton.me>
In-Reply-To: <20240727-b4-rbtree-v8-3-951600ada434@google.com>
References: <20240727-b4-rbtree-v8-0-951600ada434@google.com> <20240727-b4-rbtree-v8-3-951600ada434@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8be4d92471b7c20941bcceeb879d8ff6bc908c6b
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 27.07.24 22:30, Matt Gilbride wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
>=20
> - Add Iterator implementation for `RBTree`, allowing
>   iteration over (key, value) pairs in key order.
> - Add individual `keys()` and `values()` functions to iterate over keys
>   or values alone.
> - Update doctests to use iteration instead of explicitly getting items.
>=20
> Iteration is needed by the binder driver to enumerate all values in a
> tree for oneway spam detection [1].
>=20
> Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-17-0=
8ba9197f637@google.com/ [1]
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Matt Gilbride <mattgilbride@google.com>
> ---
>  rust/kernel/rbtree.rs | 130 +++++++++++++++++++++++++++++++++++++++++++-=
------
>  1 file changed, 112 insertions(+), 18 deletions(-)

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

