Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02B361651
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 23:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777072221; cv=none; b=kO56Ij2bBxFWUziFHwCJmCh+NYcqYSbWEKqHFihnQvnHVJCGW8FDEM9/pHaaLjxJwmlT2atlVkHX7LrnxFVJVpc+TBgAf+xt6b5jSxiBgXORRD4loGFx4VCGOb2xsb98nhCgR1CIYbvmjGpu/gGqUcY+H+J6ibpxITZVr2I63es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777072221; c=relaxed/simple;
	bh=N09YNoupJhmv1sapC/t38hsbn3OUvdSVBkUzd+3dwtM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qGu/6W4rk8SzGBfxn/dsZpW5Fe8ED9ddJI2XBaheLtOvM7YPFzu9WhiTYRhez2rPt9MDPe1awT58goKD2YpG2T8wwEyJfG7k+a6cytzUyjP6hSZuyq0kagyl8Vw4nSTnaBUYyEqm3koeVuSSaJagIuShJvn9w41/KjbO9r6crt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fgRIJhlb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fgRIJhlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777072219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N09YNoupJhmv1sapC/t38hsbn3OUvdSVBkUzd+3dwtM=;
	b=fgRIJhlblErDzfxZL7WOdBVvGI2JqM5hI6/SWvu0nYBP1PbASuHWqyDa7V5D6MygffIHw/
	oK4/eeB0miQjOWA18LbtEUMrK3xDmx/sUQA/pnQ71s3hpUOvWCD6+tyowCABciqiMpQEMf
	MFbAph/bl6oEPmFwsD8qfbJYbFK6kzQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-4P7CTA3tN9etTlGrCaz1xw-1; Fri, 24 Apr 2026 19:10:18 -0400
X-MC-Unique: 4P7CTA3tN9etTlGrCaz1xw-1
X-Mimecast-MFC-AGG-ID: 4P7CTA3tN9etTlGrCaz1xw_1777072218
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d5b5d607d1so1681188185a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 16:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777072218; x=1777677018;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N09YNoupJhmv1sapC/t38hsbn3OUvdSVBkUzd+3dwtM=;
        b=svGysM1tqsQ1KzEvLa/pVvbie/UWjpAKKhRIEliV4lCVnKGisMvXH8RFBovVIuysYc
         rGc4l5Z175eH+nm9nmojuIzjQNQZJlm4nyaVhioGa8gBBwQ0awP+stVBBW2A9KrscLB+
         Tokt5Eh29BepZ4SemBxLiQckk3N/R87cMFeWeBZMT5A29PFlCBtXXrrFRMnOxAybQrm8
         YCIhKMXePJ9L9+AH9Wwv27hZ9FJ6YRHfQeDoJdQqBXGMITo/jOiureS6C4h2UJ78vRmv
         eIfPyQaSFlEfYmtSoiixJG4YT10BlpoVezjfBSQ9SgTkYHViFmrljStNdES9mG0Gh08R
         wDww==
X-Forwarded-Encrypted: i=1; AFNElJ9Bt/M+9w/5gdzQXqfIWKijIyCpjQcGKEOhQwmpx1x6uTSgHeEkCUXDX0aDLJahKQjf3gW7Mcv90heWcXrM4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUWvvXPzFy6q8ISmTPqqJN+pxalVqVBKm13YSjdWbSjydoXaRA
	0DG2iHwFkNf5qM9EpoXDfd/RHoGLQ6X+CLmyOIWkroH4tPFNHvFH4Nlo4jiYzP7LCUNMbuvlvyb
	rSI2j0qUUISRyUf5snjb8sJ4Ap4J6ZynveNOhoQGRmnZ7NfC1jikJBvef0K8ma0nOP/6P
X-Gm-Gg: AeBDies1ofHKTRMhlRWcLASDI2+725EIVA/o4qPu5SiyytRApX6XPe2ltCw5dH6kGwj
	OqUBQK3u7q5PEW2JDGbVy7/EwIDTcfEY5aUu6FGfFIx0nbfr4sa1z8hJbGi836CSjKd66TQEL6h
	kOPnb+PFQEWniDxPdiv+6WEbLGKWUc1TN0cw48JZMrvoyCXeYm7eCxG2KgzxNo0+c+3OSj2elmE
	Vzodp644JD0kZJgeYt3ex/xMB4X4Crn89yT7gOB7exRtYJcdz09rkmvgGQz2KVyHzeX8dnxffPD
	rdLPiXIZEW337YT0IveEE60Zv7C7MD6I8wa8rogFElH9PPt/D8WfdbCTJWGRN65OuiZyWMZQ1Uk
	Ub5KewZVfEOa7oPbifVjE51fARC5H
X-Received: by 2002:a05:620a:f0b:b0:8eb:cbf8:85e7 with SMTP id af79cd13be357-8ebcbf89261mr3123560785a.34.1777072217920;
        Fri, 24 Apr 2026 16:10:17 -0700 (PDT)
X-Received: by 2002:a05:620a:f0b:b0:8eb:cbf8:85e7 with SMTP id af79cd13be357-8ebcbf89261mr3123553685a.34.1777072217335;
        Fri, 24 Apr 2026 16:10:17 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d69ad48asm1913863785a.19.2026.04.24.16.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 16:10:16 -0700 (PDT)
Message-ID: <ed26658c461020547e058b237575324adcbaca59.camel@redhat.com>
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
Date: Fri, 24 Apr 2026 19:10:14 -0400
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
X-Mimecast-MFC-PROC-ID: zQyn6WUwXRFJuo4--NRSf4tyET3Bk2cLxxVZ2lSGHVw_1777072218
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


On Fri, 2026-04-24 at 00:01 +0900, Alexandre Courbot wrote:
> There are 4 sites where we acquire and release the DMA resv lock,
> each
> of which require unsafe blocks and carrying the risk that we forget
> releasing the lock in the end. For this method in particular we need
> to
> jump through hoops a bit and store the return value into a temporary
> variable so we can unlock the DMA reservation.
>=20
> Let's do ourselves a favor and implement a small, private guard type:
>=20
> =C2=A0=C2=A0=C2=A0 struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>=
);
>=20
> =C2=A0=C2=A0=C2=A0 impl<'a, T: DriverObject> DmaResvGuard<'a, T> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn new(object: &'a Object<T>) =
-> Self {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAF=
ETY: This lock is initialized throughout the
> lifetime of `object`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe=
 { bindings::dma_resv_lock(object.raw_dma_resv(),
> ptr::null_mut()) };
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self(o=
bject)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0 impl<'a, T> Drop for DmaResvGuard<'a, T>
> =C2=A0=C2=A0=C2=A0 where
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 T: DriverObject,
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn drop(&mut self) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAF=
ETY: We are releasing the lock grabbed during the
> creation of this object.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe=
 { bindings::dma_resv_unlock(self.0.raw_dma_resv())
> };
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }
>=20
> There here you would just do
>=20
> =C2=A0=C2=A0=C2=A0 let _dma_resv =3D DmaResvGuard::new(self);

I thought of doing this but lost track of how many times I was actually
grabbing this lock=E2=80=A6
BTW - want me to just give you authorship on the patch for adding
DmaResvGuard? Since on my branch I've pretty much only just added two
inline annotations, it's otherwise identical to what you wrote here.

