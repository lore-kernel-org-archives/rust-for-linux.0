Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284394;
	b=cTOso4R0XoqXR7bh4yVZve+m3vqiyb8OWK4FEtU1FloWkCrYVsZB8ADyg0VrMYJCEpRo
	 tXQqcBmadVjdnGuir9aIuzi/Tp5cw9bk5WxkJ/pm+YpmBOxp9Ffvo19uJq9Uiei7XYPhl
	 bmBLdFbaldWqrndKXZE29FBUwLDGrsemo1Z6A2+903QC2fRfKhMZRyvsAL9ePIn4MawvC
	 60Rj+ViW/nMrwa6az8MW6YbBBwAG1R+eX5krr6hjl4nOltDczKP5tYeQRY7CY8Q5xerKn
	 rctog0daoZpeKHgojQQ+qgyFFlQdMv7ZvUHyYSrWbVMg8kfJ8MTDupxj7T3uFq9kWtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3AxS6ewNN37c8Z1T2Uoj4Jwsnbq6o66JX4RBhLIPEDs=;
	b=qZSyok7WYQVerTgi9KJ2iF1kJozKcWj4QNPVrgVIOq5clrOUJ/PoHdbc5k1HGNti1VKC
	 /HRuNf9BisLiynSJb/CXp+eV9V+z7gwJq0gMjiPBfO7I/CLLI1vpLBYyMntcCCLP4sRp4
	 tQXdeaihXWe0dLImgUrFonU3fuWFr3FQ624DumAbaHKmJ8WnFoV1Lc1Rix2WsM1Sp7X98
	 CwUmlhROGGwsRp6P6XgAbuvFn1umbAPXIQm5jCsjHGHHW1ZRjMTGKqG6b5i12Y7a2Lx2n
	 8N8+/osV0riVA+XIag0rWAsDf4V1OditfdhK6lMkObY9sM45eK2OwtTvURTtdlnqbzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bAdLG6I0;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE7F606E8EE
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 04:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE7F606E8EE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bAdLG6I0
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36dbde64409so3183797eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 20:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284393; x=1794889193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AxS6ewNN37c8Z1T2Uoj4Jwsnbq6o66JX4RBhLIPEDs=;
        b=bAdLG6I0SEmoBfqYyUKe4jfQKmj4cvRp+anU2Oj5X0c+tjnjU59+VA8jKT18ZQe/my
         1NrBxCtLGndpR7JX52vRaLI/OHEVVmEBDmojm8MthHWn6SR3kGWvFZ44fCtuACa0sgDA
         6QsIpWMMPsrPsXtwmzjWeN0K+kXepme8doarva6YuCZtrU7O/N/BXDGI/28Ae798vZYV
         slUmkSL+oM/WLaktRkrd/0TFjbDoJYl+8vuyHhX766Ljbk6SztVXDT96+gpuH6/Iu9Kc
         c/h49WO/AxN8dbZftCq5H5N5bEBhro/po5jMkc72OtKLfwrKmrsGz/n11bnhfJiQSS7M
         XeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284393; x=1794889193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AxS6ewNN37c8Z1T2Uoj4Jwsnbq6o66JX4RBhLIPEDs=;
        b=xWnoq5j1OMU9J06+GK3eUOvvmGR3idfO+DVZ6DSwYobUn/OdExeJc8/DBz8NrqVHZ0
         rLPE1hzzdy1SNSYkcSDyHMclF2Hvvzf4FTZdHbVMGipwVAQVZm0QK+ozcGu90BFmHxjR
         9jlmw+ZYmaRs4bkNkocjfvDkv9ETbsItuAyCf2FVh1UXSttV2zvK4t5kLMWBOouV9T90
         d0HWYptYA+PqKFr9ak6djWLj+cqU6iHnRyHcGLya+rw2r3iyhSP6BY/eLZvi0xfzFF++
         JVzR77uxcqzuxa0Uo8JpWGlLYExGmSmLa5CUTShWdJu3gUyz0nlL5ZB2ez0qD2cP/9To
         d7Bw==
X-Forwarded-Encrypted: i=1; AL+hErHnf37tRK4jqFZajRBnDQWJp/bLV8NNz7uZWoOV7oVGD1ja2CS84Ojx/QBPnQs2nBhE7m18Ek3P1mK7CrlR/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ucR7uSQC3ChS6Lr0+qB9zHUjb514AIiubMfZkUyvylSJu5iSM
	aNSiEdvABKJo+IIytV+svy63mndha/xb63zMd49ZbbaychHfXhi1Hufa
X-Gm-Gg: AYBFou1yWdgSZFD7rwCBrjELiPkgJRpY/BUtf+gVzzMWZC/bwcxT1TBc2Ay6HBKF72W
	Du83U7U7Twl2X7Ph6/cI6rXjhYzc4c0w2clA3HDJeYezEEdxvTG1MRTig8blkb7GOyyBRP62/FD
	VOo7Smt3kFaOCQJO2XTTkvJoTPBOccWGsADQMW2R2gDCo49ak2fRYt0kq8ZhIy23okWH3s1ZvL7
	h+vc63iPo+qpcrqkIG+sjyZ8Pk2SxK81NDcpXHBDMT5+LwAFZJYS40wVHz3doKs+sJ3YcQsLwtL
	gIWe8uwv8OlpzhPi8nB1A/4PUQW9QIAojHpOHa6IhuVqP4VCPu+OUsmJ5LaAbUB6ynTsk7Ej2H1
	3nqwnw90lqphx5nZQYmknIxH39vF5SN6SPewrs5+3ecFfOkheEXl+6ABP75fdazpqwfHkf5hSUX
	JLXPU7fJIH+lXWPpZET0fwaX7UJ13H1YPEhe3aUSPAPIlG5oxbMujWiv+u2vShPvDa/nSJgKcTN
	JwOne6REfh11In5kY6BhGFHXTw8BtytySyMaS5HSQYNgvsj/B6Pam8SJ5900hDJGFor8ttrs+9b
	WFGphdHK6u3jQl+fa9sLm2gwfT0c6t3pSSlHHIxJrNt1S2o=
X-Received: by 2002:a05:701b:2807:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b3b61860eemr1668909c88.47.1794284393237;
        Mon, 09 Nov 2026 20:19:53 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:52 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 08/25] rust: device: Expose Device as_raw() publicly
Date: Tue, 10 Nov 2026 14:18:15 +1000
Message-ID: <20261110041832.1730924-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

We are going to call the as_raw() function later as part of the SPDM
library, so expose it publicly.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/device.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 2291d85b6849e..be89e9023b09f 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -262,7 +262,8 @@ pub unsafe fn drvdata_borrow<T>(&self) -> Pin<&T> {
 
 impl<Ctx: DeviceContext> Device<Ctx> {
     /// Obtain the raw `struct device *`.
-    pub(crate) fn as_raw(&self) -> *mut bindings::device {
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::device {
         self.0.get()
     }
 
-- 
2.56.0

