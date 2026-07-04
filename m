Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE8D3A7826
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Jul 2026 13:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783170023; cv=pass; b=eaKdHGbDt5qVqojhTYxni7OxbUC0DLMj2GccHQVjq5GYp/kDHkFgnuBDRPOh/rQuXy89S6IBtrb+++tHdegxmk6Jhty2gHm4lARLGfVGITy7U7n+FEFalcoBE4F4hT/63AZhXNs814wf9qas8se3u8k75i9La0SwIpKtxt+8bMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783170023; c=relaxed/simple;
	bh=WIb0LAhy6ZohB5fTEBHLOSF58e1DkPpYw83fCrDECVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKttjgrW38x5MwEObKWcE/6PGuZj85jz7ekBPqMYVdEqbMlhtcTSYYPHYJ1D4p6eHyaQqEnBEVkaRkNnIyT6B4e/cfo+3zobxBIMzQZYGKZruzbu0RnRz3YAKTz9yrrOTL8Zmfx1/uYhWNLMbsLDNvwongN5R1rcCLylRg2DrYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YraTtHwv; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YraTtHwv"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84787ee07f2so422475b3a.3
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Jul 2026 06:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783170021; cv=none;
        d=google.com; s=arc-20260327;
        b=rHdjZvhtf1P82pP7JjcK7zNB4SV7bYdrt571ZNX2gX1rDwnamepnF/ykJV/LA5ZJcF
         sA0K7tbRJD9mlTtZcu0ZmK737v3VtFLSONIlKmjA5VUPWoGCMFkZRBA8TgQ/nCp/uC38
         SO13KqUHqZyG4bLhavI4EqYSjlZpNFE3TxfDxt96BOmv/gG+EnCCFp89icjT95ZBLH40
         3CRBYIQ3FwgXiWOMqefp5XiOjv+eQ2uUe94QVTpNGDATPB/27ohTlM4ebUtKFud9nUV8
         O1drBNf9YFXzf4W3hUiUv1pPs80AxINibBkkZPcrg6h1EArli16ObISuokiYXkk6rxcp
         o6PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIb0LAhy6ZohB5fTEBHLOSF58e1DkPpYw83fCrDECVs=;
        fh=2P4gNcL9TwhBBGmbZcH+nHIJWhq7ONoOdG8Xz8/Aaus=;
        b=Z5/JqT/70cdkLyLjSka4fThxZluL8sL89NBELy/lqIkrJfNr4Y9sNm29dZsOg+euYO
         jtiVXNOwkXcWwgs4QXQXiQVSpAKA8a8mODUA3NhMB7CNWjshBkAB6RpO+qppXFR5cO5V
         0sGGWnS5IBNePQf+tcfqxu5uPa9q6CxLTUV7dCTCVpfm5JImDBCnk2sG2IgdvBNI+4Gc
         9GqYGkPO8q00yJyJ1VekDyuI3NIda44BJKSiazD7bHpvO0ylf0fhCCDTID3OJPYHUQUe
         qnfU9QLvf32DpSDA74VNGEZHsl6+mU8VlMgRFr1VBf2GRa8SMlLZWOdAJLuJsI9rDInl
         EOgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783170021; x=1783774821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WIb0LAhy6ZohB5fTEBHLOSF58e1DkPpYw83fCrDECVs=;
        b=YraTtHwv5pGtFPPHBqDFgMHAbljfvNh3TwDlllo3TzbiOzFTG0cJXWybPOLsesUfcA
         eD3LhcRoEQP03jedxUzjSs4dNQ6F7uvD1XMxPxj+mDNuskoz+/b5DEQU051HUHcizriS
         32FmFr4mM999a9YUSWWyxkKfjHaqdCTkE/pBzwk6Ft0lSyrQuQDHZo85dyKS+mbbjRSk
         YJDRRU/pEAvvM29DgWVTGa1iifDnbeidNpRSqwjeoQkR44BKeA6qbaxI6fsDuMr0RjoR
         bt/c010L6wo9MwD0U+mdJ8WFSlk4rLpOX7w+QFDwT5mGwRZhEBN9oxV0FH4P9WKDQrAy
         O9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783170021; x=1783774821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIb0LAhy6ZohB5fTEBHLOSF58e1DkPpYw83fCrDECVs=;
        b=S2ynsbdZ5o+rwlLOZ6OmzMDz/0S5mwF8Pecmasz6nCzau5iCoJq/k/j9H0dl4BUrMN
         5LnIy1x4TdZNgc6LvzDdl4JhXBvZ8fV/RJxkc6guhV5Fa59+TtoQusu80lEHY8aGXsr/
         TouQVQ/09dkvE+qg5fXUIBGFs6hnZ/Y8hCeEvGVzFZzAneB7PFZXqhOP52xiSUh1Sxr1
         ugVjufI63vhulEJA3nCQtw+/73YdJ4Vs5MCPEP0KPKHhfU+l2ntHo+9l6aIpEzLuexHI
         PyF5blGzKe1xKwIc0FrAaerW0rnXDYhgxuQed6lmbF/lG4mUkmo3wPla6P3NYfZj8GeJ
         MrwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8tYEFDYKqFJHgNVIlmzYrQiJB8Hs3UCj71yarrcKPUPd5mFxWEpQ09peno4ZYIN0FVbFXvxP1OC9NAeHj2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt+nsO3aDoKhHpvrhE8rH9QDPXVLI01nqJFQ7qk4vYNyzYA4yv
	N4Vq8H5ZWzTBuOPuf9Fh32U2/VEJjmqpQpGejUDZUmfog0o8YSTN1WBmduM2fx9ovpgMv5y15uI
	IjeBnT1vyHErRBZN5PXHFgZRcO+Ubclk=
X-Gm-Gg: AfdE7ckYGCbAXnEOBwFL5iBiQiGIzSElTfB8EGNeLcsz39DoaKDkLpJWWFPGphgpOPA
	W9c22QJh4qcIajVu6rPTJNAIRuX+r+b9ecQpU7epyflUA7mF3G7sSZu798AuTMv16RQzq9ZmSm0
	3FB3dxXYgeHsW1IZZxDXdmr7ar2lN/qdDRHqdQ/8ULVq18WYzg89lcNR4jgr+1bji1wxz1dp0uI
	IZSmL+ggfNWs1mYtrYlh8GgcmJ9ScKIghbSbkVmUgTi1yqz1bR0hF47A9k3yGp5Km2hiSF18bXW
	3x5oA6Vg5QykUHNBaH6ofaWJUzbZi4WZ5hhJLgPwvseGXS1RnIYbM4PEXhL4/AjwVf/wwwAyX9O
	oJHMLzxxk/OmN
X-Received: by 2002:a17:90b:3e4f:b0:381:2788:a437 with SMTP id
 98e67ed59e1d1-382802bcc65mr2215108a91.1.1783170020948; Sat, 04 Jul 2026
 06:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702120324.40388-1-niyudi.honda@gmail.com>
In-Reply-To: <20260702120324.40388-1-niyudi.honda@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Jul 2026 15:00:08 +0200
X-Gm-Features: AVVi8CdSg2ksdLfnEyguJvA5pU1IOucVtgAfWvHPCYCaaf11PZEGGbNUW2d7mys
Message-ID: <CANiq72=g2mXOPtobn4oQUUASKgJzX6LOpuEvUUBH75UvbcUVdg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 0/5] drm/nova: replace `transmute` with `zerocopy`
To: Pedro Yudi Honda <niyudi.honda@usp.br>
Cc: dakr@kernel.org, acourbot@nvidia.com, apopple@nvidia.com, 
	nico.antinori.7@gmail.com, aliceryhl@google.com, airlied@gmail.com, 
	simona@ffwll.ch, dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 2:05=E2=80=AFPM Pedro Yudi Honda <niyudi.honda@usp.b=
r> wrote:
>
> Resent because of wrong target list and wrong email in "From:".

It is good that you mention this, thanks!

For future series, please also include a changelog between versions,
i.e. so that reviewers know what changed :)

Cheers,
Miguel
