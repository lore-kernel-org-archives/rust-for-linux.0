Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A7536D517
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 21:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327183; cv=none; b=EIbiLl/zmhkMezOFyPFu9rl+6LNv0K13LMr69QQxpuTet3dMVk/o7u4Lge/Sb2wy91vjpwsmLxTUT1EjQcPRnympW6f4tihEZi0on0c0+IePd0BGNrniMgDKzOGROQpT9THBOR2zwFfEZNuICnMJTwQz2u0qtV1BBCOcnqCzxAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327183; c=relaxed/simple;
	bh=7P7VU36hQu4iMsGekLZKiPL3rBFQOW0TOaXA+fXfycA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5rp3g1jf2MCSyiauJ16Vrt+pVddWeXb+zh+RaseIttpqkelfpgH3hPfj165VTCgIKo6FtQeGs9fs2srHISLjdzFrB6TbrcFDky5zq1e8MrVQn6u6/tut5NxXaOpIOb8YTg6aEo2oFoKa6nu0W1XdoLl2Qc9i3WiMlNyfxK7jGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iMVLSyLH; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iMVLSyLH"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso1582056266b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 14:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777327180; x=1777931980; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=iMVLSyLH9Gv8383rhVayWGwN3yw3LatQUO43crKKPHpeA/DczzeGF8vYQD3tOff8HT
         prdEE/hklISEOQGqfoEN6zP5+soaNRLVAts9DnU6sp6IN27ZCCBpQuSlpeHlqMsq04f7
         TfRkoQ3616BK6Pos3gvJCRnmku0l05mLAhD7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327180; x=1777931980;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=ITQrTJ+z2alrS7bQvpizgYG+dpbPG8RvetzvNEDUKCy/EEvZO3syIwF4hAU5HQBLdB
         J2RZyOggpQM/xJxOGBOnPLYNyBNCIoqSLuijBlSPm0GmQgDQOoSU1xx5ZUEQVgT7poVV
         VaCOf85ek4+hyAho0nhPqoz6TiHbWsiK43LDN/mZGnq2l0z1uLENR+ZAcdwZDmunBPIG
         163mhrclTkO3imEGtHOA3/vM8ia0LkFXoVRAV/LrPjIINfxtEeW7raJOjYLE/gyadDKA
         PJmxJeHM4+y5UESBN+qDF1AIClcytJ/lmibrPLRDD5iFPwqZoAt7O+LFleopvKV4/18t
         UtZw==
X-Forwarded-Encrypted: i=1; AFNElJ+DZWB81exROhMqNgUvwwuK2b0D4/+7z5uJnjCF/lSWt4Q+Wd+8P2H5znRJxmfxDXvhnu1ggFxrZidl4NIyNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZX/ApcFkRLOZ+SNS3jFRgGBm+9bskuHDDaz2Dl60z/Cji+kAe
	akst7yOrzyagQLvkggbiyaHObHS/0/WKVZXTsppn2vPfjpYWWrW6aY+jR30NPUuGWFFIbHHObAj
	fMINAnBwREQ==
X-Gm-Gg: AeBDievEbLwRhx7E63BdHrrFa2402PaxKWawgWW1ohTW130g/BqHeU/4OL040uQ7omx
	sSZt+H5ceoNzSr5ZQU5uAQdtLrEFtZjjNmRPEtFciHx3elIoVvavn9UrbYsGLLv2r03ATwb3hzO
	YtKa2woodwXVl8XmRH24Zs2XdaL83gRDP1F44UeIMyrHwElO5QoLmkfhFFtOXPOoC705JYMRy+W
	h06y4EhCKBD9pKXtlrRe5/WldO2c4Mf/Emfk4aVQ0uAyl/Dm06CdIUqvs8kPwjavScM1/MTjDOS
	i/ROwc9PKiiME3faNNXVrDRSk/aZaAOxO3M2o85VPMKpxJhGVQZgWK6aC5V4CgLGoC2gn4M0CdY
	t8MltOEyMt3AApoWczsOO67vSi5WbQCMmO1riVZsU1GMMPFuPCfbX2ZWu/7Zyd/d58/by/1GCRK
	zv/fT2gZ581PWDPXMA4fNQE4knurKA3o7Jw4JNJYmH9vZBthQDomIO736nLBUZOKSBT5LGED61k
	IIglMCVIBY=
X-Received: by 2002:a17:907:6d1b:b0:b9c:3d56:e4ec with SMTP id a640c23a62f3a-bb8037784famr32011366b.24.1777327180422;
        Mon, 27 Apr 2026 14:59:40 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2add0fsm10177766b.34.2026.04.27.14.59.40
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:59:40 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-677f7c29af6so9399953a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 14:59:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Zd4T0k/EDEtpZV8ZEAXUKCT24FBzPPubcE5GbUUNwh6XIsf8VXizd/1OReXCThio2qRq8XEJT6kc18iuuWA==@vger.kernel.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus
