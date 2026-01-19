Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B5B1A275
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 04:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768798538; cv=none; b=oJXJvPqBDno8kkTk8fgpWckNy4R9ZCW+L0a+N74owPIpBVJRA7HGbcKvfruOjK/qDfCFGg+ZISat9K5M0EzLr5+9QVFAH6dMxbLi9qAO+AeKHYmquV7OUiI1afmon2jIeQFRVWiFngyUUwujwhDPT1dIgiEQWKrCkRy8WSqDS4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768798538; c=relaxed/simple;
	bh=T6/HV4gbuRJQ+AvQZ7+CT1q5Q6si5/mylzeJ4QBCmrU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ajG/ysgIiGu1HpSutsHGoOSaY1800Vlbz3khTQ3SLsZoXVOMTMpGMKHRpghyXDIsWthG4jHTU70oEH8pmmozpZKnPbeTAT70Cyq4gVA9LBi6XaQEq1nspnBfmGquW8ygFJd3k4yPze4APQ4+vLuXbQzTg10irwhEzRQnyMw60TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3LYXi4C; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3LYXi4C"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c1e4a9033abso2099729a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 20:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768798536; x=1769403336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pkT2ZClyGsf13AYp6L2+G5W9522CAMmrzOXbdAupBY=;
        b=N3LYXi4C0duuKoqXVXuIHfomsl82i+ZrebOjEuidbMPQPfRPSVJbxKmaXwanQ/3JEe
         bExyeMj4YAUAZg1g7yFqIJZqZOcVDgcjvisY+8Q04GOSbCRaD39OWb6nECaSTkgrmVDA
         1uIUQp25LiASmRhAEdteV1M00cwfWRGXHUKnwtaRaM/AXO09qPU02SEOkabvFSF4oAHW
         bcxzeGyXSQeSMgBfvOVOl7uVamjDS8kFgI0HjpXHUinVCT1qR91vv5IPo4q6SJ7YFMUC
         W6cU+72Na74S0aDJUqY4ft2xFetejsLTJf8KHZFevvOZVzBPqiLsdkEgaVmtH/aYLyUV
         FC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768798536; x=1769403336;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pkT2ZClyGsf13AYp6L2+G5W9522CAMmrzOXbdAupBY=;
        b=jJFwG443gyaxPY6mzd+MctCzI5x+v78RcBIr3BoeWwCrLGpYg9HwhOaev8m70ZWiY8
         MEF1FKHVrDagHQt6BeHr7Ia3+yFBbcgbFFLWWq2oKIXDIG/hRuCCX8oa5o9XS2coLCGg
         8+EdVpAdPAfzKkhWwtWr98+gCvpTAss+B0DVFyDBSl4/1x82CKjZzfBHLlJC9KtKsXkz
         QxDOT8xP1Z+wnqtOyQFwRqiZ5LwQv2imzwdU+59SPgPDV1ZOLI1GXsSZZ1JGwpa9NXhf
         0vdM6MZnGcIIwbsNsuZfPQ6p3LKe91JwzavxH92YMMd0ROV6kEORArlD2OR3dgOO97sy
         0DHQ==
X-Gm-Message-State: AOJu0Yw+thctWwLXZyPWBe45XtqaCSOKQfh0DFwbuijIkpPHiwYYLCgz
	TOgINh2U+uYJGdcIKlj3c7W25o781e+MF3n5nKpSUo7MvVOmQGNBo5Rd
X-Gm-Gg: AY/fxX6PUYK/TN2P92wu7lmEk+PdqfArlfmGmJ87AwGqD+6qBHLj+3NQfbjBBFeRRYM
	uv/O1OHyUf0wWVdyjXbQRQJ1VYKVf0aGBE6c1n/UfgUgQ4wi60Y800uqXibk3EEVGmzgSmoJVrS
	iUNp8Td0LRukngdF0thXySK5l15XX7Q06Sp44jPzaWacxoXEbyeScGDRVKFHg56bTPraXtQHa8T
	+IQdYJMrh5VxCr+bUu+TyjYVDvfWCDndl5nGcaheCvJZS/xPGzc7MKwmRc2Y3a6wXsXTXA8LULD
	ZRP6FPuHMJYMnLCLSyvC7nrIPO0D0hnFAfsv3gz0ZH899Hr0uwtaKFNk2wojvnq0Jw2MUESaJXs
	3P3/FfRWeeULNYKGe9OdpM0V3PaZxd/9r3IFwVFTrLVvEmu8DlxxjZIbj11h6oTUCnt65hbHhuK
	YvDC6b0lbxq+4fYn7FJuMT6rnTQlnkwR6Hxj/qjj7jpbI/RmLTKVbQcww529/rDALIEVg=
X-Received: by 2002:a05:6a21:394c:b0:366:14b0:1a3f with SMTP id adf61e73a8af0-38dfe80caacmr9952987637.77.1768792189046;
        Sun, 18 Jan 2026 19:09:49 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf232f00sm7739170a12.2.2026.01.18.19.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:09:48 -0800 (PST)
Date: Mon, 19 Jan 2026 12:09:34 +0900 (JST)
Message-Id: <20260119.120934.33535744184163382.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, will@kernel.org,
 peterz@infradead.org, mark.rutland@arm.com, paulmck@kernel.org,
 frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com,
 josh@joshtriplett.org, urezki@gmail.com, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
 qiang.zhang@linux.dev, fujita.tomonori@gmail.com
Subject: Re: [PATCH 4/5] rust: sync: atomic: Add Atomic<*mut T> support
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20260117122243.24404-5-boqun.feng@gmail.com>
References: <20260117122243.24404-1-boqun.feng@gmail.com>
	<20260117122243.24404-5-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sat, 17 Jan 2026 20:22:42 +0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> Atomic pointer support is an important piece of synchronization
> algorithm, e.g. RCU, hence provide the support for that.
> 
> Note that instead of relying on atomic_long or the implementation of
> `Atomic<usize>`, a new set of helpers (atomic_ptr_*) is introduced for
> atomic pointer specifically, this is because ptr2int casting would
> lose the provenance of a pointer and even though in theory there are a
> few tricks the provenance can be restored, it'll still be a simpler
> implementation if C could provide atomic pointers directly. The side
> effects of this approach are: we don't have the arithmetic and logical
> operations for pointers yet and the current implementation only works
> on ARCH_SUPPORTS_ATOMIC_RMW architectures, but these are implementation
> issues and can be added later.
> 
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>  rust/helpers/atomic_ext.c            |  3 +++
>  rust/kernel/sync/atomic.rs           | 12 +++++++++++-
>  rust/kernel/sync/atomic/internal.rs  | 21 +++++++++++++++------
>  rust/kernel/sync/atomic/predefine.rs | 23 +++++++++++++++++++++++
>  4 files changed, 52 insertions(+), 7 deletions(-)

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
