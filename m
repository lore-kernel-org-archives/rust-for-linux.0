Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B57113D63A
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 21:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711488767; cv=none; b=ri2CyIIvXVkcFaSL3bsUGuPWTlNxkD8I8mCxinhp22FE9/rRrGox5NMQKYCBHJRv41cPG38f3qjP7fV6ABqO58Ipr8fHje/eIS10xt8IpZBv1S08jKHWgHNxoRn4Qasvgbtt5tf8iZyTS7rncmzVT8WoAXpwsZbh8tZMam/xDI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711488767; c=relaxed/simple;
	bh=P2Shod2467jzti8F8/SaTyQ/NQ0JW147zP9/GWjs/YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kxoNJDlfzUZ5CRlE7zIw5Jqb7nMbIRxm6YfijxyhC/Uvj+nkJf/hs3S/N7i0iknOx7/MnzVEDgKbHxXIXcC0ePagPSU+jXTb99mbMutbtJHL7j3DUnsyECsK7fkHs/iN1ZiTSYAieYyOykdWb74jqbYAnZoay2/WEi5pYdHRDmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bJB6xUEN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJB6xUEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711488764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/UV3KeRtcIN6eV78JTIZHqCJWjHSdTSXMrPYRqG2m8=;
	b=bJB6xUENWU4+lchD2czHqNkKMbBCpBIvHyHwRAW68Ctfuu2++fjOTsOm23BhyESuEMoQ/a
	61sLvSvWkIOF0GkqaAQvg7MU1maXPejFB7fop2j7iatxfUUoo3cGc+6M+aZtQZwANFmLOG
	689rSybbCYZafmC02wRY6VtBA2fJuDY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-Z2PCUpCrNFOO5i96sPuZSQ-1; Tue, 26 Mar 2024 17:32:42 -0400
X-MC-Unique: Z2PCUpCrNFOO5i96sPuZSQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a46ba1a19fdso429010066b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 14:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711488761; x=1712093561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/UV3KeRtcIN6eV78JTIZHqCJWjHSdTSXMrPYRqG2m8=;
        b=YjLvx8NxhcaINnIlcNfJLDLp9x+TD6wbSterYWf2YIYxcQ3ybd//0pBdSXVIrsr/Bc
         vHJxf1D3Pi+Dm07NAsktvgtIh3OvZkM5SdrY+tZns6nOJEPpuQo0vSOeoJQLw1cbIC7M
         nSzEvmpa/q4lmJL7Pp+7Tj1CV6xbUUVpEqo8lClYnBuXjSepBI+/1WzDndUcQRGw2oOy
         zghCHrzlsXTiJWemZZ0hQOtitH6j9UPfcFqz9qfsRVCWEy5JXaEGmqWB+NfmByg/B0yE
         k7lbnR2UXdnBCBn31ctxHlydYsELosaZCaxn5vSV69qruXQdWx09aDDTvRg5LuaPO6z8
         q2JA==
X-Forwarded-Encrypted: i=1; AJvYcCVkhKktdKRx2thLn5ooljeQ3pVYTMwb+cTAf1R+41JWiP8UuQEj9zVE1dBYOtaCAVhwMwgJSiywOPsD42RF4Q2Phxhi4Q+vymDeB1eH08c=
X-Gm-Message-State: AOJu0Yz3Aqi0rnOpLoqrJ58agtkRNJWnpsoAM2cHQdliiLSrJ5e4g2cc
	fiVE1UtjXgvOTG84NcX3ZkMgl2jf7DHXFOfLb4KLUTS52Zk7aq7lfFcPLRpHkZkNx3+hLy6mlmZ
	iaSVJC0M1sXgBlNQvYvySYbs/QoLzdmUpfateCIij7K2Y2PEjAxyYy7S7N/zZjGMv
X-Received: by 2002:a17:906:1788:b0:a46:4e73:9c67 with SMTP id t8-20020a170906178800b00a464e739c67mr6058946eje.68.1711488761623;
        Tue, 26 Mar 2024 14:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6wkgnc4HrsTU12Doj30MGJ14ySqf4cyR68TZ1b+PReTniy8YBLlrmEKQ0ETDwXbnyMiGdAA==
X-Received: by 2002:a17:906:1788:b0:a46:4e73:9c67 with SMTP id t8-20020a170906178800b00a464e739c67mr6058920eje.68.1711488761270;
        Tue, 26 Mar 2024 14:32:41 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ef7-20020a17090697c700b00a474df4cda5sm3626540ejb.167.2024.03.26.14.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 14:32:40 -0700 (PDT)
Date: Tue, 26 Mar 2024 22:32:38 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 6/8] rust: add revocable mutex
Message-ID: <ZgM-9kzS7CFvAEqV@pollux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-7-dakr@redhat.com>
 <2024032553-facing-thaw-7048@gregkh>
 <ZgMQOS01jMa651QO@pollux>
 <2024032621-enlisted-humbly-7bb4@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024032621-enlisted-humbly-7bb4@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 26, 2024 at 07:17:59PM +0100, Greg KH wrote:
> On Tue, Mar 26, 2024 at 07:13:13PM +0100, Danilo Krummrich wrote:
> > On Mon, Mar 25, 2024 at 07:22:15PM +0100, Greg KH wrote:
> > > On Mon, Mar 25, 2024 at 06:49:10PM +0100, Danilo Krummrich wrote:
> > > > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > > 
> > > > This is a mutex where access to its contents can be revoked at runtime.
> > > > 
> > > > This is different from `Revocable` in a few ways:
> > > >   1. The caller may sleep while holding a guard.
> > > >   2. Accessors are all serialised.
> > > >   3. Accessing is not as cheap (because it involves acquiring the mutex).
> > > >   4. The size of the object is larger (because it involves a mutex +
> > > >      flag).
> > > > 
> > > > An example of where this a good fit to be used in device state that
> > > > holds registrations to other subsystems.
> > > 
> > > Why don't we need this in .c files if it is so needed in drivers today?
> > 
> > You mean revoking access to a resource in general? 
> 
> I mean "having a mutex that can be revokable" as you describe here.  Why
> is a driver written in rust unique in needing this?

Let's go back to the idea of a Revocable<>. As already mentioned the idea is to
make sure a driver can not access a ressource after it has been gone, e.g. a
pointer to an MMIO mapping after it has been unmapped (e.g. by devres). To
synchronize access, Revocable<> uses RCU; we need to wait to revoke the resource
until a potential access by the driver has been finished.

RevocableMutex does the same thing, but uses a Mutex instead of RCU, which leads
to the differences listed above.

As for "why does only Rust need this", I don't think it does. Conceptually,
there are quite similar approaches on the C side. As already mentioned DRM uses
drm_dev_unplug() and drm_dev_{enter,exit}(). There may be other subsystem
specific C implementations that do something similar I don't know about.

I think one difference might be that in C we can sometimes get away with just
knowing that something can't happen and hence isn't protected, whereas in Rust
we want / have to give the safety guarantee no matter what.

> 
> thanks,
> 
> greg k-h
> 

