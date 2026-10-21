Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792583068;
	b=gGYhZySMlSBnoHN7KS1pYtp1C9LN58rjxQ7W3vCjXaN9aLhGJPRTVsm8nGYit4vaQ8zu
	 EFVWDaITd5cXW2PWLgTnFeKV29NCJq/5HPUlUosh7rwotxDiiGaddCWysL2KGLL+dEVPq
	 tf0p4i6T8YxEwML3O2nPcccxVNhVRkqt+FjwtoXxGOFGEL8nlNwVwxOWVemYuLTVDFvyz
	 NUkyQSB0ruak29o1c8RKZ6G/Ltp40ePYiv7yTndJe657PzsjPGyPOJ1acQXI83kr/SIKf
	 DFBbHjh47hvbry3zQtPlaRylsjHV7zSuKDtxibkhwE1hVQPOV0o9FtdwojXo2nbLpTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZZYr3eBHIRZzy2m2KZECWH5MwINu9our1XGNLE3fKJc=;
	b=GNglEfQokFpp379cw4KJdxgi3aSUE4tvvCYY4RWDe12s83aueeuS+f3e9waApzAGCj/M
	 m/mR1ED7eU+eY8us6asDd5bxljAgvvvx9NpXTKxExpikn3EQXhNkEv4oFiTmjG3S5ZEHl
	 OeNgQsdB19yuqNm5O35/8du1z2MazXqmx4qaBdmbM4RP6AI/KlxehslGSTn6VOjK7r8o1
	 eiGj5frRlOp9hQlsJ93jLb0vlsRAsIhK6yl10+fR2SaPunSAnsKY3FCmaKHyHOCDwTGyw
	 n8r/zkUU2louY0u23bCWRWmSvLuVxVMoudC+svSH01sxcy1s4zhKEvY7eSZ+5O37o0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=INVRtAOm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108D6606A321
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 11:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 108D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=INVRtAOm
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b060ec084so491161f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 04:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792583066; cv=none;
        d=google.com; s=arc-20260327;
        b=N66bXSmJ3s3JWV7sGyJs3j1bCtHAjouyGnzi461UAKc+BLrqlIp+Hz85Aga6HUSsKy
         crO+HviPuVhXsJMYR8WZiT6Z0LAa9GBI8hUa4bxKiT8Qc9FSx7nfMMUBNyxwPo81PVC+
         9lQyPFQS/nC2a9HNgoaXmzb1dlTkPuyoUpBp0zAq+Imwi8BcTBFkEgNlzPlUf5RRlKSn
         Fj9N+GPDqsuuC7E3m4tnovF+hpCXbo0g3+ZjITva0lf9liv4fY5EvE12RH06WW4mcW7y
         S7DvwFlqIYPP/TueKAhcCy3R0BcNq0SYxZTuDJeo44kTQktYJU0tiM33hhw7sbot1ZWu
         ub8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZYr3eBHIRZzy2m2KZECWH5MwINu9our1XGNLE3fKJc=;
        fh=ygWc28yeW5yJ0ZC9dgfGd/HcAALTBranKJU6qNDukY8=;
        b=hSZcmltiuIOPrMqXCT32jVXlrltSTHvLjVDJypnzy0snkNXPzbCqHtwvLOgF0Nrv2u
         Su2S/NIi3GcbvPqxiensS+ClPTRppq9yrdBmW2mjWNNEUoMkZZ7wDgtFStmr56MGd+0o
         8IMGiuTRspaSIE+m8x8aD8a1pv+NOIc0rLnkmaGzFREut66Ld2jbGjKsUr5h60cSlhNT
         /gnv4arXohPlVAwvpk5dpOD0psyzfFcayfgVGIaPwQhQKdILs0iu116INunjP5h1PNI7
         kDu4ZqH/ybGPBbyCZF4c6OAQpbMihFfEh0RtIhRtvymZfy1dE+sumDDKO+e4fMsGV9eU
         tpqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792583066; x=1793187866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZYr3eBHIRZzy2m2KZECWH5MwINu9our1XGNLE3fKJc=;
        b=INVRtAOmup6poGVaJMWPALiPnITN4b1Vtz/v7mvXJP2BooB6o3I8ISR7sZ58ah0yHp
         hGI8JjzTXZ0XUDRWN2IHN00kiwZXS6HeXlw3kYbHw3Bi7y9ZZ+9Y6z6z2yiJN+EaPPVy
         Rq72MAPL/w/QepLaiMke+Om0MpKQZYgh7Bby/7u+LqFrQpOS69PGdgDjePV7F68GbNz4
         gDaa7XenPle312+fGznkljEuud3wmOgyVm7+DFp8bLzhaJHkcgs7YS9nwPrSQKQoS2eW
         eocuyEwvdNbBi674feabGjoSPz1meCjP47bGRQMDtdRn978BEKGXO7nwIYQNqSv50JpC
         qgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583066; x=1793187866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZYr3eBHIRZzy2m2KZECWH5MwINu9our1XGNLE3fKJc=;
        b=ug43BoaltQaHl9SWRy31/4gt0eIXASZdQjcOeSjLE8J7FzoDf/yb/kcLzlg9mCmBKz
         txZX+mskiSojDKKy/XUimYP/G2UC8D2kIve0t7iJDxsSrxxzuL8klStJD3MofIJO8QcJ
         Ru91er04vCM/B7MzVvjXwf50NrykK//oxylwojt70xAJiKmZngUZhVV9WIyG/DzQn00I
         3Tj9KyDYxE9pqGTBNRipQ4rrRaT70CLlT5T91qlpOytd1lfvVbED6Tm5TfPzJ8xCsQEM
         jAfbcM+xEJ21dlYGjuRs0/+sfobMT78+NsewSLbMIE6ZJRqLr5VBfRqZTsrfTjq8QT99
         3DaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXZilOV2ILEc6fQE4LLqsO9/IQo5P9Tmvjv8hXEVDdOyTsCoUMaMswkuNfBIXfSTDXySEezK1bYKbll9KqDw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKuOx5h3XxiO9yxZazm3GQWpo5kg89wfd4/wU2y1/Rt8navxQ5i
	Uh74UFxzCfsN+pmZjGvb50ut9wUKQd6riCJLo4AP3dA2+MeE92EEnbZGzZR5jQzx33cwjbWx/va
	Yz5H6wMpeUtvd7OCLBvI/F3+OhlrFK8XFHs2HIv60
X-Gm-Gg: AYBFou2Bfvjg1S6GyYd6Q35dvBfRQ1r1TmppUde2k6+u9+NhoKpWq5f4/4Mch2UXt1p
	4GEp1RJrFLyM/XkyNxtBu0v9O4OlODdpm9a4C8IZdkEDyXkgJ9Ys+MTIV2QY7hLxtscOHLXBlqe
	LrnNv5FtlrMvzlQnYditPepOrroqRHTNB+s9b+0ZSMMe14j4qKLTKcTh7P+2XaO7VvpJJsKHeYp
	o+IG90BUR3VL1zsO/01Qcw/uZFw6z7nT168BKa5qf3ut3jvPHzDxmBjUDkrciYLfSjl2CY7e5pN
	YYY/nvJPcWs21bypPqUbV1rGrAtKDsRa8irZ2wStTv2ySx5YsV9NjI/KrYJ3j0d6bVYMF4stPOU
	ds1JwLzOdCInMBqN7j5hit1Mjd4NfFPvqmfMSpt2X80x/H0FFi9du8aqqUCix2mCAWJyrz82bYu
	xqkfxYYhH18rpllc5636YObUOp+Soek1i95LWjCnWlb2AUEg==
X-Received: by 2002:a05:6000:4a0f:b0:48b:e50:7159 with SMTP id
 ffacd0b85a97d-48e264adfafmr3173042f8f.30.1792583065670; Wed, 21 Oct 2026
 04:44:25 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
 <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com>
 <athToIRyTjSB_jVg@google.com> <CANiq72nP1cXVOQp0xciGfBhZZfEfNP5hx8c+1ZPhXwrr=EOUGA@mail.gmail.com>
In-Reply-To: <CANiq72nP1cXVOQp0xciGfBhZZfEfNP5hx8c+1ZPhXwrr=EOUGA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 21 Oct 2026 13:44:12 +0200
X-Gm-Features: AclHuK8jFkj1SdL-sn9s7gZYVhHgWgNf9M81gFX7u1yfFc_Pok1tIoSVJ9rDId8
Message-ID: <CAH5fLggAuPdmwOFiOMMRUCP+yLPjmdjYGGfBxZJ=7+bkGODJmQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add zerocopy to bindings and uapi
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jesung Yang <y.j3ms.n@gmail.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:37=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Oct 21, 2026 at 7:54=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Miguel, is this something we can take through drm-rust-next? Or perhaps
> > you want to take both through rust-next? Let me know what you prefer.
>
> Both sounds reasonable, so whatever it is easier -- do you think there
> will be lots of movement in the Tyr side?

If we're able to land JobQueue soon, then yes, otherwise no. But I
think we've aligned on how to get it merged at LPC, so probably yes.

Alice
