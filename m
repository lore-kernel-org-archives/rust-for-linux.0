Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028EE254845
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754642471; cv=none; b=pRG+cCKkCV8K3KdzGQcBLkMex8ZE+ZtM/kK1fp+zZ1nIdHyUa8WjPyZ3r8gNhhJlWSh/hUfDeYeslaxLN3ZQ6cSA7GTqQcNKyXTxCK6bxt+U6tStuEkG2jYksgFHjYxa5uCY1bFyHhhLaYFJVPTApc5jajm1ggSkkUAU4jNgVJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754642471; c=relaxed/simple;
	bh=vt8EUd+EOlN6ZKFBGPVsQIVl4bHNmkBKxtFtIqjbdN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/ZGRVrj8OY88kCBnw/FMGDJ2awjmR7PKvxaKRj0gXDcJ1YQ1I7Jf+9PUtQbRgvkDYOTIR8B6dWPs+yWzE02D2eTTgER0nVh5SQSF/NAOtF8J1MVtpsavx6Qgybh6gci5oUftJY+0/AxUIBwhdVaCwAREzwRzACcxZoUG+vKn9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCj6OIFR; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCj6OIFR"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-332590cc87fso16350671fa.3
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Aug 2025 01:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754642468; x=1755247268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGxwxM3dy+kkGLFyOoV+L9iNKJd24ds4MA+wOJV8RTQ=;
        b=DCj6OIFRmZkeme/4upC7XsI1jh0C7JZkCDIgQaTkwD2pKOasEsmx5PURHCTkMysKOG
         XgTIveS0kS3EzfD+wj3UZEsuxPQ03uRQ/wkGk80lbeGPg8OnRYg73pjZpS/3R/8HxxE1
         CJIGSmBNDoGU4ovSM+XnHoK++NT5b5pBMkIEU7iT6b19m3LUVo3WEQMBtfVWDjgfYGJ3
         BsYhW1swaCTgxbQwdaoMjcHM/uqubIrmI9xF/4vYCbg0mod5/9thM1bOgaevye8qYDvI
         WNIhoiYhvTy/8AXhDa/J05519PXBMjkG81NsDTE/BHCDjJ4E/tiu7tl5lk7d7DE7pyww
         Rf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642468; x=1755247268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DGxwxM3dy+kkGLFyOoV+L9iNKJd24ds4MA+wOJV8RTQ=;
        b=vsQLE/F/tKTg/a5hGsEI7ihwcsjCg2cZ0/RMLyacd4a8TLBhd1Csf/aefI2LFwMlNk
         LmbMHlxS7wlEDMBjVMYwCmtqdbai6qm13EcwZR/ftfnGsKh6mTbUO+PsjSsTw00L8ZaP
         v4zZQGXmju/yDFiedMIDqx9uA76gFsr3UiZPTCgW6tsIQxYJkSV+7ffyc5fVOo67PSg0
         lAPasln5m7OgRWieLpGSCZdgFKOxmhSLkb/jXVZhE9Xrg5k+wNThPea1g3gpAV05M0TD
         LjbkHJDckr91wHdY6ZE6u0te7JXeMRfV0l1EobPNop4D0vPs1mHPmwwjs1kipUGzfuv9
         i4gA==
X-Gm-Message-State: AOJu0Yww6oYxOgeEgOFuEjkCQ2Dd901a6uwd1CZqH7owzyQolFouN24X
	Xc1ogWQRYq2ddTPdrQ3VsEZE2ykXvANybEn1nlvzCLRGsNlMXXn85A6d
X-Gm-Gg: ASbGnctmgECwkroXaIawq2PLLNIQw7vUMpQyoDV6mnkW5PkIbj+vfyTOvxJmPkY7+3g
	w7agLxCLhKIM5CXqK9joDafwR7B9v+81CyxHueyFDbXoldZL6FLFIczj7L8WTXbWT7mLQ+ZzmNz
	gKSctneWb5+AaSjMx9C3xJU/5CUZmi0v6Nmb1f8mX/PgmaVlT4P24vtqIWuOoTeGN01GXkWXbXv
	Ic2igVsU6zFxEld9PiGmlnc2CsRvdnK/GAjiu8/FzIP8GHp0RoIM/z2ZvLFg6G0eiut7F3RqrwE
	Bra3PyTPEK+4Molm7NdEMcLD1GP1E2+QxKqsvZmX4Zt0fjM4UrLsBaQmwIeZQoK6FgYzV/x7ddy
	oqPMMeHvogPUGiGxhr3lTy2d1YcKIRV2bwjPtgjEwLezeCXT+6gjyK70Vgh43Uw3bu+/lH1Axx1
	4=
X-Google-Smtp-Source: AGHT+IGQrr45mdUxPt8Y98JuOHuwco3zjkaR93W2VxAen8YF6WPFBe1au/ikkVKZSmFFPok96tmY4A==
X-Received: by 2002:a2e:712:0:b0:32a:604c:504e with SMTP id 38308e7fff4ca-333a226897dmr3697761fa.38.1754642467839;
        Fri, 08 Aug 2025 01:41:07 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388d5e1asm28596481fa.51.2025.08.08.01.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 01:41:07 -0700 (PDT)
Message-ID: <67c53d7d-591a-4d17-873e-eb516c202a24@gmail.com>
Date: Fri, 8 Aug 2025 11:41:06 +0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] BorrowedPage and PageOwner
To: Danilo Krummrich <dakr@kernel.org>, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, Liam.Howlett@oracle.com, urezki@gmail.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org
References: <20250806205044.85085-1-dakr@kernel.org>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <20250806205044.85085-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Just shaped up the 4th revision of scatterlist on top of these patches 
and works great. I can confirm that it is now able to directly work with 
a VVec buffer, eliminating the need for a custom vmalloc_to_page() glue. 
Will send the next revision soon after some minor clean-ups.

Tested-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>

On 06/08/2025 23:50, Danilo Krummrich wrote:
> This patch series implements the BorrowedPage type and the PageOwner trait.
> 
> The latter can be implemented by any entity that potentially owns one or
> multiple pages and allow users to borrow them.
> 
> For instance, this is useful to access and borrow the backing pages of
> allocation primitives, such as Box and Vec, backing a scatterlist.
> 
> Hence, implement PageOwner for VBox and VVec.
> 
> Additionally, implement Vmalloc::to_page() and ArrayLayout::size(), which are
> dependencies of the above.
> 
> Changes in v2:
>    - BorrowedPage
>      - Add link to Ownable
>      - Use borrow_page() in the example
>    - Add PageOwner, Vmalloc::to_page(), ArrayLayout, VBox, VVec patches.
> 
> Danilo Krummrich (6):
>    rust: page: implement BorrowedPage
>    rust: page: define PageOwner trait
>    rust: alloc: vmalloc: implement Vmalloc::to_page()
>    rust: alloc: layout: implement ArrayLayout::size()
>    rust: alloc: kbox: implement PageOwner for VBox
>    rust: alloc: kvec: implement PageOwner for VVec
> 
>   rust/bindings/bindings_helper.h |  1 +
>   rust/kernel/alloc/allocator.rs  | 49 +++++++++++++++++++
>   rust/kernel/alloc/kbox.rs       | 42 ++++++++++++++++
>   rust/kernel/alloc/kvec.rs       | 40 +++++++++++++++
>   rust/kernel/alloc/layout.rs     |  5 ++
>   rust/kernel/page.rs             | 87 ++++++++++++++++++++++++++++++++-
>   6 files changed, 223 insertions(+), 1 deletion(-)
> 
> 
> base-commit: d2eedaa3909be9102d648a4a0a50ccf64f96c54f

