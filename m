Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEE340DB2C
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762402; cv=none; b=LYIasz5CvU5O9YV0SfWO8vusfumBdv5Q/SXagRT+bgBpYWei2HK2VMoo7IqiUPtEyX8y3oSyGHQRKiN+qHHybFndOdjYBwwa1SMvlsyqWFo21XWhy268eQI/wZlAsYdRKRUWDNY9nzkZQE9m7tWvs6kT1JPefMX7YW477YcdKJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762402; c=relaxed/simple;
	bh=V+e6I8CNt2H2Pif5e46ZpWFaoWmgkmQxUFOA2DWiX2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eBm4D9zevceHTT+ODdy1y4Je317tsNzc55NfWre1vZu2MtGOSHK+wEFrB066KrhkOa6oGeM7WXhh6HzzVhqva0GGPVNlJoeS1QKGaArgBuYVJf2uInkvHIgjxuIAaMTmhM0+DmLlAXUB0QoJu4vMGW1RNNgXizbAwjiJKBK8+nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=crR3K2hO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="crR3K2hO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785762399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TpAYiTbcaQ0jvMB05FtqLWtuoGIYX5W9PtOm3b1H6mI=;
	b=crR3K2hOK57YUbZNXOT8kIXaN97ruEq3wltYuO6JSBJlIoWIO/Ji14KtGB0TOkqiaf2ocm
	+0vmmKTH6BHKje+nbPb3ZbaNeBf0DCGysl3XB8NAUORRwIrBOuqa8bcDVCln4nTk6ad63I
	/Lc2Rf93m8KBUWQN1B3bfg05XfykxZQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-9LvQkXGdPTqbJ0Ecee43tA-1; Mon, 03 Aug 2026 09:06:28 -0400
X-MC-Unique: 9LvQkXGdPTqbJ0Ecee43tA-1
X-Mimecast-MFC-AGG-ID: 9LvQkXGdPTqbJ0Ecee43tA_1785762388
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e6bb29581so122255527b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 06:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762388; x=1786367188;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TpAYiTbcaQ0jvMB05FtqLWtuoGIYX5W9PtOm3b1H6mI=;
        b=DC2Gn05Nxdswt1RrCZZOzzErhHqnekmqFnSU/oISiSKeGUhbwWO9fDsSfvRwnMwrhF
         BkkGWBSM8MDM98Oh8V7wKvTegUnEejhRsVSHdvWHt98WrooprFaXz2upiyw2y4dM5zpy
         b2w9JcDqC4K6Pq3SNyIYQol5dfcDdaSOiYtH1tbhiyESwTIMc90T61lQdu/UBTbZ9Hjp
         izJamcvuN2CYJmGQ/ZMzkHru5HX6iButV4qC72zCIG5sM+cl/eI/j0UjJk6jmLr9ySjt
         /+/GXlXaVVq6Idvz/ZZsLaD6NeLhZ1bDt4ZO6y8ApfKbLMV4T8ZdtVIcKlZwj4KQtn75
         mxKw==
X-Forwarded-Encrypted: i=1; AHgh+RrHSDd8UD9t1Z036+wB6GsEoJUU/5Rsppel9pvW+SATI0vhsykwpSYUnv8qu1Qsr237cxMwXNSreQ5kWzkFog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws+yAjaPUfzLXGJPM30S9iJ4av4EMjtAPArbIWfVBkZ5xjg4JT
	QPaFyukYEYE4Ebij4zkQtI4bmA1bDEHCABZDQCvoSDV9IvTQ6fZ1NenF1tCe86AGGt1HVqLcRIA
	EPV+mvJLZ414iqpL6YOSrKS8pkoacvUVWWwj195bv4xXLf4/1N9gFISTNZbHatEmljAXE
X-Gm-Gg: AR+sD13Vb90Ryw5cbKeoF13GAgO3uK7SHc+u7iwhlJISHRlpdvA4dH5snbxf3RTH4zJ
	vHr81FwuHOkRXosrGkesxNDQ1l6u4ilKgL9NL17Rtk0f1JWQWTDQRCaoPc6Tn29LjO0dIELONkU
	6ZoIIa/otq7a9x5yWD6QUeW2ikilL40CoZ/+uyaXH8qEiqm1Mjzr3+Qgfb7tRdz+yze6M4t6m0g
	Gg7+Hqe4yn63/VkDNSLgiCUYRLrP7fMO3RWXVxyCBJEPfFf0JRdvQRCm0/c8ablZene4UhCflXx
	VDuV+u0dQDbYsOY93T9D4WP0KTwuSi8IM7YXQe88AC1G92R9UqoH9mSg5TfBufOj80rahM/JPQW
	w5sApeYm0SbZKN2EfwZKbidKgC7goMEVhRdU=
X-Received: by 2002:a05:690c:4b11:b0:81c:872a:5152 with SMTP id 00721157ae682-81fd4bda24fmr120206907b3.30.1785762387682;
        Mon, 03 Aug 2026 06:06:27 -0700 (PDT)
X-Received: by 2002:a05:690c:4b11:b0:81c:872a:5152 with SMTP id 00721157ae682-81fd4bda24fmr120206447b3.30.1785762387273;
        Mon, 03 Aug 2026 06:06:27 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf60a76sm54295687b3.13.2026.08.03.06.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:06:26 -0700 (PDT)
Date: Mon, 3 Aug 2026 09:06:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maurice Hieronymus <mhi@mailbox.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Boqun Feng <boqun@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 0/4] Clk improvements
Message-ID: <anCSTCxDpFtKmOgj@redhat.com>
References: <20260706-clk-type-state-v5-0-67c5f326a16c@collabora.com>
 <20260731183735.15036-1-mhi@mailbox.org>
 <E20E4FD3-F4DA-4029-99F7-DB4F93AA2994@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <E20E4FD3-F4DA-4029-99F7-DB4F93AA2994@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UL9RaLWWz3rzj3GJ9H1uHQuWd0AAtwfKTxT7mEtvgIA_1785762388
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Daniel,

On Fri, Jul 31, 2026 at 06:32:48PM -0300, Daniel Almeida wrote:
> > On 31 Jul 2026, at 15:37, Maurice Hieronymus <mhi@mailbox.org> wrote:
> > at your suggestion [0] I rebased my `clk_rate_exclusive_get()` binding for
> > pwm-th1520 on top of this series, so it is now waiting on it to land. As v5
> > has not seen any comments in the last few weeks, I wanted to ask what the
> > current status is.
> 
> Nobody has replied so far. I don’t think there are any further comments.
> 
> > 
> > If there are no blockers left and you expect it to be merged soon, I am
> > happy to keep waiting. Otherwise I would offer to send my series standalone
> > against the current `Clk` API and let you rebase on top of mine - it is the
> > much smaller of the two, touching only `Clk::rate_exclusive_get()` and
> > pwm_th1520.rs.
> > 
> > [0]: https://lore.kernel.org/rust-for-linux/140FE1B3-73CA-45EA-B978-648A1A48B577@collabora.com/
> > 
> > Thanks a lot,
> > 
> > Maurice
> 
> Your series might hit the same blocker as this one. Perhaps we can try to get
> both merged at the same time?
> 
> @Stephen gentle ping here :)

I can also provide an Acked-by here for clk. I'll admit that I'm not a
rust programmer yet (planning to learn this coming Winter), however if the
rust maintainers are happy with this, then I'm good.

It looks like there may be some outstanding comments on this series just
skimming the comments. I'll wait for the next version to leave an
Acked-by.

Brian

