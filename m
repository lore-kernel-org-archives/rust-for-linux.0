Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F741802DA
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Jun 2024 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718206530; cv=none; b=jG8KmtwMolM7Oej4Aqs7d3LCrIy+O+Mw7fxrt8/SUycz14AGsk8458CtRPqsHZ2pl6PFsKl2ueWZrqceYwNGenm0Bj1kF0I8hjkplS7R271U2HAG6XVptTalHT4fa7YoVxS2280hyParkEUPf/JPC3K3/rw/r0Gb/HL63CcOAvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718206530; c=relaxed/simple;
	bh=/eth/rLHQaVXa5Gg6iEJQONz1lIgOpwaz6EWrI3kLxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Ix+/xTYNknTZ9Bl/uHyBhljn26KsPAUwTKgc16cHHu6IlMdNRvcaDaT59BuVaD1RElovrjO5aqTkw2V1aO+DJv47GIe/dRJQoHfDHlXaljT+oW6MrbNRKiq8efRPH3SeN5mIlkAlE/60xi1Q5wBLKjVvRLaJp/5eAR0OZIr4gPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WcyyfbsE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WcyyfbsE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718206527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TLPk25s5a0RpSrB3M9CtlVSrmFBRqAPSDQu7Lqf2nKs=;
	b=WcyyfbsEOsHqLNHuw0uE055N33e/2lgq0Jx5HfUNlSdJD75RZosrohiIfgnDEJP7zMI3R4
	pwIHrT5eBbZMY9epXxn7Xpm/8TBpofDdd4o6pnUKX2M/MJKNYjpwUrF85TNC2EeXug6/6j
	iIL14r9pgaKcgkYooiUpVM5z54WTufQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-JQoNHuUFPtCHqmbRYWYJvw-1; Wed, 12 Jun 2024 11:35:26 -0400
X-MC-Unique: JQoNHuUFPtCHqmbRYWYJvw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3605cad23e0so410839f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Jun 2024 08:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718206525; x=1718811325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLPk25s5a0RpSrB3M9CtlVSrmFBRqAPSDQu7Lqf2nKs=;
        b=UI0ZpPaOAB3r168cHJ2u7wA/iOen0kw10y9dAbGjiwhU86reuu+PH4XsBqUSSoGe/m
         FQQj5mpRvXdcGxpJP3DjqDP9lPCY/c+58GNu6I4ixCvUW679kFrKGIepRAN4DkfBz6CJ
         72ARrQw9z+YgwHrzNAY64BNdroOZTOLqa3X2L9dSWKrM4Ugp0e2kAoKkuR30pZKe4qsP
         e/j+PmZRYce45AHGhK2l0a70279feZiOVUkkHWqBZFsywPpLa4fEPiL0mase3bvJLcys
         iDPMvB4dVLj6EJVkfOcHCdWWLmiaOL5PpFB7zSLpv6AsE2SIgXqsY/QAzCMdyi8zUwt0
         bThQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHIn1g7GvOYQDLRdsuSWkdFfhvZZ03BudcBUtBBL9Zl8yIHiDhNoxB9pov8V7EvQOHwTs9AT1hTfN3e937YW382NfRdmLRyzO9W09h7R0=
X-Gm-Message-State: AOJu0YzfWfvmqAdWUuM6JuFMhqjtoivOq6XQ3xucabUdTsr/gEkglEyf
	kYz29VVxBG2aaao32zg06fCKez4nOgHPgXAInJ8lKUIEorE8mJZCsx6/j3ASwm/xX3q9U3jxBjs
	BrT4omG6S808gKR8FXo1ieMTbBcb0A9nZFOlGvqH7InKj4vESS16cwvOnO4+D7fiW
X-Received: by 2002:a5d:69c2:0:b0:35f:1c95:4042 with SMTP id ffacd0b85a97d-360718c9d97mr28096f8f.4.1718206525131;
        Wed, 12 Jun 2024 08:35:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtDkYfyxEJvsVijeUZeP0vECL4S57V/yigRw4w79fBzt8VAsMr+xkBwdMj5gMa5WMGHSk9JQ==
X-Received: by 2002:a5d:69c2:0:b0:35f:1c95:4042 with SMTP id ffacd0b85a97d-360718c9d97mr28048f8f.4.1718206524664;
        Wed, 12 Jun 2024 08:35:24 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef70csm31041305e9.3.2024.06.12.08.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 08:35:23 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:35:21 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, rafael@kernel.org, mcgrof@kernel.org,
	russell.h.weight@intel.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, airlied@gmail.com, fujita.tomonori@gmail.com,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: add abstraction for struct device
Message-ID: <ZmnAOfCUFkZqhDji@pollux>
References: <20240610180318.72152-1-dakr@redhat.com>
 <20240610180318.72152-2-dakr@redhat.com>
 <ZmdID8AlXtoxUfC1@boqun-archlinux>
 <ZmhPW9yq7y6jbmIg@pollux>
 <2024061136-unbridle-confirm-c653@gregkh>
 <Zmh3oN9sWamaYHOD@Boquns-Mac-mini.home>
 <d74edb73-1dba-43f4-a50c-36354c39d758@redhat.com>
 <2024061245-kangaroo-clothes-76e1@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024061245-kangaroo-clothes-76e1@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2024 at 05:02:52PM +0200, Greg KH wrote:
> On Wed, Jun 12, 2024 at 04:51:42PM +0200, Danilo Krummrich wrote:
> > On 6/11/24 18:13, Boqun Feng wrote:
> > > On Tue, Jun 11, 2024 at 03:29:22PM +0200, Greg KH wrote:
> > > > On Tue, Jun 11, 2024 at 03:21:31PM +0200, Danilo Krummrich wrote:
> > > > > ...hence, I agree we should indeed add to the #Invariants and #Safety section
> > > > > that `->release` must be callable  from any thread.
> > > > > 
> > > > > However, this is just theory, do we actually have cases where `device::release`
> > > 
> > > @Danilo, right, it's only theorical, but it's good to call it out since
> > > it's the requirement for a safe Rust abstraction.
> > 
> > Similar to my previous reply, if we want to call this out as safety requirement
> > in `Device::from_raw`, we probably want to add it to the documentation of the C
> > `struct device`, such that we can argue that this is an invariant of C's
> > `struct device`.
> > 
> > Otherwise we'd have to write something like:
> > 
> > "It must also be ensured that the `->release` function of a `struct device` can
> > be called from any non-atomic context. While not being officially documented this
> > is guaranteed by the invariant of `struct device`."
> 
> In the 20+ years of the driver model being part of the kernel, I don't
> think this has come up yet, so maybe you can call the release function
> in irq context.  I don't know, I was just guessing :)

Ah, I see. I thought you know and it's defined, but just not documented.

This means it's simply undefined what we expect to happen when the last
reference of a device is dropped from atomic context.

Now, I understand (and would even expect) that practically this has never been
an issue. You'd need two circumstances, release() actually does something that
is not allowed in atomic context plus the last device reference is dropped from
atomic context - rather unlikely.

> 
> So let's not go adding constraints that we just do not have please.
> Same goes for the C code, so the rust code is no different here.

I agree we shouldn't add random constraints, but for writing safe code we also
have to rely on defined behavior.

I see two options:

(1) We globally (for struct device) define from which context release() is
    allowed to be called.

(2) We define it for the Rust abstraction only and just constrain it to
    non-atomic context to be able to give a safety guarantee. We can't say
    "might be safe from any context, but we don't know".

But again, this is really just a formality, the C code does it all the way and
practically there never was an issue, which means we actually do follow some
rules, it's just about writing them down. :)

- Danilo

> 
> thanks,
> 
> greg k-h
> 

