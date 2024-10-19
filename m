Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A78A1DED6D
	for <rust-for-linux@vger.kernel.org>; Sat, 19 Oct 2024 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327297; cv=none; b=Yd/9XPX87VSAjnc4Kdl/Ce1vd1BqvVfSYaD8gwOawouoO5MmTplmU0s6hIdtPR3LAjHO7qadetcLek+LjyfbAgi/eLPZxfVW7CL4JQ32UmJ7GwNMd930p6NKV03nsPaqoidErMhva1HJ35/6ZcyaC3BZ43yOeOSjscHH2ahnKUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327297; c=relaxed/simple;
	bh=eRkewpVRWn3VOWbswg3ulxg5hPlL0OIkfPL+78ofKZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uNpazFkMl5BPpqJVDSJwWiYufRpeUc8XLv1P2nWgoeHCwfEb2CBjlZYNRiCV8r808Zlbx8tRotWL06cE5BtMh3Aoau7j/yRQU6+9rwfeTo8uF+ry3qIOsU/XqkuEfqFtkM49SWDhfqQdalGOsSX6shfLWGfhUb4VB3SAeNMXYFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de; spf=pass smtp.mailfrom=wiredspace.de; dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b=ieXOYAvM; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b="ieXOYAvM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
	s=key1; t=1729327292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+9nI9DyyvUkPvZXIQqw1VWeyaPfPWQnX8HfjjMPK6kA=;
	b=ieXOYAvMze+hHfzOiaKM/Qf6sExVXqPkebY4wyG2IM1wVLuyo/HL/AwZ4ohyHD7jv8vbt9
	nhCLRaBGyTvC86IH4vbarsD0KOyH+xpXTfMD43FOul7OK0dYwZhAB+aE/IAyAykzVqI6PU
	QlbC2pA4+muS7HpPmjl4wfnkIhOtEOY=
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
Subject: [PATCH v2 6/7] drm/panic: allow verbose boolean for clarity
Date: Sat, 19 Oct 2024 10:22:51 +0200
Message-ID: <20241019084048.22336-7-witcher@wiredspace.de>
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

Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1123
Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
v1 -> v2: turn the introduced explicit "return" statement into a block

 drivers/gpu/drm/drm_panic_qr.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 58c46f366f76..2d4e367f0fcd 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -719,7 +719,10 @@ fn draw_finders(&mut self) {
 
     fn is_finder(&self, x: u8, y: u8) -> bool {
         let end = self.width - 8;
-        (x < 8 && y < 8) || (x < 8 && y >= end) || (x >= end && y < 8)
+        #[expect(clippy::nonminimal_bool)]
+        {
+            (x < 8 && y < 8) || (x < 8 && y >= end) || (x >= end && y < 8)
+        }
     }
 
     // Alignment pattern: 5x5 squares in a grid.
-- 
2.46.2

