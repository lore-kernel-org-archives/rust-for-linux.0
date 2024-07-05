Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A36E149C6C
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jul 2024 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720179150; cv=none; b=R88LAeZToXGdovHmnke9tk1bRAS/dtFJP/8eM8rDEVtRqzxIXfMsrBRdtpGvqQaQ53IOeYBUm8CORgx/Tc5FJM0+09RUP+J6qWmJDiDVJdP5r4XSsjmwKtPZgY/sazS2GMUVqMnrk7I8alTrgYTozrPrfgkSjlNlmWFU3KwcxPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720179150; c=relaxed/simple;
	bh=LuO94MjSEqAzZZ+OdQaO8GGVDhFrlkG2Ta2cSnC8spg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+6dIpKTy0IzjXz7+4pRtbi9Uha/6W9Bjcvqsk7Y12XYCVNBo9Ff42ThST5UrjchVcoFQkijkznCqOQMSBo3ZlXCVMJlOLibQcpmvj2sshC9ut0Lr2q6mEd2S+MEG4XEaOMe7awIQ8hA8To3WwF3j1p0rdBYBX+l3JWwEPrktl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R4zsfnx6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R4zsfnx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720179147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jE6S85bFX7ia/r0z6WYFjOqpTUOd5eKCH2fyhxzh5mo=;
	b=R4zsfnx6jP+vNPQ9BL4gi049MHRX2eJLaDgTtgDjmMD5+DGn6IIcCUvEfRQD+mCSLjFziY
	pVhl+/y9rAEGj7OOvTsqbUuxlX5c6jiedbighdsbh5WPRV2mBwkFdlMFZ3+5tbFQNCiSs+
	xZzOHfUMdVxkEkZrWgbGY3LWQf5KcYE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-ZgmWbtFJOGmWK_XNUOrDFQ-1; Fri, 05 Jul 2024 07:32:24 -0400
X-MC-Unique: ZgmWbtFJOGmWK_XNUOrDFQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4257dd7d462so12043165e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jul 2024 04:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720179143; x=1720783943;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE6S85bFX7ia/r0z6WYFjOqpTUOd5eKCH2fyhxzh5mo=;
        b=S6EnuFdMKElJB5YDVLY4vtUPrCl/I6xUoS3N6IH4nFDqxTMv2cpTveYklUe8Bqc+61
         jIJycVUIA5y81aJxkWeE/2H7QEmrXCb635VexnlpfNOFWU/oe9N9xnajABNsmPyFpu9P
         l9UpZ6ttzs6q86Xq9RScdLhcydlX3eEr6lRtwNjLoNkV7Fyc/vNDJzoNcr+AGNlr6ZwP
         M2nqKNbr+ruBQFKVGrEkV2rxb10PrmyGWzXza53Qy8W1O8lwTCvZDt5eGuDkAGJnmLyG
         9Dxm5y3LmCbAss6N7KPm9zhvSbcmNV1hsZ+nHs4NVPB62gGxWXrXAvgCnFBNkZnO9fAI
         WcEA==
X-Forwarded-Encrypted: i=1; AJvYcCWJDLRClXZaTFYbv38NOfL56Nt6R2UmvSIMsY1iT0BEzloVF7x2fyYeA5plby+UomlsYDDZ/Cj6dxKHU02Q+jAS+KEdnd1NdJPg1K7Ro2c=
X-Gm-Message-State: AOJu0YzrOkzhCKCtPNuTUoxgM591GtUkfzZ3ahLq/DmQ958sc3JUqijd
	IgDom7IHbuhddUCTB8iv3kN4ce1fFuyvOFO4EkQPi3FNFMxFbZ1YEbqz3kWe2v1/kI0jAsnut2N
	9+X9/9ShNEYU04Qe2eGHF8PNsljTpWgtRBgxF5hTLr+kre2lKXujDAffwUtqEFloj
X-Received: by 2002:a05:600c:4b87:b0:426:59fc:cdec with SMTP id 5b1f17b1804b1-42659fccf3bmr4970795e9.21.1720179143037;
        Fri, 05 Jul 2024 04:32:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwwu8Zih5RO6YSe8hQ4RBs6xd5L3lcOJBKw/I/nyz5x44QjIrLSHbrH1hqM8ht621bYpY3Cw==
X-Received: by 2002:a05:600c:4b87:b0:426:59fc:cdec with SMTP id 5b1f17b1804b1-42659fccf3bmr4970545e9.21.1720179142584;
        Fri, 05 Jul 2024 04:32:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1dda61sm58241895e9.19.2024.07.05.04.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 04:32:22 -0700 (PDT)
Message-ID: <f0016987-4288-4adf-954d-665b35ae1bf1@redhat.com>
Date: Fri, 5 Jul 2024 13:32:19 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V3 8/8] cpufreq: Add Rust based cpufreq-dt driver
To: Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
 rust-for-linux@vger.kernel.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Erik Schilling <erik.schilling@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org
References: <cover.1719990273.git.viresh.kumar@linaro.org>
 <b7df0c75cc07a451243b554fb2272c91cbe42dfe.1719990273.git.viresh.kumar@linaro.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <b7df0c75cc07a451243b554fb2272c91cbe42dfe.1719990273.git.viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Viresh,

On 7/3/24 09:14, Viresh Kumar wrote:
> This commit adds a Rust based cpufreq-dt driver, which covers most of
> the functionality of the existing C based driver. Only a handful of
> things are left, like fetching platform data from cpufreq-dt-platdev.c.
> 
> This is tested with the help of QEMU for now and switching of
> frequencies work as expected.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   drivers/cpufreq/Kconfig        |  12 ++
>   drivers/cpufreq/Makefile       |   1 +
>   drivers/cpufreq/rcpufreq_dt.rs | 225 +++++++++++++++++++++++++++++++++
>   3 files changed, 238 insertions(+)
>   create mode 100644 drivers/cpufreq/rcpufreq_dt.rs
> 
> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> new file mode 100644
> index 000000000000..652458e7a3b9
> --- /dev/null
> +++ b/drivers/cpufreq/rcpufreq_dt.rs

<snip>

> +
> +type DeviceData = Box<cpufreq::Registration<CPUFreqDTDriver>>;
> +
> +impl platform::Driver for CPUFreqDTDriver {
> +    type Data = Arc<DeviceData>;
> +
> +    define_of_id_table! {(), [
> +        (of::DeviceId(b_str!("operating-points-v2")), None),
> +    ]}
> +
> +    fn probe(_dev: &mut platform::Device, _id_info: Option<&Self::IdInfo>) -> Result<Self::Data> {
> +        let drv = Arc::new(
> +            cpufreq::Registration::<CPUFreqDTDriver>::register(
> +                c_str!("cpufreq-dt"),
> +                (),
> +                cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV,
> +                true,
> +            )?,
> +            GFP_KERNEL,
> +        )?;

Putting the `cpufreq::Registration` into `Arc<DeviceData>` is unsafe from a
lifetime point of view. Nothing prevents this `Arc` to out-live the
`platform::Driver`.

Instead, you should wrap `cpufreq::Registration` into `Devres`. See
`drm::drv::Registration` for an example [1].

[1] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/rust/kernel/drm/drv.rs?ref_type=heads#L173

> +
> +        pr_info!("CPUFreq DT driver registered\n");
> +
> +        Ok(drv)
> +    }
> +}
> +
> +module_platform_driver! {
> +    type: CPUFreqDTDriver,
> +    name: "cpufreq_dt",
> +    author: "Viresh Kumar <viresh.kumar@linaro.org>",
> +    description: "Generic CPUFreq DT driver",
> +    license: "GPL v2",
> +}

