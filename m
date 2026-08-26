Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B46C463B6D
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761759; cv=none; b=nIKeavZnDx+pRj5ALM9aeOLfzoOhfgHym4W+nGqqNQHykNEw2aRSn//faYsBX3XISkHQBYYEiT6LdKEPCO0ieUxkiyW7TBbib0IceGpo9kWr+LnX6sOgTRwjN3fSY0PWxMlwoCRsN/iYd3EyNW8i//NQfy2tJkO1DgMUuqWNGfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761759; c=relaxed/simple;
	bh=Xh594ZS85gUXvggyHKfotI2henUq6YClR0aeXlFsEDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBh+jgXqlDMiJooA576GhyMsKUlhoVBiJUC7CDUIuUuzUOYEe75CgGtF2QIL11gV58ysVNJEkuVz/CnAzD3c/y/GnxIPON7qIr0JY6ca46YybXUx3VqGl46JsztFn4aBb5vJqpJmb2oXTQckwC8qzjyEelldDsIeMxtl5ZbuVoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=Nmm7pGFb; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="Nmm7pGFb"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47de0093c42so919303f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761756; x=1788366556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIlnj5dzuge9Y09JvuO0oI2LC/wGGksogWut7g+rsrQ=;
        b=Nmm7pGFbxqHx4HuzQsJOW2LBwuvkWAZEPvzIbjE0JeqgoIBy2R/BDHZL+AUVRXqxUX
         eAu7VRC78ebU7tLamNUsPyJxaIkrkuZat4eO02y5qpRNU+FimYNgz1FU+DUge/Twa2YB
         c9tCniD2oaa7wmRCQ/RIiHMrMJaWXfPpNFMW4sTpc9/t3cp/nDxnfBntjJy+vmdKvS6k
         d2WP76Uu1RS/c0qpfg4QrRlXxRz8fLyjeS/Uv5d9o1mmDC/zyqmcTb8TUUhGFzS2HMMX
         hjLIpQltmv486jXgT947Pg8Oa2nbsIIAQBnFAQ8gTu4jrYl7dC9gwD8nHZRsbLfrVmkM
         mubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761756; x=1788366556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIlnj5dzuge9Y09JvuO0oI2LC/wGGksogWut7g+rsrQ=;
        b=AchyXo8Bg7OdVM7MEu5hR22b4aod+NvfQInmVnPqc6wU1cFgQblHpLssldysBE9pwP
         L34YQsYLjrd330CargeqEo0rNeTtkKX9jy3e1onXurJyfj2RWw3GtfR/FonNw/sFJytv
         b5uCL0kUcCoK12pj4Nfujmql9zuIMAlJwwXikeQrGqb42YnFjjlL8BWY+MyELV9FrCuF
         wWYLALTm3g1oJ99ufmD7ae1DQAeV/WRhdXEqqRFn38c3oZo6L1PC/S82/1ATfxpSkknX
         wVuJROZ8w9BwGCLdtORj2H19xF75lD4cM+gWD3sIcGtF3y3Jlce3fTH2rBD3pP42Qd7v
         U+FQ==
X-Gm-Message-State: AFuF++lU8AkYqw0ThaGYzXJguqilmcX1pJQ6r64l8PLR/tHuYAyFui6P
	i6gTlLS8HiNFkWP6X33MZFXsCRUcRdbWmbTnfJnt+dE/SU+BtS5iaYEAnrXScjDTgYjvGtS07TW
	piRx3NxAS
X-Gm-Gg: AR+sD13x98n7NHbdb0zmD6iJfdv61/+knDBhZQmv1+zjUJ7ZRCIga7Iwo3W4ES/Lf8j
	U7gZPqhyQwSucilugI7F/oZEJ/kPLOabvpX980UkgN1IsTY8bqqR2MdtZbSOQNK5JFAyFlOXb4p
	CKYwdKRjRq78UpjuYZDi//+jrsaTOyIc6lZ0ISH56WWJQLz0h5I8+L0hiV3+3wmqeyKBUjnIbKn
	rKixZOrc1EqAMhIhCnbfKHDyjZlhD6Oj3SPrkvrbJIkNTXD3QTCGmCTihtATOAQtoclMtoz/ZS/
	37Wwf30T0vnmDb/ttOHmpzcQsXlCmZ+ToORQ5g1EWsxVMyIZh9huVQ4a+M6PY6L1/dEL2RtXTuF
	SDLSM7bropRmI50Ij9HhLEcl1d1dKOyvvrJmMo/HqVG9G9FhWpt7GXkimMUjC9nsmu5OtRemtef
	MznebXORtPmjHqj6/nFESvfafBzRz7dj8onK7/Qsg1u5iAU2NjmtjrkJ9QUtT+DIwkqPGpza9Kf
	35e5ugNWNr5Ici1fDjeuJKMkWkVzF3WdIePxMcHLau5MZc=
X-Received: by 2002:a05:6000:29ce:b0:482:de48:c445 with SMTP id ffacd0b85a97d-482e26d9aaemr7644532f8f.11.1787761756534;
        Wed, 26 Aug 2026 09:29:16 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:15 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] rust: io: add checked offset copy helpers
Date: Wed, 26 Aug 2026 17:28:40 +0100
Message-ID: <20260826162851.2497-7-mike@fireburn.co.uk>
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

I/O mappings often need to copy a bounded byte range rather than
the complete mapping. Add checked helpers that project the requested
range before using the backend copy operation. This keeps raw backend
pointers out of consumers and reports invalid ranges instead.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/io.rs | 50 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 95f46bb75f9e..aea346b8b79e 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -225,6 +225,30 @@ fn io_view<'a, IO: Io<'a>, U>(
     Ok(unsafe { IO::Backend::project_view(view, projected_ptr) })
 }
 
+/// Returns a byte-slice view for a given range, performing runtime bounds checks.
+#[inline]
+fn io_byte_slice<'a, IO>(
+    this: IO,
+    offset: usize,
+    len: usize,
+) -> Result<<IO::Backend as IoBackend>::View<'a, [u8]>>
+where
+    IO: Io<'a, Target = [u8]>,
+{
+    let view = this.as_view();
+    let ptr = IO::Backend::as_ptr(view);
+    let end = offset.checked_add(len).ok_or(EINVAL)?;
+
+    if end > ptr.len() {
+        return Err(EINVAL);
+    }
+
+    let projected_ptr =
+        core::ptr::slice_from_raw_parts_mut(ptr.cast::<u8>().wrapping_add(offset), len);
+    // SAFETY: The bounds check above proves that `projected_ptr` is a sub-slice of `ptr`.
+    Ok(unsafe { IO::Backend::project_view(view, projected_ptr) })
+}
+
 /// I/O backends.
 ///
 /// This is an abstract representation to be implemented by arbitrary I/O
@@ -640,6 +664,32 @@ fn copy_to_slice(self, data: &mut [u8])
         }
     }
 
+    /// Copy bytes from `data` to a range of I/O memory.
+    ///
+    /// Returns [`EINVAL`] if `offset..offset + data.len()` is outside the I/O region.
+    #[inline]
+    fn try_copy_from_slice(self, offset: usize, data: &[u8]) -> Result
+    where
+        Self::Backend: IoCopyable,
+        Self: Io<'a, Target = [u8]>,
+    {
+        io_byte_slice(self, offset, data.len())?.copy_from_slice(data);
+        Ok(())
+    }
+
+    /// Copy a range of I/O memory to `data`.
+    ///
+    /// Returns [`EINVAL`] if `offset..offset + data.len()` is outside the I/O region.
+    #[inline]
+    fn try_copy_to_slice(self, offset: usize, data: &mut [u8]) -> Result
+    where
+        Self::Backend: IoCopyable,
+        Self: Io<'a, Target = [u8]>,
+    {
+        io_byte_slice(self, offset, data.len())?.copy_to_slice(data);
+        Ok(())
+    }
+
     /// Fallible 8-bit read with runtime bounds check.
     #[inline(always)]
     fn try_read8(self, offset: usize) -> Result<u8>
