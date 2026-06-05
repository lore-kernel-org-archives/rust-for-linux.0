Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A679547D94B
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 08:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649308; cv=pass; b=e3Kfr0CqR/q0oN/8eLvjCriDftzTA3/W40P13nMlB9PlbrwpCaB8SqxRGZrsiIzE9exZJkLNRy6PvDwcbPCOPgsDBqEYpO8zHZdp9oFsysX34bwqNlW3dR5iPLfrlhfSoEZg8L5z/fU/S/3TVQQ5VDUXof1q+ZpE0p4sPrZRFG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649308; c=relaxed/simple;
	bh=t30JAFeGxUhlx2yZbt8/VaZkSxhoi+xRWFYAKjEhn+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K05XnZ6YuZThtrEzzf+vQ/x1KJ/6BlXPLMXMUhwdvlPt83dxtTTgETHzJP6bfyIhYhGoy3uHbzuB5mLuG9rpwxp8TNLi79rz6LTIZmP9o6CIO/ExO9i2wk+ZJkMnBlE9Kh7rWCYBnFlvD2yWDUaES49vd61L5SrxwcoqmTFPdQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLRRiEmn; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLRRiEmn"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304eb0fc233so145336eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 01:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780649306; cv=none;
        d=google.com; s=arc-20240605;
        b=NECL48/VhckKyiYDePyLDqWzwK0SZvpJvtPVIWasdZ/b2EjsML+WCETn+46Y4zEK1R
         7bff+JZTemMR1ILu6cOy502EPAu40OHWvhbUWyLmR8d5KNhHMgAuHDct5gM6FuUdTDqj
         dY865GBLpX+eGqqNkPYATx5OpYe3sQM0oOxR4E/IrhKw9Z9ah5GIlZl4aAW+QaBaKLmu
         WQ0r1iLT6ih6jtBw42Xd6B2H0cFvoMMo3aOmQ7OJ8Q+WwgzC9OHXmBWH59vVFDpUEV8w
         Sz/iHRG+04wv6NR4IlQS82F2Kt+c5VLDvGWo+13o27h4lEGiLbvcksPT/oqcTvIe7pO8
         v4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t30JAFeGxUhlx2yZbt8/VaZkSxhoi+xRWFYAKjEhn+g=;
        fh=jgGDNNJ3tt45OZuYaXxC+quZaHQuQnTIaS/LxDJgI9Q=;
        b=eWosktRNnMGM5WKDgxTcSaR/S92jRF9Wc3TK+KTNfzG22OQaYDItlpTgT3qoAeA5vD
         /sXwZN3kkaakZQw4lSEGBTwtVUllMR3/GBGUFew45Dpc8IdPLWg7JCJhcIHX5jlwLolM
         v6Uk/KhtHXrwnjAIOy4ZlPM2PTQiDkiHwqMasAIxrzBs5WpxGqwx1gHyiym4A7GSbsRc
         cQzipaT5U6y1DpLA+IoC0jsaM1/PJIDZtoBAHS1ZsGLUlGI+vEIa4X11YJBOqEC6IKtD
         RM3wNkHiTk67qmvU9YiYocQqKzD+sSZW3cpxWUdj6QSA/26Ro8u4zHQpZjt/ButBrVrh
         23Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780649306; x=1781254106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t30JAFeGxUhlx2yZbt8/VaZkSxhoi+xRWFYAKjEhn+g=;
        b=tLRRiEmnwsOH1yOPao1chqAKiQ288RLmaFsbhKXRMrfWdzQwttD8gZNLrH8hA1mQq/
         dzWNBQ1IpSnTlybccQ9EjFZ4XUNs7DfKQNwEPJKDldpjAxnz20PxIB7nn64TYkj52GNT
         dar+KXraYjJsWUJxL4Uq2n6GxBmwu4rAJCBoeY2fJazdn4YGw6l+Rdnt1r+36EZHhBAp
         c4JYV52ZBg4i589s/YZwPz7U9devEPAZu76YwOsOXp9SjgndTm418gY70nnnn/hMA82D
         Prgotuftw2cSXKB9rR2fKHOELVLTZGuc0oHtgazVU3LsJIHr5tnlnIfReTtWejEngWdr
         paVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780649306; x=1781254106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t30JAFeGxUhlx2yZbt8/VaZkSxhoi+xRWFYAKjEhn+g=;
        b=bd3kPxJsgVT3fJCh9m86mTtXrk8NDWqF2TwSdqzN2FwiKCaI1Qo6ByrO6ajkxJOwe6
         L5fEB9R06k5uD+3jBp4nzXXmKvNakBdw0R1zqKQ7lK2rw9dIR7Dt2WX1amcwE4zUpkKW
         UdeDhfQssg1nO1saO56QaNqD5fzBWVuwzMWfiCZi4g/B3ouTFDAKnJfFCSwqrHrtmrKQ
         3AAPAMj2NCauJpc2Ve5bP31I9EDyxyJGXabHkVFuS52Fx8nMWquEyPYU7P5YtAN8vRHH
         StF45BeDJ45tkrE8GNfFPRv/Ob01+Junyvsi6bR4xBvbZVOtFIoLNw6TRLNI40OmQH3E
         gp8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9YXxfPEcpxnktt6D5tKvUd3jMXmHuMGKDAVuryFKygwg+BJfe+dlHm6nOZzkhvF5OZcP7NaXbXzbn34CuDGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2iBjP/4heol6JyLesRUeZWOQNwMTB9YaMLc0JuuB/umoWxyUn
	euNFkGbGC4e/FKRv1KivcAHFbryhN+Ev17zceh0hDMT2IMEdZsAnuWFvpJ5Jtvf5kQNko7aG9y+
	S7L+3DuNexITknE+7P2a6nGDgDKx6iyE=
X-Gm-Gg: Acq92OE83loXGaF5Dp8nwX3XzOLffMgO5tegHoOLfK0izuajVCRqVpe1gyx3HB3AZ1Y
	w91gb1wKRkTWJesMq86fQ82RfUW04l0XP1vKlkgm/iElUGz7XNRQVjuk74qiCQlc3vsPKObabRO
	UImFqoWYdJWoxibM8R/Ikov2SsHBUnmz/gOhg3b3Z0TUEaQofCciJxY68kvCqkrFdnAQNpm2vza
	NjXc1YSiY6U8D8AAqQvAs44PpOCCA9h+U3ZPWdb2BAX7sYBaqRs6GyFeGD9vK0Ok1TZlNrMJ95T
	4Pn2Q9MxTxoK1x2V6t/yVuR289hcrUv8wEgCNyNpiS8B2KYUArwvfNYSJbPjgesUhlMQn9G5t0/
	tArJO9onCcJt6WU/SXfrdkw42zNt3v8QDzA==
X-Received: by 2002:a05:7301:1e4a:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-3077b3668c1mr552123eec.3.1780649306414; Fri, 05 Jun 2026
 01:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 10:48:12 +0200
X-Gm-Features: AVVi8Cc74TRwhc7yjE46MLUkC2_0K6dWthB_1BctPYhz93WSvkLnW5tntk2yBNE
Message-ID: <CANiq72m54FU+zqhhGCXC_v2TyBA2LjpgHbU_J=AFfpWZLM_6_w@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] gpu: drm: nova: enable calling into nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 10:32=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> This series is based on `drm-rust-next`. The current revision includes
> the feedback received on v3. In particular, moving everything to
> `drivers/gpu/Makefile` simplifies things considerably, and I have tried
> to align more with what is done in `rust/Makefile`.

Thanks for reworking it!

It looks indeed way simpler, and is pretty much what tried when we
discussed this a few months ago (well, speaking from memory), so I am
glad it works for you.

And now that it is also closer to `rust/Makefile`, it will be easier to rep=
lace.

So thanks again :)

Cheers,
Miguel
