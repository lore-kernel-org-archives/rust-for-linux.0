Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9921348866
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142079; cv=none; b=OQYxJgfOweWuh+GmAUvH3NEFFjElKjXSdqpvNRWofCQmcYgzOmg+04wCP5GZQOuX/pWjr6rPZ2R39MxlkmC7mZISUHr1ZhITjkgjTxMLPHJQ0yaaS5JeahMeQnY5PnksBveEdLE5MLvzLQo3JykyAxRVFqTOx9t2A1j5SejO0YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142079; c=relaxed/simple;
	bh=0RnBV/CSMLOaV+EgKiJKKgwV/1lMupxiJ036RFmnqC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIlPDjBYGNtmI7XaH4ITYTG2DzzCvpYPW5L2iUkPgZlMYv0yEzmynVmC/jOgFzKAKgnJLhmk9gBEQk5NBIaEurktF3TmsUZe0I/m6E4uK5GRMzdRoxT1nxyf8YEY5GYXSQTxOYryhJqU8NwRRVqMBpKvoAW16r2ASf/CxZ8L73Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j01yQBWh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j01yQBWh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ad135063so4846335e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 01:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778142076; x=1778746876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NoGIIFessO3NT0rwffhIFEtP+vlzNTwlsqHDmCLsgFc=;
        b=j01yQBWhtU6cqe13fPHKMN8nglOuGn/aP5silfWbGqfHGrxP8CAReYo14FmhM94NBj
         Le8mJBix2I7JBgB6+FO1+gtqVf4jfF2D4xOEx3fmOHvR5ZH7qUB6JV+47YAXumi402XC
         wKmJD8NFAyt43sfBE5MSoiyGssO/sZtmlVDu+qIU3rHZ35zjs9I8Zn2jrm/IYb7AtUIK
         WCZj5HzMD3rTiisG0KFX1nUGYNS2VZF8BbSdYVkZz/P6akDKhl33H+zVvnrOfVYqvz6c
         mRqImHPs6i1AGTwzUxSXQbiSbyUlB154krl405Ixk6ZVY/lveDNkEXBK+SKI8LDcporD
         h+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142076; x=1778746876;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoGIIFessO3NT0rwffhIFEtP+vlzNTwlsqHDmCLsgFc=;
        b=JxuH0WJQz04+RQ+MVDWkQcRTGUE8b5R+IJen2qAyM/jKL3ak2Huu3JvlKaIbZ7FHGW
         TQW+HlQL+iE05r7fGwLcyin1E7Y+hQnZVkCaZeEHtjF5i+vPCUFMBQih36m8zGRyb9UD
         uMgX3ONA9zWUMvI2yfjPqJfuZ42d2Oda7pWBaBJZJak4UUkdEMvl+hrErdVzd8DrBuZI
         lIy2FMMPiUa9ayDc4nDDvcqYrAIpPqmT/Z4n6yTAGxdHNw8UM+HF6KdodnBXg/xqwS2O
         T6a5K6VOKyfwVgWM0aWrJ7B9ZHKg9+//rWu4XwtW4UzJ0tSF+CvyW8u/cnSCY+fmcAxP
         19+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+bXU3k1nRP11GBjoOn8NI+YR5Cue1RmG57DrsXdwbTmJh+bNcZQNSHaFWE5hV+M5Try/cbfgjj3crarDOegw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHZAE01qC0ciE6bHe3P7GvfeJsPP3qpajRiY9rITx9gs304dd4
	Zl540CWGhtu9oc7ibyFwFsHpf0l8urdwtsBfI04dYA8pZq82NY4dTz82wQXWyDv5kEo=
X-Gm-Gg: AeBDiesgvo+3XmF7mTrPCKJbASPhIjxwltlCILdSNhxMcERVTroO9U7CAyC6tSa7Haw
	1mwsIXVD8Vdwk7ToBIPVPPCzg/Zi3RFwgzhVx/houtRXLC2dmpCbMAZYwLxKPK5BD03cha7P5S6
	nj1BqEEwNGzlbnlUWD7gOlxevEjxC63UoF9N2OaJHDvNEAzAfs5Bi7MTMJJHE0vR7Ga9miSk/UT
	Dfo601ZmcforrsBobkdGH2TeCC/w14KGyULwCj9tMXCbeBwTvjehHAoRADtgipdvtv+GzwEyTPf
	SvTGWzpSJ44qXuDOvA4/1ZTl2LmduTwEX38NkDlPEm64tP1I5eL24AdHn1gljrTgUQq+ahZWk7B
	W7LMkwfb6sKGF1d9C3zFVXWQO9CkVUsF0WgUP2e/+lb82D/7pZ4Hx16GW6zOD7EoPIllFGQk/gn
	NT79Us+6M9rFYTe80N7EWW5GkxFloKBi96lM9bgjb9w+Lzwg2nQ5mhpNiSnDLWqMIqncDXM7p0U
	TJm
X-Received: by 2002:a05:600c:1d18:b0:48a:8cb6:88b9 with SMTP id 5b1f17b1804b1-48e51f44621mr111361955e9.22.1778142067567;
        Thu, 07 May 2026 01:21:07 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538b26a3sm197726825e9.9.2026.05.07.01.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:21:07 -0700 (PDT)
Message-ID: <00dc061f-7a20-419e-a6f6-3bc7735c87ec@linaro.org>
Date: Thu, 7 May 2026 10:21:05 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] rust/helpers: add virtio.c
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
 <20260505-rust-virtio-v1-2-9563383909e4@pitsidianak.is>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260505-rust-virtio-v1-2-9563383909e4@pitsidianak.is>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/5/26 10:14, Manos Pitsidianakis wrote:
> Some internal kernel virtio API functions are inline macros, so define
> their symbols in a helper file.
> 
> Signed-off-by: Manos Pitsidianakis <manos@pitsidianak.is>
> ---
>   MAINTAINERS            |  6 ++++++
>   rust/helpers/helpers.c |  3 +++
>   rust/helpers/virtio.c  | 35 +++++++++++++++++++++++++++++++++++
>   3 files changed, 44 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
