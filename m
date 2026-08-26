Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57CF41F379
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761751; cv=none; b=iff7DHeBDYJdcu0ofhKmt9kUPHNK5xCpOAC3Ano8ATsbZRy2iBMGSI865PxmqRIbxxQQtiQ4Q2YxrhVXRf6OF28eRUy6nXLM7x8dQ9oyRCPKtydVGjjQjQzmb2cu+3bBmY4z40EDdSE4rS6SITMpGzdSk3oy3tMegh57FE5KKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761751; c=relaxed/simple;
	bh=gAXcjVW7NrAqYcpxRGJoD+JQMGHOCFdxAf/E7+s5skE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eHKlNzpavKYC+SaI5I3UqVak9Yq7xm8TTT8jzyJgHYgNCNqZljV8jgnxyGSk1J4I1LhsucY+L5LPdMlPjXq9z4lhMl0jdKRX0Ee05h+so7G0zyNR8ksL9MGBZgEYJ9x3tI/7psEcka1FSRtTTZwSzyLtXMrsDn1hyb6kEPgRVbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ozyt+/cG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ozyt+/cG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so906905f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761748; x=1788366548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MveUnfVN08Qze7xHpn7EUTFT1HRfb1h/riwWy8sicu0=;
        b=ozyt+/cG81l5KdUVt8f10fdAMSrBSpQ3c0rXZ05fHMLGabU8tSQTFE6VKj5QlC+DEk
         hg4B3a8412qKOP5VHLHhF30cvXJmzQD7Ac6oKDWlqI0fb1FJsZLvMB6TfLdlLPJ7a5LI
         vsvhCkFthln56zCYl4xVn222+2n/7V1MA7gFql0/FYpwqZNOcdKxqjg9q1G8apHTsJxm
         HKHdiN48kTa2YTdwkotgjUHfmokhzj22wnoBEx2+JWlQiFeNayj9duNHXI1H7EXTYryL
         U9NyesOYSFgYu6A3lLSHEnF9Y1+P7CoJvBzWKOJLIDM+tzx+WtffQOe8KkDN1XL5fH/O
         TB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761748; x=1788366548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MveUnfVN08Qze7xHpn7EUTFT1HRfb1h/riwWy8sicu0=;
        b=ox2sDPOtpwxgdHDT1CKamYHyTP3C0i6xdZX0aXUgr1vIb/zWjA0MzhMbQXGnWZXm9Q
         s/PI6WSZu+SNY8MlQyvrpGLCv+CJv4hcAdCSGruHB9aBCRwKCKilaKdYZ81+AALvwJiN
         24urQY7ihZQ1/keAjt90zTvHq0bOtPF0jKsSesRxRLAzOly4LBjLpP6edpevNyyNrgqe
         0Tc1lEYfKWGw55i6jyLtiZmfUWI4dYFZuvXf2BogTX08C+38/p1djnQ1ag+Oplr544YJ
         KyyDJnYidr3Y/MaozfIe6bcJn+lkuPMZ+ge0BniFnIpj2EnJ61p/oTOehzzoOTGQWNAZ
         aDgg==
X-Gm-Message-State: AFuF++madNT0xYWsdazo+fcoBSACIEtnUDGjtLgk3EQOSPMpAwZcsBzm
	l64XBm9NoiJT6GtQ11V6fa5/Y03ZJJTTnySzu2FPN+pUTxyNH53G0bAbxR7QZ2RnH77hT7rAT37
	dYgY1nyu8
X-Gm-Gg: AR+sD11sQpE8hAtU3ngbBh31sENylJKFV1MWY9uXUo2w28ezYH7aLXH2vQNY51gTBDH
	c+lNrafTPz3VFprlQmkqotic7cduesHnaYuPAy1wBGbMk6e3WD9Wa3J55tHluStqA3hEtOlTGZX
	oA/U3Y/redOQB0/08VuZy1rYNPep35lT/ktqvQV/6LJ30ilEjoLm72/p4/dIYAKIGtqLwKDJQuU
	+PPlpumh3myeE+r3rrnYuL2Ljn5SvVM99TVetPk2Efdq/1H4g8pZHqeqEPm5SV1akxuAAbx4Jc5
	3egimQoM0gzCNOX/FuBeDXqTlyGLbMaEvSjBMedRRgG9FnnSmPjkzRe0CkVOb0HwKGksS4YqZNi
	fstYaqR2eLHC2m2lK5GVjptYxtKetT8flgMbfiZ5aGyBXK8kYihDVlmIJH3WBiONS0p/dDQSfoO
	PIM6LD9wGlbj5BH2hRJ5teVrm8I17rVS54To09/6KRWE6hPEBR1NPu1L4PXXAljVM00oDYtz6TB
	5x9ePySERrkicxIb/PFxDgGLiWdrE06gvRY
X-Received: by 2002:a05:6000:4541:b0:47f:e770:13e0 with SMTP id ffacd0b85a97d-482e26a6a63mr6662154f8f.7.1787761747741;
        Wed, 26 Aug 2026 09:29:07 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:06 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] rust: random: add a safe get_random_bytes wrapper
Date: Wed, 26 Aug 2026 17:28:37 +0100
Message-ID: <20260826162851.2497-4-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose a slice-based wrapper around get_random_bytes() so Rust callers
can fill key, nonce, and other random buffers without touching raw
pointers.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/lib.rs    |  1 +
 rust/kernel/random.rs | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 rust/kernel/random.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 08e5730753eb..f39648246271 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -116,6 +116,7 @@
 pub mod ptr;
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
+pub mod random;
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
diff --git a/rust/kernel/random.rs b/rust/kernel/random.rs
new file mode 100644
index 000000000000..5f2288969dbf
--- /dev/null
+++ b/rust/kernel/random.rs
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Random number generation.
+//!
+//! C header: [`include/linux/random.h`](srctree/include/linux/random.h)
+
+use crate::bindings;
+
+/// Fills `buf` with cryptographically secure random bytes from the kernel's CSPRNG.
+///
+/// This is the in-kernel equivalent of reading from `/dev/urandom`, and is suitable for generating
+/// keys, nonces and other secrets. It never blocks: once the CSPRNG has been seeded during boot it
+/// stays seeded, and callers running that early should use
+/// [`wait_for_random_bytes()`] instead of assuming otherwise.
+///
+/// [`wait_for_random_bytes()`]: srctree/include/linux/random.h
+///
+/// # Examples
+///
+/// ```
+/// use kernel::random;
+///
+/// let mut key = [0u8; 16];
+/// random::fill_bytes(&mut key);
+///
+/// // A zero-length request is valid and does nothing.
+/// random::fill_bytes(&mut []);
+/// ```
+#[inline]
+pub fn fill_bytes(buf: &mut [u8]) {
+    // SAFETY: `buf` is a valid slice, so its pointer is valid for writes of `buf.len()` bytes, and
+    // `get_random_bytes()` writes exactly that many.
+    unsafe { bindings::get_random_bytes(buf.as_mut_ptr().cast(), buf.len()) };
+}
