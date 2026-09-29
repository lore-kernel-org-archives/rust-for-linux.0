Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD7652842D
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 14:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691288; cv=none; b=jcUQ81xi7Sc5v9YNi4AOVQXLtYmgH04j+QWDxAZI72LfUOmJvQeUMeraMZonjizKVbnFEZoBnZnwGr3NKkFzztytb5HtLn+yU0OwyRSDoAtrC7rzsvlCqAJduTAW/22/BYKPXvocJBXQk3FaDAPpupZ4dp8WQThO7RgnDbMEFPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691288; c=relaxed/simple;
	bh=iQpFxkadxuZthWNzpNDmq94Hthwi+6Tsc7gHXxzEn3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U3N4cQ69dQlI/s5BTS8M6RmTiZZMOTowPu0n8C07zDPDFgsRBbnRnD/4kWckMOtC2IRwnHQp52FjSH+dZjCJhTOePvwyHN9VVqkWmBeZW35YoRFZh4q3VpZ1qvoe8OMuBOUEGc/AnJpoXDfN0rxNbIWSPWEfiGHz7V9iGx7S/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMtd/r1A; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMtd/r1A"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b3e517e6dso355670eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691286; x=1791296086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fv2qyWJdbrcJvcqAwpcW93SKoGJg7N/Guzup2THPVL4=;
        b=iMtd/r1Adx3ogVGhhIC4Yvz/76RVebwWOp4Q11MPCMyRyTZhuYh6dp9wkD6yrICJ3h
         UAmEeBw9+j6cdCOksaK1zCioItb+GF97oWF1kMEIcCFf+crWskzZQ/kZyrXG/8U4cDPf
         DtG+TMx97il4dLDk8vlxYSq6VSaT6dd2kJnmkSNbi9b7y5gDdHUSgcanhOZQMGviUhl8
         gZ2N7332YXERuuzdJP/WdAspadmuqXlbaELTJt6R74fHFfLoR2JthshDC4Eif7fZFLXj
         yafU7VV7Icw76Z4eXORWP541e8VZs44wI6Rry0tvULFck4XZ082UD47Yxv7ANoUD6dv2
         tJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691286; x=1791296086;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fv2qyWJdbrcJvcqAwpcW93SKoGJg7N/Guzup2THPVL4=;
        b=iNJnYNaA48zrKBLy2w8RMiB3fLVH9JSFzewDYG/IctHsm2m4qhRJ11YZeFMXaW/9ld
         8FYuVGXoeEdKSo/T+YlJi9M2SUMrfcfygb20DC3T3E+7Ms44RTDulPBvsKXJM4UO+4Zv
         4sTXeN4v9tgAzBYXOOroaYC+fkKP9a0LQ45v31eFe9I5PFnBW6QKtepOrgLu40K3RJkE
         rJu0nof6yzubea9YcJb+SqFuiCKNmXpxr6tVsse/QZrEmtPqK4DXJ7Ig1ULQDjK3BYjh
         8T62U+N4uYstP4KP0sRgK4/ZXkidXSotiNSMkqyeV/FzSCBS+nFApiXeNEfjjVxU5+J5
         ofzA==
X-Forwarded-Encrypted: i=1; AKwUvBwC6phx40GoDBtDf/c9PiKiqJQZ80G7ph4X6CN52sK093RJZZIhs6uRewUY8IlGK0NsumymTOrJJW6uJWHv6g==@vger.kernel.org
X-Gm-Message-State: AFuF++kL9xZ+KXKgfkGsT6Q6iHix9RgicHP28eUCfL2e+4PBITv8QiWN
	yJi75xOFeqm6uj0Q+54svNin+Kyf8Nlt0S7S5q3+LNgS5b2BnTYlU9A=
X-Gm-Gg: AYBFou37IVXinvUW4/4/8qf2KYvA/2Mh3vkr6a8d2pMpZWzxw+4c+CGhKgu0zjF+V/n
	kP5vLWBSnKu4QsEwUmSB6qGRY2xY2d1EPMujc1v15I9Ihj2WK59BWYYmWQFdKXoC3lUJF07P5jI
	pjAFPovh9RZIyuWNXQQBKU1tv6McGRRD+QlvJcdnbD9ggj2XR9Udg4foJlj6YttBWtXxmd3UN4L
	hbgtqR0LZXU8paT2NDUmjWeWOigQB36Uct7UJVcUHBOUZ7GEK2rRj/6l0ZJhH7bnunoX+UsIk0B
	Nv3Z5CJu6h7OtwVKy0bclk92fVQYdSr6aAM8DL+Kt+1F3Fow/93CRWoeIPqC9eLzUS0c/69LbEP
	4IFlzewSuTJRET2Gl2x4mz+ZKWl2LcIAT2btUsWIxLYkWbkP4oSmiI8DtHFMA0+T3PnJj7czTH+
	lk5UNd8/XD6gdIKi02Y6RNeiS04oMNcIRUnuRsirBGD/IPap+BFeYDtMyOAX42M5FuWENPViguM
	umZPqv9tFMrLrctXQxIUHjc8YUHWibO3UZm6HlKCFsAJiMO7uUdbFWmLdWK
X-Received: by 2002:a05:7300:d0a7:b0:33e:4475:5e02 with SMTP id 5a478bee46e88-342700be32fmr12739592eec.5.1790691267018;
        Tue, 29 Sep 2026 07:14:27 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm34733297eec.24.2026.09.29.07.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:14:25 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Yury Norov <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case
Date: Tue, 29 Sep 2026 11:07:43 -0300
Message-ID: <19080a499f705990382dfcb850a17d71689f62ca.1790599486.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790599486.git.nico.antinori.7@gmail.com>
References: <cover.1790599486.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rust KUnit tests now support `#[should_panic]` attribute. Uncomment the
test so it can be run when CONFIG_RUST_BITMAP_HARDENED=y.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/bitmap.rs | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80d64..a9935b2be8c5 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -571,33 +571,29 @@ fn bitmap_set_clear_find() -> Result<(), AllocError> {
         Ok(())
     }

+    #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
     #[test]
     fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
-        // TODO: Kunit #[test]s do not support `cfg` yet,
-        // so we add it here in the body.
-        #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
-        {
-            let mut b = BitmapVec::new(128, GFP_KERNEL)?;
-            b.set_bit(2048);
-            b.set_bit_atomic(2048);
-            b.clear_bit(2048);
-            b.clear_bit_atomic(2048);
-            assert_eq!(None, b.next_bit(2048));
-            assert_eq!(None, b.next_zero_bit(2048));
-            assert_eq!(None, b.last_bit());
-        }
+        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+        b.set_bit(2048);
+        b.set_bit_atomic(2048);
+        b.clear_bit(2048);
+        b.clear_bit_atomic(2048);
+        assert_eq!(None, b.next_bit(2048));
+        assert_eq!(None, b.next_zero_bit(2048));
+        assert_eq!(None, b.last_bit());
         Ok(())
     }

-    // TODO: uncomment once kunit supports [should_panic] and `cfg`.
-    // #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
-    // #[test]
-    // #[should_panic]
-    // fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
-    //     let mut b = BitmapVec::new(128, GFP_KERNEL)?;
-    //
-    //     b.set_bit(2048);
-    // }
+    #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
+    #[test]
+    #[should_panic]
+    fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
+        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+
+        b.set_bit(2048);
+        Ok(())
+    }

     #[test]
     fn bitmap_copy_and_extend() -> Result<(), AllocError> {
--
2.47.3

