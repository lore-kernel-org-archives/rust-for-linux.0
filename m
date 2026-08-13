Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6F435975
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 03:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786591062; cv=none; b=FM9cb397D9vOU0DbPhr+7UDVtQjvj8Wp9DQrJC5rQ5eFUtP7g6tCNCBdUu5ZbvgokCU5SgIo4RBWpCDiJWFGiGgfgNrHsrXGK6x9mPApUg/vP++i0apLgJH5ifpFAln4qNDk2wS0mRfBVyrqwt+X/wuvsZ5Pa7KxoLNGUyMmwzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786591062; c=relaxed/simple;
	bh=VmDZ/M33u7ZIPsm7x2kXDIoPrqfPKLOAjJHlUj+QqG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyQGRlaPR2du5x9q1PTJoM4VvXGj5EgiNRj0eqTUHqPai24f0g+PLAbJgJfIph8xcLm9N3oac7mqo+5P16ANN/vT3Z9CiyUPjur42YkPEsmC0KRF2U2YaBPPzgWhfmg08cufoiD5sJyTkC7+4RRyWEEAbEz/smHrtg9l/2TsYpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbee846deecso1505390a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 20:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786591061; x=1787195861;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmDZ/M33u7ZIPsm7x2kXDIoPrqfPKLOAjJHlUj+QqG0=;
        b=SAmRyptz0lVVGXMvtj6yLOiEohi0BDQooDQ5YHnI1Qhh79xGTnBtsj2Q+Q3TaaPf6W
         bOQq5AqLlwXkfAMHWMC6A0C+Kd4vZ1P4a/FBcqFAr/OcPjhiQw4Lo5AN6TvRGAYjIn8n
         XDCRcNkNJCMswnqcu+dqofwau7WXn5GAE0lVd0+Smbia5j5rCsmck4Nrw3SAJjlG2zIS
         U3pESRgwPlh15mmZpcVZPrj6u9GGCkLBdFWDG+A1WqeoHqYqLGmKrvLOPAipA2dQ5Tlx
         kD7MmvL1RwKowDoYBelHq0/peNBu4lxvohFbdKWiscP9VLOO3QEwBrNTN2qxpREcRMKH
         6lkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqObylVep4y1xCW4q7WKco0zNA7N3GLmt2ll6rbEu4RuL/XS7GJR7/8dt8W/5YkHtZb8K6gHDHMZzuq4rofxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFOetsqKEZGaZyxT65NT3PuEMLyXjMNPX+t2ipoZGFM6M4bqX/
	RpLZEHHY6CGIm5qIyOvCxEjK9i9dBjAJKghrllK8+8a9rT2jZ5GjykyC
X-Gm-Gg: AR+sD11KnVe922KfP64cJVMzjHOeplft7lyGwMsUq0VY9HzwN8XvLR16VEoh3VJN2C6
	e4RplUW/c7pTfnEN6XcgTuBhw+41j3F54j/kdO0Gv2uuSI1kWaw8lBYAbpJCobSQ6Rled6hE0PA
	mCLYF9Sozipoh6WK7xFhEGufpQGGs1yjTuiDClibIY3yUhImdiX13XkZhCQNmj4JP7PJWmF4W8X
	AoX6J9ta8ZZJJnLdn1mSnQabaHICO9PcAJHLifHvHetkIEngdjfTa0hW7XChnO/L37iVLQ+rdAW
	6mRRfL3LTHse2TMG7xgwqqrQoVaOlHCbIaOrQ6tFy9oeOBALHB9iyRvLiPW4ER4hrxgFfjZLJjT
	EoQUNhIQauyq6ZdW5VKF8TxeutS7+0tGgHIUFOWLCfGTf4g3kmnPJNI2gDnfro6i2opteJ2TG/D
	KuysNRMdiVrb5BZJsp7GIW1G7x9NZy
X-Received: by 2002:a05:6a20:cd96:b0:3b7:aefe:4367 with SMTP id adf61e73a8af0-3cc5540b487mr3411773637.33.1786591060581;
        Wed, 12 Aug 2026 20:17:40 -0700 (PDT)
Received: from [10.0.11.3] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebcb6a9a3sm2183771eec.12.2026.08.12.20.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 20:17:40 -0700 (PDT)
Message-ID: <525e31a3-6595-4d8a-b684-67cb0e903c08@kylinos.cn>
Date: Thu, 13 Aug 2026 11:17:30 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/2] rust: Add safe pointer formatting support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
References: <20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn>
 <CANiq72=hGtRyqcZpEvLB8mS-qpQeCyecruVGXSaPCxFfkzifXA@mail.gmail.com>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <CANiq72=hGtRyqcZpEvLB8mS-qpQeCyecruVGXSaPCxFfkzifXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/13/26 00:38, Miguel Ojeda wrote:
> Applied (v15, not v16) to `rust-next` -- thanks everyone!

Thanks for applying the series!

> improve the patch, i.e. I would like to see 1) the other things what
> Gary suggested (e.g. the extra checks), 2) more tests for the KUnit
> failure case that currently early returns (e.g. we can still test the
> width etc.).

I will keep improving the patch along those lines and send a
follow-up patch.

Best regards,
Alvin
