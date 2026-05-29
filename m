Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05789400E01
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 20:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084942; cv=pass; b=qEWK0V+FlMm5IUW6ZV6xo/se4Gl0SryI/qNOhNKCxLsp3DAZhUSnj3g1hmPYBlOOtMTp8rQY9fWpo/oi6oTRG9tQqU7fkO73MLaCYKYCoRAJOEB3BXiDW5p+6Sx+4XQij3Mti6Piqdnd5EqlYkNCDBOaBPvmVPzCJoPtid0L4U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084942; c=relaxed/simple;
	bh=Beybb1FQvkJhoq0J6vM+xZ6YJFGMgrZMkSVqBvo/3So=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkQBKQQeOqFhYpjszWisDJhD4jOkq25fRZ01mzjUVUsMmORs3jMHAJ4CeLtBokEBGoSceXVnfuD1g6LjfJ993P+lGNVFeSivP3zKQda80KilN6tZJ8KE2JwlL1UKTncUBES2/9XI6xrI89agwrVvkcFuMNAnPciRSdwCvcTwF8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/AHk6rW; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/AHk6rW"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so161556eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 13:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780084939; cv=none;
        d=google.com; s=arc-20240605;
        b=dMXgUOwWjKXexACc0T+nVLPGzxPGm9ZbcShNyV7fD77syMefNFsz87S6vMKDUM+8p+
         8fvk7j/nrqyRXD7yigitpMq0cF+1UGoI06wSjRAQzGiWy5S0zi6+WmtGfLZQW+JfkCnr
         HvtLCN5mkgxC0meO3XRU7GmbKcaky5PSt9LqGrSumBxtFPh0rYEGmLjzh8jY40i4mDpj
         l8gUUrV8ykCzc06SxLZzSfLFwZ06Y37mMSb45wan7RJzZZPqJt6VjLwuS1+6W71DLfkM
         BX28+Oh1tEFZQZHucvyENwt2GRnxIB5e+LVTT2jNQw5tyDgpBbf/2nr4JMLT9uhMTJ4v
         bqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Beybb1FQvkJhoq0J6vM+xZ6YJFGMgrZMkSVqBvo/3So=;
        fh=GiGDOE5tXENK6u2SztA3v4WJVIx1jDD0WxcVpcsmEpw=;
        b=c8xXDGZohXMJ19eRMxWxB6jvObPZ4Wieb80VN5TavVQVRjze5ffmsCXDkksm0ycbGi
         iYcXLcOP8A+tAlz0AuGEuLbRv9KozWJqiTMqmzMHpEByWmRIkvbN852/X3KYfTl9SDGd
         gVPP2Z9ZdEyt41SucnI23F/QoWnqLLxJMR6HUXpZGNbezaooAYuHeTn0V2zVlAsShzwP
         eolC8mVBl+1+t5C8qBwapsz/7mjOXg7Dc7kogVKqSMwB0ldMXhBKKmwjJSvekDnkG2os
         tgmv2yKqAuws2K+R8pq9y6AGpSNLrbsMoeiD04SO6bTF3rwlKoeGMc2E4j2yJPpc7fpN
         dijA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780084939; x=1780689739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Beybb1FQvkJhoq0J6vM+xZ6YJFGMgrZMkSVqBvo/3So=;
        b=n/AHk6rWv5gDyOFvDtsypN8sY+VzIlykz6oxBbRr9kKx8W1wFqSkXUKlsvYXP21Esc
         yd71gG6Po8uTengblAis3hxCsW5We41m+dGTd43U/8NHyMxtO5+DVL/Hc7wPm4wr3VS+
         TvbZfVS8/SDEIarM/K2UUUtA00ezMMdTVbrXi6eQ3oTvqMFp3kxY4CxfrWmCm+2T51TT
         yjDDtYbkWRQWSRO3crk0TXcoor2VVw6j96DT6bRiWe0Bl+E4aP69qVssJNjzQMGdjoZh
         zxqwN+puSF1oOHEUOUE/OHwffdHhG6Q3QTS1dXMdKvS/MlivO8C/wy07VrfH23Fz+W0D
         Zp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780084939; x=1780689739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Beybb1FQvkJhoq0J6vM+xZ6YJFGMgrZMkSVqBvo/3So=;
        b=l083pKbgIHbPUPrz5ggs7R6Sygu1tmaz0rz92VU8oSfgQ22NUMrrlxjECU5XQMrpGn
         ycIzwR69btU19Efpr4L8WsqRZPQqu4/L7SbdRkyvVLJPtGTbj8vHXUWltYrM+M9b1dKE
         UhZo0QIjLjB/qq7PayfUcLpcsOLQHNqBT+IIgSbg0ob6RsOHroD8sgTGf6k7r15rYcmo
         kp/hjfylOPOUZwGlkWIRZ+QAub1iQ+hOsjTusUcgGUBWDDrwkcVFd68Q1qbtYylZ9JQU
         mQRpDBcl3wq7qIHX4z+v5E5kji89Hofkl/4TwoNqhbEoUChCVIvDN/KnfJfB5/PIVSTM
         e2QA==
X-Forwarded-Encrypted: i=1; AFNElJ+0oPokuf3QBrxThdjvQO/DgZ5LG/2MvtFLN/FVgm91Vh1kxczdpVd3gUu4zFMJn7cidg6B3/48qS2mukLS0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVbwo/498Y9d6yJGJLnu8si3POK5jNkymDPTre6aDzR2hSANKl
	CfWPKiMKuVkcODsQhp08UkROKlHYU40nqIPEUmCoABoJzzggoEhT7uwd6CpQxoo/4yGZy0tTcS6
	VZDA1VjkgluPOhDEDOa+3SItzQ8iueas=
X-Gm-Gg: Acq92OFGsyZu6Z75acwU3HzrkMhRssj73W3qMFFFCzVdPgJhgyS4yzDw830BQFIF8N5
	Bm7tmwgufFHpenkDq7vPasLtFg9NGH2IOxF12ucEc4y1UyQT21rk8B7wRDljne4Ui3NsQ0c6B7c
	4G7G+kWtMRH5FNt2D+h1YhF/Vy0G+dh9Zt3XXTSPuufr/zLo3Hw+J55dB0wjVL7l73h178eaap+
	L+RRnctFLCtZaAO9j6QHD8Hcv1nJOeJOdxriRmmLr/d94KJhEyWHpnvPAMkRZeKz6r5gF02Q1x5
	bOAyHiraJrae5RaVQbd4AardAceDmbs2M7tm3LlmdIdsgxq6VklchuI06TWAaRiMrsV0DhR5dKx
	RzECatPN+Z3mUx3gCWHdLfC4lz5yOQs3Dlw==
X-Received: by 2002:a05:7300:ec08:b0:304:2af3:5fef with SMTP id
 5a478bee46e88-304fa70effbmr272371eec.8.1780084939083; Fri, 29 May 2026
 13:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-rust-hw_random-virtio-rng-v1-0-b3153dd90311@pitsidianak.is>
In-Reply-To: <20260529-rust-hw_random-virtio-rng-v1-0-b3153dd90311@pitsidianak.is>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 May 2026 22:02:05 +0200
X-Gm-Features: AVHnY4KHpD9FOOlIQlr-gEq0KcBxVKz5BrteKsdhYuqZIzkx0FbA5_J74LcTsoc
Message-ID: <CANiq72mU=yQ_L_D6emvTj4c5E_ankLFvpXzkE7yTfcYfLB5T=g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add hw_random Rust bindings
To: Manos Pitsidianakis <manos@pitsidianak.is>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, manos.pitsidianakis@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 5:50=E2=80=AFPM Manos Pitsidianakis
<manos@pitsidianak.is> wrote:
>
> A virtio-rng Rust driver that uses them will be submitted as a separate
> series since it also depends on the virtio abstractions series.

Please include that at least as a reference to a branch or similar,
since in most cases the user is needed to evaluate abstractions etc.

Thanks!

Cheers,
Miguel
