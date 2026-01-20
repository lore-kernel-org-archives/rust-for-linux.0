Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED8C271476
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898350; cv=none; b=GRCcEw7s8ecBugOkKUH2/XJPD3U2Kj/9oRncQqMf7wFuyKFiAaS1VMXSMykMEacf8YkPCkdf4EW9dU98Pv4qYp+dF6wTAfGs6T9bRMN37vo00df4KbNsu97FX1DDyYzaBz8IIQU6yGDJ5whDMbOhxGTxgQKkw9lF8owqCdrUrKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898350; c=relaxed/simple;
	bh=CgFr/92tknmoVzaiUfCU1lwVhB0Oqdcw6gDrbYSnZN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PzsgiVHnJiyzioh+dpro5tktslq+oPVP8t26j4o3YBXtJZjGq1QpQ+S1Cke9JfEiilV57MnRAywrv8jVJhHSdMHW1ISU8aoJjHBC5UpaacPCgKK1EKwZMylrRVG48XSFxp91ha6oZp2lNEJdauWs6OevFgAr3C8dLMSWEU1YfLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a1022dda33so31527005ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898348; x=1769503148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEu/93ecANVtGJDx1SyDLKa3BkZWrjtKMiVewctfglo=;
        b=ggIrXGbM5vTh733MTSSzTXP1eT/Ts/YgF1fgL856SBd+vL0xdjiZ/ms2ny8ika+Y50
         n4q4iCxYTVngWzjTg/0nTx+Zjcl9OMPEvgbjgtGmlR6I09NQWm66blQnNi/AuWb/CKaC
         0R+Cv30uLfP5AUNZScBerMiCXWtGNuAACzkMy8meYx9ICxe65Rt1Nmk+UWU8pzznUY9V
         6NNeFy0rB4rhf730eFOgKiU4WhEZsQKbleOtO+8+70BuIi8iqahOrdvDcFSQclp8Uh9P
         EmlC7wcyP8j8hnpXyT0LCwjEmekDgT5VUPD/mgV4+SkfHjocHRUsOvLo6LRoDQqM5eWQ
         iQ8w==
X-Gm-Message-State: AOJu0Yxv69ZGsnl5R2oj0aNJ/GPV0QFNWqjWyhMoRoWQVim92GHQsKux
	xKRLnLDSelaLDJD6UmkIVDVJ7U+HeCWsh5gQRo8VuA7W2HaQKl3kf8jxU/xU8g==
X-Gm-Gg: AZuq6aK7RY134XIHPNgm32Oi78UUsBv9ghrla1n411rjQt2uaEb1ChVCEUL64TagAuV
	G7c1gMB8sWewv8LZnbVespGO4vlOouhMAWrp8FkX9Dk2Jvrx18aEYyiMxM3yXQfeBYk8rW2kOW2
	WVoXQvTKdRBJ39HJQWoHg3AEg6hMwOKLNNaYMrZxm1jhgR223bfGoNRB95oqnjS/9nhi+hw9Ipq
	T5rxSJw3jJFGIi1i4E5fKMufvReA/iv8zdXkw3UQMxSfLx5GaJMS0v33vFLLuQHbeBO1wuo6cx4
	gQa0pbFtIeG4edezPblhcMRJFGUUVijZDZcDibUk13OSZHYxasXNzWRqZp4QU+3MzarYV8TpOF0
	DSreW7ESb3heAS92zMi4637ZD3VnrHnBDVlnQRX0dA3Qjs0b6XpuWHQHxQuBRVb/tK3MUgwFnjt
	ufetuGIIqUqkHdxqRGLv0=
X-Received: by 2002:a17:903:22d1:b0:2a0:c884:7f09 with SMTP id d9443c01a7336-2a76b0516ccmr9815175ad.38.1768898347890;
        Tue, 20 Jan 2026 00:39:07 -0800 (PST)
Received: from localhost.localdomain ([45.142.165.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm115114625ad.23.2026.01.20.00.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:39:07 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v2 7/7] rust: security: use pin_init::zeroed() for lsm_context
Date: Tue, 20 Jan 2026 16:38:23 +0800
Message-ID: <20260120083824.477339-8-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120083824.477339-1-sunke@kylinos.cn>
References: <20260120083824.477339-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
lsm_context initialization.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/security.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/security.rs b/rust/kernel/security.rs
index 9d271695265fb..4dc3eba6ce84d 100644
--- a/rust/kernel/security.rs
+++ b/rust/kernel/security.rs
@@ -62,8 +62,7 @@ impl SecurityCtx {
     /// Get the security context given its id.
     #[inline]
     pub fn from_secid(secid: u32) -> Result<Self> {
-        // SAFETY: `struct lsm_context` can be initialized to all zeros.
-        let mut ctx: bindings::lsm_context = unsafe { core::mem::zeroed() };
+        let mut ctx: bindings::lsm_context = pin_init::zeroed();
 
         // SAFETY: Just a C FFI call. The pointer is valid for writes.
         to_result(unsafe { bindings::security_secid_to_secctx(secid, &mut ctx) })?;
-- 
2.43.0

