Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6E6376A18
	for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780226348; cv=none; b=FpJNtYJFBr64e7n+o9t9AJ09ETI3LHWtLxJALBzEOrxu/zb0zMgfx2G/KnXW313iFvBbUglZzFELBpaEhGddxcbPtKcakuIXt15B3vc2qTIiPCtRwI3afbFh8I5ijTaE9VzRh+BzAOfh7xAoHeFmxRelylENO8lbx/a3NOmPZ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780226348; c=relaxed/simple;
	bh=NOYgzo7itwY0lp9mEU+pN1LkVKwVy8CcZSJ6QvQu28o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxTvOEs3d8t8B5VPq68paHaIdsvxewwDzldyi142IDUWru7DFKKhVe1+4QlGcolvTkYGH73v5PH8JXvH/Q41+KHUUu86bNm1nQv5IvABq9391xoMv5kc/yVz9xw5+n0jDn0fYrPYoqyk6Zt9pO8ndQe1bpulg4IcSnn1niXbJ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pC1jxDDN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pC1jxDDN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49041e84237so74777275e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 04:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780226346; x=1780831146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOYgzo7itwY0lp9mEU+pN1LkVKwVy8CcZSJ6QvQu28o=;
        b=pC1jxDDNoUz4OKOW+Kl4Mtm9vquU1c/5C+xAAo9ySB3gFzUVQ+yOgyOwUy+5pb+Kqi
         tS+GnTYF16yUhia4g4H/0Z5mi0BrnY5NlKV4+jVdiqDKM+SBLHzYn9qAOGi7zJa09Hmd
         jjU7nvzPxQopO0aaHv0cbVFiRdZe2TXKMTOjzfWM50+kZEMwgXKQpkLvzLgiSa2UBZyc
         WYNXGcFdIPpj2Fnoy1fni2oQsvqWPN/gYtBGEnTpQ6JcuF8Pg+P6SJwnoCbv2tdloFgB
         horVNFTMOgn0HbCkX6vD0lAQrR1nC0kbOD2au0bZS0FnMdKV6b3ppBE0Zv1Hh5e6ILJm
         Z+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780226346; x=1780831146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOYgzo7itwY0lp9mEU+pN1LkVKwVy8CcZSJ6QvQu28o=;
        b=GSiXWm9KhX/Y/BHQAnlVB2DgFiZVchjKhOYKqE3BP2+VfW+34wXX5c4i9LAEmpWxrE
         J2UVlv3PoWwLWnXJHU3vuYtSRqcnDLqnbN1soX+h4f0WfEmI9/ffm6EGwR0UwVgQxZQf
         yvaZkezQ1uz6NaelaIeWnyzXXOck+7ZPB0wAdGXk1089vmG1Z/FjO2MVemFTVhCn7pzZ
         qkovsL563lnGJDjd6gE15xIyrt9CQdXVbEzeR/SYpHIR5TzsOSBFtH7MxK4WYDPPxIEr
         i5+P9iRmrK7zEFYHsiDbBfnIcjIeOL6mE6zt2Pb8+YcTTCBsBwX/E3KtV3iOZvivAUpI
         bI5g==
X-Forwarded-Encrypted: i=1; AFNElJ//rVjLiEtZCOYKvlBGhE/w07pd2PfOKl8UGCPv9+SDBtL8nyq0uqOvbAdCTu/wOpqYmqmK15iAbHtJ28r1qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk0OtBzvVo9Vqn366FH5JKPTxfRP2jyCOCc51xaojgP4PWZR1z
	1+UHafcO130+WUkR8Jgcwk3IUglc0VLP0N83YwBOWvGECXh4buh0F0TG
X-Gm-Gg: Acq92OHMEhKeCGc0xhh9w0RGyD3hTJgDQ9YYlAy9lgYcsJd42N82UZX94TfRhxwsbE0
	zY9w6r7hoBpSQWO19PpflQUWcanI84d5lGF2IKtp3mtMHmyiKB5Rk6CfXuVSsWQh/fpvzH3FyZz
	hC3IQSg89BvqTp/40ByjgBbnbCiH84TM3RejqxF3dUNbwgdYNzK98fkRcabJA2gw6GMCH/qLW6t
	Em+SsIHyLRJDUyXBd/wbXtpDmUdVP+6hMwvMl0thnEwwoj4k+jwqFpDLm1SV017NU7f04pwSUts
	HteLxVconajzr3LBiH4TWRaN9Icq9iCa48/UF6buJWJoUiWyVNhVZCaHYvDvINAcm7vX3JxiUYJ
	zsjVtOtqJUFcrWnMgr6E4NhOZ+PV0KRqouHGCfn2V76NkKqgU4+Dsg9AT6uv8j2k5VjNuXZNL9U
	4F7uFpNnif2KdGjWm/cqff5aaIlm2Edbv9wPruEopr3rymAx/M9Hgf0rigibTHj2U+vzLSl7WIF
	wAQYyNsTjooxVfWFwW5f8Ryo1Es
X-Received: by 2002:a05:600c:19cb:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-490a2a43c41mr95979345e9.9.1780226345506;
        Sun, 31 May 2026 04:19:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:a56:5f40:7f5b:a451:5388:83e3? ([2a01:e0a:a56:5f40:7f5b:a451:5388:83e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6a0e42sm169849205e9.8.2026.05.31.04.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 04:19:05 -0700 (PDT)
Message-ID: <357ce503-cc2d-43ae-8f58-ea3b980f5780@gmail.com>
Date: Sun, 31 May 2026 13:19:04 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: macros: Replace match + panic in const context with
 const expect
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260408200949.99059-1-delcastillodelarosadaniel@gmail.com>
 <CANiq72nOHYHhUuyYiUhwmZQoYYP=YdWZjHFsGi6d15DbKzXjeg@mail.gmail.com>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <CANiq72nOHYHhUuyYiUhwmZQoYYP=YdWZjHFsGi6d15DbKzXjeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/28/26 11:17, Miguel Ojeda wrote:

> Please shout if the author adjustment is not correct (and please check
> your Git settings so that Git uses the right one when creating the
> commit for the future).

That looks correct to me! Thanks for making it consistent.

> By the way, `scripts/checkpatch.pl` can help you catch nits like that :)


Will use it next time! Thanks for the tip.

Cheers,
Daniel
