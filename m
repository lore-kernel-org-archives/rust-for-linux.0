Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05493E5EDB
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 18:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777054435; cv=none; b=E4qpWqx/LOLs1rUYNmrzuBayuhlCPVwoicazJklrm+rpAVIJDsRn76YtWjmMh2ZhssHlaf1TfZpJjVF6mYqiSrSi5sEI2aWUbv+Ti2GhcZWfFSpMndPZWromrQLFkh4Y4XaUpEgAK29SvxiwMioT6cZ4JpfCaP+Kbs+YT12ETnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777054435; c=relaxed/simple;
	bh=OeQosteTdD6VM7jZXWeJNravgroMD7pnnDdWYomsqZs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KTAC8Pma2euzc9rLgZOoWwcVBuR0AZbDRLHIBqNrfHVfcNC6i6YNhCkxpGzgieX9xa+hfMCX5JJ+ECVjDysinNZtIzEfYP9GSRwaD10bhApz5gl44raAeBLKiA1N2NVLyS5O0pqTb+RLOVIhBcZVgGUIHwgu5GDfCmsBoQ6XEm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QNEnoon/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QNEnoon/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777054432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OeQosteTdD6VM7jZXWeJNravgroMD7pnnDdWYomsqZs=;
	b=QNEnoon/5XTTeBWD9o2kF+jEZFYiyhHr1n13fh8ROOXkmbjBnYXjIsVmVxnExxPo5dFN3U
	CxOkhSUn/s2Pk9Ym+DFVFrYdKftJ/n5exwevi6/5N+4SNtlzPch43Rv5R7Z1D4AJ7y3NK6
	aO53iKurC+O2VY9HNKoX9oqqXgkJd2w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-KXUhJPmHNNCebmuX_ccAsw-1; Fri, 24 Apr 2026 14:13:51 -0400
X-MC-Unique: KXUhJPmHNNCebmuX_ccAsw-1
X-Mimecast-MFC-AGG-ID: KXUhJPmHNNCebmuX_ccAsw_1777054431
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acafc224a8so201142066d6.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 11:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777054431; x=1777659231;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OeQosteTdD6VM7jZXWeJNravgroMD7pnnDdWYomsqZs=;
        b=f3IH4ISZ0NEGIxdBpGb+G4PGP3UOF2wwycOHAHN/Sstat2D8w4j+Qd0EVCZ7FoofvO
         ogG4JY4/Yrixn8bIPQXfg15sTpmie/T4P60obDAMW2zJo5vZhIsur8fzd/rwkRle80XV
         KU/QsBFoqHZbWKamjvK0TynBtCovFnJkswc1aTMP9fiOjOXwEbTxF7u+hI6LTXtzpr7e
         11W1OZPJUGj93K73s/BC3d5QQbsCuZpbNC5yfyBIcHfbvkQKH/i+DFT2YlFg90i02JLT
         rmWEu7OqrZbQ+FetDwwp0CbsSHVeaQJov2On0yXcLex7Z8bqd0GNij0IvTcjemoeWyBj
         MdbA==
X-Forwarded-Encrypted: i=1; AFNElJ/knzW3m7euBW8tWe5qe9fRLvbF/C+73hzcAyn9OxrExcXVedsPvqKrGmOD3Bm2gXelvZJhYn4BbxfyJhoOtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp35Q0t/mcR565hMrtmL3EfH/i2kheeYajfp9q3FmJFH1xxOQw
	oppXnIW8gYOtCWa2F00nywd71Mq9+KvVhIHiGb2ncNphPGAnywzVceEPpQlDvoIyYT0ZuzXa9hm
	F4Gth2a8IWAY6C1kEiyLcraymr0jAXAlGwQgYls/Mo23bsngcgw8AV5vJ7GOfrLr0fLAJ
X-Gm-Gg: AeBDiesMxur7Nn0UVc5bE8DzQ1xbgRWc3fnL6uY3RRPi0c7m9RIIwGX9s15AJ9C+zaN
	65jgMthdetCHaN45BVhydkbaa5/VuWOmlex73Hx8rjxJnWnap+0KAYkOylXCUUerZvZ7OYKN4hT
	g6eLe2kL71ffKmVvwFECRUIFjdeOg5/1Rijbt0M/j7jTK2mGIxmMfn+Xih9cVsGu/dqKtmhBC0d
	DHfEaTneGnNg12xHrQiSZVjIq28qvo+q56NIAJSr2mtTrkcAwqci92GyxtSKoh1hAWajtAaF3O5
	Ely2mDx2YCVSXHRYyevMSLBFxjeuGpLg1k51SdA2LU53vMh06uyJ5wsMLS7+Pxq2GM90Zh82tx9
	2U/DtWxDRlRZeD16jWJ+tOc1gbj/V
X-Received: by 2002:a05:6214:27c2:b0:8ac:ab30:fffa with SMTP id 6a1803df08f44-8b03addd7bdmr442488146d6.32.1777054431180;
        Fri, 24 Apr 2026 11:13:51 -0700 (PDT)
X-Received: by 2002:a05:6214:27c2:b0:8ac:ab30:fffa with SMTP id 6a1803df08f44-8b03addd7bdmr442487526d6.32.1777054430667;
        Fri, 24 Apr 2026 11:13:50 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae86947sm253378776d6.37.2026.04.24.11.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 11:13:50 -0700 (PDT)
Message-ID: <4bccf3d1ab49dfdff29a69b2040c4d0aef0e87e3.camel@redhat.com>
Subject: Re: [PATCH v12 4/5] rust: drm: gem: Introduce shmem::SGTable
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 Matthew Maurer <mmaurer@google.com>,  FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>, Miguel Ojeda	
 <ojeda@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter
	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Boqun Feng	
 <boqun@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Krishna Ketan
 Rai	 <prafulrai522@gmail.com>, linux-media@vger.kernel.org, Shankari Anand	
 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Benno Lossin
	 <lossin@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
Date: Fri, 24 Apr 2026 14:13:49 -0400
In-Reply-To: <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
References: <20260421235346.672794-1-lyude@redhat.com>
	 <20260421235346.672794-5-lyude@redhat.com>
	 <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t1q8oHe-SzoqHnGchtN6PSw3VVFPFND5SgAzoFFCTDQ_1777054431
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-04-24 at 00:01 +0900, Alexandre Courbot wrote:
>=20
> This fails on master:
>=20
> =C2=A0=C2=A0=C2=A0 error[E0432]: unresolved import `crate::sync::ARef`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --> ../rust/kernel/drm/gem/shmem.rs:36:5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> =C2=A0=C2=A0=C2=A0 36 |=C2=A0=C2=A0=C2=A0=C2=A0 sync::ARef,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^ no `A=
Ref` in `sync`
>=20
> Importing `sync::aref::ARef` seems to be the correct way now.

FWIW: as I mentioned in the cover letter, this series applies against
drm-rust-next - not master.

