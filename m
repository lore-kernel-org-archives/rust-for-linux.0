Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20A5486E67
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044779; cv=none; b=B/6HndRB8URFz/+0yXeoIssvDzdmbNyswP6LAsuoEewYWvn3YO+4qLVdXADxrR+COW/Z6nItxR7YNwvlsyIMwIznu3t5P0z8UTy51ViTkhFj9rrl6obAiVRBaFIQbgHL3YJggxvwy1aAJLBnOqi+SpIfHmzdTcNK2u3pg3j3TtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044779; c=relaxed/simple;
	bh=aV14/F8DsF3P9FHVwJuzeIJuUW3zK2f3SCDMKZGJuA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLERRh1QrERXrOp0lngDxCb7nSBGooRYXiQ8ro13VrQDhNebanMy7MvXx8n9q/EIVKGCCMFRfa3nwSQnwtwKOPuCPPxayp0EPKakf4A2tbPDInP5QHoz+duLVWRDVOpW4Eeq60A993C7jmIT5ZZi8yvmFi2VzeQ5HbPytZhTFKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SmOKr973; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SmOKr973"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482ea739de2so4781420f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789044773; x=1789649573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ei/562soKHFJqkSdXuQm6X1dYNc/yFpT8LphVTPsPBs=;
        b=SmOKr973K1dGCdZNSvV0lZ/+KT9BbRIbD3GOIAibUNJ0qhDjKzaJljF4LSPNkW8bB2
         HuTx1PLTDPwTxnXLhGLdkAB+yvGjx19FpTMhto8pdD8XeVAybuZ6v45GmuegsUQbFv0A
         r5tsiGJMyJ+CTV4L29p8/OHBuCB/Jv4TyJDThI2FdXmhKsIpiLaS2/EUJrwO93TPodLM
         CS3eFxLcUy270ZtNSYfcBV/5plhB6VvhVqoXJOjiOa42xr9jJXMrxMP9H279UkBdc0Z/
         dKrfOKBdlY7oe1AphxeGiXttM62BubLUX+lzyjnDKsH9lJcugdc7BQzMz+jFCDx1qj7d
         IryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044773; x=1789649573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ei/562soKHFJqkSdXuQm6X1dYNc/yFpT8LphVTPsPBs=;
        b=W2zgSljWBY0Ef/whR8yQlY80cVjvwssUmvbNM8q4OM7nHJC1snVaCANXz4jVzl1V8u
         LFBVoB5pGA+/F9dxWbXO2s9YCLSFdvcugUEwbqRc8VXevwuijZKac6iayp9QgdQkYlQC
         ZyNEFJoDu0VVk6UqOXthf+Wf4xJPlegwujTqIY0P5lPzUNQPKbunNqAS0zuzX6PzrJPQ
         T9350Zqlr2vWYVpD03Y05K715lNWh6Ur/4nKFeJAw74nwEAzg5tm5zExAPpzszmkCEGt
         x7h/YDlt5UZT2MSv0v2fXrk7RA+uB/DDCwgYQihcJdZExI2s3pSArJDoMzy2SGY0OsP2
         MoNg==
X-Forwarded-Encrypted: i=1; AKwUvBzU5RT0zTWhidd11Lbo5KU2szw9t7QE90pu6MRki/Ct/4ntYWdPNZv7xAdicmY5xbUZG2nDPGtOxUgJTBNH6w==@vger.kernel.org
X-Gm-Message-State: AFuF++k/qGnF9uPMTt8pQqKb6GI05yyuWsdenRXRp/Xd1A+M6beJywf2
	DtEf5htwcv3t/mMax5CrYDs41lzTxZk6G7oxlYUtjGmAcJk12SUqSo6J9gbls3IAm9w=
X-Gm-Gg: AYBFou0K3H/D+oEHkJUdqyTlxTLvF4ERqifdhQIOZqTZC2zcvpRULBXF3vfRzfeh6CS
	id737xat8Xe0abz2qrnLaT4FVcWHwbH4lcC6MMU4VTamPGAdYDk4ie7bPA9gqySF+wL6GoulFS4
	0ECfS7BuEhQBjzeRjMr4rMmU/1WfqWVG/k94dTvUGnpbzFUFYDS31NV1dXQ9lcykttT68wgfduy
	uDvegmi7mizUfHYGOXl7AqZpFCoG8x9CF6kShaOLQ7td4JVLl5IAVMDNmpd/1JKcV+Pr13bCKqf
	8Wxc4SSlTqCyzlCMNZLANgAf5i5FUps1nhV2a9t1UNi+UQyifl0UrAfG7nISknrw5rVQN/OLhUF
	VZbmnq+DxSxbVlu9sdQvOd9TjBAKGkChKvqfXCSW/5XJPoKnACfqlYm/rbVpYYrECgr+LiJdvja
	YV56B5z3wySSepYAbPWlKoplT9wl2QB79FogNIYa5lonF6b7+MBF8fmFnJSavW2bl9kD3Y+jQ0e
	zPkXxVpdwl+Z1UYXG/SkzyK9xswayRafuE=
X-Received: by 2002:a05:600c:620d:b0:49c:fc6e:a3d6 with SMTP id 5b1f17b1804b1-49cfc6ea731mr404244015e9.21.1789044772934;
        Thu, 10 Sep 2026 05:52:52 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm286173185e9.4.2026.09.10.05.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 05:52:52 -0700 (PDT)
Message-ID: <434a7a10-d83e-4402-be91-816bbbc15bb7@suse.com>
Date: Thu, 10 Sep 2026 14:52:50 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/23] modpost: hash module source per-file, not per-byte
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-13-5dc1ac01672d@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260908-build-speedup-v1-13-5dc1ac01672d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 10:55 PM, Lorenzo Stoakes (ARM) wrote:
> modpost spends a long time md4 hashing module source at a per-byte
> granularity.
> 
> Fix this by doing this hashing per-file instead by accumulating a per-file
> buffer in parse_file().
> 
> All 11,189 .mod.c files and Module.symvers were confirmed to be identical
> with this change applied.
> 
> This is especially impactful for allmodconfig incremental builds (where
> CONFIG_MODULE_SRCVERSION_ALL is set).
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 allmodconfig, touch mm/vma.c, gcc    40.6s    38.2s     -2.4s (-6%)
>   x86 allmodconfig, touch mm/vma.c, clang  36.2s    35.0s     -1.2s (-3%)
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  scripts/mod/sumversion.c | 56 +++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 44 insertions(+), 12 deletions(-)

Support for the module srcversion is being removed in "module: remove
MODULE_VERSION() and srcversion" [1] and scripts/mod/sumversion.c should
be gone completely.

[1] https://lore.kernel.org/linux-modules/20260731-module_ver_remove-v2-0-c9163858f382@linuxfoundation.org/

-- 
Thanks,
Petr
