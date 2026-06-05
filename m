Received: from mx5.ucr.edu (mx5.ucr.edu [138.23.62.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD4733EB06
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 04:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.23.62.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780632771; cv=none; b=lmuQuJcBJ1C+Kiui2PLf9coG+ARzz687Z+G7TbePE1ZTjt5xBYeud9jE4CjyQ1NeAV6fSxBZ4Y3O4/P3w+e5qzTysPmnW4tOq7GAIdOmSnB1CrnuFq7js8MsR0lKlVhFUdXgUBy5mUab35WhsKOLd1DcDPlVNH8WoJp+YP34YOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780632771; c=relaxed/simple;
	bh=tF4VCUWMwA8I4mOEUXGPkwnpitmDIcvOstPj9/un8WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P5mmqe1zyKGrTjQJBnEHiUYtZosipDh1nTTpRBBG+OQ16qHeOaSqkujn5qE591mphR9wGDuNIQkDj8KPt4fBw0f0fOneGoYqcG3Cy58LFDzkdfRZe9j1So41Q0e93Hhwz/mR/HSuVv/NmZ5z6xraogTG5doteJa7mBfJaOk/SRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ucr.edu; spf=pass smtp.mailfrom=ucr.edu; dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=VTQSSNDR; dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=EomgBQkz; arc=none smtp.client-ip=138.23.62.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ucr.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucr.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="VTQSSNDR";
	dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="EomgBQkz"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1780632769; x=1812168769;
  h=dkim-signature:x-google-dkim-signature:
   x-forwarded-encrypted:x-gm-message-state:x-gm-gg:from:to:
   cc:subject:date:message-id:x-mailer:mime-version:
   content-transfer-encoding:x-cse-connectionguid:
   x-cse-msgguid;
  bh=tF4VCUWMwA8I4mOEUXGPkwnpitmDIcvOstPj9/un8WQ=;
  b=VTQSSNDRMOKP/BaG6BWy70Amwa3r1pWOz2satuEvuXVnvsFIuCEHYKCv
   8Fko56OSck8KotzEebuMfT9HAKrUn48ijbTboeIJpKhuQqQFcHM0vbIH+
   TFJDLrG+16zrllvhanQCc89NvqbqUPzUh8pDyQ37ZH5KcmnoTakxtiQ2q
   LhM6PxtYQ3zZHh6ynyiFoM3PvOK9jdgVmqmDGo5CyK+37anXbz+HKtbrb
   25yNXxX207nLZllUpAsdL8vsQ4zZGlL6/7Z/ILV4KFKNzmV5oJg4jjtdM
   o86nzGNW1iZU8LsrGOMJmmT7opundFefGv2d1qSmSn/W/VDC8ggO9SY1s
   g==;
X-CSE-ConnectionGUID: i+FkufZuQcGpv8HWrhPStQ==
X-CSE-MsgGUID: Jnx2e9zMR4+BqCqs4IVuCw==
Received: from mail-dy1-f199.google.com ([74.125.82.199])
  by smtpmx5.ucr.edu with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Jun 2026 21:11:41 -0700
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304d0d0b28eso3973175eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 21:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1780632701; x=1781237501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n2xSodZLUd/O6lqqf8zgeCW/DSEP+QUBHBJ8tI2sjPA=;
        b=EomgBQkzelkvvbCa7b6UIhyco+Yog1IP8fhNBWl6wMNyn7I4p3ePUlwfaYRoqgzhgg
         1ykredmk7TeA6UZN98wueKhZOaxw7cKM2v08S5ZR3VfhEYzydThcypuOLNLwj/Hoot7i
         OnogIavNtptH1oQukwTvXLTIVskgeuVX8a54s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780632701; x=1781237501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2xSodZLUd/O6lqqf8zgeCW/DSEP+QUBHBJ8tI2sjPA=;
        b=W3Rdwo4qOsobCbmx0oGduHSzkI2pvRYEjyBPNAQhu3Nlxnpo5zcSoiOOK9c/yJnhc9
         jz4FDsbNlFB7VVXWfmgHpJWYv7y4lMXsVowZ0hvuKS8cHrGTW7tYwaUVsmPeab5dFAZv
         ZeR7266E8LDwqXm1AN+4TtQd83pe03sZDs3N55/pi/sw/iMZ1xzv5ZuKjJyai4CMtiuv
         RYQMSjArWozvPjODcAXWXnlRY1o4c74Df0F9C3QFxCWc9c1PgoW80+Va2SvYsOqmDIVI
         GKTq9t2jOB2eliFsIQNdHtql69j9sdihkKPjg4RZxx6nmkK2T5EF/lQtg7DM9+b/cvBZ
         dUxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VJZd9TNoey+y9PJUirDOVSt7VSZOu/u5YL8Jf+5ExZs6trwOK0XTOkMuNvbSOppzA5vHLBkDpQnyHIt8CCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydQRxQ6mPkgJMAHW/fTDP++v5W54frRPpaWaLHpJt0sqS6eTOA
	PwAVew+M4hpppOZYD0YGAcvvW2qGC4w5dLD70ZeQrwOeezu1mkLUFkANC8dTy9v5Nmqnvoqvnh9
	B4o5njckYEK8AgsQF7tBTCgQ+wzpdtJz5M06rQqhM/mek1W6xx9k/lOqt8DIZwPT1XeNFyh3zuD
	S1l4HL6mE=
X-Gm-Gg: Acq92OH/2rDJNjzYFkCZaKBumBXMqrigGj5VVvuARvN2Y6X0zE55DD/65N+B+4B4y+J
	yXYgNj53pt1e0Bm1RB11G7KS1JmayVq4Z1BrH5R+ZIKZ/wJGWn/fxlz6p8ZJPjsJnouwjeho7Kn
	xds1AAWpMehfrSMEkTznREpN1wOFsTMcyKZ+0DjkCjND7PvXqwMeBpPKZH24jlz7VyEs1HW2MUT
	o5lNCkecPYzzJSUMtA4Q/GAKhiNzYv2698r3iV7vMDAwYxcJ78ZnVFk/TxxnUzERk18O0R2OxEc
	g7EBNOPki3s2E1fliBfURWgYbMbiLIcH44wYahl0Lh2m7SsRRnUmzvyfuW3/wtmbg0DthurzZzU
	A2pSAefbt2FPwhv3/iimYIO8U23Fx2fQB8qeIEvl66rR1qpgZn06tCB1MeE7lKrbUybYDPBUa0R
	QSkeEtGI9Ch8TjWZAFR73saDNmC2NoVnff2Xdo8HLjM5b56rDe2BNZ5ks6zptvfxLGP/mY1al85
	i9st147FC63
X-Received: by 2002:a05:693c:69c4:b0:304:cefc:5fdd with SMTP id 5a478bee46e88-3077b7595demr498040eec.20.1780632701220;
        Thu, 04 Jun 2026 21:11:41 -0700 (PDT)
X-Received: by 2002:a05:693c:69c4:b0:304:cefc:5fdd with SMTP id 5a478bee46e88-3077b7595demr498034eec.20.1780632700764;
        Thu, 04 Jun 2026 21:11:40 -0700 (PDT)
Received: from ucr-secure-48-10-13-243-195.wnet.ucr.edu.net (ftd-border-nat-ucr-secure-v348.ucr.edu. [169.235.95.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8e8csm6723500eec.16.2026.06.04.21.11.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 04 Jun 2026 21:11:40 -0700 (PDT)
From: Yuan Tan <ytan089@ucr.edu>
To: ojeda@kernel.org,
	boqun@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: zhiyunq@cs.ucr.edu,
	ardalan@uci.edu,
	pgovind2@uci.edu,
	dzueck@uci.edu,
	Yuan Tan <ytan089@ucr.edu>,
	stable@vger.kernel.org
Subject: [PATCH] rust: firmware: return empty slice for zero-size firmware
Date: Thu,  4 Jun 2026 21:11:34 -0700
Message-ID: <20260605041134.38290-1-ytan089@ucr.edu>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware::data() builds a Rust slice with core::slice::from_raw_parts().
Unlike many C APIs, from_raw_parts() requires its pointer argument to be
non-NULL even when the length is zero.

The firmware loader can represent an empty firmware image with size == 0
and data == NULL. Passing that pointer to from_raw_parts() would be
undefined behavior.

Return an empty slice before constructing the raw slice. For non-zero
firmware sizes, the existing firmware API guarantee that data has size
bytes also means that the pointer is non-NULL.

Fixes: de6582833db0 ("rust: add firmware abstractions")
Cc: stable@vger.kernel.org
Reported-by: Priya Bala Govindasamy <pgovind2@uci.edu>
Reported-by: Dylan Zueck <dzueck@uci.edu>
Signed-off-by: Yuan Tan <ytan089@ucr.edu>
---
 rust/kernel/firmware.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 71168d8004e2..5e22a574a91e 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -106,10 +106,17 @@ pub fn size(&self) -> usize {
 
     /// Returns the requested firmware as `&[u8]`.
     pub fn data(&self) -> &[u8] {
+        let size = self.size();
+
+        if size == 0 {
+            return &[];
+        }
+
         // SAFETY: `self.as_raw()` is valid by the type invariant. Additionally,
         // `bindings::firmware` guarantees, if successfully requested, that
         // `bindings::firmware::data` has a size of `bindings::firmware::size` bytes.
-        unsafe { core::slice::from_raw_parts((*self.as_raw()).data, self.size()) }
+        // For non-zero `size`, this also means `bindings::firmware::data` is not NULL.
+        unsafe { core::slice::from_raw_parts((*self.as_raw()).data, size) }
     }
 }
 
-- 
2.43.2

