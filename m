Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1498D383C80
	for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217340; cv=none; b=TxQCarDW448KQ3ySDsLNH/mYhC6klBsY5cmsFJSTT3aQ4r9BJl74l3yoRM8jvHYXn9FQqgYOVQ0g2riVIQTNM1SLyBsB7c5G1OQkU9YPsOm+C5lBLmFxMSlFsXNRdiCnK5OLVKZyxcLK1PR8rQsI8zkCcNcUnsyu9RQ5UHR91ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217340; c=relaxed/simple;
	bh=k0U0SPErPKCW9LWawSkKTcXgFGdc7H4m2CUvw8GQtis=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCyoo54jJBpiTSjWrm37aDd1JmsMdeD2NdCe/MnoLoYnbvze8/ATZCHwffR6w5sHUler35OtlTAEWQaMReC88WLcDy2+gsOmpuQxm/23rB7a7Jm2UqKfFH4l5gCypbkQz0zF60+gqiALxmKfmpT9LX+aYc3/09e6BpTS2fIp4K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FGe7VEvT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FGe7VEvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779217338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0U0SPErPKCW9LWawSkKTcXgFGdc7H4m2CUvw8GQtis=;
	b=FGe7VEvTeEpcQA24QnvvsaSDPIkuJfpfmJlJRl9B4HtFI8gImWIUkCnLY+8ljPCpFbwMlv
	ssfQf7d6rVxSyencdksQ8llpjbTHroYEXFUeoqjCB/3GObJS2KWyKN+kzgI6RKjb3jVsD5
	Mj20Ix7dJiAXhoKlXdqsztY/mdNEf0Q=
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com
 [74.125.82.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-oAohXU9cOmy_d842Sa7FJw-1; Tue, 19 May 2026 15:02:14 -0400
X-MC-Unique: oAohXU9cOmy_d842Sa7FJw-1
X-Mimecast-MFC-AGG-ID: oAohXU9cOmy_d842Sa7FJw_1779217334
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-135fe34cb98so191690c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 12:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217334; x=1779822134;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0U0SPErPKCW9LWawSkKTcXgFGdc7H4m2CUvw8GQtis=;
        b=QbO9BufCADDOPc+nfZ6rRYChe9zTzHZv4ajeOmIbSnj0eHJzHqCF2dJPo4YNuPB+MD
         /IcHP69mfsVkD+WZyxCtaUgOdVNoatK35SnfitMuLD7FvtD4ENCs4daMdyuqguCBZP76
         HQ4aKrZpz6vNaOFhUHET9IYnQ7Uu0L7oxqTUIz3KjQd9LTZjAdaQC2aITjOHoX9OrENk
         MxHLsV81uOQXByrSk9OCDMwWgVfnKPJ7P8uSLWdrEzncW2fKZYiasipkMqYsIzAezkML
         +ERQJynkf3T7IuLv3inliFRpVR9sQQbztj96xdVFpyFeSITajk05AVWSHkCs3xn2MYlX
         11zQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ADIVEXwckX0TqMoR5lUJ7nFZIxdGOVsEDXQ+3+D+te5P+0QQhb4YtvwhAaskWeL1NM34B0xTajNqh4vENiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Dn89Vh9Z5rCstm2fzKp4J76+khaaSyq94LNrPbg4XLdX9bGl
	8ZeRxq/lOp0lVm9KLdD8LU79JvbFoL7NL/EUY6nl3cjURLTKla4foGPjjwfwEP1KYIzOqB1i6nK
	JB7MKqd3gnYcFrhINd9WowKGiObQs4dgEzZFjG0xggcBpG/cHn+wxzqwjfWH0bcjG5KIG
X-Gm-Gg: Acq92OG1tT4B6mAyDDVIjARGgTuKB4/FDAdnWH2cjCKGKFt5d2NIgICYzcPya+rXmNW
	r4E8VbirFSARAS+NgWIKF2txHDbh+EzJyiGCNhuaybIskBs9j1ADYLdKNeewX2CVsZra9KKnk0B
	W9+W/qmE0sPSFcJRV7Yziv5UufkCh0p9JI1SVCqJn7VD770r0cv6hbEXtNacMJ8sSmSkPd2Wn8y
	1RzjXmg4k5lLY/KgOW3R9o5DEVvCWuT0dciACyKdsVfA9oXrapxubkWTeayc5rVG8lMyuumyICb
	NDWuoVsHfaQZZHZ2WvSb7bKfL0U+NtxdIOCjZz9v9q2TRtKNAqi3nt6CQMlNrRAkCbjv84l9knG
	shJeoKVUy1R7BLQsdng==
X-Received: by 2002:a05:7022:6baa:b0:135:578a:cde2 with SMTP id a92af1059eb24-135578ad3admr5580671c88.34.1779217333595;
        Tue, 19 May 2026 12:02:13 -0700 (PDT)
X-Received: by 2002:a05:7022:6baa:b0:135:578a:cde2 with SMTP id a92af1059eb24-135578ad3admr5580606c88.34.1779217332985;
        Tue, 19 May 2026 12:02:12 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910baf22315sm1962832785a.21.2026.05.19.12.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:02:12 -0700 (PDT)
Message-ID: <3ed6a4bc42a547ed973cf2b77bde7171e0a15314.camel@redhat.com>
Subject: Re: [PATCH 0/6] rust: drm: Higher-Ranked Lifetime private data
From: lyude@redhat.com
To: Boris Brezillon <boris.brezillon@collabora.com>, Danilo Krummrich
	 <dakr@kernel.org>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, aliceryhl@google.com, 
	airlied@gmail.com, simona@ffwll.ch, daniel.almeida@collabora.com, 
	acourbot@nvidia.com, apopple@nvidia.com, ecourtney@nvidia.com,
 ojeda@kernel.org, 	boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, 	a.hindborg@kernel.org,
 tmgross@umich.edu, driver-core@lists.linux.dev, 	nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Date: Tue, 19 May 2026 15:02:11 -0400
In-Reply-To: <20260519205947.3c9d99b3@fedora>
References: <20260506221027.858481-1-dakr@kernel.org>
		<DICCEKZ3HU84.34ES3SW3D1FNI@kernel.org>	<agYbppHWXk_hW99M@um790>
		<DIIMVPTLV3O5.3Q3DHU66WQZUA@kernel.org> <20260519205947.3c9d99b3@fedora>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YNXSjIhdtbFPXEbYiF-8TXotqKKDCMV_SLi78DRM7Bc_1779217334
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-05-19 at 20:59 +0200, Boris Brezillon wrote:
> On Thu, 14 May 2026 21:07:11 +0200
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>=20
> > On Thu May 14, 2026 at 8:59 PM CEST, Deborah Brouwer wrote:
> > > let unreg_dev =3D
> > > drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, data)?;=C2=A0=20
> >=20
> > You shouldn't need this anymore as the drm::Registration itself has
> > private data
> > now that is bound to the lifetime of the underlying bus device,
> > which should be
> > the correct lifetime for juggling the GPU page tables.
>=20
> The problem we have is that, to initialize some of the sub-components
> of the driver, we need to be able to allocate GEM objects before the
> DRM
> device is exposed (registered), and because the data we want to
> attach
> to the final registration contains these sub-components, we need to
> defer the data assignment to the registration step (which was allowed
> by [1], but apparently this was dropped from the latest version of
> the series for some reason).
>=20
> [1]
> https://lore.kernel.org/dri-devel/20260320233645.950190-4-lyude@redha
> t.com/

I dropped it because when talking with Danilo I had the impression that
we weren't going to need this (and I thought we explicitly had
mentioned it when talking with eachother). But I'm always happy to add
it back

