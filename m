Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41236328632
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 12:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762430959; cv=none; b=hQRhilBZdJ7N7fB3ijdatStlraN71gY+EO3mg0nYsR893aq0kNGQvCBgmAIvhgTNAfaNojJaMRo20mWoOyyV3f5PN7xy27+wiys7J9hNYzXdZY/wgZ7eDbuy/ShhxtTrXZPu6UqjMB4EUE4XuaCbb89lvcCpQHmzQjAV7IakXYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762430959; c=relaxed/simple;
	bh=Z0o/E9+LDcOuXxWJgzK2F5uZfv78/HzyRC5P+XWCMEU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fni12bXHENdto32130ke+NpblIBBlPNnPMGW7Xyn5zqAGMzX+mYfOAMgmrUqgSNMI0QP7LMux4WfveFJeaC1JhLXxO9YSNIgMJT8JhM/GlRraIFhcOi0qjxSkhTa7dafQOhbrR1DkqDjESTbdvKkUFoDllT1YqO3rn5lGcjhgcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M3Rp+qIs; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M3Rp+qIs"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4770eded72cso15392155e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 04:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762430954; x=1763035754; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UEIGWJdzKObiVmPMXxxUBYNvOzm2LzV3LBkcvQkVvV4=;
        b=M3Rp+qIsOC0ZBekbOmJEh98LgJsM9RNyt35C/V2yh9yIshhs4Xpxz/Ox4vmiD1gBzf
         1SU0v+Ol5IKDklPiHmDXw/gDRhL5Mkf17cNx9oN5hPd3aip2vp/MLhRhGlfzn+3BhX2o
         sRybnbMw6O9jo6NoBF+LX3Gy/9Nn1ZbyxaCk6OoF2gVjFJOcY4sy8yBPb+jwvcXJBCja
         sXfqhmPcQAh706/Jj7yFFMjkP0TqbmGbmJzYvs0Odq6mdeVIMtMlitefBg4wBomPScP3
         gavI1LWjFFegKwAaRsrt043Mi0dlc2D7AYYM7gNXZKNWnwsuVuA/dE4o+s59t9E9Pwzd
         ERfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762430954; x=1763035754;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEIGWJdzKObiVmPMXxxUBYNvOzm2LzV3LBkcvQkVvV4=;
        b=kEUEn9wfZcfdzpT+tcwy844Y360MnCp5LSOURVVxXFUPtIy1rz+h03yBXWT2QDQQ0h
         kJzXYTg3y2IWnP6hWNtI6hRcPPxTMalEkYPFTJk0iVwcnOPcJQbm02wJ6n6wY1GChRAr
         yo/Bbp+Z99FSkWOhA11H7FUeMobKm4IG+n4lfkrQx40EJ3SHNkhhU8FPTCu4L64PMqFD
         L4yyDFrkK1kIbcAMnDPL90skJqAp6quKmWgqCifT8A8W2pXVfLmJMwZYJPuXdhjm1LE5
         o3AlKZ6SO9lFxj27daEuoq5Lnwfjuj4tMYb9W9Z9cvZCZQOxy4/syVaC2L60Xv8uyaS6
         99aw==
X-Forwarded-Encrypted: i=1; AJvYcCXhoUXugsVF12zHzuxYcrXTHEfPckF/foYhGhC4ZA2biTGEMGqJtOeO2E8ug/WHh1DQDL2WTsPNhdgPkuFWaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4S7GIPpFoECJGyAb9RjUl/8WpIft+GIbynByyiYoRSbx+otYR
	56Wr70jV0LpvolQcLgR3ljTDgPQ04BGLinJ6rWpj2DUQ9Q8ZJI3l3XjcU/7IPs5jtKcdWanvdvh
	Owle7dLjj+s3fcZrm+A==
X-Google-Smtp-Source: AGHT+IF/vvs5ufvq/lcxCF7mkh4haHXUhg89Nr/pEBXemvk4J0V8PG8Q476djBJy/nxJnOv60LVcoNFPcu2z5sE=
X-Received: from wmlu17.prod.google.com ([2002:a05:600c:2111:b0:477:17a3:394a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b8b:b0:471:665:e688 with SMTP id 5b1f17b1804b1-477620986a4mr29031425e9.17.1762430954690;
 Thu, 06 Nov 2025 04:09:14 -0800 (PST)
Date: Thu, 06 Nov 2025 12:09:01 +0000
In-Reply-To: <20251106-resource-phys-typedefs-v1-0-0c0edc7301ce@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251106-resource-phys-typedefs-v1-0-0c0edc7301ce@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Z0o/E9+LDcOuXxWJgzK2F5uZfv78/HzyRC5P+XWCMEU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpDI/m/ZEjTQJ05OQzP8gJQIqLSNxfOaV1KqkQU
 2IMr1tcdieJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaQyP5gAKCRAEWL7uWMY5
 Rr/bEACOBXwt+CkUtft0v9bWbVU4nun6sj1tsjRImXUCG4esWt+YpgiQX/4tH4+rwOgX2GU0IBh
 0DWSEDoO8GAavDyPlvYmwLuEmcQ4VPNsk5blbCwmf3ZOBuehVrn+UsZ4tK6yDC6yW7grQNKFGsM
 Zsm/Sf9p6sgN7qFpt5/9qJtCJ/FHY5Y48UrwF2XMmE97p80KWW/Uc1TyMLKWeDelCUbEj+tPaPp
 t0bN+JA+DmHlL6xuWhv3VD+jIuy5siB0bJU2swlZiWNMmpoylZTmBEdcEM3lp3lUqL8nfGtx7E6
 URJnrDAHdiGl/Ax6guf5/ioMOOWANC5kU3IZ8Tsr5KwWR859vsYxmLrLFFagNWWFBazCmJGrHGQ
 N7cK0gOZCev1q69TuVks26vIN3erCTei0V+ip30sRrf5iH9MuocmLVLwqbrACUVvlOOJmzbFxL9
 pWC3ZXs6RTA1xv8LXKTGpWrXVOQd3QjrfahumJWDHb9ltKjD5eo50w0eFauCvFbjO1oEyBLOGeo
 h38FzYcEeUm0CDJHc4EVF0ZGVRLM7Xsp3A03e2H363wWIKCct5RQw9U1wFWGQO3KrmdkmAptVUS
 KSTsBgDsMthPRk5LFuKtR+50hjMYLWldz/N3AwMrXG6qTiSA2FXg+qO3cAwarDR+umt5JzSyPjH 9JWxANRVwogVl0g==
X-Mailer: b4 0.14.2
Message-ID: <20251106-resource-phys-typedefs-v1-3-0c0edc7301ce@google.com>
Subject: [PATCH 3/4] rust: scatterlist: import ResourceSize from kernel::io
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
2.51.2.1026.g39e6a42477-goog

