Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE023806AA
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 06:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730345; cv=none; b=SvmEYW+yLyQQe48DC7Bqe9mEtt/gD3Ao5MCSO7GC4oqBtpkT84Rk2JKJFy/cluaHWEmJIz7CGZSpWSbNTdYx9QsyanzHFYPZp7ObeIvKB1WxcdgnOuojtDzbvpj6CMUaX+sjIDxE2KJb/Q6YRIgODMAh9oqDu9mac3NWT8uyOVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730345; c=relaxed/simple;
	bh=3R1SS/JCZM/Lfoc9w7kAsHUSiEC8aTlug28cBDnn6ZI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QKk7JjvzeM/a6Y2uh3tBlW7us7R0gI2ou1+0KYCdqLMlqnw1QaAovDqpu7Sd/ZxpKfh5j+slTlKsCiCN72dPUS0GCHHt6ih1EmmnWE7whPA+6dwKaZUm33fG99++kyvVH0Y2Zl6tu+N8yv0X+BEkY8ejAg2opR6Sop7xpINUYW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dtUNpygu; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dtUNpygu"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-660ca06230cso4637529a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 23:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773730340; x=1774335140; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FV64adRB9qOuDZltuxVkHORmf9URma8WDk8N3r49JmA=;
        b=dtUNpyguVuV8OqvQNkj7mtpD9/iAAgNvDd3xf8tWEy3Q/r+fGpP/P5CY5F14HXocD/
         VT4b2qw/zMwHtz/CU9wqyiHe2jAztdnJr0Uw7hyfqg6z0bMGSjs/MdFGiYJoP2Q/993R
         c7HKkjSp87LHM65aYgs9T7qG72iBorKzicTbKxPxc8Pzy90hQ3c+nzWJQCA/Nh3hpieV
         pFaYnjZfoqEBQw2C9frxpl9F5Po0mpZZD1qkpta5zBLGESjpT5R2yMi/qo4jqgJiVOlz
         RrVFQXM+nSYirLQyhVBeoxPMfSOFaTPGjrBCZT+TdBNWHUN+iz0Du+VaEBrW9bNa5zKy
         yipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730340; x=1774335140;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FV64adRB9qOuDZltuxVkHORmf9URma8WDk8N3r49JmA=;
        b=kolrkPE6wrt31A0NEKtRz7AUAIH8hrwDUFwzsspRSRqkp4415COc8gSydz6mHvaIfg
         imeH2rxHIdfiJS3NVp4qm3MTAbUHUrVhEeSibTNJdqaV2AvfoVsfjFup+YMG0+iZpSVt
         dTXBK8/KBZScz2LvcHNIF04hH21TFGi2PEJqRo2Wi97px6PDhOvE0viL6jDGSGCP4HU9
         o0v7ZoSyDrZOjk2empAZlbO5LG+dI4KAVVHE2cy/sJXwgguRmCIIfXnO8Wgrvi2C1T60
         0E0n8tgNpYWWKjaraoHGFrbi7zOaP87yiZSa3s9cFRX65ZX+AHiYabUc/Wv8CRI6qcSM
         XcOw==
X-Forwarded-Encrypted: i=1; AJvYcCVnXjRr1DBXg9JRRVkb1XSbDZc3uhHNfdjkUtGCJKjEQ0pXuxcpZEhDAxpPgICfp5YGlS1AN+ZgXz5ZVq+fNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEuuNu4mI05slB/us49CnkiUJ+42sdQDtaSCNiQd5cezeIz37Z
	UE7H98NrYtHLKaLqs2QCQK26ocaypUl5ImoZS0lk0GX1k2I4udSHeHHY3HApMnAaGlyHSMPuRRw
	S5fjfaV6fIztVtLI/iw==
X-Received: from edrd8.prod.google.com ([2002:aa7:d688:0:b0:660:cd0d:914e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:27ce:b0:663:8841:17c9 with SMTP id 4fb4d7f45d1cf-663babc44ecmr8734757a12.10.1773730340157;
 Mon, 16 Mar 2026 23:52:20 -0700 (PDT)
Date: Tue, 17 Mar 2026 06:52:19 +0000
In-Reply-To: <20260303162314.94363-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260303162314.94363-1-dakr@kernel.org> <20260303162314.94363-5-dakr@kernel.org>
Message-ID: <abj6I9c_2IR0cKJ6@google.com>
Subject: Re: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory initialization
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, driver-core@lists.linux.dev, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 03, 2026 at 05:22:55PM +0100, Danilo Krummrich wrote:
> Currently, dma::Coherent cannot safely provide (mutable) access to its
> underlying memory because the memory might be concurrently accessed by a
> DMA device. This makes it difficult to safely initialize the memory
> before handing it over to the hardware.
> 
> Introduce dma::CoherentInit, a type that encapsulates a dma::Coherent
> before its DMA address is exposed to the device. dma::CoherentInit can
> guarantee exclusive access to the inner dma::Coherent and implement
> Deref and DerefMut.
> 
> Once the memory is properly initialized, dma::CoherentInit can be
> converted into a regular dma::Coherent.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

overall LGTM

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +        let ptr = core::ptr::from_mut(&mut self[i]);

&raw mut self[i].

Alice
