Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF64233EF
	for <rust-for-linux@vger.kernel.org>; Fri,  1 May 2026 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777633500; cv=pass; b=KzIoDCUkkxCPIqyfBQSue9L7Q5xTFeMCdcYTc2E6iPcv61cOjI4rdJJC8JdetLKi2dFHeBzT+FwCrLfJgwkGWbko5kW6ZFdr9ufMRXeSpiDvKNGnavRcz/eT3XBjOt04PthyWGCrP7ttBbu77AOpqhRqsLoNXIoXGQYUUYnJ7/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777633500; c=relaxed/simple;
	bh=mfnKHvSNYhdOKoKdDk7RHLgT0ghHIYJXd6HbvHRRYIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NnX6RzUsJdmbWmwXBn1jiH1Jh90F2jbtWH7Nr7wXemzUI1OJLzb2cFQfLUzeLm/2oqPQXOIiTEalplcANYrq465xDNVnCTkwvNQdtW61ezmoJ2SQbEoe+xX+slxg+XUNMyNuyexMtunu3SoGADASxUDaWD8MSsRDlDyJ9P9uMmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O35pEaNu; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O35pEaNu"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d7645adbdso1232121f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 01 May 2026 04:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777633497; cv=none;
        d=google.com; s=arc-20240605;
        b=SEt/73bMFY25VFLlbX7yfg19rPVE4cI6Bg6E4PiqGZY6S+OeOUIaBy6I8JeQJVzGoU
         wQMJ7yzgNSXt9clPg1yHVs5EVndObTMlnfUxfQlJWDjmjdtQDZKe1pAyG2hRsATMZ/b0
         9h65JUuwlliA5NS6rKzLF6AIUc2r9MBOAfDajkNs8U87zUQqUObOBP5b9MIg/ASBUaOS
         iQql/GsoVhBXtuSgo5zH4YmIX9sQQIenHBvAJhvj/QhAqVDMfUiSM5vWcfJrVpbOOs/u
         tePr9Xv/v1XeEjUQY3lASpSJKr20qclcHRkGu19eftEq+CkeOV4elyJNy5wk1vcbwya3
         zrWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aznkOgw0hfDMNO16Jlxs4pcxjp8M3M03zZP41tgMQiA=;
        fh=9IaqfGbjccrfpH145aOoRHLhIj0Sd3UcqvTLa9tOrGI=;
        b=MxtDNZJAMyKw6lsXCAvky0KVibTUgjWkV1WhclTNPL5ZtHyYvqL9Uf/GIpJNWu0jsP
         VbiPDU1RT5MnWStGC8LDpdzhSs2kYRN0ujt0vG7nNFsd5SineAWOx1b2kK6BfozQBRM7
         wVDYjvCQITqccNQEUMI24kdPP5MyH5MANBqNHXuM/Dakipn+bIPHLhK4ennvUbrls5C8
         Yi+I8P+1FCs0dwy+jq0JG/1d7ZfAcFEmawJ2bak16+g/dWM4o0xNAZeAPFKEhDA6F1Qy
         8LCFxzwKgDpZWPk4RLBbiUQ4gZnXn9SPZ+tL609QLCAM2+6PsnxLi+44KHiRbZxVyagZ
         92eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777633497; x=1778238297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aznkOgw0hfDMNO16Jlxs4pcxjp8M3M03zZP41tgMQiA=;
        b=O35pEaNuL1Lc5mOhNFrTaLLro79wpthK6/n61QBx17DVD9gHHUTG254axfvc3D7Foo
         tKol9K7IYgKlspKvvNJGuxzoiIMkIvl391/7xcV2S/xLTQr5KYJoqyu7OLFHmEL5QjfA
         B3ZpJqpr7isfr2x399WDRgYf52PF2w/O/Zat+tQQaME6RkNTfiYwn1TPfV14FUUCqzTc
         QVj+qnfShP8SusVJg9JtVf/alzxLUQzm/5sh3uUSgpDEFaQ8LLzBiCKZuzJWlgaIuUz9
         AcjymSxZkZLIKQ44ydO/H2uAd5Xq12kLvw1uz/yhXHd+879XbbCs/AQITF9ZMSjdSYYI
         j2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777633497; x=1778238297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aznkOgw0hfDMNO16Jlxs4pcxjp8M3M03zZP41tgMQiA=;
        b=OlZue3XJMxcZDp0jp4Wzt8syc6Jmb3L694XO05s1B0ioS5fczaOWbN0BdppUPCI9px
         CwxMLuz8yRrtIY5djxqnFtoz5kLS33oHtOY1qcwYxcaFUlx4sSSayLv16chp7JkqmzZD
         Iiai+5Wjjv+HD5lFw+EdPSRVHK2stb2wNEDLGOr1zZYINLVhfGAJIV5N5+e9zrQYD4iL
         aJSIK2f6YY8xxclbE6waG24jQ32sQOXC/yaz3R/iz8ccgMLItr+nGmCw+mDEPN0uMQl8
         4Jirpp+n3ZqTyfXMa9ZSUvEmCSn1VCPhhb9UJ6WEBxNHvApJXhmgtar1rTpS8yfHU8t6
         2CLw==
X-Forwarded-Encrypted: i=1; AFNElJ8YWkEn4/v3yAXFQDVI/Ibj1n9EcSwvfis7oKY5WtvcFzd/6qmN1VI4NVSJNsUPXrUDC3VTPwxBaT5a/JWnYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcQlYMBLiQOzwNo5rsSBvYLvYWu5kUxs58lzYhEChnYwl3ikJT
	DP+Myu0Ty/BnvEBMIiz3Jkc+iFQqIIL+xxeNCGVnNEtUNOBGCWjQRnexo5pS1npli1vmkXUv1Q/
	dgHIvvdMY+DvvUpiwINhxkqnCwpUk1+0m9ipywl5h
X-Gm-Gg: AeBDievWrjdTT3LdLZ8Q6bbn3pxbe/5JvwO2T2EN4V+KQQD6/KsXyn7YE71kmFQBGuF
	6W45rCL5Wc8goWueVyZm9Okm/nvh63/JocEZWkc5nR3loMXXcy51Fkv1/XLK26oQOSEOwbsRZ4I
	5m7kU1B3/qov7KBTm4JQQWdU2TQVEy9tgMmFlUyO7+AyGV6wQHwAos3kaNHrWab3akVpGaZwNrn
	Qs2iGwTwGsu9kD+DLB+4C4FIcAsv8L5l88Etrael6nnlHuiOmt4Rxe3AFZhcYz1se9Cn4L2iwp0
	DKQ77mDL3d7o05A9SLxudkgDGj8jcBfSWtxMVcgN5Hj5dkJ0VOpm4ZIi06UkNbePCSlWbtbS6Sk
	Q1qP/MlPwVw8YpUY=
X-Received: by 2002:a5d:584e:0:b0:43b:962b:5314 with SMTP id
 ffacd0b85a97d-4493e4a8845mr11675608f8f.19.1777633496842; Fri, 01 May 2026
 04:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-fw-boot-prerequisites-v1-0-c69af9abe1af@collabora.com>
In-Reply-To: <20260428-fw-boot-prerequisites-v1-0-c69af9abe1af@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 1 May 2026 13:04:43 +0200
X-Gm-Features: AVHnY4JxeTAK4DyMhi8egeWxOPl5ePCvaTAv7se_MjYItqUfwrwytrxgt9dqIvs
Message-ID: <CAH5fLghnAVmmpjfaST0+DKm66zwg_2eBD2LyEd=AsQ5OiOVsJw@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/tyr: prereqs for firmware loading and MCU boot
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com, 
	beata.michalska@arm.com, work@onurozkan.dev, alvin.sun@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 9:20=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> This series extracts patches from the Tyr firmware boot series that have
> no additional prerequisites and can be applied directly to drm-rust-next.
>
> Most of the patches are unchanged from the fw-boot series, except
> "drm/tyr: use shmem GEM object type in TyrDrmDriver"
> which now also selects RUST_DRM_GEM_SHMEM_HELPER in Kconfig.
>
> Link to [PATCH v4 00/20] drm/tyr: firmware loading and MCU boot support
> - https://lore.kernel.org/rust-for-linux/20260424-b4-fw-boot-v4-v4-0-a5d9=
1050789d@collabora.com/
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> Alvin Sun (1):
>       drm/tyr: use shmem GEM object type in TyrDrmDriver
>
> Beata Michalska (1):
>       drm/tyr: set DMA mask using GPU physical address
>
> Boris Brezillon (1):
>       drm/tyr: rename TyrObject to BoData
>
> Deborah Brouwer (2):
>       drm/tyr: move clock cleanup into Clocks Drop impl
>       drm/tyr: add shmem backing for GEM objects
>
>  drivers/gpu/drm/tyr/Kconfig   |  1 +
>  drivers/gpu/drm/tyr/driver.rs | 39 +++++++++++++++++++++++--------------=
--
>  drivers/gpu/drm/tyr/gem.rs    | 24 ++++++++++++++++++------
>  3 files changed, 42 insertions(+), 22 deletions(-)

Applied to drm-rust-next. Thanks!
