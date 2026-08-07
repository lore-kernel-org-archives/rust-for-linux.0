Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22F53A8741
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786122761; cv=pass; b=VXEPrP+nmuMLbsLkQBh3eTpPJA5sTATtf7bimSh9N7uL45vzPvGNe54xPBHdB3eZ+wFaAejlwpXZU1f879rKkNAIPoUzhgFc8LSyLvj8idPAy6sUycM+6Qc9GnX1LC811reeyNDRO8qHXNQap4FBecq/kMdmDNGahsbZhBKsfU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786122761; c=relaxed/simple;
	bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJ2cF/pNHw9nYqsOvPiQ79qnckdFiO4/zPx8bg3vlcd16A5vNhlWMCiJT3WMs0szkx94ItVRWvZLpf64TjInoHXvhgmCY1SCIhIzm8zcoA1jRgMMseRkgSC27TesToBu9HiHAAQAb74gFrFJHrWie8BnstlpRTBpoYcbIyT3e6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHYPMaZB; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHYPMaZB"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38f0f3c8da5so521758a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 10:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786122759; cv=none;
        d=google.com; s=arc-20260327;
        b=ZX7RHE13hXmFoZdDSQFPcYdZ8cs4dyW9z25UH9LNvjOaulkNKnRCixpb1vnRqz1g/Z
         plnUijEjl7A5cbuLDbGVJseOWqB4AKP3qFrJ8DfNeAS8AdeM8zhMHAj8eswifvuvaS0J
         /Sn4KtPyj27Lbrxs6jJ9ucZscObT9PvpAuGJNXnLAVSPFioNhiYZYTOAr/i1c2kTm71E
         h9R0q1KoxgnQSKbJ+JCSuynqbnKKFwXKWnJYLLMYMHTuXrmHZNVt0Z/LZ5LGprkXzFW2
         +J8x1+8mopEP0MDl/cF4O+Wdmnp+aR9d1NDpFrX+3tZCAaTRDz0juai5fhEI7zVmLpHe
         qaPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
        fh=0T7QRIUM003CZzq1nzPKWrARgnVUQaljyyV5x/EntCU=;
        b=mRqsvALKJCAAg+JUmkL4pizTSVN8+vyCOK5FaWDlFchFbKRgFiY65Sq0H3QxzmoBni
         qddGq24Ftup3EdCK4zbn7/II+EwQDlj5a3+FyCKHJLihjxMV/zx3X42oIYCBCUD+Iraf
         95vgQu1c53uiLGXiWVem9Hvlnrs8mDgInkJii1noH9gsWR2WCbru4vGAZ9twa0j0V6tA
         HZrsRoLtVSrcRSvn7U6ItCRFK+OoNYyj+2bthFoZ8uTvIcaUOWTZzIpRYCz9d7Q99gHV
         PNNKgMOdM/RtWdAJWZpWQh+lHHisJ7dtk1evP/+gYTiGUAbuThBph6t2RuxWOPCjvMYQ
         5bew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786122759; x=1786727559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
        b=EHYPMaZBMz+4qGl436AEPpxDhPsRGe8iGQvvRzyUuHBYC4iNDJykV3dND4upD6TXVE
         ggSneTgwnyqbXe3QasXupXScDQoNKrbEMFOoCbhppHt+tYo+CNZv7aWVCXmvjQSi3J2e
         dQb09Jz/6eKr0+ars72RuFzqMQFFtMOlEapyoJulN0h4HbNBvxuPuznanu7h7J+UuEoJ
         C0jiS+ez4H68dEt1ZVI/vD6pzie9muzozUcTJv7PeHe6X2uQByAJwwXA8QJINlN/3jpz
         +XKQkDg//rZbUCrMY7jh/UeGR8cg91BIolAFu/vgFeWEMFf5X1EtNFzSs9WfbpGEx/tm
         UJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786122759; x=1786727559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYN3WqMlSBD8p+Coyo0jjeKucvb7gFDKdiYxoZH2MVw=;
        b=TA5o5RyqhRVfve9YN6p4qXdrlyG6TBAJvqsGy6nQqS/HMIAbyFOh68yxfZ26eq3FSY
         ssXISyJXo4SbNt3MKGAOKgr1uFFbPrR9T7c7ADLa1DBqLlpUIiqXhcK8E7qv+3bUwfeT
         axJwHWKkJRsXXxg7pUS0/GvE69v36PHKJ2FvXY1rW/j9Xz6qfT4eN/nN9AuO2ILZLWOB
         ZcZBFQYGlFGxO0bzqs9lThLGzRfOP3hsvVnu9ckHsH0XAQpiIbApBwUKmI3/N9+kTovb
         ksMm2N3Cc/XPZ9quuzxceRqMids7Ce73nRpHtr5thDkTbTIVu2p2bsbA4l8TYNRBGupk
         sKLg==
X-Forwarded-Encrypted: i=1; AHgh+Rrl1yYxY7TUG+YcT5DSH4Gm0qxjAbpCMhXRuXuGOfuFxfZMASHj1cayx0qGgW2jUJlFa31Mg1a7qsge0UAYOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9AXpi/DRorHFAg3q9iLValHIkHi7vYwnxF1viAqplqzPPbIy3
	eCSEqeJauiNEf9UAsbaHQefXO4W6Gze01hTIAnb//U9hL98tyRj++H/Y3Bpg5Cc7yFMSWeXrIyA
	SL4Pttd/KZmvXb/vW/apBv3lnQSqcOis=
X-Gm-Gg: AR+sD131xG4wfPCvzxlQxCx3TU/GMsayvVLo6DESyV7AHesg+B00HbtYp0u7h5OuPJg
	dwvn8TyoJaj7TT4SOf2zhMhgIXrwpZ9iOAI4y63N/xDUzI4ycgAQTFniuRXJku+1ZXPFfv29HG8
	fKgBQyig1ip24KoLgznmGE3zyLOdw7XK3Uis6ReymaFG8bGvy9c5htLSwg/ppJ/vFqLrw3lcys5
	QhfcYf0Y7F0Tnq6nExUydLsW+c61yu+OGDc8v9/QDXNhdmaS0zA5ObLCfdAEWP6nYeECrGXBu9z
	i49uAnxvQAZIKPfX9EW3eSAlGo0Gg3U7yEajRaR0SqYBYgMvK2WgPDBfnJhjyXl97H9K8xsXT5K
	v7fzmGX2YuIw7DUlI0uwOHYqB7rNFW7SlXcW34IQjbMvILLD5AXaTjhKTP1jK
X-Received: by 2002:a17:90b:1fc8:b0:38e:ab3f:2c99 with SMTP id
 98e67ed59e1d1-3903c628181mr18187876a91.2.1786122759120; Fri, 07 Aug 2026
 10:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-pramin-split-v1-0-ff3e84a75dac@nvidia.com>
 <20260805-pramin-split-v1-2-ff3e84a75dac@nvidia.com> <DKIRNHGHK4O6.2IRJZGM6W79B@nvidia.com>
In-Reply-To: <DKIRNHGHK4O6.2IRJZGM6W79B@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Aug 2026 19:12:25 +0200
X-Gm-Features: AUfX_mw-cYa1MKRYuhH-uVGjXrAOGt3b9pyVqsuViit8BjsQ3XkXMD2u-qTWwOs
Message-ID: <CANiq72kYqPySwS8ci84CEsvjJqCTBjrveSx14xxnNWJZWRFAuw@mail.gmail.com>
Subject: Re: [PATCH 02/12] rust: num: reject Bounded::shr overshifts at build time
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Yury Norov <yury.norov@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 4:03=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Indeed it looks like this would panic with the kernel build, and can be
> easily caught at build-time since `SHIFT` is a constant.
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Do you want me to take it this cycle? And maybe the next one too?

Cheers,
Miguel
