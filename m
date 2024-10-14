Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2D01514DC
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895547; cv=none; b=k4QULK5WtamcY3NLb+oeLEnapJNO8rU2HqrKqBh++siZF8wS6fM4i9kr5YVvZIPlRXzuSnBd9okYej8BSPQTP8W0XAS8J6+NEx+kcq16oJElHNct4Ek1x1Ub0sm1b5d8Y/sei2wKir2I7DwaJqd/bst+5W8VEQfep0dSlKaGxh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895547; c=relaxed/simple;
	bh=lgPopW14BJVg1VkGC49i3EhdLbT5zQ2I5kJXX/QZfUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffBOnnCd8GogNerizGR7iGFILEa3qsNmx8hB4mRPsABIXvI0QDwMTyXWAPrU6cF1PNbAwCkbLl5rEp55jJAf/NDnH9zSDYbrA1Wq2ffsdOLQopu2/hGF0QgYVcnLKIBPna6AgVjcvQC+A7DwSHaSF0zTpi7WkLRUwcqTqiJBe4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aBqoZXri; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aBqoZXri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728895545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kt7ZpUw00t5zKHLBBAr1PrwMsK/5xgdQaLql2aMEo1M=;
	b=aBqoZXriQE1tm1tfWF0MMLTqVHWyKQj+b7iLx6ny2EYCHbZPFsxYLafa62edunr1YBh3Y7
	LEHzFKx1cL06rb8502EeBvF5ulk21jsROdzhoJLJ0ttCU16tALxTWQQ+NjR4PTBcJaUh7Q
	x7Pt795J/zPyobaVHTDIdCbqkvhEw1A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-FKsSoatuMui2EX5Y-RM_gA-1; Mon, 14 Oct 2024 04:45:43 -0400
X-MC-Unique: FKsSoatuMui2EX5Y-RM_gA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4311db0f3f1so19373375e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 01:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728895543; x=1729500343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kt7ZpUw00t5zKHLBBAr1PrwMsK/5xgdQaLql2aMEo1M=;
        b=Cfy8zdC1K9Qh8+mRedrT6XYigCvgG3MXJZU01184epsxPLLOkRxk2Rsl1o08l6oVEF
         bk5Ssh7Q5z1NSy0bRnQ44Kq4XgcbZm0iIK358lN1iQAbU7lLzGAQyNwUYw7rTMs3QOE6
         2xotrpTQZkYOy9eTN8qO4q5WzwKohFZDl1dMFCiiPQVAdrvO0JKhhFQOAZuRnkPI9g6P
         7fU+iQRO+0XwI0ddiimb/ZogqFKN4lsMGvauOyqTNI3wpcS1v+7GNawNAI2pnnF859PF
         589CtC4kj57pugJeP+3hZZUmZp/6mTBFFXH3OFeJeNkN7E3OYt/QGOwtCeqrqEQuzf52
         5jBA==
X-Forwarded-Encrypted: i=1; AJvYcCV5G1prI0eVUom/EesA5TYjAe4n4D6o2xnn+eINwe9bWVvimC9fMPqTdKn9lu9AsdC8Wl5DcVoDtCMmOtS+HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi5Ymt6XgNXej+qx0xWZhkW/HNUt0pripkcR7ZRtGhiDqdrxeA
	LvOnDIQ6A8MoGyFY2WeMOgrNeCvEq6hJ/UW/0CdXHz/6CMHccM8J0VrpxV8wgz88/eK/H7XmBW6
	yS4jvxJcxui6KPPcOyeXR2BOkPoms57BscCqQCHUZTnXa3NdKS4OWNIADroxiTNJD
X-Received: by 2002:a05:600c:5122:b0:42c:b22e:fc2e with SMTP id 5b1f17b1804b1-4311dede4efmr85784515e9.15.1728895542628;
        Mon, 14 Oct 2024 01:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtqRSS2nbZ+gemMvRsJ39NH+QcIg8oMuQO5fsBN4pOW3+HQjIjgY4dj/+hR8uAckTbY4WSxw==
X-Received: by 2002:a05:600c:5122:b0:42c:b22e:fc2e with SMTP id 5b1f17b1804b1-4311dede4efmr85784285e9.15.1728895542180;
        Mon, 14 Oct 2024 01:45:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8802sm10762445f8f.21.2024.10.14.01.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 01:45:41 -0700 (PDT)
Message-ID: <db18fcea-7dfe-4edc-8e3a-8078860656b3@redhat.com>
Date: Mon, 14 Oct 2024 10:45:40 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/panic: remove unnecessary borrow in
 alignment_pattern
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
 <20241012075312.16342-2-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-2-witcher@wiredspace.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2024 09:52, Thomas Böhler wrote:
> The function `alignment_pattern` returns a static reference to a `u8`
> slice. The borrow of the returned element in `ALIGNMENT_PATTERNS` is
> already a reference as defined in the array definition above so this
> borrow is unnecessary and removed by the compiler. Clippy notes this in
> `needless_borrow`:
> 
>      error: this expression creates a reference which is immediately dereferenced by the compiler
>         --> drivers/gpu/drm/drm_panic_qr.rs:245:9
>          |
>      245 |         &ALIGNMENT_PATTERNS[self.0 - 1]
>          |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: change this to: `ALIGNMENT_PATTERNS[self.0 - 1]`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#needless_borrow
>          = note: `-D clippy::needless-borrow` implied by `-D warnings`
>          = help: to override `-D warnings` add `#[allow(clippy::needless_borrow)]`
> 
> Remove the unnecessary borrow.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 76decf49e678..7adfaa3d6222 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -239,7 +239,7 @@ fn g1_blk_size(&self) -> usize {
>       }
>   
>       fn alignment_pattern(&self) -> &'static [u8] {
> -        &ALIGNMENT_PATTERNS[self.0 - 1]
> +        ALIGNMENT_PATTERNS[self.0 - 1]
>       }
>   
>       fn poly(&self) -> &'static [u8] {

