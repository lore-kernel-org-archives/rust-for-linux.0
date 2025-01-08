Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D06E1957FC
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 18:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736359714; cv=none; b=eQxIT3/DKStPq9yIuTxDlgTZpwkdVEl8i1Pdiqfy5LYk+R5ZrJ7FoIQ/NCQAt5sGQiXcAXf2wip7dMPDOlL/0FKVDQlKjAPTdG4MDhP1/8XVRzRdMPgcHH8uOYwBvIZ8xbxeiG+9AGZdEryl0xbn+A6Tzq0irmnAPBm6furXYFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736359714; c=relaxed/simple;
	bh=E7MMhTekMnQL1NJh37hwISSn2L9xkDLjeShEJFzqNq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaY70pwvLFvi+5uhLx++mwtr6bGOFNfGB/60k+VWceD1L+O2C8riuImnZinY6V741a1vLItYqCgVq+RDJYL1DnxBNidnT65ld5SLjTDKXYJ0FundjZBVrJjeGN946FzzYtnvNYkv8QnJUoJaWRXDTJpWJrzBOSsMbL0KN/31ZvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=oEpoor2W; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="oEpoor2W"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436249df846so864575e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 10:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1736359711; x=1736964511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HilkiTTLf9cVUbCyXpjrscybDeaKlWfm6LTEslw4II=;
        b=oEpoor2WNSTKoHbf2ffG+qkS1pTDmz3l0+j9fSUu0jbLh/nds0yPk5hUccCBeKDONU
         yNtdsAyrF6RHMQLZOqLUWxd4R2FQ33ArSx0E4LQ5ZyLPYHOmPvJeQCfCz9lpo5+4KW65
         R04a2VfTPxtCln+0xIL3z9SStqa5+piLWn08b/MoDyijxNSVLsXTlCwCdbaWbtbrZldF
         J4TYlNSMSPTEoA+rD83d9YhvsRtlfWwusmdldQwcNyyDBBQuH+81ja4ErCUFufEgr0Vq
         MC1VBvEadGUS4Xw9ToJnICpN1Ux1FVB4A+eMO3pBZhUFn/PiZMrXnCSvN3C0lZDHuOkb
         rzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736359711; x=1736964511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7HilkiTTLf9cVUbCyXpjrscybDeaKlWfm6LTEslw4II=;
        b=CIXSP+k8XgSDqEyCTqsg0XM+ZIHO+KtCEIIx75EZgvHFATMyompZXFdY+NeGZbQ8yE
         yKqXAhr0zEnAoseHtU13hErYO/ebqlu5j6SFll3okT/XngO92H3mESg4LlDfwc6tBTs4
         M5YmyElmScyv0aeyJ6kV66bgbg18p8M4kC3L37PWXrApzFFcYIki8hEbJhpLmm4gTpNs
         mgOp2S3j/acQcfQxjSk8pOoGQaSzbqMh00kxSMkBileLR4L1v4r5jn56GmnMjflm0oZ/
         moUm2zi+rV33ARGByImOXgHIJyPnK+sIxPRTxRMMVCAS22+9Nvl2gsS3Sfr8td/KXRPG
         4zEg==
X-Forwarded-Encrypted: i=1; AJvYcCUgAL3+Yl64ZDI/aWVzOSj4y5fGADdMhUG/B/QfxrFmpDBUj6vE8tUA4vF1IZIrpBENMwC974arpO4plWmVuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybOiW/GVACdjD7Wm7a4ihaM0RFLcslyaYq35HJ1IgWBJXQj8Ud
	FA9tovpk8BPhQV7wKViVqCAHpbi2YUXXDa1vbXP+5xlCXvzdRvMFYOWJ/ZEi5ek=
X-Gm-Gg: ASbGncvb8tGBAsWSkilkhffyBAFpytuxaYqSR/5OhOZrUZB+mA7yCaFmCWiG/9+V08q
	VZ6cpaX3WM8mFT8mFhTmxtLDupRA1U9kMotp9gpLsKdXf/sDD2XyY8vo78A81d/pNU+qkJ0bLWc
	GRFMTcZDbiuOXiyK3fatziZaNL/qxxHBJ+wNRvReCNYNiPbKJ9aVHeTAXVN8VLbsqKmn2bDW+Nq
	cgReJ7XTaYgxABrCZLmn4ceY+B27ortVMoRFHfJGcLhJmsrz/Gps8NpsQ==
X-Google-Smtp-Source: AGHT+IHlheQWH+MHSVCHWYXlmi7X7VEgIEttRToULqF7IDKXgbJyihsbnt6QC2q5b8CdCUMs66DdDQ==
X-Received: by 2002:a05:600c:5491:b0:434:f7f0:1880 with SMTP id 5b1f17b1804b1-436e26ec32amr29456375e9.32.1736359711133;
        Wed, 08 Jan 2025 10:08:31 -0800 (PST)
Received: from [192.168.88.249] ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2c27b54sm28695265e9.0.2025.01.08.10.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 10:08:30 -0800 (PST)
Message-ID: <588af6c5-02cf-437a-a909-c22744a6df1c@sedlak.dev>
Date: Wed, 8 Jan 2025 19:08:29 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
 <20250108122825.136021-3-abdiel.janulgue@gmail.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <20250108122825.136021-3-abdiel.janulgue@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/8/25 1:27 PM, Abdiel Janulgue wrote:
> +/// Possible attributes associated with a DMA mapping.
> +///
> +/// They can be combined with the operators `|`, `&`, and `!`.
> +///
> +/// Values can be used from the [`attrs`] module.
> +#[derive(Clone, Copy, PartialEq)]
> +pub struct Attrs(pub u32);

Shouldn't this be non-pub? It seems unfortunate to leak C representation 
to the Rust world and allow its construction without going through 
constructor method. Also #[repr(transparent)] may be well suited? [1]

Link: https://doc.rust-lang.org/nomicon/other-reprs.html#reprtransparent 
[1]
> +
> +impl Attrs {
> +    /// Get the raw representation of this attribute.
> +    pub(crate) fn as_raw(self) -> usize {
> +        self.0.try_into().unwrap()
> +    }

Shouldn't be the return type u32 instead of usize? Or at least to my 
understanding the raw means C representation which should be the type 
that bindgen generates.
> +
> +    /// Check whether `flags` is contained in `self`.
> +    pub fn contains(self, flags: Attrs) -> bool {
> +        (self & flags) == flags
> +    }
> +}
Daniel
