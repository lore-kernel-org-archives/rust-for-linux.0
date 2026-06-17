Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23F744BCBB
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 14:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707032; cv=pass; b=ptBIyiTIt84VS0y1xmRHy/lrObiZNNYv4pnlokAJzx5QhIRLq2JMi/4NKTGOcXpat82exFV0AJy2EeB1B7GqVkuHhxK/7LniUOXLgnA4/4z8jVzhu++e5mpF+ERTRq1v/sZ2dChkay1Zy045NsqJx2LnmJukgo2Uc21LOxeFAFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707032; c=relaxed/simple;
	bh=WvOSdL7IT4BD5SGMbOIMchEGBxxRSiSItC1+ME6H0EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfdksgdagjHvVUlrV8iyIIGPr/sGOGf/5qVcvvg/gEzups2GpGbllEs8hUAFcY5VI/pdaUG5F0AYOlIWvWnvz2Zenwo3LOTeWToRmNYDDmqeJvlatmZY2NX5leCT/DeXBWvSRwqyrb2hj/4paSSH/i9ohLm60wXMrYDTWuuFDPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pdsabbkO; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pdsabbkO"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304f9bc869aso650511eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 07:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781707030; cv=none;
        d=google.com; s=arc-20240605;
        b=d6YziDwcGJc1ihm3Z92zv6Hhg5dkmPgpJDyhWwJhCVv3GjWQk6yl8rg3UIlTtLxcnS
         XniNoxNsqQnXm4sQUmei0qXKZDmI/jKFrgsULY2ohERmBeBLJdJQHwrneRxT7FYnCryi
         KH7pgKqYYqxusUp8EL80raFZnB0BvrzN8nphZiz5lQIfI2Byx+g60P63ZRY+zlIaqI+v
         awlyd/xigA92RClqjwQ2Sa1Lly4TEeHuiWC8nV+oGG562VL6EOfs6iTBS4MQAuUYIMBq
         aSBjjtir2BZWmNvg5VwThjl5u4AchtcDSH6lPyn1BO3j/8vC+FmuMNfT5skGm/LFtArG
         zEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WvOSdL7IT4BD5SGMbOIMchEGBxxRSiSItC1+ME6H0EI=;
        fh=qs/T2fCjlMqxn/NJioh5H6KhIwGVqUf5EBMTap44Gno=;
        b=IZUXediLHmKj+Ir5/SoLJ3UNq1+VnXv0tcuff+Vpr5AkGs+1SXiP8ZUVjqyF9wFMrw
         gN9eBUrGF5HPEmSvBn02f7dqE2N0VDUb2nXJNkO4mamU8t/sBaZFgcVxOqlxiRDWevYa
         GDABf4gG6JS3Z206eKfk58/VV0ZivXWPtsxzEQ3Ce420U0qNPzOXTnX1rcybjjVruJwu
         xF6zaZWA85tla/xKfmM5//jYbsMyjJSozgv6inNclKfjHU5/xLYwdy5OJFbZIFU5YObB
         /mBTfNsrx9AaBGpTtris67bi+Vr31YPsD048Ltdja8LraglTabh/wgSS12PAbzIpXQbw
         n8+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781707030; x=1782311830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvOSdL7IT4BD5SGMbOIMchEGBxxRSiSItC1+ME6H0EI=;
        b=pdsabbkOWn++PJ67QfnbzTsK2ubYKMXqu3r65IOzlFcqaJhstP66VL+fsp6FoP93zr
         WM18jWJQKJqr6FkiKjCna4YF7iIZIYif6flT93Vgh3ujM7jpyb+VZrLsn/G4bWL1lqCH
         EYGXXKPpe1I4tNiFKm2Qcgv2vwnKBeNYz2vkkkreeCRMD8ebAA4XzWrv0KiEDQK23Poa
         CAgKFz05/SgBoNFupchVS6KYO+zyawad0rAUq+gYACMLkOkpAuvJvU9EuSAdRYS+YKY5
         PsFDYYsnWsrZatOh9cmX/bN0P1mg5nURtEJYBvbcuCNAvIV8FFcCmbfBOhmDVp3taS5j
         OYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707030; x=1782311830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvOSdL7IT4BD5SGMbOIMchEGBxxRSiSItC1+ME6H0EI=;
        b=aCLE3Vxs1kRR2qz5flz8GEhoP7lIvvUmdnBbBz/uUpZThSRw8IxwNaJFv5TK1Tg3JT
         Kl7xV+y+dqzqIdTYQDXV1QO1HxV62hR9I+NKNQ28hF9TiQoCaUTlYWR+L4ZoJQmyYr/D
         1U+kDcb9uVwEspTXk2+Xt5qkB64DdouvA8bgwX5g4AjhodwlZCHg4lA3twbn6iqImEUX
         eNfbq/WzC8BCf2b7HObMWeAfH4A9VuIQyyD9hP/1tKolA08j8TxDCJjk/Hcv53MWcnHs
         7qWoHZ8/kze0iI2Mv626jKva/Xc8REdz6gWZgqf/9PRPdAAMHTGiPNFqqYAv4PhJtez9
         pg7w==
X-Forwarded-Encrypted: i=1; AFNElJ9TvxwkhGIEcCq1miMs8k03ptHi0r8SDTmo42AXubbXm0tnIH13gxjudLFJ3wh8dlYgOTW0im6JTzTtN36gtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqrcI429pYKM20PmKiISeWYfNNkuGo+l472W7kPCwNvVqiNiTC
	T4rvoARTB6OkVLWsWXjhTbu/T+kPwCL7DTiKtPOeZ65KSs0KMkP0n3JCl0SvWrG82pYZRNBLy1Q
	wIg/Ki9dFjg+sjXaE9+fEq7rA3JH7FrLR/nEW
X-Gm-Gg: AfdE7ck+sGW9AzCxVFgL90t87JAAYb6Mtu+Y3upgDgGMdJC3YdSh9S8jybqvpKr8zGy
	7wWvRxe0h0dlV3ZFgAMZS4gTHdprgFARvn6yE8vVMqSbjoFgsoeuheKzgSqeO8lGoQ72GIQ0KLo
	tXz4EN7znUukzVnC4fZ5uq5FbPbAUAJzsnXGPFnDz/Jya/w+ivpQaK72XWh+PbZZC3fAuonCgBq
	1Uf5ZCcfTagM0mnTAwCST64dO+9OsCmfioBBhq0Kz/x4exfu+yJvn5uBht+MEpHczcmwSB3v4KQ
	H5iIqR+EzEP3GdX6ranr1DQQiEpEl/L50ADxWYj/5gBn1dTiau5ox02ItoPI3NQTDb6CgbEretP
	Yw5ZGONplHCSIQGo6HYgyj00=
X-Received: by 2002:a05:7300:4311:b0:307:2e1c:17ed with SMTP id
 5a478bee46e88-30bca09b8a1mr1044490eec.7.1781707029963; Wed, 17 Jun 2026
 07:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617-rust-kbuild-replace-procmacro-extension-v2-1-667bdc3a6435@fritz.com>
In-Reply-To: <20260617-rust-kbuild-replace-procmacro-extension-v2-1-667bdc3a6435@fritz.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Jun 2026 16:36:56 +0200
X-Gm-Features: AVVi8Cc3S7n8hC-xspAVluZVnzwmntF9uAMPFU3aV5PhGFJBNsOfbMKyf_GJzPo
Message-ID: <CANiq72=N=TPxuEjKo7FZOUBTNaUEqdvNT67UDeuA51eFcqLPyA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: Replace and dissolve procmacro-extension variable
To: Nicolas Schier <n.schier@fritz.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 4:10=E2=80=AFPM Nicolas Schier <n.schier@fritz.com>=
 wrote:
>
> Link: https://lore.kernel.org/linux-kbuild/CANiq72nmPPF=3D6AUp5mcDJVni80O=
RQr0AQ-4uCZaE+CzB5kV=3Deg@mail.gmail.com/

Great, thanks! I will take this next cycle unless you (Kbuild) want it
through your tree.

The link quoted above could be nice in the commit message, I can put
it there when I apply (or is there a reason you want it outside?)

Thanks!

Cheers,
Miguel
