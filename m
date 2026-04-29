Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E5B3F23C5
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468975; cv=none; b=Qc3xluNKH6NjL2Iw15YE12deaGHXJpY9ZAnX5p1/G/O4hl7IN0KdjzyPxgCO9SKTTmas4XB8oKD7zYjl4xxP/XYEQo4dmD8A+g5vP3WrlV8nVvTlsentxrz9zJGPyZLZ5xopegqfq6bq03gs0xw4qCWw3lES/c+RAfP6gWCfSSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468975; c=relaxed/simple;
	bh=01DQgwaJ3ce2HaFqHqFVOsD/TYkkeJShpzCaK3dyx4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GubsbOexza2d+ou5Lgl0h80jdnntNG8gf0rO/AUBeyI3WjQGXUK1trEl8ga6TAugF1dR63iJLNVq+QRUPvJy/fEHmsGjnAotFBTjL9Dn0TkLLNXFouAJZSPv4pxv89y1ElgfqBAhDL8zr4zC8KIm74l3I/F9qur9+UuMIGDWNns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvMG5VKB; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvMG5VKB"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c76d797b180so8534035a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 06:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777468974; x=1778073774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZTB0k5HzoHvpW2eiYdnzwypWK5KqzxoJlBxqEnFu+U=;
        b=EvMG5VKByiGkhnQNWvlq+k0VssqHnbUaCTMi9hYZGr5HsGBTfAbPCehd6dav8zCxrT
         pEBNgmNaUjIMMJwpKrk+ON+TNvPiZNmzIgWnv67s3t0yQDwFeJHwxyKqcPzl8J5IF/5+
         CxAn3MHz3z38B8lSfbrrFwCOAGgRxi4AfcHvQz3y0VaOz8iAmMxexzltu/abDGMC5Bkb
         /gY5ZsB4GWg2EQN0HsqNGvJ9IE2htbmU3mySv2CaSNbo33rhwGC8Va9lzMGHvgWfmv8i
         1DuQkKsqmFFby4XI61DW8XFwUj8Kz2+SMcLm0MZ6d9PeZU1x/kUCZXYIgnEEp18tQBR9
         8ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468974; x=1778073774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DZTB0k5HzoHvpW2eiYdnzwypWK5KqzxoJlBxqEnFu+U=;
        b=JEw1mUlsuTx1SN7vNTUPBKHjmkiJi24u3hIk2fcMhB3nyjUi1WxfQuDoen0v+iAd8s
         S5gUxyOgaTXzfpe644rv3yLxi42VF7eC2DYCpuE/FZrLbkFcXbLYTJNoRPRWEa9a1UoV
         CmtXqwDAdzSB4G8Bn4btJ/pmLrxL2fBZfxpa6WA4GlVVeBaRrBLIuYrOqL7qRpjLjNzj
         yb21P+4QgOwBujuvx4MekzTZw2mfeohiT/+wPlOFEmEHbIqVASrvrFHMSCe851zQ8iBY
         QwSm87b11TbAN7cJQc2evAM5fo4J4IbdryasGhzrE+hRzCkXTrD1cuv7ihhtJA/+3c9M
         pg+A==
X-Forwarded-Encrypted: i=1; AFNElJ9XJH8d4vgUzZSv045FIO2dalBS7UHyihk91p6IOXm1pcy3NE7LxM5xZhIqff+pOj+145qMiHysJnwAyVr3bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKF8pM8lnzJxiBLHkQvpZJrW986u2khBuRRowWqRxaRx7ZefJl
	E6iovDAg7mvPni/S49BkwYruzsQU6quJhhb9utsSxrw0JnG31bxb1pcO
X-Gm-Gg: AeBDievbMGJn0UgEsNL8mkd2Ix3xqPr/NV0QQv/pS0xTXWCGQUodgfw/EG7EocXLiah
	DHK+XA/SHFAS79ZiMKmpBfAC+mTgpUxjyj7fzI6CzxKn8QXL5+NjTPl8i2EehfShLWyEuJwFGv9
	WAM8j1KWWQ+7CbfWtk5vYWo6FnHAE5Yg2xKOLNa5+j0lhSEAcf/mJ8wz84pQMez7wmAgiiVFOfe
	PqA82WL7vgvG3Q85fv7C68al3tH1SWDCtIaoZBqvs5zf1NX8VVrSCG5tCMzw47NNQsgYPUblqQ8
	tvW3HkkMkTu7x4Kqah74Ldu/nJRXpOJS9O2Xyd5oF8B600R1si0ZkZDJz3MBi7jJr3jyutpw+9k
	UczgtGgsM6ifa34i1KWZK6e5Te0ANdY9VnhUM9tMw8Drswi0A5TxNqEtMUOCmDJvPceQvuxH+mV
	msvgjw+szowUrOO42yPXIAVT83/UHc3eUxlvTxkPHzOeaCiYPqdNd7OFqwSdrG9knnhxdfwzPbE
	r94eXG3oKvOF2Lpg/9EpNkRyA==
X-Received: by 2002:a05:6a21:9981:b0:3a3:472b:2e6a with SMTP id adf61e73a8af0-3a39c058afcmr8013894637.18.1777468973973;
        Wed, 29 Apr 2026 06:22:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:448a:2002:4381:3859:fd0d:505e:362c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cd407sm2091372b3a.13.2026.04.29.06.22.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Apr 2026 06:22:53 -0700 (PDT)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: branstj@gmail.com,
	lars@metafoo.de,
	ojeda@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	igor.korotin.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Subject: [RFC PATCH v2 1/4] i2c: rust: add smbus_read_byte_data and smbus_read_word_data
Date: Wed, 29 Apr 2026 20:22:27 +0700
Message-ID: <20260429132234.30514-2-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260429132234.30514-1-muchamadcoirulanwar@gmail.com>
References: <20260429132234.30514-1-muchamadcoirulanwar@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
 rust/kernel/i2c.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 7b908f0c5a58..6eaea1158fda 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -477,6 +477,30 @@ impl<Ctx: device::DeviceContext> I2cClient<Ctx> {
     fn as_raw(&self) -> *mut bindings::i2c_client {
         self.0.get()
     }
+
+    /// Reads a single byte from a register via SMBus.
+    pub fn smbus_read_byte_data(&self, reg: u8) -> Result<u8> {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct i2c_client`
+        // by the type invariant of `I2cClient`.
+        let ret = unsafe { bindings::i2c_smbus_read_byte_data(self.as_raw(), reg) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u8)
+        }
+    }
+
+    /// Reads a 16-bit word from a register via SMBus.
+    pub fn smbus_read_word_data(&self, reg: u8) -> Result<u16> {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct i2c_client`
+        // by the type invariant of `I2cClient`.
+        let ret = unsafe { bindings::i2c_smbus_read_word_data(self.as_raw(), reg) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u16)
+        }
+    }
 }
 
 // SAFETY: `I2cClient` is a transparent wrapper of `struct i2c_client`.
-- 
2.50.0

