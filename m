Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7232D13AA38
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 06:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732258710; cv=none; b=aVsWR0kHCa2z4c6JM0iiC8Plp1bB1FcKi74VKdNnsxEWNrEa4FKUzzqJLh5Pjz4SXvs0KbyOY5UpYuZ9aNJ3mawxbJSsVi69zVoMDSsx/4EUErgZCYAVFhh85kLnrxB250ZHUsodr71ftMmEBw0qv+xNXhgSDIEN8kzL2BaX018=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732258710; c=relaxed/simple;
	bh=MOiFricK4DDszw4CyJmE9G0AvaJlKiySlfJNlv07CVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNmw6uNsAW945nVWhmV/FHjHFP152BL9k+tYQxr9ysOhUN8/xnLpVUzE8tOcvRPZZAWxSt5FdPmU96ZgYCtbfSoBDyXvv1EFnLwSDZJ1vX0lkWt0TEEzdrNdQ2j9UiCMKv/lsSMvLDQgGMqJFaMA9/F6tjCkY3lo1QPaFhdf6R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gpwbjvf2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gpwbjvf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732258707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X70b1Cts8T+9Tkzz2nbhOTjSUi64wRbRrogTOvjnGWs=;
	b=Gpwbjvf2/4mTgShdwhXwM07snsykTD0pevazPcZZyPYg8qRMGD8QGoSvVm24t0xTsr7r3A
	XjYGh/e9vtipNcfke25OqWpMlbut394bsPluPTZitNU+m7Hq9Fxh+mDiyts5Srq5UEPrbJ
	cu/BxE2IBL44GSpp2PJEBxqbsbXI9EY=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-R3xUYwIzN_ejvD-GSJkHdw-1; Fri, 22 Nov 2024 01:58:26 -0500
X-MC-Unique: R3xUYwIzN_ejvD-GSJkHdw-1
X-Mimecast-MFC-AGG-ID: R3xUYwIzN_ejvD-GSJkHdw
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-72467cd273dso2495137b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 22:58:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732258705; x=1732863505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X70b1Cts8T+9Tkzz2nbhOTjSUi64wRbRrogTOvjnGWs=;
        b=s24/XxqH7DjPgvUs/Lp8znfRhmUY0hOV3ygDzF6jCqPmhWB/9AZFRolPUWub2d6LCb
         Bzjw3twadzqbbWklrtvFmN+HzCoFWXO6RAL5TTetF3A0S7PLJpfVYkoFYYOKKo8IUZQc
         WjZXf4QHMyXTf8Tboz7C3tvPhc5Juvs1xUKAKWdajAXfGE+95GQRy6SrVcMAFCCd1A0l
         opQaVGYO5MJttuJzcYRFBDxF2thzqvNRplMetUVHopmgW9bpywLMR4IA9xTAzPiVccez
         szIuSdP9ytdLs4PWevdES9hBG/e6ed3tA39+sSl1LszZ/Tuy373rcXOrH0rLFdhSpI2M
         zZtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/zPciZ5f7BaKUzfaGaQAunRvI0WQTy8U0lzpiCLsEE/D9drm8w7jozxqq38P5xNU9EyHSLo1rvj9LJNYSMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuSbRiryOUcvzC28qlgitl/DPMdR7Rz4Qaku7fJGX6zCUihUrT
	79NuIqFdvEg1z02Bx+kcEU1suL1PB3nlGHNFgHSEw/i7nCTBPVqjquVFRil6vZFSTLxDV6h/DKa
	wHDAHfMTqfTE7y+EmXjGlMmNyuAXUS2SdWviseyG6Lct8znnhzWiNWW8duDo1sFJQpicfxN6+HW
	bLngZRbk7A3hI4AO4qzL4s3XJy0UzhfmXFQeW3SqA=
X-Gm-Gg: ASbGncvpkMjGE31FNzWrzmrxc4E/oFqgnNCY5QEfhWKQKTzDG2P9Q5rdLr6v5/eV3Kp
	egdu8tFrsPt/ttjaEhHXZya8Uese6BA==
X-Received: by 2002:a05:6a00:2d10:b0:724:d926:fbeb with SMTP id d2e1a72fcca58-724de451952mr3272748b3a.0.1732258704960;
        Thu, 21 Nov 2024 22:58:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPSEnpKvYksWAF4QRL5GVsUN0ZdXX2EoeX3KyT5hPH1bMfu/fYU5LDulmsHaln8LmVAnqI3n8oKfP6YAaw3rQ=
X-Received: by 2002:a05:6a00:2d10:b0:724:d926:fbeb with SMTP id
 d2e1a72fcca58-724de451952mr3272712b3a.0.1732258704517; Thu, 21 Nov 2024
 22:58:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zz4MQO79vVFhgfJZ@tardis.local> <Zz4WFnyTWUDPsH4m@casper.infradead.org>
 <Zz4boXyYpdx4q35I@tardis.local> <98a46b27-c4bb-4540-8f75-f176c3f2fae1@gmail.com>
 <Zz59qgqKruqnouTl@tardis.local> <650846e4-b6a0-472d-a14e-4357d20faadb@gmail.com>
 <Zz-FtcjNm0TVH5v9@tardis.local> <Zz-GHlkhrz35w2YN@tardis.local>
 <Zz-ts0s3jHsNP73f@casper.infradead.org> <0195fb77-c55a-40d5-8fe2-5844158f4f63@gmail.com>
 <Zz_dPsVZOMdkLjMA@casper.infradead.org>
In-Reply-To: <Zz_dPsVZOMdkLjMA@casper.infradead.org>
From: David Airlie <airlied@redhat.com>
Date: Fri, 22 Nov 2024 16:58:13 +1000
Message-ID: <CAMwc25pC_jU-bZEBWZB6TQKfFFJs4R+Ero1mA=X=0FBWNFeMXg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: page: Add support for existing struct page mappings
To: Matthew Wilcox <willy@infradead.org>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, Kairui Song <ryncsn@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u_j8zimQgueR_KzV0rAEVkiQe5qPjqr5Dle0iaXKz4E_1732258705
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 11:24=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Fri, Nov 22, 2024 at 01:18:28AM +0200, Abdiel Janulgue wrote:
> > We need an abstraction of struct page to construct a scatterlist which =
is
> > needed for an internal firmware structure. Now most of pages needed the=
re
> > come from vmalloc_to_page() which, unlike the current rust Page abstrac=
tion,
> > not allocated on demand but is an existing mapping.
> >
> > Hope that clears things up!
>
> That's very helpful!  So the lifetime of the scatterllist must not
> outlive the lifetime of the vmalloc allocation.  That means you can call
> kmap_local_page() on the page in the scatterlist without worrying about
> the refcount of the struct page.  BTW, you can't call page_address() on
> vmalloc memory because vmalloc can allocate pages from HIGHMEM.  Unless
> you're willing to disable support for 32-bit systems with highmem ...
>

https://elixir.bootlin.com/linux/v6.11.5/source/drivers/gpu/drm/nouveau/nvk=
m/core/firmware.c#L266

This is the C code we want to rustify.

Dave.

