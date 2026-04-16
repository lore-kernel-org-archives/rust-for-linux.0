Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0759F3845CA
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776323677; cv=none; b=RFF2nqnmkU+C7TLWwAYqz7tWQr2Ss8LOFCwjx9xtD3bn7mYhKEq586SL2S5nRde9yPOJpQqTJO+dHuXmiXuMvfdDjpbFP6hm797OeirW/O0i7eXWPwyhBtrJFlDmdCGiz+B7ykvycSihn2yAzAj628sQmdXDhp0H/zdiYVyqjLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776323677; c=relaxed/simple;
	bh=7XPFoYVvW840ggfiHqGIw3DjMqJsRLWwR9BRBE6BRwU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B1OE8pyB3SrbrXXDRO1qTutV9+imrWMzTjqO3tqXeghNKourQw+UrwCBehWdvMPVjwj+1Mc048VXOSiAEoBhfKQFElz5Am2xcLslCJOIxkOXEtmf2YiSvdsP3SXek6KkMONLcbv5LYuUZUIPZ3oiqvdQYElauykOiTVi52HCZUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NUs9+dp7; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NUs9+dp7"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b94062e85f9so699642166b.2
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 00:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323672; x=1776928472; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtvMyyx9perCSSdK6F2JuwmKCFC8HVERv4ogEceJbg0=;
        b=NUs9+dp7Rq1E04my6MzxxgNHRyqZCUn9K+YnZHGjpLxE7yhIXggVfFqsRCYwdPCV3k
         H+RDNOrj+KhaxpQRRJWrMde0PKF3t9uEZAEc80pHdY2USWhnOLExNRq0aZDgJXq0ChSw
         sbjy1jsQIvEzEoCNkEFtuQNtHULoUS62lOmK9cc65ONV6FbSuiFo8K4P0uPD2Y9sKW8m
         gXblZHHjJSIN9BL/DrlUJv+JyJZeQZZa1IPhgQp11WsB6aIFf87toSeE6kpoAWQd+bLH
         4fFwAjnaaWIjsCd3PB/I7KwZmY4y30r+TCrt6R72KapjiQ/xvJp02Z287mQSOwtOAPeN
         GEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323672; x=1776928472;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtvMyyx9perCSSdK6F2JuwmKCFC8HVERv4ogEceJbg0=;
        b=qKaN1N3hZY0I6JPLUMkIzcgiKSGIrnEEXRNR7o9cdYRN0D/O3vsnt7c05FZ6jHqxzL
         YTIxHjea9Kd5SzCarhtXX6SFHFYMrChrCW8PAgZcM/BP1U6Ujqkaf0EX1HpeSbFWvmGQ
         02UZmCRIEvWrSpCe8We57NP2b2Cd4JEb4RLWJVWhpA6ARQISCWKrTmoIuTbk2KGrsMgb
         JmN/Ubv+Rkc+TpEWcl2Bnfchg2YmnZlIh1tTQU2gFlxmZKVq7UZy+J45fuzjGVF8847U
         MlZGUAjNqql/dFAY4UHfZz6/ondnsjgKg3MxCvWpugYlTLeceWt6cbIszWHcff0tgDXs
         3z2A==
X-Forwarded-Encrypted: i=1; AFNElJ//LtFL4GRrXu/9b4PG615qHVGjgd5jDXQn8tbiHVXw9G8wJ3O/b4gcMjngAlvKGU31wnoTgmHolzTLM3Plow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2iNki5HSDeYLepXlt7mugq13QbD7R8CghJZcU+Yyt0hR9kqtK
	BlVnisWcD38KdiOEde6vUAK6hTaeUEq9FWSFr3XejVvuXfrTf45EbOlXCwKqzlMcyIt1fYKXs7C
	cEzxpnKL54XIQtMIRbQ==
X-Received: from edwo26.prod.google.com ([2002:aa7:dd5a:0:b0:671:2fcb:edb8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4544:b0:66b:aa56:ee5b with SMTP id 4fb4d7f45d1cf-6707b1067d0mr8867411a12.28.1776323671860;
 Thu, 16 Apr 2026 00:14:31 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:14:31 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-4-450723cb3727@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net> <20260415-projection-syntax-rework-v1-4-450723cb3727@garyguo.net>
Message-ID: <aeCMV-5V6__ptj5N@google.com>
Subject: Re: [PATCH 4/5] gpu: nova-core: use pointer projection for command
 queue code
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 15, 2026 at 08:57:15PM +0100, Gary Guo wrote:
> From: Alexandre Courbot <acourbot@nvidia.com>
> 
> This has been previously attempted but missing compiler optimisations for
> older LLVM versions cause build errors. With the panicking index projection
> variant implemented, replace the manual pointer arithmetic with projection.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

