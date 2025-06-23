Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C435423BF9B
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Jun 2025 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678785; cv=none; b=d2W9YU91G1OKbwsIT06UN+8SMKTpAjxeFkC+7HZkBkAwA9m9KtuwwOLyoOnQk3iVKvKiXheeam8w9ugULbTATbgNGFvKArRdKgfqLNvtNNBtKfgnABHPxZ6GXGI+AsiIerW251r0ZV34JYdRUgaLd1ZWxtkWwBJKfNWkxJpTgLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678785; c=relaxed/simple;
	bh=WLxkC7V19D77AzPdWZubB6l8aqMizd+u3nLpk+F8nkc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LM52YYqPfFXg3wPVpbc2Xbgrq8U9mLrWVRYLDcLfxOMoOQiVjePBr0XLG8Dg2eKbsFSAgNeAYHX8K36EKVW3diw7ihJY66mU5NXN8fStdTAb6Ua/w7hsEblGdvTgaDtSVL4x111BCfpYYGQIs8oNEm6QZ5VljFPaJmCigm0P4CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=akXXosn5; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="akXXosn5"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so1735542f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Jun 2025 04:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750678782; x=1751283582; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jBTUKpx0ZNKYHazA3t/A7/vG1k1Wn2pxBHruJSDnkA0=;
        b=akXXosn5JeWGX1uWfbF59wVWWkNdaoc1dSFu/HSATKRwPT3yXzan4jljbJ2Y0Mvb37
         6sTUBwjBHxW6wqt7KUz/4XazOtA65+N1879Mv4Nh/WEssXji0XvGKnJ8/GwadjwBO1HX
         onzTNLlqM4mRKeye2bT1e3shC5jCWOMRD0oLdWUKnpAjpX60AfL6ILNxGwBEyeMSQgKs
         MhBNK6cKpx/8UdJZW/K/1n5Q/FrfsDUVqBQlAoy0vaBRNj1nDva36/NgN+zkpBLDRU0G
         WuR43EPf60KBN0fZFISoauCF/EKLrbuIoQ3rzzTmAwNKBQRn1JOGihifeTLeH1LwGEPt
         SMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678782; x=1751283582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jBTUKpx0ZNKYHazA3t/A7/vG1k1Wn2pxBHruJSDnkA0=;
        b=YERjOUWYVuoKOgP9i5QfgoGU18CaO8hQcJ8qQh+qe8pCpEfqmFltUEiOnj9ynOdHD2
         c3Dxs+zPjqXGsItqgZrLSHmI+FCgWbjRu9SiZHNJxyzq52kLKnISzIZwkmCkH4YuWMld
         x2hE0LdkSAl2sAwpE9MW+7FHHEWtHYIQejEPQkBKJuLvBa3h6sFTA40bgo7M0Sh56qWS
         VNXOHLVdSmalvTF1RIAwVBGZXmpj2JXvpfG9+gkLfvtCibPjv3SaDfH8KJo9fMmllh1s
         UoEG2fHTO7ffIIBOZZtleaQH2SSrLR8G9b5cJYweYTYlv1L0odebdUF3fjPIx42dSpcP
         UEJA==
X-Forwarded-Encrypted: i=1; AJvYcCUw4IX2wrRs42IOe5JwPOGKkZLgC8HHjQaTvOoQgmNINGtT7f/dS1pMsanqGSjE4gjSygY1OPpmEHgFYUIUQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMEKN97QNf7di6mV6DerpgrpKaPe3C6h/p2fMtY0GiJ1V50PZZ
	4EGQDKusQkqXmY9lwABvmOH9AsHQ2B3j/OuLAMD6hybG5t6Wq5GOR0xmc379hYuuXymmC9SPMSj
	fYBynuLzaK8pzzmMElQ==
X-Google-Smtp-Source: AGHT+IHOfkmOn/iFDpfwri/R3bnIweVDsVpN6vKnfwZl34PHvpa36cU93NoZdwYN5nFotAGyPMw/l9yziseyIAA=
X-Received: from wmbji4.prod.google.com ([2002:a05:600c:a344:b0:451:4d6b:5b7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1ac8:b0:3a4:ee40:715c with SMTP id ffacd0b85a97d-3a6d130168fmr11662811f8f.14.1750678782136;
 Mon, 23 Jun 2025 04:39:42 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:39:39 +0000
In-Reply-To: <20250611-correct-type-cast-v1-1-06c1cf970727@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611-correct-type-cast-v1-1-06c1cf970727@gmail.com>
Message-ID: <aFk8-_TNeV51v2OA@google.com>
Subject: Re: [PATCH] rust: cast to the proper type
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 11, 2025 at 06:28:47AM -0400, Tamir Duberstein wrote:
> Use the ffi type rather than the resolved underlying type.
> 
> Fixes: f20fd5449ada ("rust: core abstractions for network PHY drivers")
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Please use unqualified imports.

>  rust/kernel/net/phy.rs | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 32ea43ece646..905e6534c083 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -163,17 +163,17 @@ pub fn set_speed(&mut self, speed: u32) {
>          let phydev = self.0.get();
>          // SAFETY: The struct invariant ensures that we may access
>          // this field without additional synchronization.
> -        unsafe { (*phydev).speed = speed as i32 };
> +        unsafe { (*phydev).speed = speed as crate::ffi::c_int };

unsafe { (*phydev).speed = speed as c_int };

>      }
>  
>      /// Sets duplex mode.
>      pub fn set_duplex(&mut self, mode: DuplexMode) {
>          let phydev = self.0.get();
>          let v = match mode {
> -            DuplexMode::Full => bindings::DUPLEX_FULL as i32,
> -            DuplexMode::Half => bindings::DUPLEX_HALF as i32,
> -            DuplexMode::Unknown => bindings::DUPLEX_UNKNOWN as i32,
> -        };
> +            DuplexMode::Full => bindings::DUPLEX_FULL,
> +            DuplexMode::Half => bindings::DUPLEX_HALF,
> +            DuplexMode::Unknown => bindings::DUPLEX_UNKNOWN,
> +        } as crate::ffi::c_int;

I would keep the imports on each line.

let v = match mode {
    DuplexMode::Full => bindings::DUPLEX_FULL as c_int,
    DuplexMode::Half => bindings::DUPLEX_HALF as c_int,
    DuplexMode::Unknown => bindings::DUPLEX_UNKNOWN as c_int,
};

Alice

>          // SAFETY: The struct invariant ensures that we may access
>          // this field without additional synchronization.
>          unsafe { (*phydev).duplex = v };
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250611-correct-type-cast-1de8876ddfc1
> 
> Best regards,
> --  
> Tamir Duberstein <tamird@gmail.com>
> 
