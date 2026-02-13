Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2CB8287E
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 05:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770960693; cv=none; b=i9y0cxLTqks1rK650bL+pHjJamC0NITYD6bHvs3PHZRCuV9F2uCwtZeQG71tkUqWGc6zH80et3LUthN2taDQJGIpWTkP51J1tZkrCE+E++q82ojzH/G7FV8lYKwNqY/dcI4UCP3AvacH7ynJnDr/s8kYt0w9LuK2YWOCq5W61VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770960693; c=relaxed/simple;
	bh=dFdOAT568Cqh/mmFwcn9/PeCeWaXSGhxD7QVB4HmL5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODDlfToR4jgcJhng5bvmacLmjJkZsYFxglXSnd/ajXMUDSdEpg/wJnQ4JVk93oo4WmapsUfVcrKKifwNdB1WbZaKDZODXeAjwLeRltkZp7Wt/cUCLDakErgo8fZ/ivF58L6OCfTVakfPfNauCIFjRZ+vsw5K+cs6EVz1KmsF5CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMAi2Pyg; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMAi2Pyg"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so5160275e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 21:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770960689; x=1771565489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJKGQzb3b9bQwN/lb3i6WMb5fWaM5aaPn20IXUMBUvg=;
        b=OMAi2PygeaUYIUnushB22y8S3l9naz2PeHljNqcdedkt+CCQlbcG4mNU5rebzqk2s5
         0Sc+VbCpzw9OsFYrH67n4RQzleDQYavJe7HOTqd42gj9a4iyyOXiTaQs7ZOZ+8ywO9r1
         5SGDaaD/vMWsR011pMI8utHX4HdzaXwYV6LqT4Y5rKuSdBFOmDDZ6i+NguH5ynnQbEiM
         sUYMKyxc+Rap3N0dohOyBwZD0CK0dvbe0gy91LPR8uPXvOzKmUGGpbNkhSOcFcY5f522
         mJz6kTe28aJEnV1Wog5++NiEBH8MoyErMeUygHJNxtbQmafXwfpdGKJ32ZwugNFbBzg8
         RjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770960689; x=1771565489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nJKGQzb3b9bQwN/lb3i6WMb5fWaM5aaPn20IXUMBUvg=;
        b=kF9j7oYUifYW26hlRqTpszieW1UDjuF8s7ZafdNyDsaAf9XCt8VSvxxPweRbBfrOPE
         RGxA+N9x4Rv9dZMA9MuzGkhXeMpOJZgPw72ZI/PMuvaRCYD6VhYU+CO2Squ2VLFReAyw
         Yj7k7EgBfsw0DmY45fo7dypn5fFX1NlNJt/hZui/tc+BJ811CsAijgwNjHk2w+U+3iyJ
         XnsXFZt2LBivlcNNbSNd07D16il2nAlau4IHdZqCF8+YvhW1eCM1pcEr3WTc13P1ttfy
         fvF26Uq+rq4e/LH++MfCVL0B0ntlFE7yBY+zyvsQO3ns5wFMYtveajInGhWYRFmE1dC0
         pnkg==
X-Gm-Message-State: AOJu0YzmbgSWo7ky4uj97XQzfR0YpY24JZpQkwgl761maSC+cHb4UNGV
	1RECgRUbZ5hzschkxDjXBq6A6OXKcN16liaElO66pk8Ai2WdLOt5vrDullQf1JKEbBzBLA==
X-Gm-Gg: AZuq6aJioap8mv20AWd76VtrFsGnvNv9yfvberruL4KqN0NJ/9+gAJ5hAUGRB+akScF
	lbx8jq8LkJLV2U6SY+VtyNf/ENmimFjZBgvIVErLrJ526+USrVCybzpXdS6yxcMi2/WDI/Hi3Dp
	0B8VlBZ7LiKjhFiokQV2FW+5VHFp1ezrZ7uCVibSESBZu7G4t5PX2oRMTjVrvmho+BylUkxiBCE
	qEB80hxFIPBKRYpxU2qtgNS9B2HDg5P3th40joAUoEXIY4DEGlLfQnAF4+3fE0CaYe1YRTFZRxS
	6f84mZ9EDCuszyt9IDXOPlAuiN0L6/SROTa6gDlJ1yBhQkDKwL1LkE03agoJ0EXJK5emDaglPam
	Lc+fVcyAtRuL3zyy/EiFFU+NlqOj7jkQLQNtNv7Pvm6/yQY5p9+WKacmzvPWb9WTysXluIW20NF
	qM9KWSd6mojO8=
X-Received: by 2002:a05:600c:524d:b0:483:4807:210c with SMTP id 5b1f17b1804b1-48373a5d7a0mr9408295e9.24.1770960688661;
        Thu, 12 Feb 2026 21:31:28 -0800 (PST)
Received: from localhost ([121.91.57.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d835f6bsm215737485e9.14.2026.02.12.21.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 21:31:28 -0800 (PST)
From: Ali Zain <alizainuimx@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	Ali Zain <alizainuimx@gmail.com>
Subject: [PATCH] rust: print: Document SAFETY invariants in rust_fmt_argument and call_printk
Date: Fri, 13 Feb 2026 10:31:23 +0500
Message-ID: <20260213053123.8869-1-alizainuimx@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212125427.122362-1-alizainuimx@gmail.com>
References: <20260212125427.122362-1-alizainuimx@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace remaining "SAFETY: TODO" comments with proper explanations.

Document why the raw pointer cast to `fmt::Arguments` is valid
and clarify the invariants required when calling `_printk`
through FFI.

This does not change behaviour.

v2:
  - Fix rustfmt formatting issue reported by 0-day CI.
  - Remove extra blank line before unsafe block.

Signed-off-by: Ali Zain <alizainuimx@gmail.com>
---
 rust/kernel/list.rs  | 2 ++
 rust/kernel/print.rs | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 0d8a201f2..65d33957e 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -589,6 +589,8 @@ pub unsafe fn remove(&mut self, item: &T) -> Option<ListArc<T, ID>> {
         //   or in this list (with the same `ID`).
         // - We hold `&mut self`, so there is no concurrent mutation of
         //   the link fields.
+        // - `T::view_links(item)` returns the embedded link fields for this
+        //   object, which remain valid for the lifetime of `item`.
 
         let mut item = unsafe { ListLinks::fields(T::view_links(item)) };
         // SAFETY: The user provided a reference, and reference are never dangling.
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 2ae7b4ce9..c3edc0ab3 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -112,7 +112,6 @@ pub unsafe fn call_printk(
     // at compile time, a null-terminated module name, and a pointer to
     // `fmt::Arguments` obtained via `core::ptr::from_ref`. All pointers
     // are valid for the duration of the call and respect the C ABI.
-
     unsafe {
         bindings::_printk(
             format_string.as_ptr(),
-- 
2.53.0

