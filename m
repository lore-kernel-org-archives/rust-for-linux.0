Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AAE2E11D1
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704299; cv=none; b=HRrBenRqmwytqxBfqcrlYMPZ1N4ZsnOZ8mybdtWLsduycNpFnpAjmhKx1PlsyaP/tlbZWBOUkCPMQDq30RWXY8f5Qjp85C0yuNFg6nuZ6RGtP+wPyx3ff/Cv0FN611DTI+fBe8nmI69K05OZTw0KcoU82efQUYxTBrAZiuCygs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704299; c=relaxed/simple;
	bh=b4hkmeC+wFUlheAh0FzFDJuK+/w3bz7OF5SAt7uxYag=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CBL8V7OyTFXZE6+gm8BeqJcWntMw4/T6EOK9StXvY7E6q26iY2V9D3wKYRWpgakenLjx01U50hNzim0CbFYkDwyqyQBbOxPPeX/1TBmTsSc4XEMb2MnJmZKrM2WeOOwGzlj/yYLmfgdN48JABdO2raydVU2oKfj+lOQgMyagN/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WrzA+pEp; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WrzA+pEp"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b2c8fb84fso3561739f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704296; x=1765309096; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j9I4jS+CkOD8WcMHOPpX2Laq2znDkJHzIQe6va7xDus=;
        b=WrzA+pEphUfmU3Vlzk8uqm0dnUCGcqEtQbymBc3+xfZWXuRoqkIGsQywNgAuSjwaDI
         l01Jb1Z7nFyPnb1YEoBYGCjgo/XvQgbNF2uVNky6SzF2aUsPc+xFrflxpxgO+4GbIIXH
         gs00R+mU7oXG7bl6x+9sUC5vp/c72H6YalIc9dGY4TmivGAAncHxKQBECVlAY3pWgNQq
         kuy47TzdDVBhv6u1xAC29wSdtp0+mUB/0Jh6LXT+aKIDHwXqjikFukOXutQ2Hig4hKKf
         iwhgrirAWLhd/0nDmkiuZHY3m9Wfm00bsLr6XpXFqJezDJQLPDtssMFasmfJf9xReVcb
         dKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704296; x=1765309096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9I4jS+CkOD8WcMHOPpX2Laq2znDkJHzIQe6va7xDus=;
        b=rVBeOff6dFeIThH6903/uS14fNkiVzP2DChucaMAWTGAq6lKjj0FhAH1rqwpfVF2jv
         qa4wvZvSEeAbOW2ywr+8MjCLKtbLdQyHaDugkt0eLOitzAYM8/uQQYaXJjLNdBDj2XjK
         0qAk2epXFCEsGwr9H0y/b78snPoUDl9mU22XQhvF4dIIlmWS2zgiC0Ssqpce7QkrAaeu
         W91NbvW1VarwQshfKD72HVxUcyO4QgWZ0g1LAitH4T1XSleoPrg+NaMBZX5EbyoCOfn4
         44XF5f4ms+gsJ3CeHpgBr3ebmjSRq6Se0NeYL7tHZmbsDM6q+oG4jzsjX0xqpgamsgRj
         EbIQ==
X-Gm-Message-State: AOJu0Yzv4VBeCtBKnmoPogNZvJ8YOBnUnim3MZBIDy7mjMTvCEt9YXvT
	xuPNdEJxRkUuKYlwlBE8cNwHF2+D53urv66SElwMQbtYmWhaUig6D0RGRnwIQTsU+85FNkgdZOy
	16/o/ZXvn/En7XfLIax7zKJl4uKG7hwxBk1ExDrxXzia3qQevDatWXPYEPhMXwle+HCc4I1ap2a
	tms9HAs2FKDx1J3WnbM+WLmBptCedpQZXs4r8u0+xQlFVb1wwFSp6DBgYTnggwtWA=
X-Google-Smtp-Source: AGHT+IFafOW37ZpmXOGIJbp/0M7mmCXdck1lXQ8qYTVq025nRVZmT5HEkDQlb5GS0Sbcn6sHCWPrq/xZgSglm7c=
X-Received: from wrpc7.prod.google.com ([2002:adf:ef47:0:b0:429:c1fd:61fe])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2410:b0:42b:36f4:cd22 with SMTP id ffacd0b85a97d-42e0f344714mr34472907f8f.38.1764704295819;
 Tue, 02 Dec 2025 11:38:15 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:46 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=826; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=b4hkmeC+wFUlheAh0FzFDJuK+/w3bz7OF5SAt7uxYag=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AJBMbP/V8F4ca/e7BxIHaBBhe7jbhS/93kZ
 23C/DV/phqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACQAKCRAEWL7uWMY5
 RiTQEACcavWxpeD7XyNzmd9xA3CRvW0Gkngtveouc4E0U9uCwR7rKcVHB1yAAzYqnbsCbLgeHMP
 twUdVG7qDGJy0WYD5pf4m1ITBQTdQ1dlw1Kl+K0MSVEuwpuaE0TOyoaHF2fNZ4okPQoqAi3eF1r
 5RwBQjJ1WjzQSo/wLXB3AyWkARC8rJcTYLESNiEs//zLaf+dx6gTrXsgyMUofoAfiM6gDl5sU8o
 3pB3iU4PfIzPYQd1iAbngPilPm1o8KUkYHQX7AI8vv5Fu9P5qDeDcfmNLoiI/CP9pxCQgyUhtPB
 sZ+RSFnM6Aw6FDvmpN2x/RpePJ/fnvuva55OGCTxwexo4zD3EWjkDxu+w04bWFWfdAYnZry3F8v
 hNWa9DuAqZ6RormLBfN6/BPuzoX6smAGPLzC1yVKlP7YqymgEkm3W2/4e/wBxiF9BXFDJYWtN7c
 Mg1sI5bVQnpTlMwA2dMcodkCbCkiLLMaU2NFMB4LFIWdQXDTmdHt63nZiHMBRbOa4ah1O3lmjd9
 e2/T+8DI8iit9jF3eYiZgICWpHEm19947slxtTGzd3rrc+ThYMBLgKMfkULezQfTXCHGmnhdSWW
 77TfecTGBNYxVrhFqww9fnhQNTP/7k35F0rm9wWmkkzhwldmf8QbjnZTjY0m56Rc7hf3d19NfVO e5N26Dt80LxNLHw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-22-a2e13cbc17a6@google.com>
Subject: [PATCH 22/46] rust: kunit: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Brendan Higgins <brendan.higgins@linux.dev>
Cc: David Gow <davidgow@google.com>
Cc: Rae Moar <rmoar@google.com>
Cc: linux-kselftest@vger.kernel.org
---
 rust/helpers/kunit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/kunit.c b/rust/helpers/kunit.c
index b85a4d394c118906d35ffef85221cf1a8b3c6fe3..cafb94b6776c07fe505e1749de71f91125006131 100644
--- a/rust/helpers/kunit.c
+++ b/rust/helpers/kunit.c
@@ -2,7 +2,7 @@
 
 #include <kunit/test-bug.h>
 
-struct kunit *rust_helper_kunit_get_current_test(void)
+__rust_helper struct kunit *rust_helper_kunit_get_current_test(void)
 {
 	return kunit_get_current_test();
 }

-- 
2.52.0.158.g65b55ccf14-goog

