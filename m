Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9D1221265
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763819998; cv=none; b=TCTg94//9K5lpCiMovK3nqdKbER7xSpJ3vh71YEAexyiJQbPuiLcqkfHYxVqGdYH3lgvFIQ57Qhpq4afZLnUblH7fqq2dc2izcn/8yUzZcxy+LGn6QNCd/cR/bEyaQo0RWP0pT9Ml3f/C1E4da6G/RpfsgMgvBNlP8bemewnyqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763819998; c=relaxed/simple;
	bh=vKCXMz04DeLJnwEKF8S98dT02xv8eOJK0ArCHIYcYFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObTLZfi9wqXGl731rtJy7+Dm2PVSg1CWFWUj6Wt04r2Zk9Gcye9x57yVti8jAvm5RxUQsp5pyHUbxmQPSH5omXDsu73W4zsODZHQcDD/CbTQaSntTFIkxI09ajg3usHQZjxUd10E+Y+1NThZJUyCXiV+Zk1N2mt23+1Cqq3ruHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g49oc6cP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g49oc6cP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso27669965e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 05:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763819994; x=1764424794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3RDHdAOWTPHz680YM/cr1HvFmiWY++575d9xo1fZrs=;
        b=g49oc6cPE/+QHtjyh2nlPblChS/L0kRZ4Wau5nCW/OxFr+t77EuANv/5GnKoVA2RnZ
         U3t4K8+wCfKsh7UY8h1tuEkK3py4pCoOZSGnFRf3f9mRN4EtAsUu7nyxzG0LInuEvj0p
         DjUNi319sATk3buxrvArAJEM0UfSRWaEjIhQbhNVrtSSmdj3DcPkHtuvn8s3ht/h6MSe
         gSXjVFfajx/PSnBhBzXfrESS9pq34IA4aLdUTXdMY6ZotVmPmpzEgw1T+BfnPssvCU9C
         owikGzCqaYW7M3NmrWTqtRiZ1sxF3U2HI4UsVXwCOxRcXTd0P5M3CFRptAHnRp8NzTXx
         6MAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763819994; x=1764424794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3RDHdAOWTPHz680YM/cr1HvFmiWY++575d9xo1fZrs=;
        b=GLu+PpG0ZHST0ZOI54Y8Bo3hjCsvIoRFFvwvxIpf+MO4PZkKvQgjrnEBRDMlP8/zk3
         AUMrAabklA5zAB7uVIfd2RHJ/Cyojn6Q1HNsQ/ukpQbkX0ZOjclMw2PTfs3/gFlYvZL/
         HF+xx/vishyEBlEUkv+LdgwiuJFsIS5ZM2D76/zkpBfLakSTq9p3a4nV4M7RJiJyd28b
         cMeij/GlU1uhdOLaEHV5Ub+rGLE+77V1M66V8oH6Jl5BFervsz7Pf/j4HrXAOz+2s+gv
         SwP3cEyGKhGOI5xa8JB6g0WZq8NMqxnnOfofIVYjtqaT4G2y45xIEVV09PV/n0auIlGF
         6aZg==
X-Forwarded-Encrypted: i=1; AJvYcCVitWMuaedirZ5iXpI93Ljdukj+oaOYBMkyFx9posWpCPjo0LVCyMFZPgxEhX4uf+jA0YhhxVWOFDj7+QAIMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5BOO7pn8W3VAqd7rxrBnzWdZyj/rx8AAHIZ9ofRc1dTz3/r1Z
	QYZ0kLfmtSYEzn7CM5Tz/ysXis14Y+SQY1KJW3exTLFE7VU9Xf5q8WE7
X-Gm-Gg: ASbGncusyT6WW3Q6RFbv+72wkJMeWUcgCxgcOAq886bzx+1c9F1VN8l4uFqyyQnqeeb
	xVDmSlQTGVJQnBeo62iv6HElj0Woe7osPIT+ftwgrV2FQzvgN0VYFF6hOB4henKv665XJInltqa
	P1bJAa+PNjhcey1ONUMOUfVR9jWxe+1RBFQ1pJnhIyTSoN3HpKP3+WeocAiugO4WuNL2SNh1+Ij
	qNYBsmk3hN1y9u5cg9K60DBt8YKzOqgye9/QHXsPn0Z3GGvfVQSdvPbGPW92OK0ev6wgHQNDZiQ
	L/94/8ho2oW5qajmmqK4Itiq9x8xe/Kp4WCoAg5KAmN2eksMDlDhVtZkh9eULwsyT/ssFvp8cwY
	OTSU8nT+5xiOephDkupVEJQ12jlNuJoX2uLe+o2IxuwtL1zN4tiwH5gbyF8oZbZ8EUeH2sdQJbr
	kwZVsE//8r7kWqNseM9wHw9icoS1xCcoHrZAlykx4gbHr8I9NfHGirSfftQJNnLS+H1atshBE2Y
	MAza1SgnaQLMJMw
X-Google-Smtp-Source: AGHT+IGYuA3JTqfejqsIhzZHqJz3Ln1oqoniCKUclnrBoDL1DrIFTZ/UyM8tSRO8lbfuTmQFjQVKMg==
X-Received: by 2002:a05:600c:4e88:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-477c01d4af2mr60178185e9.18.1763819993601;
        Sat, 22 Nov 2025 05:59:53 -0800 (PST)
Received: from ?IPV6:2a06:5906:2618:cb00:9815:cfad:3c92:4b87? ([2a06:5906:2618:cb00:9815:cfad:3c92:4b87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9deb126sm106372255e9.9.2025.11.22.05.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 05:59:53 -0800 (PST)
Message-ID: <1cb23033-1fa5-4c6b-9cf2-23d26ded18d5@gmail.com>
Date: Sat, 22 Nov 2025 13:59:52 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] rust: i2c: Add basic I2C driver abstractions
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
 Xiangfei Ding <dingxiangfei2009@gmail.com>,
 Markus Probst <markus.probst@posteo.de>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
 <DEBAOI46JIOO.B0TGI5HFLVJ2@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <DEBAOI46JIOO.B0TGI5HFLVJ2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello Danilo

On 11/17/2025 9:40 PM, Danilo Krummrich wrote:
> (Cc: Markus)
> 
> On Mon Nov 17, 2025 at 3:21 AM AEDT, Igor Korotin wrote:
> 
> Applied to driver-core-testing, thanks!
> 
>> Igor Korotin (4):
>>    rust: i2c: add basic I2C device and driver abstractions
> 
>      [ Remove unnecessary safety comment; fix rustdoc `Device` -> `I2cClient`.
>        - Danilo ]
> 
>>    rust: i2c: add manual I2C device creation abstractions
> 
>      [ Remove unnecessary safety comment. - Danilo ]
> 
>>    samples: rust: add Rust I2C sample driver
>>    samples: rust: add Rust I2C client registration sample
> 
>      [ * Remove dependency to I2C_CHARDEV, depend on I2C=y.
>        * Remove unnecessary impl Drop for SampleDriver.
>        * Rename i2c::Registration, import Devres.
>        * Fixup module description.
>        * Add new source file to MAINTAINERS.
>        - Danilo ]

Thanks a lot for the review and all the fixes of yours.

Cheers
Igor
