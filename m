Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936A814A092
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Oct 2024 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728719638; cv=none; b=Jymjkm3khtX9rOqsonb2+bEw1Ow59vROwH2PoWbphMV8I7JiNtQ6p3GFJQfVXHqLqnrgktz4tbv93y1kktAFxXA45gwBFpUaAi2vDr9AtxpJIVXEE/bg3sv04Jr9YEseBWiAapGpO1cnt2XdmZpD/FUBr6DWA9UTHMIzR5IaO5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728719638; c=relaxed/simple;
	bh=exceou/GbvvSFGCxsG+jhxFUhP1NcWujL4XJO+4/t3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rgWzPWcG53UrlgNlLvzojYqx68u555XH8QYqGTDszHgvoh/3MKBHN2T8s0Oc/s0RkNN4wENsP30HoX9tIZEis3+ZmBKIaLtnplA/+OQXTcHAB/OLpFSL/BOUGjuv8HnMgJ0pC+gZLMsS9HyFWjc0mX/p6SDvOx5Ue1HsRDfIMUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de; spf=pass smtp.mailfrom=wiredspace.de; dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b=rNjAmQox; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b="rNjAmQox"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
	s=key1; t=1728719633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7wjqBeLaVBsnsLFIllGY9aQzpbeWYl7pY8D8C/txUe8=;
	b=rNjAmQoxoUaIo3vlhOEy1O4wW7zCdiWrpSim5V6qNt9VnDGsco3H/Fm3SHXRZkNxRUDi73
	NB0XIQljCVQLdHh6gZbiaYynx194TcZE5osh41IEyCrQqn7YC6qRTpZpy7Tj4R1Srm9hxz
	TRTFNRpTfbVJnBH2t5TRKBLYO2K8hqU=
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
Subject: [PATCH 6/7] drm/panic: allow verbose boolean for clarity
Date: Sat, 12 Oct 2024 09:52:49 +0200
Message-ID: <20241012075312.16342-6-witcher@wiredspace.de>
In-Reply-To: <20241012075312.16342-1-witcher@wiredspace.de>
References: <20241012075312.16342-1-witcher@wiredspace.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Clippy complains about a non-minimal boolean expression with
`nonminimal_bool`:

    error: this boolean expression can be simplified
       --> drivers/gpu/drm/drm_panic_qr.rs:722:9
        |
    722 |         (x < 8 && y < 8) || (x < 8 && y >= end) || (x >= end && y < 8)
        |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        |
        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#nonminimal_bool
        = note: `-D clippy::nonminimal-bool` implied by `-D warnings`
        = help: to override `-D warnings` add `#[allow(clippy::nonminimal_bool)]`
    help: try
        |
    722 |         !(x >= 8 || y >= 8 && y < end) || (x >= end && y < 8)
        |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    722 |         (y >= end || y < 8) && x < 8 || (x >= end && y < 8)
        |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

While this can be useful in a lot of cases, it isn't here because the
line expresses clearly what the intention is. Simplifying the expression
means losing clarity, so opt-out of this lint for the offending line.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1123
Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
---
 drivers/gpu/drm/drm_panic_qr.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 58c46f366f76..226107c02679 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -719,7 +719,8 @@ fn draw_finders(&mut self) {
 
     fn is_finder(&self, x: u8, y: u8) -> bool {
         let end = self.width - 8;
-        (x < 8 && y < 8) || (x < 8 && y >= end) || (x >= end && y < 8)
+        #[allow(clippy::nonminimal_bool)]
+        return (x < 8 && y < 8) || (x < 8 && y >= end) || (x >= end && y < 8);
     }
 
     // Alignment pattern: 5x5 squares in a grid.
-- 
2.46.2

