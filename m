Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D03384CDD
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786218064; cv=pass; b=SmBwPQU3TPlkEjlmTiQPw3wATY2BcC0zLYgztJEZgUBWprkqNFudxX90DzNMD6VQWP5XJfPl8hzOYCH8ohdZRtjE3n8YMvxbE1yeG1NCm/dZpOiU9dBEP8nkpZxWndPYSAfv+8rxlL8TSXIRQFNtGR4E61704C4io5DusOfhBp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786218064; c=relaxed/simple;
	bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRKtAtfi0Eds+pxhyrfFotq1FQ0R8iHM/ly0evdcvCg6MmEa0Zywk6QkxLiDiuYYDKeHYSWlhQe5TnABa2pThhMfom5E0rznL0UhggAq0I2eYoKPz4/GNBvlCoHV5reSBPe1XDHEzcyrFp99Zg0kAjMhOahWtiVkvI73wqw5kQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6DH8DbX; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6DH8DbX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccae46de39so527505ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 08 Aug 2026 12:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786218063; cv=none;
        d=google.com; s=arc-20260327;
        b=CWbj5TpnMD2m9Y0Q5WREs8TFzd+eJKTlwz8O34cu0OAVEYwA2SKZ8Adasyw7+9XqpP
         9fmxRtP3DKmgFx13CfLQkW01ZJmfE4hjC1GDwAdF4Dg8c9CtmUXI8cnUjQKDphGhRJzp
         6ISEi93XveihxfslLMOUjiiFVpT/nmTTemXZqFzHZyZmOKoIynnaDfWP7lGXjahj+G6Z
         6d12NufPfWYd4p3wrQca3BQCEaIy2zJNZM4VCf/5100+CsLr1Cq/5lF+1wEiym6qEcVe
         Z9Gei0DaEyGCTrO4QR1AVCi6Pm4wURf0JaUhRMr3kj+A3mF4PHZIe45WB5AQjS4vD7Y6
         7iOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
        fh=Z31HeGmmXDJ6pdRj/W+/NcIuOEPnl2utyCRHl4nYW0A=;
        b=lzDUok3aPUbma463SUfHs5IV8elbuYhiVZE4R5Z2Im9aU9+aDWE3/3i25mbCaE+HZg
         L80NRy2TGMpsLtYe73k28SFvSve558U2YCj2vS++cjB54CkIcRlcIp+LUZScUvMD2axm
         WZetNjgLeWZ4wSS+rkguTnDiosZqhRnzDu754e/LI66RIrQhwXZkKBTIh0V9/ZaQq2MX
         A2rzPeLfspQh5ZEAso+vOzhlKZBxDJgQWLcavWJ1XFmylcWG2JZ09ce+CsvysfKiq+aI
         ViqspUeMw/wYAgqALnk6HiViqz3cZrSfDBPrLFZVDVp/B47QgBQ/T+8pmWwiKDeCid8I
         SC/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786218063; x=1786822863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
        b=E6DH8DbXJTnsA8sMpBXpJFyAkHo19ttNbSqPD4Qe8pfC9A2tNTrW45K2oX21xwM1Qo
         8stpdolNIvag36gfd18JmCoDEIBWBT9d0mt9ipPSVVnQBZSf4vwfzHkg6HRFFbVtv7QY
         yr+lVXVLLjVlzBAY3RVIowdZ1I6nuDNimvnyquueimAG1uXRrjdvbKPbvHKhYkaYXB9O
         8qDIairIbCZubVtfoYK23IE+OzHahEWB4KTNUdmWpbA7QY6LcUbeIwoeahluTOjQcvfu
         dDTE38RjD4GNgIZ+y34Ws5V0l7ibRNwY5xRuK+H0ChydzrWHfiVpw26IXarDgHfGhAB5
         clYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786218063; x=1786822863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
        b=VRbf9yubDuEldZvioV+UGFDYbxgcDB0jIuu1SXIjusmm+C/YEOQJwbV9+cJHxSPsWF
         t2tnAjk166GFLKkZRV+wXk42eskyK89U8tCcdHo02sTDTMBsGofNLNS1e29uOcNxYlbd
         UOgN5n9bOvUlg0GX3Ee0gepQFp6rC3YD1rurTjl+pp9YMUKdxjmZbJak3kTH3nkIru9O
         YzX47y111qafShyILF3Y+NL5vykl2aHwpgNWVV3TpxhpvlHWlUDWj1u1Py1/tf0n7vk3
         ze3c71s0ipa6/4YcXfvTvttXged6RIvqD8YTm0NuW1ZlctQDBg6BFNZpLcXCViUzis8+
         Epkg==
X-Forwarded-Encrypted: i=1; AHgh+RqM16htxYZdxBvjG2Nam3KAHur8fjg9dgug5dMi6PBfAzJYUS8XoYjzXUyqtWZG50Y0WXgBeKAnlPXlRm1/dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybYbTbFRnaI3DqC+66p1OZUILgy58a9jKXppULyB17B+/F5++A
	vSN+LJypuwteH3GZjBwP+9cL4VDF53H4HWzUrjAM6v9gq6KHKJPzglYsKdDYgcGAXelUMO7Phvz
	KJ7a91mD9rG2r6gIBS0TfAchQ++LJCio=
X-Gm-Gg: AR+sD1041TYsNVPdvs8IZTLEAwwLPo0wmR/Rfmnwu+jtIaZW3RxWHYqs5oDzOIPSkAV
	vxcusEwD8S+Kgo+TGqo5uKjb6sCpOyHZAqvLcqWfxoyNr39Rf+bi05fUgOFRoYZrYD697o5UoN4
	6onJf1p2AsnTNl9fvwCBVEGYdXu72g4zU0VulLmMV8Tud3eJUTH1gxrL5Vnb4KdbfvdJuqhYeu4
	ZD9BBC6rDGzZRugaHSWDqgorLDUajCIHnSRRoIm8PDES9GZqHM9k9NH+acKx9ENMQ82XH4ziMp7
	6UM9pr+ySAkpUWUPQbPAdIB0JG+ZsFLBIHOkvEa4E4p9kuu+nW8AtdnCSsQLjwsMeStlykNaYHj
	YemoH+lkOh3QAZ3pu9HxzIn8TVb+kYYV1TtlSO2uLByMWK/viD15cqyUBl44w
X-Received: by 2002:a17:902:ec8a:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d0ca1658f2mr275615635ad.0.1786218062739; Sat, 08 Aug 2026
 12:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807221429.155946-1-ojeda@kernel.org> <20260808.074341.1056015191905819805.tomo@flapping.org>
 <CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com> <20260808.143013.1251068388254615351.tomo@flapping.org>
In-Reply-To: <20260808.143013.1251068388254615351.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 21:40:49 +0200
X-Gm-Features: AUfX_myY729uYjJW5IhCmENfsQg8ijuPS9VLtcEZjSqkZiEXciXEvujLP3Jq8gQ
Message-ID: <CANiq72m70uWCRFnhs3axdymSTGCirBrYAvKh2BiT0xqW2j_3jg@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, arnd@arndb.de, krzk@kernel.org, 
	alexandre.belloni@bootlin.com, linusw@kernel.org, chenhuacai@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fustini@kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, kernel@xen0n.name, 
	loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 7:30=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> Is this the one you saw?

Yeah, exactly.

> I posted a `cfg(testlib)` split for it:
>
> https://lore.kernel.org/all/20260808022608.1125174-1-tomo@flapping.org/

Thanks! It seems good to me.

> While at it, a question: what is `rusttest` meant to cover when
> `ARCH=3D` is not the host's?

`rusttest` is meant to run tests on the host, regardless of the target.

There aren't many tests there nowadays, since most of them moved to
the actual kernel when we got support for that, but we can still do
there things like testing proc macros.

We could also use it for more things in the future, perhaps...

Cheers,
Miguel
