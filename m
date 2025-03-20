Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2C31DE889
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436489; cv=none; b=aA+xkbSVT2ZpA7nTYXppD78XWe/CNYZeM1NH6NqQFDCRjsyj55MgE6etBxtWeXUdMFxI15ORsK1EOS5EAAq24uQx6tE/84/5ZuVI9Dk1sU59l/K0V7BEN+0pKx/pXVJ61+IlssbLkFUmzHxXLjKXcW6ZCuQemdlhqUI1gQ72I/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436489; c=relaxed/simple;
	bh=CoA/2hVi92eZQd/UwZ3tw5ujIhmIXQsdItxz6SHTHIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BhhW3V5to18cjjSiWVf0Z5pChvxe9sSmNAL5+l8MRhArWZa1YGSq5j+LSsHoSeMWwfT/XJro2X03prcP21MvpROLjy7wjv5EKPS4VYjLorZVczOfbKBZk7gKIctX11lzTnj56lp6xZ31qqIhq6tbbJ18Vla2lAsp5p40CLmynt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=RTzP18VU; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="RTzP18VU"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6efe4e3d698so2577817b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436487; x=1743041287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzqtkZzwBBAw59T4If4/NvkVtKC0U46N8wwS9fJHshI=;
        b=RTzP18VUtbt86tIqdbhoHg/Oeuts3mBIXRRfejMCTYZatLbPZ6ERLYK/l2L0tP6lKG
         TLJB9B5YWiD9/7fBfwu9GFdDxRu5N48mpVLPml7V1UF43nicRSdmX6+n8YQCGI8wL91W
         xz/u8ybpQXyejXlCay4XcbrKl+UCnwXG0fsDm3H/R6B9jpcoHf7vZIo+aNpeEWGEkxeT
         R1ZEQoDbO00jD7wljPgBoDU7laTIuN70msW3baetHbKKcjQ6bCD9aQ6hTWcPiG/Hi6iB
         wkY3Do2PQLAuS19utU1DkCB/n7g+y5Eh2KwcikUbdMu39kbOUFeG9qQnBTkmO8L7LrAa
         NfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436487; x=1743041287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzqtkZzwBBAw59T4If4/NvkVtKC0U46N8wwS9fJHshI=;
        b=s6CoFW5XaXGMHAn5LuMVizATYStkihweOqFaReMI6H9kwusBHIeFuHL4zMcJb+E1HI
         fYoLltKkQ3MQwaUHcypGDXDLnVl38E9Q5c1pPM1sJCamiiBe8tiRRnIyOTBEJuDmDtRJ
         9LJNHNIMbB59ScZVUrSZ8Hm4x5/AH4GmY22bkls5ytb/s6u5ib3X0nHxoNjGZrozt3qZ
         vcMEk11RN0wyl095S6R9syEhAF0SRBa+YLv+LVcDOplVTATYcqZNFJ9E4izluN4SIa5W
         o3ihDqQ0zhwEfZM8laE5OaTdJzhXeghwNjX1+EwyDv2l+MBc9gdYMYRSFsZx7W4KoNaM
         a6sA==
X-Forwarded-Encrypted: i=1; AJvYcCXuH0lmb/OcXYaXroW5U/jfxF9m9gwG42pYJS5LYKa4URDPmJo/3MuD70AqJY6nHBkUi6aCGxBfdKsIGi62lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVRktvCgXfuSB9xu6/+Yoga6eRam0jO7gfw5yqC/oWUQ1rPhvA
	TgyJJquE2oGVx0zMXvpTXN4KAfpM0N6Q+9MGL+IAf39fwxBlo807hL5c7kUQ4ka6hd2aZNe3Wrw
	juGA=
X-Gm-Gg: ASbGncuKIx5I87v624VJCYQsePrGb/dg+cXfSIa06KyscUmlnGv2ug/diClqIDDRrWr
	R/0RC2oBkZsgtHmnD+a3YiOY4ziIjkv0JGNQcl6mwf/HDJoHyZJSSqYxXqzJorMlp4Ey3keb05i
	p/nicFyOETsNl2HH3/1K664NdS8lA65dtFz9r6ibkmZNnQpyZbhVknjcVZnFcN2HABbonokMKdv
	mnT83556uOFi/zqJESJ152WtHuz7LxIt7dQ1z2jsaPYjnuX/MZppH8xoBM4UeJ8ObMeOT8nBfD3
	XSYjsTjgiM7x3CY2C8txKZtTAE2NuUDcfDAx+RxSf1fo5itAYDCrL9ILrL+P1xeSUSUsmTGHl9t
	qJuv1TJpjTbWu1n4e4IlRVTSjJvdj2Q+5ODglz/im
X-Google-Smtp-Source: AGHT+IGrrHo42oeZzwXEXnfIxB02LQfOA0p257k8khsUUdzI6mnH/HgxPiYAXsLkWVyYj4hsQ/s+iQ==
X-Received: by 2002:a05:690c:6306:b0:6f9:56d1:a8be with SMTP id 00721157ae682-700ac6e43afmr20778107b3.32.1742436486768;
        Wed, 19 Mar 2025 19:08:06 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:08:06 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/17] rust: list: refactor to use `&raw [const|mut]`
Date: Wed, 19 Mar 2025 22:07:22 -0400
Message-ID: <20250320020740.1631171-4-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` and `addr_of_mut!(place)`
with `&raw const place` and `&raw mut place` respectively.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are similar
to `&`, `&mut` making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/list.rs                    | 2 +-
 rust/kernel/list/impl_list_item_mod.rs | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index c0ed227b8a4f..e98f0820f002 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -176,7 +176,7 @@ pub fn new() -> impl PinInit<Self> {
     #[inline]
     unsafe fn fields(me: *mut Self) -> *mut ListLinksFields {
         // SAFETY: The caller promises that the pointer is valid.
-        unsafe { Opaque::raw_get(ptr::addr_of!((*me).inner)) }
+        unsafe { Opaque::raw_get(&raw const (*me).inner) }
     }
 
     /// # Safety
diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
index a0438537cee1..014b6713d59d 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -49,7 +49,7 @@ macro_rules! impl_has_list_links {
         // SAFETY: The implementation of `raw_get_list_links` only compiles if the field has the
         // right type.
         //
-        // The behavior of `raw_get_list_links` is not changed since the `addr_of_mut!` macro is
+        // The behavior of `raw_get_list_links` is not changed since the `&raw mut` op is
         // equivalent to the pointer offset operation in the trait definition.
         unsafe impl$(<$($implarg),*>)? $crate::list::HasListLinks$(<$id>)? for
             $self $(<$($selfarg),*>)?
@@ -61,7 +61,7 @@ unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$
                 // SAFETY: The caller promises that the pointer is not dangling. We know that this
                 // expression doesn't follow any pointers, as the `offset_of!` invocation above
                 // would otherwise not compile.
-                unsafe { ::core::ptr::addr_of_mut!((*ptr)$(.$field)*) }
+                unsafe { &raw mut (*ptr)$(.$field)* }
             }
         }
     )*};
@@ -103,7 +103,7 @@ macro_rules! impl_has_list_links_self_ptr {
             unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$id>)? {
                 // SAFETY: The caller promises that the pointer is not dangling.
                 let ptr: *mut $crate::list::ListLinksSelfPtr<$item_type $(, $id)?> =
-                    unsafe { ::core::ptr::addr_of_mut!((*ptr).$field) };
+                    unsafe { &raw mut (*ptr).$field };
                 ptr.cast()
             }
         }
