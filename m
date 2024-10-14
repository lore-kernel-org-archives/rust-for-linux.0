Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C9157E6B
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 08:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895512; cv=none; b=QzftjF98RzETEf2fuJSfMcakh6uN4n4/rN6mQyDXJ7dU9IKlb9k2oJ0oshOFBPw+RY1yQhS5Ola0eqeGtJkzOjcmrmkhOCVO2vWxsw2Wkg/7hWB1RVYWRiBJIl4FXWZpZ8EIy7OlwbyzICl8VEkH0PyjiJn5ZfYeJ0wZCFfUtuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895512; c=relaxed/simple;
	bh=CwuZER7CMm5JDCMH6v2vPK57MgMOmo4wMH1yhyCB1SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NeN/dO8VqWz+HmHT41YCzi5B5xr0dMJhMlx4JoJdJsZHKLH1S0te8ZB8LJU6gKg2UnDHSijNjowKKJtWXgBKL1Q+sRJueZr8w9RizdgcMGC+a3N9int3rmD61R2uNTKYRaTY6gaFQ5pvi0wAT5kPfY70PU3jive0ZAYecNmVmPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NL5ryNcm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NL5ryNcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728895509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IwPdK057Cp2nQLCke3sfXHwalbY2C/QTU6X8kPub9I8=;
	b=NL5ryNcmXFYu4QjuTyDDmPA/i0rvjN2PbfwMXTsIPW3sS+4L+ieO21mVaaFXF2l7cabc9R
	Cr1nRJ1VkqCZF68+jddM7pnOEzdHxBX/Apq2HmgKDTWhMlcs8nnNkdlyLLtb6lCtQNMDMy
	51lfGA7KeeiShZ5N6b1kySNTsCNXihA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-BBVIP00PMciCHi4qdr7xMQ-1; Mon, 14 Oct 2024 04:45:05 -0400
X-MC-Unique: BBVIP00PMciCHi4qdr7xMQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d458087c0so2396189f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 01:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728895504; x=1729500304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwPdK057Cp2nQLCke3sfXHwalbY2C/QTU6X8kPub9I8=;
        b=M/R423Iuoi2E0rZ9vI8jCdGTdmWSkEXPlZSeyeVgc8XV4+Jvcw9csJhmvDKi5RWbde
         aXsAYJVx49LX2jy3hxetcR1hPvwGOoKvTqS8dtp4ID6/rg0OT37VpArY4qgrE2LGXCI9
         CYgZJxi5Fep752J+uxn8jBl1qcQpO5p5z52FRu5dJBU6TxcI75/emQ7RRg3HHBT1DT8b
         20zscaecud+SJscTS0zAgrAk/0nKonpeBdHmjjWWd4lEl6gniyEwYXbssrtyAL6ia0Mk
         dNfbwxAMy17jLEiDqpn0cr2GRITTHThC3t8ORjcv0Fk8MUZ6xL39BclBMldOoaXXp7JH
         LNtA==
X-Forwarded-Encrypted: i=1; AJvYcCWIjY7vzgtPrCK2TSr3PnNQylm+ujzbN3LB+Rr891gu3WJjdUQkdGeHG7d9idMVFvJvbZlvSZd645jzQLrA5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0FE5xEqpm3MCFqPKNdu1Woodl2Q0XjV47usEm/tATp9TrSRmJ
	WUXRO8hCpttOUI6eBsQTyqnq0OfWHPJKzpcWIkMvStO/+D/iYk/rqPescSo8Y/kAdmCaRx/lTBM
	Yb7ywVVpqz3vwHRjJVd78XueY5Qf7cvhGZ3q1Qmbrio67nQtFmYuCjk0FeNU+hO8h
X-Received: by 2002:a05:6000:410b:b0:37d:5251:e5ad with SMTP id ffacd0b85a97d-37d5251e61emr10001932f8f.2.1728895503947;
        Mon, 14 Oct 2024 01:45:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi2hL5R0Qzddqsq5A+5TzAAhKxmoPEGTna582tFhlN51HBFUK8Usw3/Lf3VB1BnJ+qqSmzBg==
X-Received: by 2002:a05:6000:410b:b0:37d:5251:e5ad with SMTP id ffacd0b85a97d-37d5251e61emr10001893f8f.2.1728895503470;
        Mon, 14 Oct 2024 01:45:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835d784sm113938295e9.46.2024.10.14.01.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 01:45:03 -0700 (PDT)
Message-ID: <89f24f92-de2d-4303-a189-9e5bc1eba02a@redhat.com>
Date: Mon, 14 Oct 2024 10:44:56 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/panic: avoid reimplementing Iterator::find
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241012075312.16342-1-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-1-witcher@wiredspace.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2024 09:52, Thomas Böhler wrote:
> Rust's standard library's `std::iter::Iterator` trait provides a function
> `find` that finds the first element that satisfies a predicate.
> The function `Version::from_segments` is doing the same thing but is
> implementing the same logic itself.
> Clippy complains about this in the `manual_find` lint:
> 
>      error: manual implementation of `Iterator::find`
>         --> drivers/gpu/drm/drm_panic_qr.rs:212:9
>          |
>      212 | /         for v in (1..=40).map(|k| Version(k)) {
>      213 | |             if v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum() {
>      214 | |                 return Some(v);
>      215 | |             }
>      216 | |         }
>      217 | |         None
>          | |____________^ help: replace with an iterator: `(1..=40).map(|k| Version(k)).find(|&v| v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum())`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_find
>          = note: `-D clippy::manual-find` implied by `-D warnings`
>          = help: to override `-D warnings` add `#[allow(clippy::manual_find)]`
> 
> Use `Iterator::find` instead to make the intention clearer.

Thanks for this patch, and the whole series.

It's a nice cleanup.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn


> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 1ef56cb07dfb..76decf49e678 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -209,12 +209,9 @@
>   impl Version {
>       /// Returns the smallest QR version than can hold these segments.
>       fn from_segments(segments: &[&Segment<'_>]) -> Option<Version> {
> -        for v in (1..=40).map(|k| Version(k)) {
> -            if v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum() {
> -                return Some(v);
> -            }
> -        }
> -        None
> +        (1..=40)
> +            .map(Version)
> +            .find(|&v| v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum())
>       }
>   
>       fn width(&self) -> u8 {

