Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793308633;
	b=zzeEkrovVURS4pnteHSX1GxtwMHXfypPiJlVDPLBBHRXydLAJAuKSZ2roXUGmawY/KQo
	 LR5jfBLBsfIUj8T1jVcFEWaayWzKEFq8kDZ7uEDRhn5N09M7hjsb+igH1S3gmcJvmMBxm
	 d8nSCO2OV4LSIZlBR1tRCKVYIqItuQGA/A1Xx8xxY+G9CNDMusbSBz8K4BOEkuj1z2rFT
	 HEbR8okNlecPMSG1PfEq4VB7u0OoDYf5ucz2LUd4/5Za26l8Qit4cXklARcURlMs0WFZD
	 CU9wAVa6ox37aw+LGBzWCePMOvPuNfVbKk9xCoFChL0/FCzaMP+PRM0z1ptBmKgaZEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8a9VwW/l5pMCLhHvRptqG1Mk1HgWYqAaQdHG97Kg0Qw=;
	b=okJRBqlY7EZoty29FBtQ+7pT/dMdiYYeY0ZrlFcBfj4QsdvuQDVzLeyqwyJ2Gd51XhGy
	 snndZfV4Y4EX7NU0M7ALcr/Cmn/UpMCnU8/3NFmTxNzM75QCfAVG3RSAaIt1ZgrLUyVSe
	 lD+ISrdxfTX14/NsPEErtXQbyF3tzYQzPeFRwiwGApQVbWO71sH2PRG656xXwf/QklUNT
	 8qKSmrgm7E084TDN9h6WZRu6Og+XTYbMWFw5h8jhdCxW7xyqHYA3oNcTFzUDXzfJXolym
	 xpd11W+sAwPlu5Qh0H9DsyobRynfrZ4ZwJT8/tOjL2IAGRvCDwQSjEHUXnfjMOqby8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXunou9C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC2E606A31E
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 21:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC2E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXunou9C
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-369fc2e984fso11664eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 14:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793308632; cv=none;
        d=google.com; s=arc-20260327;
        b=KHQZvuYHhaRJofKTPiHMuX5sqMit1Qty4JKFIlHNkRx4KW4NaM5ZgCu61EUi6BrojW
         0m4dfUHPlmhEujFGbTU7+ZvkVZeHBg0/Jpg8nYVrTXv+w5F3BXNkpe+JyPdKH+dHo5HE
         wSiMVeZVaHkkeK/C+JjnAkHkqk6GMlHhYcobcjtXC90UK2qW3v5l50um4xqgU9OKkC0W
         XOe//bIV/smqzsUpKxpunNxMfDNl6m7BL1SgAE4aS0iF45YWJnoDdpKiRmcoWTPfG+tJ
         ZPpq5N/E8f8Ej4E6HSy/LWh5lHZmuy9z5q6klOCHV42cCLuE5j/AonDqKTywXsbl8n5d
         Mhsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8a9VwW/l5pMCLhHvRptqG1Mk1HgWYqAaQdHG97Kg0Qw=;
        fh=X14Ftv59kBrBh0tU7EGlUWBXlKthU7l17RnLkvGHedE=;
        b=FolhHNDyLfTanhqtabcQT7RYtw8gRmFAg9ILwFpnsCUTIKnvUJ3QB/TBT6MKjRiVxl
         9Q4oaBYaeBQ3HPYvRZphWxWYSKP10bX+K/6Kv8oXwKBTvfT01ZYQ7heYzPyUgJHUdRHL
         U2yieJbpfSueUUeJTHsYWOn5A1A38gK4puZQA+EmzYf+qBj3am6LuXlGzB3pvjm7GZAC
         0TsXFlKfp15HjRvbg7DIw6B45enpQDfW/vAt5hff1/tKg254lWjCIhFNk5gamnlFk209
         iJCUU6XFdeOcqwBx4GDz++tCxFLFUe8gUETDaWMlJDxcdqHhoYiqF8b3JmjhF0EbTGnv
         ak7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793308632; x=1793913432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8a9VwW/l5pMCLhHvRptqG1Mk1HgWYqAaQdHG97Kg0Qw=;
        b=XXunou9CtC4BEYCQrhuadqzD455LGwx5YXUkteTkPIc0p1H4xkU5+qmZPj5FUGSwXW
         w+qHNOSsu5V1lUCeYVL/voVRJfsHrikg7h0BaZwQKn0N8rYBTWLEgsB6Y0y47VwcsuAt
         Vm4ZsdnMzQacJcGLoXiYmyv/TVBg8yW3FxnBoQfsPvfPFifRPTRgsMTT6e3ira13pnmm
         iPiYYqiLtI3QMFpcYu6fUa613WZ3OMrfgrvxTlcx0B9CHwe8FXWvdE6d7HSwQWjOEcCE
         C0OARVGORSxQ90StHpfZFC8778V7WzJOUSl2BXjYAltrg5d94qy6wVvbHa/0Gup82hjq
         6vbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308632; x=1793913432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8a9VwW/l5pMCLhHvRptqG1Mk1HgWYqAaQdHG97Kg0Qw=;
        b=o8RlRvOyPF7PvvkC88tnXLL7IM0pmZcjBLk9ll/IYya3sBZfG+d320ltCa0A9gKz5U
         7NmODwJq6h1Ej1k/K76rvVj7faxj5DDpse+grArNUKTdo0LhzjE0W2o9Ye63KpTJE0Cz
         XqWeXPnxHD/QMF7OnrIk4hFwpYOpydIggTjmRtUSZwZxBK106BRjkA6bza+XzXy4tDlt
         wHBreWIyye004dCmelGMZK2KLeyJ6W4LRfQcVvFIJATh/l2wUr59qL/0D6FLZPvvle2d
         R2zM8QbRazyYYn+5qwmJa5Y5NmMIFnDMWU4KZrfXcmnQVxJcLvaO7FYnqu3vvxA8ToQ1
         AVDw==
X-Forwarded-Encrypted: i=1; AKwUvBzXTSZmZXe+7ixKw8OMneISqV6vRuDykuYR26ECL/GF2BVUBuF5pBQK/c0a7zykTUiV9qTZ/y9I9xx06teiUQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKCstojuxv3Nio9dUYSq1yYlq9ACEqMAMpNHtFBNDPNtzbyoUXy
	zMaq2OmyEwPxk0iETV5s+B6hNbAhHCwwoBbA214CYrKU7gUzF5qMicxcLcPdihR8iFt9Y0QhHO2
	4RUVhSHaYlE4WMivhxbOHb+pEF89S1Rs=
X-Gm-Gg: AYBFou3MvOZwo2pRRTVK62FlOB5iil+DGVDnmpUGZtkKsh0ybe2KVdH7P8D0m2QJj3N
	l2uzlc9y0eK7faoGTaRDiemTeU3g5/GBB/Uc48+WPiivrlxZLD2oIXVCOBDsxyffz5q6uU1AAp+
	CUPGBKFNb9JkuoPmdlzgb2CPeS0HDNtNPCnV2DLXrXpzpUWvmLNxuAAQBpgyTMt9IN+f/er+CT+
	TuWwE5L4YMVdoj2nR5m/6B4XCPXRyknKFyji0g7ewVTjrTs8FiDbJhMKT+oZcTvaQyDC57/s+Ew
	1xZSmsTENB9hlRFwTbLrBiww8MVnS6MV1vxM97iZhqniHP6p6g870tsCSl3/m47RpnZgj8jpHaY
	OeRkKsj0iK1wLUJ9RiSril9aoPHdS5aCt/VdebdKGVGEd0BmKN4tBHnZtfubR2PlVrFjulWBfgL
	z7W2/3/eOKdgn+TDycfxGdKQzHM4JdyJH5AI5h7Qcd5OiK0k2x/JLSJncCstJtsJDjptYLaoat1
	AZJ8Pr5HILHMyNtwbJxW43NJhxH7MqcOTGcfA==
X-Received: by 2002:a05:693c:6304:b0:369:289a:d31a with SMTP id
 5a478bee46e88-36a42059799mr1167009eec.0.1793308631687; Thu, 29 Oct 2026
 14:17:11 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029180116.49074-1-ojeda@kernel.org> <CAHk-=wjt_ahzkGAwnExc85O5RArzFiAV-SiFzY8eP7RCXqWM1w@mail.gmail.com>
In-Reply-To: <CAHk-=wjt_ahzkGAwnExc85O5RArzFiAV-SiFzY8eP7RCXqWM1w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Oct 2026 22:16:58 +0100
X-Gm-Features: AclHuK99ulcUIeLAGyYWZlNcI_yrUDHE9haPLMUrL39phORKMUnHZ8VMZILyy08
Message-ID: <CANiq72k2+GeKSdE_pirNLzdkEXUtwO_sDzZZkeMkMuQzneqK3Q@mail.gmail.com>
Subject: Re: [GIT PULL] Rust fixes for 7.4
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	=?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 9:47=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Bah. Is there no way to just get bindgen to do this automatically for
> all enums? Would that break something else?

We want exactly that, i.e. for bindgen to do it (among other things in
our "wishlist"). It shouldn't be a hard one to do, and there is a
related, open PR (though slightly different).

There are a few months until the next minimum version cut (Debian
Stable), so we can try to land it.

Emilio (the maintainer, Cc'd) is open to improvements and helps us
when possible / within his bandwidth, so we will see.

Cheers,
Miguel
