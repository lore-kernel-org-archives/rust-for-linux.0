Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A0F3BAD8B
	for <rust-for-linux@vger.kernel.org>; Mon, 11 May 2026 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487728; cv=none; b=ttEO9iQi1lpyubGSQ61sG3K+XHQXcmyMBWRquH/SK2+uyHLeTuThIZp/D1zUYrlAILdfJyKn9gmSsn+iIvU8YihMMRFtuj++LXhsj19cGMHjj9zkh641Zdn45ja1CwQYgfW5G3UTQFbw+/sb9Zwjvyt0QgrVvfXkJy0vUkvXJVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487728; c=relaxed/simple;
	bh=xxGTlnGfhdKoOL0DYOX91EbPCenUZRvvCeEUnu1R6q8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SX3V0CrUuDCWTcL3Furx4cYp6Sft0c9qrITCIg+Lip7xXN3yNRejV2dSPWPOA3bHng1PPsjk88+gZVlc3WiZdX2P5PKNDKe7Jt1cx84z+K9ylDj+TTAVm+9yNPJB+bJSFjM6OxGQwkGMTES8cQ2pn/efSVBzpRFFlcAbzehdDLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rPmvJQ7L; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rPmvJQ7L"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-44b186b715aso2557548f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 May 2026 01:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778487709; x=1779092509; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5H14eAjov8dp7zxAeJph/4QZj8xDXhb6FCjRwRisaFI=;
        b=rPmvJQ7LQQi9j2hlSQT9pGswRpRQJqeR+qti2H67QNYONDa6yr7oqg5j7LRQVcbkFP
         2zkaIDmPEM87I/gU9ag+/D2AN494+CQu0rKwLrk6v9UPW8WZgofS91REJNsLAwPcdX8k
         if24c0eaVnW4rbZwHQjwB19TsfnIiIBW465jwDOST8WM1KRAtkx+cfIdyGvqEPGgJ5MF
         TzLgPSgN1JkDH/xe8wgSiQ2iSZ/IqrQOIya5c8MO6br90OxmxgmmDAd9MxVX5Bl0YaGB
         vqnr1Z9LEFckkeV8x655f8tpmqezK2KSyU/aLsdNnWv+0NWLauOYGROEgeY0cPermpgS
         ti0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778487709; x=1779092509;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5H14eAjov8dp7zxAeJph/4QZj8xDXhb6FCjRwRisaFI=;
        b=hK0+yLECbdjM2H5O7CFjGkNEl4E8E2kpQk2Q6u6C9Y0Hd3Jljs/gAgieVNmq+0Qb42
         LyqtpBaXTlrIrw7evxVtX9j9GzGXxb8a2GGW7FXZqk2Z3ns3QqQghJn0gRe3oXRs9zbJ
         m7kCx7WFlFZuTN0a4kYoGnOpt0aHCf1opjsd8PZU7N2xEm4yOS3hylYDDp0bGrv1sin9
         jsxFgG7Y5CpYC5WHQ2kZK1HuyXCAvHN1Oq4rrx+Zh4nzubgdFtvOBeryWpGfa31rLb2a
         wNA+32nT1Ahbi2cErvYE6VQawI9NLnmAaycFU3eluXTKbV5jUMXC1xAkEFtyC8nWKCMf
         Iqeg==
X-Forwarded-Encrypted: i=1; AFNElJ+QaWjnyAnDom/XRkA4Kd8sbfU4HA7Fg2j/iQ4xfWKs1IzwpPbesY76NhTdBIfsQowN3h1tgNS4ov3Mvh8VlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz16TOu5wm5RSDkdYyy3qNC0HPVba/+WSkksnk+EiQTQiCIUKsb
	+He2cg9y9f7jcDy5lJ6eh8+pzXTgWp3xqxz0ScNfo3NZEGCpX7I1vtmpHA9IHjd1NTxEnQ1XXu7
	14iiLm72y9+T2K+Yv8w==
X-Received: from wrqp16.prod.google.com ([2002:a5d:4590:0:b0:43d:6f59:cbd0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:288e:b0:450:e5fd:e1a1 with SMTP id ffacd0b85a97d-4515b05728dmr36098093f8f.3.1778487708994;
 Mon, 11 May 2026 01:21:48 -0700 (PDT)
Date: Mon, 11 May 2026 08:21:48 +0000
In-Reply-To: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
Message-ID: <agGRnHVTLiwobb9W@google.com>
Subject: Re: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, May 11, 2026 at 05:02:44PM +0900, Nathan Chancellor wrote:
> When KASAN is enabled, such as with allmodconfig, the build fails when
> building the Rust code with:
> 
>   error: kernel-address sanitizer is not supported for this target
> 
>   error: aborting due to 1 previous error
> 
>   make[4]: *** [rust/Makefile:654: rust/core.o] Error 1
> 
> The arm-unknown-linux-gnueabi target does not support KASAN, so avoid
> saying Rust is supported when it is enabled.
> 
> Cc: stable@vger.kernel.org
> Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
> Link: https://github.com/Rust-for-Linux/linux/issues/1234
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

I would probably suggest moving the conditions out to a separate
RUSTC_SUPPORTS_ARM config option similar to what I did in commit
d077242d68a3 ("rust: support for shadow call stack sanitizer").

This way it will be simpler to adjust this logic when the target obtains
support for this sanitizer.

Also, we may need the same change for CONFIG_CFI too.

Alice
