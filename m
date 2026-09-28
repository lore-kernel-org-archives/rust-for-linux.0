Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4DB483815
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 08:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585160; cv=pass; b=mzgtxS035Z1umhdMWIDDraJf7BXpJb+VOlsLcyiaqlyvTjdzkpGsUeDu/u8vtq0rkh9yzJZEgKTaM0k4UcGAS4W09l7SOC4Ub6Jgof4xpMQV7BQYmpc3Qv7n+0Q1vVZdYLP+UM+IHmhEbv78Kqhhm52Av2MDpn82NCkl4dtju9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585160; c=relaxed/simple;
	bh=mr3/oZdmjnfuf2xlBeuHdlom8Xh0UAkM0Ox4x7tjkHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cp9u+cuivFwXE4vwdvUKyGAKUEIKZSfdl2AexxlAFMSre08oDEhEqlKeLLJdTDXJ+3/seXjB8S8VcCRRI1YbDZvLprss4TsYB/fakbm/IziJ+uktVe/qFVy6tJN6H6u8OG7BFJItGaLSXdzL8oQt32Uh/s6HuAT1q/GyT4ct2ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V33J4cAZ; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V33J4cAZ"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343697ad877so101836eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 01:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790585157; cv=none;
        d=google.com; s=arc-20260327;
        b=r7oVtyFoUHymeOZFvyKaEtfqiY+obJHvamaGWlUoDnmipMRyUFnB9jthLlz0LanbLO
         7t0AuQlzx6CT/o6AgJXbMfArLAQkmZYMTQeoUAK0aMXWfGZm2l73gk8uoBpIXQvG88Y3
         W3ISdRDk2+MbTGmc9UAV9BGzy4E3m83eiCWd4KZ2k17UzhhdBEc/vk+qxd4GAdvhWjLG
         H3XXVAtYmOAtlCwnUwx9RIMXV4yt75JmuC4D61CH1lAbjR9uRiaKDoGCIFcW+VeHjaF6
         7cX50T3VqWzofDi+MheFtcbrbYNRDC7th9KY4YN6MNl9WciF9nI48c/qQ0s97Jbkreca
         czEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mr3/oZdmjnfuf2xlBeuHdlom8Xh0UAkM0Ox4x7tjkHA=;
        fh=merxy1LkRQ0PC/FYoJjELT5DrVLTZKMDZeiYCVW+uY0=;
        b=IgVl5DRm63PvFlnDPJ1xnQ+0Cfb8HRUr+SpmG98sEfmQb3PcLK8G3PMpitgQTyOEQm
         AMogDuHMLxNTyLhGWxUfSEjaA+C0rIvDQD3PTugxEDywMSQxBVkfKqBUqMA/QWAg/lZK
         SQgBfT1Swja6uSUxSNA26tERDaTngS5rsGFXldXgJimJZ5ZT1KpLE5fqXJbdQDb+3/XN
         khOGogu6KoHHEbVqxnrqxEg2KMMdAjF5gsgOnMrPEPsqof6TKiu13+KPXinnKG7QoJMm
         Nn0+062Ingo8PDEeyPUXkSBrZrwVcvHHGf5otxBuA0bq99HJejhvLT1YElDeek82kVvB
         F1jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790585157; x=1791189957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mr3/oZdmjnfuf2xlBeuHdlom8Xh0UAkM0Ox4x7tjkHA=;
        b=V33J4cAZ6xIv0Z5nO9CswyGG59Wn3DruSk+9Og9iexPegBLvVJY4W36M1pDglzaKlJ
         iRqzcX185fvH0kpzHlj6wb/kNHluTapPddimNFQ1DKq0gJWG3AdO+1q/ixjBX319GNfz
         xoJLqNnTvuQGBAdP+k7metClV/l0bxsQy8swLNAb9Qq+jtj3xoKMPC/cCcxYNIirD6Lr
         1u5DGbAd8OvmPogvMkXhQ3E7X0QFIX0MJMC2p1EQ2jpNZeS1C3naz2eQYrREBGDev14M
         o3C13s0GASUi7MIADZhKNpQpJiVdPBuLAt4TYiXMKDTc1uF0RiKewZd9K+dvyKH21ldq
         ksPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585157; x=1791189957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mr3/oZdmjnfuf2xlBeuHdlom8Xh0UAkM0Ox4x7tjkHA=;
        b=lXRMMGGlXbCFNuvO1g1GAaDPuT21kqsNLBfLy/U0z9iCQgOCNLBKyJC8cCsdcztedP
         cp7pPZZmGP4BzVxIH6T0bz+xgBaZAMZLps33+laO71gGjOMuiZTNSMbXx30JEDY8Lq5I
         1TeD6y9QnLK18STHWExoicWPpqYOMh2lfy+VuIsLFEYW/w3pkvcWSPGGcm4VjaL7KW3b
         RLpOCmuU3Drb0785fgw6xyDlqr9D3ZfVqBEN7YV5vg5S7gfNYPKKwErt8oj7PlwWalZU
         aucH/WrXDRPiPtacDMhGFr0fzK4iDRCLx0D7GTm/XLAo3p7GpIFxIVgb9yL7ASbZGnRU
         CbHA==
X-Forwarded-Encrypted: i=1; AKwUvBwTay6X5HzwfcNm/vPWiIvfKv2vDqKMF23hvv1Xnv7tx2yhzwYC7JcMSBgKUa9bBdo8L1lwAdnqy0sU7BxqrA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJH4a6m40MtbLsiwZNjGqe3CMhY/ffFTfUQiXzSXCtLwbNNg+ys
	ptiQq9M6Q7885DtWZctejxcAJtlkZ2bsPtzj6CFGkT40TfOE/ntaaFZJsdVY7l/uVmHkjzVGqMC
	45F9jYRzTz/jS+RTt1mNAlSS0+kvZr28=
X-Gm-Gg: AYBFou1h6DWvlJYEx2wXcplvtfwwiVLL85chspvrWe7nLCjLY50QOG+LW1nsYEggP/b
	LW3YCJVn28DUhGgWSsYjDrG4I78kdCk9Qt+i3PTASmL8tM2+o9zJl+8giZT//9viJ/pC6cjpEYE
	EklFRFbjDXhrVE310d7wzOwB7UMEIowrPz+wIbmof2BQYRoUYQOh8Bis2Npf9xZH/Kh7YMsGFhF
	ZXaTAQ3haGwOnfdPESgKeh77OmCk9u/jj/nPUA/njEiGK3n7qH2IZzJhGnYkWq6E6K2Dk209zGu
	hPvLm9E+hSgINakVSKOvK+K/XVuqDr2bY/TFYV2oYwxt7Bs/35y+l0afvdXGyctZdUrY2t3kvgt
	ING4+Wz7SNu+qaK2dYwbd0Ba2nvIky5pWuTNv3P6mSZkgwiZYAEY+4sLIZRxm6l4gK7fw/Up8PM
	y27BLHtQausN1dMMWmPfgsVrejYVl9q9TPPUwMhmaXZZbzsFsJTVA=
X-Received: by 2002:a05:7301:4d08:b0:343:fdea:9a0 with SMTP id
 5a478bee46e88-343fdea25bemr10067053eec.2.1790585156645; Mon, 28 Sep 2026
 01:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924085523.2620704-2-phasta@kernel.org> <DLNHF9TPLXK2.1VQ2LJ0U6Y07K@garyguo.net>
 <dc8b56abedca3c6d17649de7f682e4af0b91b645.camel@mailbox.org>
In-Reply-To: <dc8b56abedca3c6d17649de7f682e4af0b91b645.camel@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Sep 2026 10:45:44 +0200
X-Gm-Features: AclHuK9mcGbHmyfX_Faw_MdAIDwZJVwS9VWb9_oTdrbq3FYkqNR9gMtq6GAb1wE
Message-ID: <CANiq72nrj0k=SLKJHfJyd02cA=n4B1zjwBnYyWtAGkhF5enDEw@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: Accept errors for Lock payload data
To: phasta@kernel.org
Cc: Gary Guo <gary@garyguo.net>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 10:10=E2=80=AFAM Philipp Stanner <phasta@mailbox.or=
g> wrote:
>
> But why was it imported `as _` ?

Because it is an extension trait, so it is not needed to use its name,
only the methods it provides.

Cheers,
Miguel
