Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158503;
	b=KTaQ9FZX77PqSWcZeOWAaKdrxdKUEMshIJJiNtFegfI+4v8qGJDAeu/61Q6Hb4lqkBl2
	 ep7KX5pz49Zv5nPfIaa53Ji1dN8pvtPSA+68JvqiQTxhhdLTjf65Chfh3stGg8feHEH5O
	 9BXAJ3A3428UKTiS+1qlRKvjGB5HxrGiy+5URvO4nWDTGXqZJZi05QhY6HW6G4Mdwqc9N
	 c839F0TXzSf4mEJFtaay80Pz27/58oVI72CdNakA/aPixaORuNIN/8hMq7U9ard5I+cD3
	 RW1rA3GRET2/wBzMIec2gDl2uWDvceAPP3uJeDss+FAFRx1SCYr0v1dcAPCkxpBAOtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=mCZOQ4dnxG+dKmjQlwfHmxHmTMaPcC1N1eKgeC0Nv+Y=;
	b=vHx3pgvvtPij6gYi8SiGbZIBgC3D1273iwq4UlarZqYVrHb7eHzkT+tICk1gjUhPRD5A
	 Fg4bj7MmaBmqR/MnKF/GpiNUixEfvBsx2tNfUdWNO6boKivPtjzCkUsoIJd3rpDKuTUbX
	 xzbb3GqRd/LlYdyZSvXHCYX6eeVcE+LCpHHQW70q7CkrS26gvULrlfF7ov3A8Rq1ejMKj
	 J9xUVFptr0C+43sEw17Fjl+tTjioxxBcCnHjwsrt+DPBSbgYe6zpLa1XkDQq6xBy2P8ZV
	 TqURINjVmcMgLKQSiDZmaAgAjgHsVzuoyJ2cgaZN9buGIc2YWjfJbwHJXgEQ6XZzkSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yy0CnUyt;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717CE606A31D
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Oct 2026 03:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 717CE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yy0CnUyt
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso818007eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 20:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793158502; x=1793763302; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCZOQ4dnxG+dKmjQlwfHmxHmTMaPcC1N1eKgeC0Nv+Y=;
        b=Yy0CnUytl/jyfw8b/HqjZqBEErphWqKfKL7N5Axw9kvk6i2Ouve321v8yuiaJGsJuL
         jPVE+ft7bcMtpTATrUG5cu5jkW1ytk30l62OROyT6CJNwSJDM0/CMHVN5D8sv2aa6H8d
         VEMmMWhFwxqXFOFktYZSbq1nPOHBu127/P+ZDyKkg0Zr/akyD8n2RjOiLz6obvJn4/Sq
         xgKXJ1lRkC8MKPW5JqBsnrEHbT2mViE3N7V4j0Y3ALrgXbNWK64IrnT5AI/hb+5FN9dc
         JgH4FUmQJrH8OVNLJuP47enm/pqZAYLH/e/h3eiC2RQqnGy1hQc80DZHHsAla1vvG6iA
         Y2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158502; x=1793763302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mCZOQ4dnxG+dKmjQlwfHmxHmTMaPcC1N1eKgeC0Nv+Y=;
        b=vCQvH8GsPlURPnPhW9RpXYBm1RgRxKSvGgV9ReNy4RLiLGZ2o0aYmC3wIi12hsCiBU
         1eJ/bCj/pDjbT8ogllbidA/r+ur3zAvLvQlHdH4yhobg3Cww6no4mf3nfeAf0kkqXWBZ
         t8reBRidvRGoJ/rWb0Y4Fotnl8B3bnjVe86nuCb+Il1f/DadWpx2haVbNW8jxzyH7PDo
         TGnayM9UotEaF1hodI58q0X/Y05GM9PcJukmbryFBEL/YQ4FpFIjkGsd01/SidRf56iw
         9MMEzW2+AjdX5PL3xELgVRHjjykTv2hNutYmyfxGYWFxdzD6/NFxrMIDhweToPRCq/fu
         fX8w==
X-Forwarded-Encrypted: i=1; AKwUvBzYLX7Xl4ek6cEjDh9b9jO48rGQe0nq6TpgKIgDIW0bTOcCJwRQkF4uK1vXw+qn9iq2rtVHpxjQKvBBU373qA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJcoVCQDa+vyEbZrQdsQje64n43jOSJzkmMx3oy5WmBTdye0LiC
	NKHiUxUF/ciF+z+7skcFon9YnXCLcq1Tio036CFp/vzpZMabPdlV1JT/EsWXnB6CT84=
X-Gm-Gg: AYBFou3WomroCv/aJa29UZV3C7ordNe/DSGP4cUnOojX7Xcv2H/0g9YMMvO9jtvLTbf
	6syWkrgpBgxYYaJrKXf233r16D7YHUEPEU2cOXfkQg/CMQqR5CmmGIHNXwfY7M4BUPjPg01eiVY
	ENy9/bMrtfS2+hj32ZRHzMqdniexA8ZXOnujDkR1HIkP2q1SM+lhc8bk+gR1sN73LBmsMWlLbNe
	Z/YLGoflVBIAKbdWYNPw9CfPAMQ7rJFhXDIrTQB3R07Oj2tAyaSZ9+k6MQT5fldvhzH8CKIbSq4
	yHKl6CUFrXcNF/8NDxpsupXoAQButJN2wkTNxoYneWKQHYI2qH/0rvbfI4a7RrER1/qlXZ+zxYH
	yupkOjcnx0XYDF28W2q/TLNc27fz+BYhLhVQswQXqBPDBFBt5k7IbOk0wWSvQb2psY0vcjuo2nN
	iAIt6/igsTk6wiicxNCktjy+sRA1QTe2w48C2ZKMYRI5XyYZnwDzFAGNvy8E5jjtAOe2n1oP1xK
	BZpD1Gmurb5gvlZdojaA8gARLIjx+FUw+jYZyCE7xQhF0lEGUFCh27g0fJYaA3zJ4NHHx8Wmgzl
	HkVsJc6XYZceB1T4kM9m6uoJTMLXufI=
X-Received: by 2002:a05:7300:6b07:b0:368:7c9d:1577 with SMTP id 5a478bee46e88-36a2040cf1bmr1873140eec.20.1793158502077;
        Tue, 27 Oct 2026 20:35:02 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2390929asm1962531eec.12.2026.10.27.20.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:35:01 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:04:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: cpufreq: fix `undocumented_unsafe_blocks` in
 `PolicyCpu::from_cpu()`
Message-ID: <auFtYrhTfJeWzGVe@vireshk-B250M-D3H>
References: <20261018163719.81691-1-ojeda@kernel.org>
 <4600d9d2-9369-4d9e-afe3-b21aa5f0cb2f@oss.qualcomm.com>
 <atW5adUhMhOhjbyh@vireshk-B250M-D3H>
 <CANiq72m1Mn8wTCWCzRawV_OUSm5L7BH6s6gcN-gQE43jQfx5aw@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72m1Mn8wTCWCzRawV_OUSm5L7BH6s6gcN-gQE43jQfx5aw@mail.gmail.com>

On 27-10-26, 18:09, Miguel Ojeda wrote:
> On Mon, Oct 19, 2026 at 8:32 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > I agree.
> 
> I think this is not in -next yet -- if it helps, I am happy to take
> this into `rust-fixes` (with the two statements):
> 
>     // SAFETY: It is safe to call `cpufreq_cpu_get` for any valid CPU.
>     let ptr = unsafe { bindings::cpufreq_cpu_get(u32::from(cpu)) };
>     let ptr = NonNull::new(ptr).ok_or(ENODEV)?;

Sure.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
