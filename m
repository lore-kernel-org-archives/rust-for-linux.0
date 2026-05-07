Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2367B31F98C
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142203; cv=none; b=hJvAZjxi2Xp5r7kqnzEO6p245v9OVi3AFZnRqYcCcgLjvenw4LcIwf6Qqi0010ZXJ4nFghJqi8VndZgWPfvfYHlgFmlosJC6mXarL0tiAXbGkgYZ483+lQcKxGSGUKN6L8BPUOfVU1OTCqiBa4ELsoqs1g/gK+cW8oL6myKfXsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142203; c=relaxed/simple;
	bh=JDVCYHU18Qkhl1HIRuaPMbEjsekzZ5adC/txsAiaRMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQCJRoMR5or8IXtjbkdDkyKRgsrmgVr8an1Mo88oU2ko2UGkf41zxmQ6fI0K/+b4Jw85Rr1c8+JXwOlAGZeUBM8MoI+pwAt6EJAVrpsTq/S996uMYC26Q3yEkPiaqMh4fxr/SGSSgflzEy/jlorX1x6CK1+Ilqu6Ffeel1Johvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3B6Ek8Q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3B6Ek8Q"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so4700775e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 01:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778142200; x=1778747000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oCxMiF1tji8828bCn6RZo8UJQ40dDz/+KsCaov+6nXE=;
        b=A3B6Ek8QgEaeR99ZDzJJBchlODNcYnZSh2r3u8WB0bRskBkjW0s1MEZdspbhl+jikm
         op7hH9wjUnNjEOx/Jp+cw651z2qv7VjoeNV0qwEgRqr2D7OtYKhCYnquTbFa94STleim
         vgZEaOpBC5q+jfr2bE+ChLNwyOPjPPSkw4BGpa25I3sonWkJ2KzNbHgyzIdgxvegU4QZ
         5Lre9YtRNJnu/1/J5E0a7QPE3K+ADZkih00EOQJkxEfVhEsLV+A5YJD9BUc6RnYLi/De
         GHlEmPHssVGMbmKrlSiWEoRZCwmNts1nCyCwPf26OkNrBblnMDst6xZ5afJuktlLJrQt
         lnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142200; x=1778747000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCxMiF1tji8828bCn6RZo8UJQ40dDz/+KsCaov+6nXE=;
        b=DWptlTsz2qsiuYWTiCWxbPHO9YVAiqT4bhl4k2rOh8Wg2oscBtovQ3TVCGVz+UTA14
         sOZUU8mM3KcjkbF4UEfSbuwWty1QdT6sVAK+685sG2/ZeqRuzp4kv3fHtBg9LRAQx0Sy
         3A5holaSSHS0BHlLQSquZLuAQObBxgZJUqW8jqXZtu/9OBAt7Of1Kt0blp1TsV8q+e35
         oZcgV/dqFLOiIS5V5t6ANbEDIeU5eybJwg1R/ikRrRG6h3yXgl7eyvNbRR3Z4lQkaXv3
         4QTTWp2guc0QaBHFdUk6znIshZ9csA0sDUinsSrr6TYjmv53zqIb1azjtL8oa+X+bFqa
         y7ng==
X-Forwarded-Encrypted: i=1; AFNElJ/YIm/kGQ33zibr6uKXrvsRsD9tOJJP4PhacJuQ3dziJ5l3XVYrSPpfVrhFuUPTNRhY7GfxPLQZWi9ueH+tEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt6jsexlEQmHk/NyM63LqnQss6TFLUgWsKLE4UiIbJQPBremaP
	BbpSfI+4CrP0BXQhXi77JNtRiX93Sp6MmkEGhqOqQcXI3HATx/tk7t61Tm9cVsZAFw8=
X-Gm-Gg: AeBDiesK296Lvqb2tTWf2b0pR29/tzjncjhlqyM0QYuiNfG6fgnrAZw2s3o84ZwFQC2
	W714Uh5kqC2lS6EIFboDRdqfbpEoJUB6j8zBgdiNrbpJlQL/8X1m9bMfpyUMJmc9XH3OVHOtnvD
	Q6zFBonoBq/oER26ZInW/Ky1P3No6p6oOjTwywePA/dliMdWFqUA3sRP//PztkDU0j+SJ9XScXL
	vduoJoA1yhK3rZfvs41MTbG/d9zmEo/5tgXSYq2sYlh+Si/zFmxfr/OMWIAcZRs25iWvQ7cXd9w
	IKZk4Uz4xfJxoGi3PSOhNnF7x4pP9QkegZYCVCUcxJFixtlBqre15KtC8qtZh8PnoIEQhMkt+10
	rcJiGJ/UJMiiD32aZwsF0Ihlm85uLTNPgYZj9H5JjJa2obLV074h7uRrV6oo7BH9r41O5wZvhVT
	NvMUo72di8n/yhYqBiJauGvkdfxUoQgZnkXKC9ma3arHtDXWhuSgtI4WIGjfM5oaDgAWzvWRcj/
	OEZ
X-Received: by 2002:a05:600c:3548:b0:48a:7aad:4425 with SMTP id 5b1f17b1804b1-48e51e097fcmr111459975e9.3.1778142195443;
        Thu, 07 May 2026 01:23:15 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm18266867f8f.32.2026.05.07.01.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:23:14 -0700 (PDT)
Message-ID: <71bf7fa1-f435-43bb-a01f-13744484195e@linaro.org>
Date: Thu, 7 May 2026 10:23:13 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/6] rust/scatterlist: add SGEntry::init_one
Content-Language: en-US
To: Manos Pitsidianakis <manos@pitsidianak.is>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Hilber <peter.hilber@oss.qualcomm.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Viresh Kumar
 <viresh.kumar@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260505-rust-virtio-v1-0-9563383909e4@pitsidianak.is>
 <20260505-rust-virtio-v1-4-9563383909e4@pitsidianak.is>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260505-rust-virtio-v1-4-9563383909e4@pitsidianak.is>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/5/26 10:14, Manos Pitsidianakis wrote:
> Add a method to allow creation of an SGEntry with borrowed data.
> Analogous of `sg_init_one` in C.
> 
> Signed-off-by: Manos Pitsidianakis <manos@pitsidianak.is>
> ---
>   rust/kernel/scatterlist.rs | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
