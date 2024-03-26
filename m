Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281AC1272D1
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711479846; cv=none; b=mMu8ahv6PE5Jej9LZe6L6yGies4wl3XzhemTdVSM7vWth9V5sbjn1vZm2KIgyCc8okgt5CMELygvEdd68WSLr27hSPKZMw9PEKtS9p2MKyPIIWNd2lq3hJjIvHoajx4myUlwi9E6lgp+XnKVfHUgUC1uLNAAcNlvo4ODVYwcAiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711479846; c=relaxed/simple;
	bh=yHIkZQYISUmGdDoJyHTvWjdQwvmzFtHygVAy0qveAUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRy55IZ3O9NrFbWpGVNzqsx8SF81geQDXvo1BnTgZoOoY2LW0SS9y0W1ZSw0Gk1I4BIpqxqAnNmy0aDEAHNhVaGoikOymih6gWeItKA52zKqooGFG2SlxuxPRkYUReV6vvobtpY4pcR00UVaLte0xI+4Vha+E+0sLgiz+vM14iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MX6ktXbq; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MX6ktXbq"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-430c4e67d40so38442711cf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 12:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711479844; x=1712084644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0D1xSoH3FefaHF72YXCF2qYkKbdpZ9j1ybf3MjQfSo=;
        b=MX6ktXbqS9xX+vJWZhL1cCvjopMG3T4bDu55GB/nvlWuri2hYc27DpyUOhhG8UcTeR
         aWQBwu4te6ia95qL2f4VTFbkP0ZvkT2eG62FPKWyz8u75oJAEHLrGPdHdp2iYKszCrfn
         oc923nat9vO0WIQlezeXO8vrCBb63yvvhroJkbbcQP7Jq+d5j3Rp5LoM8uOuGAjDm0Sz
         48buyJDUDfJp8UUAhUnmF92s8TfTi0JIGC6IkN3G6Hx1pVFsOJVsXjQrnrOwCcUrbqmi
         91a8KLL+nMm8afbqnWJE7bIu9LMoQccF1PB57fMfCUjxzR6Yqsq8mLaS06SNovkNjHL/
         v/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711479844; x=1712084644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0D1xSoH3FefaHF72YXCF2qYkKbdpZ9j1ybf3MjQfSo=;
        b=ScP4f+CnMNjBlo9/81cvZAhTNlvGgmfX3vC6IT1g4sl+Xi7Z4gnuMx7e8GggiNu7HS
         52PqkHkJJ7P40sYz7MZ68pcZa4lTeM/SrF4saoZl1Pzs0uSBjcu8CACGHjhZmobtVSHE
         IIz6U7Apltfr2IFofE7aY1jkPBRBLwbbhN3RI/Q5XTr2mth+9wrZGfim93R95uULVib2
         K5vKPgCEG3K7E4OjWvtMtzJxAbMw+fVLNsXX474JmAXUlcFYySTxmWVLE9/wT7141Qi1
         SKHSokBytsG5Prse0vYp7gJJMP6LH4X49EIIYgw4hpzje3P9u3yiMjvT1UXdqtqexM+K
         ZPvw==
X-Forwarded-Encrypted: i=1; AJvYcCWktU3jeA8j7H1jkXCddCG3HALtK7d50B6NpHuEdzgI/+r/GeD/AI8EQq2uKrsI/VUu2XyDN+bD6sUileWERCQ7wjGIabyFluhEN7xJxHA=
X-Gm-Message-State: AOJu0YwZbmjVERp6PDe73ysn3JeHM8+vJUxVGczlpEefbNtmo9U6fSWg
	GyicWErtkyVs0pP6V3QWDTQhQK1GRsTz0Mm/Y7vPX8or2cSRhfmw
X-Google-Smtp-Source: AGHT+IFbB4rhL/4fu10c3OuZ54Gh5Yf0y+U5BWfb+FVMmmQj2v3Bdvx+kFCG8ZZE9Mp6CpS3K09N8w==
X-Received: by 2002:ac8:7e89:0:b0:431:62de:b278 with SMTP id w9-20020ac87e89000000b0043162deb278mr2098347qtj.45.1711479843808;
        Tue, 26 Mar 2024 12:04:03 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id ca9-20020a05622a1f0900b00430ea220b32sm3981082qtb.71.2024.03.26.12.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 12:04:03 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 908441200043;
	Tue, 26 Mar 2024 15:04:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 26 Mar 2024 15:04:02 -0400
X-ME-Sender: <xms:IRwDZml0wgMrcB4efQ7fCjr9t4ewG3MN4YzJXpb7A9L_PIDRzLLIGA>
    <xme:IRwDZt0CJPUFbIe3DP0_6KGJ-iBtnIPj2jjFZ0Qu3yLiXEub1220mTqLC3ga3xt4t
    SCavgishWosJSk1xA>
X-ME-Received: <xmr:IRwDZkoeBPzrgkDzPoDr9Iyge9qjjInoPk3W2evROE3w1R5UdeDDR_4Nk7uRcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddufedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeeg
    vddvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:IhwDZqnNEl7XRvOaiUk-Z6_JOen8Orhat1TD3Omhbp6wMuahp77k8w>
    <xmx:IhwDZk0r11QL44DqzkgacPynJ4BxamIpJ96GvTI20hm69--G4Ri_sg>
    <xmx:IhwDZhs6Z6L2QzmYv6AyaPzhAbnUjVZX_s70oObbV9RFQRhDfoKJCQ>
    <xmx:IhwDZgWRqVHcAg9OUfWN7mL0QygUUPGiv3t9NKsOkOrOnQ-hJ3gqDw>
    <xmx:IhwDZlWlvGTd_acVV1-f-MZdUFpjlVNVR0bpTdGkqaMhhTaeqri7Q4JTsxs>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 15:04:01 -0400 (EDT)
Date: Tue, 26 Mar 2024 12:03:27 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
Message-ID: <ZgMb_2AphYylBYpZ@boqun-archlinux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-4-dakr@redhat.com>
 <2024032518-swampland-chaperone-317b@gregkh>
 <ZgLxcXTw3awyW7cH@pollux>
 <2024032607-sheath-headlock-1fb2@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024032607-sheath-headlock-1fb2@gregkh>

On Tue, Mar 26, 2024 at 07:03:47PM +0100, Greg KH wrote:
[...]
> > > > +impl Clone for Device {
> > > > +    fn clone(&self) -> Self {
> > > > +        Self::from_dev(self)
> > > 
> > > Does this increment the reference count?
> > 
> > Yes, it does. from_dev() calls new() and new() calls get_device() again.
> 
> Ok, but why would you ever allow a device structure to be cloned?

This function actually doesn't clone the device structure, it rather
just clones the "smart pointer" to the device. But it's confusing since
it should use an extra layer of abstraction, as I mentioned:

	https://lore.kernel.org/rust-for-linux/ZgG7TlybSa00cuoy@boqun-archlinux/

Right now `Device` is mapped to `struct device *`, which mixes the
abstraction of a device struct and a pointer to a device struct. We
should do the abstraciton in a different way:

	// `Device` maps to `struct device`.
	#[repr(transparent)]
	struct Devcie(Opaque<bindings::device>);

and then having a `&Device` means you have a reference to the `Device`,
you can use it for any device related options except increase/descrease
the refcount of a device. For example:

	unsafe impl RawDevice for Device {
	    fn raw_device(&self) -> *mut bindings::device {
	        self.0.get()
	    }
	}

Driver code that only requires the existence of the device should only
use `&Device`.

And for the code that want to manage the lifetime of a device, since
`struct device` has a refcount in it, we can claim that `Device` is a
`AlwaysRefCounted` type:

	impl AlwaysRefCounted for Device {
	    fn inc_ref(&self) {
	        get_device(self.0.get());
	    }

	    unsafe fn dec_ref(obj: NonNull<Self>) {
	        put_device(obj.as_mut_ptr());
	    }
	}

with that, we have a type `ARef<Device>`, which is similar to `&Device`
in that it's a pointer type, but you can clone (inc refcount) and drop
(dec refcount) on it. We can still define a `Device::new` but the return
type is `ARef<Device>`, meaning we hold a reference to the device.

	impl Device {
	    pub unsafe fn new(ptr: NonNull<bindingds::device>) -> ARef<Device> {
	        unsafe { ARef::from_raw(ptr) }.clone()
	    }
	}

In this way, if Rust code is not the owner of the device (probably it's
the common case right now), Rust code can use a reference to make sure
it doesn't get freed by the owner. And of course, if it's a driver
callback where the driver guarantees the liveness of the device, the
Rust code should take a `&Device` and don't worry about the ownership
anymore.

Does this make sense?

Regards,
Boqun

> That's not something that should ever happen, once it is created, it is
> the ONLY instance of that structure around, and it can't be changed, as
> you passed it off to be handled by the driver core, and the driver core
> is the one that handles the lifetime of the object, NOT the bus or the
> driver that happens to bind to it.
> 
> I've been worried about how the interaction between the driver core and
> rust code is going to handle structure lifetime rules.  You need to be
> very careful here with what you do.  Rust code can create these
> structures, but once they are passed to the driver core, you lose the
> ability to control them and have to allow the driver core to manage
> them, as that's its job, not the rust code.
> 
> thanks,
> 
> greg k-h
