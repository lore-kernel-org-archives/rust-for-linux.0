Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CBD314A65
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938626; cv=none; b=ekbddMmksa/IMD/SmYqPm91i5jWHLMElQKktdB1lGgTA7zowMiDkzpQoeUMIk7uSjFUgvQQHPAO/eevV0m1pMfC/nCUVl4AVUgG59CWoGAeObggXa7IVEvGNILDXPwAeGkTMYO8IHrLYKJ1P8XPV5pg9CYCJm+jUWqpVykSSq4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938626; c=relaxed/simple;
	bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZqJA+nV2wBmEPaPdyC5hpU/d6v/CSCUNF7nYFgNBgmf9k4i/w8h79eBiCh+DQVNYZ1xqmulxNt861nbH9R0KDB0HQ7f3kL5LGTSbwvpvzHu3EGNpPg71A/QCoXXvAU399NQw4/3fEouxKZX9jUnzmSTHiAMBM0sauviAnVQD96o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SFxAVRNq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SFxAVRNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780938623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
	b=SFxAVRNqHLF8ytioa7bQZbX3IvwiaJCtxh5PWykM59Xvtj0+F1rGigTsuOgKmeP8IZ65eV
	/710bYsdaufOV029jvk/BKXzZvBRFRcQTyRKxDq1htZDgtJKnH98pAe3UBEdDq1eVsasyt
	l0LYhovUmhg4mxy5MVjl38TgSqHRVpI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-iGt-3wqAOcidtZ-Xda8oLw-1; Mon, 08 Jun 2026 13:10:22 -0400
X-MC-Unique: iGt-3wqAOcidtZ-Xda8oLw-1
X-Mimecast-MFC-AGG-ID: iGt-3wqAOcidtZ-Xda8oLw_1780938621
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157f453a27so943244085a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 10:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938621; x=1781543421;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
        b=q4kSJM3CqX3orRoYmAmeRKEdIINrJhLW123s4g8jAGPdht5EvCz4cXZO6w7cWHOIQy
         PC7zl1HiLoZgBDSe18gPwdw9wPHdkHeho+CVT+ezqk+3cCwpw3UktQ4SMiEb2K8DEjZA
         ASma2/40S0YSEJHR6gLKmqXdyQyYRjuPbTp1AS7iBX9TTvHzCyQl/Q9BATmDCSIRjUf+
         +Toozhd4OQYriFKKVgg8j6wBHKQVRBtIrIkycUCHnE6A8P4UUJH8JoewKe3AilK9ApdW
         Pl5NcXhdzv1EpGyPc3k+0VbCsmuo7iDVlsdp1GnaFWTKeB4Ad9zEr4fKCSXfhvhlZRcc
         Pdkw==
X-Forwarded-Encrypted: i=1; AFNElJ/K3p1rp0PNPTc0oqwYk47Rv/1YW3wfxFftUoZSfYMqm0Rv3xd1zsu6gUK4OjO/YWBkSB2AUqOl2c32fFvHpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzExg0SVk2hpqCmmtNdOp3XlW17x5fkNpDFzWg5EGzPkax2z2Ta
	OIOY+k/8OVevNhTs8gf80wy/H2L3i1f55UP9oOp6acIrLwDCJ+c7pyWteRjJgAvqptLXFbv/1+k
	o6P4wqUz7+ZxUwnzZ6Y2DYwOD4YJ2XOAMtNwkluY702YnY764f54wY69hyArNmhCyqxN1
X-Gm-Gg: Acq92OEyBgXQIHdM4dxxHsu30UwpsDqBBcd8zHSaLnHXXyRZ49pCLzoXrF9uEqZh/Iz
	sLG8oc83OlxOBkX8EXv+wZ1LtQH4gV/lJoEPmq1Wg5cUAAT0Y+ZWoC1Eo8Pm5WgviAyVANFIGVa
	Pd0Pw+1l/KV2ktKzQO1H4L+fkn0blH9nqNIhyHZxDzq2BbZtNa3AhGEO9DFr2tC9n82ovFP8u68
	yfIhWNV5nktl4f6dYwGDaelWGyuGuwe8rW9QZ57ulLRWbFbgTjbTrJs7sKbm6MTgbDXC74efubX
	dL/3b3gpIbY2b4lUOn1cisbvMZQG4ePDZ6txJK1nOfFH+FpT1p8sZoOYsEZ0dB0snduf+KkH3t9
	gfDyOO/H5pgdznsBNxcWEFcVQAzJq
X-Received: by 2002:a05:620a:254a:b0:915:9943:d760 with SMTP id af79cd13be357-915a9db892dmr2520125185a.43.1780938621254;
        Mon, 08 Jun 2026 10:10:21 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:915:9943:d760 with SMTP id af79cd13be357-915a9db892dmr2520115285a.43.1780938620617;
        Mon, 08 Jun 2026 10:10:20 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3bf5f9sm1822479085a.35.2026.06.08.10.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:10:19 -0700 (PDT)
Message-ID: <00c7a09eac169e9da541b50396ceaa69ae978c10.camel@redhat.com>
Subject: Re: [PATCH v18 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
From: lyude@redhat.com
To: Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda	 <ojeda@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Alice Ryhl
 <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,  Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin
 <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org, Danilo Krummrich
 <dakr@kernel.org>,  Mukesh Kumar Chaurasiya	 <mkchauras@gmail.com>, Asahi
 Lina <lina+kernel@asahilina.net>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Mon, 08 Jun 2026 13:10:18 -0400
In-Reply-To: <DJ2TB5AX540T.311A690IK8F9B@garyguo.net>
References: <20260604192740.659240-1-lyude@redhat.com>
	 <20260604192740.659240-2-lyude@redhat.com>
	 <DJ2TB5AX540T.311A690IK8F9B@garyguo.net>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RkeTvm1lAxjtUh-91hUEZHL4pwYTStYAmpY6xkq5Agk_1780938621
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think I have just been defaulting to always for anything that seems
like it should be unquestionably inlined - should I be defaulting to
#[inline] instead?

On Sun, 2026-06-07 at 13:22 +0100, Gary Guo wrote:
> > +impl<'a, T: DriverObject, C: DeviceContext> DmaResvGuard<'a, T, C>
> > {
> > +=C2=A0=C2=A0=C2=A0 #[inline(always)]
>=20
> Why `always` here?
>=20
> Best,
> Gary

