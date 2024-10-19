Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067991E04B7
	for <rust-for-linux@vger.kernel.org>; Sat, 19 Oct 2024 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327300; cv=none; b=CGISgEUSkoAjUPyWT0LTuduMUu3DepVtvtbRlApuvu+UNLhUToeftqbSZOOarsMwnVR//7g3DdvFXddnmy9YM14cUxGrcxR7LPRnc59BolIRdsJNorSONQVQTXTVMfBYx408x7kApy30zVWUDFgEV2Ol12TIHL2nXPQcprkBvUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327300; c=relaxed/simple;
	bh=vCVEaM2j7TK3dG+7dUCGHxCyhTMKpvmEKALVb+Ca8No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ScSEa7BqFnCcd9ZvIeNWLKc+AsIktG5MdMzthJjnwj8N1TLvg58G+EOqNTvnPkzVfM4BUnsWEQfME4UP9EXeMLHwNpeJgh/Z7umuD5Z8g42/P54TMj8BloBQqrWgWQF6KsFHVOWccBo9Em4HPpy6N/IN3eQXkxtfwm3IkpMUz4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de; spf=pass smtp.mailfrom=wiredspace.de; dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b=Kvfm+hiT; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b="Kvfm+hiT"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
	s=key1; t=1729327296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=agn0+hQD08F841t4QY/P0Zr6g22Zhtf7LMnklweDjms=;
	b=Kvfm+hiTsQ3pcAMuEr450e9s29CFWzIUrS/dJ7oE6i4oN9vKCc2Ybk7zcVpdEovUK8kOgl
	xYnKd5e3dWmO7WRFc2dd60Sqvl7Cq+iqP6Rbnlu85fjBjbJqDb/xNdju1aiQMXZdodfSTj
	JDe1fza3mc81f6Z5Q5aZfWSE8I/CRIE=
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
Subject: [PATCH v2 7/7] drm/panic: allow verbose version check
Date: Sat, 19 Oct 2024 10:22:52 +0200
Message-ID: <20241019084048.22336-8-witcher@wiredspace.de>
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

Clippy warns about a reimplementation of `RangeInclusive::contains`:

    error: manual `!RangeInclusive::contains` implementation
       --> drivers/gpu/drm/drm_panic_qr.rs:986:8
        |
    986 |     if version < 1 || version > 40 {
        |        ^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: use: `!(1..=40).contains(&version)`
        |
        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_range_contains
        = note: `-D clippy::manual-range-contains` implied by `-D warnings`
        = help: to override `-D warnings` add `#[allow(clippy::manual_range_contains)]`

Ignore this and keep the current implementation as that makes it easier
to read.

Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1123
Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 2d4e367f0fcd..09500cddc009 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -983,6 +983,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
 /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
 #[no_mangle]
 pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
+    #[expect(clippy::manual_range_contains)]
     if version < 1 || version > 40 {
         return 0;
     }
-- 
2.46.2

