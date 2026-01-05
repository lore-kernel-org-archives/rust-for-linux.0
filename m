Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66707332EB3
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 16:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630040; cv=none; b=Jk3nTM1Vwn0VNJvgGzMwJOd47BSF725ZloFGW72nrbbKP4Xqyr+J8Qwwt+MzcU07sSx+X4U2i7whWg/yz1gz7FquzNY9OjM0a2pkG2NP0ZdwCRjjw/AJvO70ByV0cWBPzOmYPCX0orl7BRGVpZLCSs2dRkRJdK++cwUGLjf/mQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630040; c=relaxed/simple;
	bh=TC+sIFUON9nVvmZpcFIsoQC9+ToI3rAy/sYlWEUlz8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O57aZVYsQPv7R8z3HKdNjZvotAdLAE74f4MoAC4+65HUQ2pOaA9sFNNUJGlQk/ZhORTLYhx5oIBkFQxjy/6bwkCD44g2HLgCtckOX75Vkq/42Gz7573F6+iyxD/eY4+05YmJ/TwNFeewVQQRabXZLvKChj0nQg/m5I/ipLzXF1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itUsbM7N; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itUsbM7N"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59431f57bf6so22643e87.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 08:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767630036; x=1768234836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJzjkm3pecgLjhv9B/Y7YFvMANhHKFZ3pW7TlSLWEvw=;
        b=itUsbM7NYvAdEY7D+r6b2ZlyoGfBmwEWbsfOVvW78wnNSPtdfo7g5rlrJ9QW6nMUM3
         FdG0xtO/R0uiYdsHNRX4gTdrys6vBaY3U9m+nMzHP/apSh8Td+U66ZtwLBCkGrYARdEk
         yeaFYKXYXGpIwar6hYlzcWEtHpHNq6/6P33LzZCoeuKodcPwBEBrO+lTOeglVhYxwzi/
         FsS5IO5Wgadc7jQdnH85iVYx+aZpUcnHiuW5aH6n628OExLXI/sGWN5zeqteYMsBhhL1
         PQBLhW5ZWBd65lcJmOwx9xBaXscZSJElOdKdtFyDVa1+iGxqdn5RiepKGDwnOxfjtscf
         jt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767630036; x=1768234836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mJzjkm3pecgLjhv9B/Y7YFvMANhHKFZ3pW7TlSLWEvw=;
        b=dFRf11pnV25hJsN2gvmqcb+IJxB6+xh7PVjUznbbcUY5MezPa7BFO0rNMte+ixfKTL
         +9V2yXpMhqFHTXSUGoqHOw/5rJ1iTDmdtcDzMUkzJ0jVQ2DtqTwEx/1IS71oCIVxpVlM
         +GNfad6Xx5RtygGfaoykOmF+gtbL5KH3CgtAVlRgOPt29DI2OnILpKJpVMa2gVhoKW4Z
         Q8KijHhWQwxkJNRoJWGbAA4GMEnvDgyHgCr8TFe4RGS8528mxtSwTw4g1s/erCn6B8Jb
         1TzozhLsf8PPpA0qkglA4F++rcGhMeig7oNgKMcLmaIW68y6kTKtzHtpwINBNSm6rtQm
         WqRg==
X-Forwarded-Encrypted: i=1; AJvYcCXCktImPBVmkJu7ez6K0N7CmHkC8aNm+eGM7OnBY5A6wybgt314zltyj53lYAPVWZLPdZHk5XMPKUXF9ik/sA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6AN3gnqZQxv7DileqbVVapMu7XAdzQsHXQ5HZGM2IewJRs4X5
	jIT2YrFPtWHKvdYfEXIHjfnOtHCNBKGy2AzDwrryrD0ZRnYwutNKzFRkawfNt6AzhFm08YnpAzv
	6UBTnbG8S/zN0MdL7+vlMnJAQUz1Vcbc=
X-Gm-Gg: AY/fxX6yD82HsLHVrqJdef9ou6MZ6Wr/WHDmzOSLa/uZnv0p4b/ZkFHx0ZHR55yjlq+
	TqBLnMjM7w/v05DKyZzNnN6FvZBf4Enm7ZuhEvjxHgemvRka41ktlQayRn0U1nFa6xTaUGnKgYm
	WIgd99Vi6oRWNhBcvTZE4MwtyUAOtayhtNc+VCyj1KUfdpzjJigxBZmElnshJ27ta6CplHTmtWz
	roXR4BZkRBx6A6ZUl2e9EthfzGqDJgix0jTvgqFvhDNwxf/qr2yGxW9tbB7tvaucS4c15fx3pnV
	T9F7PZgU++4+rg3AUgLDcUNHzCN9/ASsjUSAvbJVrI3xn5x3RWmWKR9F3kCBgacqV6E1WPP8Ajl
	CsLsg6MIB14R9hibSTnCUH+9VomP6wpVzm08vKSN3Uqf7EazMB/g2
X-Google-Smtp-Source: AGHT+IG5Jz/ag5o8sejFjKjJYkf9QzTISrKNSBIzM9XCKM2uAjGv2psf9FJzZqP5f/r0tsPt/8a9C/iuhthKF6gr7DU=
X-Received: by 2002:a05:6512:ad6:b0:594:25a6:9996 with SMTP id
 2adb3069b0e04-59b65279ee6mr84667e87.10.1767630036267; Mon, 05 Jan 2026
 08:20:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103-cstr-net-v2-0-8688f504b85d@gmail.com>
In-Reply-To: <20260103-cstr-net-v2-0-8688f504b85d@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 5 Jan 2026 11:20:00 -0500
X-Gm-Features: AQt7F2pUk6i6lWvK3YlDNQpXXEoolC-MQ1o1sooEnJ2c1np9nkuj4VmEjnNIWQs
Message-ID: <CAJ-ks9kKmT7AMbqgWjKvy13iQ8Qpiwi3NpGe=B-YbMS4ape8xQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: net: replace `kernel::c_str!` with C-Strings
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 3, 2026 at 9:24=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

@Jakub are you able to take this through net-next?

> ---
> Changes in v2:
> - Pick up Tomo and Daniel's tags.
> - Link to v1: https://patch.msgid.link/20251222-cstr-net-v1-0-cd9e30a5467=
e@gmail.com
>
> ---
> Tamir Duberstein (2):
>       rust: net: replace `kernel::c_str!` with C-Strings
>       drivers: net: replace `kernel::c_str!` with C-Strings
>
>  drivers/net/phy/ax88796b_rust.rs | 7 +++----
>  drivers/net/phy/qt2025.rs        | 5 ++---
>  rust/kernel/net/phy.rs           | 6 ++----
>  3 files changed, 7 insertions(+), 11 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-net-3bfd7b35acc1
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>
