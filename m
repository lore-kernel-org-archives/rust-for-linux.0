Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6CD4314A1;
	Tue,  7 Jul 2026 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440122; cv=none; b=CC5ws+iAiVGlobYnmO23HLNPYC/MNfwZHhNRY3Sh2dMnLhHd2Bjw8X308WD2zwczOmKLtzaz+jY1onxoOcUOr1RWlOd+4Kcl/3MSUFciqh1XJ8+JskzxTw7ydtRmhTj3uIqYL7MZ2fm1npgfyl2rzU9/AWutlsQwKofJ7eWiYV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440122; c=relaxed/simple;
	bh=o4xLj4Z6phhUhJARdRo/QgMf3bGySIDmA1u53Mu40BA=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=cRXgt2L4ekYwiUfPwmXUehy0Ss1gqruxxAJG9bJmtjeDRxRtITamZxlvpCLa3MYQNH5bCY2MlBDHpsbosCqY68TnYlyPbKkcYcP3GHmLhl9bTmfbcRmfN2ysl8MphEMPtbzvxeIjuKojFMsTq0i0Q+lpfpxow7f/2n12p9PpuH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=brR6XW97; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="brR6XW97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783440109; bh=jP3ybE/w1pJghS2VZLIvn81MDI/DOorE3/uePqSHIxc=;
	h=From:To:Cc:Subject:Date;
	b=brR6XW97+MWvNQzItmA5tIdLyJeMbz7+ZNrYJ42/oRBJHEFrwH1VlL7kDOaEnIVEC
	 +pJT87PixOZjNHKlLpOioBrN+LhT1vBtTwZzBxrCrAhuzKtjg5Pz5w/zfCwiNijRgU
	 k3LD94xSK8Vtil8k4myMhzfdHqSA8YR5QCJdOGgg=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 503F041; Wed, 08 Jul 2026 00:01:16 +0800
X-QQ-mid: xmsmtpt1783440076th8lpk5ia
Message-ID: <tencent_928148924004787BD355EAB1EA3348E30106@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GJbueKLuW+v/bxpUTI2lx75lkhLZNmmmEiH59RvS3XmzLy/hSKC
	 goMWAyJ91SJsaUcdbOu4wDSdnnShQQNlbDEA1fRB+zniN7sWlClKAaDWkaEmRAVclU3J0lN4+jh3
	 5s9sJQsJS9AUMedxx5ENUfyXdvLkrx6+EZH4ep4VT+VPYgzszwxKXljQz9B9+KPPGiPfSfRgLAmF
	 wvUSjiGMkuplFkfYz22S5m3XLxWKMCLEufZc7OpbcDDwjT/qdwPSXaARApOo+n7A3CAeZXsV1z3z
	 s0h7sQhlV8RAq04c9g8RqvTo4PuqKs2ooeDanFx1skSZyKcEqbDuIgzwL/93+kG6XCoR+bhSQxcj
	 WsAm+n0O/uRKq5ywML+llFD71Fr1F3ulRMDOnr4RUWEgryKYaGLXWm7hR4A6bUNMwQTI/SUsycpt
	 rSN0o4YRim0rCAVG0GtSmctS0kHdgUd5kvbeVNNcZU2o4OgNlroMeyQCDVHw3oYLw4LOhe3PO/Vy
	 AFDD9KNvZ7+HYKr81qZgsBpG4ckhUwfDcauEYgY/9eJ9UKnG+ux8Jk1fW95NMo7StX1asXCTHiT3
	 xs/nGEmZ9LZY5TF+gwSXa7YEoMcn8enCv+K39aTqUgglUCjkBXaQSX1mCVRuHUmT4I74FH9fxlvu
	 NXVT6aXGWznWBIej20GdjEmq7pX2Y8KZfIAwWzymrXYb8QW+d5mPWhqLXHZsFy0F5vs2YjjV1mBL
	 5w9zd/wc5RkpsDCTG3BYGKlCWu/TS9tN9kw7sOK9z+H1rB/7axK+mRPpydEEHd49iicmwiIycsxs
	 SHJtv6TjOt25tdea7GNF0fSwgelkaw4FPzPke1EQe5IrAt33z7dVGP+Zg5bEMbqv6FXRJ8t2ofzw
	 AR/IRCX9YbXSoZ8aZl0bMS5PekCLE62NYcKPiu9dAjpRL0XPkIJ82FBS8hZ2smDzhVihzhbz1CBR
	 IUxXHVnaNojkS1XoQXeA/JIce9kvFb9dyoveOwOibPIYch44nlHVZahKskKiRzjQg0dY333FOAyg
	 Yjf47C+cmamkF29B1RZBSxcZ6Ca5VnVLhpir+HGTDxPppaP7/U7G4I9FjgJaPEDrEiZP+MQ5lCPo
	 IJTAL2
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Yilin Chen <1479826151@qq.com>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH] rust: configfs: fix release safety documentation
Date: Tue,  7 Jul 2026 16:00:25 +0000
X-OQ-MSGID: <20260707160025.2797373-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old Safety docs of ItemOperationsVTable<Group<Data>, Data>::release() 
described this as a config_group pointer embedded in Group<Parent>. 

But the inner code implies the implementation first gets the containing 
config_group pointer through the cg_item field. It then gets Group<Data> 
pointer from that group pointer.

The new Safety docs fix this by describing the actual pointer chain and
concrete Group<Data> type, not Group<Parent>.

Assisted-by: Codex:GPT-5
Signed-off-by: Yilin Chen <1479826151@qq.com>
---
 rust/kernel/configfs.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 2339c6467..2ac75c628 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -437,8 +437,10 @@ impl<Data> ItemOperationsVTable<Group<Data>, Data>
 {
     /// # Safety
     ///
-    /// `this` must be a pointer to a `bindings::config_group` embedded in a
-    /// `Group<Parent>`.
+    /// `this` must be a valid pointer to the `bindings::config_item` embedded in
+    /// the `cg_item` field of a `bindings::config_group`.
+    ///
+    /// That `bindings::config_group` must be embedded in a `Group<Data>`.
     ///
     /// This function will destroy the pointee of `this`. The pointee of `this`
     /// must not be accessed after the function returns.
-- 
2.25.1

