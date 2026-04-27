Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032793C3453
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 18:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777315604; cv=none; b=mYMPoQH+4xWAMSPREw8dCdvXK+GgVeQKVgDqLy13UmcnptPHUaF3GNlSmz+935nn7dWPI1ILiWsK0PgU9ZBayaIusHlSbFLu5GJQtwuXUf4nRziLyqfiMQUbzMG8AxRJscwlFt3GZjs2XOehYD+C6uqZagTMO1OFYQV0KHjZJ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777315604; c=relaxed/simple;
	bh=6uty70/yIlbVLyI1dlpdP1TmRMWDbYshlNp9pT0a4eY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nBhcnz28bJsVEWJr1pU9+uiupEb5w2+EMfzJWGprqwqM/OcJjuI59+O3QYekblGzI3aKL5hC4hES7H9GmPWwqI5RYMNAhZ43ZJiMyfNmZ7642aL0dmuSZ2rDV10g+L61VpLA4kOc+h20beiTbJ0r4iZAzvSQzHAtaJccBSn33bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G6Uiq40d; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G6Uiq40d"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43d7e5b98ebso8763852f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 11:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777315601; x=1777920401; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=schKK6eemA/etdLN7SA+QtE76XJ0JVRvUkLlJGOyRrQ=;
        b=G6Uiq40dM3vQCIGHaxc6aNHatowC2EVfMliODZF1Y/3A/LcmZkUZpf2JWNtE7I0eJS
         33HnZCr/G9y4HSU6by1MEueusp1askELKL4R8EM0H1dFnGvWInqvflUSZhJtqPKGPx0F
         u5HyRPzIEZ0/tQ/njO/63sEn05grK/62LBQwB8Gzm3k/zhJsyQPOTXGkhk/cELrnA5kK
         PoW/ZaBJCIQicG4EtI5fZlhMdSGU1XsSD9lllM4woP9nGfmwcbWasx3EvnwmxlBTI7XY
         4BDwKr5sWTThzrYufX/+r6OkvL7d5zgkC62i3GqyUlAA5HQ7mf/XFlHXcZKYb0WQ8YGQ
         foJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777315601; x=1777920401;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=schKK6eemA/etdLN7SA+QtE76XJ0JVRvUkLlJGOyRrQ=;
        b=H4nkv6ixiUBFRT/+hQovg0BYOSx/KEXxvtvhi652jn3CAus+oje4K85MHIHheIgYGx
         y1u5NegSbZLGmwU74CqsODSl4aFORrKmVNiTCrrWAo402cugZGLm3mscs9gY+kly3gX4
         yxpG1pmxZ1dwCMu8l5WAKfhJ3pC+1NkhV8xwax/muh2zfzeLVQcSdO51kN6DJGEBLOAT
         9z2I9Bxu8Pqk97ZPK7AUMO6+nlzcLVBx7hXiUZAD9U+wP/a14KKPa2FS1ATD1UYTMVCc
         +f14GGG35cEBJmk34oEMT4Ti/hiHz1cEuqKK70Ckcw9V9BypRFNrg6B3DbrJKu8Y+WNa
         PbwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xKRIOTlK4nAUD2tn16X55UOUMjFCMlyX8gYE7l90rqXjfswmHkzbuehSNjT3O5sL3SrX9XKwhsIuYU8NOCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwBR+ubPpDrgw1S65npLmiawTnsE4WS1LenamQD03kmZCuXWW
	3VE2kL9J+g6qX/DXYPCKmDaEbr74C/FKioqxO/zXLIPaMZG5qd831tQ30wHRuXrnNhYGPjlpH/a
	vDQWl49Wucs4T9H4Qdg==
X-Received: from wrh14.prod.google.com ([2002:a5d:5a0e:0:b0:445:168d:28e9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2287:b0:43f:e22e:e8da with SMTP id ffacd0b85a97d-4464761c4f8mr124941f8f.5.1777315601387;
 Mon, 27 Apr 2026 11:46:41 -0700 (PDT)
Date: Mon, 27 Apr 2026 18:46:40 +0000
In-Reply-To: <20260423-fix-filter-v1-1-b3b197c65daf@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260423-fix-filter-v1-1-b3b197c65daf@nvidia.com>
Message-ID: <ae-vEDyPvUqPRmiQ@google.com>
Subject: Re: [PATCH] gpu: nova-core: simplify and_then with condition to filter
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Apr 23, 2026 at 04:11:44PM +0900, Eliot Courtney wrote:
> This code is more simply expressed using Option::filter instead of the
> and_then with conditional.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Applied to drm-rust, thanks!

I modified the commit message to quote the clippy warning fixed by this
commit and added Fixes:/Cc: stable tags.

Alice
