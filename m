Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4142F2236F6
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741600798; cv=none; b=mGEzuqtRqhW1AzCZEf7n72i2JyJr+bqv1q6WoiN6S/7RDI9nDqMY+ej9h85knwwa1GbHPRq2ccTe/7KJCJbczDjDgzydwHZgAfn+ZHoAymQJoEZ231b5XJpIlA/No2nC9t+uTiGIp7+GHzhn56zpYnlXlNpI2rQbC2F+bFzu8ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741600798; c=relaxed/simple;
	bh=V/WiqkuxA4YwLXvuQpcmscx/6nwwjOByTFAnW3PVYWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHtHRtt3HkIydKtRDTcTuTnQIbFXvlhBSosKb8hT1PCOj1mIFnIF+UZ/A3B8iUHJLxiFix3Ej1rVdDWQXq0S+wAvMEyHdvIwzZibiJ3cK+ZwZycbgbfZnIAxtu26O4IbKFVS1GhOdXCBuxjNs+Jz02+TLYU7svcVyT+8xRFy2rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RZ2RO//6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RZ2RO//6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741600796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQ+pSa8sIsuU2xtscwDYe98bcGEdRUw/0m+Fk+VSrb8=;
	b=RZ2RO//6RxQogMA7wAoYUgNmZb8FWUcNzFWqnqozw8PmUg6DF8aubLv5bwDy2BczAxBt7S
	m/Dfp0LiRXTzZ5pJoWscdSGSoK0271mi1r2029jCstZIEnwDx7/o2WCeR5lTtLxM+2lwnK
	nDol/79+OfO+PTzJxCGG6Nl6Hoasuz0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-tE2Qxh2bNrCbekI9dJ72iw-1; Mon, 10 Mar 2025 05:59:55 -0400
X-MC-Unique: tE2Qxh2bNrCbekI9dJ72iw-1
X-Mimecast-MFC-AGG-ID: tE2Qxh2bNrCbekI9dJ72iw_1741600794
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cfd9b833bso1484195e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 02:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741600794; x=1742205594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQ+pSa8sIsuU2xtscwDYe98bcGEdRUw/0m+Fk+VSrb8=;
        b=KRHBQLmT0TzXQIi57A9c9DPw12pFv6ADZu3i0n9CvxH05RAAdAnV94v6KInDNUz1B6
         qJ5EAJyWTAuHi8Bh4+fuIfeI0HmX5M0qwSb5cevICOpeSMxVn6UttY9HMSUQf2N+L7Mt
         cbtfClRGRKihOlqu5DYLswp0u0D9UR6LfPXYuQzI7dAqW/HxPdVBwCDNW/7vO0IcxYV2
         eYpbaLAE8qteOUO9F1xVOw3OBujldcP2etYlsIT0mp+rnz9Vase6H60trYAyPWDYddAJ
         X2JBA4+ijJDEwyxFtQAbEj5/gV676GgG9DxCZY+CseOUT4Oh9F3QpVBvxVAQicpCDtPA
         KTcA==
X-Forwarded-Encrypted: i=1; AJvYcCWwrUPuspNjuCMFoNjMbV6gzZ37rP3HnpdC1zwBCwO8OE4WkUoLL38yvl74/kO5j9VHywNxEiDdmAvRq/QvsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaUQGo9KCPVUCESfLRTOeMuZeQYA7tMtHdLPVx+oEfh0htodL6
	9Vf7wDSt1C7+Bz+ht4Sokc3LOBpJC1y8ENlLY13s2EWIfUyUu6W6GoWQPpGtc5wgytYhuLNA/ve
	LPKVtfxNp3MmI6h627BaneRO5PxUjGqFTeWhiaKvODcESPz0gZx5y1qKBX+8aw5EN
X-Gm-Gg: ASbGncvjDmVWE2AgmCw2yPETrvGUivgENcQDtsk3UYBkoeVUlk7DVBqU9PG399mIKQc
	vveclPenIfHy2LN0q5qOF7pHpxTiN8fjJjCMvUS0Qpmz2x3PZZF+eiDQYWA+I6oT0pe1VuVkYNM
	vuSSy1KHwI3ptWz/yMgmXc5dLLMgVYQS7bLvTiLT1Jap3301Yl/K+qbi+gHuVj9c8w3wKObJho3
	kPacWoFivqM9OVMaSLsmwSSI6h/C2QlOgGZWY1KZZXzFOE9zr57CIYAccemkO9YPNAULIZ/4Kdq
	KbGFcQGAIGQuC+e6UUMeVJ0ZduyUGr4Td9Mg9oxaYLfUM8yMaWJHrPA=
X-Received: by 2002:a05:6000:184b:b0:38f:23c4:208c with SMTP id ffacd0b85a97d-3913af2e472mr5013405f8f.18.1741600793708;
        Mon, 10 Mar 2025 02:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX9wDZkgqzcXWNadk7lA63fXqzI59Xv6gjXmdznaOhUQyAtcnnGk1X47jRovjSDv9uACyJBg==
X-Received: by 2002:a05:6000:184b:b0:38f:23c4:208c with SMTP id ffacd0b85a97d-3913af2e472mr5013370f8f.18.1741600793351;
        Mon, 10 Mar 2025 02:59:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfa52sm14018794f8f.21.2025.03.10.02.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 02:59:52 -0700 (PDT)
Message-ID: <ca830ba6-5e02-446e-87d8-4e120c357312@redhat.com>
Date: Mon, 10 Mar 2025 10:59:51 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: clean Clippy warning
To: Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Thomas_B=C3=B6hler?=
 <witcher@wiredspace.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <20250303093242.1011790-1-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250303093242.1011790-1-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VkhzKzMZx5DgNGH1DoqgC4e7hn_-1kSaTuTES2wMKrk_1741600794
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2025 10:32, Miguel Ojeda wrote:
> Clippy warns:
> 
>      error: manual implementation of an assign operation
>         --> drivers/gpu/drm/drm_panic_qr.rs:418:25
>          |
>      418 |                         self.carry = self.carry % pow;
>          |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: replace it with: `self.carry %= pow`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#assign_op_pattern
> 
> Thus clean it up.

Applied to drm-misc-next (because dbed4a797e00 is only present in this 
branch).

Thanks for your contribution.

-- 

Jocelyn

> 
> Fixes: dbed4a797e00 ("drm/panic: Better binary encoding in QR code")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 62cb8a162483..3b0dd59781d4 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -415,7 +415,7 @@ fn next(&mut self) -> Option<Self::Item> {
>                           self.carry_len -= out_len;
>                           let pow = u64::pow(10, self.carry_len as u32);
>                           let out = (self.carry / pow) as u16;
> -                        self.carry = self.carry % pow;
> +                        self.carry %= pow;
>                           Some((out, NUM_CHARS_BITS[out_len]))
>                       }
>                   }
> 
> base-commit: c0eb65494e59d9834af7cbad983629e9017b25a1

