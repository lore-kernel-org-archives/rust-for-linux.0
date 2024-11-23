Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA0720E3
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732353684; cv=none; b=S1oI9RICUfB+dbAknbg7stnlbpw0a9vIYewiXYTlfH3iOEsVOjXO+0GYZOYis4e/3er0DyMc+io1zRZvQjqDSklRvhG6jj/+LLInxAwpWK9PuvXmXO7g0IyIwEs8lLWvPiTUOBU2/ITk0Ta9N65C0GmUTiolFYdX9aX3mMXig5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732353684; c=relaxed/simple;
	bh=VMABWD40S9km7PWAbmO5W3yCWFMZBzZF14DTMAmyaSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCJm2b0WbsLcQ1eywgforfUqsDYrUI8CU+PvTHgnUNJzw1+UYGqnY5VnRzgQ1MK8DnpFFCE0gIHSFQpdYHV4P4an14lA78vWgfYHtkhfxluCnC2kq3PpdQAGwoxXdgTm0qnogzn5bvlXLctJ1ep5yATGKnCo4wbPY0pa1uS7vYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=j+7QFTAw; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="j+7QFTAw"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ceca0ec4e7so3320645a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 01:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732353681; x=1732958481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XIYxSIuo5S7YMXZwnL9EekGsNCQmv0iTIcsYgB/m0GQ=;
        b=j+7QFTAwWxPXnvEOtCSf+eFuvew1jwl2PPj9qlqO/rt2JWhkUph6iGWTe27pLTTXoJ
         cQ5bwlrmPVPXEeUWhiU+ueReOijis9ugRndgu4Soos9sLeyWaSbE51mME4epDEKk73GX
         EpnCE1lQoVtwLrb4pGmQkMUsbXsfd8wUrWQk2qvSFv4jY0SIILUtZIbgHRlgCuE60ihD
         YFtIr+Doo4JlHFA2NBnn2MOyELlhgkeXUcxu5vHw9rCXqAzNJ19kj1nhKvJvksdE0rKk
         DIQ//T6/wOIfHtHuH4aaWpBPys/Vq06+NzaA0bmXqkNGcpd5HDhKCrQQ7fHU7d8YX4Z5
         76OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732353681; x=1732958481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XIYxSIuo5S7YMXZwnL9EekGsNCQmv0iTIcsYgB/m0GQ=;
        b=UkNsn2sOGS/GtJe8Mge2xA4UtMd1vPJynz72lWf556ju3h1L1WpkyHgr1iTTqnBtgF
         arwgStnnJ2QiBadFM9F31v4flSgwgk0JApjeFHDvwFmjdrtk5YlFlbjm6b/YHN10yoJO
         Xj78dabQQcMZSfQ4H7Xp+/LPVBJegRDL0+GWJE9OifZm8vWtzpNNaKbQxccIkOPYMZwl
         SzJUgW0PbJjYCGn+TTP2ruW5egojzm68fukqpvFvNFo6RMbQESLNGNr2vnXzVU+hvmEI
         z0kXF3/jFsyMQdB7JS2oBk3pxXl77bjCCak+vWYyGimEIOEKxIhAx7So4ETAFTxMsjHE
         gMbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUct0XasS4BDPNMl5B0tBbJCwtsN/CpZgQ4UYiE8aFXdThmSfplaEjqVTCcJXHR6VJrfCN8xQXKNN/Ar62Ibw==@vger.kernel.org
X-Gm-Message-State: AOJu0YykjLDISCugFAT76IkaIZW0WoPxKjEada/Q2vd93XSpxg1S8ols
	hNnoJCeonnlhDNQ8dte2Z6ECfc3DZfpJQp+oyAq9at07V1ZIz1/ZBiDoRNwyCOI=
X-Gm-Gg: ASbGncvaoFMJN1S7BYvBxsOS0XM0wiECAMIf+pZu+I7yy6wpFECJUSZ26q524RdpxsY
	EYR23SRhdSZtdSzSSLeMhdNiTl6MbzZTaWbr8KQZ2mAhYwSOtnCvRm4+raj4fKhxvmYWIXvCtjQ
	kiiZYohNw2BYbM88LIfF0SrIvQFf0s/ds1EzPdpdGbFoHA9vZyu1q5IxF9JnBY6Wj86UpZHyLUc
	Sf3uQQcMNTu359Zakze+zkXxUgzg6esGRpdwCg9+0DFzR+ckOk=
X-Google-Smtp-Source: AGHT+IEEEnMCMjItQBdUyzyZrDQGen6t5NoTu6kxeRHQAtqU+RpbdXyBA5foet7PiDsxPgpd18nbtQ==
X-Received: by 2002:a05:6402:35c4:b0:5cf:a830:d84f with SMTP id 4fb4d7f45d1cf-5d02062549bmr5109998a12.15.1732353681137;
        Sat, 23 Nov 2024 01:21:21 -0800 (PST)
Received: from [192.168.88.249] ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3b035bsm1815816a12.21.2024.11.23.01.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Nov 2024 01:21:20 -0800 (PST)
Message-ID: <86ed02bc-a670-4bb7-af35-d7171eac375b@sedlak.dev>
Date: Sat, 23 Nov 2024 10:21:19 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] rust: kernel: rbtree: remove unwrap in asserts
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org
References: <20241119192715.38282-1-daniel@sedlak.dev>
 <20241119192715.38282-3-daniel@sedlak.dev>
 <CAH5fLgjpS+a24HKYvfA3cEtBAB=D3vF+yuMK07UJVaki9E78ng@mail.gmail.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <CAH5fLgjpS+a24HKYvfA3cEtBAB=D3vF+yuMK07UJVaki9E78ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/24 10:02 AM, Alice Ryhl wrote:
> On Tue, Nov 19, 2024 at 8:36 PM Daniel Sedlak <daniel@sedlak.dev> wrote:
>>
>> Remove `uwnrap` in asserts and replace it with `Option::Some`
> 
> typo: unwrap
> 
>> matching. By doing it this way, the examples is more
> 
> typo: is -> are
> 
>> -/// use kernel::{alloc::flags, rbtree::RBTree};
>> +/// use kernel::{alloc::flags, rbtree::{RBTree, RBTreeNode}};
> 
> What's up with this change? Is the example broken?

Ops, messed up rebase, it shouldn't be there. However, I am surprised 
that clippy/rustc wasn't complaining about the unused import.
> 
> Alice

