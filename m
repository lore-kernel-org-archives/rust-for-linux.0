Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8897C18C008
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 14:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761487571; cv=none; b=iLUfkswNLMdZsCZjsVqvE+43HWxst/UYVXnPNahjdxd/Q7bFE618UlBFxN2n9akx5ujgVZsqEe26yknZWizzp4Gur7ozmtVOuACEcsnc7sbulFJGsVfGtCDPFOGGy6XrWtd4yeYt2vHEZVjUMNlMQCW1/tCkV/P5V57M8SHtSko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761487571; c=relaxed/simple;
	bh=gYfqNtP11KH0UKN4RQH1Rz6mdSU+g18C9eAFYuwbCwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LYKmec8EfattvYU5sfx2ikTR7PaoWZgCEpTGzQ3SDC/BgldQ22FkJO5Y3lwULnG5y74CB1QyhrFK0yC69nnN0wzuRq2lsZTMmSuj2ZsHGO1ymHrImhtSBImBsQmge3GhfSPtzTQ9pg8NdAFnNnSDWQJ7AuNqjsBIu3v1unFIH+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDNmgYnW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDNmgYnW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47117f92e32so33321975e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 07:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761487568; x=1762092368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLYx4uDhgheZtG8ZPIY5i/GgmjTVBk+AimSR2MYYAhE=;
        b=HDNmgYnW/J8JREIXG+CVkGbLs7NyB02KJ9Z/QZcDnkNqV/TmISojhsTT5juJBs5+Hb
         JbhNbGoUJHnGTNkaxHwnNGop6mEG3vJn5UqevjdbQjIRUNQnyR6Xb1kgicpozqHPhjX1
         keuoAlv0dmwwm6csMF7TAeVSoMatGrgQlE3VgJwZhcgjP3JAfgw6TlXrgGjFB26zhvsd
         sKAL+nJ7tWOkFyw4Bis3egxRhy4KBWYDrMTOAsMV39vzd6IzWzTde2l9FUDe+NcKmD9e
         ZxAq+HVn4HFkDBWIl4wBC6DgyaTTHecvV3ASs8QbwXRyJ7GlkYMH8fA4d8naNVe94iyw
         FxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761487568; x=1762092368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLYx4uDhgheZtG8ZPIY5i/GgmjTVBk+AimSR2MYYAhE=;
        b=kdYV3dhi6rIMEUvdFimCtTGlKbkPBoMP8D/kJe6tCAu3PLoDkOvkm4teQUtgEZc2DL
         L5Udy7rU42nkRMv/TKIOXP0fkBgsjy9mt0OiqRUGL1PZz54KPUNUTSIGsUa03sZKmMvn
         ZpsTjEdFLqICk/cyICJXUP0CQCwnR5hOwtiPe+CxzHp50lw5UPCEcT8mhYYbvft8McfO
         7aH3JeWq1SJc1C4QQr38EqtjkiYFYBKPPKFcV84MA5yEXioGA7rifkVxU8EixFpWWOTf
         cEifE5TMLhZxrHdMm6XiIFkVv5qxlZxUQZxBRv43LHIizKfia/vMDvog8Q/yEst7UnoV
         VZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFl7rG682zX5YVRjrKFlZyGMEJq8F6xwqEf0SIAw7zf8byAwbeh6SRvURhqrXJcrLZQ5uZKvbVU/Fvp11tUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzumuM1Ae9JVqdQD+iKoRfE/YtBAIPkBHS3gBrwf52Oe136O7Xg
	Ave9r8JrmUehindew7eXZ30JkK+AccYD0hPDBftkk7DhQQmz0bWXD+K+
X-Gm-Gg: ASbGncvJICRxOQPZZuvNAM8tMZstnJT0Pu4wJA3z2DWGCKZRjMfYJW4wagpjxZ3qx3d
	0qgwf68Y8etCvTSllwLjr+Pn+rl/EZ+RyDHLg86En9S1ftO6KHxxK/cGjUkwqqeEaWO39MVzgn9
	1UfFmgQFhSTC2U/HkvSBTw4wCwkU4XOeWLNxJxmEfDqONvR3ngkoReFGFPkBe4Y+roU59odXy0r
	KJ1ThZzAiVOZP+JynjAgWB02s9/xHhtnZfEKqERScOtI+5+z5fDiyQJaqO0CGtkFFzCPhL0OZEu
	x0T2dbLDoIW8tpIL6e1MhIvMciR7sQvkRQQTC8BumZeLHSPJp6CtGWhYL8NmYFcGeiviYPb2iST
	UnGirCV4YsQ1ELtFmHTFenuTR0D3o1SIERmgZfWz4J3irpLHoe1kAKmLwxxqfyd6pJkFMWl7xRt
	pKF10auUYx/hxGEYtdOp/CRRtzSrbn4NHoD4Smi8LiRwcP3PWMGwXW+74ryZ8bThR5L3CpVUZb
X-Google-Smtp-Source: AGHT+IFmodXofCaWJ2V4mG96wHunmtMwZMrtD3TBF632Rx9mURjIzVc1Cf5tYh6QvMESkaUrVCJQVQ==
X-Received: by 2002:a05:600c:518f:b0:46e:4a60:ea2c with SMTP id 5b1f17b1804b1-47117925e1dmr261093285e9.37.1761487567654;
        Sun, 26 Oct 2025 07:06:07 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7? ([2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df6b9sm9139538f8f.44.2025.10.26.07.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 07:06:07 -0700 (PDT)
Message-ID: <72e286cb-7517-494d-a8ed-769b5fb8baee@gmail.com>
Date: Sun, 26 Oct 2025 14:06:05 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] samples: rust: add Rust I2C sample driver
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
 <20251005102348.41935-1-igor.korotin.linux@gmail.com>
 <b09c7c91-b801-40df-8cd8-731837ba2553@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <b09c7c91-b801-40df-8cd8-731837ba2553@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Danilo

On 10/26/2025 10:48 AM, Danilo Krummrich wrote:
> On 10/5/25 12:23 PM, Igor Korotin wrote:
>> +impl Drop for SampleDriver {
>> +    fn drop(&mut self) {
>> +        dev_info!(self.idev.as_ref(), "Remove Rust I2C driver sample.\n");
>> +    }
>> +}
> 
> NIT: Please use the i2c::Driver::unbind() callback instead.

Thanks for the feedback.
I’ll move this into the i2c::Driver::unbind() callback.

Should I send v7?

Best,
Igor
