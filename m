Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C692323AB90
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 11:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767526669; cv=none; b=Lst3HMuNbmABzpNPWKFUlYsK1bHCFzeZgmcAABldkjld2HuVXmeppS0RyUdPlvkJjgUsf3BbS8ryapAeSF7BrPQJVT2HIuOWIHjFb68MbZaWD7ZrLK57m+d78KdXNX4wGP4vZxbc/AIdIuRKm/DNVh24Uoe62LoWJmhLE2y8IRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767526669; c=relaxed/simple;
	bh=KerBeXykzZU7XHQB5Q3TinX8LKvJ9sxVKbdnkQbahpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g29sMALa8GMkgqY9Ci5gDeyCBcHYLxX+m4ieEtWMy4db5qE0cnSI3tT7Os7XuvlU1012qIAtDzy2LDQ303kUb2X4fssvOm8hCObFIJZ7buN/oYrI8FGe5mhQInI2+7uGxIWfLxGfBiLWTfzr/2UwZ4uoHdlMq9egtqlbDZPT6lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efoHC7jq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efoHC7jq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a097cc08d5so35311365ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767526667; x=1768131467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KerBeXykzZU7XHQB5Q3TinX8LKvJ9sxVKbdnkQbahpg=;
        b=efoHC7jqyBI+/PSPv1Dmx+WoklK+WNulNhmGp/4jCTxHczXIj65SWKofkB71Z+V2/t
         OwwWS71CQsV8iIDQA6LHCoIRwyeiA3qoZAMJuCGzx2VX5DuiExY4SkliVjaJRP34nml1
         ajgrEG+eCBtEe3/CqMQBoGj/siDBatzS0cMnVsrP5u4e3UY3t11cQgqhqII1JBFHCVmc
         dOHdkc7/VnAbzacyPqdlTLPgURMr6+NN8a4EZ7SjYkaLrUg4cT2E+WgMKQPOdq8Uj27D
         2jO5yOdHW5ofegC9qllSCLCt1Kvj4TLlw+dRvXVGxQO2d+HBFHwsWFs7MuyGGlaye9WR
         nDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767526667; x=1768131467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KerBeXykzZU7XHQB5Q3TinX8LKvJ9sxVKbdnkQbahpg=;
        b=IliS6rLiHtjCGGiQLXB+vvg9tr+U+eULJhYmxdQXC9//abyZW+tO0/vTch/w8kICDT
         fddqZO4lZcBsWK/LuP0QjFyWj5IC8l/9bbb88B2IABV3k9IqmUhNiY+PhFrViIH3jA9O
         GOb3ArpBLGETuIhlh/zehIGysue01WFPwr0WOAn31p0rNKXFXhuzNswlp7B/oZsm6G6M
         dAFKAtdhM1G5pEf+heDPEa6v7maxPmC2uFXvbyX5Qtz9NrrdRR/FRrQ7UmSWlOlBHXL1
         lahFDuJZvf6m//ur8D0yLrluYqzHJ+1ohqKOy73yQ0iRzKdf53QOHF61WMrw0CI2ZWeE
         jakQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi3R9RMQYea7qLqafrgj1Ey1az51Tv08DvaueW789pYhufJ581eG98Vg8Lx2AvTjrRBTpnFHRk4CzrszOh7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWA9Av0xo2KBwk54+7B8E6QTwZ1rH6CdiBvuJ19jBX9SWF3LXQ
	qdqWvj6W9IqZMcfsFNBt7hNyo7UeDW9tIXXLIhkRtfcl/qR1PrJF5LiLdeinuAUEiIjp8nSpaHG
	8lZQI9TXWnOeIo8iW5mD/4j87StK5/DE=
X-Gm-Gg: AY/fxX5zFyfEKWi1u2MRcl+56B24hucmI/0/UN5NUTa7XLAHcmcEJRL39XlOuT21tA4
	F/KAzGwY2cZ1SBYqzPXPHkhXI8QK/JvQ0QYXkMqF9hCyWY9MobY7RTKpPK6jVhBqv/hJDfVtcda
	s7vH/3A5aTWBn78e8jmkWP9UmrRG8rkBviwtrlPt/q1vybzoL8xErsBwgQqjRSSmcV/4nHaL9Wq
	0hlqYbGZTdWqMjEau9Tqa1VaW0V+34N0f98KZQRi69ZkAZqE/u0m7ijwjDpT+AP7/zNLRi63qkU
	Pws1pcpYnlJdBbgi/p6B/W/T1Vkd/VUuKRPHkxD2arFw/yUIrQFIyd+vczGlGJbYPJnJjT8LKPa
	bDknlF46/JlmiZCREM2kZFVw=
X-Google-Smtp-Source: AGHT+IHJQEfYQFYZCHzNaVYaf4k3PwBgQoDrwPUb1CfbakNqeVpCekMP7uMBgMpZwaA+4ojXGIVTsIceJ9QQJeaSbf8=
X-Received: by 2002:a05:7300:84:b0:2ae:598e:abea with SMTP id
 5a478bee46e88-2b05ec3d4d9mr14991634eec.5.1767526666913; Sun, 04 Jan 2026
 03:37:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104060621.3757812-1-sunke@kylinos.cn> <20260104060621.3757812-2-sunke@kylinos.cn>
In-Reply-To: <20260104060621.3757812-2-sunke@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 12:37:34 +0100
X-Gm-Features: AQt7F2pZYq5M6PhTWyxgL5M6Y51YsXWLnwohh8uE2ggZM4GujkCeu1vdns_Hkl4
Message-ID: <CANiq72mjhP6UDqCadpunwgi0cu-V8vzFqVyUAuy4_wueO1ccPA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] rust: add AMBA bus abstractions
To: Ke Sun <sunke@kylinos.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alvin Sun <sk.alvin.x@gmail.com>, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 7:06=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> Add Rust abstractions for the ARM AMBA bus, including:
> - Device type wrapper for amba_device
> - DeviceId for device matching
> - TryFrom implementation for converting device::Device to amba::Device
> - IRQ and I/O resource management methods
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>

Cc'ing AMBA (Russell) -- it is Odd Fixes but he should still be in
case he is interested.

Nice to see AMBA interest again -- it was one of the first, years ago
(https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/amba.rs).

Cheers,
Miguel
