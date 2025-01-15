Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63351836D9
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736926520; cv=none; b=BR51rJAD5YwrWcHAtO2STvkVWftAk6ixXU0qO+We/XnMZFZmPUcJcTe80hBinP0hjFC2t8MW01CcHihbxN5B+7yK2+hDnKIPnIDOfCgI7jW8VTJ03ueJoW+00vMzp7LW3hRmSBemWI2mMTBl812y1oy0HZYOqqwd2L1zf5d064w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736926520; c=relaxed/simple;
	bh=11VPTxtyMOy0jH306RWVp5Ck+NURrIO68klNa+MgS3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWfdWzaaBAOawCHE576flb7pwwmzzJdyOgueQ9TmPG9mrxgJIXuXmVVSL0A/dEDaChrUVuHBY1uFiWMpR5PM3jddidvc+FosJEO6AONGcOColzuc0mHXps+d5IXwaVeqF2DdAsrYuPjX7Shcv5ADcS71PtmMUu7o0QbBBUsqLSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KLky8OvK; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KLky8OvK"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166651f752so143972175ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 23:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736926518; x=1737531318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0NWa5KL8s6p5qgSV+6qKBun9f0W5BFFiHnMnLZXhgfY=;
        b=KLky8OvK+cUUR/7ez8HsCDuLIwp0vXjifW5RukXnLuo1Z7+YThQ7fAeiy6WlZLNHH0
         CCC69KvjUGLHML+D2EopJZYZNOuEOqX6Aty1SnR0XzUTMjOFUG81gySP878fxyIqXElx
         11pz/or4dn6+ivaM6CAN4AD6muN0Kub3XCpbsY6HupfE3bvKhRjDHMvZr8LXB/HXPhXG
         VbDbGlKrZDDkPRUhGfbuDYDQYn+royJx4INcN2l7MafUy2Log7bmj7On8fWT+LpP76wP
         U7Z3P1NM7nHhSOGkpi0cZH7fZk9SGcW3jl9F9Iqg+EOJr4HwcMFCNRmYfkBkUJakgTSg
         MvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736926518; x=1737531318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NWa5KL8s6p5qgSV+6qKBun9f0W5BFFiHnMnLZXhgfY=;
        b=cvk/Ir1dvgoA2WKRgaHjtNWelNRMo4h2jk71JTdf94Pfdkl/qOc0MRvhEbLJJ2pm1k
         9PM+ksHEBKBV7NiODyiTE36H2uWNNThxZULOUATk/qSL5LpuFItz1YbWJ72Jo2WN+EUZ
         Bpscb/3RP2WIMtP8wKforMO8dqhBbx89IFNmEbMKPbznNhtWh1TU7bCbAMA7Hwr3Q0gI
         DNc4H+meQXOqJOia6cRtNDinqyahgtOmdH4JzjFhVifyQcnMwmgRhWRDQNrM8lfUGt59
         oIL//S2XUATx+0WdZBPEDfdHRgkF1gYqCjQqKGObh+TzhSlYNKhmx/aTpq1J9ciIk1qk
         TZyA==
X-Forwarded-Encrypted: i=1; AJvYcCVP1/96NAEQdLeZUtQERS0tX0d8XTDxDNfACw96nXZb5ekXoC5wU34z5cOIKUvQDE9ujNtLk1vXDiwcJLoRgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7sB8qKs+4xv6CYdITlvyEIWzJnn9IAzRGACSqG+qcpJg0Kigz
	G1Hp6qejaqP2J0WGrmtbGwOaR02h2cWCVak1+NAXRbL6tC1M7qeJSeV0WOiAWXU=
X-Gm-Gg: ASbGnctM8bVgVQtjOBPRp/sgggp4ZkjXLus8EIkxeX8sgE/PkY6Bq1FnIrI9SXtstPi
	N1EyiafyRbRbgZJOEGrMGAyIPWGiKVxT7TlarMgoczfiOqDApXXLPOHTv3uqz0ibA6B8zcdoeTV
	NGe+R3ah8/yEwuCK10Ue8H1fjeFKmrqHuFnw3EW54Ua89ZhETfg5OC4rLuIz46O8mgJx2VWDC2m
	QXH7ez0CfgU8J6ACx6dDaiiJxsp6HTIuZaNYatSCbcWysAKnD+lrvVDQyM=
X-Google-Smtp-Source: AGHT+IEiNT1nLuxePVTdth6rqbDxmOGcOGriyBY9EmzmsE1Wlxp4xb0gRZNnWQTE9E2aYe+GUmmfLg==
X-Received: by 2002:a05:6a00:2406:b0:72d:8fa2:9999 with SMTP id d2e1a72fcca58-72d8fa29fbdmr1297689b3a.11.1736926517847;
        Tue, 14 Jan 2025 23:35:17 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658a94sm8433203b3a.116.2025.01.14.23.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:35:17 -0800 (PST)
Date: Wed, 15 Jan 2025 13:05:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH V7 04/16] rust: device: Add property_present()
Message-ID: <20250115073515.hxoflf65mq3pyhpx@vireshk-i7>
References: <cover.1736766672.git.viresh.kumar@linaro.org>
 <f43fe3f7b3151a89c261ad728b0f3bb2fc24caef.1736766672.git.viresh.kumar@linaro.org>
 <2025011429-gossip-hash-12e3@gregkh>
 <20250115071538.efb2ipmbmynvwt3p@vireshk-i7>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115071538.efb2ipmbmynvwt3p@vireshk-i7>

+Rob/Dirk,

On 15-01-25, 12:45, Viresh Kumar wrote:
> On 14-01-25, 19:42, Greg Kroah-Hartman wrote:
> > On Mon, Jan 13, 2025 at 04:52:59PM +0530, Viresh Kumar wrote:
> > > This implements Device::property_present(), which calls C APIs
> > > device_property_present() helper.
> > > 
> > > The new helper will be used by Rust based cpufreq drivers.
> > > 
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > > ---
> > >  rust/bindings/bindings_helper.h | 1 +
> > >  rust/kernel/device.rs           | 7 +++++++
> > >  2 files changed, 8 insertions(+)
> > 
> > Want me to take this in my driver-core tree now for 6.14-rc1?
> 
> Sure, Thanks.

I now see that Rob/Dirk have sent [1] a bigger patch earlier which adds
this functionality along with other DT bindings. Though it isn't
merged yet.

-- 
viresh

[1] https://lore.kernel.org/all/20241122081257.1776925-1-dirk.behme@de.bosch.com/
