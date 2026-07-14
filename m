Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E2143B48A
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784019579; cv=none; b=K8Q1qICG2Cfj3pGgjmK22qhYBGB5ZsBLRjeS9YCgNiahf3hFXjtWke0yecZpWTJqu5deXCSiRWA3Rg9c28shxNRBc00VHs9s4El8OihpPvXWrWJjD4uvLzqLsbjH2e2T0hrPzkzuQDkjOhMeghmlVcCjFgrlh4h8jgIRgG6cYh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784019579; c=relaxed/simple;
	bh=eDQ47pldprt1E8F8vtbRapvR5r2on7TmJn0NmPvSu0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hb8Ju//exp3YK6vmrSPG/TdDhDnWmUXXcVpKbypad0QUKbGKDgR/wZHs9W602ft1lbkA4izZ15iMpLzpWNXtCve9jPHPibwV1sCzdFKEd+0CYnarn/HXEvb0sgNhCRDQaFvFfxDjKzKpoZI3hRpWmL6OoZzTzyOOspnWevd6BGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3kvRlXF; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3kvRlXF"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8454160043aso514504b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 01:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784019577; x=1784624377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgawkwvLmNqS05KN4743zXsQLMKXXqTfmnTO2uf0Zvk=;
        b=f3kvRlXF7L9RyHgBaDS1MEGXIVRVi1HoxuPL2VjrKcgPlhk4i2c96LRHsNMBZhe6nb
         ZInmzDuqmtjHaK1XDyhT53hNGzW7ibNUeXn2lkPvKyd2zQ2Z1ypDHxsRh7a8xE9dbpuU
         WfjcKhGDBv2VXMECypoGIArs9LgkGt1IP3tqQRRjSUKfwTQCS5p/9MD6SI+ORHDelxBe
         iAiRxxVNF7h7eDfoVnWXAqSpzO+rMK8rbelIiYd4OahU61vRR7YvvjZ0RgmyGMJJYR6a
         lDyDXErW3Ux5PM72PhNsXqLaAnBgSwJ1Ap/fWyualHLRznzk9f2dsTkVXWTmdn0uJWAs
         KybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784019577; x=1784624377;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgawkwvLmNqS05KN4743zXsQLMKXXqTfmnTO2uf0Zvk=;
        b=pHXzlcxXqWwD9W4v6Is41x4Xn69Ikdt6dQipgVgPxDnlsWqL1kmgo0/QmPUaIb4cbb
         GWXvuNtGmsaX8Jnv9XOpGLYz+atVywOK9O3fq6o/cJvPp/++JsKtpUBbvmga8EezCeoA
         XP1Qc1C1I5Gald8WAO8CMXtDS77ldRbqvtCw3bNRTU3mLutH8xW9MlEmUnL3Ej4lu4ES
         bXOU1NtLm4AGggw6y/Qf/oNqg7/xR5+ynUTSTURHLI94Cpv0pVBqh1K32n3VVzMsbL6m
         YP+1qg+lM9rdxT7xQN4biA6XaFulbyRxArzfa6fARUvUIL2BNvi06zgnYBcQKzE6K7qy
         4oOg==
X-Forwarded-Encrypted: i=1; AHgh+RquS7RMvnLaqDly9O2JS2EVSbWEmEKU03rXiIIp19+tjzsgMwnMYFmt1sZCFM4uDNkJjw2wfkqvuInMGJEZgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXP1vle/zvY/U/8JOPr/OPVjZP2kACOzmIp26FQwYiVXyIMgAR
	6fmrH+qETt5ct857KX8Yw4zRxlhvWm3+vDOMJFkp2MW+T7soOYOz0Z9p
X-Gm-Gg: AfdE7clUDpeuHOXWUaT67n/Ly5kujSJftzSyqp61kT2tzBscsUEgAAif6X/WMz+a02b
	grJEw8T8R60O288oBQMGYzDi6CH+SpN1G6XTABxt4EYGCTNWjIOdQDwgZxk1MaeMs/ZgN+XVx9Y
	kgNnGaDRbWivdXATQhdeedPD28VV4a/I9aUZH4SUSt2UDoFcgX+rC5Q0DrvMHu8UXp840hXkCEX
	JzyiTPW2IckVyqgudzUP6HlMiZbZ81HkJsa9HUoPNXXpdQeHseB9jMpcY6Wkm8bTBG+Jo6ApZIv
	H0lCDuQFpGIVdFzbA/Anw3abzDX3gfbQ6M79fKFlij+eOcCtNLfjPqUr+6XBSkCAO2ugGJsR0VF
	bMfCmE6KuepwcNTGEvpPlSc3BKnQmpZ99/rfm5AsG4c9TKkC5Wa0q8rg8clTfkDNWuLMxHhuuiz
	lbagv/OmxwbglRD0C4z1QWXmDoznLkWEIrPyMOkfJGosslWIpLhBDQ3g==
X-Received: by 2002:a05:6a00:929d:b0:848:7a8a:48c4 with SMTP id d2e1a72fcca58-8488971e16cmr11527960b3a.40.1784019577373;
        Tue, 14 Jul 2026 01:59:37 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:3a01:ce86:5400:dbd7:7cc6? ([240e:38b:e68:3a01:ce86:5400:dbd7:7cc6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7da667sm1123598b3a.41.2026.07.14.01.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:59:36 -0700 (PDT)
Message-ID: <e8013001-1adf-4913-a934-e98bed045b51@gmail.com>
Date: Tue, 14 Jul 2026 16:59:30 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] docs/zh_CN: update rust documentation translations
To: Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Dongliang Mu <dzm91@hust.edu.cn>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Gary Guo <gary@garyguo.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 hust-os-kernel-patches@googlegroups.com
References: <cover.1784000217.git.ben.guo@openatom.club>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <cover.1784000217.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Applied, thanks!

On 2026/7/14 15:00, Ben Guo wrote:
> Update Chinese translations for the Rust subsystem documentation,
> syncing with the latest upstream changes.
> 
> - quick-start.rst: update distro-specific install instructions, Ubuntu
>    package versions, openSUSE rust-src package, and remove GDB/Binutils note
> - general-information.rst: add no_std section, rustdoc links, abstractions
>    and bindings diagram, Bindings/Abstractions sections, and Kconfig example
> - arch-support.rst: add s390 support note
> - testing.rst: add Kconfig guidance for KUnit test suites
> 
> Changes in v3:
> - Add Reviewed-by from Dongliang Mu
> - Add spaces around "HTML" in general-information.rst
> 
> Changes in v2:
> - Add Reviewed-by from Gary Guo
> - Translate "sound" as "可靠" in general-information.rst
> 
> Ben Guo (4):
>    docs/zh_CN: Update rust/quick-start.rst translation
>    docs/zh_CN: Update rust/general-information.rst translation
>    docs/zh_CN: Update rust/arch-support.rst translation
>    docs/zh_CN: Update rust/testing.rst translation
> 
>   .../translations/zh_CN/rust/arch-support.rst  |  1 +
>   .../zh_CN/rust/general-information.rst        | 82 ++++++++++++++++++-
>   .../translations/zh_CN/rust/quick-start.rst   | 48 +++++------
>   .../translations/zh_CN/rust/testing.rst       |  4 +
>   4 files changed, 103 insertions(+), 32 deletions(-)
> 
> -- 

