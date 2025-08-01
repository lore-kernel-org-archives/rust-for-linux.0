Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E7D1B95B
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754038361; cv=none; b=sHuQiIc7M1k0egJ1RSfgd/dNgDX1/6mp3zbGYyLbpzjRMat0wqJRQ4dQ3Lng6V6L2bizkfiizrCUYRcTdzp9qEG5qCT3vQ8dYGTPYA3rNpaXcWbbMR2jtvWfMdr1XvX9tuyD5hZAXnzkzSn/VhIInsyqyi31GYjXQjreHqvWLQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754038361; c=relaxed/simple;
	bh=2l92tyRvQhQX3roU1hdjwi9EdFp1+p3YLuWnzfoTYFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dAwIkWLPU7m4LAJoZfhjgE3zN8VnhhfPaDms6D0dc8XGsF6TEtA+lK8a5qpXVbzsQRs3UwkTlbWmTWtvY9LIl7eiw99nn1oEmfujT9asdoaYQ2+kUDwa+eZWUYyA0hBixPpElUPcO5HVAZSS6INoBtHLMsPSC/Qb7nMeZkzzT9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ajDIQJft; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ajDIQJft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754038358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3ut2IZtB01vlovnDAd6xUWzFbNv5v2C3DILCLpVpw0=;
	b=ajDIQJftgUcdesngDH1xZcpGSEgWMhmzmfNQr4OxMD9m2eA1NRo8u/QRw67SjRBXg/u0OG
	DGIfx6n1DlpLsAwWySEsVgFyKcldneT1xStnLrh97v815EfzOs5/Tdrl6A/pRsoDsHJhcA
	V/mP+MFOhGNTTs8NEU8MEgKzQEe5f9c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-l4rnubWBNl6hrDrso5rAjw-1; Fri, 01 Aug 2025 04:52:37 -0400
X-MC-Unique: l4rnubWBNl6hrDrso5rAjw-1
X-Mimecast-MFC-AGG-ID: l4rnubWBNl6hrDrso5rAjw_1754038356
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b81e16c17dso280681f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Aug 2025 01:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754038356; x=1754643156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3ut2IZtB01vlovnDAd6xUWzFbNv5v2C3DILCLpVpw0=;
        b=SN5jdx16SC62Hi9It+4y3HJjD2KQBJ6mp40MvQ9R6CFXR+crvKnw4aMk93/zGH5/3k
         F6Ijci1rdUoip/D/+jfeLV49eqVm8wRv3+hnv+C+tGMv8J8f348EE43YhevteZS71ntu
         wOHmXj58yf117G5KGnXuAefhaAq8gRpfMYMeM4S5DUNVvYoTdWlnUnNVkIVEMy9nG1+m
         FL5mjD/8jwToRonIDEsDc7dTcL5q4mdITXUOGWgp4rYXCsikUbXffogvGytFlIshqck2
         GwOY8Mm8zF60iEALj0WnpMixLh0UjFzHtBjX9CF7BPIBMJRxI31gZBYA3ggzf5aZy3Vw
         ivvw==
X-Forwarded-Encrypted: i=1; AJvYcCUmZ1+6M5R9WxCOEeWjbkPMLyfpGx43j65Yt/31W0crP85YX7Jt4P7rhrE1PQpTHvOhCpiv6ZwhQLWsM94cHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSA9mz6PK/mnCtjddL4ryvOhtWoXIBWmVCvxBkeCei5Q2j94Vw
	+wYi0wpRnnvY4Ol/6nzFPPcOYDIb7SZqP79W0GvW5oHUl49SKgw/spHkdLpcINbS1CDQaYPZUdz
	6mC3I5rcNccb4O1r3/8Dmby9acDzcnql44FVxEGUTCFco43bGbcrF4+UvqU1v6binzfbn
X-Gm-Gg: ASbGnctqcwe18eD1Eg92Q84UpO1bztm98FuuaVUb57bAYKJvCQC0kQ3eARxNq0DPphv
	y/BCxSeye9fRoWmOsRCIrcWl79nhpM8wE8I34fu4jaUQtMMInxxzqD1oLo6jg8OHJEnltXbD4tw
	hKpThXP3WbHzBbBUEoQMXGdUdzAOXFJoeTiZyzEgNLqXVIPlbxbs9iLDmOqqr4ZwGpRbwR0nUrj
	sAHmYKuTFJJnb7YSr76DaIRAzPOpN1XQ1zx/VVW31wEqk+3LGWSbV4sWpDHt1VrnYwRngW0/VYy
	beJfF1CQpT5Yfne+o/n1EM2vI8vcO52w3ztH7WSWx3qA30SQ3NlnCDYZHD1++4C2oLKKRm57IUv
	35VA=
X-Received: by 2002:a05:6000:2481:b0:3b8:bb8b:6b05 with SMTP id ffacd0b85a97d-3b8bb8b6deemr3637775f8f.29.1754038355804;
        Fri, 01 Aug 2025 01:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0SO4q2RvFPtgA+PGMdbAXShTVcEjLgx7m1c3m1LKK7FMUDdGk4NLVg7RcdXJk4nSy5WynYA==
X-Received: by 2002:a05:6000:2481:b0:3b8:bb8b:6b05 with SMTP id ffacd0b85a97d-3b8bb8b6deemr3637740f8f.29.1754038355055;
        Fri, 01 Aug 2025 01:52:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db? ([2a01:e0a:d5:a000:d252:5640:545:41db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4533e6sm5323520f8f.35.2025.08.01.01.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 01:52:34 -0700 (PDT)
Message-ID: <b04db6eb-03aa-43bc-bc09-4192e2a021b8@redhat.com>
Date: Fri, 1 Aug 2025 10:52:33 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panic: Add a u64 divide by 10 for arm32
To: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250627123854.921704-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250627123854.921704-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qINxI-LBpfw1PpSneVTRa2PVYafVjdaR62GRPIo6LXg_1754038356
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 14:38, Jocelyn Falempe wrote:
> On 32bits ARM, u64 divided by a constant is not optimized to a
> multiply by inverse by the compiler [1].
> So do the multiply by inverse explicitly for this architecture.

Gentle ping.


Best regards,

-- 

Jocelyn

> 
> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index dd55b1cb764d..774a17de4f2f 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -381,6 +381,26 @@ struct DecFifo {
>       len: usize,
>   }
>   
> +// On arm32 architecture, dividing an `u64` by a constant will generate a call
> +// to `__aeabi_uldivmod` which is not present in the kernel.
> +// So use the multiply by inverse method for this architecture.
> +fn div10(val: u64) -> u64 {
> +    if cfg!(target_arch = "arm") {
> +        let val_h = val >> 32;
> +        let val_l = val & 0xFFFFFFFF;
> +        let b_h: u64 = 0x66666666;
> +        let b_l: u64 = 0x66666667;
> +
> +        let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
> +        let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
> +        let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
> +
> +        tmp3 >> 2
> +    } else {
> +        val / 10
> +    }
> +}
> +
>   impl DecFifo {
>       fn push(&mut self, data: u64, len: usize) {
>           let mut chunk = data;
> @@ -389,7 +409,7 @@ fn push(&mut self, data: u64, len: usize) {
>           }
>           for i in 0..len {
>               self.decimals[i] = (chunk % 10) as u8;
> -            chunk /= 10;
> +            chunk = div10(chunk);
>           }
>           self.len += len;
>       }
> 
> base-commit: 3529cb5ab16b4f1f8bbc31dc39a1076a94bd1e38

