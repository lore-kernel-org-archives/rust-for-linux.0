Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E5917E45D
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jul 2024 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720601817; cv=none; b=GBwsqjN507LagXoEy3IRueoZbgsrH7h9jjfzmJyLye3fAO+nuS067rRHaqXI6hOLMg7OsbfHGj+vZa90Vc7WAnJQq8q/vB7ikHufw/2S5Lebaf7gi+6A6bZTmlfM+NZwxrsOlEb8IR2FvtwR2JmGWEAZhWR9yH7+TmzCX++4KCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720601817; c=relaxed/simple;
	bh=3Q0FUOtutHaqhRnuNFkCtC2MR/nRZK3/RbDrWmaE24g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6wlVtEkSgz8y8rUPkSE1GymtFIWxvp78BHQbE23A3iEHoGqTP8rJHrU4WpEqYe7tnuyPMeXzLfsFrOUkN7Ryt6Bq5Sz4f0Prhz4ez/Ir2AcY/5g+cTvwhVSVL/fyx3PIG7att1iNvuCUWPLv4uq65mU/FJ5AQBUK8oOyamW2qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h05QYKA2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h05QYKA2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fb472eacf4so26239765ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jul 2024 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720601816; x=1721206616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IBRUpPu0VPQIPvE2nK8BuSgJ8l83VNDUH/RgQpIaWCI=;
        b=h05QYKA2V92nHOCcfQtvJQoxJFjvEOprAVzygrWap8dlLLwFt7YOuvqbPFmmSR7B4e
         j+epieavb0A12+TmXZGpEeDHoSLoG5jxJ5AvoEsYIAnKOxmHpvl7aziKolKT6xhCS/5/
         sND4OMtoMvcmC8X85EJe/vdF2F1BRyp90/PSnNm03cTmzXn+1s8oDXbn3Ov+q9AyNYvg
         C4aVbb5LAbPi3TYNX5iDjfT9NFfxT/rnuyDccpzRqBaelghUYUQbrfJ03W+/8Takb36r
         fd3lZW2tnX3jijep/+XogmZI6feKz7/LyORv4ZEHNXSyH28ZPExUkQ8s8dA3dx2ai8qM
         cxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720601816; x=1721206616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBRUpPu0VPQIPvE2nK8BuSgJ8l83VNDUH/RgQpIaWCI=;
        b=jyoY5yBB9Sk5ViDNuUDH/AL9H4xA7yNI2B5cYH7lvzFs2D5HhBpH1sTJivlgwf2uFO
         hvuyCgt4ngNBgI31KvTzgm/GnP6cIMnEsGsx5w7OWFK8F2GpyrE068DGlqL8djdKGpss
         gkM39C7/EhB4e7W2KaGpbgmtD7yIyWH7gFiyWbU/5205GkyfKkR+8rGqco9eEoybb6uU
         rQDymtqhwYP36kLVmW87sKAP5kcz3xWsx60A4yL+M7prqQ5WM+bNaRxo8m34dhDpMefD
         429rNwYMbBJjL4/C16O763QtupPANrILKSCzVfYlDyswtQz+7m85oTIZhr4aVf/axdBg
         peUw==
X-Forwarded-Encrypted: i=1; AJvYcCWZfySv9BuEmTUxatu1fp1IYqWybLQymYxPdsYkAWxBdEWx78SgvX/+7q5T6Fa/mfwEhJRLvR+g7B+JqqVaj7MuFahXQui12RSM0TuzTB0=
X-Gm-Message-State: AOJu0Yzkw/G88GGIO1c1L3azD9FT2vIisg7XCpHX3PKhYtwYxRj33A1P
	wsWkEhKd9bFlRP3rJdYVmSATgG+kHjWLjE/2aoRqtnaEja8ASif0iqOBjJVTMfQ=
X-Google-Smtp-Source: AGHT+IEVB8tOcTvVkQMKYUorCO7nrunLCIRVS0MNQOClkyaYDOIHlwMfGp0zUV38Ne6qCbyn25fBsg==
X-Received: by 2002:a17:902:ec8a:b0:1f7:1b97:e91f with SMTP id d9443c01a7336-1fbb6d3e8ebmr42132875ad.26.1720601815731;
        Wed, 10 Jul 2024 01:56:55 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a122cfsm29737245ad.5.2024.07.10.01.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:56:54 -0700 (PDT)
Date: Wed, 10 Jul 2024 14:26:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH V3 8/8] cpufreq: Add Rust based cpufreq-dt driver
Message-ID: <20240710085652.zu7ntnv4gmy7zr2i@vireshk-i7>
References: <cover.1719990273.git.viresh.kumar@linaro.org>
 <b7df0c75cc07a451243b554fb2272c91cbe42dfe.1719990273.git.viresh.kumar@linaro.org>
 <f0016987-4288-4adf-954d-665b35ae1bf1@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0016987-4288-4adf-954d-665b35ae1bf1@redhat.com>

On 05-07-24, 13:32, Danilo Krummrich wrote:
> On 7/3/24 09:14, Viresh Kumar wrote:
> > +    fn probe(_dev: &mut platform::Device, _id_info: Option<&Self::IdInfo>) -> Result<Self::Data> {
> > +        let drv = Arc::new(
> > +            cpufreq::Registration::<CPUFreqDTDriver>::register(
> > +                c_str!("cpufreq-dt"),
> > +                (),
> > +                cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV,
> > +                true,
> > +            )?,
> > +            GFP_KERNEL,
> > +        )?;
> 
> Putting the `cpufreq::Registration` into `Arc<DeviceData>` is unsafe from a
> lifetime point of view. Nothing prevents this `Arc` to out-live the
> `platform::Driver`.

Hmm, the platform driver layer (in Rust) should guarantee that the
data will be freed from the driver removal path. Isn't it ?

> Instead, you should wrap `cpufreq::Registration` into `Devres`. See
> `drm::drv::Registration` for an example [1].
> 
> [1] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/rust/kernel/drm/drv.rs?ref_type=heads#L173

I can convert to that too, will do it anyway.

-- 
viresh
