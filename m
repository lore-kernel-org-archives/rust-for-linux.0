Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C633A9CB
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777395681; cv=none; b=JJO+50HmTSiR0T7qA6WqWdjosOH6bX0vKgIdNH2Ml2t4opTqQjw8HfLrrdM1WCX8ceSU+lgg8nDIh4TRrbjtvoSITPy3JgPbS5DJzlbgCnUyNavPbzz17HOQlQL2Vx3rwbK+XRTfwh9tsAXYAoE76JtL5gTWB2F3xu/KQyoDQL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777395681; c=relaxed/simple;
	bh=24rly7mTR46SDbTB9/GpQSpB0zd1Sg4TfmU1mBbtSvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TgnsroqugKhjbxT6dQ6Yaz26NTjlGLV1u4anKamF2OI/iUoBLKZ9qFuvxryACf5SSzrfVhrzPZsa+0e96E6r08fb08IhtuVTNRtxtWVj4C5RaXX+CujP1r2Wq58rbwx9/nImHwWcRdthdryD7VgGZzyd3JNTj+Cxrjf74UWe3s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLrbqULd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLrbqULd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891b0786beso84401405e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777395679; x=1778000479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=24rly7mTR46SDbTB9/GpQSpB0zd1Sg4TfmU1mBbtSvw=;
        b=CLrbqULdQIzR8A8Zn7tf756a+u48fg7UF0UZ0JVC8xYnNxP71vYXEcGT+H6RvEGtTD
         8jqfLKsIvz/GDJh8ZtwBvYOyDsa7wlD7g/HsGYI6HVdcgpl5STYh7+rcxb8cnhuvUFBE
         ceVFsqfOSCyyjvbu1WPwKo3vpe93XhIva7slM8uonlUTbSzMPfvNP901ysdI9qE22yyx
         FFZjhIhvxN97/EcZJwcZEv6Tom4Y6sx/L1Jxevipi1Nwwovdde9g2LM0jPOD1kb+5Ue9
         W26KfXJw/SNvTmFRjE5ayrcdwY/MnejsKZ4aF1yO/UoZrM1k2yHnTgkEjQUOuvJ/RFAs
         628g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395679; x=1778000479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24rly7mTR46SDbTB9/GpQSpB0zd1Sg4TfmU1mBbtSvw=;
        b=HPfNBSIfX37gwKWiyhZ0RzFP75wsvaqBR/c8GJwtm0UudKcKAQ4FRavuzhcdMWsAjQ
         rosrhPB94pH0eh443vE6siguDCDAqRXlQ5WSD5e21loffBYMTN3fBYhwufhEgzJ8/VmW
         yLL9rkDNUhSvgY7vrs2sS4nyhAmtsQr/K5rgKqQH+s23pzwr/yRMer50vQverTw5TVH8
         neJ/jVJU2B/J4Kd/XNNDt5GpnmSgFBhXFkQkcq0f7WMEEhQsjvf0FNy/rvqr4aRF+yxW
         nH80lxal/RoZwZC5svIm8phh2GzGvPfmcWX1SaHhhVmF6WRYIRRKH+u7KfuZqHs6EnlY
         dWfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nfjL+04nqOnw54Mpq3+c4Q7M56glDX5j9WGyP2kOnMDXG6CiCD4dmhzzTQYokkUJU0BrVh/NfFK7nFS4mUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd1zgu4jUeyj3Kod125LbJ3rgNhovS8YPmprbvxNjb0Qjv9mab
	I1PwNsONCZRx85PZTHS/GqnwaJyUuYJX/OBOvLFmbg5Ay90USi5ecrw9
X-Gm-Gg: AeBDievOVVweLs3lQAykNzK6YV/YvT1dasMXnQ2DF+I3r4fHv5M7v5TEH3Y0zCASO3k
	5b0IzX2yOgT13ATSAxvyT8IT7Oe3hCebRgitjGjBjZ8XCa77zuDr742sOMzYQNwJONAmkw0hjx3
	e8M53HnX2BwnEYjpRR4L5lT9OEswvXiDNMusZVwXFfp/qNZpfpI/pUVlmBJCIyQjgVjwBWkfdIO
	p9Szgb96ZRJ/NyNNwNYsknBu23oREK5rmNfCUypn+81AG7sKbMTmifJKoXtFxCVt8OY8OHOtdLs
	6Nm3qsFE66qaDxH0wZJl7ytcGKqnXZ6GZpi6soLViODSQi9DOD1jUTbRCDZ2h3qYskWbTZcOUd5
	zhv4LGhlkN0dYyZm1ed8w7IfT6PYMek3BAcw6wxa5VCJw5OR4+pKboWy/GEjAlSTVMWxtvftkga
	XBK4JLx1B/KIZ0HFzmOXs59hn4IcHmgtW8iibHYPbKGaqQpyLGLcR/Et2UB2K8inb6/KkmAQ==
X-Received: by 2002:a05:6000:2586:b0:441:1e8e:d8fd with SMTP id ffacd0b85a97d-44790753399mr154751f8f.29.1777395678473;
        Tue, 28 Apr 2026 10:01:18 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f5b50ccsm6953389f8f.24.2026.04.28.10.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 10:01:17 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <d72badf8-7d70-4caa-96a9-d77e00bbb536@gmail.com>
Date: Tue, 28 Apr 2026 18:01:15 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Arnd Bergmann <arnd@arndb.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, ljs@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com>
 <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
 <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Apr 27, 2026 at 9:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
> It would also be helpful to reduce the number of hard dependencies
> and ideally only rely on packages that are already shipping in common
> distros.
>
> From the dependency list, it appears that the majority of dependencies
> here are only indirectly pulled in by 'reqwest'. I guess is only
> required for dead-link checking, so maybe that part could be
> made optional?

Thanks Arnd, I've done a deep dive on this, and found a number of ways
to reduce the size of the vendored dependencies:

1. replace the reqwest dependency with the smaller ureq,
2. remove rustls as a dependency, and instead expect the user's system
to have openssl,
3. filter out unneeded artifacts (e.g. none of their tests or
docs),
4. filter out non-linux platform support

With all of this, the size of the entire tool source with dependencies
is under 50mb (about the same as the perf tool).

And then an internet connection can be avoided when using Make.

- Julian Braha
