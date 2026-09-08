Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E056B866
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890266; cv=none; b=hzN/huLXXAq3o2KvwPC8miC9guuaUZ0opZm7xw19XBVsPzaFKZEXL6afxB+Qpm5WgSFZlQqgPCdGAtGwNGnjedoRK2BgMe/ykPPoRHyQsoIZ1SlBncbpuPogqr+4PUUpqTVaaYCRcsXob1NXmHMAiV39/tSXF3JbuIu3C1CrvkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890266; c=relaxed/simple;
	bh=LK98Ep7X4xlOo4JMZD4weYKrKFvfB/L2QK6C3Rc3ofM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/z+vjjXwLG8rU08b7mtDOEPxsNtG/hufjO/eDZnHYJh4A9vHZcFaQqMh3pP0Pd2I3jGcgcuYDrPErhDwKfIGJlEbph6riQykbasmq6TuYBdUNUPnn2VTpIPiEnGS4qs9GvAWxuOdenbo0x/ytAGaqcFmFXm3xISVGGyS8PoLeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlqQfwdz; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlqQfwdz"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a2b4743936so38531441fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 10:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788890262; x=1789495062; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqvYHjfMGh1MW54/g0K1Oez4luMXjAhsckidP9l0mRI=;
        b=GlqQfwdzg7iGl2s8M/PvnVcKt8rh/HbLEyK9oNUizI5zePW3SUEmtld/5tHN8lEofW
         6hEAgG1VfAhSI+tzSBu2qnfy0D0BOnqeBYmY6zOdosixTTzVl0Ckt95SobPBgG4IC/96
         Hip1qXMbOn+j8GzU6x2az50gZ34ON2Y3ehAGezmI6bgakqAOfjc/9FLJnomurnj6Bz05
         zqT0g1Xxz3xF7Lu3dYj6hFPM5ONXQ4orqCh0wPcPxwyIfTt3sA1UHgrBMljrOFYGdgOC
         iMhDZ1t30bMaaIguUv+rg5dy6oB2eSyY2npSN7uker1ZVxlucP+1iS6shbx2C2qqS+x2
         PXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890262; x=1789495062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YqvYHjfMGh1MW54/g0K1Oez4luMXjAhsckidP9l0mRI=;
        b=XuEvi6cZyaBNAKHWG98d1hGCtLsatYPcDf6bqlWHsrdU72IoDkgaTmuHDfT+LfUnPn
         e0WDvNY+bRbSVTDyM4tc2GmivLG88I4vflz54kEXidtvYiCTSC/xAcJmww6mDi2cb/Cb
         mO7A9LGIa85Gv/oq59ZDd3p0lSrwKJcx2Qxwo8W3yImegOkDhPddQ22yvqCXGksQVYoL
         OapWe0SrgEXKV3VXBkApXLvCUe3F6o3nk15IwlhopO3Bp02tOaPYfP+hXa1Pj960wU8I
         oRIQ1Wp/68OzdXlc8tZ7QQ3IuwO16bhyGDZCux5bCrFbmqOBTeiu/iJkMoBBZW/2dQsB
         WZYg==
X-Forwarded-Encrypted: i=1; AKwUvBxChWf99ACDGa+bsCN1YGNVfGPsklMq8eSbgzKUgJggU+XGVW9T3IsLFCtvlm1KxoWMg1Ny+x8fQsSU9BgqCw==@vger.kernel.org
X-Gm-Message-State: AFuF++nU7hFTJlr1ntjTPT/+34Vm195rBSqzTuSOJ6JnUD9PDXBV4gom
	BASb4Dr9YKkyzFstXezr8TDydcGDKXe2Bt1e5o3UGzsh4Qh6IZdlE2tr
X-Gm-Gg: AYBFou1NiqsuJG8iytF9FDm5pqc7oVi/TnMXSbMKlPakeJec/6/JJwTvoQIkl4Ai5S4
	3fpIzdp1aBVz9VbWRwL3yRhiRdiK0oz0a1RZkfI97EgWYX8Ru+tSDyx9eJXtZ+eBYics2X6Fs+R
	f+YSiSmbA1nz48nh7uLuDDrOkTyCIEa91bQBGFlowvLnHNangB9r26QjZ6zSdq+iI+6M8vKQoD9
	sqCRa8nxRXNwqXPCDafm1/9ZPTm8KfWh+o3O9nh+n/LQDfO52s1Fv3ECvS+Sd9/mznnLYz+UuEF
	fwSyxt6gV0qcli9R8qzPVIc3klmaEaJrydsJ7Fncz5Vl+5KbjR6FegMDEk/8GXK2zetCCrJav7Y
	bIJC6/YQCN5JWylF3GyDuprgH7ZyEYGhm+Cu7m+BcqLP46HqpTFi7YmWQQbQvqG8bRpaOtIC4nb
	5d/xVwD/ilveUuXOLRUyeMddpoA4emgJPHNytUTxWDxG/x1WAF+gd22rTdJpGsHT+x7dY6YA0nb
	yw=
X-Received: by 2002:a05:651c:543:b0:3a1:8dd6:aaf9 with SMTP id 38308e7fff4ca-3a371b871c6mr31427461fa.8.1788890262340;
        Tue, 08 Sep 2026 10:57:42 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3c2a44f1dsm34401741fa.33.2026.09.08.10.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:57:41 -0700 (PDT)
Date: Tue, 8 Sep 2026 19:57:41 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Alex Deucher <alexander.deucher@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Felix.Kuehling@amd.com, 
	Mukul Joshi <mukul.joshi@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/gem: Add callback for when handle count goes to 0
Message-ID: <aqBMUBzgwXT4Ry7u@soda.int.kasm.eu>
References: <20260831183311.1090131-1-alexander.deucher@amd.com>
 <20260831183311.1090131-2-alexander.deucher@amd.com>
 <aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info>
 <e8a53eb241b2cc912e9cfad5f6a0120aa9683481.camel@mailbox.org>
 <apyTR-f8W6Jt7uP5@soda.int.kasm.eu>
 <CADnq5_PjN8X9V0PQ=no39NCAGM9Hp1JezOuKNpHqwo1=WfsPQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_PjN8X9V0PQ=no39NCAGM9Hp1JezOuKNpHqwo1=WfsPQQ@mail.gmail.com>

On 2026-09-08 12:03:57 -0400, Alex Deucher wrote:
> On Mon, Sep 7, 2026 at 3:25 AM Klara Modin <klarasmodin@gmail.com> wrote:
> >
> > On 2026-09-05 11:31:41 +0200, Manuel Ebner wrote:
> > > On Sat, 2026-09-05 at 07:36 +0200, Thorsten Leemhuis wrote:
> > > > On 8/31/26 20:33, Alex Deucher wrote:
> > > > > From: Mukul Joshi <mukul.joshi@amd.com>
> > > > > ...
> > > > ...
> > > >
> > > > > > error[E0063]: missing field `handle_free` in initializer of `drm_gem_object_funcs`
> > > > > >    --> rust/kernel/drm/gem/mod.rs:265:58
> > > > > >     |
> > > > > > 265 |     const OBJECT_FUNCS: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
> > > > > >     |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `handle_free`
> > > > > >
> > > > > > error: aborting due to 1 previous error
> > > > > >
> > > > > > For more information about this error, try `rustc --explain E0063`.
> > > > > > make[2]: *** [rust/Makefile:799: rust/kernel.o] Error 1
> > > > > > make[1]: *** [/builddir/build/BUILD/kernel-7.3.0-build/kernel-next-20260904/linux-7.3.0-0.0.next.20260904.221.vanilla.fc43.aarch64/Makefile:1442: prepare] Error 2
> > > > > > make: *** [Makefile:256: __sub-make] Error 2
> > > > """
> > > > Full log:
> > > > https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-43-aarch64/10951622-next-next-all/builder-live.log.gz
> > > >
> > > > Reverting this change and 2/3 from this set fixed the problem for me.
> >
> > That leaves only the documentation without the feature so might as well
> > drop 3/3 too in that case?
> >
> > Otherwise, the following also fixes it for me:
> >
> > diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> > index e1ebad77ebe2..847e0ee38863 100644
> > --- a/rust/kernel/drm/gem/mod.rs
> > +++ b/rust/kernel/drm/gem/mod.rs
> > @@ -278,6 +278,7 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
> >          vm_ops: core::ptr::null_mut(),
> >          evict: None,
> >          rss: None,
> > +        handle_free: None,
> >      };
> >
> >      /// Returns the `Device` that owns this GEM object.
> >
> 
> Can you send this as a proper patch?

Here: https://lore.kernel.org/lkml/20260908175427.47207-1-klarasmodin@gmail.com

I liked Gary's suggestion so went with that instead.

> 
> Thanks,
> 
> Alex

Regards,
Klara Modin

> 
> > >
> > > Verified.
> > >
> > > Thanks
> > >  Manuel
> > > >
> > > > Ciao, Thorsten
> > > > > ...
> >
> > Regards,
> > Klara Modin
