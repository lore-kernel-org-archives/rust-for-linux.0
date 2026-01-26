Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DB633B979
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769436794; cv=none; b=OTTBo/Zlm+HeDiQDipGUQSfBnce0OjedzknspV77n2S7nydjkhiht/+29nQy4lC7u4EqYInTL5A0kWWHdSST0B1oixZKXZMebddVOG5a89gkvO69ZDq03tgWccFh0KTjOGWbArKp67+LiWHGPnOUfe3d0tUCmDN+/xoOH+Jl6Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769436794; c=relaxed/simple;
	bh=wXseiqG0bKg0e46RCa4v4KA2nNGw4UAJFJlMfZjr7fc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bDDuniyjKa5bjKnCFj/WPSHP4QlM9hR0HpwHmv66B3dqmsLD3L106IPOJqDO9EifD+xZv6t95GSVL0uZpf8GHaTVXENDXowj+eBVYDMD4usXDf5iOoRgvv8iq7MwD8NX63fUlbcUZRdF+G+soZMQgdCD+W32Q/3/9xJOKY/kKO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=ovHPr3Ad; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="ovHPr3Ad"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c635559e1c3so1367255a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 06:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aliasing.net; s=google; t=1769436792; x=1770041592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpC0dL7b7IDa6tRe7O4c/NGlX2TCCH+wFh7STtc5K3A=;
        b=ovHPr3Adw5aM+W32ygHY6DmE3HxNh83jb4hNsBs43g1kZS4LOJfBTydka/DSS2GlT5
         8JV/QZD5h6tNT6g945dXJ3Hciv50LNGa4BIAasElcndJcDkHuXPNVoCBTzA0++mLJ4Y+
         nKBYqIRpx9zz0+eBsSNheFHI074ExsFtQUmIKhzbwOCOnBDy4/8Vq64Ta99+yTfjaf+X
         e6IRHCNvQUAZn2EghBAaOAN6b4mKZ+meBbAa8YBR6MEQT8TsHqhXfBipgvK9fKxRuPnL
         2gTTG2wSOppP3jw83rlt1SVZAxTCFT3D1qfjRul3BPrGQnlDYWP17k1A//0QLqekVkpv
         R1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769436792; x=1770041592;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpC0dL7b7IDa6tRe7O4c/NGlX2TCCH+wFh7STtc5K3A=;
        b=fEMXZpb181Dl+0wsncxJMINbg+Rv9sXfd00TOrMR5EvyRJ0pn4nfnluXHgBtg4NUZA
         Hsx+2PtoiCAsSvRZ/PubjEyqeLgHuRXJbipe8qG6kA7hCMS8itpW/jhDNSqCZUHWIrwB
         xMVA9k0er+r9KQwltWZ7WVLLLSefCx2a1YPTY7YFSXBoeNJdcEZiDrdC+ZqRVF+1QOf0
         w2wLPo9SAU8MPr5gUnr6WnhREZOIxxYjU6wdkniwKlVWbvI7u7+CTioSSGzLvF8zcvCR
         shinA/A3fu0FPvy89qvGi8Ml9c/z7a7NgaQ/G3fFGzlZsHWWT8Nn1g+AynJ01TOa0MPl
         o8og==
X-Forwarded-Encrypted: i=1; AJvYcCWTD8pDjZZhmioQWqrMJj9YRjxGeEwAx38Gs0WKyFI69ypTtPVtMM8gxczWsmrKAy771pVPsswBu7RxKEwSxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF4qH4dKwUXLNLHvTzLodwEIobUREH0iLQ+dccmVodJvcKjBZM
	6eKIRoigr384pHIqVu+Br6pgzY4vImKBRRXJvd/tUfkQf8DFQurTiDOxJZZqNfMazvZD
X-Gm-Gg: AZuq6aL3oc9SFnolORU4BH1n0nI9oyf1WX5z2XEgDTPwpsbKb1dp3KyXez6iKd941Zl
	gwiHBLloJpzEByNo8g7lgUzTuvw/a6aYh67av1ac9coQA7htV/C6T5qW4FCUypLfUaWUl4iFOoE
	u8ALXmNSpgrOK9B5zfYPQhqcjmwLys3VvgwBbUDIVY9i8jk/GQFxkVyf2zZ6nGqUreD7oBIJ2rN
	ebeAV2N5/zAu2FMwUtfuA9T75RaBwrkpZXxxMusLJXRtuA5gPYJ2GN6MUj+JcTMqqu/IySwtwX4
	SGkacl0/iOjEzviFFg5FZ12f0fAwPXT+i9AqoHMzmWnGO3TE1VyzTk1to8Qla0el0uBt13kVhGh
	GbYqQH3c8ewWgKV31jXR6vWZ0e0EWJ/RZKFmfcvgnZeCnfqPrASNP3E0KIz48WgX8rK3QciJ+fI
	b9t5uXDe/520/LCFrehaBShLD5rlRSGkmX0bXNg169SRMrsd7Hn9dSYpyK
X-Received: by 2002:a17:90b:3848:b0:352:dbcc:d74c with SMTP id 98e67ed59e1d1-353c463c9b1mr3869575a91.15.1769436792106;
        Mon, 26 Jan 2026 06:13:12 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536d88bc55sm8845087a91.4.2026.01.26.06.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:13:11 -0800 (PST)
Date: Mon, 26 Jan 2026 23:13:05 +0900 (JST)
Message-Id: <20260126.231305.17475057092261789.tomo@aliasing.net>
To: gary@garyguo.net
Cc: fujita.tomonori@gmail.com, boqun.feng@gmail.com, ojeda@kernel.org,
 peterz@infradead.org, will@kernel.org, aliceryhl@google.com,
 a.hindborg@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org,
 lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] rust: add AtomicFlag::get_mut
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <DFYHRY9IB2ZP.2Z70E6XMBMEL3@garyguo.net>
References: <20260126081013.3616346-1-fujita.tomonori@gmail.com>
	<DFYHRY9IB2ZP.2Z70E6XMBMEL3@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 26 Jan 2026 11:41:54 +0000
"Gary Guo" <gary@garyguo.net> wrote:

> On Mon Jan 26, 2026 at 8:10 AM GMT, FUJITA Tomonori wrote:
>> This series adds AtomicFlag::get_mut to expose a bool API under exclusive
>> access, and switches the list atomic tracker to use AtomicFlag.
>>
>> v2:
>> - Add AtomicFlag::get_mut()
>> - Make AtomicTracker use get_mut()
>> v1: https://lore.kernel.org/rust-for-linux/20260119231757.3460885-1-fujita.tomonori@gmail.com/
>>
>> FUJITA Tomonori (2):
>>   rust: sync: atomic: Add AtomicFlag::get_mut
>>   rust: list: Use AtomicFlag in AtomicTracker
> 
> Hi Fujita,
> 
> I've not had the first patch in my inbox. It appears not to land in
> lore.kernel.org either.

Thanks. Recently, sending from my Gmail address to vger.kernel.org
hasn't been working as expected (e.g., long delays). If it still
hasn't reached lore.kernel.org by tomorrow, I'll try sending it from a
different address.

