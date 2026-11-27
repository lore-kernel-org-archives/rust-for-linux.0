Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783331;
	b=b/LXFCfO/n1JDcFX+K0YLoOcYBrA1oS88KgZSC+Oe57m9GFucNyMk09k7YcYn0PUn6fJ
	 7axno0PEbhj2Z0XsEuYvqIOLIyPxdjatlionAP1JPMXI97aDIcOjBJ4GN18f/ZXoZbrlo
	 +/REKnEfT6VZ03ot558GR7J8KWW6HDzHqnGLtrcYFDMr28EFPgTWmxWzA2K3+3MuLWx7G
	 CJqNpLqgBrcMY47sPBXz4YbbRffS6wVvvdFeH+663eGR0B+KrE3DJ5mJwfwRjmb/R4gJm
	 dmQ5sX3/TsNV2PunS+3HULJin9wdHu+kZXLImW3A7/G3P8GWvxDuSQnRJKJsvJeJA5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783331;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=VtKiZFj6Ka7y5JG1hKNNq0d21tsqo0FM1O+R6HYWx5Q=;
	b=tNnOLW4XPKFCLQuMiGeZRgqR2ZtThzsiQBmuPiZvMsXToyMBkrSUo+rQV1ancCC/qxnw
	 uVKhRJ9gINHplnGJErIO2BW/FLII9WemeO7DLcpvtRQ5lCjgk4y7MjIFu1tCPt/8GAcsJ
	 bfqXOlfxKpGtheiQGb/NKVU4jYmWa4JmCaqRvl94pDBU1BXpNvUAHpXFOHYvb6P2ZmKpp
	 c9yR/rxpgQuxTMnHGhlzPctfeMnlrNG8YGO1r18HIz+S3kSL2ZiYDkyhxtrUbTQctlw18
	 r0eyKI+fyh4NB8/88ls5+tpvSGvzEd9QtTgGP0iq3jPSvTdNkq6ZUxmdGE1jrAR2c8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Ucp/CYJo";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8133B606A31E
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 12:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8133B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ucp/CYJo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795783329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtKiZFj6Ka7y5JG1hKNNq0d21tsqo0FM1O+R6HYWx5Q=;
	b=Ucp/CYJoG914xB7QGs+JeCmoNpHaTEEFVO/ApntzTbYgKQdFcmJi4k/dOikNajXgljyf7v
	buyeXeokZpKdFUtYUum3hKEmRcxWn3SMYg7l8uxkLQkWoMEhzzcrvjARH3ElleRtwB32nM
	5h9DH41MK1yCg+GoRMRalL7HMPu/5eM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-RtBOOvAGNOKxNBpfPF5NDw-1; Fri, 27 Nov 2026 12:42:07 +0000
X-MC-Unique: RtBOOvAGNOKxNBpfPF5NDw-1
X-Mimecast-MFC-AGG-ID: RtBOOvAGNOKxNBpfPF5NDw_1795783327
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso70442615e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 04:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783327; x=1796388127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtKiZFj6Ka7y5JG1hKNNq0d21tsqo0FM1O+R6HYWx5Q=;
        b=zhEuka+rfLxZWrkFmpIUWoeNlHXJ//FeX6Scca2Se1I7N7r/+NtypRRgb+v6DCtyPo
         jVB4siUN3XUaxOIAvEM4Ti6aOVv9VfGJeh0pgNPefGKCdmvrJ0n0gPQOQ1svnvKcijby
         O1mRU5ZQiUUdA9h2u7XhRkKMdAcE+6k5UExonj7iNxLB85tsy1HhO7zxNE3OTjzMbvel
         zaYrhSXkkBgajX7+FTKJZQQ160O296c3obpFSTMMr34xVrFtj1B5A0x38Np7toIJcush
         8x+TRdrIAfc6GY/ni+P9n2+pl5Cf0SIpa5Up1RsjOHinMVaTmU46g/DQDK86GANWe8Ox
         dL5w==
X-Forwarded-Encrypted: i=1; AL+hErGQvASZxxtS8vEvBdTJB/GaEacGlefylhiAAx4ZYkNs0lBXUTZDhhJVIhEAHCBZcvbKR5FchTOwltcKG84FaQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ujR8drI1YYGB0hM5+ftdaGYa+/xyQvmMKw/kZReWsMLYnAp77
	q76VNJOleFZ0mvTUnOVO6zReKY83hqUy+tmBQpX4N1RhG6dWKIf/SKsLldVQdnb6dQKq2V+5Ide
	NXw2uTc3tWpXJPOm4F6iRaRzF2sZBDKZmRagdQgdnamn92Rh/0j9K5U6zNVAZKt1bTiuS
X-Gm-Gg: AZFdTZd0ziUXlL2e2u9RlP+B/G5jcl2x9vCWzjTWlaPEQlvC5H5UnFRlJfqcz6LPeqi
	Ebjezsct+qIzYT58IrgxwWgWd+apmqXEGiTXKJST98si/PxQQ5PhRXWPlvIU43ormQBIGzvVat5
	idXR69KuPSWBxCsn6h3gmA+Sd8JCuGLm7/RuSR7l2l8iI9TBiJA+Cxd0DcrGGMqtBHQfgQqauEw
	Ip5Tri15Pk5mjJwsPMnEFLMA31vcKFWvFGkBJtyoOUrN3em5Tqd6YkTqZltR5VKP6O1wFesekIz
	DAc9yciJ62kFnfpeoMEYKf78tw7sfJ7ZYoYeNvkFrfOX4eu6t3vS0vpfXzS6aiaGcyQ4pQRdCG3
	/no4xDLZJw5LQKqe3B00as84TNwK3wF1MFoYCcp7MwobkOCgi7bto6EgEGxOhSbDlgexG4VQHPU
	Rx0PIuT89UHkZH/BdQn0Ca
X-Received: by 2002:a05:600c:4e02:b0:4bb:8636:dd7d with SMTP id 5b1f17b1804b1-4bb88817f77mr489726685e9.24.1795783326715;
        Fri, 27 Nov 2026 04:42:06 -0800 (PST)
X-Received: by 2002:a05:600c:4e02:b0:4bb:8636:dd7d with SMTP id 5b1f17b1804b1-4bb88817f77mr489726405e9.24.1795783326379;
        Fri, 27 Nov 2026 04:42:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm593732225e9.2.2026.11.27.04.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:42:06 -0800 (PST)
Message-ID: <4ccdd654-f8af-4e51-a8ac-ae7f68f0db07@redhat.com>
Date: Fri, 27 Nov 2026 13:42:04 +0100
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
Subject: Re: [PATCH 2/3] drm/panic: Apply the QR mask while drawing data
 modules
To: peder.bergan@gmail.com, Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261126-perf-drm-panic-qr-v1-0-51856937dc4d@gmail.com>
 <20261126-perf-drm-panic-qr-v1-2-51856937dc4d@gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20261126-perf-drm-panic-qr-v1-2-51856937dc4d@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OU61kahW3PevpDgA5F9YkhYiOMXqkqGjBO1enMdfH0A_1795783327
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 17:53, Peder Bergan via B4 Relay wrote:
> From: Peder Bergan <peder.bergan@gmail.com>
> 
> After placing data and remainder modules, apply_mask() scans the whole
> image to invert the unreserved modules covered by checkerboard mask 0.
> Data placement already visits every unreserved module once.
> 
> Apply mask 0 while drawing each data module and each zero-valued
> remainder module. This removes the separate image pass and its buffer
> read-modify-write operations. The format information still advertises
> mask 0.
> 
Thanks for your contribution.
This code is executed only once when a panic occurs, so optimizations 
are clearly not a priority.
But this series looks good, and keeps the code simple.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
> ---
>   drivers/gpu/drm/drm_panic_helper_qr.rs | 35 +++++++++++-----------------------
>   1 file changed, 11 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_helper_qr.rs b/drivers/gpu/drm/drm_panic_helper_qr.rs
> index c6ed395c05bd2..1d96ae855052a 100644
> --- a/drivers/gpu/drm/drm_panic_helper_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_helper_qr.rs
> @@ -691,12 +691,6 @@ fn set(&mut self, x: u8, y: u8) {
>           self.data[off] = v;
>       }
>   
> -    /// Invert a module color.
> -    fn xor(&mut self, x: u8, y: u8) {
> -        let off = y as usize * self.stride as usize + x as usize / 8;
> -        self.data[off] ^= 0x80 >> (x % 8);
> -    }
> -
>       /// Draw a light square at (x, y) top left corner.
>       fn draw_square(&mut self, x: u8, y: u8, size: u8) {
>           for k in 0..size {
> @@ -864,37 +858,31 @@ fn next_available(&self, x: u8, y: u8) -> (u8, u8) {
>           (x, y)
>       }
>   
> +    /// Draw an unreserved module with checkerboard mask 0.
> +    fn draw_data_module(&mut self, x: u8, y: u8, bit: bool) {
> +        let invert = (x ^ y) % 2 == 0;
> +        if !(bit ^ invert) {
> +            self.set(x, y);
> +        }
> +    }
> +
>       fn draw_data(&mut self, data: impl Iterator<Item = u8>) {
>           let (mut x, mut y) = (self.width - 1, self.width - 1);
>           for byte in data {
>               for s in 0..8 {
> -                if byte & (0x80 >> s) == 0 {
> -                    self.set(x, y);
> -                }
> +                self.draw_data_module(x, y, byte & (0x80 >> s) != 0);
>                   (x, y) = self.next_available(x, y);
>               }
>           }
> -        // Set the remaining modules (0, 3 or 7 depending on version).
> -        // because 0 correspond to a light module.
> +        // The remaining modules encode zero before masking.
>           while !self.is_last(x, y) {
>               if !self.is_reserved(x, y) {
> -                self.set(x, y);
> +                self.draw_data_module(x, y, false);
>               }
>               (x, y) = self.next(x, y);
>           }
>       }
>   
> -    /// Apply checkerboard mask to all non-reserved modules.
> -    fn apply_mask(&mut self) {
> -        for x in 0..self.width {
> -            for y in 0..self.width {
> -                if (x ^ y) % 2 == 0 && !self.is_reserved(x, y) {
> -                    self.xor(x, y);
> -                }
> -            }
> -        }
> -    }
> -
>       /// Draw the QR code with the provided data iterator.
>       fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>           // First clear the table, as it may have already some data.
> @@ -905,7 +893,6 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>           self.draw_version_info();
>           self.draw_data(data);
>           self.draw_maskinfo();
> -        self.apply_mask();
>       }
>   }
>   
> 

