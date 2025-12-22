Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9581A5B9D
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394062; cv=none; b=aCP31A33gCtK6igi1Ji2Fcj/eph+VgRemlJxcbZVyGLeHdgI9V4+6z5XSOR6nv+WAmEvnuvvE12bTnxVWkCBvDD7kd2PRRy5SWMQ/R7J/FzFJ2Ah+sN/tfvmgvDDpukystf4UAhIYRhWobdEVC6A6OT+JTLiEKj0czTwRHJtqK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394062; c=relaxed/simple;
	bh=7JbjUpfRtcJDQTbUr/o8/MBhec59OcUt6gwi4/rdI/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oT/In+/zz0YL+XbSje/Uas/iIhE6j/o3eRud1U+9H4GoS+bLXqmqXs7J1p44G0QcLEJlOJeEhJPAPyIdMmZ6Mhk6ygqilh28O12Kwa9pNtXV0+kXrQuh0HY9oGCGVbJ8G9DPlpQIOWn22CGJDCS5nDVG+15V5rJkXpZB9gBnLNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sc97nDjX; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc97nDjX"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7355f6ef12so677760466b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 01:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766394059; x=1766998859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pwRJY48dxTPs1oTrj8n5Xyh/tYuVrBXkK07zh9sBwxs=;
        b=Sc97nDjXHbB67RLgcIECMXPhcwKF4/MJLeRR8+ZuBsXA6xph0jJu9i/e4XnlYpaEtm
         2RfkTtvlUjWsiCcqWAiRTOVDymSu6YXs6jX8ISHRDyuPeTB8Qwf7maxu3bWZuhW+JwkE
         NiTLEsgjyFj32a1NH8wzPLeJ7zU+QDiy8UUfvtVm05s+RCRcYSF7NUVrYceBu0A3hz7s
         EjhUHrpBBVrwg3LroYKCr9IzJggiafhkYmyrtsIw52VQmxZieiJHPnF4fGtD0fJai/vI
         +pHaoA6AlFkSQNJ2518meYQ6ouwxHOuse69/oNGU3geHt/UDMRQ1RHYaeh4iYzVtq7pD
         yqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766394059; x=1766998859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwRJY48dxTPs1oTrj8n5Xyh/tYuVrBXkK07zh9sBwxs=;
        b=Qlvx+B+XTstiMXgji+BYnGjALi9NrKYQDkVO0fMoLdCOd1UicQhv3Nx79QTxlW8nWc
         cxNSAt10EnQSMOnMG/zLf4lLdXmmnFLRtewszjD4cQQgUBe1CKBm0oV1u73zZKTtyCoE
         1NINg4nGmLS3aOjCnJNN7F/q2ixKgAYcDUJzgmOHZarrXMZqbcVcessbYroEwy0vrBrJ
         jeGXVayp/9ZLCdP1S4B2kVNN0r5UYx+Uht+gj8fOQGFJUSBvUn3ICtZ2+tTKaIgB4Grt
         lV54lhHq6dNTP8OUBGZXP+0KYLI1AiF9/wy/YAgDwBdDWnMbrt/GvdXPOXbMBeW/C4Ww
         zCRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9L7PJAdVQzmTHwaWaOKEMx5wxEbsaPyVu4SYvw4lWYdtuirFWxtxh4+NE0B4wpCw2WcGDjZrzCPu9H1Wy5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvjmL84YLUXnWPo65HvXV5V4BZWAXSZ/svLoCHt8QyFwDpYRv
	VTuT2lTBgV6qmLEegRnTVtc6hpWpzs3pCu1HqnkvaVHI7q3VLA4A3QF0C3PoEIHM
X-Gm-Gg: AY/fxX4V3JDtQoekLMrOZ2SUPBnse83Gx8KgHr03krn30hAooE/pL9DzTWq3kbjHQh6
	jLyKORuXRMIdakOZA/3vjxipmdIZpt0DB9dRS/9LOP5PA1QJbQEQh7PZsWeyljCYvwaKcWlBH/x
	FlfSWe9kre6zncNgq2lOnpQdYxA16WEYOiPV8CM5Z8Zyrzolz02v+bnz0WqlofE93Vgk320j+Qs
	A1vUlu5VhH2M7l4DCLuYJzg6NC5ENFy8JDzNq3Ls8fLfV6xwctkyY7detmCWPiv+ViMfqiOkivo
	wkQNcRCAjmdN51UpoEGNyToPHMJMANV4NzIqVZAnbxAbuXcHi7RWJ4jTAXE/veFJkXl09xj5y9q
	lWjYGY8I8wPctJjcZP8ZVAsUzyZ7AGKonzUtgMy7tixKKUJq5ohQNfmagzIoYVkA0g7fhtr5MAq
	4xTh8VRz66YtAOW59cWxZKFdRjO4cam/v9h/uc38Ta0PFagLq7dZG2ZO+nW/SSIHq12lWY/D1On
	wgInRBio/hrOHv8C1Ze8OIdwIC+LtUU2F0FA00mEGbp0w==
X-Google-Smtp-Source: AGHT+IF7ALpzL1gY8Ty9xkngtZeIfTvDYqIusKSKXf4paJFRSQtinRQWNbOMeFi5eWxXfYNiL8nLvg==
X-Received: by 2002:a05:600c:3b07:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-47d195917d2mr96907475e9.35.1766386967128;
        Sun, 21 Dec 2025 23:02:47 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:c9b3:3e5c:bfa7:af26? (p200300dfbf2de300c9b33e5cbfa7af26.dip0.t-ipconnect.de. [2003:df:bf2d:e300:c9b3:3e5c:bfa7:af26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm20819355f8f.27.2025.12.21.23.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 23:02:46 -0800 (PST)
Message-ID: <5521e98b-e12d-4af1-adcd-2dc56863f90b@gmail.com>
Date: Mon, 22 Dec 2025 08:02:44 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pci: provide pci_free_irq_vectors() stub when CONFIG_PCI
 is disabled
To: Liang Jie <buaajxlj@163.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:RUST:Keyword:b(?i:rust)b" <rust-for-linux@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
Cc: liangjie@lixiang.com, kernel test robot <lkp@intel.com>
References: <20251222034415.1384223-1-buaajxlj@163.com>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251222034415.1384223-1-buaajxlj@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.25 04:44, Liang Jie wrote:
> From: Liang Jie <liangjie@lixiang.com>
> 
> When building with CONFIG_PCI=n, clang reports:
> 
>   In file included from rust/helpers/helpers.c:40:
>   rust/helpers/pci.c:36:2: error: call to undeclared function 'pci_free_irq_vectors';
>   ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>           pci_free_irq_vectors(dev);
>           ^
>   rust/helpers/pci.c:36:2: note: did you mean 'pci_alloc_irq_vectors'?
>   include/linux/pci.h:2161:1: note: 'pci_alloc_irq_vectors' declared here
>   pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>   ^
>   1 error generated.
> 
> The root cause is that include/linux/pci.h provides inline stubs for
> pci_alloc_irq_vectors() in the CONFIG_PCI=n fallback, but does not provide
> any declaration for pci_free_irq_vectors(). As a result, callers that invoke
> pci_free_irq_vectors() under CONFIG_PCI=n (e.g. Rust PCI helpers) hit an
> implicit function declaration error with clang.
> 
> Fix this by adding a no-op pci_free_irq_vectors() stub to the CONFIG_PCI=n
> fallback section of include/linux/pci.h, keeping the alloc/free API pair
> consistent and avoiding implicit declaration build failures.
> 
> Fixes: 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI is disabled")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512220740.4Kexm4dW-lkp@intel.com/
> Signed-off-by: Liang Jie <liangjie@lixiang.com>
> ---
>  include/linux/pci.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 864775651c6f..b5cc0c2b9906 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2210,6 +2210,10 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>  {
>  	return -ENOSPC;
>  }
> +
> +static inline void pci_free_irq_vectors(struct pci_dev *dev)
> +{
> +}
>  #endif /* CONFIG_PCI */
>  
>  /* Include architecture-dependent settings and functions */

We have this from Boqun already

https://lore.kernel.org/rust-for-linux/20251215025444.65544-1-boqun.feng@gmail.com/

?

Dirk
