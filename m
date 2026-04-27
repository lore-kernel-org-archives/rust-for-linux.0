Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE5B37F009
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 21:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326429; cv=none; b=U+f+wuspliXCE4NwYp/7qxq3viHHtTL96fNSDKoH7OCpVEg18QjpfQeex9L7Ok//00dXYeI4rPNxcCbl/ddsenP+0Pqe8F5yAd+5i0RqsY/tnw+5z9YVco6qI5qcJD5IetSmNOYktbTvlruQrODixwjT2BNrD1TJJh9AlrvDPnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326429; c=relaxed/simple;
	bh=i/k46YQbNxc6jmDhpSrBTZQploRe2hY24KQV/uGHVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITIXbrhTmbtr4r75LhsUbOi00EOBDeFv86CdQXMhPLPTzQWNq+i1t9USiJnSQ0ds2IsTgLR4RvmydIbocFtFu+R62feXr97cYjc4AOdBE72bNxV1aT/RAFKMP1SZQoaX46R6vEo63lg7oJuIwP4mJkAT3TcpJ/ZjOnIlGRdaMrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Cf0dnT9I; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Cf0dnT9I"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so5634196a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 14:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326426; x=1777931226; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=Cf0dnT9In6fD8seJZYoey+/Y6URjJfLfZJK4piHqnWg07rH0c/nz/xWE9Q6nhVCo/E
         P6iLOMCjE8QN5clqlpckXgsMrZIfVzg6tIk/sAmvhpf2wJ3JKszhWK8UNcagODrWxZAi
         gNeqizlB/JOOR5lr9QtI38g918a4qta4eUQk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326426; x=1777931226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=mFo12rXiSTEmfYpiAnPOXMEfthuQji92G5fo5HqWe4IjICWtr9g8ThjGWBkc354ZkO
         gJhsj/T52aW4u2qUhXUsWbOIUxPnZXUXEiZHmQLc9VfoTFAlXNpHhnLcOWtPQ8o/3uyf
         iC20iyyaZS447jxAqts8rwqhu6agBTrWFHzVuA+YgHXv7qlGIXdv28UhUtHM7u0Qi4gW
         JA3dcXhHSGs9BaolTo4w8ATbwdZwBVdUCuAvD35XlI5uGcpb6PzfGtE5lqSI2PdJDSxM
         KTvQDYz4tfxfJBxZ7tldFqsv3YabzEsJkXjbEHkev1GnoRBrSslI+3bNhjtWdzq/rEyD
         KiKQ==
X-Forwarded-Encrypted: i=1; AFNElJ874ubj2oMEIp9Cvv0C6yIU9bK18KbGALjZ6hssTufrlDktScfWvzcqRnBSOwVFs0f50Xta/uNSvqx8UnJzNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOMhlyBvDVC6YNJrWwkRD52+0r/MRa5H/EZZiXwkHLaa3BbEby
	XNtdoJIJmOaBb2touDvCQh6ZpK8bPFyITSS16zewN9VCf19/t27TotZLXr1j6JkOBdHAHHyDArX
	hd1efQgdPAg==
X-Gm-Gg: AeBDiesXzR8IIWdyibHED6yT6unU8A1lrSKRjI6CuuUquRQJOyUQ9VtJ4j9See3+pNe
	NqTOXF+7xWAcima74jkrxQfa7UVI6u14rYDDIWVVRYAyQgny61PN0ZyM6bxqzTCa4Equljfjd+k
	sLwIAlopQo0ndPG/+xDh0AmboUV/ymLDRhyezVDfnctwVMiU7L7YxkhM1Y/CrHctjRz4W8+UCrN
	vHgg/V+TPItHAJGmpQyZ+XB3dAA96+u3lmNDFnzo4+ZCHp1ch7QfnH6Pu/j/LeThqG0PYIDqHgx
	HHD0te6IKprpRCcCiquk7HSw0WJwUUD2Su1ZOf6W9FMd5gDa0tPv8eJWuSH8ZMPmePvr3URXrOf
	+TIXFNtP5eaHLkWWpf/PzndeaasJodD+1c6AA/alKwmo3Tnkh/v0Y2yS0pAyFJF17sZ2u6kRepv
	itBRE2dQfwjwxjdRKSGpVEsS5HoK/E3rEOnLGevEE32xVJA9YEBwvH9wTlsYrTH15M+HKoDuOJE
	NnopfD2kTE=
X-Received: by 2002:a17:907:97cb:b0:ba5:216c:56e6 with SMTP id a640c23a62f3a-bb7ff35965emr31627066b.0.1777326425736;
        Mon, 27 Apr 2026 14:47:05 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2adf6esm9956266b.38.2026.04.27.14.47.05
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:47:05 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8f97c626aaso849562566b.2
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 14:47:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+BNrHKYzp4xnhtTP5+GgAk7hbQV2f/dv76394dCRM6EjMo+dgp+fizhooYaVdkjeiByf6YO4DxHcHfML/eHQ==@vger.kernel.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus
