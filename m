Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4AA3C3C01
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264240; cv=none; b=N1BNS7NkJJE5EYoSpD9QM0jOHXIg46s8as97wnAzQ88g1XwTGXIz93wm7lLqipTjG9UhwwODJwAfO8nMVfLWAXygWyUwAy6pSNjvx+pBcDqzNboEIzVZg7KfJFwU1gldVIN+if2f1oGzxh/ZyT3Z3Uz5BHPYpSE2/mjWjlHYydo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264240; c=relaxed/simple;
	bh=4bNEnXOnxP9R4p/TqJRZcA+o31g58k6pVxjAj3spyT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVh8EjoK9s7s5vhkpJntSWrglQXVu0tzguD18cwyWEEAuRsnpH1iwRh8q1cYM4eeVp0KKFlIInJD1xxZJKI6r/foVkJcLPKM3zdp5/dDIg8M095tg+Qamin+MheSTFcqmGNUNibja17vzTwcD1OH10goY4dtiYlHV9UwOl0fwlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXjJtrEj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXjJtrEj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ac357c55so7865125e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 04:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781264235; x=1781869035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=j9dyxygjV/3RofubGPQY9xrYK9q7NJvG8u++ttMJ7jM=;
        b=gXjJtrEjaGEOql6CyedpqqOR5hAdC3d5xqCL+LsdpfNytEp0nHOzKcvEOQZ4gHsiPb
         olJDwgrdrPOhmxS8eKIf0dj+P3YVAOZ4HGXQiSO2fAP/7tZGAbrSQ/OSX54fASP841HU
         KIjBvbUyxguy1y9J4DO0HTFAPbrk01/cLE9CoBBuUabNDUJt1YJdc5nG6pbE6XH2BjYK
         UhLoGUUw+gq/o9IidALv4PE5jVuyckHYWridIuakHe8Dg7DVzAJVqCBnKK59u9YgHbgn
         M0DYLEIEIGcbs9bHY/ArMUTF1hK/VIQYDwVzchijqhqMCeIVT3BO2huV3LKvXNoITZR0
         czLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781264235; x=1781869035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9dyxygjV/3RofubGPQY9xrYK9q7NJvG8u++ttMJ7jM=;
        b=MaiMTDbXH4gcpOYk+UTJv9qGLKgkbG00tZfvRNZd/qAG/Mq7E4zwrjetIsnxQ6MSav
         KpV3K8oaIpXIzBHCbRcDyfaK47QaToK2+RfjGqcaBUifvSF2iBFHpvKo6+7AI63YhjRX
         Spn8jiC7bUY1rz10MIqRxYrO+AyQoB1nNKLnOL7tnVzZuz8FyNUcMpJ8Bvy8RpVINEwH
         pXcWgcFhkyVzQLlMMPkixkfrLeMvHGYbFq9rfrT5yAkwYLCk1GFKLS8FbXFuxFw0xtfR
         Zr8gfWe6JA3LWJvem+d4WnuLwKyej9ophcpbQIk7xS8ZZLmEa8vE3G3HDz69Y53p6saz
         woKw==
X-Forwarded-Encrypted: i=1; AFNElJ8CizsG4WLFCJ0FXFvTLMF4ezaae5WGXYlDNA3k7xCyfiEHXQ0k192srfTDm/GoZsigOg86yRkapYirFVB6SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAOvWhL4d/flp/8EWjtL9s5LQhs6ovgPoiciX6KpFrk0/3cwyJ
	oasUJqOEQMw5Xt+fh0U1uK3Tcvgt78ibghrJkDxuYoPp5A7gDhNFrRU9
X-Gm-Gg: Acq92OEvE/cwtrF5iUWA9RNTCBqXMTnb3mB4ecFB9YwzTI6MEjfftsGHNhoRtH4YWLB
	NmPeGnzOJigp8obuoWcxCTek1QaRpeC3SeVJBkQYBSHZOxg1YGgNJPjfkuzNhpzwksx0s0Fe5bR
	CBsYr2BkUGigwrTk5TVL8/ddlr96ZX1kk7Os4QJYZ8GHXd9BXuMe2OVUbP7WeGCLWnIfgZUwB/8
	FTovCduZjGODdU/e7MGEh9fT2wqGd3oAN8C9z0twBGYarV3SWKWDLvEIt7DkPQc6T9FOBam9+G1
	FHM8VFjscm9WBIkQz6JY26o+ErHhNZcCocN8nTPi5dU2RMVQsE6PaMhEYb7sMNkQg5yXbUUBnH2
	nnVHQuKwturqvEvsI1Q6fLfuuhIYbWN4qt4wB7Rm3wMEP82BN4Ey5yGYmnFbRkJyiQqWDVRr1m+
	3oDpwhp/g3ZFq0T1D/okrky9FyrWkjjfpSo/uA2n449Vts20BEaUuVOLCXOgx1QEHrL+Jne/xJ0
	Nt/cXhNNTz2BfENGBU=
X-Received: by 2002:a05:600c:8486:b0:490:a298:acf7 with SMTP id 5b1f17b1804b1-490ec4ee700mr36638215e9.17.1781264235050;
        Fri, 12 Jun 2026 04:37:15 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2637ccsm4885808f8f.6.2026.06.12.04.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 04:37:14 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <2e528372-aba4-4621-a9a3-7ce23571ef37@gmail.com>
Date: Fri, 12 Jun 2026 12:37:11 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/14] kcov: add per-task dataflow tracking for
 function arguments/return values
To: Yunseong Kim <yunseong.kim@est.tech>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 Yeoreum Yun <yeoreum.yun@arm.com>
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/26 17:21, Yunseong Kim wrote:
> +config KCOV_DATAFLOW_RET
> +	bool "Enable KCOV dataflow: return value capture"
> +	depends on KCOV
> +	depends on DEBUG_INFO
> +	depends on $(cc-option,-fsanitize-coverage=trace-ret)
> +	help
> +	  Captures function return values via /sys/kernel/debug/kcov_dataflow.
> +	  Struct pointer returns are auto-expanded using compiler DebugInfo
> +	  metadata, recording individual field values at runtime.
> +	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
> +	  Requires clang with -fsanitize-coverage=trace-ret support.
> +
> +config KCOV_DATAFLOW_NO_INLINE
> +	bool "Disable inlining for dataflow-instrumented files"
> +	default n
In Kconfig, when you don't specify any default explicitly, it's
implicitly 'default n'.

I think either style (implicit or explicit) is fine and both are used
throughout the kernel, but is there any reason to make it explicit only
for KCOV_DATAFLOW_NO_INLINE, and implicit for the others?

- Julian Braha
