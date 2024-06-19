Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE99982D9F
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718800589; cv=none; b=BIt04BAOwLCL9PCvFRXQJgRqkYqXCyfqtKOtIrvP60mqCM0jIfL/zx20sj9Bqxd2xTM8sZfFleAOe/049JGNDDVE5GoTBUL+R4kjNdC1E07Ihl/0GZREYZ6FVtVIA0rK3qvrPSp5kLzlbtmYHQthDBPEezYm9SBo065APqCYm2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718800589; c=relaxed/simple;
	bh=/FVy10aFr7x51brEPgDPEOqk4u4JyYISn2GEH/QstT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iWlc+/r1v3hvPGrrEvIQyET7jKkEYZ4YihSowoZX1jGsSb+YyPMiEoFkOnkXwDIREN+q26Ye39fl5sz/KJQDLPR3lnJyf32ENJIXMF7QdILgcxy+EllA5aDZjmXNFqFnWPkxlB5lrINMnqAYak+ZzXFb9xTACEKi3UJFtSldcSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VNOkxuOS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VNOkxuOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718800587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dd/aicNb70QNh/1zDfB5K+VP/fQZJBOti9XVpxOWFmg=;
	b=VNOkxuOS6JrB7tAkuQlwV+ePyqfqzs1fVJI7x02JA0hs4fLnDdTskZZq9sF4PfTdS9qO9V
	0m/h1TLj2WylKqxLIMT6bFW63H0h6+2AurUxpCjCHB5fcgmhhiRzQccSBIUu4ayudI0UxJ
	UIF75/WqFsFGPebKeiotOnfns9WbeLc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-jlPVEOAmPQ68l2tKWsz3FQ-1; Wed, 19 Jun 2024 08:36:25 -0400
X-MC-Unique: jlPVEOAmPQ68l2tKWsz3FQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4229a964745so39088635e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 05:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718800584; x=1719405384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd/aicNb70QNh/1zDfB5K+VP/fQZJBOti9XVpxOWFmg=;
        b=f4a7frWEDeD/D/LJg6yZWdrJDyTZWyZE2ApQKodEfkZx9tLDjbb4e+e/5TjBPftPfY
         yDKygJx6DpBn09WTcDX3N6wbul18owxa8Q0jW9QozROlHFgZjZRREHtLIGTIte0LVnvA
         ps/zaY6Eqaejbk6de41z8mezpT2aS6QwqAwWuw5Cm7lWuCQ+QawBYWGyeAIAv2d8rCIP
         79GEuZYEaxbnLgbLD/Ap+lnVlM8+pS/wzmes9rKFxN/6SMkgKSEp/Y7U44ycZKcw1/aC
         lYJVAWasLa8KlGMb5iq1SM/4GCTMgvSBR0MHEXGeVrejdQpAFl4nD5QRuCQxCR1kq211
         S0hA==
X-Forwarded-Encrypted: i=1; AJvYcCVt7a2yQU4/CpjumO+2kB8pVNQcY01e5QARp5hJQEBSJHbkMz3W42ZouuJhnM1MUg2uwgwCOKd954zxYgQ2r5IheTSG9kTb7IwFOO8f5i4=
X-Gm-Message-State: AOJu0YywNjJTaSTWE6sasku/X+qzkeKdU2mOksLbkqWtPocyGTaeyDI+
	vDnik6oiaLUmEWtnzhb1653D1xgkub/a/hy8kbTqXdMc827zgAuHJsoNlYXMp/N8BcGBck0Jbzw
	DoHyAnA1zZ7q1CzkjbNf5Z2IVJfsc6zg7/Gk/XyVn3vfm2ritaQZlLMlY6bslpRUY
X-Received: by 2002:adf:ef91:0:b0:361:a8fb:6fb7 with SMTP id ffacd0b85a97d-3631998f659mr1543800f8f.57.1718800584626;
        Wed, 19 Jun 2024 05:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAiW64q2l48NwaPPFk1R4aXPb0dO4uvIu/0xZJdLCWddq9CQWGfE3dTeBvBqQlY0UcEAOZHQ==
X-Received: by 2002:adf:ef91:0:b0:361:a8fb:6fb7 with SMTP id ffacd0b85a97d-3631998f659mr1543785f8f.57.1718800584186;
        Wed, 19 Jun 2024 05:36:24 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36262f77ad9sm3874899f8f.109.2024.06.19.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:36:23 -0700 (PDT)
Date: Wed, 19 Jun 2024 14:36:21 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, airlied@gmail.com, fujita.tomonori@gmail.com,
	lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
	lyude@redhat.com, robh@kernel.org, daniel.almeida@collabora.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v2 00/10] Device / Driver and PCI Rust abstractions
Message-ID: <ZnLQxZjtsmDJb4I1@pollux>
References: <20240618234025.15036-1-dakr@redhat.com>
 <20240619120407.o7qh6jlld76j5luu@vireshk-i7>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240619120407.o7qh6jlld76j5luu@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 05:34:07PM +0530, Viresh Kumar wrote:
> On 19-06-24, 01:39, Danilo Krummrich wrote:
> > - move base device ID abstractions to a separate source file (Greg)
> > - remove `DeviceRemoval` trait in favor of using a `Devres` callback to
> >   unregister drivers
> > - remove `device::Data`, we don't need this abstraction anymore now that we
> >   `Devres` to revoke resources and registrations
> 
> Hi Danilo,
> 
> I am working on writing bindings for CPUFreq drivers [1] and was
> looking to rebase over staging/rust-device, and I am not sure how to
> proceed after device::Data is dropped now.
> 
> What I was doing at probe() was something like this:
> 
>     fn probe(dev: &mut platform::Device, id_info: Option<&Self::IdInfo>) -> Result<Self::Data> {
>         let data = Arc::<DeviceData>::from(kernel::new_device_data!(
>             cpufreq::Registration::new(),
>             (),
>             "CPUFreqDT::Registration"
>         )?);
> 
>         ...
> 
>         // Need a mutable object to be passed to register() here.
>         data.registrations()
>             .ok_or(ENXIO)?
>             .as_pinned_mut()
>             .register(c_str!("cpufreq-dt"), ...)?;
> 
>         Ok(data)
>     }
> 
> The register() function of cpufreq core needs a mutable pointer to
> `self` and it worked earlier as Data used a RevocableMutex. But with
> Devres, we don't have a Mutex anymore and devres.try_access() doesn't
> give a mutable object.

If you want to split `cpufreq::Registration` in `new()` and `register()`, you
probably want to pass the registration object to `Devres` in `register()`
instead.

However, I wouldn't recommend splitting it up (unless you absolutely have to),
it's way cleaner (and probably less racy) if things are registered once the
registration is created.

> 
> I am a bit confused on how to get this going. I looked at how PCI bus
> is implemented in the staging/dev but I couldn't find an end driver
> using this work.

The PCI abstraction did not need to change for that, since it uses the
generalized `driver::Registration`, which is handled by the `Module` structure
instead.

However, staging/dev also contains the `drm::drv::Registration` type [1], which
in principle does the same thing as `cpufreq::Registration` just for a DRM
device.

If you're looking for an example driver making use of this, please have a look
at Nova [1].

[1] https://github.com/Rust-for-Linux/linux/blob/staging/dev/rust/kernel/drm/drv.rs
[2] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/drivers/gpu/drm/nova/driver.rs

> 
> Maybe I am making an mistake and missing the obvious.
> 
> Thanks.
> 
> -- 
> viresh
> 
> [1] https://lore.kernel.org/all/cover.1717750631.git.viresh.kumar@linaro.org/
> 

