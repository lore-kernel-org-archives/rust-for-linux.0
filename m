Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D1C19E97C
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733785523; cv=none; b=clZCAbfiufM8CkmJKvL8kaQ0RYJEsM2BK5lKARI0VH9Jjo8jyyJBGFWVLOOpxX9rvNozrUtX1w+xLPeg1GopzdyFgszo9NlqTp4uCDr4docI13aOajJkyGICLHe3cczO1nwi1qInB1braoijTbjD9wadfHTfwMPedktWNtsfxd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733785523; c=relaxed/simple;
	bh=E2wMVt4XnzSAoCFwFJpocVejZtumHBk9+rnpvzMGxW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSp2JeQDMNFVyJbmXboWvgtk4iUwCJWuWK3aSucslVyImuXnZ0+CbtqNVJY9hsbSI8eweQFy3DjURtogSduBSJKDtNO65/bevGoDrznJmdzgYVCfHqz/sfvAp35C6pTawZrNzeIXnNlXE/Tor51JY3UnYweX9f6x28JWCxxz374=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XvLtqUXn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XvLtqUXn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733785520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rtXPjJ/UW99vVDZpFTpb2RZPeH7PKMqMj5zaKL4gx1k=;
	b=XvLtqUXn6BjsXb+cYRbcitxs0LFn/xinknuw7IsVp4XjBxhv3KlJahOtrZxBklKqeaVhm3
	+OFkm/ol080fqQ7zaRZUsASXyOSKXzujafIdQdu3+k3UWHQnFmjcQmQdIjknYnS6XhPwMO
	RlGTmrtwUyX2y6kDSN9kamruYHc2DOU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-7vfrU22OPjultL2_Xxr9yA-1; Mon, 09 Dec 2024 18:05:17 -0500
X-MC-Unique: 7vfrU22OPjultL2_Xxr9yA-1
X-Mimecast-MFC-AGG-ID: 7vfrU22OPjultL2_Xxr9yA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-434e8beee61so12529335e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Dec 2024 15:05:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733785515; x=1734390315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rtXPjJ/UW99vVDZpFTpb2RZPeH7PKMqMj5zaKL4gx1k=;
        b=wGY1BLnHKO1vFS6n64x2XXHGlalMRkiyknZWAVkYZPiqkLkfC412/HFy+JgbDFg+Ys
         4m0Kung4YHdH4uFYTwcfLGs0kyUjSFjxm4tSBObO2BSAE50Z+/Cht1HsP+7qr1dL+KwZ
         qWALHaaEO0dtyJyYgedC/nPI2SJwLUhWNi00RSdTVvW9Rj9T3pYvpQVxe1pAlytRiOy3
         hGcf8LRCN+XfqQKVOGGYs3rryznHqzBpExorVtrypxl3XdaOyzH5HBItPYEzuUgUXyNw
         tyZkdj4bkPFL5LX8j2N7FkpsTUv9OMzYGkDpqS33qqatin1PUdhm/EUq4pj84uClEV5Q
         bNAg==
X-Forwarded-Encrypted: i=1; AJvYcCUZocQiDyXvVoBpJP+NCHc6baDPLnOD/ghyBcdq+muyIFphJuARuUTDhbHUoZeyXCdnVmQtNfkGJp3aeT1wow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6NsngL/TBm+6+eIDPec7cr7j2FVGRaCtU58vw8wkcjgi6rWmP
	5lUf/lPJZSFIQawjfMPQcp3MlrIKWshlPOsavxS1sjgCoZ38BW+LAlIBaAiIzvOu76dcqmF/kVc
	f5YzxTDXazTk1AHmG3CbsUeyldMro4fAjoduHyuxd/sIsASYvGvJqlX5fOxUQl6B+
X-Gm-Gg: ASbGncvDt+UD/qnD0tLWZwju943zlxhhiIFoUu1e/c6OcIPxhCTRGH652LDghb1E3HK
	CajhHniIzkMeuoOrEh1RecpMd+txqd+h6TQNVSZ3Ngqn6eRJidYJdB6UuIcS0k6g6UtinGsi1A1
	hhoUTPD0dOrz4kbbB/2wZqPw1LeqLX4xEAS1Y9Z0QnXXN81DqtjSEN/hYuPAno4W7dYZ/m5G7db
	Yds5w6uv3NeWMHkmPKL/DZvEKM86hiMPyMau5upt5vIv34+leHWJC5XVqv7J6o6zcO+Z86jzNh8
	UEbpSG3AVFM7AD6M9g==
X-Received: by 2002:a05:600c:18a6:b0:434:ea1a:e30c with SMTP id 5b1f17b1804b1-435021d9c95mr8234705e9.13.1733785515309;
        Mon, 09 Dec 2024 15:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErGKM+mO4OjrHPaFMSgaVoG1GHOIII5oaFReyZQhrk1MzggllJFKQWOp6TcUYxwWwXNWck1A==
X-Received: by 2002:a05:600c:18a6:b0:434:ea1a:e30c with SMTP id 5b1f17b1804b1-435021d9c95mr8234565e9.13.1733785514969;
        Mon, 09 Dec 2024 15:05:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38636e05568sm8337911f8f.39.2024.12.09.15.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 15:05:13 -0800 (PST)
Message-ID: <e544c1c7-8b00-46d4-8d13-1303fd88dca3@redhat.com>
Date: Tue, 10 Dec 2024 00:05:11 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: remove spurious empty line to clean warning
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, stable@vger.kernel.org
References: <20241125233332.697497-1-ojeda@kernel.org>
 <fe2a253c-4b2f-4cb3-b58d-66192044555f@redhat.com>
 <CANiq72=PB=r5UV_ekNGV+yewa7tHic8Gs9RTQo=YcB-Lu_nzNQ@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72=PB=r5UV_ekNGV+yewa7tHic8Gs9RTQo=YcB-Lu_nzNQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QbVIPsEXOwkBOBh0EaLamTI28bDiStUMefn6T5YaFQI_1733785515
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/12/2024 22:05, Miguel Ojeda wrote:
> On Tue, Nov 26, 2024 at 10:04 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> Thanks for this patch, it looks good to me.
>>
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Thanks Jocelyn. I thought DRM would pick this one -- should I pick it
> through rust-fixes?

You can merge it through rust-fixes. I have another patch [1] under 
review that touches this file, but it shouldn't conflict, as the changes 
are far from this line.

How do you test clippy, so I can check I won't introduce another warning 
with this series?

[1]: https://patchwork.freedesktop.org/series/142175/

Best regards,

> 
> Cheers,
> Miguel
> 

