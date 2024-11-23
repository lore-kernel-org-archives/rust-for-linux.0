Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D719A132111
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 09:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732353293; cv=none; b=HzBw8qyFNgAezS9nJaYgdvB2cUIiFYRIKXrC6JfHAARP039crPw9nui6k3o7r/Zuw1wgOJZ0VAEf1CwE98Pi1uXFQb++BssyDcdZqd47AA7Yz7hOjagfdHwfDKNI+qf7w+meV6u7FIBRjFKHCLTf/JG5+eI/bXwFXNm9zfnUUT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732353293; c=relaxed/simple;
	bh=n+7hwB9ZFBqsEP8h9fNfXLLk8Qzay5zZ9HCB8+618SI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWraWBy5Sbl1vpb6Ls+X/ZLK9a0XJcNVxImqtiwSBY20ptff0nju+BgZdPtd32ohvoPnyVVX5eBVRiD48T1b4dkbGU5a5iKQRXkOncKgS+r778+/lVzNACbNykgeZpiJDeXQIRjFtD+O+/a1pRbNnmW39IW4UZmGFBoqgeiZsqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=Cso10ENa; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="Cso10ENa"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so5164658e87.2
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 01:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732353289; x=1732958089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CE2H2j/Q2VC+QzPt0uTYwTfy9p5/J0CXDJyp/MGxkUY=;
        b=Cso10ENaY3kcEj+3A+i3Dan8KmwG0FY8IpZtkTBp6opEh4WF+c9IGPsnbKZD639zsK
         DKnNuAUTelLAsDB0fRuBboQF/X2dlZDev/xwz+wxNYXuDGF7PIIBY9oPfYHK/MdW2815
         jzMisA6+FCoc6yR2DGDwZRS5m5SzMD9zgCmaYicUVnJVXTL7ADs1Y0tuwBb16LHpFMsT
         zGI//JoEgD+ZHxjcXfZnKZY6YKl7RkD7jeDxt1SQfHbZSZdBQRz2OA6UvkDMq8x0uIp0
         xTivgh4WmHlegGkUqi00FpLs1eKOj81YAevo9r664aTWeN8mLdBx7qsq5fZ+rX5nAXUM
         r5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732353289; x=1732958089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CE2H2j/Q2VC+QzPt0uTYwTfy9p5/J0CXDJyp/MGxkUY=;
        b=te1FuOthQE4C4/7e4uW1B2A8Tk61Z1rNAEEFy7qUin56wuluw3ONf3Yct9wSjGuDgx
         EbbctpX96cxX1BLIlLTYkqmwkJKZs3IN18LO9RNu6bGpzhQHom16mSHUmFbAztdwL2sE
         fN58OncDH+/RcW4Bf0iBO1HpgiSc4dT/M6sEpJ3KygzOQo7TQM3FqRIrGaGh8WDAzXf9
         l5Cw+zgJWqK14PVWZ61BErT2rojRWoBCwD0ElAEJ1+jbZ8itGkqJ6uT8xXOHeFxKB4Sn
         tR1zjWA6/cVNHTBIKozT+e5Y3x99GS7HygltnOoT07k/1qaH0oHlwnVncA33wMNL66oC
         ek8w==
X-Forwarded-Encrypted: i=1; AJvYcCUsLW9ROTR3VMAJr23fJUcRqvrKTGRi9Xwcr6lVT62TbA1NGdgKsGJd0A20tpE8+do0NdiRDScdV1z30Ohwlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDXz4eD4nHXBYUYhOhFz4fsusi7hUOibjqdHsYeUYzzdhOW+As
	oEFvzF7OCx+33jJDlFs2SPssyh/Kt0fTXZGEIgTUUo//f4SJ4g2W7Jb2n3lQXSg=
X-Gm-Gg: ASbGnctVPM613P16LEwYOx3yIR7F0Ab7iSC/Kf5WJOQz4xVxLEhKJ/wsggzs2htf1y1
	5GuNZFwpuhl3IQRejEyPeltvre8xhubRu8qrzyCRGmGk+uU4EXFj4x4O6wxTLHQQ1GFGdG4h8oo
	+nQPEUF7cCj96nA2X7h/niOL4QbRt9T49D2u6HHJUXefDJ/TARZzpaCqT+b/dSJkQ5pccm/nV9J
	pzwTjEpqR9KrCC8v3cRMQ82yrdjTFpi5+x0xKWX+mApwosNHmo=
X-Google-Smtp-Source: AGHT+IFkamyioaw/IYcJ4ZXjg120FaONjl7Z/otKzJcAB7tcByNsjOEJhudfUxCl9tDz8Ya2IHG6+A==
X-Received: by 2002:a05:6512:401b:b0:53d:de10:f28f with SMTP id 2adb3069b0e04-53dde110d8dmr377398e87.41.1732353288668;
        Sat, 23 Nov 2024 01:14:48 -0800 (PST)
Received: from [192.168.88.249] ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa51759732asm171539366b.14.2024.11.23.01.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Nov 2024 01:14:48 -0800 (PST)
Message-ID: <7460d0e4-5aea-418c-941a-4ff589f36883@sedlak.dev>
Date: Sat, 23 Nov 2024 10:14:45 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] rust: kernel: page: remove unnecessary helper
 function from doctest
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
References: <20241119192715.38282-1-daniel@sedlak.dev>
 <20241119192715.38282-4-daniel@sedlak.dev>
 <CAH5fLgi5rLSqxgHYxt66GmCu-nv3csPsJiO3ReexRnp37udiBA@mail.gmail.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <CAH5fLgi5rLSqxgHYxt66GmCu-nv3csPsJiO3ReexRnp37udiBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/24 10:01 AM, Alice Ryhl wrote:
> On Tue, Nov 19, 2024 at 8:36 PM Daniel Sedlak <daniel@sedlak.dev> wrote:
>>
>> Doctest in the `page.rs` contained helper function `dox` which acted
>> as a wrapper for using the `?` operator. However, this is not needed
>> because doctests are implicitly wrapper in function see [1].
>>
>> [1]: https://doc.rust-lang.org/rustdoc/write-documentation/documentation-tests.html#using--in-doc-tests
> 
> Normally you'd format this using a `Link: url [1]` tag instead.

Thank you, will incorporate it in the next patch.
> 
>> Link: https://lore.kernel.org/rust-for-linux/459782fe-afca-4fe6-8ffb-ba7c7886de0a@de.bosch.com/
>> Suggested-by: Dirk Behme <dirk.behme@de.bosch.com>
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off: Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

