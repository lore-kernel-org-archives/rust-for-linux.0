Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E993E40F3
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 20:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788898429; cv=none; b=cUabByu3Z8LkQVUE4R9YSUyWPkDzcbgcgL2cJadaTH9KYbFiR4JSX1BWjKxC70wINkmN2OWyN1LHR8uvxqdjBUMRUytK0RMQR7gIgfTgtHyvY1Pel1LXHCZAKkqK7CXK5hveU4qvtKvjck8RsXpTvNwVWKquH8u3HSnVPL35WRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788898429; c=relaxed/simple;
	bh=dxF2BaSzBnbJDO8svzFefD5jxms69tdB9jvx6FnSrDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXDVkLRIwbfLkA1tXifo6A4uy70UYMkXuAXT8B7qXWgvjXItMCHo43b+W7FkDJfz0zUGl34lMruTG4OiexhZL1JescIjdks7kRbYC6jr9ZqI3MPN74aE6k3Sfogam1prYWUj41TRXXimf8VG9jUBD25LNz/FlufqvWJCkpj84b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gtld5I3U; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gtld5I3U"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52d7a3defe8so49955131cf.0
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 13:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788898427; x=1789503227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1WVEAgCDTyboEwqwqS6xMrZxXr/rnP7TsZmJjP2k8c=;
        b=Gtld5I3U3zwNlhdPWB5px2usxxEgyBd49PaFnJBCS4L2ICxZPfqn2Jcad8zvfxerSj
         L9ef+QG1i7UDRlRewrAOv3KbiRkrMcUYBDcYSqtrPUqLis3kw0e0AuW7cT/r7S86weKk
         o+VbBsbH5CDVAKHUEXTXWqge6QYrEc1F9jKKZn8FU+lVx39lxCDPGH4RSpTUBgwXL5AM
         iW9kBe9XjIy6QeXiMgOuPgO/IFoMpEqwATzEZA6tSm8ng4vjlWcdYVR/ovz1AwpItMFf
         jtRB5So56zmDMLD4P4Yc9XnlL03SqPlC6FvFDps4M7i9/OlMEY8UBw9jdVGET2JGpoZw
         YX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788898427; x=1789503227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1WVEAgCDTyboEwqwqS6xMrZxXr/rnP7TsZmJjP2k8c=;
        b=lBN/gRQ1LcKtjcYehHFIhAkQ93EP3prnELyBd1yv/e4A9X+ooMEiymJndeStTVAhbd
         vHFImitc2m2PcTR8SVykHzEB3OaJ2NFrvRZ2Y5bcsEKbQIhzEn0IDWDmoLNB3rx5rk9W
         X39Vfw7uRt0wFuyXH2PON6IglZTlJbsM116IXE2qdMHsRNJ4VwGhJoVR9Fl0w6nPU8m6
         eFoUiFDkTg7Xm+xmKLSxFIbbpbOZQq9DOCIgEHreKPNccXleB3e9esweOu93YNKlZTQG
         CHzt/weSTVXzMOMmJxWTP28UGchY0G7zgVcxKbG8BgR4omAU0TE0VNuqcWpla2pOURze
         EU3w==
X-Forwarded-Encrypted: i=1; AKwUvByWmntFgpLNf0LVVORR/FN+pilbkoAUGFGM6fzPJFZhT/62oTfbNcZJkUiQizayYokXmmXusQ88ETocEzkAgw==@vger.kernel.org
X-Gm-Message-State: AFuF++nPJt49xR2ipiKi8Yd+kigyPVydrTwMp92Futw2ULncNaO+vZXL
	ittkSQkdcadVjdMb85kS0+AIemFtE16k06Vt1AOc7AzVMeiMgpCkblzR
X-Gm-Gg: AYBFou3Gp8OBUa/5yEsi6hiiYd3L7Hc/Hdx+GT3QFZp11vdQY/vBR1anFZmWt8pHl5v
	w3/g6zYmY6vuM3YRe72hu2UegkABRl/ZG0hQNIH6vz9s9VS8cOSxqnE2LE38/ueKmFDrxD5m/hn
	RnlluljQTYraJS3rmZPz2X/ihAdw/cBK+5bO+o5IbgBtqxUtTM2biY3ZIBvcpNICwIYiggLTHYT
	tvtJm5+K8w1sy24B4BuZd8E8h3+neJAXqqJxThaG79A1aigR+o245Rl+O0bfhinkhGTE89YvmsZ
	jDlTdgFfKNjM0D+NqHp40k6iGGgmpzGG09fwLnkMXGm0jn6NwPEhIRWFUhWKiLrltqcYTdF78Iz
	JhpRqt2TJ/3nvLFELs5xQc4nJq+sZROMe4PlI1ScBED7ewZl8L3UFnPBFDuUIEC2hA+a5A8YKR3
	jviWZp/VcZtbr15NyGI2TwVJEfJ5f9swRYzcKIoZIaF5kwvfIkqVLEASnPY1o=
X-Received: by 2002:ac8:5945:0:b0:530:42d4:4c9a with SMTP id d75a77b69052e-53054a34924mr346612041cf.44.1788898426597;
        Tue, 08 Sep 2026 13:13:46 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530a300c3adsm7197381cf.10.2026.09.08.13.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:13:46 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH v3] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
Date: Tue,  8 Sep 2026 16:13:02 -0400
Message-ID: <20260908201302.1085862-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`next_bit()` and `next_zero_bit()` use `bitmap_assert!()` to check
that `start` is less than `self.len()`, which panics when
`CONFIG_RUST_BITMAP_HARDENED` is enabled. However, neither function
has a `# Panics` section, and both document that `None` is returned
for exactly the input that triggers the panic.

Update the documentation of `next_bit()` and `next_zero_bit()` to add
the missing `# Panics` sections, add the missing blank doc comment line
before `Returns` in `next_zero_bit()`, and simplify the wording.

Fixes: 11eca92a2cae ("rust: add bitmap API.")
Closes: https://github.com/Rust-for-Linux/linux/issues/1252
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
Changes in v3:
- Use Closes: instead of Link:, and add Fixes:, following feedback from
  Alexandre Courbot and Miguel Ojeda.
- Link to v2: https://lore.kernel.org/rust-for-linux/20260828133543.2259029-1-georgeandrout13@gmail.com/

Changes in v2:
- Simplify doc wording following feedback from Alice Ryhl.
- Remove extra empty line between Link: and Signed-off-by:.
- Link to v1: https://lore.kernel.org/rust-for-linux/20260827150719.109145-1-georgeandrout13@gmail.com/
---
 rust/kernel/bitmap.rs | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80d64..b51c8a96f1a8 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -459,7 +459,13 @@ pub fn last_bit(&self) -> Option<usize> {
 
     /// Finds next set bit, starting from `start`.
     ///
-    /// Returns `None` if `start` is greater or equal to `self.nbits`.
+    /// Returns `None` if no bits are set on or after the given index. The
+    /// index `start` must be in bounds.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` is
+    /// out of bounds.
     #[inline]
     pub fn next_bit(&self, start: usize) -> Option<usize> {
         bitmap_assert!(
@@ -479,7 +485,14 @@ pub fn next_bit(&self, start: usize) -> Option<usize> {
     }
 
     /// Finds next zero bit, starting from `start`.
-    /// Returns `None` if `start` is greater than or equal to `self.len()`.
+    ///
+    /// Returns `None` if no bits are zero on or after the given index. The
+    /// index `start` must be in bounds.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` is
+    /// out of bounds.
     #[inline]
     pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
         bitmap_assert!(

base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
-- 
2.47.3

