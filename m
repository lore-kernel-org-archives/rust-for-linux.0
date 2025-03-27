Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5501D15442A
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Mar 2025 22:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743115314; cv=none; b=rieNW/q9Kmh1N1pezTJA9jHxycWS3dVOtVKLKwLoNNsUgQpsm+y+ukDyQVYm/Lt8su8vxhRkTiQaXw5vk18MgxPa74cysI0FcQzxDKer7FFgzW4MZ4f4u+dm9NKyDP1RXMZiSVP+ElQrMLBOx+zNyqJTU9vwIQKoeTQYfsEQAh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743115314; c=relaxed/simple;
	bh=FBx4nKK3OEmgGkauAnRAkTqtUoasdBg2C6ihvzQ6Yqk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fuONNRes6CDBbQ8aX3HiLYDKlpZGosES0DuZBnPe/nQUgDnhIo2TfPokkXpGMp0EyZ1peNSUEuyVHCc10utu6NokPk4aj1pdsw/IxgEKDZQy0sIJx129YpGUYK8/OGDP4cBwYDFTzGtomy29hCh4fM7SiNs2F89uU4CuLJ7Q4rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=e4/pzT+c; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="e4/pzT+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743115304; x=1743374504;
	bh=HhkSj+DmQtbL6xk+beVl0PqyK+XB6QIVL/GjBE8hJkk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=e4/pzT+ckmfFs6751IGeIB2W06tef4I35e+w4zSlAb3Nnv7MZDQZRs8OMJzQ3yZ7a
	 6GqY0Y2sH+fgA7P+7kJ/b419UNlCe0B2GBdaTv0okZYY52z3k7H2/STp7ZZhkDfKCm
	 l9Sd39L+L9pZktsYKLHm0o29Ga2qnNhhQhP2vegQxdfOPCjv85hiwus6tL8HpthAqc
	 cOXMF4iE8FkmfXqIhTKp0WAXUW7Ds/lKfG7WNB3FNPHDcvZfgNqEBsVE9wUvtyRJpy
	 gkLE6z1mWfWYyJgAH5M8/gSCplgI7ci8SBvTnrvFd7w8pTv74m1QKeKTxklgGtD5J5
	 ovl5CDTU7577A==
Date: Thu, 27 Mar 2025 22:41:38 +0000
To: Altan Ozlu <altan@ozlu.eu>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4] rust: static_assert: add optional message
Message-ID: <D8RESWOSOSY0.1W6K6HZ4IMIQI@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8be09d83505c8faed6c424b0df4e3cb87e12c49d
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Mar 26, 2025 at 9:25 PM CET, Altan Ozlu wrote:
> Add an optional panic message to the `static_assert!` macro.
>
> The panic message doesn't support argument formatting, because the
> `assert!` macro only supports formatting in non-const contexts.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1149
> Signed-off-by: Altan Ozlu <altan@ozlu.eu>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
> Link to v3: https://lore.kernel.org/rust-for-linux/20250325211011.1093374=
-2-altan@ozlu.eu/
> ---
>  rust/kernel/static_assert.rs | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

