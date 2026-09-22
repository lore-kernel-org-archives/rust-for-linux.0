Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489645372D7
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Sep 2026 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084559; cv=pass; b=bKpABbkAbOKzcy3PypplJntaKklvCCsUy78SW57Nc6NXjlQt5cbgVsqm7Z2TnYIecRQvcm6cNDPXTPIcDAVbSC2IjkGfYdFb13yGHxsknnckDcMM+pzVHZDb7nXgoCXqFIZdc7uSLPVNaWttn3lAbotOir2lq3DvZVihyr1XyZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084559; c=relaxed/simple;
	bh=RWbJJQvfWAeHPWGm2VIAzQ4UpyfGNL/jTGHu/y+875c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evVXJ16mAdjrN1LwNMQp2Hvx+xUVQo8L59zDnxNmsY/j+5BtLSevk5XDbB0d3b953OysRb+QjMb+xvpfmZ43QwqrDnXREv9y5jY045JzoKsJI2nEsA7/nhgXGml88M9JaPCg4wsNJcL0K0aWdljV/P40qJBOg3wVColxCh/wm+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PVKFefBl; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PVKFefBl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so35583745e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Sep 2026 06:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790084555; cv=none;
        d=google.com; s=arc-20260327;
        b=kheeykckcx77YXTCEySOeET5tY8odXfP/RE/AtSVu6XNtw0cG8z3ROht3A2ppQZWzM
         qSt6th7LsPtfDY7D16qgu5n9M6nyx5MvBQ7DDUZ9RwG3Cz8MQc1vHfTUtTr1UaKjwYgc
         pV7OZQHgQ71XQwv80rbxvaiOSXWKZmC7beDqgH55jPwXn7VhUqpcsAeTobc1bIHnunKP
         IQll/D0P4K1FwfOZRhjFLBn1ZVoOXJf349ubuW3mpMcjgE8P9XQUNjJJOGwvdMt+bTai
         io52sOyAK3qd7x0Ch0aVO1p1KPpVPqRHqlWFyWZ+Q5razjHAZ2ZV4KnGrp+6So1PRfzb
         Y3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RWbJJQvfWAeHPWGm2VIAzQ4UpyfGNL/jTGHu/y+875c=;
        fh=42U4wS7uvSK2LmGmBkGD1axz46/gOouFcGHKI8uGUnE=;
        b=LlDFUpGkuM4sVmxkaq3uKcT/w+8/UvLnK3badqeK6ZkFEf+Y68l8IpbQCEHGUYw4I4
         xKvWGpU3on9YLI5sD/i8yOOC+fkWgP+4pgqNbIBRA+2Nn1/K9CwMSu7t08W+Aas7Tkw7
         +bB9WMqkUYQmid6aUCNW0wRgUpUXFE1FEOg3Jjmc9eilYn81TVvUom8s/KxT7Iq9l9Tw
         IGa5ENZRexc1AmRkTg86MMAMjglc7Rg0F91oGsHAUO61tG5ejtpSFvuMocv2hxeeBcOI
         rHq5kF9zFSa94qzr0Z6ahUrw3bXZjPVD6Vc/044Y+C3o1Lxlpt/x1y1nt9HAlgCd1qN+
         GyxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790084555; x=1790689355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWbJJQvfWAeHPWGm2VIAzQ4UpyfGNL/jTGHu/y+875c=;
        b=PVKFefBlcFOCDKy1n0QN5lHjLSrft4fKCdSbgxb57Na/UU483SjKnCQj+x1SoySmrX
         d0TGW7wrANuRhC2Lst8Unmhk2M5iJvBJsHpJAp257cp6Xq1AwScABAaQIC9nGyB1n0aR
         JW3upfYBQ+7zT3+qwM7Jy3LOiMx4PbGPxt6v9tkscTS83kQUyqtsv76ADdC5Fkwp/gUZ
         pNHnSn0eKwflk/y5274BmEMeaj9dE9qNWLZ0Z6/Vel2sKDEBxs0qMmQLGEfvoKVtjv98
         1f0bZZpwVaGUYP0fxJmlWJSlC2bPV1fhUKBBicwjqHE68jHW1scrva2Pdd76SHH7M0tf
         ZH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084555; x=1790689355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWbJJQvfWAeHPWGm2VIAzQ4UpyfGNL/jTGHu/y+875c=;
        b=BneTLEmmRPamZRAd4+sG4J6pzoCVV7iXp1cmCC4FW+av4osHY8JDEdY8QEXpZxXRcS
         28XWhO7wpcV1oa5GcGyXhbYVRWoEWpwFKYfhj0JXIYVsSWs4Uc4tQeK9DxRFgVOXZJnc
         eK7z+8QYS2sfeD1E03k9OKBtNNlXA02vGcoa7MM7+c6gOlmYvEssdYm/GvhSPH2UtRaG
         KhrYOkQuqoBxBxz/GSgTpR+4xWZFEC1iOt4auXn/ulPO9t8pGjZIa61u04/RIAM4hYLU
         luPJoqCwSQcnHs8zCdu+4r7qKjmjcUu66HJ7cW72oS29Rzf3kaYYZA62KT3xjhQxPcvh
         5VOw==
X-Forwarded-Encrypted: i=1; AKwUvBwdCY9NH28nA/DqjSbnJ+83ZC1ucHoA9k0K4v8i7GbZFWpX7I85s3hmEiyRPvlxDXBN5QlPcvgDX1cmGKWRpQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k6IakQal0uCBq88porQ73KZc3ompg3PSLEtZ0TOyh1rK+2VQg7
	UYtjHpOVu2NG1ZsGFBjdAJsY3ha6PqchQp46Xj7Cqa8AC5W4nThu3N7VZmJatl3ygNjj4F/1U3j
	Jv8cGIkx5A9666gY0zVOXGiipChEandd3kMieqx2q
X-Gm-Gg: AYBFou06lltRU8T3ywziAWS+ld/XfCu4dvh3c1xRV8zG0B+IxBJpen0+gmb70ANN1cp
	NPm2eet4rlEHXUsa0Jt9BgZpoQcwe9kXBkZrPS+D8RjPkeNzHCkn7zPLOIACPR84nJPnEO3qm/q
	AwfLdIwBZEpqk7YeLO4bBgNtB1U/QuVyBHekdneHwHpx/Ml9vwkb6kjpoNFd13L5l5lD6ZW65z1
	teYcW/OzcSXq3THWkm0xKYRN7qAU0XkIVkucyE9lseto8ZvsfwhU4TIis5hbo9ry8+Vp5s4IZFJ
	52DhP3iy20435MPyF6Is54AY8ENy2Mue7UzQ2pmNd2AB6aWHlrPpY+fXnVOpOoFYKnf5eS8EUNm
	CacYwozIkTOk/vuCKvqmhtBKQeZ9nGQMgk4zt5uc6PviRXp4x95rv
X-Received: by 2002:a05:600c:3585:b0:49c:cee0:f383 with SMTP id
 5b1f17b1804b1-49fc5734ef6mr255037765e9.16.1790084554891; Tue, 22 Sep 2026
 06:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918100016.100988-1-sagartaunk@proton.me> <KZuCCqRjSSbylbLLVhoUD9-xyBpzD9jUB4vGC16N0_hIra8SNxFeh9lEJ6FIMYMgKqf41J_swYT_HVx3w13k0cSrYYkBljOF56suy3gpgAU=@proton.me>
 <164304b3-3324-45f1-8766-536767e7b9d7@redhat.com>
In-Reply-To: <164304b3-3324-45f1-8766-536767e7b9d7@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Sep 2026 15:42:22 +0200
X-Gm-Features: AclHuK_p5XqAJq4ss3l1aLkxA8gLh1Up43oHI9_Jc3xmArdkhL0aeV3XgEseFCc
Message-ID: <CAH5fLgjBC7o4wt0WPH6xEkQEkOvsjj0ymLq2xAGXoMwN-fZyBQ@mail.gmail.com>
Subject: Re: [PATCH net v3] rust: net: netlink: validate attribute length
 before casting to `c_int`
To: Paolo Abeni <pabeni@redhat.com>
Cc: Sagar Taunk <sagartaunk@proton.me>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Matthew Maurer <mmaurer@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:36=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 9/22/26 04:31, Sagar Taunk wrote:
> > Hello, are there any updates for this?
> >
> > Also, I wanted to ask is it fine if I keep fixing stuff pointed out by =
sashiko for now ? (I.e pre-existing issues pointed out by it in other's pat=
ches or should I ask the original authors of it first ?)
> Does not apply cleanly to net. Since a repost is needed, you must
> also avoid empty lines in the tag area (i.e. after the fixes tag).
>
> WRT sashiko-reported issues, beyond be aware of false-positives,
> generally speaking net-next is the preferred target tree (i.e. no
> or very limited impact, very old issue, etc...) with no fixes tag.
>
> Focusing on high stakes changes would be appreciated.

From my perspective there's no issue in landing this through net-next
instead of net, as it's not urgent.

Alice
