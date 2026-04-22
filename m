Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3390A19E992
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Apr 2026 22:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776898383; cv=none; b=Z52mxFOygrMbjD3pT/JmothyH0s/kL+IeufOr4WZ9xPqQISv32LKNr7d4y2QiHvLhvJArzN6Q14RgaPpBMAVlZZUvbTKdoRuKRGJP8yS7hXQWIM0ilGnPYG658i/4dFGkwYRfZP61S57Un2584I42LN68eO/kXv6ts1iPrtP4jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776898383; c=relaxed/simple;
	bh=LNEiiKAr8tGgxUxPcWc2lJsVUeALFhcpoNoEGS7JOyc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ebFWvecsNl1zzDuUQ0n+jf6sxRwp3bBLZdWBqWiIt5hxpqbAk23SP+HoqfGOZBQ+dwp6HIa6FmK3qZuFytSRQcZNH7zax2zQBWbzcOmQYa7NpIdTTY1R009ecVfAhDMy9RtB5TewHlYLQSr4kNf9ZS56z6GEn4iCWdHHGRrLqRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UlSkP8yL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UlSkP8yL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776898381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LNEiiKAr8tGgxUxPcWc2lJsVUeALFhcpoNoEGS7JOyc=;
	b=UlSkP8yLGSSqGxDJ1XOe9SuMcKE4g22tQT5kqxy7BE0VmRNR4Mn4xrHua2iVx1UeqNeAYa
	KTh9qC02BTWPomaLemDqSLtstti6gCMOQ9R/t5bcBq+OWZ5UGgD5fZiE5byG62oLpb4NaC
	22FeXr+/kbZ4XBtbhTE0llx3n4aPLlE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-mkrdMtOFMi6N92yM93krEQ-1; Wed, 22 Apr 2026 18:52:59 -0400
X-MC-Unique: mkrdMtOFMi6N92yM93krEQ-1
X-Mimecast-MFC-AGG-ID: mkrdMtOFMi6N92yM93krEQ_1776898379
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e136aff17so115002521cf.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Apr 2026 15:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776898379; x=1777503179;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDXm7aAVELWsp3pvLIzbso12bneOyuVrRAMZreDRWg0=;
        b=GmWVAhdzJ0ggci3zyVImkwx6DNYTYRK4zRsg6MHChWTpCdq0AVKyStK1q1j6Y0z48Q
         q7HqRWC9uc+LLs9X6if9+wJTHZbsCjja2jD77hWPIkaH9Ghlcl2Lsdnx1eZb/JBf0kd0
         WIwzzYanWNIA0fq3A+rWQhctxLD7zCpeZAcjRQKY777noKaQIAFgtS0Wymgi4UR+6CJq
         ap3/CGV9Rx5LMPPpucPwsHlMmHX+F7Nd7eos5jSc6Eu5WzHaaanR7AE6aNBits51epC5
         z5dr5Tmw5u+ueAv2nyZiMGr/wCJaaYxK27B7ZNVVJVeHetLld+NtqZBu+dReyOHukojo
         O3mg==
X-Forwarded-Encrypted: i=1; AFNElJ/wISCLN/nA8+rZPA4vJtgMPWAdfPEnuUFHhhjaoAJxj6b+zNKx6N74AFGJcsd24nYsKD1VddfVURtEpf+pqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyabqAlcTB0uWJxrcLQh8E3HkP39szYeWoUnvABltc28ZfB2UQS
	0ZQ5T7U+/Uve/T2yos47sS2ysLqIZ+2m//0l5uNKZraLm5kzsSm2LSrTLIqxRP/DX+Oz3HO4CvI
	NywyMvd7DmINL5vEV/+HxJ08EL34NjJOPvJY0NmK86IvimwLrKY/rvAtVTuZp29bp+rnW
X-Gm-Gg: AeBDiet5zRPOI8M0GXYwGxnMpuzt52wIWUQ3cu3uWB4zVht0+RBP1I44B9lBQTqVMhc
	No47FP/SRk+rF5PRNLYgxh3oVdRyAf+lWIn8A7u+hwn7FARXSaGZAmvWq7qw0kRYaZeaqUL2ztB
	PeW2K00xcd90RgH8HVhCbg2tavCOk9lHLd+Ak3t+crXLt4R0CknqkHEsCo5QZGtfH4llqN7HhR6
	nzun6IMeM8djE1UuIefKsOGUGYGCgylkk91B9rpmhBl4MZeD4VVF7dCIy1DZ4IKv+6BbR/MfxHq
	KGqWIhU5Z0vWHw6KHivdyezCM5z4H0yR60vEDSgoD6f9xIdP4Ivar+GbEMlUfpkRYuOAIUrrGGp
	3ZKWpvNarValxDa73XRFXKOuiMOuJ
X-Received: by 2002:a05:622a:4086:b0:50b:2876:586 with SMTP id d75a77b69052e-50e36820d3emr367722121cf.5.1776898379374;
        Wed, 22 Apr 2026 15:52:59 -0700 (PDT)
X-Received: by 2002:a05:622a:4086:b0:50b:2876:586 with SMTP id d75a77b69052e-50e36820d3emr367721591cf.5.1776898378914;
        Wed, 22 Apr 2026 15:52:58 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e394c1fddsm151910251cf.30.2026.04.22.15.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 15:52:58 -0700 (PDT)
Message-ID: <1b2d926b919471fd3fbaf5b79d47e1110f6c4797.camel@redhat.com>
Subject: Re: [PATCH v12 2/5] drm/gem/shmem: Introduce
 __drm_gem_shmem_free_sgt_locked()
From: lyude@redhat.com
To: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org
Cc: Matthew Maurer <mmaurer@google.com>, FUJITA Tomonori	
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
Date: Wed, 22 Apr 2026 18:52:57 -0400
In-Reply-To: <20260421235346.672794-3-lyude@redhat.com>
References: <20260421235346.672794-1-lyude@redhat.com>
	 <20260421235346.672794-3-lyude@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NBJQ5a-y4ZWnzyhhRQXIn6P6rbL9_eIpzOnJbOxJQU4_1776898379
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 19:52 -0400, Lyude Paul wrote:
> +/**
> + * __drm_gem_shmem_release_sgt_locked - Unpin and DMA unmap pages,
> and release the
> + * cached scatter/gather table for an shmem GEM object.

It appears that I misnamed the function in this somehow still, so I
will make note of this and make sure that it gets fixed in the next
respin of this series

> + * @shmem: shmem GEM object
> + *
> + * If the passed shmem object has an active scatter/gather table for
> driver
> + * usage, this function will unmap it and release the memory
> associated with it.
> + * It is the responsibility of the caller to ensure it holds the
> dma_resv_lock
> + * for this object.
> + *
> + * Drivers should not need to call this function themselves, it is
> mainly
> + * intended for usage in the Rust shmem bindings.
> + */
> +void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object
> *shmem)
> +{
> +=09dma_resv_assert_held(shmem->base.resv);
> +
> +=09dma_unmap_sgtable(shmem->base.dev->dev, shmem->sgt,
> DMA_BIDIRECTIONAL, 0);
> +=09sg_free_table(shmem->sgt);
> +=09kfree(shmem->sgt);
> +=09shmem->sgt =3D NULL;
> +}
> +EXPORT_SYMBOL_GPL(__drm_gem_shmem_free_sgt_locked);

