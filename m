Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D597142847B
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136662; cv=none; b=P85pJR3QFvTZw2+ze/gNTts1qvA/doc5VZDv2CVNooEDblOIFrxlXf27Z9VUslq41vTpBTmEwlIfKSW0k9FPG1/BOeVON3k+AGgzSPgvgip/iSW1Vtxz7UK3neiKsz42h5eil/Cnp/W0/FBjfLb85GWqpikHNGG3JZ/UFXd/OTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136662; c=relaxed/simple;
	bh=dGBJzTjz5m+NMa32dIJtv8wj8C76M3988tpUHTl+siQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SN0w9UqHxtGp7/q5bEMPBfv1nh4jd2kL79hWbuGEth6KCQQfHnbPOwt0augLbV/vQk2uGF6RT+cnEYCf/P0nFD5nsyAgkAfpGpCNd3mzDnJNgvb6KsYreQ4fphtqtBL6UBmpWXfaqYAn9zCOoDcvayFkHCNN7XwsyYH+6422snk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7CpuY6S; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7CpuY6S"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-829ac4670c4so2491639b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773136660; x=1773741460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+5TAXXK2Id9C75JxvtSg5OOL0DW00u/yNAzn1WJF60=;
        b=C7CpuY6S+OJjYIE6bs444s48Ad1UJ6ipy75LxMDl9ODW6JZSqGf6pq5vzx68eyFcOk
         RTJKt2+x+o2x5b8fFfTQarlCBGn0rsIT08Y3YUBJIa5uowSuwgaD+i8PbhTEsvAmw3VA
         xqwhk/OLmJB4g3lt6rpMOB2wXSWAvalTo+Y1GhX94OXm9YYAKPjCWAUk2iXJ9GiY6opN
         Q4L03G15B92Nki+FPNeR+vApxvecUNSTp8rI3cLVdqBqZagP9uiBFcgteRy4B2kip8ds
         rcTJ91I7GbnNCQPaIJ1b95LlJFqTIZR/jKfXNaYqJ8gP7a4ChHE/8iuIAZtihCTGEClH
         HQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136660; x=1773741460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+5TAXXK2Id9C75JxvtSg5OOL0DW00u/yNAzn1WJF60=;
        b=ZsCIA0rNrhc3F31b8/dCRVCkXPBk+RJymhFsooQNn6vNLrWPu+PEqEJX2ioQMe9XiM
         2h8h/UYZ/gAefzgCYIJH4kNzIA0gTsjEsUuRYj3uMEs67dFike6jhe336h/7LmvflQCp
         PQFcKNdwJgiYBt06JVo4/w6v1XPmjwNWCtqlBlBkd0DyVhKoROQYtQJ3pE0xDw8DP9VB
         8O6+IBStdBN7s5/AwAnLDfvsS/xWasxLU16VaQeoZepI5qFrHNGJnUUeWY0OGDc5/c7r
         XOC/cAX+3Aw0QngrhvRASkYRtxLcEQA4D1nA9aQmtOQuG+BjTXaSag4vfI7Lx+70FlIH
         WBWA==
X-Gm-Message-State: AOJu0Yx1RpMSl4cxwqJlykRXaWwYsOHU8u3hvhUo4thB3/m6UqpOpjiT
	ybpJh6+orBV6t96DxlUgwvcG1/Re/PeqVo0K1o+AZgXReWazkxarg+Vxn7C1shJk
X-Gm-Gg: ATEYQzzLL5x49SXjRbFyRc12qoBZ5+sYrWlExEi2tX8KMLwGYYG+skRFLhI2w4A7X8N
	5Zpwv+BaSqMjb5ycwKgnB+Op4ArthVrLIlxlk9y6kV/8sJuK/pLGNEjoZrNoGNJlS5NShx1FgwG
	v5t/kIaJ/nDx0gglx4+TEnFFuiC3YOmhhAlxeCeUsBcor4P2DYu5Zpk+nUlQZm+bZSrvWQ+E/kw
	Smigf9+L9J8L15pFYYNyhDaCa4L3jTos83vxryDelnSOJY4uWMz383c0NwprcfrdRFcXQ/IqC06
	JGtgwXBWOzn3LH3B2NZeAc4mU/qwGYvTl5Cp7EAQX2Jafemte+76XVixfftZfDDcTrCHw3byxz1
	QQnIfN+yuu5KD6/bSp1EaJZnhIsWMlNHUHSrOUrTRCmWi1On/QYPembk1Zhs4q1eRzLJ50bDZqf
	k9vd95cyahuiPHz/r6mm9eadEbvTqDss2QkHQEU7XWa+S6Zhn2c+lJH8bO8NrlwQeRhZL0vjdqq
	+eNPtRIYT8=
X-Received: by 2002:a05:6a00:2351:b0:81e:c5a:8c25 with SMTP id d2e1a72fcca58-829a2ef7a72mr12136818b3a.44.1773136659657;
        Tue, 10 Mar 2026 02:57:39 -0700 (PDT)
Received: from Albab.localdomain ([114.130.187.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48a3b74sm17105000b3a.45.2026.03.10.02.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:57:39 -0700 (PDT)
From: Albab Hasan <albabhasan276@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	acourbot@nvidia.com,
	linux-kernel@vger.kernel.org,
	Albab Hasan <albabhasan276@gmail.com>
Subject: [PATCH] rust: transmute: use split_at_checked() and split_at_mut_checked()
Date: Tue, 10 Mar 2026 15:57:10 +0600
Message-ID: <20260310095710.1166-1-albabhasan276@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual bounds checking followed by split_at() and split_at_mut()
calls with the checked variants split_at_checked() and
split_at_mut_checked(), which return None instead of panicking on
out-of-bounds indices.

These methods were stabilized in Rust 1.80.0, which is the current
minimum supported Rust version for the kernel.

This simplifies from_bytes_prefix(), from_bytes_mut_prefix(), and
from_bytes_copy_prefix() by removing the explicit bounds checks and
panic-avoidance comments that are no longer needed.

Signed-off-by: Albab Hasan <albabhasan276@gmail.com>
---
 rust/kernel/transmute.rs | 33 ++++++---------------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index 5711580c9f9b..643b19406a24 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -67,16 +67,9 @@ fn from_bytes_prefix(bytes: &[u8]) -> Option<(&Self, &[u8])>
     where
         Self: Sized,
     {
-        if bytes.len() < size_of::<Self>() {
-            None
-        } else {
-            // PANIC: We checked that `bytes.len() >= size_of::<Self>`, thus `split_at` cannot
-            // panic.
-            // TODO: replace with `split_at_checked` once the MSRV is >= 1.80.
-            let (prefix, remainder) = bytes.split_at(size_of::<Self>());
+        let (prefix, remainder) = bytes.split_at_checked(size_of::<Self>())?;
 
-            Self::from_bytes(prefix).map(|s| (s, remainder))
-        }
+        Self::from_bytes(prefix).map(|s| (s, remainder))
     }
 
     /// Converts a mutable slice of bytes to a reference to `Self`.
@@ -110,16 +103,9 @@ fn from_bytes_mut_prefix(bytes: &mut [u8]) -> Option<(&mut Self, &mut [u8])>
     where
         Self: AsBytes + Sized,
     {
-        if bytes.len() < size_of::<Self>() {
-            None
-        } else {
-            // PANIC: We checked that `bytes.len() >= size_of::<Self>`, thus `split_at_mut` cannot
-            // panic.
-            // TODO: replace with `split_at_mut_checked` once the MSRV is >= 1.80.
-            let (prefix, remainder) = bytes.split_at_mut(size_of::<Self>());
+        let (prefix, remainder) = bytes.split_at_mut_checked(size_of::<Self>())?;
 
-            Self::from_bytes_mut(prefix).map(|s| (s, remainder))
-        }
+        Self::from_bytes_mut(prefix).map(|s| (s, remainder))
     }
 
     /// Creates an owned instance of `Self` by copying `bytes`.
@@ -149,16 +135,9 @@ fn from_bytes_copy_prefix(bytes: &[u8]) -> Option<(Self, &[u8])>
     where
         Self: Sized,
     {
-        if bytes.len() < size_of::<Self>() {
-            None
-        } else {
-            // PANIC: We checked that `bytes.len() >= size_of::<Self>`, thus `split_at` cannot
-            // panic.
-            // TODO: replace with `split_at_checked` once the MSRV is >= 1.80.
-            let (prefix, remainder) = bytes.split_at(size_of::<Self>());
+        let (prefix, remainder) = bytes.split_at_checked(size_of::<Self>())?;
 
-            Self::from_bytes_copy(prefix).map(|s| (s, remainder))
-        }
+        Self::from_bytes_copy(prefix).map(|s| (s, remainder))
     }
 }
 
-- 
2.43.0

