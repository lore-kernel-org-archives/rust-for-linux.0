Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9CA83CBD
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Apr 2024 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712065872; cv=none; b=QXaC1unbNtmOgnSKCZglFrvY1VuTGxuKpqwUTyBNpHKsalqZpOn7pKYkuZLJdfm3kvCZT0n6axPcTG68VohnUjat9PX1rcJLZdOm78Nn2q7y6r2UuECAIE79M6YJg10Ilz2zGibBuU5aUdC3Lcz0+jyBsmmARkU6NeXhiHDehJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712065872; c=relaxed/simple;
	bh=vDavRulvcU4J2HUs8SM1QoVpd5r2hxFlvdnsPl32dVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jeIA9CMKpcNEnTKx13H6KI+VYWINuNu9F6I9v4QUAenKY15RiZdJNRE7ZWmXofmKCdXe+mQ7DIz4jgGjcbFYzvST9evfKmJTmuFsZ1EMFmGpoUrzD7gHEgiybNjiqwzh4QnysXY/QAwDYGuF0R3czMpmL4ba+JpeGcmHb4j69cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZTy1OCRX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZTy1OCRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712065870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2RJTo9QZbqD2d+RUAKT5//4Cs4GMw7g0JcCMFnkbSaM=;
	b=ZTy1OCRXVk0WYUhNpb9i0B9goS7/DJitwzrfqzMINiWj8MAB4ktiEVl7NuRA8jAaYTNvPi
	5Jdbgbeu2DI5tmjGl6yl3xOnwac1elpl+uXgvNd3aOKyjqALRi7OAnbZnNuoASZ+2qzKxe
	IKeKPKNqpj3/ZYOChnLbI+8zfD4fyq0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-g9rImgOMObiLG4jUg5DFWA-1; Tue, 02 Apr 2024 09:51:08 -0400
X-MC-Unique: g9rImgOMObiLG4jUg5DFWA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-51596f968c1so4953554e87.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Apr 2024 06:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712065866; x=1712670666;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RJTo9QZbqD2d+RUAKT5//4Cs4GMw7g0JcCMFnkbSaM=;
        b=ZfGoknNDZfdXnrjAnSO8q7ND7jDppZjgPKueW5J1Echy3IS55PnYhY33fhFkKN4Hx+
         PSt9Uj8cD/3iGOeTvH1EVfRx+YTgdvgNEfsjxaapB9mDBUNF4fARPTVA4gSwdRpLCN7m
         vGlanZJCtskbeM8sfU/KpcIeHuyGnsLLOnvUh40Nu9UbKimtd4u+lzWKWinJVMFc+cn6
         iU32Tjo95WGv8ZpLGxyh4PqWCh82756a2k3JUV0L4dRRzM46Da/GJ6E62+gPojrlHzVS
         Ef0NmKQg3W+I69JDRNdcBaSEq9M/OkczT1iODkkV2W8phIxYZbNjgHSYFerOf+bMevle
         c+Iw==
X-Forwarded-Encrypted: i=1; AJvYcCW62+j9qq70GiezwPJmjsW8NIZMESKmxakJuL8FabuiYWnDobbnVar8uUiJRkzJChPGLOJmRnc0JqYJepWHkftJpLLsceJJn/ssCHxI1DY=
X-Gm-Message-State: AOJu0YyMTmLLuhO1CJR1mpb046ZWdNbrcEADWHPZgIescFtt/MRn4VYv
	q+iz2ykM2H5hn9uoDKQqRTXZOScZoab1JLVZ7kGXZ18vIBucHjE8hmp8a4GQn8tbBNc2SmVaiB3
	ZxfnpmTMQ7frOsgClB7BAZtwo411Ez/9mOl7SnYdni01OUPDHiAwdrN7PQQ3z2WoT
X-Received: by 2002:a05:6512:1287:b0:516:a115:4a4d with SMTP id u7-20020a056512128700b00516a1154a4dmr7193279lfs.68.1712065866286;
        Tue, 02 Apr 2024 06:51:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+g2F5Nlovmzt48Zd/LGCqMAB0+I22rf4CR4KB6v4poVHuh5qcsMoDkmjFHHFX83LMJ0g7mw==
X-Received: by 2002:a05:6512:1287:b0:516:a115:4a4d with SMTP id u7-20020a056512128700b00516a1154a4dmr7193238lfs.68.1712065865852;
        Tue, 02 Apr 2024 06:51:05 -0700 (PDT)
Received: from polis (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id u4-20020adff884000000b00341d9e8cc62sm14198282wrp.100.2024.04.02.06.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 06:51:05 -0700 (PDT)
Date: Tue, 2 Apr 2024 15:51:02 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Fabien Parent <fabien.parent@linaro.org>
Cc: David Airlie <airlied@redhat.com>, Greg KH <gregkh@linuxfoundation.org>,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 4/8] rust: add driver abstraction
Message-ID: <ZgwNRmzUfO0hCqCm@polis>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-5-dakr@redhat.com>
 <2024032530-fester-dedicator-a8a9@gregkh>
 <CAMwc25ryKE7tqA4WdOeQXWJJ5Z++s+p8=bMBAXPKQiw_Stov0g@mail.gmail.com>
 <2024032601-deceased-premiere-1c02@gregkh>
 <CAMwc25omcj6_OKdcBkke5yzC2M5oNO=E3EG4aezNfEMRAp9Wvg@mail.gmail.com>
 <2024032606-dutiful-tusk-5da3@gregkh>
 <CAMwc25ozHGVS5jE3QnDx7EgryL+=dCdUbm6PNBcsy5P8CtX8Lg@mail.gmail.com>
 <CAPFo5VLoYGq_OgC5dqcueTyymuSCsLpjasLZnKO1jpY6gV7s2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAPFo5VLoYGq_OgC5dqcueTyymuSCsLpjasLZnKO1jpY6gV7s2g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Fabien,

On Sun, Mar 31, 2024 at 12:17:15PM -0700, Fabien Parent wrote:
> [re-sending as plain text instead of HTML]
> 
> On Mon, Mar 25, 2024 at 11:35 PM David Airlie <airlied@redhat.com> wrote:
> > > I don't mind 50 patch long series, those are fine as we can see how
> > > things are actually used.
> > >
> > > But for complex beasts like DRM drivers, perhaps people should stop and
> > > implement the tiny "easy" things first, with working users, to verify
> > > that it is all ok first before biting off the big ones.
> > >
> > > Like implement a "simple" bus, which means that you have to have the
> > > driver core bindings all working properly and correctly.  Once that is
> > > done and merged then move to the next thing (i.e. a more complex bus
> > > like PCI or USB or platform).
> >
> > This is just reintroducing the chicken/egg problem. Implementing a
> > "simple" bus usually means implementing a "simple" driver for that
> > bus. Implementing a simple driver for that bus often means
> > reimplementing an existing driver that is already in the tree. The
> > "simple" bus driver gets pushed back on because it's duplicating
> > functionality that is already in the tree and nobody reviews anything
> > and we re-enter the deadlock cycle. We are actively trying to break
> > the cycle and get stuff upstream so this can be properly explored
> > rather than 20 independent trees carrying out of date patchsets to get
> > anywhere.
> 
>  I've been working on a new driver [0] (not a reimplementation of an
> existing one) that uses I2C. I2C is a "simple bus" and the amount of
> commits is quite reasonable, maybe this would fit better as a consumer
> of the device driver abstractions for upstreaming purposes?

I don't know if it fits better, but I think it works just as well.

The whole reason Dave agreed to take a stub Nova driver [1] is to keep things
simple enough to get the corresponding *basic* device / driver, PCI and DRM
bindings upstream. I don't think the initial PCI device bindings turn out to be
more complex than any other subsystem device bindings in terms of delivering the
required context to review things.

Nevertheless, the I2C driver might indeed have even less dependencies overall.

Besides that, any additional initial user is desirable to get more evidence of
correctness.

So, maybe we just want to go with both as context for the review process?

> The work is happening here [1] and is fully functional. Right now the
> branch is not based on this series but based on the device
> abstractions from the old `rust` branch + a few others picked-up from
> the `asahi` tree and the mailing list.

That's what staging/rust-device [2] is basically based on as well.

The idea was to come up with topic branches for infrastructure that is in the
process of going upstream or in preparation for entering this process (hence the
"staging" prefix), such that we have a common baseline for drivers that are in
development. Instead of having every driver tree carrying those things in
several different versions missing out on potential improvements a driver tree
adds to them.

You are very welcome to base your project on this branch as well and provide
feedback and / or improvements, if you like to.

- Danilo

[1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
[2] https://github.com/Rust-for-Linux/linux/tree/staging/rust-device

> 
> [0] https://github.com/Fabo/linux/commit/64a35401316aa9d77490eadb7c4bb731c7901f69
> [1] https://github.com/Fabo/linux/commits/fparent/rust-ncv6336/
> 
> Fabien
> 

