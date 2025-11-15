Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A74C27732
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 05:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763184153; cv=none; b=lR0HxKQE7dr7LDo5fV2wt3jx8+MpgRxf6uX2ospRJvveBnLmgwjUJ4JP4MNhwdWlj/XGV+G2DUGWTd6VuQwaRCcdLyW5kdgsuI6y4KCbHaMLRp+umIFIPqkEVaC2ePV8nOwpnV2xXc6rM2eYCEGwk4gaqwhRRZNy7ES59EHGfCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763184153; c=relaxed/simple;
	bh=8jRjnNNKTIwuShxi8ND1VrTRSOxc5ZghGt/6UBfAuSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIJWfp2rPeM32Ao8zsjUEcVsMU4CmK2XbGWtkamaeXVY8GSJaI0ZDnAs+xmYF9uAGGKc4+qdfnxP0F4YzfChk9xOFhh78n3k6C+ucGuu1JeA2rn3o1jIBSCSPrNEvn41UrOjD3IAAvoonOY0gNdULxBurauPCHxKXgYtq9Shgcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLWIWY/W; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLWIWY/W"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-882360ca0e2so19711826d6.0
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 21:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763184151; x=1763788951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vw1yyzpD/lbeW4WQ6alMaJdvtmbnmPvmf1N42cGHlQ0=;
        b=cLWIWY/WqrxuAp2ljcyzUCT9KyDCjnu0VYfyYGpZH9fGJJdy3Nv8FOMHwrNDBxyEzm
         uo5gH1CoxexWL/guB0A3LgVRV3rGgRlDG/6RLDtcsAU0iFLBU+Tp+6s8nVA+0CdzCOpd
         zN83hiwsK6Jqg2E3dghNS4kqQ4idSXq2ldtW4O1xXsEN8kGU8A7d67rSVbCiffDQqLwK
         vaSvJ0iAzUk4yeGgWTUHon5K4uZyUHLnJYbh2H03esD0Cmlni8YikVOptEGWcCDNz1pv
         9fUP/HtGyMgHhYapky0cvqyuxBkExAAp/7cMZu+Zoq3SSj/IAm6XVp/ku9/Si54wcLvd
         G9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763184151; x=1763788951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vw1yyzpD/lbeW4WQ6alMaJdvtmbnmPvmf1N42cGHlQ0=;
        b=PPlU0R+X6Xdf4W3O3fx/CnQOzjfT7u6mlse4NOIJPXHAM7fRvaqVLu19L8OnBqLT4O
         KDcPv+hF6eKZLKEDdkC1cItJobwdHT0euKqN2ySL/pO+2PU+awiwUGpEmJUo6On74xcJ
         tGxFIP8bcV2F73qrMfRAlkZEG0v0asjSOboMvvpZZ1W7lVZk762Xhox5lHF5e1YPBhIQ
         pLc/2QW6rt58TljcOcHaQlc3mRkXxwtGfMAlH/ENmjBG8A6L7a7FPTwJJ72o21SvY2fq
         1bB9SUptOiCXkWzvM549H8DiPCLy0RmdQ769+jiDMz/4Y/WCaqH07ZsFHFLKVv/C7sfi
         IjUw==
X-Forwarded-Encrypted: i=1; AJvYcCUEHbBI8/snfsvG8nQfmGWYS3PWWFndpZRveJlOXTnjsCArA12Cg3oOkaHyukwYBqjnmeczooDIfKDMH67TJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9eg8uy8tUDwKAcz309M3w8e85iZ7WO95tcdIf+kSUZKDzI1Z4
	SOjhGQJQBncJmx2PsDomvgjo6INNthYipAp9R559GBHbBTbL40mvG8QP
X-Gm-Gg: ASbGncvigLW5lVfny6H5CBtsdBEZEd2Ji0nUkB8inrpSei5z3F0By9FMkUFtmZ/jXE2
	w7YAld4UQFTukIqyn1uLWeBNZNY55EdZX92Xm73i6EQWWn6WDmmy7/ibqnUee7MZnQK8NCmxinC
	VNXq5DGPTXmifQk73/WrhvGPDzI9xSGK4YkD8qkZZ/CK7sIjFPB0xOmVlTmJzcrspsZEWnVTgb1
	ZKAI9nAjVC84Ja4I0S5c6JbgPW+tClDwYGcLRSMC0bBnO+P8pSlwodLFUaSpE0btf81vskm+0lQ
	hj+QbEQELVWuVskD5dhyUeuGqvQ6YVHLdAfkWYOl2wJHqxf5ZrrgaWYx0bc31AoFj8BX8X4YIdg
	jWgJzHhKmquk5ZQ5sdcAvo/6m2W8bdgn7ZSxyjbFKwdE/dzR8HKXU53OEJcwd20eD9nK29qgQzI
	PcuSi8e8/5ZZ81tNokw80kKboKh8Vf23E0hS8LHqkg3KehkZtkHlECLq34rvr6CnqGXLAYwHOkp
	cMf/NurOzXDvVk=
X-Google-Smtp-Source: AGHT+IH5J2YgoI4fYGJF1AMcc80bx1D1STvEEPOV8tLouNq8kZzgP8gWwdV2JPpfcHQoyzqrJU9bGg==
X-Received: by 2002:a05:6214:2482:b0:882:6d84:ebfa with SMTP id 6a1803df08f44-8829269ddb4mr89558716d6.40.1763184150864;
        Fri, 14 Nov 2025 21:22:30 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828652efa4sm45379616d6.39.2025.11.14.21.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 21:22:30 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id E3AB8F40076;
	Sat, 15 Nov 2025 00:22:29 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 15 Nov 2025 00:22:29 -0500
X-ME-Sender: <xms:FQ4YaVNaRbke7yaTt77t7-_uXwDa0713FP35fWm8ymm5ZyerU4kEjQ>
    <xme:FQ4YaUWHErHULF_RbkYQHHAlL9MPYBBr76cWU9QayCbzjisjUQ2lOgFp67Hqswo_r
    VNcg-6FOD2L0mbJu3f_N6X45dGdtmEYVVbWy6MqkWNYto5jwaZ7WA>
X-ME-Received: <xmr:FQ4YaYsnw9ZZSUm0z39UBiqNXijuWGGc1O68yHZnO3_3WOsEoK7eWja54VeOI7KWXw6CIJzzRubw57mAKDnlGBHLPy2-_2zu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvuddukeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgih
    nhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvg
    grugdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitg
    gvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehp
    rhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:FQ4Yaf3M90tDwp71tT9RFqMiCOulJ6klXMhbQNMS2mGdXvFVt1jFMg>
    <xmx:FQ4YaZ41sAYV7ydxlfX94KfhHJmfWlfFhWVGT1aJtXXGBVRExqrooA>
    <xmx:FQ4YaWXsQbaOBDqFshyiY5HyE3iuqccrr48uYQXByxSrLuMeP-hmLg>
    <xmx:FQ4YaRhqu-uvOkYE7rcd3iNAkn8j56chl88Vra5OEdIgu3pJUCMqJg>
    <xmx:FQ4YaWcv6JFuKzogoXFBn4GZoNXSfpMXc5ANYV1lCdbaUNrGPL_3Yxr6>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Nov 2025 00:22:29 -0500 (EST)
Date: Fri, 14 Nov 2025 21:22:28 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, peterz@infradead.org,
	will@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1 1/3] rust: sync: Add
 smp_store_release/smp_load_acquire helpers
Message-ID: <aRgOFGLqkolf4j4T@tardis.local>
References: <20251115050305.3872412-1-fujita.tomonori@gmail.com>
 <20251115050305.3872412-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115050305.3872412-2-fujita.tomonori@gmail.com>

Hi Tomo,

Thanks for taking a look at this.

On Sat, Nov 15, 2025 at 02:03:03PM +0900, FUJITA Tomonori wrote:
> Add smp_store_release/smp_load_acquire helpers to support
> store_release/load_acquire for i8/i16.
> 
> Both are implemented as a C macro and type information is necessary so
> the size argument is necessary unlike the C version.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/helpers/barrier.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c

Could you just define helpers:

atomic_{i8,i16}_store{,_release}(), atomic_{i8,i16}_load{,_acquire}()

in a separate helper file? (e.g. rust/helpers/atomic_ext.c).

In this way, you could just use C to implement these and that'll make
the interface Rust/C more clear.

Eventually I will the macro declare_and_impl_atomic_methods!() support
customized list of types, but right now a dedicated macro to generate
all impls for AtomicBasicOps of i8/i16 is fine.

Regards,
Boqun

> index cdf28ce8e511..b66ef792c7be 100644
> --- a/rust/helpers/barrier.c
> +++ b/rust/helpers/barrier.c
> @@ -16,3 +16,27 @@ void rust_helper_smp_rmb(void)
>  {
>  	smp_rmb();
>  }
> +
> +void rust_helper_smp_store_release(void *ptr, u64 val, size_t size)
> +{
> +	switch (size) {
> +	case 1:
> +		smp_store_release((u8 *)ptr, (u8)val);
> +		break;
> +	case 2:
> +		smp_store_release((u16 *)ptr, (u16)val);
> +		break;
> +	}
> +}
> +
> +void rust_helper_smp_load_acquire(void *ptr, void *val, size_t size)
> +{
> +	switch (size) {
> +	case 1:
> +		*(u8 *)val = smp_load_acquire((u8 *)ptr);
> +		break;
> +	case 2:
> +		*(u16 *)val = smp_load_acquire((u16 *)ptr);
> +		break;
> +	}
> +}
> -- 
> 2.43.0
> 
