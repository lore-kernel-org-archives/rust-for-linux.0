Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9302313B293
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763889990; cv=none; b=ZbtWZr/JV9VjfiYVzMSaVxtFBhXrR2FS4y/I5qhTuRFMzo2kdCWdPH3ZvhOsszBU4QN8mPX8aFfUtvnSW/rh1goQvmDvmlaA7+xpo//+wrOQAF3SiF+wXCdLELnR0iZjOcNhXiOPc53TmL7+FQopoKJr6IpwldKEB+XdLQ0EF/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763889990; c=relaxed/simple;
	bh=jKBvFpuQLngjk0nEFK1PjUNzyF0X15TDwoo+drtNhv0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FVlrBnzUxgY2XjDel3VikKA5oKwOfMVPWowbJOwko8Co68Ti6JXQpNuFPqfnjPwUXvAu0M7yU+NagXdHyJvc7zxB81mJA1dpDdHor3+HIKDXWeZMYJzGD8YNfTtQmEq+LaOQtrp0H5xZOdymVp3t3NYry7WIEdiVboln+bUgy4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g08ung1u; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g08ung1u"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297d4a56f97so49719425ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 01:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763889988; x=1764494788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xs0t3Szo5vFHo7IPg5XaI/zhW3TrAdFJK24NyqJJsf8=;
        b=g08ung1uBsv/G0ED/cmalHaD4lENygaTCaXM5fwTBcoMyLZpY5PvGozrxH1KZknDYd
         pTmRSALl66e6tSKeLseZMUnMfjJSUOQtIEtAIuzcqo9btW4pWkXPqwg+CY+LELsRzqNt
         UnGjvcNDEjKlRI3Wk+N/vK2z3R8tfrub7pQbyr0CygxrLzbauMpuv3pPgJPE4Jpb5WQT
         E0sJpPCT/2H/x9JWKbO9XNgRcG+aLksur5M+9vpu4XSqTR7uxqGX6kJ4xBxnBh85PkdF
         RRsj65bjrENsAVa7pKKOaGt/fwVtIIxnq13MmkNZ75MdSOmC/k7mWKqJ8wouhfcc4Qbr
         X88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763889988; x=1764494788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xs0t3Szo5vFHo7IPg5XaI/zhW3TrAdFJK24NyqJJsf8=;
        b=Mdsy3WAQt3qvOkUJEz5dAaXheDqQScEA2EGx/TVy934y+zSmnDCd7hLmY/23R1OzP+
         ysQL8J8DpH49iNFjyFp5eSB2NWcMHffgxVIl6B/cM6POChOJRpyg6kfhi4AZwz4TL7ie
         C9pZZA84sXsMg6vVeRT2qnLzrEOBZXMcNowgaf5LbNB2OzxYMSUD1wJsaPOqbYshQ+Gc
         GwxF+m2WR1oX09xGPEPmIO9iRKEOD8fPJJzMcP/YUFCqynoZQaxlCJabSL4vlmIU6QBF
         s61426ZUWRfcYj1cpnKy965Vm/Fmaxq5X5rqrOv4fw57WmVZ7nGzF+JIkthniOPfQAjm
         FzRw==
X-Forwarded-Encrypted: i=1; AJvYcCVVcVz0qS6Rx4YUiI61g/4HVFi/wKCpi1y2WmqGq24tMKjGkdpkv/ObKsLaRyfqiLKtlTbvYzN3qxXzwdglaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YynYs7k7Tq1e4k4inahM23Jcr26sSF4DP0gh+Ewje37NIuo1IMd
	IdryGMCu8kDXiX8opqLoNLQIzJIGvC8USfCJmapGX5SdikAAIonuckXn
X-Gm-Gg: ASbGnctymhPOzAB7AvCWVZccAJHqNf4wAyTjmmb5rwA3mdSR8/NeJizbWVYYQ03QO69
	IIcoJyzokaMl/Zw4gaHxQ9J9FA9lv0dswNi5SeykOGSTFML0WXCAwHCMiTh5g+lkySmQPajMstS
	Wv+PdwFEIamE6ELuahjI3kDxJj5mFdiRAar9Yz+reXW6ZsgVJnnE9yrAQ0fTBeB6FEXOkJzcQe0
	CL8MXWVzZKCVizhjYIdrGiIIJdpXOmQ2UjZHFHuO8Ij5fpCmfmNclmsBJj5st7lDN5vjkzmyplF
	uXoRfCw5LBssCqI3FXMv9h+Uxn59F0I9mtFvdvas3v3Kk8wr9/7ko1f8znoXfftFz1/cr6aVez1
	Ui6TDLjWH70EuOQXhR6qCzBBCqDFKjWuc3FLNW3IJYYoFJIvTxYuS9J6Adg5oLPLOH5H9UYE1c+
	B0i9DR/8oqsnV3WmmeOq9NKHtUXg==
X-Google-Smtp-Source: AGHT+IHrOOJNJDa2GgrTIgoioCLDvBuXEfSk2IH1c+DBdbSr+pLO2PBSd1zxccfzPHswbjyfTYl0aA==
X-Received: by 2002:a17:902:ccca:b0:297:f2e7:96f3 with SMTP id d9443c01a7336-29b6c6b693cmr97059755ad.50.1763889987877;
        Sun, 23 Nov 2025 01:26:27 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 01:26:26 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH 04/10] rust: drm: Update AlwaysRefCounted imports to use sync::aref
Date: Sun, 23 Nov 2025 14:54:32 +0530
Message-Id: <20251123092438.182251-5-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251123092438.182251-1-shankari.ak0208@gmail.com>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update call sites to import `AlwaysRefCounted`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/drm/gem/mod.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index a7f682e95c01..76e6c40d525e 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -253,7 +253,7 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
 }
 
 // SAFETY: Instances of `Object<T>` are always reference-counted.
-unsafe impl<T: DriverObject> crate::types::AlwaysRefCounted for Object<T> {
+unsafe impl<T: DriverObject> crate::sync::aref::AlwaysRefCounted for Object<T> {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::drm_gem_object_get(self.as_raw()) };
-- 
2.34.1

