Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF42737E0
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759444771; cv=none; b=G21fEggOPFlOm29eE4gq+vFWm/94i7dyBbDA+PyJuWIRwwUkPrS1wMvif2/PNBbuUPCx2SS1tY5kBMxWnyhvg44r3vlR36d/Ji1FOt8GOi1BtRrq5iXMJttOLAQ2IzFCF4P5wQHQD2Q9cGzrIfaBwVIi4DYHF+Rbf0mhS4sZps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759444771; c=relaxed/simple;
	bh=MPv+Iwkd7lH6O3lPVcnYm0HoR2osP0+61xnq0XTVgYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kB0nTphKAcXy7sDTAQ44ORjujvoI/Ar0Oalutve/rrU6b9dAfDxtb4OM5N6+v3FdGjC/Y9YBOvbH0Q6Ul/vPYfDhUXNttHkrEANjdnE9PcywageECuAvrp+lkpcKxWI7TEDcxxY5nIbPXBopzI7WVTuckHjwByIQYfLz8VMOjQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeMIIc6P; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeMIIc6P"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2680ee37b21so2287985ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759444769; x=1760049569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8E52QWTGIfO2NrRkEaHfqTdphgmYcegsGjZ94/TNcc=;
        b=JeMIIc6Pu0ZpEX9hTY7/GeLhB3qlTY4ukB2JLozdQbzs6mySABf79Gw04crUyr4mVW
         U8DE1CW/2mg1mVFqTeTz+dp7UsrH7phEJOO9igJNEq4wEH+qeNk3PS7KKPRzkQspWVI0
         /u6JVpbt8jjo8Xi4S4xC8Lsy9B4XBtQGs+XHe43pCptqGlK/TCL43Ns1ik1KSrshLV5x
         vR6zdQHGHbZ4ck6Fqcp4d+MEXI6FEXpGWi48m/d4k6xbpEdZRhlOObVUjVvwGNCR3rhK
         QYhzYShGuLBgrnKTU2PTpP8HIlX+WJaiALHSNVXJDi1x4gQr/+JycYIss+kk4OX1ZmxN
         L0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759444769; x=1760049569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8E52QWTGIfO2NrRkEaHfqTdphgmYcegsGjZ94/TNcc=;
        b=Mm9Sughb7PJTCUrpgVHjIxmgDObLEUpSCJ9npxR75TGyZOP/w44DrKHuIsu+Hk26M3
         lyVpElrCBDXmhLK8C8uAiYqgP/1TF1OgB7Ou3Capu/zCmCH+OzMpzR9Bf29KYWt23g6T
         k7FfF+BhAl9boVZ0/WlCwjalMrp2ZZL6ruuKTMUh/RVQDlKSgSFpEYxtGjzVEEjcsdxR
         yVq9ngG4KNRqh+FSqY6zggNSqj6RKgcWZmoVsZ7Z6C/vECBCJHb8FLsvu2jLlD/HVFXg
         YINbaylPDMhKIbyFgxGse9HAJXpuJhjQQBRwV6V7YGnl/uVxXx0rMZvg9KmY2Xkq2K5W
         0Atw==
X-Forwarded-Encrypted: i=1; AJvYcCV31Y13mdKcFPC46xiAYYsiHPGYSdZRfmihn4EVC4upQAvATQxWulZJBxv7DLXedEAbDfVWpXaZgE+Pzerv2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXa3jnFcUDVNPf5rzinjoGtqV44Zq+SWsD4DKZoMXqdaptjibI
	6Bq99it0P8IHpw58cv4CZrQIMV2GmPAuGvnDyJP9RibvpRymgXBUQ/cx4Z1NnbDxx3xBc9PrrlV
	zv4FRTZtT2zdCFjPa9o7rR62mHM26b8U=
X-Gm-Gg: ASbGncsM0xWCdG98IACWyfxC2F9Yr7UAifhGyDV5JuWIVxYXDLNyZZS1KxjaM14p6Bx
	Za3VOX8gznnwDwZLx4V7Cg36iccY/z0KhxAYSIhHrzbEHg0RUPPnKxXpdiXmPL+AMC2BrE8XAFZ
	wZLKIFeGpAUAo3LBSKCOOx9PMeohrEDJtHs373rV1s88WyJTxO1x7umgjtSut9EeSjIH5Fp7aKN
	iSyLtOF3sjSQU+9Mw4HAqoTvJmR+UXUViCm7M5Zimlhrlt8ECEBagV/hnvdJaL4ov0TnPM3Uzmu
	xV5Q+WE1GiFB75K9cTFtsAdlDIFn1pdENYV99ZbqQpl40zrjkoe2IgX4UHQL
X-Google-Smtp-Source: AGHT+IEhRGnzB5EzFTBg5gYLUAKsYTD4tHz/84QxOuxiDXRxtdiTFAC2E75ntDwFb3VNaRgQPk1/fDRQR6NQmcoUJ5o=
X-Received: by 2002:a17:903:2f8c:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-28e9a35324amr5544725ad.0.1759444769254; Thu, 02 Oct 2025
 15:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com> <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
In-Reply-To: <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Oct 2025 00:39:16 +0200
X-Gm-Features: AS18NWCqd29-UpjX1TL5yAY8ycRR0RhMhqsgiRqYfPBpAGaRn5i7wZcx5PXFDe4
Message-ID: <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 12:27=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> Sorry, this is rather annoying.  Rust is breaking the build for a very
> simple patch.  Many developers aren't rust-enabled and probably aren't
> even able to test a fix - my attempt to get a rust build setup working
> didn't end happily.
>
> Jakub's patch fixes a kernel crash and needs to be merged into mainline
> and -stable reasonably soon.  But that is now blocked until someone who
> knows how to fix this error and how to test it gets down and does those
> things.
>
> Jakub's patch is present in current linux-next.  Can someone please
> send us a fix?

I am not sure I follow -- the diff I gave you should work.

If you have a branch you want me to test and/or give you a formal
patch on top of that or similar, I can do that.

Cheers,
Miguel
