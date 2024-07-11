Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B0747F7F
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jul 2024 17:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720719753; cv=none; b=krng+pkVf/WvkNa6gU7NG5zq+t8wdE89b2awMeyerKq6quLJxVoi3jET5vNOJC3iOmoAKrajPDO1ZNS0JTUp6hR1ytH5ed4OYPAUiTYpVSgIBovDCbqPiwhw40nQE13WS6XYoRFTf1JR8d03aSnorhL2J8s7lZwJ/Kdk/9fvbZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720719753; c=relaxed/simple;
	bh=AgLVqDHEn0/CnUyJN5XMWMJbr8yXezc7m1phC/lLtxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CGiGQXy766qMd0/oSATvCl3u5PiCtYuP7SMyGBIgFiA6O/XTcpxKDR5lky0bSyaCsDqcpblI2NsqfcbnJfTMpKYajR7cTR6o/9LsFjDz28akId9AxX2jxEZORBWlvjRrWhI6us/Pu5LYOtL6zWZk7yHNnBx0UjLt/T5E7Cm4XBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dtDhUili; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dtDhUili"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720719751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t8TsYVq9c5ngy71SlSWTBr6NT61WSPVDabfg4WDFbaU=;
	b=dtDhUilipohRbvOGYnmv7oweC/54hmGEvFArORCUiOzCutJ1rTpBdB7b9P9LS6d9rkWzhR
	8E15FL3Nwalftnwe4Cb9AE+or15iktpPCjW1TiXX+ngTvexRydETaJx12o5Xm2bYvFv3ht
	fbNZZOlWge5A8s+A1HAVAool6Ad3+Qk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-hxc9Mk8fPeu3iJbLD68gaw-1; Thu, 11 Jul 2024 13:42:29 -0400
X-MC-Unique: hxc9Mk8fPeu3iJbLD68gaw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4266d0183feso6699255e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jul 2024 10:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720719748; x=1721324548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8TsYVq9c5ngy71SlSWTBr6NT61WSPVDabfg4WDFbaU=;
        b=sa2E74nEZFJbwC6RgP8qmj9IwDeWfxosiJndcQA6Ic1QJ9lYYOl4ZJjjAY773reC7f
         X+dQUPkw+LduiQnA552oFCdi4PYwi8pwErvZPdLjhcIJmsWhy4XQuyiYIYf/ho9uIDvr
         EnWvZLZUFJROXzOOWp6ZIpSkGY1BK5+77Y0tjc/d3kLv+UCjIQzqC1yZzRZgkYGG1MYu
         QQz+kN2US6dC2YUT5ywvz9+v0RE7y5HWHDvZl4GQeLLtpOFBd/9tOmO9No70h0p2QLGF
         Vzj0naTFRvW85YRCds+OC2gJIeYvTWKoBfMatp6ZUifoppjccCmJ7BgQ2X3/E0I6wBZU
         5edg==
X-Forwarded-Encrypted: i=1; AJvYcCU6UVSy1ByngX3UeJXMTmTL0mPTYSCo/9GGd12+ZSdQHh404lKncwTrFN0hu/GWUFlSQX1jNQI964EtEfRzALXwvw84oAaoBW4CxCd1+Ks=
X-Gm-Message-State: AOJu0YyhoceHPuvWx0LfVxyxWvoawtKfj+mf0S6D3A6dTlCL/TJykZ47
	MiOyWbp9eKrvu1Ko/+uRhX+EouRmqKfDkHrennzqmmu3WAauC3rRV4Tl0RxKEkYjwV/Tml0boTt
	GHSGGN6++p4bw0e2Nwgc5wJhWS3+B+m6mkB6Tnak28CTqe/KYiuyOaGLZv9JnhMyI
X-Received: by 2002:a05:600c:4a98:b0:426:6ea0:d5b8 with SMTP id 5b1f17b1804b1-426708f2012mr61042955e9.29.1720719748641;
        Thu, 11 Jul 2024 10:42:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKwn2C6s42uOUj9q2Pg0MUFJ2DDsOSx1NRMtE3FwuTWPB3a6WMkyF+42TClnNhYZIlQC+U8A==
X-Received: by 2002:a05:600c:4a98:b0:426:6ea0:d5b8 with SMTP id 5b1f17b1804b1-426708f2012mr61042725e9.29.1720719748237;
        Thu, 11 Jul 2024 10:42:28 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e07e1sm127086985e9.7.2024.07.11.10.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 10:42:27 -0700 (PDT)
Date: Thu, 11 Jul 2024 19:42:25 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <greg@kroah.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 8/8] cpufreq: Add Rust based cpufreq-dt driver
Message-ID: <ZpAZgaY4VlqqdXwq@pollux>
References: <cover.1720680252.git.viresh.kumar@linaro.org>
 <b1601c1dbdf68a4b812fcfaf73f3b5dea67f2025.1720680252.git.viresh.kumar@linaro.org>
 <Zo-3QIPbhBsv8EjB@pollux>
 <20240711130802.vk7af6zd4um3b2cm@vireshk-i7>
 <Zo_cW57i_GMlmYV-@pollux>
 <2024071122-escargot-treadmill-6e9a@gregkh>
 <ZpAEWAzETnrVI-cs@pollux>
 <2024071111-negotiate-spoof-da94@gregkh>
 <2024071149-pork-vacancy-14b8@gregkh>
 <2024071106-handed-oversleep-2377@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024071106-handed-oversleep-2377@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 11, 2024 at 07:21:59PM +0200, Greg KH wrote:
> On Thu, Jul 11, 2024 at 06:41:29PM +0200, Greg KH wrote:
> > On Thu, Jul 11, 2024 at 06:34:22PM +0200, Greg KH wrote:
> > > On Thu, Jul 11, 2024 at 06:12:08PM +0200, Danilo Krummrich wrote:
> > > > On Thu, Jul 11, 2024 at 04:37:50PM +0200, Greg KH wrote:
> > > > > On Thu, Jul 11, 2024 at 03:21:31PM +0200, Danilo Krummrich wrote:
> > > > > > (2) You require drivers to always implement a "dummy" struct platform_device,
> > > > > > there is platform_device_register_simple() for that purpose.
> > > > > 
> > > > > No, NEVER do that.  platform devices are only for real platform devices,
> > > > > do not abuse that interface any more than it already is.
> > > > 
> > > > I thought we're talking about cases like [1] or [2], but please correct me if
> > > > those are considered abusing the platform bus as well.
> > > > 
> > > > (Those drivers read the CPU OF nodes, instead of OF nodes that represent a
> > > > separate device.)
> > > > 
> > > > [1] https://elixir.bootlin.com/linux/latest/source/drivers/cpuidle/cpuidle-riscv-sbi.c#L586
> > > > [2] https://elixir.bootlin.com/linux/latest/source/drivers/cpuidle/cpuidle-psci.c#L441
> > > 
> > > Yes, these are abuses of that and should be virtual devices as they have
> > > nothing to do with the platform bus.
> > > 
> > > > > > I think (2) is the preferred option.
> > > > > 
> > > > > No, not at all, sorry.
> > > > > 
> > > > > Use a real device, you have one somewhere that relates to this hardware,
> > > > > otherwise you aren't controlling anything and then you can use a virtual
> > > > > device.
> > > > 
> > > > Of course we should stick to a real device if there is one, I didn't meant to
> > > > say anything else.
> > > > 
> > > > But since it came up now, some virtual drivers still require a parent device.
> > > 
> > > Great, use the default one that the kernel gives you :)
> > > 
> > > > For instance, in DRM we have vGEM [3] and vKMS [4], that use
> > > > platform_device_register_simple() for this purpose.
> > > 
> > > Again, abuse, please do not do so.
> > > 
> > > > What should they use instead? I'm happy to fix things up if required.
> > > > 
> > > > [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/vgem/vgem_drv.c
> > > > [4] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/vkms/vkms_drv.c
> > > 
> > > Use the virtual device interface please, that's what it is there for.
> > 
> > To be specific, look at the devices in /sys/devices/virtual/ that's
> > where yours should be showing up in, not in the root of /sys/devices/
> > like they are by creating a "fake" platform device at the root of the
> > device tree.
> 
> Ok, at first glance this seems a little bit more complex than what the
> platform api gives you, let me knock something up next week during the
> merge window to make this more simple and then let some interns at it to
> sweep the kernel tree and fix up this proliferation of platform device
> abuse.

Yeah, I stared at this for the last 30 minutes and was just about to reply.

I think that we probably want to get rid of this abuse, as there are quite a lot
of examples for this.

And considering that I wasn't able to find a rather straight forward replacement
that makes it go into /sys/devices/virtual/ I think it's not super unexpected
that this spreads.

It looks like we probably want some kind virtual device API for that purpose?

> 
> thanks,
> 
> greg k-h
> 

