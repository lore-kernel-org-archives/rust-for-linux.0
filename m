Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2258A308F03
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Feb 2026 06:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771049518; cv=none; b=G1Y/6VN4/BG/rdbCah2ygyCPXT9+MZKjDPyuRPgOwdNWGpRf9MYkv0mSkOdYXD0/Q9bnwh1iCwqKM4zlMFVRMA9fXo0hq1SqRj1XKhaBPrVTNrAKRN0gNxTrh86MdXf8vIquGOfL6GDQRfP5Vu9xcJUClJgKWTnYzZIcooXANSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771049518; c=relaxed/simple;
	bh=BY0d32+ZzDAZ64umGmXB44D6PovXFeZOF9FQxmubx2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiZieQ5EOpi005euy5+RKIpmiFYuD2P7wh5Bnn9wamtveDpBqYiaEQWtYG+4DFcDaNDnJj0lBKEy3YRMTOAXg1iyLLWaQ47S3q57bu6aPyTZn+gq48UBrdrnMt7Lbe8d6v7+ODfrC633kFNFhILX/OlEhsLOmnSasXGB78pihqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhhIVbqV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhhIVbqV"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4359108fd24so1061346f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 22:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771049510; x=1771654310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VgGBcvHQoegFD18ugg7yJkEg1tzSzql8ilNB2jpbr3c=;
        b=hhhIVbqVAFRnS0aiZjmxPobjXu76E8ItdJre2eOOJa68OYt/eGzZ5JQRyY5Q7GZoWH
         9rsBHih6Tuqe+15mjKDQaP+XDIWH4reUfXIhTWdLf/X4H46t3gvtKHuIvD0ypD4kYpF5
         0UJbKYwKxYnTIDry5P8RwUTaVjTqT6AllyGE0ch+2DIv3KpqQbnXCQslVYyUE6twQIxk
         ZuZ4SXcTV01J6He0HR4et+1pISKV9ukqJIsGkoCfOYKwjYhF6b9CnrksKhagv9LLFGQX
         KHD+LlSDZRjjLTXnEhCZR5f30anSM/e0UP3H6E9+6v7WyMq8hP/JuHj9LPOl3Zto/kK0
         83ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771049510; x=1771654310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgGBcvHQoegFD18ugg7yJkEg1tzSzql8ilNB2jpbr3c=;
        b=fAXQDp2nkjL8ktsvTG/fHOatBCw4YVrOlBik4KYLbq/QPGjg2MMhbUFrMktNfteEYD
         uJuxY3C/7d3U+/ezi8AbyI0BnX+bnLowawQ4CRONnVbhKk2tjlpO/sD5Td2Vbv+fjRUQ
         mrEwGxNlAYo0avfFUZLQraMB6U+miJqvi8m+JgzrVQIjpU08q36Gq6pzC+93VJCxit5l
         7T9x/zbzSz2nJ1a8HXTroGIDzKS2nfXq4QZoBHAaXqsr3lxH1x0VqQvtc9oVKsu7Dxfh
         BuJVmbgH0kEVMNxezKc6r17q6TIEuPc0mS5AZV0beRdzjxzDMzefGSMqcmVzBX6zOFM1
         amDQ==
X-Gm-Message-State: AOJu0YzT7uFCPqQqrnQPxedG1RJ9x+a+RSk5BCggwAaXLk/folo6WvzV
	y7Cw3w1p1xqvKckVkqiCLTv71pbbjSJB6LXpZORVfWulcycxQs2km04b
X-Gm-Gg: AZuq6aKfdU5bgOpvlOwSDSRoOUx32tMdTcM58EhBFU/wZGEQHiin3vKRRCU1+pN7Yzc
	uKXw++s+VGFybZK81hWkxeXp6LU7ES60FFesjgvpUvbtEk3VRX7yjpCIlWrQE+lHPso2ES/W1IC
	ntT5zSEUTt2Nd9WqOmZaHGXT6ubFzMlpIPcJTSbYm7HRY0rRsDvSIKXQj3xCcPSK2oJu2TNDlKF
	pxAVD6Tpx2AyuwYOSMNs8j2rKKBLobwcWPtRraZY2xMq7usor5JHdnzyolYYVhyd2C6X7HDwX6C
	/GGLQ0aVfgU6PIqCcK/NOANC8vcYe0CkWi/QdUCN17rKyWm5vz32GliuDpUmO8jz/Gq+kn+7+i1
	p7DBHfKvkFYfIMFEWs5WYF6+/RHFwfJIi2VG8IWSriSDnO/Us3ce7IB5My642nWyZCnTqqZ1Gnl
	R1Ij7rA+LgTK33qnrcI98FFn+Gn4Y49k+LzkY6G8tly33DMgjwlQdYYn7BPo1UiDJhng35bg7+s
	Q4UejbzBahPIedhDfpUfZDRoD24KZr4aTscdWp5f78Pp+b3sW29ZPd4SA==
X-Received: by 2002:a05:600c:5306:b0:480:4d39:84b3 with SMTP id 5b1f17b1804b1-483739fc667mr60964125e9.6.1771049510162;
        Fri, 13 Feb 2026 22:11:50 -0800 (PST)
Received: from ?IPV6:2003:df:bf29:9000:b585:cc2d:57dc:3085? (p200300dfbf299000b585cc2d57dc3085.dip0.t-ipconnect.de. [2003:df:bf29:9000:b585:cc2d:57dc:3085])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837e565f5esm7439175e9.10.2026.02.13.22.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 22:11:49 -0800 (PST)
Message-ID: <ccbb3422-11ca-4a0f-a517-1f48b3004052@gmail.com>
Date: Sat, 14 Feb 2026 07:11:48 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] modularize Rust lints and add RUST_UNWRAP check
To: Jason Hall <jason.kei.hall@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakru@kernel.org>,
 Dirk Behme <dirk.behme@de.bosch.com>, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <CANiq72mB0N3GDe+w8qT_VU1ieMQSRBiEPaFdSVa-2GLDiDMEZw@mail.gmail.com>
 <20260207224907.234815-1-jason.kei.hall@gmail.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20260207224907.234815-1-jason.kei.hall@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jason and Miguel,

On 07.02.26 23:49, Jason Hall wrote:
...
> The second patch introduces the  RUST_UNWRAP lint, which warns against
> the use of .unwrap() and .expect() unless they are accompanied by a 
> '// PANIC:' justification comment.

While some further thinking about the discussion in this thread I'm
under the impression that going this way somehow leaves us unhappy.
Either it becomes complicated (again, many thanks to Jason for working
on this!) or we will end up with several limitations and (confusing?)
false positives.

I wonder if it would be an option to change the strategy here?

In the last time we have introduced several rules by "convention".
Without checkpatch or lint support. Like "please use vertical style
for imports", "please use `__rust_helper` for helpers" or "please drop
`as_ref` from dev_* prints". Would it be an (easier?) option to go the
same way here? Instead of enforcing it with checkpatch?

I'm thinking about the same approach like we did with the examples
above: We identify the "wrong" `unwrap()` usages in the existing code
and "fix" them with patches. What would result in a clean code base.
At the same time it will give developers an indication that the
remaining ones are "allowed" ones which are ok. And for new code in
the review we ask for corrections if we spot a "wrong" usage.

Best regards

Dirk
