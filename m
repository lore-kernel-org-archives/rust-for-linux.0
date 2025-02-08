Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512B3243397
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Feb 2025 23:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739058923; cv=none; b=dph6d2hzFjuKMzKdXEajqr4SELgJXtglekxmIF30gArPadCFPv7MWsCxZLL/ndCXSWxPl2YywOEJ1kO5RSa/HarIbdxJJnvXUUqgeYj4/F4WmAj3hZXcdaVEevQcn7uBNxWT4DoPlkviGjEq9gOvDIlhcKpm2akfcM2y+iotcQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739058923; c=relaxed/simple;
	bh=JRYaldM9lNmyv0V3AluADdJ9dlvrHbXlkp5UU3XH9Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYOF+f6ArPFaxFjALianelOQI+PgpHRk838gZUTtpL9pzDyp2lhu2nGSNw7EFmvJofOQA0M7zOMOMLDtuV9fE2XMd95uPwUg/gnioFGJudyCH1+8Mlm2sVANI8F7K2goq7j8+jTaxdSX26qYxpdrhvUE87Apqhlq3vtcOZOQMhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=V/GdBK9U; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="V/GdBK9U"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5f4ce54feb8so1826177eaf.3
        for <rust-for-linux@vger.kernel.org>; Sat, 08 Feb 2025 15:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1739058920; x=1739663720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPicVwQS5wbJAwKsL40Ymzq5q/Ob6IjbFcIhIGSOedI=;
        b=V/GdBK9UEzWMQ14583BhtSuIbTUKMhwLIrtAHFBPCs+yIqupRn5ykVRB/TCNqSOiJB
         rsaqHlYpxej/dfd74EuJuGXQ9/My16iz5tDiMYZeqNys4gQnTYkkhLf1aWD9hDJvsPaH
         r+WeeNpfPmrPGLtGgbC4WbbrnDh5oOXsKX1bw+u8KO+QPPrNCaOuRTpOnogQjNaaddOc
         0wqhzhTXQjhbz2wqrIomBn9wP0lsnPsQ5H0v7nPpR2dl1ijYKZ7jUpqwiw6r9IVtSbxA
         fhE0Hd3U+wvEfkduXvUQqkreZrUKVv/SYr63utjnyLmNbPv/xEoRHYooy6ERuXtRdWZj
         q7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739058920; x=1739663720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPicVwQS5wbJAwKsL40Ymzq5q/Ob6IjbFcIhIGSOedI=;
        b=SX+Y59mzdaBCVu/HVLk6XfPk/acOv4knX4bnbwMVCCtizzQrlk/iw/hSQ4BEFy3glh
         gyRfcn7De49sYcli/pCYupjtub4zx9PWsHsPdhF2OLaPdmf2nlF7LzEoLtF/Pf9vl0SI
         6y447k7oPi2AWwJ+Vx0FSvjoz+xRZbHNnKl2hmQxls2/ubvmrMx3XRhVpIi9Fnuo/XhQ
         QTq7pLzhqW5qe+CLzLmC1tc3OHBxznFOcNRoXILHxBARYwgXICjVvJ+93NH2nW17EmRB
         aMTSxI7MT4WtBD9aomJNr6qs8+22lIkcQyxGYFGOvTNYbZq9IAbPKLgPvHvTFsox7JjD
         Otgg==
X-Forwarded-Encrypted: i=1; AJvYcCXw5Id2fnnVetZgI8KG01OMRbx5tSgu0sbR+0dGJZhgMBh8optCVDGGEuoumgJCeGSECSqQrpvT0aT5fwp8jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygwoAenDBqUUnay17d17Ikq7O1D+USi/ojM/8STgOldCm5QOAc
	E9EIpsAEbYV4p5BFjfgxZ9r7nDL+IVZcazX4KbwlqB0bqWnW/GEKWpIcRG0vITQ=
X-Gm-Gg: ASbGncuAxqvmSvj4Kb0jfYU0Xn1t0764Hibfk3cgFeY+VgrbsU2s9iZGXfnVT6Sph1C
	X1aQLkNM8lUtxOSvSYu/MmKJulKmPs3Gm807tHeJzxFWzbvo7ff4pkdapN6k5zg20w6zGvjowI2
	ONBtPzfLZfcPGP2LLeYUTxcfepEugpDrNhfmpUluVVsStqq9C1ZAmnitkW7uADTZTtYOtULwhVD
	sPMF+Kumijl9/RFcs+RWBgkRv8avkKJj0Rd1sY7CLEXJdW7EmXPHGgdxi79NfriypnGejH1qx12
	IoPotSnXX/Kf1CBHw7zJRzn9NZW4VyiNtR8IvkR/KNilp7D+HLrQJHPJhA==
X-Google-Smtp-Source: AGHT+IHWk4r4HVyiqLL19e9cELrxNlFZUIzBX3h21rZtA7zL/FAkU7jPy3L3H4qYyNZyOB/xY8XDPw==
X-Received: by 2002:a05:6870:5154:b0:2b7:fa6f:9672 with SMTP id 586e51a60fabf-2b83ee95b12mr5471087fac.38.1739058920357;
        Sat, 08 Feb 2025 15:55:20 -0800 (PST)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b826262333sm1734780fac.37.2025.02.08.15.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 15:55:19 -0800 (PST)
Message-ID: <1894f095-e93a-4def-a223-d5c089ecc2df@vt.edu>
Date: Sat, 8 Feb 2025 17:55:16 -0600
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Christoph Hellwig <hch@lst.de>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
 <20250108122825.136021-3-abdiel.janulgue@gmail.com>
 <20250108135951.GA18074@lst.de>
 <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com>
Content-Language: en-US
From: Carlos Bilbao <bilbao@vt.edu>
In-Reply-To: <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

On 1/8/25 09:16, Miguel Ojeda wrote:
> On Wed, Jan 8, 2025 at 3:00 PM Christoph Hellwig <hch@lst.de> wrote:
>>
>> No rust code in kernel/dma, please.
> 
> What do you suggest?

This is it. What do people suggest? This thread has received a lot of
attention -- maybe it's an opportunity for the community to brainstorm.
Here's an idea:

Some maintainers clearly hate wrappers/bindings to Rust, while others don't
mind as long as the R4L folks commit to the maintenance duties. Depending on
the subsystem, it will be a completely different conversation. It seems to
me that right now, every time the R4L folks interact with a new subsystem,
they need to understand the maintainer's stance. That looks like an
exhausting process.

Would it make sense to have a C middleman that Rust calls instead of
binding directly to the C funcs? This dispatcher would provide a simpler,
stable API with fixed function signatures, even if the C functions change.
If a C func is removed/changed, only the C dispatcher would need to be
adapted, but until that happens, a new error could be returned to the Rust
side (not ideal, but Rust doesn't just break). 

This would obviously impose some limitations on the Rust side, but it might
be less conflictive than direct bindings. Also, in Abdiel's case here (for
example), he'd explicitly take on the maintenance of the Rust abstraction
and its DMA dispatchers, leaving no ambiguity about ownership.

> 
> Thanks!
> 
> Cheers,
> Miguel
> 
> 

Thanks,
Carlos
