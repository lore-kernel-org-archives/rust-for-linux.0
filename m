Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9370830
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 12:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451804; cv=pass; b=H1ONajxtDNTtF9VzfSOby97y1HIujjWD23JhgqtJMcV2mhO/6nhDcx1QQQr1frXdmRBXFLEh88pDZi4V6QBDHdTuXZKDCj7Ml1oAh0JwebejDw+7czAtx5VuOyPGJcpPVZy/nsk/T9TffnRAgG8VAdkCeUHhXCQtQX8kiXBeKcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451804; c=relaxed/simple;
	bh=2NvH1TAgIpaUGegasbh8vOggOmgA8TRo7okjrwKQ2hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9kOW4yoqW3MEmuV6yGbDS7fd9hiHrFVZg3qt1mNWuJxSwZVI2U0R3Hj0jeEbJHoTMl3adkGvBkATXstxVkmvoUjFqmRkNQG60cTMmVn0T2nnXaq+cbhyjubCLRWpF6VnccNKI2HhpvZXxEzVz4d7xV/5BXYenP7cTHASNr0XaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiGV/bv/; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiGV/bv/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d027b7c8easo7457125ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 05:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786451803; cv=none;
        d=google.com; s=arc-20260327;
        b=g/GyVnWrMG/Q+5FleWOpY9dNLAyOpXJAq0r+uYHBhsi/Qei4uKLBp2vZ78fnWNHISv
         X8WF0NBV0bPbSOP5+6B5BK92B5iQ5wOzJNMw3zoJ0iqOo04tpYF7mZ1K1oTwXcZGP+5h
         WhBb9u0vsS9IaSguNRKf1tL73UWkR24+4dbeDFqMKaDBMXOw9Tf+iIJiRc4Y7Hawd7c+
         DF3O/vHJYu5aTeuTYIa9Tz445zxZoa14n/WxrVms1cVuDWKOzQ2Vuw0L1hOw/w4/HxEd
         JdlniqF9YCqJjX6wevYmLBK3ta4dVLAyycJyZV1RgKoBC73mjCdUSbxLyoWql+2kWCyy
         HxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2NvH1TAgIpaUGegasbh8vOggOmgA8TRo7okjrwKQ2hY=;
        fh=rxE2bfVRQeB0o6KvRyszX2TnSoMl4lMz4tjZ2vHLIm8=;
        b=O21JFTaKrx88FulIiNNfuYm38lMn2BvZKkFXr6yVJTtGuEBOUxUY40fLNMdRMcmsQu
         eA1X+E7ML6bLVw78v+rPmP5K2XV1/gJZ0ZzQrSZUbUA51w6iuufq1WsFcsYiB3lSExnj
         sp7YAkmakCzePBouQV8A32BVmIs4hFD/IA9ZOB+2tocWNg2U8nGyshZtrHCzS+9O8ztb
         eSzt1ary+8aWt3krm5AjDmFOj4P1rqTVPhLs/f5AGicBxoc6jDfuY0N1SfZyl5tuy7ev
         uEup7HwffK3PU+3H48q5Q+bROcCgPhfoRMf3Vhv2GykiS90SuePcKmPYn0icBgaPgJ2m
         lyLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786451803; x=1787056603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2NvH1TAgIpaUGegasbh8vOggOmgA8TRo7okjrwKQ2hY=;
        b=IiGV/bv/i0wYGdAOpf8zMRWnEA02mG/pVscmRkt9mtcJQydwjuqRH0bGLDFiNb9ZVN
         3behBYA983zAut21afvNT1aBy4ugQmjAwK43/fU8ZIQ5AOaXA8BuuorxvzmPQGHT26Jt
         msBfSBbkgTljanWCJ3/lvh9taRfay62Yut7CrHuEdJtpgg6r4bud4q2e+r7SfX0Ben2h
         kRnk7qwTFgWcsxLQ8IrEP8jfEf8z5ppuoFzjj+Zacv5xxFnrw/F5ksnD/klpkJzd2f+u
         Qqfu942IaUUdWvLode6hwIFpnydiVPnSptcvbN2oyAcB7S4F8rWK6KRacM6/iXzCS7nW
         TFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786451803; x=1787056603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NvH1TAgIpaUGegasbh8vOggOmgA8TRo7okjrwKQ2hY=;
        b=ArCpPQhyUGRsfsaOj54+x8kRF9UMeNiIN0cJnPd1Hj0EO2iv0cISMpmgn4Xd6SdWwj
         KACNSFFKPip4K1mINr/Sz2osBOHZDDv4Ps3T79SrGSzZMAIDQPNdjYRg7eNyP4u6ed0k
         hXmUaTLUahKjFu9KjeRhJWhPVp8ZgQxJ4mDrKqi5LmcueWu23JWiBHsINrWq+kx4z8NN
         nf+8C10+MkGse1ilhbE2lS3kQK+nbDoyj89YYTKcUW1uQw9yOI4MgxCnO3O5GX+bPzo5
         6Tp4gOX/HtBjc+iAS5OSNSit3V49VXfuOt8sVlmagU6bxCoaw7pot/Bj0bTwktxcrZwH
         5sLA==
X-Forwarded-Encrypted: i=1; AHgh+RqxlA7crpP4UqXUeodWu+8zwxSQ7lvMHlRqz3+4+6gzM/pZYr1qXgqM6a3w7Ap3LxDXRhnPff1tsZ4qSwdakw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFtrPbcVsQEysfkcHh2cj3rA6LB0HCCwW0VRu9HxwbmuwucYX
	LSF6bid47j4MqcZ+hx24xFQK/MrU2lQTg+gzHISz8dqA2Aj1108W0OF2NAbRvZwygjq72S9sMui
	BPc3jy4S1Z3/63RkytBgGrReQsWLhziQ=
X-Gm-Gg: AR+sD12hGEJk2UJYevRMV3Udyv7dhz9tbI9EvhZyTWxs7sR62VCPKx6E88bAuCTK8Vu
	0wb/IowOFym2JIpOVwA6FflU0idp62AgCKgJdGT+oRbHkUNAGYgBVQJJC970uufjFumqPNBAro1
	XEhgspZ47ndnowFwd1j1xf70qXiQ5KxyRD0hUh2aLNaAjK2unyNSmC4uQacN8/8i8inD8awN9ZU
	Ia/R3r1CARIwBtkukS7d93EM0qJb+ayWiajctPtx4SwBshxD0OnSkg3vrWU1gcJHAEwoJsdgXki
	LRjTFpkirQWRm532LJqRboRQEJ8hvLJAVIzcFu6xsDuP2o+/yMa+kRdyaBPmKe+TBM0QQjYUM7J
	UqspjFPtZysfNQHSS8JEie+YxccopvmU/C/8gMg/MYpELzWMwi2JJGbjvGCa3n7jHjad1DW0=
X-Received: by 2002:a17:902:cecd:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d3175fc8e5mr27697295ad.0.1786451802965; Tue, 11 Aug 2026
 05:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
 <2026073148-cushy-mocha-2ecf@gregkh> <CANiq72ksdfw57QE1+FsMW3uE5p056tTn=xxK1m3fg-ABhHU8cQ@mail.gmail.com>
 <CAH5fLgjZuKGBX7R4O1fat1s__mR2LHhQWD7tWdz6F_FxECFOGw@mail.gmail.com>
 <CANiq72kuB3dHDcsw0WApcVOrJJs3kS_BWt9ELqm8YmcEz6yeSg@mail.gmail.com>
 <2026080337-careless-viper-7a1f@gregkh> <CANiq72n+3ShPk-agnAepT7uz803fuJ=9206UQsUd_gRMBjFpSQ@mail.gmail.com>
In-Reply-To: <CANiq72n+3ShPk-agnAepT7uz803fuJ=9206UQsUd_gRMBjFpSQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:36:29 +0200
X-Gm-Features: AUfX_mw2Ox9WCFW5cGCPOjJvGJwVnuMQFUNgiJxyoIr_FVTIguxBQEi_oyDO-1Q
Message-ID: <CANiq72nKgSbKOg3fQNYRN4t9Fu5r+L+=Yciz0Ji1MsOF-oK9xw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Rate limited printing for Rust
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 8:57=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Aug 3, 2026 at 8:25=E2=80=AFAM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > I'd love to just take them all at once if no one objects, as odds are
> > there are going to be binder merge conflicts due to the printk() change=
s
> > in that codebase in the char-misc-next tree.
>
> Sounds good:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Thanks!

I don't think they are in linux-next -- Greg: if you need me to do
something with them, please let me know!

Cheers,
Miguel
