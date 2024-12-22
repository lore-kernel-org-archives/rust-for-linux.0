Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC28818C910;
	Sun, 22 Dec 2024 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734878073; cv=none; b=eSH0mndMN3XOvXCwRYjrforuJg+K2Qlaj5rcKewzgQZ3dVIO5p0jPzgCdKvAoUqZbPICUKBMUai4X10cOoNpFXHC/kip3Mfn7qH8RJj1k9dJvRhSDB9sJ1h15+iUg6FtS4lq1orODJIzHo8DvRUGCxxViRPKkh7GbbV3WB/NJXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734878073; c=relaxed/simple;
	bh=P/7DydMxfEKtyISio//7of2W96w5rcBw7tmDTunzL6A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hyKvc2L8IAIDUYqsq1yNLBEY7HK8gUt8n2SBfl87z2wLwOtSJbK1qQ8S99AeHD/eabv/MILM9jAdggEhos/c2DPB00cYx4YQi8Vuna94ypOU902UWd4W7yHi5Vw7ZxMBvkmRaf+fmbDjp1KQAln354WxZizh+JyApHYkwxj+WBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4V6HtHX; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4V6HtHX"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-728d1a2f180so2695888b3a.1;
        Sun, 22 Dec 2024 06:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734878071; x=1735482871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FWCJ+cbPXUZ8P2PQ4PeMJFfyiAlsywXttR9WwuJCUBs=;
        b=U4V6HtHXH4q1TaLlodCqwQ/gIKw+bk94T1x18ircqiK8UIdBJ2heWegShkPC3MNgxN
         96JGGJWLPaBLN/Tckp9iMV/P1CQqO3K55hfGuQDhcPy6hwRVV5pQ4BTpdTmFeuVZWcBC
         XcuE+UydRh0/XZ3A8K6QDPlOCw92fYqv5NmACngtR1ZQ2VS5Z5urz8rYOeSrnX+65LRd
         bZ6N7yexHZPeCxwuCBfCbpLHerEIBwt+I9cvT1suyBbfZRugnSRokH/y3lzveV2BqFum
         2txscGTFr2l5aFqvwOetjW67xdF4xblWIXZlo/pSlSv8JXp/p9arE1w5Zzt2infad3Br
         cuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734878071; x=1735482871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWCJ+cbPXUZ8P2PQ4PeMJFfyiAlsywXttR9WwuJCUBs=;
        b=C+DTWEEVbE+/4FDRs+v8Skga0Ik0cW8fdSWZdAh/BBVBHwLv0pQmrX9dyrgFR7jw04
         dy5nUi/FdfGDFMEPKDzaNZwSeTgY0edRceZyUr6E+mmOnvy1Ke41PoheN85u+M9bfjdB
         jjM53OgTU+Is008fO0gbPGhF+exnV+HGr1jjJNXckvBAhCaLFcVu4BT2ARLlErDBnk/6
         mPf9WuM+bCdJc21pcSSLOS+NXlkzMWZdBB1CXePyD0I3XG/tS8TTS3H1zfGon24Xc7lX
         ebKICt/qOnw0WuaYoDSDyJ67dT70U0aXIFa5Qrpbe0upPU74NU4sJl41FF01Z9Ah+9pq
         eMZw==
X-Gm-Message-State: AOJu0YzlwImv5MZESHuNocV0IWX7M2uz2NVyX4Ie/NzIh3uIGGJeWYDm
	uPSX7IzERsWx/YUhSNvM6OOQgEj3yxFzmaXz0Rh835xXrkpigahUNDlCNVfQ6YE=
X-Gm-Gg: ASbGncun992waL/unzOvn2aIfRcSfxyNTOYtgiO4zOMEN4swsw9fHo4W1vd+FduK+W1
	U92D0fXwS24YyEFjnIeuc2ZuZlssUQwl2XhmmfjfuwOwlQdZ7cglfaU45vJr8nCLM0WqdCe/tRv
	cMn2ci5T7xJb3Ziu4NA+G6UOGUHMZI5hUCt4cafZKFiZyS+KndFGVW4WvIWQgu/Jozblz7trMd7
	AhOWs6BKpyPacR7ML5euPbYyYeran9Fw6iVUp7nh83Yk7oJd8QFsgFsS4WKQGsKyb+6oifh
X-Google-Smtp-Source: AGHT+IFBdxFDf7wCNZKVk8gGqy7RByu+6YtRkz8QgSVLCZ2aygv0dhWGwS56aCvFJ07m+dk+i30WYg==
X-Received: by 2002:a05:6a00:35cb:b0:725:e386:3c5b with SMTP id d2e1a72fcca58-72aa9a2a202mr27231547b3a.5.1734878070938;
        Sun, 22 Dec 2024 06:34:30 -0800 (PST)
Received: from localhost.localdomain ([2409:40f3:1094:e58d:dff9:51de:e3d8:e144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816171sm6227806b3a.10.2024.12.22.06.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 06:34:30 -0800 (PST)
From: Siddharth Menon <simeddon@gmail.com>
To: rust-for-linux@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	shuah@kernel.org,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH v3 RESEND] scripts/checkpatch.pl: check for non-permalinks to Zulip
Date: Sun, 22 Dec 2024 19:50:26 +0530
Message-Id: <20241222142025.104284-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zulip links to https://rust-for-linux.zulipchat.com can break in
case of renaming the topic or channel if they are not message
links (which are permanent links).

If a non-permanent Zulip link is referenced then emit a warning
and direct the user to the Zulip documentation.

Permanent links are of the format:
https://.../#narrow/stream/x/topic/x/near/<numerical_id>

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1104
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 scripts/checkpatch.pl | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76..d62fd7760893 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -735,6 +735,10 @@ our $obsolete_archives = qr{(?xi:
 	\Qspinics.net\E
 )};
 
+our $zulip_forums = qr{(?xi:
+	\Qrust-for-linux.zulipchat.com\E
+)};
+
 our @typeListMisordered = (
 	qr{char\s+(?:un)?signed},
 	qr{int\s+(?:(?:un)?signed\s+)?short\s},
@@ -3410,6 +3414,12 @@ sub process {
 			     "Use lore.kernel.org archive links when possible - see https://lore.kernel.org/lists.html\n" . $herecurr);
 		}
 
+# Check for permanent Zulip URL
+		if ($rawline =~ m{http.*\b$zulip_forums(?!(?:/#narrow/stream/.+/topic/.+/(?:near|with)/\d+)?($|\s+.*))}) {
+			WARN("PREFER_PERMANENT_URL",
+			     "Use permanent Zulip links when possible - see https://zulip.com/help/link-to-a-message-or-conversation#get-a-link-to-a-specific-message\n" . $herecurr);
+		}
+
 # Check for added, moved or deleted files
 		if (!$reported_maintainer_file && !$in_commit_log &&
 		    ($line =~ /^(?:new|deleted) file mode\s*\d+\s*$/ ||
-- 
2.39.5

