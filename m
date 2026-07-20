Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6443C3BF7
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 20:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784580640; cv=none; b=KJteR2/6627QxXZKJ2JBCnkODldGx2PbwDaEy2eUiTAfqA05MOLJ0Kl4d24/DAvuG9acnBRChLavOTi4lx6O/4Fgmayg2+1FkDtjO7tOZNaIwjUPNC2jdFTn068BhJD8Y0bSk7hWuK3bg8F21xBv4aWQCwOW9ppRIoF9OAQWWEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784580640; c=relaxed/simple;
	bh=HuS6lK18giduftd3GhQ8VAWnwu1OED/BgGxK4jrD/cA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CRvKXElAht94DCTmvNwI9jb9EFmNRCxAa7V2tlx7BRo4KWr6mK4GztedngNL/OCE6DWpGEbuwVci+eqJG2WB+lqYk243ZQcYiGSRqda2i3r3wO9VbEF43ZBf/4Yy7xg2ZEoRYSGcnyBWQv0gmZj7xLSk1oKkRqFooR9m+QaZ5tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=i3VmlVbt; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="i3VmlVbt"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso4438895a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 13:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1784580637; x=1785185437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lQf1ykkwp4X1WlGIDlVib2gotBwxXCqOekLXfD0iRlA=;
        b=i3VmlVbtCtzECEGMoOQaSHKfuepyCh1KpmhqTBGGP+zP8WGgSouL/7M22c4pI0CYFP
         a0X0SCKTInU10Yd/h5qoiGdsHS4Y6DbYD8z/abl6ZGvB3JW2RUqfVgrPio2EG3qU6gfH
         KctwgQYlDHAOxXfLvPsUgX1zZXvF0EujVgJsiwKH5mN36H1JOsbuMuLdT4POF6/XRyXa
         sYBt7wq00tnQcRWaKbTqHUA6xsKIRzreA+m3VgyXSaAq02Akn7Odi0iI2yGUa0vAVbjH
         k6rq/Mj6zAXqc2S2OGj79NB0BMXw8Z3ZVVDuhckmB7Wi1a1cgg0JH/e4KW8lY2hfs/b/
         RmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784580637; x=1785185437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQf1ykkwp4X1WlGIDlVib2gotBwxXCqOekLXfD0iRlA=;
        b=IWDFBrVXUVOOCL8Jg58bi7TD2i0/SAwQHRQl4cK5S6OGVScWmglsIW7y/V1oPow01B
         xaonbevtpQ6tHyY/Oxoh9IHU71grAJTSlb+Itvz94xQwvwUtmp0Q/WZI0Mpll47GHAr0
         ujXeesEMvD8sFAye02QATFOkbwEyLiLGcIEg2cY20fmqzqqqj/OWWy2MxY5CTnBKh1+Q
         4Ql7Ni3BVdZ4/QG5uWg4leRL7BKSkX7RJTBvLg8DZ9J73R+HBU1GbmqnZm8aT0LtQmLv
         GWbKPkLcl6u3WZfJjqALI8rS4nDLIcm0DST+wbsJJi7Xhmx2lJtv4GHnpFRwadyKOOZz
         kHzA==
X-Forwarded-Encrypted: i=1; AHgh+RrCNSabZHgf55ZAEIuY76xHRc04nANx3PmvVPOjE1WEAgRulpS0sqDYFvoBrUVnPtv+kJGkQAKOUTGl7Yu6rA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+wc9voiIqsovyXGjumuJ0+BcJDOAz1zxSz94IziX2ftaqmGmg
	E38MB5KnltPbfpa8YFJqkm5CYf2ne0ADaJt/8qRH+CpfhGfylJu5qMCFozGwy2PSSg8=
X-Gm-Gg: AfdE7cltOCE1ZAfNvBHcYE0ugHyBXNbcbIUei82zHYb7GOmE6UpKGYfdbiPq9mucvS9
	stzABFj915m0f5cU5bmAKaLK7mCC7ErvxQBaGIwSvlrHBPbWs4CDvgP8p5HFGwzvEmdFspCE2Us
	TMYOdTh7qIwdSK/d0RKcu0HAQqShIX9gzhxyJFVq7hBkT+DNyM0rJcY1gKzYI9uz1ictFHRYgGE
	rAo4hWLnG6l+McicfWEHfO//ZIPZtGLSDeMV5bnUn36tCly4i199x7g8hU2S60i5om+r6qQO9D7
	/PnRfhyXKmUW0s6NeaxiYkwrAvX6OJNUljgph+i82Xw7GS7ZgxGs45o8NBG4qZFJbURIVkRzhaj
	I2uauFBFg6axf7W9/KJDkpCT+wgnRas9zFsuajRJAynviW47WoY7Cf4aqL1xfHjJvh8Up3T9/KE
	IMEwItGKypbUr3R+5Km3EQVmyJKh3y2sqxsQ2BCgE=
X-Received: by 2002:a05:6a21:6816:b0:3bf:bde7:d66f with SMTP id adf61e73a8af0-3c3ad79feddmr15904375637.2.1784580637535;
        Mon, 20 Jul 2026 13:50:37 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3142a20bf96sm38985724eec.28.2026.07.20.13.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:50:37 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	ytan089@ucr.edu,
	pgovind2@uci.edu
Subject: [PATCH v2] rust: cpufreq: Add CPUFREQ_TABLE_END as last table entry in TableBuilder::to_table
Date: Mon, 20 Jul 2026 20:50:35 +0000
Message-Id: <4dcb9b9c756e413c13616e46cb27669bc5b32cf5.1784576749.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `TableBuilder::to_table` function adds `Hertz(c_ulong::MAX).as_khz()`
as the last frequency entry in the frequency table.
But the C API expects the last entry to have frequency set to
`CPUFREQ_TABLE_END` which is `~1u` as per include/linux/cpufreq.h.

Fix this by setting the last frequency entry to `CPUFREQ_TABLE_END`
instead of `Hertz(c_ulong::MAX).as_khz()`.

Fixes: 2207856ff0bc8d953d6e89bda70b8978c2de8bab ("rust: cpufreq: Add initial abstractions for cpufreq framework")
Reported-by: Dylan Zueck<dzueck@uci.edu>
Reported-by: Yuan Tan<ytan089@ucr.edu>
Assisted-by: ChatGPT:gpt-5.6-terra
Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>

Changes in v2:
 - Create `TableBuilder::push` method to add entries to the table
   without converting the frequency to kHz.
 - `TableBuilder::add` now internally uses `TableBuilder::push` to add
   entries to the table after converting the frequency to kHz.
 - Use the new `TableBuilder::push` method to add to the last table
   entry.
 - Link to v1: https://lore.kernel.org/rust-for-linux/cover.1783548374.git.pgovind2@uci.edu/T/#t
---
 rust/kernel/cpufreq.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 58ac04c650a1..f360eb9578f3 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -361,23 +361,28 @@ pub fn new() -> Self {
         }
     }
 
-    /// Adds a new entry to the table.
-    pub fn add(&mut self, freq: Hertz, flags: u32, driver_data: u32) -> Result {
+    /// Adds a raw frequency-table entry.
+    fn push(&mut self, frequency: u32, flags: u32, driver_data: u32) -> Result {
         // Adds the new entry at the end of the vector.
         Ok(self.entries.push(
             bindings::cpufreq_frequency_table {
                 flags,
                 driver_data,
-                frequency: freq.as_khz() as u32,
+                frequency,
             },
             GFP_KERNEL,
         )?)
     }
 
+    /// Adds a new entry to the table.
+    pub fn add(&mut self, freq: Hertz, flags: u32, driver_data: u32) -> Result {
+        self.push(freq.as_khz() as u32, flags, driver_data)
+    }
+
     /// Consumes the [`TableBuilder`] and returns [`TableBox`].
     pub fn to_table(mut self) -> Result<TableBox> {
         // Add last entry to the table.
-        self.add(Hertz(c_ulong::MAX), 0, 0)?;
+        self.push(bindings::CPUFREQ_TABLE_END as u32, 0, 0)?;
 
         TableBox::new(self.entries)
     }
-- 
2.34.1

