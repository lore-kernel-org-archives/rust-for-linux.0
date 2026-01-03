Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108281A9F87
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 23:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767483115; cv=none; b=ITGtp7el4bvntBa+dYjokvRPg6qbian3XOxTR63gQZOBRzOyXs9Vi3h+5Cf7mUclznHyKWXQHWm+GlgSXi6yN92pvpBs7maEIMOYxnz80IbddfHT0S5gG62GOK0qWeNm7IgyXckM2SM/c8rJHFVNtOd5mJ6RbIav6XdZhX9rCxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767483115; c=relaxed/simple;
	bh=Vh12q3cD2QJIm6KmfxqioNcQYGPmzjrK+YNucEwMH80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOBEUv1+aHeq7nYBys5K1uwecvBfAube1mFZTXgs0/9rHqyuagV1hKq9flSxQ1u4T5BRXfPJWv/6ajVvqYfq9jNCFGFHXpLdcv1M+NqHMa4KV0VUTcXQ23XxIovwnDXyvY0Ys1Xd8QruHiqWOyOeN8VszI3oAqFbNoMLGW1YJns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHLNBdCg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHLNBdCg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso5565165e9.2
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 15:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767483112; x=1768087912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Fm0LgC0L97g/vZwfPx2HiBkNgQhRuoMKZu6erVzW80=;
        b=CHLNBdCgxZCbjXssIhaoV4zE1Cw441a4XGFvyo7UDHT//uV4Z4f3+dgmZTOkJ8zpyh
         q21n1dPL6r2PgCVp6UDpQUpp2uxu5RmxjtjI40Z3c/Zp5AcrDUW9LEcGrV37WvMVKr/C
         DIV50drEe6uiDYuvpmmnFgIZGqFchUt4EW/VFPOQv2fqwjq4hUeYuZUOShtzDhuY2m4N
         yZmp9B9GEF1e7bwaXPB/p7FVcys+OQnHCYe6cTrWZmtlD1Ttkv0Ia0ubJ4LWZ6iK8LX/
         atU4ShI5MxNM6Y2zE4yaly363bfJjdeqSTJxHZuv3NI1GdN7YqltTNb+zFdOfERZdUbZ
         Al3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767483112; x=1768087912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Fm0LgC0L97g/vZwfPx2HiBkNgQhRuoMKZu6erVzW80=;
        b=s9rSgp3CWCyUnTS+TCd6mkhUn6GIzJNHR+RX98vIzwYp6YOc8Msp4xPZxOjs75giKx
         tVzio1fSOwHr84hnXRMzv4Ow6dDRov2d91ix4n3Lcn/xt4XM/Mu0nbD+f6Pss8Bw5Nov
         ZANxZpZOrRBh2X4JaFxiHg7nxxjHBoNfuyQrZVwEyGT06yqtB8Pi1uapP78tHi8NSxsq
         iwNj1sqhMZxXNFwH+0aJmI90IdxvSCN5NUuudBbaqOrn+h8s+YKGbxDXwEsDpRATMMT0
         6JAIGg7t3sQrOo8NiX8XzlyhHb8UClHzkHnTukFSNdbCIGHkUXFxRawRA2lpbA3MtbPR
         5PIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTHVkKv4RR2urGNWH5efiJS0lC7GYBjLZEj0pUqjZiv6K0ejcpSc+w17CmsqlQhgxqqM3J9EQiemp98kpgpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxveDP0hXryECE6xeLgphRR2tlWLIJ+z5+fUjiyd9GTOPPmhIOQ
	Am5KSb0h3wR46pAZsZxPEGCG0sJ6CIEOkjwzRsLiLqiQPeovFc31Llr9
X-Gm-Gg: AY/fxX5B3qUhYit2Kx8vT6s7Y4uC8aPiCqzlVfAnCR+wpoX+D/QqOEV4g6w1tULpdP/
	Eu85kB9j2b/u/4LWr0pB4ng8bjbQn+xFNlEWRNDiGTiQqR2czzxKQujTQqaT88xVHzyqROwHtkz
	AVXtyM0obQxP5RrLhs4Gc2CZfb8HTf7wF744G6Oor8ayNL9HGx7HGyUo3vrA1xpUVDTEZaiW5lK
	ReIoZ+lxSVTonEuySlAjx+KxD7/zQ8g25f1l+vRwSevD8kWmTq21s0wsSoNrohVcAK+fTsJYaUm
	abEdvcPt9ZhABzDzZOnu5IePiyKOoDCJD431OsHEDaGUv2fWtsdShlnn6xOsroK1UYRKZZMd/uA
	xXQzc78+TsloQWjUmHzUIu5qR+5seGoduyWeLQk9xjtXAj/MikXq9hDfZj6+eOPU3nYTpZi52vr
	yGNTL/+2JH2w3TRRKSCwi5EcuLjW0F5gxWf62r4GRAt7Z+
X-Google-Smtp-Source: AGHT+IHAxeIue5mLEwToPPQQOER46GvmyYCyeRLAk7cN+rxVNhyOZ36hKWbjK/N2m708UUrziaVDKw==
X-Received: by 2002:a05:600c:37ce:b0:477:8a2a:123e with SMTP id 5b1f17b1804b1-47d195911admr564820595e9.33.1767483112191;
        Sat, 03 Jan 2026 15:31:52 -0800 (PST)
Received: from [192.168.0.149] ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6ce21fcdsm65857905e9.0.2026.01.03.15.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 15:31:51 -0800 (PST)
Message-ID: <41d26500-d425-4359-91b4-b738725c0b8b@gmail.com>
Date: Sat, 3 Jan 2026 23:31:50 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] rust: i2c: Update ARef and AlwaysRefCounted
 imports to use sync::aref
To: Danilo Krummrich <dakr@kernel.org>, wsa+renesas@sang-engineering.com
Cc: Shankari Anand <shankari.ak0208@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
 <20260102202714.184223-3-shankari.ak0208@gmail.com>
 <c7be9f2b-003b-4dca-8296-5cb7a06ded8c@gmail.com>
 <DFF8D5VJ7RMG.VRLZJ24NT2T3@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <DFF8D5VJ7RMG.VRLZJ24NT2T3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Danilo

On 1/3/2026 8:18 PM, Danilo Krummrich wrote:
> (Cc: Wolfram)
> 
> On Sat Jan 3, 2026 at 7:45 PM CET, Igor Korotin wrote:
>> Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>
>>
>> Since I still don’t yet have a public kernel tree, I’d appreciate it if
>> someone could pick this up through their tree.
> 
> Since I've taken the initial I2C code through the driver-core tree I can pick
> those patches up as well.
> 
> However, maybe it's something for Wolfram to just take through his tree?

I see this change more as a Rust infrastructure change rather than 
something I2C-specific.

If it is not a burden for you, I would appreciate it if you could take 
it through your tree.

Thanks,
Igor
