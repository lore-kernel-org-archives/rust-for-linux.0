Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEEC23645D
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 09:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769419062; cv=none; b=eRTDHEUB/Wfd3krmHt2Fa+W2SMhwW4bo9YAcWwv9xYA3wNSkpm1NOrOQj5yWEMrRc1P7JbxmTj59kUZt60c6bdiV8Hjf+6u6K7pypyIf9CZdAG9agztfxP4IfcX2xFBkHLK1JsFA5c6yMHdHtE9B3QSwMI4jD58JorASq+G2a9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769419062; c=relaxed/simple;
	bh=YE/3p1oPiKDdVFuquIaGhH8hHQjXJD9JVuXLb3/mlwo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UIGvGkt4RE4CeM/HLBHkzY7zX9TJb5JysnjbPN5BAQzZ5B5jSadaRkfCBk8ST3LqAwy7hS8uvg9qsS8b3a3fiLHbrjvO1L4cYi27xnQ5wopnDUXQYj5NLb5ie5XT3/dnH5a7hjfFrIww4qgtkB5vpv/+b7zVHNuZ5C98u+nIxaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sn4p1ZFZ; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sn4p1ZFZ"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b8704795d25so371412266b.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 01:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419059; x=1770023859; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+2syxKrl42ps+aJbHDLMrcYcslmTz8dk/sCKctwr8MI=;
        b=sn4p1ZFZ5LFHIfnh03EKY7CQqv0bn3H5PO8kUl6gS55AcZPfdE43IxVL+rSd89Nx7a
         8PJQvhHIDn+QdC/UKRwPzKLXwi4vxqJDwTR9nu93JQ8Lzh/ytsgmW1oeBjKPnINqOqXI
         dYcvraaI0E1AvtACcHrK8xelP8NcY8PLky4+J6jHX3a5qNau9bZoFHgmV44iX1heGIq3
         Z1CM7rvU9Nqag5s7gWZsm3ckBYQWNsvwCRXvQUzkjF5WDu5YPXYKCFb6Bq2CN2nnJIaQ
         qtKfyBjxLBsnW/YdxX7E8u+6kwXnohaWadZSMq1vQ7QpzJVK7YxO0ywvseAK8V/d+fiM
         pnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419059; x=1770023859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+2syxKrl42ps+aJbHDLMrcYcslmTz8dk/sCKctwr8MI=;
        b=O7h3Iv3IhH42F1Z44nJx4PpvtvnmbEWwVNEHaUGZ+CHzyDWeDY+v+KJHxd7LYyX2nL
         eZxKaowEraOlvR89JSeb5Xprrt8ILWMHAbRGFdideDHxXRUehLKUAA11qCz1hVW7f4aH
         mN3FApshWqkdKiNF2fIbJVsNZOxD/ncv2R0BK8byRVmv7wWBBjd3hKxc5iyCxok1YwWG
         7MBlJ4P1StR2mVLCA+fJGamMD+pyYNXl6asiFM8Bn7yrGkhTFk2Yu4kriJ6vyXrU5QQV
         6o1G0gXXv97Rax0us/MszYuJEdn1FKsp1Wro/8b+7XW4r2pPFPjIMilWMKXhSDbyefiJ
         /exw==
X-Forwarded-Encrypted: i=1; AJvYcCWUVjMv4iTtVYQNl9FEbn8pwGCZUVO7CvqMFQjmUysV0cM9LrNncF3ZDjpGoBhJcgU/sXcBr6aeRW22Rvfquw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhuHHIMGgnpGfyfo2UB2IutBHAwdyIzw/dz2LJ2hHYZS4hFuc
	vQFVPJR8jqWEVtXzJRu4Ha4hI32ontc5Em2jzJejxMrZm/PJSn4heb8MsxqqDu0Y1Top4XBbyWF
	0GPVCTtev03NCl1SIjg==
X-Received: from ejbbs5.prod.google.com ([2002:a17:906:d1c5:b0:b88:347a:3051])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d27:b0:b73:2b08:ac70 with SMTP id a640c23a62f3a-b8d2e8455d0mr256016966b.49.1769419059057;
 Mon, 26 Jan 2026 01:17:39 -0800 (PST)
Date: Mon, 26 Jan 2026 09:17:37 +0000
In-Reply-To: <20260120181152.3640314-4-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260120181152.3640314-1-gary@kernel.org> <20260120181152.3640314-4-gary@kernel.org>
Message-ID: <aXcxMShqvHzYMllD@google.com>
Subject: Re: [PATCH 4/4] gpu: tyr: remove redundant `.as_ref()` for `dev_*` print
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jan 20, 2026 at 06:11:09PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> This is now handled by the macro itself.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Acked-by: Alice Ryhl <aliceryhl@google.com>
