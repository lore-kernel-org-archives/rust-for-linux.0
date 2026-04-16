Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160AE31E828
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 07:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776323261; cv=none; b=UCY3qmW/+rbnoRQ028HzeN7weyu8U/6YLWAjHIFKEEKIWm8stw/sWWeSzwZTgJlCM8fGVtNevJY+8p18lHId1t9CHcSMKWfwPJ6X6qh1Q9A9uiD2/751oFXD3TrZ4O3gXf5Tbll2etC9VBzYhnd213QdX7P/LM6ewGb0u6co9G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776323261; c=relaxed/simple;
	bh=FoTrsOGwUH78Pq8XPFk2XwHW4lghXrd2tQSAUJNGr08=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kYtOYpv98Zl6ZoRi+/WZy3lioOBa0Iq1IuM+tBI+2XuuwBXTQDmTQ9sLxG0zLWiFOCHnMChYg1jjpkEIw63rgU0UliXkjwms85cmT5Fg3fuGwN5pjRAgETnHiZiXKVnQ3NnuuEuBuQx7UjDra8KEAhT4Lj/6Ip5pZdzDPoZNRC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VwN4ONJG; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VwN4ONJG"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43d780601b7so2502690f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 00:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323257; x=1776928057; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OjQRj3BbickNf0HB/Z2DC2BFmyenMexJ4QcHYs7WLw0=;
        b=VwN4ONJGgSiXvqpXN/tivQgaln9PftFtRgDk54k3PKHknwdURu/AV4KstDjHtF9qFv
         kFry2v+coUe2eu1B0q3ajGYuk7cdW5Q0ygp+5L4WiO9t7TGDoM38f6jfRf2w8qGJPyO4
         2vshi+W2k3KLNDXT52iGzu+/6lTIvBIrCO9cq1oEBee7dGa7xARLQOLQNBDDga7XmcGc
         32rowdwwnn8KeGVs8LVJ7LqvDCnkSsjblPGwBZ6jLA/+dbDqDLzdja6Um+j08VuvsEGz
         ogH79GGuMVSQqDSilCfOiSbg9HrctMC5RHhFkPzVfXXRKPnZmguk5c6JT1J8IsGUwKHF
         cy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323257; x=1776928057;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjQRj3BbickNf0HB/Z2DC2BFmyenMexJ4QcHYs7WLw0=;
        b=HrHGL6DSa6G4pfFQ6pY1jEfHdDzshCANgj8lmOthMoJNCRk1rDO5kIofkmWp1IVDYO
         jVibaEI0xP+TEFJ5Py5Gjo1jjDSQpOJf1pYhGYI6q+WS0YX91X4jTxp/Ry4OdZzSjOur
         /1U7dGjHjUGxufPQRnss0gBG9fd76McEvc5dN+8eeixQHBNmDpX51uN51VgAnnB9E6+T
         1bnTjQGZrKiTkVx2qQkBz9cvbW4HDPDLY+/qt1/A+0ZaahzzTN41o+XyJsYg5Mi21wOh
         OD4C+lAT2Sr7lvQYVU74OWBTJkI6Xt+xW9rF7T/kUxa6+ZlCdZcpE5+kKKqRQBqP97tK
         N39A==
X-Forwarded-Encrypted: i=1; AFNElJ/tdCExPw3YshqvFI6PkrfgQUwWYF4b4RJNUOYc/xUT0w88ItFsAyzZgLcB7cwnPkqBJN2SMus0wRuNs9b2wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrCxb/Fzmjz4378Sk/UvDo6R6qkeozjXQS6nfcRQykrsktSvF/
	pJ/vNe8/FGGXK8mhRJGxul4q7T+l4EYIyWENGjGdoGF1uuvRsub0j83nsUnSz5wmPC4d3BQQ/Nv
	FhgbxmT7w/imuB6Jpgg==
X-Received: from wmop6.prod.google.com ([2002:a05:600c:4686:b0:488:7f1e:5fba])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b6d:b0:485:9a50:3384 with SMTP id 5b1f17b1804b1-488d688209dmr315526135e9.25.1776323257405;
 Thu, 16 Apr 2026 00:07:37 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:07:36 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-2-450723cb3727@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net> <20260415-projection-syntax-rework-v1-2-450723cb3727@garyguo.net>
Message-ID: <aeCKuBOrhHWtGvAF@google.com>
Subject: Re: [PATCH 2/5] rust: dma: update to keyworded index projection syntax
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

On Wed, Apr 15, 2026 at 08:57:13PM +0100, Gary Guo wrote:
> Demonstrate the preferred syntax of index projection in DMA documentation
> and examples. A few `[i]?` cases are converted to demonstrate the new
> variant.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

