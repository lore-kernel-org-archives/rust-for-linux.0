Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFC8155342
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 08:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896065; cv=none; b=B5qSA8t1qyxQ529vUrTf2uUK3LtFaBj6/WfWOflCy9Yxq3LrM4RERvJNKjDdv3aGWPJU4iyMHhvjkNmjnLVywapof8xsulYe3jXS16gBZeGeBt3cn5nDhbigL/hz+lw8LQWfJnIiCThaKegIQgD0qMnniZsBFGq7faZJgldrBbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896065; c=relaxed/simple;
	bh=6gnTFO1vIDG9cuD06qbAgaUIu2KYjppFxFWbpu5YnOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvn8Fjqc7KOl5RvDz4VrSD0JMe5r4Jq4w9E4i9G5wfs9qLSbaSst+f+YY7EFpFeAivjcAvePLs5gEIY+DzzpgHBPQdTyUcaCkH0oBpxXBeJfbpPFF/8r2WE5nw+lVPtM36GQxWXnkdbPHqgZHcpusouwUAGHI92LsYLs8aO//lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VluBzpl4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VluBzpl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728896062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AAPK65oHQu3J50zOzXdJ8U1r5A0VvZcKfNK05jHZJ2c=;
	b=VluBzpl49aoyba/l6gk/2Cb2icpm2DGx6ahbcdS7oZdz8RCAuxw5FFeXcfhOoxAGiSOBfi
	RiOvpiTpO/fZw634HKHdGS2jTLDJ9CGUsRMOWF7DkD1Xtxn2yyupjweleJuZLTcxI5j3t+
	Pw3h5YnF5rZtp6VXG/90nXx99JDDkQc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-VXPZwXmKPkOdq9lC-BiJtQ-1; Mon, 14 Oct 2024 04:54:21 -0400
X-MC-Unique: VXPZwXmKPkOdq9lC-BiJtQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43123d8a33dso14955075e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 01:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896060; x=1729500860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAPK65oHQu3J50zOzXdJ8U1r5A0VvZcKfNK05jHZJ2c=;
        b=LRv88eGeXXyS3RojFiYh+PQvqBNKWQe0dMGO1k5aDcvUP28t9zJamgN7Zp9Xi4Itpz
         XGi6SGD9/VyFVNpnre/ZEPUVidKasVZ+0n8nBOt9F42oKoxG5MqHLVHOP/DwBcVsn1ym
         RUV8apHHjCm03Aujq9D1rkXb2S9wfJHOBjqNW5IDfgdXpsKFOHagg/cXuT/52Yw/5omv
         hghys4Xb4yVcyxJXl6h9oYif59b/K1qxDS9jP2uO+clolNLQMyu79BLRb0/xN8vDcHai
         gwT8luYEenA9iblaGyN/hKPz7o/QIfYR82D66C1Gfm7kGFrC63Xa3OaIlAwRooN2yzfI
         0G1w==
X-Forwarded-Encrypted: i=1; AJvYcCXlehuUTjpfPA88ehbsv83H4j7HXbru4xU1twAEcMKQcSbhIc8PfETo8kYH6IHvM96YKmxanoKvBmcJyEbx+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+NZdXJWLi2/1osdt5DCTN2QdbKAO5hdYD/eqkWJ+QphlU3gz
	YRIMyt/3Yq6WsP4YpqnqBniN/uYbFTbLQIY3SXhRWRgFp9o+QLoF/yi37XQJAA9gqE9Yc5hCEjN
	DtdDsitCBI8DKWO5JA8hsoOxFbpPNgDHbzEFiyf7i9rzbx8BiNijl/cDZD22fqKZm
X-Received: by 2002:a05:600c:190d:b0:430:53f6:f20b with SMTP id 5b1f17b1804b1-4311df56f1amr97192105e9.23.1728896060197;
        Mon, 14 Oct 2024 01:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEo+wwhLLKeEcT9mtsJSQ+F8zv3iqBMb6ip3yhfZKGYz75i1oN0Ri8sKd/qmDLPCYq8GV+9Q==
X-Received: by 2002:a05:600c:190d:b0:430:53f6:f20b with SMTP id 5b1f17b1804b1-4311df56f1amr97191725e9.23.1728896059688;
        Mon, 14 Oct 2024 01:54:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf45df4sm146139445e9.13.2024.10.14.01.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 01:54:19 -0700 (PDT)
Message-ID: <13f6f904-bd2c-4b0a-914e-0715d22a7ff5@redhat.com>
Date: Mon, 14 Oct 2024 10:54:18 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/panic: allow verbose boolean for clarity
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
 <20241012075312.16342-6-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-6-witcher@wiredspace.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2024 09:52, Thomas Böhler wrote:
> Clippy complains about a non-minimal boolean expression with
> `nonminimal_bool`:
> 
>      error: this boolean expression can be simplified
>         --> drivers/gpu/drm/drm_panic_qr.rs:722:9
>          |
>      722 |         (x < 8 && y < 8) || (x < 8 && y >= end) || (x >= end && y < 8)
>          |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#nonminimal_bool
>          = note: `-D clippy::nonminimal-bool` implied by `-D warnings`
>          = help: to override `-D warnings` add `#[allow(clippy::nonminimal_bool)]`
>      help: try
>          |
>      722 |         !(x >= 8 || y >= 8 && y < end) || (x >= end && y < 8)
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      722 |         (y >= end || y < 8) && x < 8 || (x >= end && y < 8)
>          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> While this can be useful in a lot of cases, it isn't here because the
> line expresses clearly what the intention is. Simplifying the expression
> means losing clarity, so opt-out of this lint for the offending line.

Thanks, I also prefer to keep the non-minimal boolean.

With the suggestions from Alice Ryhl to not introduce a return, and use 
expect:

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 58c46f366f76..226107c02679 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -719,7 +719,8 @@ fn draw_finders(&mut self) {
>   
>       fn is_finder(&self, x: u8, y: u8) -> bool {
>           let end = self.width - 8;
> -        (x < 8 && y < 8) || (x < 8 && y >= end) || (x >= end && y < 8)
> +        #[allow(clippy::nonminimal_bool)]
> +        return (x < 8 && y < 8) || (x < 8 && y >= end) || (x >= end && y < 8);
>       }
>   
>       // Alignment pattern: 5x5 squares in a grid.

