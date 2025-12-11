Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FDB289374
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 23:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765494592; cv=none; b=OztVqsrAdJ0vEHvAUnif9jZgF4YjYfOJSj2hyXQeIslyCrSgZZt8AnGmeV80d9r1QkSq/XMtsxAvNC8nhCBE6aNyBqn3idKR5wdLdR7aopW3pret4sP4tvZ4enzfbkKqf8HbrX3zmicZp31Q62GTRUwiBfDN1tuHXAerNxSRzGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765494592; c=relaxed/simple;
	bh=r0arK33VXOzkVa4+aYPC7jJhzBxqVXCYXmXpbMRGvUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/L3S8YiYXoQnOOfeCEoa2yqIetgbQI233bUFHYXLEhnMCIPNrvLcCjBsrE4SZrxg1fd7CPIf3u4h9jHZpfijNoqGxbOmHluFfBL+Y0uj72eHr7pX2sFyEoWJm281UkWu4DhJo2oCFfdJijPc36E4Bkah10vdjaBfvNC4I14C5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIBELbdb; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIBELbdb"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso640365b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 15:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765494590; x=1766099390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMn6a0Fq/5xE8eIEGvR/KstQzNbcIx3UG1sfUbJLrJg=;
        b=mIBELbdb04H/HXvBVAU7lKRBul20vffj2kF35h/44A/VGMM/JLYMLcxw7wRLyviuzF
         WTxCts8QJDj5BgM4/uTebuWWcHDaTKS+0pltSqqPK/1HDOg6Izm15VkXEoeoWiR1Q2Ps
         eVTppIH75JBzIv2y2fDkNaHUwM+fwvqRW1YojeHVNtfCfFE5KLxsvcwhEvAJOl3cspBg
         oQAcMY+RKXgdU8LuiPqSkwLqQrlcTO3U9A/FXkR7yWXzB8bnkgOR74ReklH3IQdPDEDD
         +3MUE//oOTev72nghKLulDJlDSzzLuzc3ibfYjr0Fr7+PikU2N3n9UMz8hQk2RGxWecp
         DJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765494590; x=1766099390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uMn6a0Fq/5xE8eIEGvR/KstQzNbcIx3UG1sfUbJLrJg=;
        b=ccvJdaYPdLeHugQMtWFSHhGq12e6vFTIzpcsoNeXvhYqw6qWzji7nM8rGY6dg3+ioD
         JLdJ//NZ6dR5wxw6KbVlP0behW96sW0rA2urv6H3BYEUl7VRbY54rBt+sR2DdDjJAi84
         8sK8SDmUhc/qa4xzPx7DFsmVA4GxKx59krbBVOm2XN0PCEoKLfYdzfYyhiprv3LzJOZm
         6rALgqe6+oQhMKkZIFe+N6V2nZrfUvGNqfoWt+eeLBeW0vGWLAVxfdEgp+HmFM9EMvC8
         cBpKG4fIItDR5xhJpxTwVM5uMUT0DQaoevh8TcxHkZCvM2t15EFedO5owoXh0XtcwMhK
         +fWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW0qwAlKt5Y/1gfO6XKY0ZRujSBzkV7LV20VPmohsdYgIvIOCRqaK3k2Y7/Cj1e1GIValWm/eYU6gmbvH1fA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2lraH5lj2pmagvqwBJQ+SjY9/LsCGnUgmJgXgrGCWTcFiypZS
	nTHWORW09JbH+qKaMinYnJzMw3qtH+E1ecSSgzRb7etc8nwu6E9osRkw
X-Gm-Gg: AY/fxX7tn9fS7osEeTTfRnXIujOobj7eirLr/XbBjjzEsbewRzjkktxXZjYQLFPwqWc
	+hP1WFHUMjFUBrdXsQ0J9xc2DH9Y9qj7XsXqzYitG3RydhGjdNL8XJgZEur/R7An4UjdwjX3h5k
	xZTTC/hDUyWFQCNhGvuIeEGP1IvSjjilJQWpaG16AdX10EGXwV7QQmkB5ih8e9U5Gqw8AdxtXOc
	7/P1Y69nSnwjnIYFBDacJ8e/10GsykFE4qvNx/NOreo5l5npaWgpLEmD8WnrMR1IHpqA445waIb
	vi6qvfk3aLybV3chFSKiXhD71/GzdIw8AKn0nw+LPASDcRzxjGxGTsVyXj5fNknWqU4ZuIkjhbC
	BN0ugbbyWy/I9lxI1jfZg/XjPthbqlGhsTgO6CCKvjc2XSWWOweGtJNHXnahqGBGVBrUx0Dd5Fz
	o/3YkTGG5xKdaW8d/XcnVg4yRWpVU5NTpkWHAzcaB3Bm84x8JB/UwCLNhattkQOuWjxKVR3adP
X-Google-Smtp-Source: AGHT+IExvMsp3wcohnlC6RtSf7lYdNo3BLy1b8CDgWzRcGLnHI9teFzG6YHYfN3Rq+zkDoKlynjX1w==
X-Received: by 2002:a05:6a20:7290:b0:366:14ac:e207 with SMTP id adf61e73a8af0-369b748dfd1mr62851637.69.1765494590187;
        Thu, 11 Dec 2025 15:09:50 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2bfa0845sm3247728a12.28.2025.12.11.15.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:09:49 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: ojeda@kernel.org,
	a.hindborg@kernel.org
Cc: aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 3/3] rust: sync: set_once: fix doc section heading
Date: Fri, 12 Dec 2025 08:09:19 +0900
Message-ID: <20251211230919.1303926-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211230919.1303926-1-fujita.tomonori@gmail.com>
References: <20251211230919.1303926-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation section uses multiple examples, so the heading
should be "Examples" instead of "Example". This also matches the
headings used in other parts of the code for consistency.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/set_once.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
index 5894d0dda14e..ab362410119d 100644
--- a/rust/kernel/sync/set_once.rs
+++ b/rust/kernel/sync/set_once.rs
@@ -23,7 +23,7 @@
 /// - `init == 2` if and only if `value` is initialized and valid for shared
 ///   access.
 ///
-/// # Example
+/// # Examples
 ///
 /// ```
 /// # use kernel::sync::SetOnce;
-- 
2.43.0

