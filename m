Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FFB311960
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107813; cv=none; b=c/j8LdmcrXO+koRYiMNH7rd38p0tn0dEWpm8TWWYQGRJfiMramU3FcyfydKqiTYfv26uiqQ2oRLDlQrvfle1MHQqA+pUXVqtoVet2FK5btvtlicprnMaPwSS/XXr79uJ3PdAPz6o/iVPPYeBDD63VmSIGopr0X3V5yDawzaaTqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107813; c=relaxed/simple;
	bh=QQTBf/EQqtb5sGEPuiIIC9TQ2GBjaXEAqjeS0rNpq74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYFilwk2kmkleYnlRuILDKfgAazqI5iZv0ouzCBwHU2Hvn/kWy3AZHZeZysabNXLRXLeKejWFsPJ15THM0J6uw0zmkWycj3NIjpduAnso5E1nMRj+1cFKT0mtaX6Zsk1KyTTsfD3qMeCdEZ6v2I2zoe1J/6sGZPrvnCaMiu4Cqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR8Kv042; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR8Kv042"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c6e23cb81f4so294984a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 04:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772107811; x=1772712611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXBi7ACXXienF+kiY4q7BvWmKQquNZrtWMv4+/ApcHI=;
        b=CR8Kv042wmX4RyTonkYd1ITqgtuIDmwr+b8+9iFxd7ILaJVxhVy3QOKlxuLFtEY2Xz
         ijyvasu9jeTv1og+s4QvyzEHXq/ETy83n9hCK8gpJFPkRB/niNGCvMhJRKBE3vE2YRGC
         /x0iX/+KAK7TlBw92ixcuyXIk3/dR2oaTM9J9oqj7OrrLEYqYXiT6E00QZtp0DD0+teB
         jJExPk7I088AXSQBje+f3qRI5fACmdU1IpqYGXgvLFSZ8szNJj+ycp4icLfJXKsxQR5Q
         CrYKHpgWyHWbo1sLjsENG/zwj+JM2eGya1YW1UWNoGw8oIfYfWIaS3VUha94YKmmJs9O
         dNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772107811; x=1772712611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XXBi7ACXXienF+kiY4q7BvWmKQquNZrtWMv4+/ApcHI=;
        b=Gl15EkeHzpqX67G5TE5BUkCPEE3dgmvLDIbqee87fVJyBirCak+r+MT6dKPwFbTsCC
         3Qh/rc2ftrA7kyvKutgN+a5fp5edAbQnNbrZC6Gtqxdq4xuxl2bH0q8ja5YGqx9FdM0v
         ulvB3rwgcRh4qJtwNZzde5J6uymHQpH3uHTmIM9datsFaLseNg+idesCkZhxFDRtVdM6
         Ltv6dVCSqpz15xKqKvaeO1ozl1Kls2dMyVi2GzDO7zJPUicKvFa+NezL7c4jyeknMuPE
         YRMIRUV8LhF04Erj2n68I3Z6YLG1Huum547c3nwk6pJXj73KbJ3nUKKY0AEi2oOB2hIx
         yGZA==
X-Forwarded-Encrypted: i=1; AJvYcCUc116Yqa8wa8RUwdsPvhi8kcWLYWJ2zLdb0rFbsDpcylYrAzWL42UDqmJHsWvFl95zHs2c1tuVDHR5IbjbzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt1iJKC5B56EkzWvBdk+zYHXRS15jNb+boL+VOosFloJ328EiI
	OLEsOQmNNVxNiSJAZJ0ufUrzipZXbaIbXREX1qctKOBNvVHIIS321L23
X-Gm-Gg: ATEYQzzjxtzb4zJSqBbZ6XQtFkvyvfeYxNUXxjdDuVO+pp5SSwtwGTobfIqx/e3qB3T
	7bDyakPv976KX6hs59CoYcDomIGkarqFekIaZ/4gbS4qQUwRjX8zjk4maxS/PKZTp7bjPuYPCsj
	sHFpCkZIIvwyyF8B+ZN/eoCRPX7n0W3Z1rgsPf2MfvhiaGs/NHIci9xXTAVqvdzId6YAWbNW9DN
	gF4rOn7cVkmgSlm9OD+qcmVrpALM6lkfX2SQ89+5/qq7tZL94p6Kz52j8QdXSu0EjJx8nQvUiRf
	VoQBdq77ZG/zCbSx+Ljrf0cwvT9mH/qEUXKpRTErYKYkrZgfLVIj4RZqVBog/th1euDds+9lO1K
	gL6sF6b4daZfbvfUYwJuGCYh6ce4K81LRuCEezdG1hRUSIoFXVeATP1G50ZnhvJvT7bIUEDFkJN
	JRTsRdzzvMJBUlCMe3GstG5YMz
X-Received: by 2002:a05:6a21:4002:b0:363:e4d7:2c34 with SMTP id adf61e73a8af0-39545faba5emr17013134637.57.1772107811563;
        Thu, 26 Feb 2026 04:10:11 -0800 (PST)
Received: from archlinux ([103.208.68.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6cd476sm24199525ad.75.2026.02.26.04.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:10:11 -0800 (PST)
From: Adarsh Das <adarshdas950@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH 3/4] rust: mm: add `pr_warn_once!` for invalid range in `zap_page_range_single`
Date: Thu, 26 Feb 2026 17:38:47 +0530
Message-ID: <20260226120848.82891-4-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226120848.82891-1-adarshdas950@gmail.com>
References: <20260226120848.82891-1-adarshdas950@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a warning for the invalid range case and remove the TODO comment.

Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 rust/kernel/mm/virt.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index da21d65ccd20..f608262a4ff8 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -116,7 +116,7 @@ pub fn end(&self) -> usize {
     pub fn zap_page_range_single(&self, address: usize, size: usize) {
         let (end, did_overflow) = address.overflowing_add(size);
         if did_overflow || address < self.start() || self.end() < end {
-            // TODO: call WARN_ONCE once Rust version of it is added
+            crate::pr_warn_once!("VMA contains invalid range\n");
             return;
         }
 
-- 
2.53.0

