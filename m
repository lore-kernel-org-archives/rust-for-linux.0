Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93638412276
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502168; cv=none; b=aECyd7TUTNmMVj/28wE2n6juHq77gSTpY8ko4efSCaLi2JP+67YqKCasQxWZjM5KGseYtmpX7qLw5TSNwFa++N8G3F0342bavqGyTTJDx3bqSeacwuDJhH4UDNJBFKXd//ZEJbiIpxO7uvhEx1j7UKilEGedWYkb8TWsc3eTx5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502168; c=relaxed/simple;
	bh=3SaK050q3tPOMrwcYbJ3W6m7Q+nDL/HAGiMmzTsDF/A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UfipnXKTbm1jq7oKurK36qMQowQ4wjg1B30axKPopUoy8bugN7FU/pjqrWBf6LtcBz2Bf1K2QNt5FtqLL2SARFJ52+4dWPh5/c0LNMPTP7XDqO+UpqvNtd8QoI5jKr2UnOw85iPWI/nepCXt2Ccs6fds40LavueVfnhJHb6DBVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rfgs68ds; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rfgs68ds"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f4bff865cso748031f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 05:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785502165; x=1786106965; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqfAaz1EDz40TU79ACF1Zesj56aNpbSFHPja1epTxcg=;
        b=rfgs68dsg/9pot53mUaCl5v4ckLofeMWldfSfJ5mcv4hdmEAy/O/C/S+UoefW92JaH
         26sbpHzYRY2DxNIq3x6ciwzlWb7CoyROkPWY1/PqSDvXCOSgHh4+kUvSDigDukEZnXCa
         hJ/KrRkWuwJbn+5q0FxyS5K5vZeTfpzIM2F8W74soJDlVqlfgZWz7TqQPz38Jyzwq1AL
         T1FXJZsafcbWbEIUHq/AHoSqCGMH4TMAI7w4DyUEJtABLOj/4vS50pLjqgNqQILAMKaq
         RMCF828rETv4IUmLL7LRg51irs6bN9Vrx/h036ypXM46DXRsbvt7yeUS6/rDR68dClQi
         PLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502165; x=1786106965;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqfAaz1EDz40TU79ACF1Zesj56aNpbSFHPja1epTxcg=;
        b=UOVr7vhatHdxq/tDaMx/x3O0VcclSgH2GHIQ7RgtMTmFKSbDVYW89PfIl6mKztWW2g
         1Z3itpgwxFVwEZH7Lwd2wG3ikdWgqPlbl8mYNt99+voQv5gqn1lNEDRS1J8pzZGhNW5/
         2qMbymT0WVLDAh6pjShi8k15fnurw1VNxejSX3AaHRg/a4S7Xiz97jubouGrDk0DC/0y
         nZBojQi8dPEaJ27zueC6V8duOksSQnxmnZs1+D/4JEQGPja/KEGwr/MZx0pmrTzmSLrL
         igPlOywwL5cAmp16Ioct++4kiBlelMSgaq4vj0C3vuHIuPUF7JKeEzbSNsmji2KTnPca
         Andw==
X-Forwarded-Encrypted: i=1; AHgh+Rp59d2QmB9AZjIlTOmoof2laSYQRLA5RHV0ZuDDXmaG8iKOtENPpQbKKvCPtWb2PRWiNfH0xiPLSeRQQirZuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsnittGtNq3mCwK57tFjvoCTR12R7+Vm/7zqwFKdzUIfTgfkSd
	6qIT6HmU9v/lztpGx9wBNV/u83jtETdb+4NbeQ4TrSyG2QGK3GIu6CKA6aCpPBroGRQ3lZZylcT
	2hjspZCmxXzgm25NiCQ==
X-Received: from wmpr10.prod.google.com ([2002:a05:600c:320a:b0:493:b301:e269])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:38d:b0:47f:90a4:ff42 with SMTP id ffacd0b85a97d-47fd2ab7ae6mr4641063f8f.5.1785502164625;
 Fri, 31 Jul 2026 05:49:24 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:49:23 +0000
In-Reply-To: <20260728-fw-boot-b4-v10-0-9187aefa3f2f@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728-fw-boot-b4-v10-0-9187aefa3f2f@collabora.com>
Message-ID: <amyZ0xD3BTKeVPSS@google.com>
Subject: Re: [PATCH v10 0/7] drm/tyr: firmware loading and MCU boot support
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, laura.nao@collabora.com, 
	samitolvanen@google.com, lyude@redhat.com, beata.michalska@arm.com, 
	boris.brezillon@collabora.com, steven.price@arm.com, alvin.sun@linux.dev
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 28, 2026 at 11:39:22AM -0700, Deborah Brouwer wrote:
> This series adds firmware loading and MCU boot support to the Tyr DRM
> driver. It includes:
>  - A parser for the Mali CSF firmware binary format
>  - A kernel-managed BO type (KernelBo) for internal driver allocations
>  - GPU virtual memory (VM) integration using drm_gpuvm
>  - An MMU module and a generic slot manager
>  - Loading firmware, VM activation, and MCU boot at probe()
> 
> It is based on drm-rust-next and also depends on:
> 
> [PATCH v3] rust: iommu: add device lifetime to IoPageTable
>    https://lore.kernel.org/rust-for-linux/20260703-pgtable_lt_b4-v3-1-e738e1f513a4@collabora.com
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Applied to drm-rust-next. Thanks!

I fixed up a minor build failure with 32-bit arm on apply.

Alice
