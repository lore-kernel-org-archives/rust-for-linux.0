Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794316129;
	b=PlBA9ATrqHuoPRFQkDiKGdomWyKAtH6pNs1KoXS3g4FJzjt2SptwEfmv5u7LmooYP8Hl
	 SOJlyvwEF01vuFa24qbP2debdJl48BJ7OyFGPa26dYfXE4Cbbi6hIHM5ChweDU5xnXK6F
	 i7CLsXM6H0y7lR9/QNw+dPYhHwmIJ3S8OiHW9e6fqDNXoFM9LoBeq/wKSbQBOzw3XodxP
	 ME0whKMZEFec6tkcf9fq6JjeFMu1jcCrit3QulOpjqhEoYwMRDeY4lUZJKlgxVxW/tyCg
	 H537VB6MTgxC5xUWjVqpo10eFY043IbOKyszz7Xsy34uAZ1zLFshrmud6VH+AUJwSog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lwPNVSNlkew3F2R4ktcD0VMpp5KsF+JMgwZJdVfC8n8=;
	b=ThDqTMChfvbIQeUBeNtSgJZ1BHoL+zMynsFNEwUgvtKmNJQS+m7y93wLVK/2jTXZwZNx
	 Z1nd2FeAG8sAMLgd3rWHeuDG96XZD244RTwyI/3FKm4D7N/lal/at2JZoPu7h8gtKkwy0
	 FYj/tyoUmPcDHXIdFofthR0H0+G0lz6D7bC5Q6sQ0Vx8v3gtN3SfYxVNO6r4FYXdXc1/x
	 L8E+qlJi0XS9DMK6VPbxI0Yfc+AsHez6ZXJAXhE0tkJSoFKHGq8KGHx+0rJLnvGUNK7ad
	 OfNEDOlRZqsZrhohve99cKWh1oA0lQhfwZER8ET1ai7ZnQw9sgAiZ6bWZlKVdQGsRdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVrT8KBO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BA1606A33E
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 13:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0BA1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVrT8KBO
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e90071735so332105eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 05:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794316128; cv=none;
        d=google.com; s=arc-20260327;
        b=lGEteP5dLV5uLojHCCvVDyom4bDEjhnBB3QDLN0XyghRsQTggJS+Eb6TZGjZmHVMHa
         Kzd8Ya7XhvHyZGv4fGQhA9VTU8slOGjrLwPkArq+Dh5ogF+Lp+J9zKmO/84fMfHQ/6F7
         5O4BF6E2P3PPDye2EVYE7b67Vlm8YVpKMsxXtRxSUxglhnaFbRf46X7Cd2gasQkubc8d
         LtMd+JL/FA9qdmTHOFRn3f+1A31DsfVa1hcHPCy5A8njOnu1oTUDqT0BFVjEX02ugN2b
         UcAFQUHu4qrx9LQ4q/dNJPUnZXc1fEuZWnLtXpsKRQTJn1CjqGM1RHXzfBo0+qFAx7Wz
         AjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lwPNVSNlkew3F2R4ktcD0VMpp5KsF+JMgwZJdVfC8n8=;
        fh=AhVlmij3ZgVRRbGtuT5NtsEsHGEpdFKh9skilT1hNIQ=;
        b=iwe7MdYY9DGHKZFfjSzc3IZRBHss/bRdtqUouZqlkGDc8aaPvy6UR0arhb28shZLzl
         mkq0giJAAMZCjaQ1KsUcZUuO0X2A5fvs0Uo6uVBKKrz2wNdix+Vl1oeeOb5wm3UG3ttJ
         TL719sDGaTRIsACkvsBtEL3L5TYyxF/7qbRROONf+2pKPyeUlhdSYgAw8HsOGiz72Ofl
         7JbBmpvAgRcuiQtP5YdkqbYtQstmH2Kz1sRN7NCrY6KzJdUlSWl7SY0C58MJarRmDpQE
         3nqkZ3P27+t0x6bipPabrERCqIFiIxbGETJo8B+H0CCerJRLeZVKC7zdX5etNLKVh9ff
         B0qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316128; x=1794920928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwPNVSNlkew3F2R4ktcD0VMpp5KsF+JMgwZJdVfC8n8=;
        b=mVrT8KBOFQHiA7z4fuQ6WmH3JBtWXX0xakj+PEnmgXuvburxdf7+xNvhCVNwZCYPKm
         yl+8VzZG73JbyIkcsj0wJdc3kiBnfzZgpncHr3EJbCwvuupX+HGbpiG54UkrvaR0Lxh7
         0kKFypU/SmpBmn2C6nnoLsG7/8U3JAFF4XZgTzWzTpQZGq/GihDd1Y1YD22s9PMYkRmN
         ZOhG+2Xtx3lNnpsOOVK/X+5WCk21xSGd1ms1sIk22eQ5QIzMCwEH0756mDhvkuYIaVgA
         9CA8MJzzILlmPdFwcujOxaL2EbwwHO/F9vyi+kGK1V3iUHrtDiVzU+dlqUDxe709/HZW
         i9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316128; x=1794920928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwPNVSNlkew3F2R4ktcD0VMpp5KsF+JMgwZJdVfC8n8=;
        b=s6KOKdA0SgZ4ROhMFbeVP+AePJ0bm5Sm8edKU9J45JJaRvH4/h4VqnJmhI/yJCp5EK
         UzKftdpI4oselXGZdZBDd/+ZONzNh2cjX9XmbAOh62kazWKSG7UeJnncHT8BWZ8YRdUW
         OJdJW+1U0KnWNRSsVJE712q/GKsrYv/7QPliOpTl2yWe9f4H3yrKzUmgdOzAWiUueJwS
         1oOFVpeJRWGGclMG3d86p9YCjgvdoySI19X47UCpCE7I9rwZ693PhMHl20bt/aJ9UZVt
         dd6rJKqSUmOwLDabEDEVm0CPI4SzoR2bZFwZeHjfE8WCsQ/usAxYCeChC7Nimd4evwun
         tGcw==
X-Forwarded-Encrypted: i=1; AL+hErE48RcHXag1ooDqvjhElPy8snyGi3ZwAXlQCq8IDkS+cpNxmNptoHRjqNH34iciBmmEPSfHx2VebBCZIhO4Eg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/sLNmQV8ThO1YoOZjLG7fxl8hPGuAFkxazqVsK/MmuF6jyXnVG
	aG3MzAR0JLJGldk2TKNxE+unNOYmUnbVmA8349oyIS/3KVpAoUTAKfMuHyeENJ8TtSDQ2ZKrarj
	925ikIG4UuACVs2u0gBn8zwpgtT9/Ygc=
X-Gm-Gg: AYBFou1NDssb3Pnn+XHAd/8Y0OCLGD3LzAi9PClxl3QjH8rVUXkNBlnW+T2cSZ8cF1x
	4q2RybqcLPA0Lg+h/1X4iLur9DEZDuJNI+zGzI7xbQdxGvN0lZqSPlmuym6J5Q1TwVAGgUdka+N
	U6FQtje2qmzBrxlERTGhT8teeWc68GtP7mQI+JA0ejb+SzNQGKQoO2p0Iwf4aknxMlhXRoih2zi
	9Z+RqORBWTrnjG2aa50u/Dq8BkOjaqMZ5Pn+I2rMePP9W4/sNwNtxKWM40nPWO1b/TajU94l0oo
	BJYTd6geRvBsgF38Ou2HIieSXTo8z4NVG4qeYy+HyxaFPuGO6LEym3qA1vzfMIecxp4vgN8s+fu
	vGIXLHIaUAmhEn3Y+yJIbqxkRUtjUmPzBuv7Luv/B71obozahpxFlSOzSkPd7jhMwKhQ4pDTvIb
	IWL+HRe3a3FR0gB946EoWJ72k2GBtwcxxGy0bgUGv7/AcdjdzR5qIxXWjD1T44Y1FpLhsPH2DIn
	xxg5ybmIuWsKv0Mos1P1m+aIVbSbGIKGJEO6V5T/1PFgmBWffPIfQet
X-Received: by 2002:a05:7300:fb94:b0:375:f846:5b3f with SMTP id
 5a478bee46e88-375f8465fb3mr1784796eec.0.1794316127719; Tue, 10 Nov 2026
 05:08:47 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-ringbuffer-v3-1-b5d74efa8dc6@kernel.org>
In-Reply-To: <20261105-ringbuffer-v3-1-b5d74efa8dc6@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 14:08:34 +0100
X-Gm-Features: AclHuK8StyFCt2vkuC3IByfxwDTE13qSe3P14U_9mHZMBq8D7aACpxOFRqzfsdM
Message-ID: <CANiq72kXZVxqwf9m24qGBXEyZi=dM9Zr9D0XiZGCYaEuYvDVyA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: add a ring buffer implementation
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:38=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> +//! A fixed-capacity FIFO ring buffer.
> +//!
> +//! This module provides [`RingBuffer`], a circular buffer implementatio=
n that
> +//! supports efficient push and pop operations at opposite ends of the b=
uffer.

Please add at least an example here :) Maybe reusing part of the tests.

i.e. this is simple enough that we can use it as a simple showcase of
how to write a module with docs, examples, and tests.

(And ideally on each method that may fail showing their `Ok`/`Some`
and `Err`/`None` paths.)

> +/// # Invariants

Sashiko seems right: this is missing `// INVARIANT:`.

> +    /// Returns `true` if the buffer is full.

[`true`]

> +    /// Returns `None` if the buffer is empty. Values are returned in FI=
FO

[`None`]

Cheers,
Miguel
