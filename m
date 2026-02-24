Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEDE2877E5
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 07:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918977; cv=none; b=nb7ElAkjQMAuvQuzqyjLZoD4PhLQJpO6Gp6OQdy7fovafraT4jk2hBJ33fPWhaKBpzWbC2BSni6bR6AHrYQlVGI94Oaq2aRq3npKGsYLKkG+MRqTu5ju4ICuT52FveKPGRhMVoYvRt9yKJPjEMbxvfF1mALrhYoVYl5skwm5nPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918977; c=relaxed/simple;
	bh=sS+HFufv1CytA2sTO2hPUCoD3nIecQXI+I1YVI8rjfI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A2LhSYbxhJ+KaZoTkeOUZ1WvGiREKIwFUqGHN6FgX8bPDBF0B51J71lHY1iet+rKwWb1bCxzGAvZc5eO6ffV5E1fnOkv5Nh4lWzlaJ6ihtVDlTF3Q9QN98KzxoNM8oFlQsHR0KecVYx+BYimle5pR90IKA21Ox2a7SgeJ/6X3oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ccaOe0vF; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ccaOe0vF"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-436267b01c4so5181064f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 23:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771918974; x=1772523774; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KLgeAhL36wm8UIjzvmBP2LJKULVjcpqcgzoTxIUEDHQ=;
        b=ccaOe0vFpdA6LS6iFuZAe1VU/ngV3KaF4JtdK40bbLr18eaeA+GQlQX0RWGDDqlc18
         Wz1CCCAyLSh7uFQ+Yxx8M36yQRmtfxaXoi1Ap0cIhpnBmyNaFHpDduA8IltUJ3vaXmHS
         I4q+g0FGrRvolfa0+sFTxjNpQUWu8q7jhIXS8rI9euW0Bj/LMfaeMZJT4gItv7+xFyqg
         R5jZTVpVFxJyaOWaGv3Ugy51qHESXMZRkpkcPuW2m1e0aWSFXk/1ikuw4H9W5KlEtIcz
         9efs0pFQyt2Kr93dmR5jELcFHtNl0PPWlDdhLgfpLQUAgiVVwPDm2a5+ybKPa/MLkaua
         jrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771918974; x=1772523774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KLgeAhL36wm8UIjzvmBP2LJKULVjcpqcgzoTxIUEDHQ=;
        b=ZDNtinjcqK1/awOGQvsvL6FB2b7t6NfcodDS+5T1JaEXbBX9WDj87rqZBf29U8aiDr
         kubFKTllwuW0+e1WXeHBY6Fn3Wwy1eX8L3Rsdvyqp4w5n4iJTXuzLJuVE4ceiYMIV0R7
         HCBotetMwi09ZxSzNdeMh0RQxdgQMO0CWSk5bYQCkUW0FdkjzjfWW8L1cxIc+r55N1SJ
         eU2T/QdHYRNgWgCi8nTY0iBMPAQfpngEJOp72rx0V/YoLSTU4ykyLsB6thcpUET9AZl3
         FhLCz+Y7mawtaKG/eZOleX8QdtZqwMOOyl/ybzMz+B5eBmKqsatjyjbmhzcSBqyCXeey
         DWPw==
X-Forwarded-Encrypted: i=1; AJvYcCVPSopqNhH42xmnXQXWqojcP1lWHmsKqLROhl36EvfyyMbf9ojjVMHHUBpImlafiirN+MC2R9mzN0kAoJMhmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz57J7r6k/saQiIIXVf2Ch6aUzSzM4qeuz3dyeybIBSaNk2B4lU
	j+rB+Rib1SQpgAtv9DjAf4f3IgEPnp2MoLRePjpJmjbG8TDciBCYh3FxH86aCKoq1D7W9CYW2ZC
	U8j2Me0WedpvE9QLy3Q==
X-Received: from wmby2.prod.google.com ([2002:a05:600c:c042:b0:480:4a03:7b7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e45:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-483a95e957bmr231163855e9.16.1771918974396;
 Mon, 23 Feb 2026 23:42:54 -0800 (PST)
Date: Tue, 24 Feb 2026 07:42:53 +0000
In-Reply-To: <20260223203833.207955-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260223203833.207955-1-deborah.brouwer@collabora.com>
Message-ID: <aZ1WfUrNVPmf6vsz@google.com>
Subject: Re: [PATCH v2] drm/tyr: Use vertical style for imports
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 23, 2026 at 12:38:33PM -0800, Deborah Brouwer wrote:
> Currently Tyr uses rustfmt style for imports, but the kernel uses a
> vertical layout that makes it easier to resolve conflicts and rebase.
> 
> Import guidelines are documented here:
> 	https://docs.kernel.org/rust/coding-guidelines.html#imports
> 
> Change all of Tyr's imports to use the vertical layout. This will
> ease the introduction of additional Tyr patches upstream.
> 
> There should be no functional changes in this patch.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Applied to drm-rust-next. Thanks!

