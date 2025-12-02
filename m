Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5971F2FF179
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704316; cv=none; b=Xtkghce54FBxX+cq97c799QbkBabc9jRlwW3AtjorGxzTOFaVmIFyulCDeUW11CUU5xwll5bPTu/r0aI+1DOctX6UdUtKu1gotju5witJKOA16WNU+jNe/NJlb9d8++0QDo+ltPN9Rj562VRijTwPkOnDqJCeD0iwJp2atRpHSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704316; c=relaxed/simple;
	bh=vz3m6NeQJSylE3JPgdd/bOcQBQbw7n++c1XLda4b+eo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YGkA7v4RJH8IRr0xXm1qgWPJWSsah1uvwf19b5E+uGbc6os8Oy7E0hE36BafEQvwTd6xf86tURmS2nstjBjG8IJGvrcAv9YSfFtrADYd8AyxXfg1y/ew4ei1rmydVTUFpk5WZce9OmDDyOOMnIKy00mS+q4j3q4ldKsDE4dGaxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E550LFZ0; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E550LFZ0"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so44821055e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704313; x=1765309113; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uDJMo/qM8HRwEHpmxsk4Rgtv64e6UZdFKCiGpyEsToo=;
        b=E550LFZ0OXyNh2oBHJ0d4CCDZr/rPQUnf9Z++uEGsUhgJCHqVkTqF6C8bmYBPumS97
         XBOa8qPTCfs7UKA8O1/JE4ogm1gWvCNQsL/XP/muvVU+QZU5/rrL8ZLxc05uWZtbVZ27
         VFdR7eun3+XP2gtiNrAHbaisKQIzaQR8awc3oAG+Nrtvpvsvu73lb1em2JhdFkaWY2Cv
         HpPiXQqQRq5TXSqkn5tVW8QLdFNgP2lqRdmcqxiNevA8noXCltNZCG4pf3gSWAwyGbTX
         TIm+BKPEY5Frh93JFFVw1l8XNCmuuGCxX5INMk1tX952guDkUm0ihJkoAyOVR2AGsUCl
         zkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704313; x=1765309113;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uDJMo/qM8HRwEHpmxsk4Rgtv64e6UZdFKCiGpyEsToo=;
        b=fRz3UohZNNCxOVGjz1rakb5KJgEzQiDWw2S8EgMclRDlPihS1JmMHpasschGaJbe03
         izfZ6VLj++zPDNFII0T1PFOi09dMIJ5iFgIwKzDHeERWbiljC8DEbLByf144D8nK2r4l
         m4KbIL3/vOlcel6D8Za7FUzMsTS1tNc29kENev9VBtIsMYKZrKnafmzQghW3JIo7zEQa
         3i2j6tRC3473xa32CBytXszTq5OstbjnVt0hCkf2AA6rwcT5TJDoj8T6mGUpeARDV49n
         MxEZ7hPGXw3fBmzmnGAUA3XdVAQkKPHnQsLT3mdDyL6DA1bxgc8C/A/ToKbJhrLNwAEq
         lE3A==
X-Gm-Message-State: AOJu0YwIB/RIU7juDubrenqSkSNm7AFDaSQ87GdTj3XFqD1ILmT80H7Y
	yuSsKhsa+KshTya6KAAw5VQjfG5cUzTt0IZexdFeMb7YSHLOVKd145pOHZC7M+TwR3wvp/IWGeS
	GExLt/hBt76tWyNtbmRrZ8JQ9R86pFayoeBk0Fcs1zmzqHjYoeIvObRLFKLPvNGZoHgNb+UsNQp
	jmJTjiEtbjkv6wloJLJYHWgbNnYA4hf3kThfst4D82PVWFDe7sHWXXrcBHjryYCjM=
X-Google-Smtp-Source: AGHT+IF6LM6DSlysd4zfZecqsnadOM/G4MzuDRF9ci8XsVaTeBUF0QR+eDXsaXFyIxIx35MTb7E1It+Z7sQ+SbY=
X-Received: from wmap10.prod.google.com ([2002:a7b:cc8a:0:b0:476:9bb8:201b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19ca:b0:477:7b30:a6fe with SMTP id 5b1f17b1804b1-4792a49a3b0mr7414465e9.18.1764704312887;
 Tue, 02 Dec 2025 11:38:32 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:59 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2773; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vz3m6NeQJSylE3JPgdd/bOcQBQbw7n++c1XLda4b+eo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AKpEgrJfRXZ2KZbXXmC0qjjLWTCyrvkrWW7
 IIFHA2uF5CJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACgAKCRAEWL7uWMY5
 Rhw/D/9eksE0hJjtujIv5OowdPyVroM70B6z0QaqjUuNGXKWxvjF/IxZudcEtt/QV6OsZKx+7KF
 ZpX01DLJxzbZWAAercEtG99hybZEV3zqu9c9jejCjviy/or7TlaPleLBuzDOGQAsAP67tukFcJS
 PXieIKTYK2Xl/J5ztocj6oMZ6FVmKuYybMHA4Xz4+lLgVvtNFVTRgDbQoGfdMMKTwen1Ntd8fuO
 rVWN5iISEk7sbIjtUhz86xNP6iJo6jXuAPyWKNzR/HM24Us2DpPxRZWDnjxJKh2s9jxZyG+7yki
 4NE/2p7zSRA9N8dYZbS34S70P8G8uAN6ovwmw6iAQVQ2CXB+vMuA0U/EbZRHJK3oCynELhAn0lv
 +cfdPIiwCYHXWITlE5QzVg0u8iR2nZ9Cc/BTO/l6Zvem8L1APeucCrpBjqX8d457juoV/q/byIV
 Aa2lMwxXK78iKqjaMQIP+vhdzs2LIlzVLWQPo0m3rPQjKkHc3NO4PjRkZwsw3F/8I8s5zHpmkmc
 IDnz2i6SiNBwpLMWHIMhKDJ91sC40eG/PyzLGx7KwIh8Rg0IKtCOfCyLm2VsvXhqaq2JR4zecWd
 4g2fDKCV6C9egal0e2g+FV5stn15hitxQJM8/xtSNT95GtHnavorzdZ++398oX3e5xC7Juqo6vZ 93uOjD7ycMj0xEQ==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-35-a2e13cbc17a6@google.com>
Subject: [PATCH 35/46] rust: regulator: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
---
 rust/helpers/regulator.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/rust/helpers/regulator.c b/rust/helpers/regulator.c
index 11bc332443bd064f4b5afd350ffc045badff9076..9ec5237f449b9a67ee378d15a761304281f1c483 100644
--- a/rust/helpers/regulator.c
+++ b/rust/helpers/regulator.c
@@ -4,48 +4,52 @@
 
 #ifndef CONFIG_REGULATOR
 
-void rust_helper_regulator_put(struct regulator *regulator)
+__rust_helper void rust_helper_regulator_put(struct regulator *regulator)
 {
 	regulator_put(regulator);
 }
 
-int rust_helper_regulator_set_voltage(struct regulator *regulator, int min_uV,
-				      int max_uV)
+__rust_helper int rust_helper_regulator_set_voltage(struct regulator *regulator,
+						    int min_uV, int max_uV)
 {
 	return regulator_set_voltage(regulator, min_uV, max_uV);
 }
 
-int rust_helper_regulator_get_voltage(struct regulator *regulator)
+__rust_helper int rust_helper_regulator_get_voltage(struct regulator *regulator)
 {
 	return regulator_get_voltage(regulator);
 }
 
-struct regulator *rust_helper_regulator_get(struct device *dev, const char *id)
+__rust_helper struct regulator *rust_helper_regulator_get(struct device *dev,
+							  const char *id)
 {
 	return regulator_get(dev, id);
 }
 
-int rust_helper_regulator_enable(struct regulator *regulator)
+__rust_helper int rust_helper_regulator_enable(struct regulator *regulator)
 {
 	return regulator_enable(regulator);
 }
 
-int rust_helper_regulator_disable(struct regulator *regulator)
+__rust_helper int rust_helper_regulator_disable(struct regulator *regulator)
 {
 	return regulator_disable(regulator);
 }
 
-int rust_helper_regulator_is_enabled(struct regulator *regulator)
+__rust_helper int rust_helper_regulator_is_enabled(struct regulator *regulator)
 {
 	return regulator_is_enabled(regulator);
 }
 
-int rust_helper_devm_regulator_get_enable(struct device *dev, const char *id)
+__rust_helper int rust_helper_devm_regulator_get_enable(struct device *dev,
+							const char *id)
 {
 	return devm_regulator_get_enable(dev, id);
 }
 
-int rust_helper_devm_regulator_get_enable_optional(struct device *dev, const char *id)
+__rust_helper int
+rust_helper_devm_regulator_get_enable_optional(struct device *dev,
+					       const char *id)
 {
 	return devm_regulator_get_enable_optional(dev, id);
 }

-- 
2.52.0.158.g65b55ccf14-goog

