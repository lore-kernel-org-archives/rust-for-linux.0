Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007D7221721
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754039697; cv=none; b=MBJDhnjUIbbBdRYAQZQq+o90ZmXYxL+KG1S5O/uWilkIWO6vklroBNu3ctQ4CGW/ChD/cYh5jGdLMrRUWZsdW9Zuy+zvr6Z1gnq6F5kImuvba7VImBoMAWqdBweaq6cOEFrbrB9g0F4JX1JsqybIh9yH1u6VhlQkL6alNmULXD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754039697; c=relaxed/simple;
	bh=mFtCOx/ocfy44fLE9/9Cbz8hih5ak3+65Hx/cX8sxpk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nxOqUkmkJuRzPNIyVdrS7a0QUd2WuGfDUiZfwKH0nrwikIhNcD4tqzxGxsMfEV9NW7EZRl+53KcqbjyUB3LQrtziXgDsjqyhhrBz78B4mhllvtShTP0pu/COnOGhgycIrWnrFyYJ2HGCOB2REW1jH3Ioc/zYZnYsYOSJVB1vtNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qZfpurnM; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qZfpurnM"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b79c28f8ceso1381845f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Aug 2025 02:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754039694; x=1754644494; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IpQjiOjYgpF0fuxQTSWWz9JedYu06n/jjylXo74pt70=;
        b=qZfpurnMDow25yVtPbxw+OGyS11bZrhBZtMrFhHRoMQNg1ueRWyADQ/e0v8+x6+6KL
         z1Sa7bqsh2PC9OXhkT8/bhSxzufgckL1bErOuR0fEpNCaiRVzB+7nc0Y/KA+mz9F8deX
         B5lvWbDZtNeV3Wmn40TnB2eUd08xdEQBH0ivUTbKzXOtx3PcmL4dshQaL8jI4Df0E2fm
         Z4inmaF/K2PZzBtgBSO73S4dJ1Xa/9EiSbHhgDtchb1P3y5xX3tCX7Zh4hLDafIqwRsq
         8/L0K0c4QaJMunQGtaLywsaPjNwkq6DwnYuWilikHgQYCso3uY1wyQYYO5xCAXGvWXdN
         YZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754039694; x=1754644494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IpQjiOjYgpF0fuxQTSWWz9JedYu06n/jjylXo74pt70=;
        b=KVdotn51yTxtFcodsiLLzfWKk2mitv4x8mpFgLSQEoJtMHvvE2Ol4a4bZolsv53dKL
         aF2Qaw/WQLj0/obQGNRAjUGdbs80bBZpddd6fGBM7KcRpQPxT+6TNapFqsrdt1BX1MuN
         HAiNJNBjWFEL/34tTEuU/uySillx012H/Mjh/Dg9KhoOVF8c/88lUrEZBxZfb3MsI7ol
         GGpblnPM+gekMKp7Cg1266x62ObNWYuX2Q9S1C380VIK8FLrFCr2ieY2OuPlBZUs4Gkk
         lRGAqRyYKuTPs6npjZ/6moESC3NgTtgspaCypkrrA+ZEgRF1ZlFjbFmnrfUDFUgjo/Ur
         V+sA==
X-Forwarded-Encrypted: i=1; AJvYcCVscDbjIOP9VV9Zu5j+iBckPdsNLyy06LiOj1Oc5O3tnWPNjOXVHlObP/q1xXNqfFC7/sjHszRss5n45jxuPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8NfNnq1USmAqtBrvkR2U8Ix3JkoRMb5Uiq+aVQutPMBQ2pVn
	Imrc23FThMvQHyGTq/w8Dyp2cNTnRhQztNnJ9eZHPFIeB/PlJ5LRVXI/ya2jAIhW2rovmy9117D
	5q5lCeOTf/Dv26GwVtw==
X-Google-Smtp-Source: AGHT+IESDRZCEwF7SL8d5dASeF7/YHXUd7DUV9ClWEwuYXtRvBgcLkdVZT/KeZok9+iJf2HhJER5jHKLA9aDBQY=
X-Received: from wmbhj23.prod.google.com ([2002:a05:600c:5297:b0:456:21f4:7a98])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2907:b0:3b8:893f:a184 with SMTP id ffacd0b85a97d-3b8893fa74bmr4215393f8f.52.1754039694365;
 Fri, 01 Aug 2025 02:14:54 -0700 (PDT)
Date: Fri, 1 Aug 2025 09:14:53 +0000
In-Reply-To: <20250731154919.4132-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org> <20250731154919.4132-2-dakr@kernel.org>
Message-ID: <aIyFjU67jPkK1BUt@google.com>
Subject: Re: [PATCH 1/4] rust: alloc: replace aligned_size() with Kmalloc::aligned_layout()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 31, 2025 at 05:48:06PM +0200, Danilo Krummrich wrote:
> aligned_size() dates back to when Rust did support kmalloc() only, but
> is now used in ReallocFunc::call() and hence for all allocators.
> 
> However, the additional padding applied by aligned_size() is only
> required by the kmalloc() allocator backend.
> 
> Hence, replace aligned_size() with Kmalloc::aligned_layout() and use it
> for the affected allocators, i.e. kmalloc() and kvmalloc(), only.
> 
> While at it, make Kmalloc::aligned_layout() public, such that Rust
> abstractions, which have to call subsystem specific kmalloc() based
> allocation primitives directly, can make use of it.
> 
> Fixes: 8a799831fc63 ("rust: alloc: implement `ReallocFunc`")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I guess vmalloc handles alignment in a different way ... ok makes sense
to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
