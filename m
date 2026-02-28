Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667CC2773E5
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772287929; cv=pass; b=l8SKFSgFU792UvpB/X5IePBU7/T7y4LC7ba1t+np5LMh5vdN65enXCZ7YPjEiiKGkTRD487tHgK3nNNlyNfCbMpyU9Zy5mk4RytGP/zLZbNMghayonqF32l7KAW4tpbaZWN+l/Eon6YE3u8mnop43CH+KfHpfd7Yw0IzWv4bHVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772287929; c=relaxed/simple;
	bh=eYvunH5f5GZ/tmvzK/aIBiD2hOhAPgJXF7MbD9moziY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnEKUhD/Uw/lh0M50qjb20q9TDwxt+LhFC4b6W/RqZb/BUo7sqcmd6KdEIuG6ZT7zN7/Tqua+txz3EGzbeUw45WqF4iy4FOfZadKTUsR7yawjbjWMLevIgTvamV3gHj+GhY74ugz9UCDAKvwc32JUuKxuLpTD+VV5SkfqDiyQrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYv5GfAY; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYv5GfAY"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12714f01940so91930c88.0
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 06:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772287927; cv=none;
        d=google.com; s=arc-20240605;
        b=aepm1DMoiykEFGxQQGUCQfmlIBEGpToRXF2tG0RlW71N9B/29Aq8B14FuUMamzktOQ
         4lWVuWu1JkN8wfVY1LTqGYAxg7cRHZSolTdsOmJWmuJ00jc7CP2Uk5zq/TXWL+ROB466
         TH6ZlTHj0/RmWhaupiaOLMWWEQ4OwZZYcl7UioO8tzJtllI7yVnIKR4ABhl/pmOvvetS
         4RQ1SoHUCLoccX4CQeJl3P2yZp7bTm+M/EXQfkPbVp4YVbfozxyR1wAVlXz61fVom/tv
         ax3lqv3E46xitvaVNRVxMUuZ5f6W/t4RXXtjGfYYantbIwjbXPlOHE22yhHRE96fbMXC
         +gog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eYvunH5f5GZ/tmvzK/aIBiD2hOhAPgJXF7MbD9moziY=;
        fh=n9rNST9t78mqeudV6LZCa2AH1HMYQmZLgXli9EdTVFM=;
        b=erqknzWMfbEgJpejJA/OzhEU07dOPHmZv1wC4B8CY87Jm1DHVkq+uLqLEsr3ic0YKt
         O0KK/VE3PvmrKeOzgDZyXqr2Xedfv04UTKQsQifdahEVni4+VebAWb5in0SejL6yyzHe
         3tvLPPF4TEURBkj1I1bGQB4ocGOLD4dUPyQ0ZmlAWw/aT05YWEi8JZRCkMH61QEg8sAL
         tJ6T7oFYbqvNwdBQb8wRXJmnye5bDbELBjUx9/nO3Azsv7ylW3b+L34t8+o8wJ4qFtgH
         lJv0GFr2oQBouLx1adkcbAr8CDDrWNHsgXqpXAHvg/5xvwkNAAofnCTrxu5GK3wv4ncD
         vVog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772287927; x=1772892727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYvunH5f5GZ/tmvzK/aIBiD2hOhAPgJXF7MbD9moziY=;
        b=cYv5GfAYLO4cUZo1XMm5bsijFwq2xodYdwsKUeza5ahghDbh01cpgSuY2OrDa1m36R
         ZMb1IUnMHtUBVc7hwi7PTB2TrnNc4nn7nvoLdJUZS03S+IWaJoZb5wJjFnQolZOHgXCp
         1VShjS2A8SaqCpVO24/TnzMyibrOWw+TDXHho6CrVter1Cj7+agTKQ5ws9n83y4cPZSU
         BUTTyy/Yq4JEzaXt0z+PJOMX1FqTL/ztw6wN778TumpRBnEwejDgk42L+s8lZWpdv2E9
         ONXdxf84ZUHHL+6tk8aBTKEHcbUrAzd8fel+DzakcyM4POOxVunRMtgVQg+Lk+0V9SRc
         bnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772287927; x=1772892727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eYvunH5f5GZ/tmvzK/aIBiD2hOhAPgJXF7MbD9moziY=;
        b=vRjaBXWm/bii9fR4OOYUCnllZfXhCD/pKwEuS78ixVLAY/h3UbR8en6p2d8Xlln9YK
         SahTQ4hTFqidB+oenCSqTA4tskhoAVH52+zBox9DAYYVM0CxnX8Ncz7e/Off9+XFOr6e
         W/8uKtlaoI9f3YpA815+Txv3D3GUGE6DdnDOuHpEGH68esyMd5hItHUK1d/NM+UuQ8x1
         JYvEm90l3+XhzPX4/r1sReJ0cva3MaFqULgyfROhpUGOhOkED3/v3NyYMXyaKocAecki
         +HfYDeRgtOzyiecsf1XKXQwTEXUMN53808tzkE1QwQUVEviU7pMFiVR0LGCyQo8LTFjP
         86ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQkjmE4NzkTK16kj117nroFHgLohiDPJbHfaVouCB8ugZZGrB9wJKttibbPHLde/ODpsjzb4IhciZZXQXajg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykYAtOvM8nu7umwq9MW0vJi0AtQtqZVfA7xEVUtMdJqO+zT4Z6
	VcSJ2lMCOyax/LR2+gRxAXNbGZIKeuc3vaOHzyiopvJ8/LB2svLDhupihlCUhOpYwVOTLpyP78B
	1U+Pbyt0gajR0/L9nZaxmWYkm4nvbw0A=
X-Gm-Gg: ATEYQzyvpwd+Lh3gInM/3VxTXVPxouNS0TVcjJ6oVHpnGQuyTrh/Ywa1/QfDHe21vLE
	9XXY2PCN/ZjkVtNsHr2csyQYPA5eMM0qNyH/StospLyFWdqUQT69MEkAk/xYtlYN/XWvQ/iXIh1
	vBMaRGI8p8OLDOq19mQPhFALGOu+PjfZvgR92xw/qzE8EeaQiDxxSaVQGiYAne9+K1tgCly9NXq
	aPbwAjmoQOrBMn9odXpau9UCHMzYJ4/HK6/HPTJXZXqIoD/k4GGm1s9A8tzho4PwrfJq4ChjvC6
	lmhRirNWBFtKgc/mZ9iLXJd+xsbiJXlikxZC3gOruInpPs1iRHFQ+IZ6D+ablt5vR5Uyik4atML
	RAE8vDdw1Gsh5CQzGO5wg7vZst/wZ
X-Received: by 2002:a05:7022:23a7:b0:127:3480:7ca9 with SMTP id
 a92af1059eb24-1278fc28784mr1437005c88.2.1772287927451; Sat, 28 Feb 2026
 06:12:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228113713.1402110-1-lossin@kernel.org> <20260228113713.1402110-2-lossin@kernel.org>
In-Reply-To: <20260228113713.1402110-2-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Feb 2026 15:11:55 +0100
X-Gm-Features: AaiRm50bdpCw4DQrGEpja2W7LIdiWCMX_uVEhlKL8J7eLvWCaya9K17Rqrn4d6M
Message-ID: <CANiq72kRjJj=sOke+PWwu7uphL0AsJAi1UL53AYrDzJ=4Z=0Mw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: pin-init: internal: init: document load-bearing
 fact of field accessors
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, stable@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 12:37=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>
> The affected stable trees that are still
> maintained are: 6.17, 6.16, 6.12, and 6.6.

Same here, i.e. 6.17 and 6.16 are not maintained anymore, so these can
be skipped.

Cheers,
Miguel
