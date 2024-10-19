Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9C31DF73F
	for <rust-for-linux@vger.kernel.org>; Sat, 19 Oct 2024 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327285; cv=none; b=R2iruaNLfRD0uSkLF8c/d12foh6d7CsGD7YeBq1wu/S9K3Aar1kdwQvOW0L2M1FlVxB2/HKA54jVhE5TIQoQ5ArlugDR68Dtuuvp3ZlmJeZ5SKA4/qOLviGS5sMT3oo70I5MxU5hxbE7R54QZ37Lpf09JmUgy/1nvj5Yp7ZEmNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327285; c=relaxed/simple;
	bh=jFvbfoF4vUgK+eUQ3fW6irvU22g1V0ojLeWPPl9urpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lOWx4SCL2g9tlMKwnYsqVn2avynzibxr6JPT3HYJNpYShiNM9rVrVhEaSnbBmypsD1GnE46v11ZYzB6y/NyI+w/nkQC25T9L3mzNSxalfAwKH5/LK1uKyo1e9KCIOvAgOBIvTZY5VaYnigWBiX21r/g7BmhYbs6Z5Q5yXLos0g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de; spf=pass smtp.mailfrom=wiredspace.de; dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b=m0y1ce7n; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b="m0y1ce7n"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
	s=key1; t=1729327281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GZJoXg9fLkkYOrnCoSAzjaA03NEPR/GiNSjvi3pIFiM=;
	b=m0y1ce7npY1kLNzuEMuldTSJ2g1cJbw7j8g1T/IWzM40vyfb2lt05ZEj7D4up5xZ7Ucmgo
	Be/F6InlFhpOxY4IwAlrfrSjGUt3SLvt9b/LLYkyxzpqUFYKflJgmBx4mFWpvuGHF5Ib1r
	O65tDXZs70ajyQjSzSi/WSRh15Azk8U=
From: =?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Jocelyn Falempe <jfalempe@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>
Subject: [PATCH v2 2/7] drm/panic: remove unnecessary borrow in alignment_pattern
Date: Sat, 19 Oct 2024 10:22:47 +0200
Message-ID: <20241019084048.22336-3-witcher@wiredspace.de>
In-Reply-To: <20241019084048.22336-1-witcher@wiredspace.de>
References: <20241019084048.22336-1-witcher@wiredspace.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The function `alignment_pattern` returns a static reference to a `u8`
slice. The borrow of the returned element in `ALIGNMENT_PATTERNS` is
already a reference as defined in the array definition above so this
borrow is unnecessary and removed by the compiler. Clippy notes this in
`needless_borrow`:

    error: this expression creates a reference which is immediately dereferenced by the compiler
       --> drivers/gpu/drm/drm_panic_qr.rs:245:9
        |
    245 |         &ALIGNMENT_PATTERNS[self.0 - 1]
        |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: change this to: `ALIGNMENT_PATTERNS[self.0 - 1]`
        |
        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#needless_borrow
        = note: `-D clippy::needless-borrow` implied by `-D warnings`
        = help: to override `-D warnings` add `#[allow(clippy::needless_borrow)]`

Remove the unnecessary borrow.

Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1123
Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 76decf49e678..7adfaa3d6222 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -239,7 +239,7 @@ fn g1_blk_size(&self) -> usize {
     }
 
     fn alignment_pattern(&self) -> &'static [u8] {
-        &ALIGNMENT_PATTERNS[self.0 - 1]
+        ALIGNMENT_PATTERNS[self.0 - 1]
     }
 
     fn poly(&self) -> &'static [u8] {
-- 
2.46.2

