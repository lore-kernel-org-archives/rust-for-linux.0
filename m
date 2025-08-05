Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91D0253F15
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Aug 2025 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754383214; cv=none; b=TEFQdsu+2KxwgVd0hHoCYL4ltOab+pqFepz/j4TIHH8UvLBChgWLWSAyzir2TzascjgTFpziRPU6VAz5xX5lLBp9GLJ2QfKWt/+KDmjS9TE6PXhiwAZWQHjaGATQ9TyD5yH6fMGDQg1BfPifNmD18A0bfvpBbnbCAIDmTSLuXPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754383214; c=relaxed/simple;
	bh=u/L3FSLmLLu8EgDxW4Os3t5TJG/ay/xJ5HeKC+3ZVLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsNI8oBG/SP1R0QaD9Lr/D2Re8kp32u/tKllBvvD863v0ZkaVk5R7GQt52D+tD2p3YvN4zyV6o40Z5ZvGCg9YsxTAu/Luoe5JkdISWx0juiNNppxKNBJDjPoqVhBiHANCJ+gvNyov56UXrtpwN5HmYwUjMRANd6OhpC7N2nw2SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kz1BxzW6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kz1BxzW6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-459e210bd2dso1250025e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Aug 2025 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754383211; x=1754988011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMVgRA+Kcuh0SOjheC54pEp/bs5a6C4GRIfNZChw31g=;
        b=kz1BxzW6dbdazu1IcAkE2hWUrEs2EYkJOAYxlAeIPBSUzsZyOi9ORmcBqi8Gup4SNc
         otBmvQYCF4nz+OczVMJa/WQWxnBLDi6VEaxbynw90kT6YPOR3xgTAH3thFQuTUhL+qzE
         ZDicg6eYmGPA54I6/yfxf747zsoLR+OZuumXvxdVXuBiYUrP284tjnNyzaSrZhJTwvRg
         OrhtTYbCuh/vJCiV2iujhwlKmD9h+y3CuQbK6PbcoGOZDaZzVEchIEwKCeorZML5T7sL
         Yajjm+m0xPAJhy7hnq4qDWXOhjcmlJEzaeYeTYfvMktxhjQoujJke2ZXWFRqg1rJOX6m
         hXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754383211; x=1754988011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMVgRA+Kcuh0SOjheC54pEp/bs5a6C4GRIfNZChw31g=;
        b=dLUoysTYkBs4yJh6ebWwSf1xcjbeJXrCAHdoVnaBLtXIRPpu/y+za1lb0xnu0mfuvc
         F7Rc8cRw4w8n96nRgrbbVAULO3jx4hlaNBu7qIiT+BGRk3j98IgXy+HwNxv9sGUuYF05
         2YAsM467HgLIOHrmAN20N+kpFZ6pQ8hS2nXvdR/rYDg8dZx7hCSlZZ2/WMy5KzeHlICd
         zlmB8NFJEYMYW+TOk+5h6jfUI5ftE7QFvWlmgsM9J74gfbVfG1QzyN+TPGUCOyxRs4Wm
         bDcjPBuw3AJ17WIx8GyGNlnn8Xl72LswdGJlxXipilH5r3r8bDxercZfN9xiwt44v5P6
         cSyw==
X-Forwarded-Encrypted: i=1; AJvYcCUENs5AY1AkzbARY3kU4QgZFHHgcIRbD3nRgzehsDqWHzrSl3S83cUMhpd5S7greOtRgj1Ogg5Zht2hDuaJtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx6iLtzyy+3bDnhTlyZtjr244XFM+zo8OtghaVIJGb8wiSF5f8
	knJMr4B/BNrs0QUb3n94293kh7k+sTZ/Sf3icw5DyQD2703reFXsi2hu
X-Gm-Gg: ASbGncukR+ySUvnkExyDzl2t3oQhrQ6TFyGk5cxHxw3tf40kas0o6+VyU96YRsjv01k
	3z+IGTEM5A2YlFg2fcDoDi2ooNRG5PxxXrmnoSNPYOv0xnoF26diWml7XxNLkj/rFNipVArHVbo
	K5q3efhnDfzl+7J3AFtHkF6z2khrfHRPSUWmOUvqsAKsKpyNAF6fPuVd3cDEmNt0G01Tjt+fWKk
	z7KyzSA0TVUJjHqEOKCW+nmpbV/aJDyEiEPMBIs+M9aA+xkEu26uKXQ+wFVqTlVcbwDgyP/hgOB
	pB79GGB2/YHW5aSNZ6q7J96HhwU/eaCDZG3pKftkSGeJXstuAkwjIRZJAzdqcMabY5cmPbWK7kG
	BUIkks102rN1Pusbk4qAEopMYMTZyx19340Wnw24=
X-Google-Smtp-Source: AGHT+IGd4FYBbjRyMreXl3FgzERQtyJnzjqWtj1utyiFFwDdYXuGi58TilLQfFQP5EgAjgBzrdql5g==
X-Received: by 2002:a05:6000:220f:b0:3a5:8934:4959 with SMTP id ffacd0b85a97d-3b8ebeddef6mr1970177f8f.27.1754383210919;
        Tue, 05 Aug 2025 01:40:10 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c470102sm18155465f8f.53.2025.08.05.01.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 01:40:10 -0700 (PDT)
Message-ID: <166cf13c-7bec-40cb-8d33-1c36c7927aff@gmail.com>
Date: Tue, 5 Aug 2025 09:37:54 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com>
 <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
 <3e53e2c8-4988-448e-b2ac-6eaf6d62e050@gmail.com> <aJDbmFx3QAm-TY4L@shikoro>
 <DBTTAEC8HLGA.QYJ0UZOIDYEZ@kernel.org> <aJEtrI6RlU1tiflq@shikoro>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <aJEtrI6RlU1tiflq@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Wolfram

On 8/4/25 23:01, Wolfram Sang wrote:
> 
> Well, I2C client drivers go to their specific subsystem, of course. I2C
> controller drivers will go to I2C. But as I can't review them, I need a
> maintainer for them. Is Igor willing to do this? Review I2C controller
> drivers written in Rust? Or is he only interested in the Rust I2C
> bindings? Anything is fine with me, we should only make sure that the
> MAINTATINERS file describes this correctly.

I'm definitely interested, but going through a tough period right now,
so I’m not sure I can commit fully just yet. Happy to stay involved and
ramp up over time.

Thanks
Igor
