Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783360;
	b=oVbBoAg4jm2SXdDP8K/4W4WmT4VKgpcNY3CT9cUnqIyMwjbgBpUFZjfASBRBozQwjNv/
	 GXyoaDrLuKseFB4bPnqx1yJh7DASuOq99rTiEnB0MWhosPx1WK6iDuGk6ejMIznE0HJGf
	 ap5AP/2n7WgX0aHDlSBlojs/lvut4rFyKRKm7oMIiYkJ+75Y3ULPNy6pD12ZPWvvsTSIB
	 94YxZXd10kmhPu0lePYSKsgOjzTsSUQxrX+VQtlvkJiq7ZM262+Qm3wMqmeCHDXpuF28Q
	 Rk5qQVARLIC7ESWP5L36i3O1JjfZBwO/BraxpuBtkIJTk5LuZzXPIiwyeapIk57Uriw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783360;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=69WYYzr2raKy4GZhRJJIx91GBcacgavIFPmAXCyscrM=;
	b=iGGq6H6PMmcYolU+c6lCfL0ckqDgudKzk0vMJeYk0y+5TkHNaw3C78lAdGCSvwh5WOzF
	 /+JbDJ7PJHfHl392Wzym168Wmq8vK5o7ShMAy5bMp5hiZjCxtD1gv97v2O9DT/e3s0asa
	 Zqq7rg8P294BB96MFS1Nwu7EiVFsn0k53UCHdvKFLxPzi/WSjpK9L6ocI1u0gH9D9wphe
	 mDJrc9L4+wsWK9N2Dt49JHAI1hJOfDtLesuPrWLvi1Z+ESoq/txGj5qcCXVNdGcrrdMyR
	 u6faO/zgx9vAVdO1gTbD4jqBP+aN0EKQyHHV1nOh3Xf8P36vHDUpZbZkGd9D16HGZ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FxhZ8dMN;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14F606A31C
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 12:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C14F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FxhZ8dMN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795783359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=69WYYzr2raKy4GZhRJJIx91GBcacgavIFPmAXCyscrM=;
	b=FxhZ8dMNRFJddkaS4emlkmU1scupNF+NqbLXfCh5JUks5P6wdtOPkzBHg0tsKia1AOEO1I
	D0YNkjoK6/5KnqjpU8aACQ171MG0uBidyaOReK19Xh2n5RwoL6xljf9eKM+7rBeuPCwj6l
	dOlEN031h6WB+DWN7KKeFFFR3xcCiYQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-dj5uarGMNfKO2ZauzWiKSQ-1; Fri, 27 Nov 2026 12:42:37 +0000
X-MC-Unique: dj5uarGMNfKO2ZauzWiKSQ-1
X-Mimecast-MFC-AGG-ID: dj5uarGMNfKO2ZauzWiKSQ_1795783356
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so67695125e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 04:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783356; x=1796388156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69WYYzr2raKy4GZhRJJIx91GBcacgavIFPmAXCyscrM=;
        b=ZILEd4k0AQcSbJ4V4IaBYw1AChls6VEawO6ry3eHKBkt2job7NQ4/RZh7dz8yjJeGs
         BPH7t4J2ZBxYwJhNAjAf7zHBhf92paYOslOHWb5bx/0fvet50W1WgDWL61ZaASlSUbaa
         fO6gKBFAZq/AUF6vPb9YHLDxM7pT6O1fcZ3buN+aRDJA1ltLB2xJfJGyhd71lFJhB+F+
         HhC5qSMemSaqp6Ql6QzYkR6SQ10ixp7t1XxBh0CiMZbHZTRMVOg0XXu08VtIYs3zP8oO
         hyW0Cu3CewEVp1fbnOcgIEZ8Esqg83VUJFkkvgUIebTTFVP7Tda4o6GBFkA5tnnXN6TJ
         R+Zg==
X-Forwarded-Encrypted: i=1; AL+hErGIQxAbSFATPZ1MzcofEbqSsXnM/HJV4VKaZGj6axiFBU0prlvDosAcSl5tIwIIwB47LngX7ncl/XY6uVmAfA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ylSsZE2pjcbrk7WUluYsmovKB0n8gKB7S98zROsnXyS0xq36z
	Za5v+u8MXPRdvdNliEr0wyRsc4dMSLXfXdjv1tRo64V0J1KtOawcyuc4NrvW93bD2V5FPIv3yAy
	McnAn/uyDtRiDXWFprfUFK+llOMWGi2ltRafxvTqH4T50YV3YnqUGx1UrUXedu8wq3NQirDcEqS
	F6
X-Gm-Gg: AZFdTZdQxYM6aFN9+VhpcFCcDtPkkjrw51MleyAGngGpEm2/6TBpw1CvB7fnn13vjA5
	SUnEWd4OZnUWJ6p7ToYGYBGV6jTZTAVEnakm/x1bxC6Os8lksLZF49aBPMT8qi+lCZDb3VdzCeX
	IuwNIeao/ND4F2phOMaUlSXzwV6XCLZVj8DTz1wJKjwVuqki2oYzqGrg9/pAbW4X5OSbT+dwlV0
	n29uZzk2MGM/OmrbqWwyIFsFTQrfWEONXSyU4NLujrJXJ9Km7Slf5Dtg7wbVx4V7Xul+6SPqzNh
	4CYhDXXb/2UzVqb/MKlwbQtd766xBnbv8Er36EE5ZTqJx9xcq9x8Tb9nVr+wZUfyH9QAEWQt0xL
	4/qMyK97/2N1I7nOhCT58hH3Kii6vZKTZfPD2Xhj3GZoSXo8Au4DIzMXXyBn1vZMZir9AUu4+xd
	NNJVTCRwLoZuggMykasUVp
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr568980005e9.6.1795783356047;
        Fri, 27 Nov 2026 04:42:36 -0800 (PST)
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr568979345e9.6.1795783355534;
        Fri, 27 Nov 2026 04:42:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1250929405e9.4.2026.11.27.04.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:42:35 -0800 (PST)
Message-ID: <1084ab13-d5c9-4154-b314-c7513b533c50@redhat.com>
Date: Fri, 27 Nov 2026 13:42:33 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panic: Simplify QR error correction exponent
 reduction
To: peder.bergan@gmail.com, Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261126-perf-drm-panic-qr-v1-0-51856937dc4d@gmail.com>
 <20261126-perf-drm-panic-qr-v1-3-51856937dc4d@gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20261126-perf-drm-panic-qr-v1-3-51856937dc4d@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tckVTNYRU90hqTKlY0EVjqiR7LnvmZYt-ZaF893HrFM_1795783356
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 17:53, Peder Bergan via B4 Relay wrote:
> From: Peder Bergan <peder.bergan@gmail.com>
> 
> Reed-Solomon error correction reduces the sum of two GF(256) exponents
> modulo 255 for each generator coefficient. Both exponents are below
> 255, so the sum needs at most one subtraction.
> 
> Use a conditional subtraction for the reduction. In the x86-64
> userspace benchmark, this replaces a multiply-and-shift sequence with
> a comparison and conditional moves. On top of the first two patches,
> the change saved about 32 us per version-40 encode with raw input and
> 31 us with a URL.

Thanks for your contribution.
This code is executed only once when a panic occurs, so optimizations 
are clearly not a priority.
But this series looks good, and keep the code simple.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
> ---
>   drivers/gpu/drm/drm_panic_helper_qr.rs | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_helper_qr.rs b/drivers/gpu/drm/drm_panic_helper_qr.rs
> index 1d96ae855052a..4ba2e3de5a6b6 100644
> --- a/drivers/gpu/drm/drm_panic_helper_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_helper_qr.rs
> @@ -569,7 +569,10 @@ fn error_code_for_blocks(&mut self, offset: usize, size: usize, ec_offset: usize
>               }
>               let log_lead_coeff = usize::from(LOG_TABLE[lead_coeff]);
>               for (u, &v) in tmp[i + 1..].iter_mut().zip(self.poly.iter()) {
> -                *u ^= EXP_TABLE[(usize::from(v) + log_lead_coeff) % 255];
> +                // Both exponents are below 255, so at most one subtraction is needed.
> +                let sum = usize::from(v) + log_lead_coeff;
> +                let index = if sum >= 255 { sum - 255 } else { sum };
> +                *u ^= EXP_TABLE[index];
>               }
>           }
>           self.data[ec_offset..ec_offset + self.ec_size]
> 

