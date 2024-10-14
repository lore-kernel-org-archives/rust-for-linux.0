Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C29C154C0F
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895619; cv=none; b=MB19q+M8A9qDht8gF7qA1n58gJQlA5dV3RlIaO6snSZAGd82qDT8DvBe/5uI6/q7K0ZEffcuhoTVOXmuIq+ZEQbxrBGoq05rmWZrmAI4unYt+KmHqA+wHMKMqRMbGg0+BswL71Y/mNyTudTyT3f/86kdJdP2YqgRReIngY2Eme8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895619; c=relaxed/simple;
	bh=cBf4Zp4ZkbuIl2mzz5esmBt4b1Dog4B05snFOJYp2Po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSIqSWnML0v+Xk37Gb71T/3e/YecbAMmbSlrih2snxlcYJCW8Pwo3sYw0PXleJN+BBTOh2vQEh6jlw/NJYjLx0cbYmG+XumaEFMzPxcRA1y+XKDafFFN6RihpmfeIZUxR0+HnhIrubOr943I/t5u2tha5CAUOFEWY5b30zMTp7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XrxrFZMY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XrxrFZMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728895617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/17f4khffk+a9y0XW4KJellwKrhnUx2dF476/iSdd00=;
	b=XrxrFZMYPdgwZWqaEKFjgWG2B1bj7iXy4Uyn820FDcbCVgx0TUn4JTnaYeXYsh+iW+TnKi
	um54tK2yrHDAlJUynicA7x45CChWtD5mciadwnO/yzHmLoiR8AjgtZoYI/E7/+wq9oBF9z
	6QreLKmNbjL+ABIx/qqwO0vv05Mh4rs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-uVGNNeAnOPiDSELQ-XwKJA-1; Mon, 14 Oct 2024 04:46:56 -0400
X-MC-Unique: uVGNNeAnOPiDSELQ-XwKJA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-431248c4380so13544825e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 01:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728895615; x=1729500415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/17f4khffk+a9y0XW4KJellwKrhnUx2dF476/iSdd00=;
        b=d+JkspUygmCzB5CwGqrX1cQKHzE1smnODMNWazjDk1Fr14kP1Fv1frhm2oWbuV2czA
         xbB5dFSiysxa5PGwDRtTcb5MTv1rmG5zE/t0ej4dyBPyo6vBt1Q5BgCEZji3z1wHni4E
         Z5hL9TSMEyc0DgXfE5RBYFIOIDWUaot0UZmTSI2PW7GAcmFlmqbJpRD1WLhZfpSWueli
         ZRLEux6auXd+oZ/GUnyw4gwYOC1dwR4eIyD8KAtlYg8dmrf2uvtWUx1+I+CmryxtyYgp
         g8QWOIDXajfDWZ88Y/eeWVwBCNCff/ltVvotW5Nbi2RVY9Yk7KhgwZI8HdvNA1adcLnZ
         b32g==
X-Forwarded-Encrypted: i=1; AJvYcCWy5qSFkYSno1iWspx3iG5VPbY5R93ZQNThjLpxf+fnK+P4G6mozSSOrE7kD+6vowUXwYsKERIasAgJowNbig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5avSTEg4v5jjStVzrUl1OIr59lduMPHZoNsfQY6/ZCKFgoPC6
	2JcufDgIKPxVmaFkRagQmCmOlDp4QC0Ef1EjbjVReEC6KN4XVWdcWeA51ZAP4yYqDKjUDeJ9g/T
	QdJHPqSKcUyiy8Q+t1estSu3R9911EYZ1jC0ACnOJeXAVBwOkUvqrp0vwMug7AYf3
X-Received: by 2002:a05:600c:5122:b0:42f:8d36:855e with SMTP id 5b1f17b1804b1-4311deb5f47mr107761105e9.5.1728895614953;
        Mon, 14 Oct 2024 01:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP5+HN0adeJaut1njpYq1VgQZ9Iv8AmOEw6fVQ/n2dMmXK2yIQhe+TWXeg5VBlE+i0XklLQA==
X-Received: by 2002:a05:600c:5122:b0:42f:8d36:855e with SMTP id 5b1f17b1804b1-4311deb5f47mr107760845e9.5.1728895614550;
        Mon, 14 Oct 2024 01:46:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835d8f6sm114344035e9.44.2024.10.14.01.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 01:46:54 -0700 (PDT)
Message-ID: <15e27af8-6ad2-4e53-9503-5f1b8904baa1@redhat.com>
Date: Mon, 14 Oct 2024 10:46:53 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/panic: remove redundant field when assigning
 value
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
 <20241012075312.16342-4-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-4-witcher@wiredspace.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2024 09:52, Thomas Böhler wrote:
> Rust allows initializing fields of a struct without specifying the
> attribute that is assigned if the variable has the same name. In this
> instance this is done for all other attributes of the struct except for
> `data`.
> Remove the redundant `data` in the assignment to be consistent.

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
> index 767a8eb0acec..5b2386a515fa 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -489,7 +489,7 @@ fn new<'a>(segments: &[&Segment<'_>], data: &'a mut [u8]) -> Option<EncodedMsg<'
>           data.fill(0);
>   
>           let mut em = EncodedMsg {
> -            data: data,
> +            data,
>               ec_size,
>               g1_blocks,
>               g2_blocks,

