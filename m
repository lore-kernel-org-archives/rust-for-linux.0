Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A549D1482EE
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718800964; cv=none; b=nMjE7MKAagUde+5kBLq0DNzcCjJoMq8c2L8zKClV2FtCvkFqD8gKE00D+Wfo9BK/bgGwrRDt8zmmD9FLynkVy3Q9mfUechVfDjaaN8KWhP6kIi1IYrrVNoHWdoqDlbBQ6rPw8XVEjlNgzkziTRle+Bwmmn+sYpPirADJZD8IWO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718800964; c=relaxed/simple;
	bh=VIG0BR/NDPmGtg8voRIq3GjmFPyIl3KX6RyNLUEhLvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ETyIKE4eHXAghY8ceBp6u5SWOUrq1ELzS0791zVIxb5ouRddGzUEKqiX7uhBGPhH6fOM5aEaSTzMQ7d9w/c8J4xGF15+tFLhV3RmRY/KAQJjX9/7fQD2/Pqrt8l0qWTlvZlaV4mfnbgUEpglN6FrOkWKkOfpjrTjxkjJW+ZvFNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TVqMAs0Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TVqMAs0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718800961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zEIb/uS/KDuzfIvJsLzv4TZYlQ9RyQMIGFEXdxP6eh8=;
	b=TVqMAs0YEHGMB91gV/8tR1OMB59sVGEFLXiCXCHrvpsMVV0O+JgoE2O4UoRpK7z4fhILdU
	sdHtab5ssqWPAqxRMdf8MwcEsmrkbSow4mNcwVASoX685u4eHW+3LpBINOfAmCMb5gAkUA
	4D1a6DudZZSvlT5re8Chh8Wi6sK5gco=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-Uf6Zcl9EOHWyiMqCvOup2g-1; Wed, 19 Jun 2024 08:42:38 -0400
X-MC-Unique: Uf6Zcl9EOHWyiMqCvOup2g-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4246ed3f877so14609165e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 05:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718800957; x=1719405757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEIb/uS/KDuzfIvJsLzv4TZYlQ9RyQMIGFEXdxP6eh8=;
        b=hgw+xuf65oWVvEgRf2xr1k+xMHw50aP/+gOuTQ75VXiG5vSqOC4SWA34tsEvU8nm+b
         V4oD16cTE9z7VstDlkIuQHauAItSXxNM5S3UXTbPs3C4r0GI6hnWeLY0C3s82MSnz1dy
         o8fcYj0mjzWSGkOZw3ZuzmAD5SNhesX2w7f9W7F9WfxsQsqGMCHsTRYQqD3yfK59ZS3m
         aJBDMiKPdU5ydz6yTusAmASDUj3b/FS8gausnBkBPSAKBK8k/EowMzJVO1+CXiQGfuFI
         1G1t51ca7rTFDO9ljq3GZLouxtwkg6dvX6QlqCbUKLLP0F9FXxEbHA3nRqhvktdfvXae
         f/WA==
X-Forwarded-Encrypted: i=1; AJvYcCWi9+NM4V/EmKSLFgZiXoR3g9/9XokOZdlUsWA5ZLE4zS/K2mamvFBIkcgBokc6z4VgfZd5NWvP4jNcfXZYrGNmlOUNtWDT9CyAtmhX+bY=
X-Gm-Message-State: AOJu0YzecISlwOv4emlyT7k8dBrPU+BQVp+g5AlXOrR/seyXUWEZiz/I
	2lEoxo0X0RyUrZ0I/LipNgUmkhyAw7ziZNdXWazl+/odDBXZolt34vBMzKirX1e1Yk5k8quCWE9
	YehutI6bFSnEE9OdoduP+z3yRcLYO/LFNu9DIOKfxd5mgC2oLG33oNB7RY0wwJZsH
X-Received: by 2002:a5d:698f:0:b0:35f:1d7a:c41c with SMTP id ffacd0b85a97d-36319a85dfemr1873767f8f.60.1718800957341;
        Wed, 19 Jun 2024 05:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT44IZwYnLeIXr1pEyTrxlYDiUj0k+ywN+trqFdH7nS5AjwVcwBiOiMlmVcMy2meveSTaW4Q==
X-Received: by 2002:a5d:698f:0:b0:35f:1d7a:c41c with SMTP id ffacd0b85a97d-36319a85dfemr1873734f8f.60.1718800956975;
        Wed, 19 Jun 2024 05:42:36 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3620c6c4a60sm4321665f8f.91.2024.06.19.05.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:42:36 -0700 (PDT)
Date: Wed, 19 Jun 2024 14:42:34 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, rafael@kernel.org,
	bhelgaas@google.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, airlied@gmail.com,
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org,
	daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v2 00/10] Device / Driver and PCI Rust abstractions
Message-ID: <ZnLSOlcQ6mI2hC4c@pollux>
References: <20240618234025.15036-1-dakr@redhat.com>
 <20240619120407.o7qh6jlld76j5luu@vireshk-i7>
 <2024061929-onstage-mongrel-0c92@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024061929-onstage-mongrel-0c92@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 02:17:58PM +0200, Greg KH wrote:
> On Wed, Jun 19, 2024 at 05:34:07PM +0530, Viresh Kumar wrote:
> > On 19-06-24, 01:39, Danilo Krummrich wrote:
> > > - move base device ID abstractions to a separate source file (Greg)
> > > - remove `DeviceRemoval` trait in favor of using a `Devres` callback to
> > >   unregister drivers
> > > - remove `device::Data`, we don't need this abstraction anymore now that we
> > >   `Devres` to revoke resources and registrations
> > 
> > Hi Danilo,
> > 
> > I am working on writing bindings for CPUFreq drivers [1] and was
> > looking to rebase over staging/rust-device, and I am not sure how to
> > proceed after device::Data is dropped now.
> 
> As it should be dropped :)
> 
> A struct device does not have a "data" pointer, it has specific other
> pointers to hold data in, but they better be accessed by their proper
> name if you want rust code to be reviewable by anyone.
> 
> Also, you shouldn't be accessing that field directly anyway, that's what
> the existing dev_set_drvdata/dev_get_drvdata() calls are for.  Just use
> them please.

Sorry that this was confusing. `device::Data` was a generic type for drivers to
store their private data in. It was meant to be handled by subsystems to store
it in their particular driver structure. Is most cases of course this eventually
ends up in a call to dev_set_drvdata() (e.g. through pci_set_drvdata()).

The reason we had this in the first place was that `device::Data` was also used
to store resources and registrations. With my rework to `Devres` this isn't the
case anymore, and hence `device::Data` does not add any value anymore and was
removed.

> 
> thanks,
> 
> greg k-h
> 

