Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC01817DFFA
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025927; cv=none; b=PIO+BsGCXOJmRyAGchq+bskAlGJ210+r8WaiXG2RsS9Dlxqavf8c+kKk0r8aA4daN8o3bOND4Hzo6yAHai+s7v1BkBFxjPLl+CF19h6exFRZjxd9PvtA2L1pzUKhgSmT7ODn7QYZg815wPYRbQiwdWK4TVqG8O1yHsypd0j1jlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025927; c=relaxed/simple;
	bh=/yWvJFcsfLY94VZatJztTeqYVUp8nPFV6zbHdI6TcWs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E29LixnaVSVQD2gzhdw6ezksrlAcwwBpPqVNLVRTMIPsUrfsevnIhxzgKmMP0ikQm6nXn2cv2dzvKZwkXkfd1DPxuBC08S0gohcxVngVGJn+qiolW+GeAHeh6mankyL6jOdr+JtkclGMq2+nCNAHlZjM5G0wbw5RL85E3SNWXVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0ogh5+Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0ogh5+Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718DD1F0089D
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789025916;
	bh=/yWvJFcsfLY94VZatJztTeqYVUp8nPFV6zbHdI6TcWs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=A0ogh5+YJ4mrzndWK/Bzhf43E2ENxSbGunrSTbVEATb8hZEVaoNotU/Ntg9YeE/a2
	 528Vg7qmxg8VOSCSagO75pQWlMftga4oCSED2W+08+Gdtb6tTc1d+qxcc0/y/C+nWR
	 XZCxuJoxMYXL30l+BTOxWOJgKu+ycmBmhBIlgMS2DnFltwp8Yzh0q3vpfwqC2khun1
	 vpG6489pgs68Esy2QotTGeoyb66pvOxZQmEX3JryV3TnQgIjkI3uF3mIeBQ2x9v8Sw
	 T0wm4yORaoOodxNGVfM9scsBDdI+xsuprg5NJJdDqrFMjTT0UlXHyPNnDvMcqleoDN
	 9yFO6e+2CqCJw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a1f75277f3so48384781fa.0
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 00:38:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByfIM33eVslDaAkLQORwZQhVMl7WV81P4jJtH1GyW8ZguNUpaNNlgoRr8YrtH+2R4yg9xyXEgHA8IPUldEtOw==@vger.kernel.org
X-Gm-Message-State: AFuF++kfsEvqJKKyU+LSje87y1OYAoarSW7b8TWvb8TcmfJFINySXstE
	HKfN61ZNARQtoG61P/HfQEYnF2rQL2f/JYbLNoW9TJakcjSZkafMX2JS/AsP4Iv0iHFFDEASVv+
	Jx+4BSnTV+RAGpxVPAJnf1D1VErYKEwPCcUTBe7n1NA==
X-Received: by 2002:a05:651c:a162:b0:3a1:b658:feac with SMTP id
 38308e7fff4ca-3a371bd3747mr45593171fa.13.1789025915093; Thu, 10 Sep 2026
 00:38:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:38:33 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:38:33 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260906-add-rust-gpio-consumer-v1-2-24d192f93760@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com> <20260906-add-rust-gpio-consumer-v1-2-24d192f93760@gmail.com>
Date: Thu, 10 Sep 2026 00:38:33 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mer+rTE6Rmqo-wHX3D85wCppCm-A=SUw3zASTB0+JOD5A@mail.gmail.com>
X-Gm-Features: AcwNN1W1gzJdXi48l3F_-WSnJKwsjrm2sy9oatIc3ZNuHBR-db1aIy6pIqXYBKE
Message-ID: <CAMRc=Mer+rTE6Rmqo-wHX3D85wCppCm-A=SUw3zASTB0+JOD5A@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: gpio: Add basic consumer abstractions
To: Kohei Ito <koheiito.dev@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Sep 2026 10:45:50 +0200, Kohei Ito <koheiito.dev@gmail.com> said:
> Add basic abstractions for GPIO consumer APIs.
>
> Due to a bindgen issue that may generate the wrong type for enum types,
> `gpio/consumer.h` is included at the top of `bindings_helper.h` as a
> temporary workaround. Once the issue is resolved, it can be moved back
> to its proper alphabetical position.
>
> Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
> ---

My rust skills are still quite limited. This doesn't look bad but I'd also
prefer someone more well versed have a look at tell me if these make sense.

Bartosz
