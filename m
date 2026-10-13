Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091945187D0
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897305; cv=none; b=rZFPB2YBbRlp3AXuECoYAbnUN/CihGhtQHR3LodhjiRGZt6AConm30e+/uwUU1g365XIDEnf4mwN/5RngzK/QCl2klwu361B7n1sRFmDzS2KXiVishyM5h7ey9ZhjaMG5AzmR2A428P8AKFv5sQDfxrmJsKYgXvB7h76yb9q30Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897305; c=relaxed/simple;
	bh=ID7ITH/ey5fDaXQS2sirspBvibpDl8OQIA3uc+tsOM4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Sn1JujMzQlGQU1LJIL6ChHmVw0uRBRXRab+wAtboODVqAwDNb/tbyuy8b25Q/b6JYTA3BE7CL3WWvq+uFtBLlCm9JKvied7aalw0k4sAIbtD5TxNL3xEhtifj+3+rXg5aV6DWId5bB9juQYKjBXusDFOLHIbmHRiDhHfxvtC758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPLqu/+7; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPLqu/+7"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7c52caa3045so818152137.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 06:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791897303; x=1792502103; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ID7ITH/ey5fDaXQS2sirspBvibpDl8OQIA3uc+tsOM4=;
        b=FPLqu/+7aQFRel3lANPVYVO8kML/ngLiwPn/7YgcNBBVGWfN298UHU1b/Oz1DWzT0/
         OssUVyJsBAgnl6xFP6SGQ31aazTAJiU4EuF8rjROKQh2NrwdeBty3W0XExr8oCNC07z+
         9Ez3XZo4XhUI1AQ74I8AR3miNGg1FpoIurXb+lnpZHZG3ruzdE7Rsb3G2yJXlHet3muG
         BPFDXozCFfhK7iYd9dKaUs+6SolmOcQZRBejUnPfa1S71wa5qv7NF0/Hm7gZgxDfwOKB
         7T/4/xNfGJtfLS7h4w67GG5FaOjBg5TveoN9BJI9w6BuDCD2LhGgo7kY+XENS1DS9sS/
         3Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897303; x=1792502103;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ID7ITH/ey5fDaXQS2sirspBvibpDl8OQIA3uc+tsOM4=;
        b=xg4kAnWQ4xzZ2BL6rXXrj8SeJQADJmyrf/hhE6X+1FlWzZ9zP/rIGWCZo7jkPSvrh/
         C4ZyOi2uxADaRhdXfTdX6M8OskkEZaRT3M8H6uWfu8KNP/gVZuzwS3kQTpZhj23K4uJ0
         7chjWl36hCnOAV41sP2RDQSi1FpmH93uvpmEJweKa1aEpJ8Hw3XbY3y8MUjpo1aHzSZJ
         +v7XGY9onjli8o2Pz+8NaKSlFDBfOGfWRCS88n7bdKerM1ye/4UrFwj4jrvjAZCCKSCH
         T+ihu75kaUYk0AvZ/HS9ET0SxjCDzYi24kSlCc/7ZPcLIthLKKhYj2N4pHLofv3z8UEx
         wuvg==
X-Forwarded-Encrypted: i=1; AKwUvBxLS1Y0HnDP4KeL6UFcI2QtvtAAhbxmN17VBBgtoelBkBJV/vVuxX3lQQBps50fqAlMp+OjYpB7xyCRHwb+zQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLLc0u6gwHFNyoE1q+NGIRUuUrm+Sxe8ly4/ivBQwgnT8kqU9+k
	jVc0h3WJILDryFHDaVGvBe6LETVEn9VxbU6Ktmv6JaEHqIc+JugVGvU=
X-Gm-Gg: AYBFou3n+M/QJuSsbZtdD98udHLRihhSzSKCBfudZLbCakh+WX5XOmED6chSmB2tzMX
	kZSV1K6Zawmg5VZRfjl8Sf6HL7idlLfbnHc6fKu8429Y+ghHC+O5wA8N5u0/PPHcR8t23lXNoI2
	tgp5xUw2n7d4E9n3nNsp40A7oFbeDlzngntV5nedFUX7Zz1VsMrGaIvQXWhwikpAfTv0ZlJSxrE
	PkgxhMYc764Ag/07dIiV0qRZdFM0vfjfRGSkI7HGQ0a3Xvivu3mXGzS0M2P5csal98tBDTEKLiP
	zmF2KFEy36v14maai3CcUkk8gNtm4YD3gcWSPHXJs0jFht1Yc8PVRSJtHuMRE3iveCWdIUNQrbU
	A4HFSdwCISi+kVUjvh9+7+bvnOsB4eQeCI25RIodzpUEZgqJ8Hf9k7IP0DK+WixH1wDNNjJ56PM
	OQ4z0cT22niceTW59UgfXyca4YCqpO+YFUQwFRPDkV5T3ckT8L+F319VnPGPMmXlAzCvhVxIBMf
	MPBcyyzDEI5dR3dON4T134w6MnXh8QTUg==
X-Received: by 2002:a05:6102:441f:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7cb37a04f94mr2579211137.33.1791897302771;
        Tue, 13 Oct 2026 06:15:02 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb3539092esm8734108137.3.2026.10.13.06.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 10:14:55 -0300
Message-Id: <DM3QKTJYPA8I.13TW7H9HIV3YB@gmail.com>
Subject: Re: [PATCH v2] i2c: rust: avoid locking when performing
 I2cAdapter::inc_ref
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Igor Korotin" <igor.korotin@linux.dev>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Brigham
 Campbell" <me@brighamcampbell.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Jori Koolstra" <jkoolstra@xs4all.nl>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Shuah Khan" <skhan@linuxfoundation.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 "Sashiko" <sashiko-bot@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260904134600.340991-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260904134600.340991-1-nico.antinori.7@gmail.com>

Hello,

On Fri Sep 4, 2026 at 10:44 AM -03, Nicol=C3=A1s Antinori wrote:
> The current implementation of `<I2cAdapter as
> AlwaysRefCounted>::inc_ref` relies on the C function `i2c_get_adapter`
> to increment module and device counters. This function acquires a lock,
> looks for the adapter in the IDR table, and, if found, increments the
> named counters before returning the adapter.
>
> In the Rust API, the `I2cAdapter::get` method returns an
> `ARef<I2cAdapter>` upon success. Incrementing this reference count in an
> atomic context (for example, via `ARef::clone`, which relies on
> `AlwaysRefCounted::inc_ref`) could trigger a sleep-in-atomic bug due to
> the mutex locking inside `i2c_get_adapter`.
>
> Since cloning an `ARef` implies we already hold a valid reference to the
> adapter, the IDR table lookup and its associated lock are unnecessary.
>
> The fix consists of bypassing `i2c_get_adapter` and instead calling
> `__i2c_adapter_get` directly to increment the counters.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260524181151.24988-1-nico.antino=
ri.7@gmail.com
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Following up on this patch. Please let me know if you have any feedback
or if any changes are needed!

Regards,
Nicol=C3=A1s=20
