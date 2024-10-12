Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C9312CDA5
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Oct 2024 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728719615; cv=none; b=DP7yEJUc510+5jsHPPEIsAM8ZlmXqP0WIJT0YLS5N+JdOBKHVhUEy1pQEkNpCVb1SXG5UB4BHse4tC0/y6oC3/19iP/Bq2HT2+pDKeCbjwv7M+DoaCF9vLskKwK59F/vxjuITA1K62XTedJ43Nxmx1v/oNw3Mhed14pJ6M9+a3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728719615; c=relaxed/simple;
	bh=6MIovYYIalkp++B+8dQaXOWZ4NfkK+S+R8HDjG0ZkuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lYA5MMvLHvMSUrDc48tj9KpHs0UMuUoxxJK5mZNa7vBSWiJZdIeFh11ujVW6kzOvqJ7w1R6d3sZTWbv6bc8cCFYG3r1EBtBEkQ2DpzoZU9dJch7c/OBUkXZSdawIfI39IT5w/xpvoKiqf/j9MJKeN+YkF49X8Z2lhklq254hMgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de; spf=pass smtp.mailfrom=wiredspace.de; dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b=oOlLpQth; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b="oOlLpQth"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
	s=key1; t=1728719610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RXi+EKx96tb7Z9JhZww2ZABVQMM+wa+3MGewAR55mJ4=;
	b=oOlLpQth6IUIX/vGnVAm27YDBUunE1DDbXHTn4eZZ52MLYlXlcDsTcWbYo0+a45trygJrM
	e5poVbvIIBnFn2fd1MZvJ6q5DaRZzpRms43UpDKXu+MynbsJdCUSlEbrThoCdU3ZxtoV2s
	lyjnSB2uf4YO0L2mKGEsfctddKyHsW4=
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
Subject: [PATCH 1/7] drm/panic: avoid reimplementing Iterator::find
Date: Sat, 12 Oct 2024 09:52:44 +0200
Message-ID: <20241012075312.16342-1-witcher@wiredspace.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Rust's standard library's `std::iter::Iterator` trait provides a function
`find` that finds the first element that satisfies a predicate.
The function `Version::from_segments` is doing the same thing but is
implementing the same logic itself.
Clippy complains about this in the `manual_find` lint:

    error: manual implementation of `Iterator::find`
       --> drivers/gpu/drm/drm_panic_qr.rs:212:9
        |
    212 | /         for v in (1..=40).map(|k| Version(k)) {
    213 | |             if v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum() {
    214 | |                 return Some(v);
    215 | |             }
    216 | |         }
    217 | |         None
        | |____________^ help: replace with an iterator: `(1..=40).map(|k| Version(k)).find(|&v| v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum())`
        |
        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_find
        = note: `-D clippy::manual-find` implied by `-D warnings`
        = help: to override `-D warnings` add `#[allow(clippy::manual_find)]`

Use `Iterator::find` instead to make the intention clearer.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1123
Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
---
 drivers/gpu/drm/drm_panic_qr.rs | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 1ef56cb07dfb..76decf49e678 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -209,12 +209,9 @@
 impl Version {
     /// Returns the smallest QR version than can hold these segments.
     fn from_segments(segments: &[&Segment<'_>]) -> Option<Version> {
-        for v in (1..=40).map(|k| Version(k)) {
-            if v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum() {
-                return Some(v);
-            }
-        }
-        None
+        (1..=40)
+            .map(Version)
+            .find(|&v| v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum())
     }
 
     fn width(&self) -> u8 {
-- 
2.46.2

