Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B471459E4
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Oct 2024 07:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728719634; cv=none; b=RGUWki4uHPS0OxdOHeVUdGXCNf8rBGjigXKZW9D8Kt61sc4afiIyjQOLkSYbzzFmMgJHdHpYbSYdAZkoN53ff8zM9uVsF/4vtqNVKJFWJGiivtq5mQL7F7qvS9XS5jpBIQeuB1oD2QJnz6C7z/+1aJqtypmkuITEe8cI8Xc75VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728719634; c=relaxed/simple;
	bh=5ox9XpfRSj3+gd9SmjjuEDDrswtSfX2sxj/KNbn5M78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gpFeSsVLvvG/36sQj00svVuRX+YNneY1zbe8o2eGjDvH6EcKD9dQStYoRb/zSPdBbmhi4H7oM7yW+ujnXq9niJuQDDMcdv+lMbIjbeyDICfutg9gcdx1HDlh774uZFPCSWrOt/2VoZ4tsuLH+qNTTXg87t+2lzWjB7GvvJljDxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de; spf=pass smtp.mailfrom=wiredspace.de; dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b=yomWEWZF; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b="yomWEWZF"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
	s=key1; t=1728719630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FIh27vX6SOVLv/lSubmy2Di6jSyci9VinKDinM1kSU=;
	b=yomWEWZFCNTn+UfRUbItosZKNh2RokEYc+BGpGV2QJZTAl+Kn2f2r0asKmpWKdt7M0YeMj
	k/fiRPUadE9v+acbzwqmrwJE3TnjgCOcprd+mtL03YXT93W74/ZIVKZTEnzK6l5qwVV5wN
	qZsJWzCi8Lu1JrcAGww4OdeRulXOSbA=
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
Subject: [PATCH 5/7] drm/panic: correctly indent continuation of line in list item
Date: Sat, 12 Oct 2024 09:52:48 +0200
Message-ID: <20241012075312.16342-5-witcher@wiredspace.de>
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

It is common practice in Rust to indent the next line the same amount of
space as the previous one if both belong to the same list item. Clippy
checks for this with the lint `doc_lazy_continuation`.

error: doc list item without indentation
   --> drivers/gpu/drm/drm_panic_qr.rs:979:5
    |
979 | /// conversion to numeric segments.
    |     ^
    |
    = help: if this is supposed to be its own paragraph, add a blank line
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#doc_lazy_continuation
    = note: `-D clippy::doc-lazy-continuation` implied by `-D warnings`
    = help: to override `-D warnings` add `#[allow(clippy::doc_lazy_continuation)]`
help: indent this line
    |
979 | ///   conversion to numeric segments.
    |     ++

Indent the offending line by 2 more spaces to remove this Clippy error.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1123
Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
---
 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 5b2386a515fa..58c46f366f76 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -976,7 +976,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
 /// * `url_len`: Length of the URL.
 ///
 /// * If `url_len` > 0, remove the 2 segments header/length and also count the
-/// conversion to numeric segments.
+///   conversion to numeric segments.
 /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
 #[no_mangle]
 pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
-- 
2.46.2

