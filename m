Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194E42562E
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708337396; cv=none; b=Tv+JQI2Dx9+DoKsBm4+StYZkgJFh0DB3PrZsQP++FTWJXU/INf6ISju9kiAOPayMN71LLZI1asW3hEpGsdeukKFEW7zV3RifvvQuSM6uA+Ocr/UFZdcuH1Ot4GTLBoZGQCpI1IFpKYnvbkIl1YxlFKP/AlO3nIL1YGVQRz9M3nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708337396; c=relaxed/simple;
	bh=dyygKB6Z3appPfvQEup6+78yc6C4vhddmHvmABbWBhY=;
	h=From:References:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=YhL/qwhoX6iVcKgPO91JRan3UvzYogAM8kNn45+xUoKgAqo8eRcSkf7ps+doJj7HnFiLmYDCkxV98uh62wxMleVcCdbT9mPn3ipyYS0kDwa0e5zhlKRb6+m55SSp3aZ/MjmellSgNRSrv77DqOrJgzK/NbL7ThpUHTyn2kRUZlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=jib1fdZ2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="jib1fdZ2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3394b892691so2293162f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 02:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1708337392; x=1708942192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:user-agent:references:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyygKB6Z3appPfvQEup6+78yc6C4vhddmHvmABbWBhY=;
        b=jib1fdZ2gwbcNTeqU8oCD4Z7ihMMf4frdYAzrLJ8k6VqGzIynnvxqM+K4t5ft2Irtb
         d++ht8cNFBrqQU5eoAWAP1ep9p5pN/p7uU9zCmcys2pGd2C/36JIhDWnq1sCGk91SYWj
         f/Yalag7SBnaCKdYh/MhMHe38p3ZQwax/D8rfIBcKpIyx/lBX7OaTC6RLhrA4Qh3lbFY
         pZ+xz/7QH/uADneoGy0wdAZQnWvPvfDp+fYS+tJfNDejEeQXmpIckiSZRpnjwdNXG54T
         +fs8jIICOKQY/kCSZ4sVfzFRSUAgizodR0TxnSRf5O/isFoudWbwFIYeg+sLkf1TmEAV
         qVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708337392; x=1708942192;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:user-agent:references:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dyygKB6Z3appPfvQEup6+78yc6C4vhddmHvmABbWBhY=;
        b=DJSNLlhIa6bX8dhKT95TUdhdDUBxVGkklFlxksODroOQrhbV2ij62OaRJw6AEsdw/4
         IhspKXivKVGF2L2q8xadhb34jVuzi0EYDybvh2IVVOE/fzk+k9hbzLjEuSYcnIckRMzu
         zeDRp6QEShSddFdgRUx0Cxi6BzPJFLgkEx3qG9A3awJJdNDuL0LFYuuU2QkJmIqR82JG
         t0xb8Zq1iYgeNcaMY9r11Y3fWdzum4I2SywELITKMu7pDQfa+0P0tiX50u8MRkbw5cAd
         pGpuK7UN2okkzqJ2H9hu2prsRczWpWhhQrzt95msE80K5puov4GT2kpYlY7LrPYk4j//
         lOsA==
X-Forwarded-Encrypted: i=1; AJvYcCUQl2ZaP9NNEa1adg2iEZXZG6ks0h1SU6ysDBSS8UjVru6hVSx6W4I8b6My/WTsSua5EE7DYPuxbI//eG3I05dJwOZ8US9vvzrNJujIiAw=
X-Gm-Message-State: AOJu0YzyyBxBGZaTOHTx0KyD39kTUv35cnE5JMX+ohi2DWc3ou2rbaf4
	Kgslory3ZqBz8z8Ip0MGvI1CIBOJQGgMFbmErXpOGey7iKYKlHFVuHp617KSLWw=
X-Google-Smtp-Source: AGHT+IHSR74q+ow3wbJYcwyzu+7KXp1yjUPdgtj6o6bOX/CBbt9waaxp+Df39iyw5elJPygIbKI44A==
X-Received: by 2002:a05:6000:1563:b0:33d:608c:da8d with SMTP id 3-20020a056000156300b0033d608cda8dmr618681wrz.9.1708337392470;
        Mon, 19 Feb 2024 02:09:52 -0800 (PST)
Received: from localhost ([165.225.194.222])
        by smtp.gmail.com with ESMTPSA id i5-20020a05600011c500b0033cf095b9a2sm9876647wrx.78.2024.02.19.02.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 02:09:52 -0800 (PST)
From: Andreas Hindborg <nmi@metaspace.dk>
X-Google-Original-From: Andreas Hindborg <a.hindborg@samsung.com>
References: <CGME20240217153356eucas1p17c926b49da33a438d286ebb5c1a918c9@eucas1p1.samsung.com>
 <20240217153315.56128-1-mcanal@igalia.com>
User-agent: mu4e 1.10.8; emacs 29.2
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, Alex
  Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
  Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Gilbride
 <mattgilbride@google.com>, Lyude  Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org,
 kernel-dev@igalia.com, =?utf-8?Q?L=C3=A9o?= Lanteri Thauvin
 <leseulartichaut@gmail.com>,
 Wedson  Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH] rust: Add `container_of` and `offset_of` macros
Date: Mon, 19 Feb 2024 10:51:47 +0100
In-reply-to: <20240217153315.56128-1-mcanal@igalia.com>
Message-ID: <87plwsg3yx.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Maira,

Ma=C3=ADra Canal <mcanal@igalia.com> writes:

> From: Asahi Lina <lina@asahilina.net>
>
> Add Rust counterparts to these C macros. `container_of` is useful for C
> struct subtyping, to recover the original pointer to the container
> structure. `offset_of` is useful for struct-relative addressing.
>
> Co-authored-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Co-authored:by: L=C3=A9o Lanteri Thauvin <leseulartichaut@gmail.com>
> Signed-off-by: L=C3=A9o Lanteri Thauvin <leseulartichaut@gmail.com>
> Co-authored-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>
> Hi,
>
> `container_of` is a essential macro to build any sort of driver in the
> Linux Kernel. Therefore, we need a good and reliable implementation of
> this macro for the Rust abstractions.
>
> Although I checked the version sent by Matt [1], I don't really like the
> fact that such an essential part of the foundation of any driver would
> be an unsafe macro. Therefore, I propose this alternative to Matt's
> implementation, which is Lina's implementation that it is actually safe.
>
> `container_of` is a dependency for the rustgem driver and this is part
> of my current efforts to upstream the driver.
>

`offset_of!()` is available as `core::mem::offset_of!()` under unstable
feature gate, which is currently enabled and used in the workqueue
abstractions. So at least that macro is not required.

Best regards,
Andreas
