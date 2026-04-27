Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33283E314C
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777310979; cv=none; b=Yy5g7VOVQpujY5AC4ZxHX3OCShU0V3TQmqLDrpJlpOHzYxf0YX3954czYP+UugmJ3vd8TCLoVCzxAo4/Ld77pcxMrGn2QsrzuhLOAG8HWuc2KQbnKBZ086sabEIHIHseHbL3tVJwpFSQGkU5hRvQ3dd+HbwaxCHYd9/otmu3Qkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777310979; c=relaxed/simple;
	bh=KF7u6ZoNxfK3+BpCCoO5erH9nqzrz/OiFIJaWAx89LM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HEpgg/wyEMvFepUbT3R+wJV01Lh0QoZL/9Sa62HuJvHRAd39mKPpPb1FsfUuaiPzeMxxeSnEZMEWkWeM5/PudGncmxbW4b0bSnzr3neYw1rkUaLUh094tTIhXlUI8xb7hEA02xbzHcInFPZgfV9PzyOzEw42eSVqBxDw8bn5zNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UzwJFbPm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UzwJFbPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777310976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KF7u6ZoNxfK3+BpCCoO5erH9nqzrz/OiFIJaWAx89LM=;
	b=UzwJFbPm+yBC2sBZK6NUwy92uQMxo9PwqPVrKO020huDwOjQE/Dhmo0He/cd9RHIJS3Py2
	RvAREdBe6o8uPcns/cRUidqT36tgWBHdVp4icJwKSOLo2dSwjGG+j1tggvMVnXC1L7sZpi
	Anu2N5053xmsiOAoNLMo+zn5b7/M2MQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-0Z9vnwPkNK6M5FieW6zUdQ-1; Mon, 27 Apr 2026 13:29:34 -0400
X-MC-Unique: 0Z9vnwPkNK6M5FieW6zUdQ-1
X-Mimecast-MFC-AGG-ID: 0Z9vnwPkNK6M5FieW6zUdQ_1777310974
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da529ff48so45830471cf.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 10:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777310974; x=1777915774;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KF7u6ZoNxfK3+BpCCoO5erH9nqzrz/OiFIJaWAx89LM=;
        b=QuR74stnFu2cEE8l084S00FBtathv8SsWqiwa995fXLYsbwDjGnefpzN3ZPyu+l8tM
         5jlpVVmtxvh4Vw2Xk1NRl1n9iCBNFjLyN+BDJ7S+6/cj1WI4c5PgzbgF6SNCoXbS4GOg
         eDNsSXQQF/CnQUV01C3LLDpNnA1JHlTdnxRH89WPzuZYCo3jZjjwPVjSqmGTVAA9Ek2k
         uc6vupOvrFdZnA+7S8bWXd6wBq1Cm1q92iKV8sU5d8ILmybdDqKeJY8q+gE09FDZnnrK
         8RfBhDa32zvRHLzzQoQq5Cne4w3Bol0XTpwMxpp0hiSr808O5c+rLkkJAAkUlaOUQgSc
         XMdw==
X-Forwarded-Encrypted: i=1; AFNElJ9Vadh2QOSIZhkHf/nzAHP1BtVLp0Q/HOImEYfjQeNA1mARlnNkJ3YYVvMVmM7fLqGMwHoWHESJF6FM90PE0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3wT9N+NsqRKX7f0hE6o4chdcsRgiNRbR+Zh7vjHnGXm8f1l0E
	bePjeJ+IiimuTbBvftujt9XqBk+pW2vTCm4E5gyYGaUJHGhjLpDQnsQR+/Ju4OORITwdJEVKQcT
	pPeOALavlYlcZ9Ba/fl8sy6DfzTEJdPlxjinZvcPYd73AaV0bXQjssVIzpt1N0szBddpH
X-Gm-Gg: AeBDievVRDuwQS8CAICdiFdHjJLIQ0nnBnrBa+K8Sh6RFIO210lh3QwvP7KM6w0Yur5
	3YYM8WKsCMlRFiK8gYxKfDanfVVtElXX06kFmcXdxLGBVFN5Par/ejVqLEc0YJ6uPKNnE06cNvF
	j8gbRW9j/n+KgXJf2qW5EPZs8b6EilrudTDnSaJHaCg2MyPPYytvao/QD7wSznYlNy0/zuqYTgB
	aiCl1iiiTKvYnZEopsbVTo31PK7KlUAZPNqJr54AihkiWNp4CZm4mwEchzJxMCO/OxlJZx7qmVj
	POVG3wJcmvIaV4aosFRhMdAQMbw1E/F3EKjshNzySYx4TMg1A2tOKZeRIQKu+r3B/F81QhKKYrv
	fVOylJSAPau5oIRYrcFxu9sZqOqgN
X-Received: by 2002:a05:622a:486:b0:509:1009:e7a6 with SMTP id d75a77b69052e-5100c97933emr2571331cf.43.1777310973865;
        Mon, 27 Apr 2026 10:29:33 -0700 (PDT)
X-Received: by 2002:a05:622a:486:b0:509:1009:e7a6 with SMTP id d75a77b69052e-5100c97933emr2570391cf.43.1777310973161;
        Mon, 27 Apr 2026 10:29:33 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e29932fasm285886d6.45.2026.04.27.10.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:29:32 -0700 (PDT)
Message-ID: <2f8a8b96473d99cee6f33075532a97f956ce21bc.camel@redhat.com>
Subject: Re: [PATCH v12 5/5] rust: drm: gem: Add vmap functions to shmem
 bindings
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
Date: Mon, 27 Apr 2026 13:29:31 -0400
In-Reply-To: <DI0MII8J4P2Y.309VKYVMQJNVK@nvidia.com>
References: <20260421235346.672794-1-lyude@redhat.com>
	 <20260421235346.672794-6-lyude@redhat.com>
	 <DI0MII8J4P2Y.309VKYVMQJNVK@nvidia.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Lgh_1FVc1z9z2T0gMCMyjFphqBljNbqWoZn1e-h9IdI_1777310974
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-04-24 at 00:01 +0900, Alexandre Courbot wrote:
> > =C2=A0=C2=A0 dropped before obj.
>=20
> I am not sure this is enough to solve the double-free issue -
> although my GEM
> knowledge is lacking, so please take this with a grain of salt.
>=20
> Take an object where we called `sg_table`, so the SGT has been
> created.
>=20
> When the object is dropped by DRM, `free_callback` is first called.
> It
> calls `drm_gem_shmem_release`, which frees the SGT.
>=20
> Then, the `Drop` implementation of `Object` is called, and `sgt_res`
> is
> dropped... which attempts to free the SGT again.
>=20
> I haven't tested that and rely only on a quick look at the code and
> my
> partial understanding, but the correct fix appears to be to clearing
> `sgt_res` in `free_callback`.

Whoops! No you're right, and so is Deborah (she mentioned this
previously, but when reading through it I completely forgot that
free_callback() was in the picture). We can't clear SetOnce, but we can
use mem::take() which should be essentially the same thing. Will fix in
the next respin

