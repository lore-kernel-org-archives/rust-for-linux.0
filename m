Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A491E1DB125
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736925343; cv=none; b=g7cTMJZBgM3emvJEJbMW31kTT0/30S97qkkrrEwoc4LvRVQXgTRtecE1tX8Zwu8mIMLRNPPS52E74KSZKkbeM81DjoKJagDedet4D7mYds3imwef8DG2VW1eeKuRheI9Yjp4oIEsUGR5ZkzDwJPYYve5aJ4WpmOyNMratXQBuQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736925343; c=relaxed/simple;
	bh=Ib+u5MR6k4UAHdSEp3lNmJns4do26Mvrgubj25Hvqwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8hmLO+kSDi5Ib7tBNHWuXnin6DngAmkr1WzXu8NRGiOmRQmOR6dxolSQ4NSgw6tRJyk18NukS9sKd3ppeYjENwhTgFLJJ25nMqoHLzaKQgTxsabBL36RQXAXrFWM5lQZ1UgB1yeafskOQj9xIEADsVrOyVmYCb+IhtZ/m29l/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=epUlkQJ0; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="epUlkQJ0"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166022c5caso99620945ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 23:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736925341; x=1737530141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4elwR80YWGNJ6Nyq6UNTgoYtaoLWlXGYjf44MSc4x3M=;
        b=epUlkQJ0DowDJz11ftl0du9ujWiC9JypuJs+w2EAn5JtdRVD7HCwCIpTdMRU43nhSf
         8mbvhLnJUSdtgAQlrFnIFe/nH8v2ffWElVvTCzKPtzSn5dabUJFUSa3dlXvzR4Ff5Him
         TL8a7P/tnZysVYTYndEKfS5BTJIMlk5A4Uko2yaXZ27xI0l6ExgG9ydfjKcGUEvZ7wOn
         PUY+7LniTGWoJGvw8a9+zrVXgoYOpjGZ4mLMoFm59GP9mSABketCTE5PrDsFKlMY7ROF
         9mJyaGVRpemDoVoeWcUMrjelMpIjBWI83m7RB7RAU3QEn7Q3ArNnCqWtlhx6zGG4tfbK
         IGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736925341; x=1737530141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4elwR80YWGNJ6Nyq6UNTgoYtaoLWlXGYjf44MSc4x3M=;
        b=MOiYOq16+0nNhFqtcvjjhPsNIw2oF+ZBxbgon0Wypy8A8nEnvBOeZNeVQv1MBNA3BP
         Ihd12plTQ1ZCOEH66tJszT4F4DSJhu86+F0fAA/7dlvSoUkyLaapx+I73+CKtIAoDNy2
         h9eC/JjllRL102vtt6ZA9GVG6exADYUGgzX3m14GOIRtqPARFBfl/4yfj+mMiDQl63Do
         2OBrtg+Ec001selRpi3TPGqQNDByuTUGjfBW2wH7IIm3QsF4F2r854ee5153RDDbNFdi
         3UK8JGNQtBOelNKyfIx+XShobMeOoZ2BmBJMMBE7MrB/Ndf7piov++4gL3OWLlsU0Ul+
         6GvA==
X-Forwarded-Encrypted: i=1; AJvYcCX0EcUUPcrdR//BrV3NrmrDTlorw5lIctZtgec1rxpOiQSUzH0kDd3u11SJB96qh2IAyH8niNf81fqU1ukOUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNsWLlDyQrBbmkcOTxNU+XxWaRLTyQLpOg9TAMQA1ssB3ll8c1
	RSlETixr3iXBN0mPqyYqOJT4cnQWp1Zod5VX/NTdqLBXiGhsSyh1vwy2YjysJ1c=
X-Gm-Gg: ASbGnctNOfN3kr7kb7VF/oplhe0yDhcuT2Sqd0m0w6Y3WbXkgiZbmayTVYa7jn0B2CQ
	YTAjdIOH7ntkHq4HTabEHjL+o+2v61US9IUThDgjuVjgltNonpKrCJM+OFruXF/rwEuPVpy05e3
	fxk9/Fbxs9wLaSmXcbYhFm0ye9XlHHzVjKcXj0cUKBBeZV4x8psKaR+HJbQCe4NCI0jw7ah7k6i
	rkJMrIecZs7Nyg7ARe/eHxDTS+UqPEsfBnXLJhYNPBK6x0uGw1rGMcwKS8=
X-Google-Smtp-Source: AGHT+IGJWbPUigQF/i94EGZcZQuKJ/jjgSn8IplW+yDqF4/5alk96s5viXPr/Xi2mlc7gVZQN1spqw==
X-Received: by 2002:a17:902:e746:b0:216:7aab:71f0 with SMTP id d9443c01a7336-21a83fde39fmr423050065ad.38.1736925341051;
        Tue, 14 Jan 2025 23:15:41 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f25cd50sm77260375ad.250.2025.01.14.23.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:15:40 -0800 (PST)
Date: Wed, 15 Jan 2025 12:45:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V7 04/16] rust: device: Add property_present()
Message-ID: <20250115071538.efb2ipmbmynvwt3p@vireshk-i7>
References: <cover.1736766672.git.viresh.kumar@linaro.org>
 <f43fe3f7b3151a89c261ad728b0f3bb2fc24caef.1736766672.git.viresh.kumar@linaro.org>
 <2025011429-gossip-hash-12e3@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025011429-gossip-hash-12e3@gregkh>

On 14-01-25, 19:42, Greg Kroah-Hartman wrote:
> On Mon, Jan 13, 2025 at 04:52:59PM +0530, Viresh Kumar wrote:
> > This implements Device::property_present(), which calls C APIs
> > device_property_present() helper.
> > 
> > The new helper will be used by Rust based cpufreq drivers.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  rust/bindings/bindings_helper.h | 1 +
> >  rust/kernel/device.rs           | 7 +++++++
> >  2 files changed, 8 insertions(+)
> 
> Want me to take this in my driver-core tree now for 6.14-rc1?

Sure, Thanks.

-- 
viresh
