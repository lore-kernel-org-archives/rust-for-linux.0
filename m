Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794918970;
	b=ZjM6/NBQG/g0bFSsNuWGFeKY+2MuxCuXspZzCfhNiptQ1J+0ErbiQVAKnhkgNuEEYxTq
	 CLcwhPX8gXHZZyT3lggi3bZvt8Xa2PRu6wBznhH0+MvZdMcAtJsrjoHGrkcZcc8upQlDB
	 Jh3bYtDUQ5lTqaLTjjYIUkFU+TGC+xrWdOR6LUQ7L+8iY2g2O8kIYEHP1NyfQDQ12Bx1Q
	 p6Q+qjgzNJiV6zr1TGhcAPoXUD8aKUGaQwW24uiu9oNIlcOMwcOpHqelpnrL6II8MDsMo
	 ggi8U/RSILrAod9wwd50OK9EhlDGOURXxpyDjlF2rsweSpMp5OboxB55gPviNRL0Wpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hw2lOnJE1BYdwcRrwUwjnpBJ5ZK+H6gpsGPVzE1VicA=;
	b=I6d/daWs/qsHBnRZrWf2mSiEevfXVkVFGhTbQ9+cfiYnRumKTL+KMEdm3Ayao9kKOuY0
	 pwMrDpkMrex4s2HxT67AtQyjoeVLkQJcSOSZjdFeY8jWkkutZJ8oeAOdtr7pxOYANH8O6
	 NnKuM5bLlGBg84Yj1VaruJLmNSRe0W2fLEPsGKxis/p40z2JaBYhnCVT4jwp/E6MZ8H4k
	 hyGQAneHZpnkKjq9Q4YMPr2UK5BTrKhoGhNs3PcAam1bH1QZKZTPHhN8J+S0k5V8+rVNe
	 fhcVMG1xeYsErng+JlAxpkz6sY5LNhGu9rLaQBfFjfocOuq1IhmY4QXteyhc8u44jhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tg4Iz4r8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C33606A31C
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 12:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C33606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tg4Iz4r8
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3adf222704dso6197531fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 04:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794918969; cv=none;
        d=google.com; s=arc-20260327;
        b=FBY6h8oGSXLjbjIUbB7Yi8JVsNEAsJwnD2v/Vd2EdYEhAY3L9wMDf0avkHKvuXZUMs
         F8YrnVGIfko7c1KJldMmlAmpgh/YDYfe+lh0mfCGj3xEhWKFYtlZ2p8QgRyrQHEIOyi9
         Uz/09O6xHjlvWqjKtDgufsCnRtUZrToqY+5nJG56c6HyvKRfLp9z/rC/9nHyWHWh6QF6
         Y3gWFHs/hxM9pYeJZeGUjZ27s5Rfus0Q4foD8//bRsJSdCEuFUC9yBP9jZDKSr9XyjF8
         1QDy1usUrU6y/5WC1dbMmWC4nmwthIQT4HG8mUwW9z9OZzZelgzrFc0yO8ffklJLOYde
         UhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hw2lOnJE1BYdwcRrwUwjnpBJ5ZK+H6gpsGPVzE1VicA=;
        fh=F6nqxtYk8QAUkdGAhefh1z2my8YU4GHcJVOg3CHzMvQ=;
        b=oGYrIXIDo1o3vtUMkNSRRDJUD4dmi/ZqiB0C6lfAOQtyVCEAZyUkXZCxPksc8KQQnw
         SG1bk+ZDlGeh8m66Bm5zTA8IdEIIgANn0bZljElXVp4ke21PtEo3BkGMUaIQQcXeY6CN
         R4Uk9nzOsXJS7ejciadg9q7xHtMP1QdyN38/zw779eHW6uEcLfexFNHO1btim5ow02Xh
         iZqB+4GHd+MkZf27CaTODgs5e4+ZibUGCyMibH2qe2BSz0AAS4vX8lY7hbuEGR+5oZvH
         4cjBAujx7Q9XJI0hTvrwQSKcTpQoZJgBV8KlQ/cqXsxVTMUfwB5wloZf35kUGW8lZyby
         O+wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794918969; x=1795523769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hw2lOnJE1BYdwcRrwUwjnpBJ5ZK+H6gpsGPVzE1VicA=;
        b=tg4Iz4r8tkqz0/9gJXUbf+FGk/TrXTgThHwXOuXYkC6QDrH4FtADBEhj6THVdkRCJq
         e2RsQyD4/kP7pGAgVJbU7cbVq7JWK4w+Dr8Nh0VXXPLMK4Mjrx0WSN2kKM4EnIASDogP
         RZbqUSn/HZCfPBs+NiHGWxqudzUa7dmEzQevh4pysj4OUULmJF6SB9XAhiUvThx4YImC
         bLrM5ibcGxNaMrQahnzmwUgUkInZiCFGqrtUPNdvQnt4U1tsYf+C58cyrXpJcGpG8XFK
         rIROfFjND3xunTnkdNbcV9yxaAEUWKIQ4lQCJQIYCQnlvWeZ0xeyvt/n27QPQ7HCLlpg
         MAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918969; x=1795523769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hw2lOnJE1BYdwcRrwUwjnpBJ5ZK+H6gpsGPVzE1VicA=;
        b=C4/ManKEsCrnnyv+9wredmnehKUSExfmdKPuJR+CqkTVEjDh4y6c2+3k6CVxnoHhTy
         3XoMjE0rJzEM8H9hMKd2J0dfBI+jHWeQ6/5HEbSb5E4EcsRqPjarFsAEN9gaqDxYVfeD
         jZN3JsWjcwh8KVWM7fZA29XqhIDrY82569lwWsCrrZn0HHga5wAMP/DebzrcOE6stlkF
         VYlylQ9OTgrsS6pUmLMHU2+eMYA00LgRJYGsWta9x4hq5pDJ2u8zqcp6zoUvrk2Ul+y7
         fJ0IBBzeYwn++OZU7ORZL60VMAPPI+WjGJEqKvLq2PvwA4sGA4ptmb0oU9B+PqL+/zh2
         y26A==
X-Forwarded-Encrypted: i=1; AL+hErFe0LVJaRZv9YY3VzBiPmpwvEu4wKfcGj3ALOkr236l8kOQGfx8HxI9n5pGZDhbITX0afBrCZaPFdxRulHBhQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8MhKkHQN8tdamx+X3ZJ836PbSib+koE91bBUH3GkHspNRAnu2V
	rJ3EI6Rj8DIF4WmsXaHtuTMWqhCdKYB17khnx0AI/UIIRC4fJt4D2xLaCK7UcBYWZ+0bAU0g1KA
	P94ByZHwNfHvxQyFjDISd0T1wo2IuWqg=
X-Gm-Gg: AYBFou2SqSDKPp/GJYTX+9IHo5wiyqKxX/ONRnM1lafvwGGagiQXKQmlSxgv/8IQmHd
	ZEHd9CFO+Q6oyrK7CPqoCDkUYZXgSTPkd/8eYZ1XXpQzvZTBYLnPtey5AHhGxcGjWBZztHfxirM
	7IiJyN+4BjbhuPPdVRFeru1e5kglkvNHlS5ByELfLAn82iB1Sz5vD6bWa1fUlBFjtGDLHGp9KcV
	afiYTlgchasKg3bberAMAlghhpX8rLm2ZIcFpIvHa1lkQcij6182MEnKr1i6nSXd443DNU8mh4H
	zJIYELrgDteO4fMfpMObhCAVE37R8Nw92ZnnJiLeQi6M+kLSktiezhpdnNHetqSd7qRR3DW4hdx
	C1xSs6OHFVt+ZVWubzcWRuwYIM3El9eoIt2cE0qiQEzEl8yaEtRnh7xYl2URoLhmk9EBYP7EWKr
	b7Z9HeOjn/Jj7gfOgEUwE3VqurQT2Va0e84mdyodAVTm7KOdQXylbwGBNI9SPa8TxZGEttM7RS3
	rDSv8Ty+AOO34/SDLPFkcN0kqME+6saki1ZKFL8MaAfyvat1i/vULR/2ek7nObkB0Q036Se8w==
X-Received: by 2002:ac2:4bd2:0:b0:5bf:df58:d669 with SMTP id
 2adb3069b0e04-5c17071b9admr5859690e87.1.1794918968480; Tue, 17 Nov 2026
 04:36:08 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102042524.735613-1-tomo@flapping.org>
In-Reply-To: <20261102042524.735613-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Nov 2026 13:35:55 +0100
X-Gm-Features: Aa3M54ojxSPZWMYFlrXvHgvU8pieD71Qkjnbud5Kk4IXovPrdjE_d_iK695goNU
Message-ID: <CANiq72m4hMd_j2SqYk1LuBLYzmNHffc2zybKEmz3-XFTWFVdmg@mail.gmail.com>
Subject: Re: [PATCH v9] rust: workqueue: take a Delta<Jiffy> for the enqueue delay
To: tj@kernel.org
Cc: dakr@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	jiangshanlai@gmail.com, lossin@kernel.org, tamird@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, FUJITA Tomonori <tomo@flapping.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:26=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> enqueue_delayed() takes the delay as a raw Jiffies, which is a c_ulong
> alias. The type does not show the unit, so callers pass a bare integer.
>
> Take the delay as Delta<Jiffy> instead. A caller that already has a
> value in jiffies passes it without conversion. A caller that has a
> Delta in nanoseconds converts it with Delta::to_jiffies_timeout(),
> which rounds up, so a short delay does not become zero.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Tejun: I am happy to pick this one, but of course please shout if you
are planning to do it yourself!

Thanks!

Cheers,
Miguel
