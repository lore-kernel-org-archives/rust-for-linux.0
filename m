Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790BC3AA4F2
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788688181; cv=pass; b=WBpEvWTbJp2hDZ413D9v71ZJ2yMjKdc4EniWvwWW+iG2RO51RL3Vv2wYvdLY+iev9ZKwKsZuQlO7aDg6YF87/177gRUK7Xrm69ZS/GhMe19p4Raed80PkDYsCgDn5WnUU4ckMc9hLA7xlxP1ZH4n+kwl2uvmLgfNSi2aPNEX+xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788688181; c=relaxed/simple;
	bh=uFo1S3usMCbLdEWy9LjKCdoBjHBFRVmushfAGQzmLtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUMD3PZc3Up6aZ27EC8zzwqcXgbIeM87nsStykjsFo28pYwsiM6ozUzq1slFACicJb08ikV2DMwKTNfvZIFpWxhcNO/MaRqEG5JMw+mcbd5pCpHpgQYw7PpXW2uQshS7Bz60U/PfeKGh71W2QFItxl+cWA17ceaxUFgpWIgnrA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7u/dEdE; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7u/dEdE"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9eeso134968a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 06 Sep 2026 02:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788688179; cv=none;
        d=google.com; s=arc-20260327;
        b=ZHOWv5pRQaKAn6vAeKtr7TVp5YehO7Urbsej/Tflj/mo3Q5k1YzqlXLRM0+EqDhrwy
         AK0Ar5ESEy2Dj2bEXxIKGpgjcQthNljwkuVzto3QsGd/L3AibhtjQNB52AEU3yF8pmQp
         slD60l8PvZmkQZPtGW3TLGZUPsmX8K+jWdAcB0VshBgrbJ/n01VG3voN81TNEHubQhjP
         bPYVngDgJGD92OVK+MbXnLCJcYHc8n2Kuxa+Zhl4VnJfcKCDvg3IDrCX92UqmT8CaXFp
         Ew/5vKR9Oa33r7ijAPuzTFCxJOI/nFj5YSh6/9blZ8+0M1e5X5LHRKljEWY85sqWtVsA
         MphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uFo1S3usMCbLdEWy9LjKCdoBjHBFRVmushfAGQzmLtQ=;
        fh=gslTcfEI6324NIQf+SiAhAYZestqHHg3ZcwVVM3AUVk=;
        b=BOhEhf4iQj003HOpQpPD6VfA3veHH7iDHz2U7ckTseeeXF8jL7H8mwwa5fb2btrtDP
         r3C+NMBQn2pVl80g6iNg3hhv5kb5o1UFIjSTJSgDhU0vGGB1c1DsM0jPF7VPRp8tSc2y
         tTb1RDK6PgNg6of5c2kEwETODJHejPXqB3nDU9c3L//bPE/l9gqAXTr/qWlnbDj9B2Pt
         82qDbIYkyznxX4upbg7oOKWNy7ZCSL9cWAz4DK5XtdJNP7gnbiZ8hK/4iyzRoTi+68G9
         5z3urZE2FKQ1IroSMQ1/o7M+9yvNk0Coh7pIqWrY5x5HQ1jh7lfHjl80/rrkYxwVETxx
         k5Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788688179; x=1789292979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uFo1S3usMCbLdEWy9LjKCdoBjHBFRVmushfAGQzmLtQ=;
        b=p7u/dEdEUWtYxwBHACDb0DUPEiPf6Ws3Nae4hmhP/OwHgLd94oQKd4soQaRc3avfhz
         BHP0ilsivwepnwbrcFHwHVN6BxR7XJBqw79A/Fmlrf1k7gsk+dKiNuCrRqZnwSTRSUTX
         Z9u8aYpymZCACxrpSY/8QQZ31fUwiuSYiGLArjB1PwPcNDx2gFunNqnmkohnALi9RTgu
         +sGGZOru/AtNAjNc7VWrcLrqYNBUMrNMYTSXEFx24Q1vAl8r/zuEaF6hTVAHGpIKyjvE
         wGR4F2jL8fNx3ElMJ6KeKH4uNvVyZJF3FeC5Xb62Y/wNtECnwrKw/5yxpbyTdaBn2A6L
         Gpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788688179; x=1789292979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFo1S3usMCbLdEWy9LjKCdoBjHBFRVmushfAGQzmLtQ=;
        b=CUO0js4SiMcAjSS4o9HRSRmw7ikAz50NuUEUe/XOrVOeiqdUtIZ29UgnCL5AYpkhBI
         6oKP64DthWq0gwPRUoitg5jx3d11BDt1+sNDpKhgbVDd4wKZ+m5cz51TdiK1yHHTXKdj
         2p5yO6RoxX3tH4CKaho3W53+zm5KpZiuhNG4WVHbqVKDxyXTNKDX2k0DIDwYJm33Ylyl
         f7C6yJHn1LjwLiGfcbL2IuCrW5VanGzBYqjorsd5lxzfPwsWB6LNLFRsD8kR+FONecZm
         BQ6bbfDa1Xg3WpwAEENC7XVYZxfhF1Cq60EIlV/L8azf7ds7GBVqtV4PysBaH5JljGtG
         dcJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCncIK2wECviwsWflniel5RhrxVLq4rqil3BdrGhagohVl1GvLZ9FNPePuXYS08x7VLhpIElCmH0fDJ18t8w==@vger.kernel.org
X-Gm-Message-State: AFuF++m+pTDd/8IcMj7Hg1Xb+KrzK0my8nmaAeAUuHqWYJ0AQH7W+kwq
	T/dcoh1+fWygrUC8SouX6uWc2ybEBQKJ0PwuZjrF3ijpF8xNHT5BcvCwwm387rJiPiVJnTtduZN
	aQq1iQ9YhQfedZSJnYt1jWFWPLTM+Jb0=
X-Gm-Gg: AYBFou3X6dm5kLLl72o4TtdEYnHrNvqFZFuwzPwxkgaa30AXgNXK4XNAXZmJnJP/3xX
	rinQO84MHk5Y66Z2alK1ZGJO98ZnExZIPTWGLubHhOM9O18HZUar+Ss0BUGVMUKWwU9JVSfbeKO
	xrfTfvnxM2CLodAIY63KVxMtfET3Lphkj/iZ2MB2FRAbd29L6ElCHp2R6UzT8ODSjtsBobRudUm
	hsivVIBexDhrfJ7ijCemZw6E7r8uYgeOakqLNZqbMRwDAa+PAL9Uv2XEe6pkI4Scf0Dn2j0rbUn
	+YNTSzk64NlkhQronIq9rlNx20dzdjHzsuG4iBHUCgqd883JjW1FcCyBjGM2/hkBNGdHHcX1Sts
	ebG3LOJZ0OLP7GgtgmgRZQoefxBWDdUAnr7l+5BLju/zovDvFIUBU8kZ0yKGm5lkmPmnBhv0=
X-Received: by 2002:a17:90b:578b:b0:39b:3510:4af7 with SMTP id
 98e67ed59e1d1-39b3d5ccb8fmr10221355a91.1.1788688178890; Sun, 06 Sep 2026
 02:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906071635.160615-1-sagartaunk@proton.me> <20260906071635.160615-2-sagartaunk@proton.me>
In-Reply-To: <20260906071635.160615-2-sagartaunk@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 11:49:25 +0200
X-Gm-Features: AcwNN1VXiJDpw7Yx5y7AHks6u9YshI7REEbxh0m-sHpFxLllVsN403pcWq9oNiw
Message-ID: <CANiq72kUVbdGGbMnWTQp6kAoq8pbddRVUOPzT=0RjWFf5dtQ4w@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: net: netlink: Migrate to zerocopy's `IntoBytes`
To: Sagar Taunk <sagartaunk@proton.me>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 9:17=E2=80=AFAM Sagar Taunk <sagartaunk@proton.me> w=
rote:
>
> Signed-Off-By : Sagar Taunk <sagartaunk@proton.me>
> Signed-off-by: Sagar Taunk <sagartaunk@proton.me>

It seems you wrote the first one by hand? There are two typos there.

Thanks!

Cheers,
Miguel
