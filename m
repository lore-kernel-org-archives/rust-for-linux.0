Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48A03B893C
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140089; cv=none; b=Zsw2TWOo9ILSa/7vjwZQwvWNBcLXj9a6E8NPI0RTHuv1vsZ+s2bcjmamys460OSQ9aCmYuS8W6ByvXaB8eZjL8+PA4J328IRTB6Q6536n+4iga22m7chHH1Utcsem/74KAHjjcMkau4Rji0V6ah0M4S00vhkRb2o6wwiqQFpG+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140089; c=relaxed/simple;
	bh=tlShirYKzbDTebhekpL3cgO9QBzPxjzfz9kaCC0cM0s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FyxzL+hzp9yjVLhqmwEtbgGjMyuuXDpuRaE+wO9d/q6R5/WTwgiDIgo3IgP86hwfrgPp0S0gg80QBX/AMKIzuN9DIse7OjHAq6i7FsY0bBYWJWhR3ysg01eVYBlLJpX0Uezv+qz120ebwAs3JOpMYzwcu0VMFQ4/nmazZol3GdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E3m4dyT+; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E3m4dyT+"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a17b4c613fso31456725e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 01:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792140086; x=1792744886; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xIS+Gcugri6/aPL8Lav1QyB3S08Ua53KHtkO8xQT/4=;
        b=E3m4dyT++AADWy85dAqZ9rdqfblZ4q5M0XWMVJg5xjNEIxV05WESdByuOycycV6tgx
         j3lKvfA9IEEM9sWdvIVyCsFcVx8YB3VRm9QSetMU/rhauM9fVPhk8isug9fvR7MlkpVb
         8mzrcDbDelxgh1vmm9bsntMFvi1V5xkxYJwpFoJLn7p8apgMWwjHJyJ8JvqX50s/roox
         EUlhdt4LPBTy55HndpQ+zvQyHBpL8vTrGyvfmjtnnCfcPdd9uJlgnUlQyDDh03tUQXxY
         FZ3LYjnJ96DI0jcXQim0oBe2K4ZkyxyqN5RMfcpTSmJJQdwIaRXIeV4BhUmv/h7JRphf
         T9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140086; x=1792744886;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xIS+Gcugri6/aPL8Lav1QyB3S08Ua53KHtkO8xQT/4=;
        b=yeXbnn1x+QlfYsBBfN4eAu4rj/I9G57lg+CI5YxUmQAx6ffY4MKss60gI4PE+XqtzT
         JpJSVG+HMnr43EbtZJTWAvzxlfKbY6FTnuyvP96GqkOA7LY2plEqyvMx/+x0otThw9r4
         OyGGv6ltZp7Agx+zCqxCfKe0pRB3kK5umM2KcTqXrr7QBSA/p8IF12eZLefGaYRgtG7+
         GLubPKILjHYrsUyaT4Hd6Z6B/Jf0Nk0PXdXA5tfpM3NQMQDT4s1d8Rb1UilerlFZ8qWg
         lQgWUMKNNIUPCnQMUvhQyzHuonwpg7d7T02BXpIHj/kDC0MZdt4GGnEVJ0OF1w8RElOf
         RS5g==
X-Forwarded-Encrypted: i=1; AKwUvBySFGctI2CDblQyDy4y3VuJjeXoQtamoLK3Gbaconj+oAUvstCIwaHb4l+TfZyzvkFm2nSquoEtRv0zrcIIng==@vger.kernel.org
X-Gm-Message-State: AFq9FYIuXzmmPpNIqX6PXIfj1dljU6g4fj6BrI/U/uJCavwDDlcOhGaj
	ducuNvygzLoeXKiIgMDKUwCq9A5UUcTnPUstMECyXWbuRPEYu5zrkAwDR6x31aJGrD4C18KiHJh
	D/MUM/UHgFc9RtkJWMw==
X-Received: from wmbe6.prod.google.com ([2002:a05:600c:5906:b0:4a1:93c0:d3c4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0e:b0:49f:ec98:f030 with SMTP id 5b1f17b1804b1-4a18e4e9db3mr429156145e9.33.1792140085578;
 Fri, 16 Oct 2026 01:41:25 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:41:24 +0000
In-Reply-To: <20261001145940.1077801-6-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001145940.1077801-1-zhiw@nvidia.com> <20261001145940.1077801-6-zhiw@nvidia.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016084124.3495380-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 5/5] rust: device: add dynamic debug support to dev_dbg!
From: Alice Ryhl <aliceryhl@google.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andrewjballance@gmail.com, 
	daniel.almeida@collabora.com, dakr@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, cjia@nvidia.com, 
	smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, kjaju@nvidia.com, 
	alkumar@nvidia.com, acourbot@nvidia.com, jhubbard@nvidia.com, 
	zhiwang@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 01, 2026 at 05:59:40PM +0300, Zhi Wang wrote:
> +__rust_helper void rust_helper_ddebug_dev_print(struct _ddebug *descriptor,
> +						const struct device *dev,
> +						const void *args)
> +{
> +	__dynamic_dev_dbg(descriptor, dev, "%pA", args);
> +	if (descriptor->flags & _DPRINTK_FLAGS_INCL_STACK)
> +		dump_stack();
> +}

Nit (also applies to `rust_helper_ddebug_print` in patch 4/5): if patch 3/5
also exposes `__dynamic_dump_stack` under `#ifdef CONFIG_DYNAMIC_DEBUG_CORE`,
both helpers can use `__dynamic_dump_stack((*descriptor))` instead of
open-coding the `_DPRINTK_FLAGS_INCL_STACK` check.

> +    pub unsafe fn dev_print<Ctx: DeviceContext>(
> +        descriptor: *mut Self,
> +        dev: &Device<Ctx>,
> +        args: fmt::Arguments<'_>,
> +    ) {

Please add `#[inline]` here too.

Alice
