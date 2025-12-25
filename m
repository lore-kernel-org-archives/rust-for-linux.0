Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279D78F49
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 02:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766631063; cv=none; b=C3qda9yPAYWT8enWJUTekzBaIUWPvWJO71tiKsBrHTrBN1VXugz81pkviFmfDddDgsU7jmRLki64bBzhDRJYZn/Trs0uOpyUh4dEMAB7UWE6D7glQGmCFrPP3WUCmCO3W/I32X1MAwSBGhhOffwCeUOmQ/+q8xUc4xgxoUh3+nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766631063; c=relaxed/simple;
	bh=55ck1oHqhN2qBmKLozdN7SOIeXOnVv8WKIaEBwOKOw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JesX3SQ6aUFlvlatMyKySHFShmUAtAIZgi0vIzC9lYfuZrdsC9Fqi0MmeCgnMUvkf7ZoJefSpFaPNMHFvXCuzktA+vtXUlw+ZQZ1xF75LBYEkcvIP33IR5WqVNudJeKPUFwOTImWYyIjan+soltmSWPh7M2aI80PN0ccR3erkXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso5138899b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 18:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766631060; x=1767235860;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTH731S+fF2qOOFwpKHOlb14Z6sAgj5l1ztE5RiRSTY=;
        b=ARk7WGRrWEn6aRvJQ0rRT8f19kz29ckLjXdqIc8G+zNC3NK4xxxWnTGl70lg51CkwZ
         A2tpfuXORNM4CxFJFlbNH53w4C1nJvlXzXoiIoGvEDiu61FlwsTo+DwMl48SzAU92HbH
         ZeesZ1Ibvgk7tmAEKMdMPVIc9innYRyaOUaPgARa7dXHXu0c0Om11pHHzAwUl5visGBy
         xZwP+IwzlWt79T8wj4bvIwf70hE0RR/6psISYLkyvmOJQ97RDkHBdyV3cOFnDteRKB+m
         YXOF1LIOuezHSwdqG8Df3Vgn542FaeTULMb5ZA09OscF3Czx5bya+EwEyGKRJeishkKp
         kNTg==
X-Forwarded-Encrypted: i=1; AJvYcCXvpbMWX0yuBBSmJxxiosLPU8D79RhPZiKBiwK2Ln0h9mcDfCwlJmn1C+mnuwlacP81rdbnVwaUMMmnCb2FTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwH3JGWmC2PJ2Q1e/ILaz5AQd28hefswDyjIwthE7HHA1qAC+dN
	T6HRT+ANuuZMq0EhJHLzT5fjWTNQFijNkZM2Latgeprl+b/9qZi/R6UV
X-Gm-Gg: AY/fxX5Dk7PGzbi58SsBHXoA1/iuLZiKnabfe5hhvU3JeS1pGgKByAbR4PuVi1Kgvu3
	JDv6RVwcrXjIGzGh8YataXBA0yciaG+8cYz77rQ/kzyDaIWug/7aBLLwjH9Pj/s4HupgV4i3UV2
	eFhh7aQrk37d0YDJTzr3yMaSZYNrevvkM3JytV96ZfzxjEop02gEQJaozSbY8RQ27WYHEqAgFr4
	xjxQe+GXEXRwKYQABye09QM1KpjUI1dgKB5e1j+0/cteqN17mMUqwPAHosNjL0FTI1xWVuFtwzP
	3S6ztjLU041EH6+hgHRcK8E50GO+MSBKalAhanWhRaJCia02O5NP2nUB/dJ3XH8D8P28M2mgFyN
	a/C5WZQ0WTNAUeIKuz57G7xPadmd/H4hwirw8SLsS+sD55eOUwHAPNG/Uff+jhek57SKtF0G5g1
	NTF+1/Bz+E9JadC8yTzA==
X-Google-Smtp-Source: AGHT+IF2rQuHzleHs4KUg49Pc4qjAM+mILzAe8F9dgTPG4qum4wYi2LAS9xkhUf5t3++oqkInN9YNQ==
X-Received: by 2002:a05:6a00:a90a:b0:7e8:4587:e8d3 with SMTP id d2e1a72fcca58-7ff66a6ecd2mr17208084b3a.70.1766631060477;
        Wed, 24 Dec 2025 18:51:00 -0800 (PST)
Received: from [10.0.10.3] ([195.245.219.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a19besm17858679b3a.40.2025.12.24.18.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 18:50:59 -0800 (PST)
Message-ID: <3afc06c8-f4f9-4d38-9247-57df783afe5c@kylinos.cn>
Date: Thu, 25 Dec 2025 10:50:53 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] rust: fmt: Default raw pointer formatting to
 HashedPtr
To: kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Benno Lossin <lossin@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
References: <20251224081315.729684-4-sunke@kylinos.cn>
 <202512242153.r68Pb25u-lkp@intel.com>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <202512242153.r68Pb25u-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I'll fix this rustfmt formatting issue in the next version, along with 
addressing other review comments.

On 12/25/25 04:58, kernel test robot wrote:
> Hi Ke,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 9448598b22c50c8a5bb77a9103e2d49f134c9578]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Ke-Sun/lib-vsprintf-Export-ptr_to_hashval-for-Rust-use/20251224-161946
> base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
> patch link:    https://lore.kernel.org/r/20251224081315.729684-4-sunke%40kylinos.cn
> patch subject: [PATCH v3 3/4] rust: fmt: Default raw pointer formatting to HashedPtr
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251224/202512242153.r68Pb25u-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242153.r68Pb25u-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512242153.r68Pb25u-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>     INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>     /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
>     make: Entering directory '/kbuild/src/consumer'
>     make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>>> Diff in rust/kernel/fmt.rs:30:
>      use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
>      impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
>      
>     -use crate::ptr::{HashedPtr, RestrictedPtr, RawPtr};
>     +use crate::ptr::{HashedPtr, RawPtr, RestrictedPtr};
>      // Special handling for Pointer: default to HashedPtr for raw pointers.
>      // This overrides the default Pointer implementation for raw pointers to use hashing,
>      // which is the safe default behavior for kernel pointers.
>>> Diff in rust/kernel/fmt.rs:30:
>      use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
>      impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
>      
>     -use crate::ptr::{HashedPtr, RestrictedPtr, RawPtr};
>     +use crate::ptr::{HashedPtr, RawPtr, RestrictedPtr};
>      // Special handling for Pointer: default to HashedPtr for raw pointers.
>      // This overrides the default Pointer implementation for raw pointers to use hashing,
>      // which is the safe default behavior for kernel pointers.
>     make[2]: *** [Makefile:1871: rustfmt] Error 123
>     make[2]: Target 'rustfmtcheck' not remade because of errors.
>     make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>     make[1]: *** [Makefile:248: __sub-make] Error 2
>     make[1]: Target 'rustfmtcheck' not remade because of errors.
>     make: *** [Makefile:248: __sub-make] Error 2
>     make: Target 'rustfmtcheck' not remade because of errors.
>     make: Leaving directory '/kbuild/src/consumer'
>
