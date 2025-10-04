Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA101E9B1C
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Oct 2025 03:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759549168; cv=none; b=Gp8YHFZjfWsJwcEYzyzZVgU1lBcNnAA98Il3p1pwuf6lVJ7VbKBouy2Ntbe30KrpWYeBUeBmZL2GLLe5rTwwTn5fe161cOw/lyRDLj2yibsprRXmmmisu6BVFPJHJx2ydw8DOyNB9UnXDI5UQQVFvElJ8sVhVq3M4pJj0nsB17g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759549168; c=relaxed/simple;
	bh=adLGxos5qmqRuJMEHd5iRNMuue96SjLLdXgZKG7WDNU=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GkzpgPzMv9TfqLM5ZTbvUakaG8Ag5+Uo2M9FTCIgjCTFBjV8Ou0hYmsjWoK8mbxZTugW5SenlECVAaCR74Xj2RnF90Ixs0Ib/V9yZ1lVEFg7xmsJEljSThQJxUtgl6jtsTzBL2z4aAUr6UbHhtzXuxoBcgpXodyl18uqkfPXaXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijbnwCKS; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijbnwCKS"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6353e91a04aso3497211d50.2
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Oct 2025 20:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759549166; x=1760153966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XJ9GrKZlJAkRDs8pcuNoL9OYf934YYPQgeZ31YeNojQ=;
        b=ijbnwCKSjmh93f+3B5NjXA3YApQGjbSMrCTTBqcz9lgUIYoEhPIKC+tDbqfCu0Bcgv
         riw6d4l6DN1nJ0ioFPUwHC+RuETdYdy5pKtdTG9EK97iQyLUNt3emX2MUDRG+yLjtvlx
         LS8LSqwzUpr6k8kP2rklHSjsLgGfNtCwrewYgPM4yCkTzQ5eCW7ho8X/Mxi96oqa1o5G
         17GgA+5KQsD15RhvpuUA2HOskmqpnLmGOry/2cD79SP+1p1xKiaNqA7Ki0YnCk5fCBbq
         XbaQ8JY2i657fAYW/piUKWa6crRk6yE13C0t/Om2ROBxE5lltoWUCiFxe3gsHdc9IJ4J
         nEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759549166; x=1760153966;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ9GrKZlJAkRDs8pcuNoL9OYf934YYPQgeZ31YeNojQ=;
        b=wDVxMNMFn1qykspYGfUbtCnP/Tcwr0VjBI8kAyhQBWzINmXlR1L/cPtj4Ep3I6T9Gm
         5CyZ1Td8rE0+CapGV4145DN4Dm8Vlz5HOKAf6EpRuynNN5QPwqST7hva7k/xtbga6mts
         /cv3stnoOng6oUczabcmEWAcAT8BDTtkjineunUEhpkspoRfTCd9ECdzGN1L8aA/u29y
         RqhoSUREvpVU/Afm96ukNpxpqgsDvK81mCzBf9gV/zXV+wwlO0Jx4TpHERaO4s1WIL6O
         Mo+S5tq7hvmxmji0V3YKJ5w5tRrSJYI1iP+96Kw+N5SgrLF4jnCzTkVbSS8Bi6WQ97VT
         BzxQ==
X-Gm-Message-State: AOJu0Yz0im0ILTbb8x5bdMOgr2NCaPAsOw3WMRDZB6+iKtsxMnHha9i3
	CVyCv71Q/5JJcyr/e8G2dxxR9EQFsugY2R9wBtckPkB52VFc/lTU02AB
X-Gm-Gg: ASbGncsKo724MnbP9njVq/lVvH0XkbqyU1PXarsnXf2zBX1R6doUgFmGFxBp9mAQ8sv
	TEQUbCt/jPaUQ+7mmkihpW5RT+Ldk29MyV7lnVTLmTU9o0Ne5HTyfQVuxerLvk68IX8rznnvJnY
	//zMxoPuIppy36qvSi8XqlSZiW577wWIWkxlQyhz2Dvn0nd6cNZkrOKiJ98M+REI2ESFfziXYRI
	+2p+fMIXUNlandcBVIIuWgSaxYcaaJXIuaN2hzUVFTX5TNJNqwKAgLucgwywahNHBdmyB4GD53O
	mOVYVnQCj3ZRFaTgImp6X49sYojZ9W81YCR6XZfhNBA7azsTDNtkr+/AftK0RHdY2KjJ8mJIi2U
	LTJ7QkjTXVCAD2JM3i5eIqy9BWwwp7BfmxUoGrFkiquGMye9H3616BLq4I0xSX77ixNvRmgHPm6
	BC
X-Google-Smtp-Source: AGHT+IEKZvWN4IhopDHTsskInMYzN0OVIkAxgqusRW8r17U6C+PiDNXpSR1wTVqdnpL2FZWd78muIg==
X-Received: by 2002:a05:690c:4c0e:b0:749:d874:e66e with SMTP id 00721157ae682-77f945ef5c3mr72382767b3.24.1759549165127;
        Fri, 03 Oct 2025 20:39:25 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63b846c9bcdsm2324131d50.31.2025.10.03.20.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 20:39:24 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <b5efc638-ab7c-4639-ae7c-c0f8f8b4e765@gmail.com>
Date: Sat, 4 Oct 2025 11:39:17 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
To: Vivian Wang <wangruikang@iscas.ac.cn>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, Jason Montleon <jmontleo@redhat.com>,
 Conor Dooley <conor@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
 <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/25 1:20 PM, Vivian Wang wrote:
> I think instead of testing libclang version, it would make more sense to
> feature test if bindgen the binary supports these flags, like what we
> already do with $(cc-option,...).
>
> Same for all the other version tests.

This is another direction worth trying, but unfortunately I probably 
won't have time to refactor this patch towards that direction until the 
end of the month. Sorry for that.
