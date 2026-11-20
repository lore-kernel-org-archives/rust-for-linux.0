Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795178006;
	b=c9vi/JoEIaNX/gv2Jegqb4QD5dQlmO661D/fZjDhFjp58peTCpKF8E9bBIEg4NzieA3d
	 /0qviOKq0uO+JpcXkU+SG70m+bEHVls/1HKx9jo8Ub1un6Lwpy1cwaDzfRlMaxmpZ/YqM
	 UUnL541T/HESigXXEJK/+hhPrX+yEnP9LgKxVJhaa4sEkdk3YPOKVaeHcWYlrVTm1+epB
	 6usJcDs7zZADcqohdbx7N9J6qIFqR1ZvgU+fgAdlTdLTWP7h1KhiyrLflbme1ZEb0cast
	 pMf+2mQb4TPWgMSbxUReCGvvaF8GQKL3wW1+PG05mMhYk+nUh6U9+vguf11gRyaSRrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j+vUQCRNRqxQSsZrwSUmTir7hqig5h2JdmSySrlx/1I=;
	b=Fdtjp6SxVsHWOm/JUz49Y/0YkRMQNfhK26qAI3z6GECnKhIypSXLYe5XJBf5f4AW2bkO
	 CMPu4zI8648KjOqfE3wAz0UHcPEKNI65dvrF4tynF7bp7bUpUhIsr3HUpIsJwzY7lS/Zo
	 iUbKlhcps5x40PCC/UAoyKfLhYxDcdNGGvX3+0XXoKz72hbLwxthGFTtJGPQeDE34Kkie
	 kJZZBtLQV1Wq3FJPEQXD7IB5+I+XWfwn0azf/wxjFw1CyDfY/HrWHfy5a2DmW5GpTo5iW
	 aGBP9c5wqP3eSs6wPiP8CU02I34Y66ojY2Pmzg1bsK5qJxjF/1pb3OVcJUCig+JtQww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R7ajZ/Ny";
	arc=fail smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E04F606A320
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 12:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E04F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7ajZ/Ny
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1acfdb638so61369e87.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 04:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795178004; cv=none;
        d=google.com; s=arc-20260327;
        b=QRU7l5mTgMl5Cwb5grAXognFiWeCxTfeKAhfB2xI8GSplvKWdUPHeMdDt4RLBCKZca
         D6dkX+bJgp5ivgClui/z4BtJRHU6sG8RuHm+w0v8AIxAj6mZKrAWJoVXyT0bauHDdyOg
         GFR3ovEbSQ+NdjKqIEiKXXDQ9tsDk1JFvzNEYAIzBd/gCffZk/Pw32tOoh08WD6k7gDQ
         pZQwdyWZNn+Wjj4/i948ZbdA5z+fGSzQFUF6+Jht5girYpGizkNge0AX7nT2OUJrRML2
         vyuxgv9Vynqp9UnmH6eyLhoDqBvFiBni7pSJR+O4rHUnXISDYQIwNGX/p/Wv2bTVOLa+
         wcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j+vUQCRNRqxQSsZrwSUmTir7hqig5h2JdmSySrlx/1I=;
        fh=i6c15H1mgjjky3vDvbpggxtoiHvTqF62QtQl0Mqwo8c=;
        b=axBUkpvjZ4pxo94zwzIiSFnR5dDmgwyLmEb7qcR4aAPXzkzhTR4mB4cJ55aqFfoVqQ
         agny9vasPCWQbvbVyPZxI9iABaGWejzFlohTygr4NyHDmpW5o6poc/IADc6fawLv3bll
         eUsTzFGalNq9ayeBtLRbjAo490Cbz5iSE+VZ1ec1zg+QecTcq1mVwzEUVv/WTV99LFJA
         LH5ilLDPytb72DPWQh+BNu5jCglkx04oo66vE/KBbXGO7mDme08CUTKdWnnNU78o+u84
         KhzV72UHr3SR/50h2Sz4fLT78gd2a1z9FX14hS4QlANyW61l7JhMGHQSUv7+ROE2u0gc
         6l0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795178004; x=1795782804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j+vUQCRNRqxQSsZrwSUmTir7hqig5h2JdmSySrlx/1I=;
        b=R7ajZ/Nyrs6M44d02sCTDsIOFIuUW6eSVO0MuT8I23JlaGQdgMCJW9jTk0POTtozTZ
         nTEtr2ZVZIQuLdbDUcxrAtyHgU202PYla1vbh63PZKBr3++Bg4E5RBzlrUiIeGv8aZ7b
         m+UD+sQlZokl3oZhxxYM8iCWhoNSL8uVn9/K6nQmdd4uJn490QFfJd6Gd28mDZ3VYhx8
         APxb4xwqObwynjiEAEgmpeierUqpo8nop6oI5vxJfaA+3jIffLD1MKb3s6WStoARjyBm
         ZBHbs2bGuv4027YzoSrAawl4PPj3Nq3Dp8Ne8Tfa/HzxynTAATI4eahcIl8Hl/Hysr8U
         imyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178004; x=1795782804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+vUQCRNRqxQSsZrwSUmTir7hqig5h2JdmSySrlx/1I=;
        b=qhl0UEqh2qE7pdv018U/NQkUVJUdLzHpxtFJeP6GkzVfrb5iHP+tPPsgeiJp+o46lb
         nLkzURPCkqhKr621xGa+QbiWVTz96tZYLzPxcE9z9AswOM2iUj6+cssRQAGVy7xd6NKf
         PqPTUTS+7DTtRIqOAfYumRpjrup5QpTku1MO8Sh478AwqSAA1AlV/QwKEaFxyZlTAtJ0
         uCpBT6TIls4KqZQuyS0uwgFmjN0c05V1wr2LaFnS4rSOPuCmvyHQsqn671rF6u2gSM+l
         9rNemMe5UYU16kE48gDnYCxGRb0M3CbTuV1qug9uAdlchmgsCO5U8e9CIaSfymfUr+Ft
         Ga9Q==
X-Forwarded-Encrypted: i=1; AL+hErHGPGphAwnyNokBeAQA0NdRoHzmOSaZSdtGAyIaYXiwGel+EV55571skONlSPo6acS5RuWaYoTkelBaJQuh2Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mrzj+KNSnHnAo6Hx9hmHWpLo6d6CWLikV5xfngEdgSyONOGNd
	NW14ly4uACYkIV9oAPydzoilubdnR+RKXCh+dEGOQxxz1dO99srh/JESgXZzOtDrHC2uVttBJ+t
	XDJWG9vysxBgmLcs/5hUYvhctgNCaA+I=
X-Gm-Gg: AZFdTZcz5YxJCqfOrQk56jTmirFJ8Jz0lGNZaWwnVg/i2A0DNaDTFHpVfuwOVFXfRV8
	9s6RYnTUVRpiMbGLhQwOVHf+wa3Yr8XYUi/Dt3fkjVH1BG4nMyhaXdeOpkD2s+ZYGe3UhzPGUyp
	j4npUZEeFDi6RLX4kVszZWGk1+aaPuNc68JdOecFfs1dH6Zt0IQRrVCaRaoJ1N/5SFK81lFt+Pq
	JW4VpOGrXSQY6ME88WKFUtUm6BaMrAhZ9AQLagnNg3GfxXkNT3tyMuWbOoVmB4YIuDciFF/xHQT
	LfaDmGXz19ewPnodvleoxjgxq5ET8siaUOoWOsRXQbymHAYOZKBliJhsWM9VjqsjPXzlJ/2IVXx
	jrY7oZWED2a0+vzArVS1Jhl2NDWrhUb6wS+370PcOhQVFsWPJ/PA7fFUdODbGakrbB0Zj9JKA5q
	sY4KHaG3cI+w6dFMTAuQFa6zoSWUiRqi9cMc4WYWJQBhMktVCWEIoa0iOgLMw+ssqbnSFF0AxIr
	Pp1rAZtiGUm+m+js5fGzO82pEdJ8NIk8OIhuEFL70v5W8gh6SB4y+KYvTsU7dsCHWRLfU4I
X-Received: by 2002:a05:6512:1318:b0:5c0:465:3fc6 with SMTP id
 2adb3069b0e04-5c1bc8601a5mr1101167e87.4.1795178003434; Fri, 20 Nov 2026
 04:33:23 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-fix-schedstats-bindgen-layout-v1-1-0599dd230ffd@gmail.com>
 <CANiq72kcDMqswODJ0OqcqecDG+8mVn7Q43v48=ED5d6tsFOWQQ@mail.gmail.com>
In-Reply-To: <CANiq72kcDMqswODJ0OqcqecDG+8mVn7Q43v48=ED5d6tsFOWQQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 13:33:11 +0100
X-Gm-Features: Aa3M54ohMQ3p6lQrc2oToGcefUhVDgR0ZDZ9v2jLMN0YjlcFyiMJORGRekgKFqo
Message-ID: <CANiq72nrsbSuD8vbK7+h16eEjbYNviC8KNPCfJpxuNgJh0iWwg@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: Preserve sched_statistics alignment
To: peder.bergan@gmail.com, Jules Mercier <jules@les-mercier.fr>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:31=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Reported-by: Jules Mercier

Reported-by: Jules Mercier <jules@les-mercier.fr>

Cheers,
Miguel
