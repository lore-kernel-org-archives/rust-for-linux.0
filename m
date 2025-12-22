Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A2B242D9B
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 18:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766427425; cv=none; b=Bu0q2i7lqLhCnxgzz7qTVaKk1/0Sz36CjK9KDT+7IMCkFX7WmrswDwy5k1+RmEklS/gN+SdBsOltzJS0OcaTNGiDIq9q6bxSO6O09a540pkBsbg6gtYgYddCuQ6E5LGTY3ms2YIrZs3hdqZZuSDZTJ5wFyjlEhI+X4gpfpa7IlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766427425; c=relaxed/simple;
	bh=JZg39JVbPALXHZZhRZyX2bHWeo4EVncWjWR9ippVlAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtrEl3qZEuasnkirKv1anJfXgMTNEDuQkVpSPbrNLBBHqwPP7Du6sF1q/JkXPCsZBBLeD1iWx+niNwD6RzRWBR5b8bIKkNHsW3baIv7+Qup6E3kuKK85N1eLCK8afzc+WS7BrOaFMPEiNAbZLwbXLgKhA+keOhhAOkVJFYPIxX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgnB+r67; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgnB+r67"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso42301145e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 10:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766427422; x=1767032222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKwdDc4XkpBjWejB2hU4KTofJPan7L3JMdj1bp6ibrc=;
        b=lgnB+r67w3bsqZcs+OgAw/fGk9TVYHZ+ATWOAl1HjKuQpXu7xt1qKXTkMuGx2QnFuQ
         q11OSad3vGTJdNfvP5aLe5P8UZQXzlM7agWJx9V9YmbFjjFoNo+MZFzc96yQ9ScqmMki
         /Vkxr7aYOAK4vvawX+Fp4Uzu8DuK+nOxKNj6KGEiVTuDyDtInXWF3GVcpAVCYurtF+IO
         DPsQzVqz8JoroVkPL4TsgR+69+snvqI4/APpmx80zwILGoeoN47T4gmFLvH3jYaA/AkB
         J2Z4BnRE5zWSw2HwpqgHzXHnqgbLfXsQ0nh1ZXv9cpsqAWcwlubcjFOfIPkLlGrJ5zoO
         NEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766427422; x=1767032222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKwdDc4XkpBjWejB2hU4KTofJPan7L3JMdj1bp6ibrc=;
        b=ewscZT8veiWDS9NHEpWpl9tP0R079GGfAu+R/iDRugCpHpTZVJbZhfVB0UPZPNjT7U
         85K4tWsBHzLRqoVchkwIzYOFH4rFSObdF03lfs/MGYB3ZterJPPbVWqiBjn4Ex785V6L
         gSc4mywMO9G6d04uwW4QZTMXg3mGFwnWtIsTQ5DUKsmuS8VqMjUPuESnik1146mGX0tc
         5Gz60eYaRuSh6Ioe5vGDodVFk7H8SpBu0ZKZi2o5WRxZJM/PkEsehOQliShpGiZcv/Rq
         dqm2AcZxUAxbCO47gaas/0e5nnE51ZgNc5gR9xuHgMGE5U2aPW4cDs68T/C9NWclb+y+
         UbJA==
X-Gm-Message-State: AOJu0YyUjdULyIX1WzjzSPlhorvYbpKSjgxsyvcgq8KWsVoVc0FQzeE7
	IWrUUNYEzN8DfpbcgXnswWWjrkwEI0gw5OQoaVo2ohXaXbxfEZtHFIt/
X-Gm-Gg: AY/fxX4kUCjQMF+XPLdz8J3jCA6oR0OJQU2dvGM4BM+A3/9BIixMF8ZxbLzzq7bH2Xl
	NvoNHbT2IzevpR/npPoJwAAVpek9VF/hJ0iT4x4KTi22QJ3MsMgCv0syvba+0tQO+ni6NmNiUh7
	l6M2p8NBhDOLuFh7P643wL4ccRll9dJBpa6saqiSRwShPVgRiiRwtAFE6fcYYWGCpNfJ2fpD0Rm
	pEXAzz/C9QZN5e6dG17oa0ULC+nzZtPl9FV94NfR+sayLL2FvVuPzVXbLWDqGxwdasULkj7686M
	6c/Pri0DLieSPFN3FtEN7PiZ8DRvIuLYU0F5cSpp1C9aztEUKkRcNR5kZBLsDzkok+cdeeX7E28
	lsO+rNMi5EnYyrvj6aXgatQhvRejaXyVwSAb0O6UbsSvr2CxL+NBVzkgkYiBoxkYfju70lU6vZd
	5ibANd6Fd5X5Sxv1xDP1V1KsbRVU7KS6HCZNERoTy5TmCZT8C+40WBBohL6k5Q7AVKdQec+tVEP
	y0d2QkWO2lu7fXH
X-Google-Smtp-Source: AGHT+IHUZSWkwa0ZtppugQa0dZwHNrwUqisCknS48Lp4o2lUt3ycoVGWM22hAgqwZiYKqWrcoCQQhg==
X-Received: by 2002:a05:600c:5487:b0:47b:da85:b9f3 with SMTP id 5b1f17b1804b1-47d195a72c0mr136974625e9.23.1766427421906;
        Mon, 22 Dec 2025 10:17:01 -0800 (PST)
Received: from ?IPV6:2a06:5906:2618:cb00:3469:3b53:77f5:a738? ([2a06:5906:2618:cb00:3469:3b53:77f5:a738])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325dbc522esm12555476f8f.11.2025.12.22.10.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 10:17:01 -0800 (PST)
Message-ID: <a0109742-8213-4aa3-a64a-d9326c694f46@gmail.com>
Date: Mon, 22 Dec 2025 18:17:00 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] rust: i2c: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tamir Duberstein <tamird@gmail.com>
References: <20251222-cstr-i2c-v1-0-df1c258d4615@gmail.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <20251222-cstr-i2c-v1-0-df1c258d4615@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/22/2025 12:14 PM, Tamir Duberstein wrote:
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (2):
>        rust: i2c: replace `kernel::c_str!` with C-Strings
>        samples: rust: i2c: replace `kernel::c_str!` with C-Strings
> 
>   rust/kernel/i2c.rs              | 8 ++++----
>   samples/rust/rust_driver_i2c.rs | 7 +++----
>   samples/rust/rust_i2c_client.rs | 7 +++----
>   3 files changed, 10 insertions(+), 12 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-i2c-fce258eb7e5d
> 
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
> 

Acked-by: Igor Korotin<igor.korotin.linux@gmail.com>

Since I don’t yet have a public kernel tree, I’d appreciate it if 
someone could pick this up through their tree.

Thanks
Igor
