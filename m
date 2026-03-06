Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7DE378D98
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 17:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818907; cv=none; b=WyI5IzXdmfG7ENpBdqg67RK6BfsgNi+NikMfiO6hXuuBiU3PNzZl+I/NR0BIVFKH42b62JV1wWEAStxRB9oorCblxc8xWfbJm1iNhQ8CarF9eZ9wNsYXsgAFZj3mzUMY+y/OMqj7pwPuPZadrYx2MsYQmM9IbuAU6SNur4gCUuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818907; c=relaxed/simple;
	bh=petj/D/7GsBxzgAwheiEKNI5thNXVWtmcpVZfdh5Rrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ha2zDXkuXmvIbv4/Tzoj4DYmm6OPUSRJot2jtsh65l/Ji1JQMoi/IswT0nMA1EclvW1Vi6sKyUPsXwwR91xOqMDAjB6kgm8NS4fzHMIixKEk/2l1iytW5wA9104kZBGpSfDR5d9/y6juu1xO7i3J8pXX386a39UaLY5xCpPzC4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoza9mS/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoza9mS/"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so1912507f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Mar 2026 09:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772818905; x=1773423705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+f7yPjPlCgSIbdqVy/T+lIneE+GYlBD6xvU6grSqmUQ=;
        b=aoza9mS/XjcV/bP7x7rmPqZP6gx7VX8x5LWk8Qih8vtgUtAmGG0/2A7RhYbOYQkdAt
         uyUhFg2KDFclKm2d/Cq5y5oDX0Rs8a13qaHETVPllSzfU8wskblFnKDc118+CgUE4v/R
         M/wjNWQtY6PbTHiWpmfBCnB7itwYkLTTELdsxKclXjDLSLnnjlGUOOX8OsSfUpIJv81T
         Efr1+LBCcHYTcbsYiQJA9WOY9wOY/UZ3RqMRYf0Ewt8jGw+ZvsPzTK8GWIK+7E/EPHQh
         v0qBqyQ/1GhdvVBPSTvBH/vtCk1rXYDne8qhWQ19spNKRY+jZ2uoFiGoPMWcN865dGzB
         pfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772818905; x=1773423705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f7yPjPlCgSIbdqVy/T+lIneE+GYlBD6xvU6grSqmUQ=;
        b=HREVkBx4pzS56Ya/ZKvWJb9RDiBywq7NXQfzb196Hpp6MfTNuT+HeQcv+YfEGRmoZD
         Emr4GVxQhGumRGoMsZHj+MDBubZS3yuQ0HJY5bpY4V2lR0STJ7U2N3bR6gNHPyj5KOvk
         iulvKMdwWZF5XzPfz6KuOvE8YcFmRy26cXyLsxqcYgN06yUKPlb9dEEXx8AfKbMnHJyv
         I92E90s1dRaZ4JQGyPzNhDugIBLjxjZtHa9yGEQiTSLkQJI+hkQZ2saWaYnS3J1n5+zT
         98PVkWCs9rztGKENX8kgw5p5eXiaxxWqCDyM81bbI7QU6ZJwaZEPFq+T7nNnGX6XxSlG
         ZuKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaJReWJroJv4IrKOz4ZVU4rw8NLvQnmAs0lJgpWc5OwYYB1pDEeYhUQ7aGrvZ6meuFyfDwjEYvRncXrMGUUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYkXDQHGy8aSw9mAinVRGBoIDHDFlcxwwP7Gx5zGCW+KoCFAAU
	hsE1BSj8angH0MMcU5AKZZF6fxq2OMZC+KiTrp7q1gF40ICGE9neExoyrFjcNM4e
X-Gm-Gg: ATEYQzz/DBy+aDg9D4xIsCv6N9aIJyrXCxWIMjo6KuywDLuHowntKui6TS4nvhulyP5
	66Rsvv/ebpsJKeuYzXX2wy3XdxhcolLguvdUQYIzEzKkOkZf703r0vtVupdd0kUU33VORnECPHH
	zZE38ff7j/z4D3P5r3syzuCUgN4k0r3qOQkGnIMkIAc5rd7YUvJFBgNwGdR730MpmnstcBDeh8K
	9BVJtWmTyHNvX17dAsbrMmhwFa+bSCmDVMNhda97vY2drruMahDXfrpFVaGWLgXPktknkz+XG1A
	5PyE6jpGaYWAzbD3b6n/4X1a6JHVCbz8+gehSYwrYR3OjR5BZhm6vFmJQJ1SXrFbkCi1V4UEDuc
	wDfZh62BYLu1jPivA1DmaRipmBgz1N32Thx2alcwYZn/DMwACcFG5alkxK//6/1xWOzWKO1clUr
	ngKyJwHIhrzvlHUt/XkTnVqKOYTw==
X-Received: by 2002:a05:600c:4445:b0:483:79ad:f3b9 with SMTP id 5b1f17b1804b1-48526979bffmr48445605e9.28.1772818904488;
        Fri, 06 Mar 2026 09:41:44 -0800 (PST)
Received: from jack-pc ([88.97.220.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb29fdsm5480190f8f.16.2026.03.06.09.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:41:43 -0800 (PST)
From: Jack Whitehorn <jackwh.whitehorn@gmail.com>
To: ojeda@kernel.org
Cc: aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	Jack Whitehorn <jackwh.whitehorn@gmail.com>
Subject: [PATCH] rust: add support for trailing comma in fmt! macros with named format arguments
Date: Fri,  6 Mar 2026 17:40:29 +0000
Message-ID: <20260306174126.76296-1-jackwh.whitehorn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes an issue with fmt! and similar macros where the combination of a
trailing comma and one or more named format arguments would cause the
macro to fail.

Tested using a modified rust_minimal module, and checked that the rust
samples and some rust drivers still compile.

Signed-off-by: Jack Whitehorn <jackwh.whitehorn@gmail.com>
Suggested-by: Alice Rhyl <aliceryhl@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1227
---
 rust/macros/fmt.rs | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
index ce6c7249305a..a1d64c0d85fe 100644
--- a/rust/macros/fmt.rs
+++ b/rust/macros/fmt.rs
@@ -50,6 +50,7 @@ pub(crate) fn fmt(input: TokenStream) -> TokenStream {
     let adapter = quote_spanned!(first_span => ::kernel::fmt::Adapter);
 
     let mut args = TokenStream::from_iter(first_opt);
+
     {
         let mut flush = |args: &mut TokenStream, current: &mut TokenStream| {
             let current = std::mem::take(current);
@@ -69,7 +70,7 @@ pub(crate) fn fmt(input: TokenStream) -> TokenStream {
                     }
                     (None, acc)
                 })();
-                args.extend(quote_spanned!(first_span => #lhs #adapter(&(#rhs))));
+                args.extend(quote_spanned!(first_span => , #lhs #adapter(&(#rhs))));
             }
         };
 
@@ -78,11 +79,9 @@ pub(crate) fn fmt(input: TokenStream) -> TokenStream {
             match &tt {
                 TokenTree::Punct(p) if p.as_char() == ',' => {
                     flush(&mut args, &mut current);
-                    &mut args
                 }
-                _ => &mut current,
-            }
-            .extend([tt]);
+                _ => current.extend([tt]),
+            };
         }
         flush(&mut args, &mut current);
     }
-- 
2.53.0

