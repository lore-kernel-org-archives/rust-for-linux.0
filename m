Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDF011CBA
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771664585; cv=none; b=tfI61DGtxrkTSpTf3UFSZ1iosxOE9KbUXtrcJTGjGuhNdE4yizeBpqLMQwDo55RGFiYEv6cJ2/LjWGuVlwyvAri818aRL3g9XTNu0n7XK8dEa1VvSSGmX7pfS4JA5u4q3EVg/kHDcNAZP88bLPtxWXSI2Iz82oxkPt2eY9X9BIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771664585; c=relaxed/simple;
	bh=OxmLVQCBLwO4s8kAZ84cz/P1OFnBKKzVPO7tt85hwVE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sQjxYytgaR7ZrjUl3PaPeb75opu5L9G0BKlUJUbkOl2pF4k4myoT5zFhJjCtnqwENYZ1ztzEUh0XSPpgU3tMhzjvdurba9lvjxfWbqEiTsRzoO6rnRZk3A6KDLRhBO+//uYNEKDOHckz13qLFIws466lmQAU3Z9qovQFGzjb5R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GI9kXwro; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GI9kXwro"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836e35292cso25224845e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 01:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771664583; x=1772269383; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xqof4s0oT0bzk2vKcOSU+aeQbztw0Mc+PhxZBmWcX5o=;
        b=GI9kXwroIei72+UJ1nLrH9MOdUTf+UW/7Amk7uU5R95k6ggULuQ5lsuHIrFieCUFT7
         o1NQY5nqfOMbrHHxJKxAt2M6e8fl1gU0bN/DUS8/J/BcTxmK3MH12kCPToNpeQU3HkvD
         Y45n9JoiHXB+rNGUThUYKbCUBnQ2+lViBPohPnD1sDUthbm/t4a/CDjAbtxe4hLEoUoJ
         FoyE7BSnaMAF7T6KhR9TDPtRQ6CbLNV7DEm3mXN5fEF9dzhJIk8vDYVhOT9Ta1TtkVCq
         WceKX7c2LmLsDbNzL7Ch/P+JZwwam6+yWfENVuIz520erg+rCjteDL/fUMr0fKIu85TN
         aV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771664583; x=1772269383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xqof4s0oT0bzk2vKcOSU+aeQbztw0Mc+PhxZBmWcX5o=;
        b=Bvni9cBD3dotMIKaXf82XJI5uQLmHrexte3crDt1P1DIubTzHBkjbsbsLIb1VF2WP+
         peGJQNCYwdij/9nS56QE6/qY7E6ZZ2Q8W6DslYFuT7a6VPrMVcRL2gosSFgaCln73bvr
         FlbG4YPd+0fGbkv4olgxd5s+7bBZypMhg1vvUO+aPFDEKaeDGLL9zIvSXfhyxKYmSAtD
         jJHW4GSheFxI4YoAHWMq6ce78OiBWqFyDCI2NZmyI1hoPvepbF5Jg/LC2mfiUTNjx/WC
         mwPEqjD7szywXHcNaQKjq7A36NkMsm+YH02dr16ehDoiNs+VdP9brw7qywxJsdpYdzsI
         sjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTNRU4Hr+AQxvyQ/NZ/ygf0V/gwugJeh3/Jkg49T7+7zcl/jsQjoNPQIxjSw4shD3R2iehHQTjlsBRpxijYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz30AGhl7Np4ITf3w3RiHIsKEOZWyB0xCMGdfPu4ZJcAKDV+ji6
	1xuRc3ovYVw89xPvvgt8RX6ZHmrN14JGM0jdBVT1tx57pYff5N1nBoVNfSsbMIKt90aQQ5dNk2+
	p1qSrGSPIUgm1DIKLPg==
X-Received: from wmbjp4.prod.google.com ([2002:a05:600c:5584:b0:483:27fd:cf47])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b17:b0:483:71f9:37ef with SMTP id 5b1f17b1804b1-483a95b5405mr30650555e9.8.1771664582473;
 Sat, 21 Feb 2026 01:03:02 -0800 (PST)
Date: Sat, 21 Feb 2026 09:03:01 +0000
In-Reply-To: <20260212013713.304343-5-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com> <20260212013713.304343-5-deborah.brouwer@collabora.com>
Message-ID: <aZl0xaouJla98Py1@google.com>
Subject: Re: [PATCH 04/12] drm/tyr: set DMA mask using GPU physical address
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	beata.michalska@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 11, 2026 at 05:37:05PM -0800, Deborah Brouwer wrote:
> From: Beata Michalska <beata.michalska@arm.com>
> 
> Configure the device DMA mask during probe using the GPU's physical
> address capability reported in GpuInfo. This ensures DMA allocations
> use an appropriate address mask.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +        // SAFETY: No concurrent DMA allocations or mappings can be made because
> +        // the device is still being probed and therefore isn't being used by
> +        // other threads of execution.
> +        unsafe {
> +            pdev.dma_set_mask_and_coherent(DmaMask::try_new(gpu_info.pa_bits())?)?;
> +        }

Nit: We usually move the semicolon outside of unsafe blocks:

unsafe { pdev.dma_set_mask_and_coherent(DmaMask::try_new(gpu_info.pa_bits())?)? };

Most of the time, this allows rustfmt to format the unsafe block on one
line like the above (but it depends on line length).

