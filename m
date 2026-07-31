Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5A43546CA
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 06:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480383; cv=pass; b=jVlTRgiV+K7rBQDNZA/QLdo8uPuItJR++jdmtxIPZ7TF9LFyPBXGO3F8uS9WpRRFQtWaNcaSiSXBwJICw77kq00HgtFiwuJs4mZWapPfuwMuFKD7PDkG4vJNg+7Q9Ybgck6wIbkl9FJ/0Mfq+f+LjN4cBQ0HSyqrekDAt6YP81M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480383; c=relaxed/simple;
	bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbERnLClxch1xZQTvW90dSX/wjL1buglF35wn7xuj5XDx8sgwP6O/5IhnE9MxQj6uAFPvK3Ng1pYNz8x2fMqmS59Pn2XWBcten8ZQtovmGtnOLvJaXfD+ye51v1amvvS0LPZD/s5ooXYgVlVzo1W/oy/NV34w1bs4j+XiUrvDTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHnR1d8I; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHnR1d8I"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84a3323d858so117736b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Jul 2026 23:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785480380; cv=none;
        d=google.com; s=arc-20260327;
        b=ABeqwdYzTsP0Zvyy1L9UWS7zjDk3SgCO1XPJN7OmLoti1r7g6u02291SQtQ4raN/ic
         fMOGKPuW0nj7+5oXzAH3oNsO829LJOlRjMDq+KYPT8LkzCmIJPbURcH9u/YA1h13mDCg
         Q5yY7LtMnELwoSw6u4IpCm8AY9wmYvQRXthOxhvVCN7nUxyyXZo+4u76EogNTZhRPzLP
         MVIy9NqaUB/JWr09BQTCm9GMvAGWUpgbcBQFghD71xtAIXBGNKXqYua8+QGV90E2+uuF
         KnIgYHoj1v1/FfICQTadOt1PFPsHASYcGn6QFdgJOcnAKnk+4vXU5WwPjsitIT4SFXw6
         8xhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
        fh=07Z/ibJz6S0VLw4l7LRGwxAuRer/D8joxMXmAOgVs2U=;
        b=Ud14CZNYk8mh2ZIerGQBVIiHwSJIZSoez3/Et9Tfhz5J/E3l0IHyE5Nmj7Q5zRdB5q
         Ci9FTRPsHZOwEv/hjZdS0m2dd9leVz2RLJcfDxy2bYyTt0R6zlOURxJR01pWyIrb3rjg
         9os+oaZH6OElGopKXZHvk/acYpDogdK4veZ7soJayajUXOv1MvBhsdww+Swm9a4k5U8D
         veKRIUMpyTHWW/H4tdCExEwOhZaUxjwR2KWEPVY0ZYJdM0OpvCxBa3Z1GytjES51sH8L
         Qp2PQDxc13oZ50BpMCtZeE0M3dHlY5tWVX+3YkDkL9kOgX9WCxZQHUJ8sWcqR9pgQI96
         XZOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480380; x=1786085180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
        b=QHnR1d8I/TMMKJbGJJ3aw8izZ7RG5URa+aA4KhAZbDqkJRLAM5u4XN+gTfEheCPRqB
         2KMZipuxAp4b/k4FTiHsqZKYgtPVQyY5mBzOSij4/2JFMQyMisjb8doiJWaGsIkBKgOu
         svJaHDM83vcM4tByZM0OZxbgwcmf1awtATooPE03M8/RPgJGUd4Lj2eT14WW2vHwl8uJ
         54X3B3SOEB9R7nncrk8sPxZC9BeDLB4h2nFts0jSJTlrjZa3D+Deu3V+97jE4J1CfZ/K
         YZFqt1ZbXILwW6MbA2Z2rvJxKWwpkWpyYduUHgls1FbIhiNDInIIo0WBGPyiY8nRozVO
         4VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480380; x=1786085180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSWRSbOj71BNGeOr+HBxtLFfbntXDiooltzuw+HXglM=;
        b=UgoOTcAuNoS7pN6R3ROdPFULvMa4ljFawHk3BhhNqiw/O3XPMUvQgAQjswfXcYCcIK
         goI+ur2y2BUbvGUuhNPy2yXcJQt2olr41MnF/xvzuySVifSLnMuhLnz4gfgX37OqauFF
         sWhEj0eMRPlhPccJ3ISeZPX5BqJerKIAoFGFQ3tJisjXjav+mSc0jEBjIt+UXGPKBP4o
         b+S+DSPY1sVS8/LmS/N84BikwlFopY/10Np1Y7ZA54bY1W9ywyHqMWIcry4mnAGYf+Yy
         nURe1mRF+crgB0c/nK07NoSaJUHVJwwRlmldaP5WJeL+ByUlGT+h1Azl9/sSxnkH2qaq
         /9Ig==
X-Forwarded-Encrypted: i=1; AHgh+RrSIRv9n7gTxfUv94qjzudtqHfUt6A7UP1aWTEn+NmyvO7mE4V5wCcA1L4s+aIPRJWnfhOeXHG0ezDhdZWk8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoOClqF7sb3nKGopLqPIYAyuEEhoLryNUmBRWp4BY7jKUPcXka
	UCRBvRe7o7pqQa4g3XtZ1CD79i3kKb2H2o4NI7YGSJpBvc6QE5V+ktTDJaZQ7VSBehRRdDIhEIB
	KaI2QPl4P2AhtWYvNGYqiMTv29/6jWrs=
X-Gm-Gg: AR+sD12vmR/nx0yZJAW69M8c3z6ZXJde2gWn4bFSgweM1kHZY3lYxKufGQeM+GzvPiu
	SpS6n80Gysu2K3LjUQrkOoV9Q6QqDwdb9GCaKbEB3p8HdrwHahWwCEwNJBr1G7Mw4JJwyDfbk9Z
	g4qnjq0Csr/vl99FPDm7jAQvKyo4HTbFT3hNOV3DKM64dfLt93mnGmToCNk3QrSHfczhzWB58rC
	O1yML0jYWpySO8p8jKfeQcTyPteKjLluiaRHkSMs2JUF6AF2Q81RSTO4x5CbpJ67kKLZ/jsZlZw
	UXcjAcwBOcJYBhtA8LPUr20973w01qUzePPmEdW1j2w8vHoTtJMFWOgunmxOKdsfXmfbQv2wZ1p
	tTLcZriaS/jGBEcoYOxS+lSR7Z9VKjNj5jKRYe/N1ipDo3OKof1ZtDb9O9W2k
X-Received: by 2002:a17:902:ce08:b0:2c9:b96a:2855 with SMTP id
 d9443c01a7336-2d046b459b3mr15748155ad.0.1785480380480; Thu, 30 Jul 2026
 23:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
In-Reply-To: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 08:46:07 +0200
X-Gm-Features: AUfX_my5gmBTyBxP6uEcBbaVDtTCrtAGlQbEryzjfR6FoeX2UBUc_vHFPgNtGlo
Message-ID: <CANiq72m59O-ruHUvUcZC7yCvu0KV0w_m5vMO4e0rxyHdRmihJw@mail.gmail.com>
Subject: Re: [PATCH v9 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 4:11=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> base-commit: b7e5ac83cb16f7ffd11dc23736f84276602100ed

Was this old tag used for some reason?

> prerequisite-change-id: 20260519-miscdev-use-format-9ab7e83b1c11:v3
> prerequisite-patch-id: 405b334ff0d48ad350014f05a2321bdbaa025400
> prerequisite-patch-id: 604b631c81d5423f4ebb2e12ba2d22e9ce371bfc
> prerequisite-patch-id: cb550d94cefe01920e0d3ced2b2bcbecd76f3907
> prerequisite-patch-id: 3bc830839742591460cb86d9472c04f4686dc600
> prerequisite-patch-id: 571058244bc8c7088638d2e3225713011246c7e9
> prerequisite-patch-id: 347c5a3c6dbef9832bfce8419fc23e6e08ba477f
> prerequisite-patch-id: 3e202d988b56b88446f7535e90d3f00cf5f15701

Are all these actually needed? Some seem unrelated (some were already
applied too). The only one that seems needed has Andreas' Acked-by, so
I guess it is fine.

(By the way, I will use this second message to take this chance to
move the modules maintainers in the To: in case it helps, since I
didn't do it in my previous message)

Thanks!

Cheers,
Miguel
