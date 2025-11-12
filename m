Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3418530103F
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940948; cv=none; b=HfMtZXBxFf5F30VoaGd08aIoO/6UxDqKt8Ry+at9hIlw9Yw70QKq/YKdQc22CGMZmZH6nZ1tfwGx69Kj37FmDq7yYxFRLYb6qKZqlkJYJbrsPLze0ooXDL0FWtVd8ZkucOGy0hW7Dak2uVeJ8pxAoJ8SszCVnOuILygcVjcOdwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940948; c=relaxed/simple;
	bh=Qk+X7JoVA3OKBTJXGI41YscCwbZpvIcMLhxavwN0BuQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dvWLW7KFgGydczCLITpheCX0XXPV4oBxVGSzYRccqWIZ4BXQ5JjAd6MAcG5FMt1cy05pVj/l3mkkLGRBwTkygzNFZmb0rsoqTAqPdbzJc4EPpmk+rfrnZkWiuofMXcSdZKXzSudme8rmB8ShM2YYCr0AqoGZQoXwy/X39tluSJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tExaGUq6; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tExaGUq6"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4775d8428e8so4797715e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 01:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762940944; x=1763545744; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sLvYrtTgK6rKdH2JSyNHP7LJ6X5YHzCEJHGgBCNRd1g=;
        b=tExaGUq6LUOylsscdwOAFwEsHbkKaVkHlZceqGz7Oz0xv7ewmEP4yFWS9SFLIU4gQO
         L06Efx7bftXRW6qqj8+/biFpWLlxA2krnwX+eX/H5sI3q2Y0TAu5KOxojN/Lpt4Zhbrl
         we8+YnUEqk1c/GsOnW6VZqEyZC36GfNYV5edL8r+jhFmNsuikkTFA5V2IHwilYgOYETx
         2feCPtNAP/NqaRTww7xZJ2693Q7dP4eITWW4AiC9kfulP6jiLvq+MPfbuSYHY3PTnqYS
         L0/z5ud+aqEsIRtVADpBicVEYbosmjcpLl4W0WHqW94QozkRm2Q11Cx1U6KrMIsxWlJm
         1vxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762940944; x=1763545744;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLvYrtTgK6rKdH2JSyNHP7LJ6X5YHzCEJHGgBCNRd1g=;
        b=UXruMsLJVWiDDGrVWyOcIZrXKoHvhPd68n2SaYvFmffntu5qZdL94CrM0/jVWAJ3hK
         HUQ+2uLFk8JeP2mvJVZIFojcXyeBA4rP2eyiiGvqVwrOobRyS1/GbY5zZuPT/3qbioHd
         2uZqlQF3Pdowjfm5qXpfXQmJvup3mazgVDMBIjWmt6BR2epdsPRIxihy850ZFcS+Icod
         MMioN9xTP+NG8i+9OEjAfsEw/rvvyljqLoYnnrWAqsccOAsen7JauCdrj4103mc5weCn
         PxPlCPlikXR3D/5EGKaiJAb0UL6WnBee6kRgi1//i+ECVQsTXhbCaG+g423Hs1Aa0T9Y
         61bw==
X-Forwarded-Encrypted: i=1; AJvYcCWt2uOM9INrpNlxsH9egGW6D6qCzFoyZ8wCx74Ipn0RaWWdglgMWrRMk/6CMn8zVihNg8wtpVvHhWQS++pFfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5RWKfidiIo/VvDMCli8WaLqgSWyMnXmU2Dn4W/z/SX5nKkyKy
	R8+DJ7o2nAVP/PN20Ygr0EXLx83rsahY1oclipcxxQzZ5gRsu1XX3VXPMatXgDeP+1ULORbyPmr
	NeBK3iMY/lNCRR1VvFA==
X-Google-Smtp-Source: AGHT+IGQzCgUYQ9lQzKZ+wnG/A5p5tZEfe3+/e/x1nE6ewStdCdDyfqM+EebIA/uOMWl5shnUfi8YTdYl6LsGJE=
X-Received: from wmoo8-n1.prod.google.com ([2002:a05:600d:108:10b0:477:76c6:3a81])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f8f:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-47787059f9bmr22032425e9.15.1762940944562;
 Wed, 12 Nov 2025 01:49:04 -0800 (PST)
Date: Wed, 12 Nov 2025 09:48:34 +0000
In-Reply-To: <20251112-resource-phys-typedefs-v2-0-538307384f82@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251112-resource-phys-typedefs-v2-0-538307384f82@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Qk+X7JoVA3OKBTJXGI41YscCwbZpvIcMLhxavwN0BuQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpFFgLFEz4i/CMZb4PR/28EU4U7QNVBZUr+GfST
 P91mj1NpX+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaRRYCwAKCRAEWL7uWMY5
 RsBXD/9sK3WYVvrASMq5I7tYjmkzx60ePNEplHnG/fGp2unAOjWdtu6aJ8KEg1RXGrPWm79wcB6
 EzcnluhJsElsycw1SgyTf7yVG8Deg3TWPzYwGb7J7ky3Qie6JxVa2ageDHsjLvsj7khXqXfcPEl
 qfgv55Qm7Z0gTvv+KQj7ZSHwU2d2ccnRGZ4Rq96POu7wZPHd+Vx9D3v6vZ3zMv8R8kG8iHayT3W
 YP//Qag9AXlcbAlqQSjqM2hVto2Q4nOvJUWPMErf8wzf7EVXC3UPz+uVZXwkWAsrDmiVGYTDeMl
 4tU1OmUrI7TsqoRIqG/gtjEBw1/oOrkOJmeRS1t7BBDaa2ZuT37h0nJyMKIMQVtnVdo3CYZFU6j
 hHs+mHH14NuQwHiHP3D461MItacTLRn1w2d22o0XIni381xeJfI16QI9h5Itrsk59ttKRyzPebe
 NSC/0r5nAotdLXUviEtVoMrP3K8Z7qYFhSnfe4WfIQcmaDcFl2qYTmAB1LedLAvjO/sguUhnOQe
 vgitz9o4EqDf9NS4Lpzjng9QK+7CSCVfpldTPYtWdzNsufLQH240FUTzWl172W8R+xQXt00OPkx
 JDKZwADMoZ7nptixSWGQZtsASHoChDOXlhDzKduzv8AE/1nhxJAII0kx5AHJqsBR7J05/2OnpLn l5ueEPNLVdLhVZQ==
X-Mailer: b4 0.14.2
Message-ID: <20251112-resource-phys-typedefs-v2-3-538307384f82@google.com>
Subject: [PATCH v2 3/4] rust: scatterlist: import ResourceSize from kernel::io
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Now that ResourceSize has been moved to kernel::io, import it from the
io module instead of the io::resource sub-module. It makes sense in this
case since the dma_len isn't really related to the Resource type even
though both are sizes of allocations in physical ram.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/scatterlist.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
index 9709dff60b5a9a02ab466f3e4f1f52ab2e440d5c..196fdb9a75e788cc31093d83e412ff4d6ca56b75 100644
--- a/rust/kernel/scatterlist.rs
+++ b/rust/kernel/scatterlist.rs
@@ -35,7 +35,7 @@
     device::{Bound, Device},
     devres::Devres,
     dma, error,
-    io::resource::ResourceSize,
+    io::ResourceSize,
     page,
     prelude::*,
     types::{ARef, Opaque},

-- 
2.51.2.1041.gc1ab5b90ca-goog

