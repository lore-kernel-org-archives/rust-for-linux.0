Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57763271A7C
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Feb 2026 18:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769970611; cv=none; b=A650Ta5RPlqaIBcYchSV9KLUd2KCB7S2F3igor1eXH6GnFrYKjoEwC1yXcqoZSo1QxvTyrJI8NVPxI/pfrbQj3r5u4GSF3AM7deHTmwyl0NPlz/fEK0uBuCEWXC87vaCPU480aE+O/3XMbvH6WY30BWhqOJ9l4AknWRZ1EhweQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769970611; c=relaxed/simple;
	bh=eeuFJjjR8Ojit/UB0c+0WItFNmdWT3+qDBtSaQ0lwlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldeQWWMCIUXHp3tH4Sc6nDXqrFpfgnB6ZA2pa5DAphFs/HHcC6v42d4EX5jFo1GyF0fAOBNhD3rRNonVCqIXq8r2wm3380X3TSiTBPiCIxsc5LbaSLXzi9UpQ5+un/wpxWaw5azaw4neh10CzhreFFFxnksn6RncB7S4ViYXIcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8LHPCRx; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8LHPCRx"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b70abe3417so8541398eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Feb 2026 10:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769970609; x=1770575409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6R9pPOOe0MWCIiMXx28ELLLbqAzBS7/bZm6uv9qICE=;
        b=K8LHPCRxvXF0UAWk+whRwAISySatgsNOanCtgFuwfEYUmHE53jDS7oIXvwFdIaSJBd
         DEYzwYxrG9cddGV61tRGiLZpw9o7YpIFIz/pjnxPMPFhLcTXeYNK1Gsf+bxgozNXB2Y7
         PpOW+NpTcdqHp+vRW8/1ttuI2Lu7mFLgSxQ9oGG9HaLBo47ZKe72U6hZhFDQidP9yEdK
         o+oBPmIzb0pelI6LKqCmTGdSrImsR+341fw9bOnJ1JePUQasSNgmHmtZviGwtjgDMhJ2
         6OcAi9a3UQZIuB9Jv7UdUA/rw/L9r2nAXU2mGsmEv25sKAJm3+ErObmy+nJu1A7a3IQJ
         EQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769970609; x=1770575409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N6R9pPOOe0MWCIiMXx28ELLLbqAzBS7/bZm6uv9qICE=;
        b=EyWT93L/9BgBSQIgayPOSo2qFOZHU2g7zFAHRnLpmnDu9r8ds93COj4yVgQnC2E4cY
         wfNnwPKKEttJHUVE/YckVH6V7/itda9tqL1Gohp1mTo2h2XwAYwMRTW9y5gKz6Rr7rrR
         L8UP2rBn3E8PIkgi0kp22s3uO03+7XPHFooyMy4fGqFeuQv5tXMwPQcAI/tZCvuyi8RI
         bTG9niFUiaIdJRMnzo4FFvZZjlTZZJXFSMeubpixl1p3Xqpbd0mBCDbLedYzS/yo9Paw
         QriFdccA6VFVZ3dqZ46Rt+yrUN26w4odbSv8UlPDz630NYwKiAo5f/M2PA68l4RRpWL9
         Ss5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBqx5uLc/PYz6/xiaXWb07II+GidM8pCWt+xb00mjfQO5znos6VM9NgRa7uGNuYaZ10QmwUTK0C1bklsHijA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVByPADa5Gl4V9HGZtkP0/pNguZTsxh2HKFxr7oaPpXJ1T9Dr9
	S7feHFjJR2CM06mWg5HH5s9xjgnPUR436BE8Yf18SQvsV8Db7ONc5KJeQyy80Q==
X-Gm-Gg: AZuq6aJS35thMx6DQXAS1cGY8Eop/V/HztqnD7nKnQBxGdNWrHegJteeZhph/uxRJ+v
	vCFj1jhBHc7ni+dVqVRRk+9qIqVZa776ZCZMgssHT4onAtVsI2umrlBscuSefPD6eKzazcqcOjw
	ONJHbaWCiGJJn1YtSBqJaKTB8zEjejRgMtq/+zqEItPkJP8os9iB9VJGHcX/CpOjo1L08BrSAG3
	xmmpdZ1Eim4O9PHCAFtgw4eZ4GLafraXOA7hrpLyVZ7JQrVPihoYXceIY9tKBxgv+nKAgc1pfYG
	YLkMM3XeiZt76V/ilfdY/CiYY+ce2ylY4nu3LC+zPDOLjVBmS17tYBX6KtPuLt8AjtenrYzch6T
	L43EithTKd8FotStciJKE+vJuv3QX0Kaw5q0KhukVb9NfTPNWtFyJL3Wpi44NjtgVk8+yNe1dQl
	rjo8gkMI4moZCLdrQ+SpDHDoFZKT/mNiQV6w93BmAAWs9NNZKruGZlNHNlVzgRjzM=
X-Received: by 2002:a05:7300:bc05:b0:2b7:a3a9:9c2a with SMTP id 5a478bee46e88-2b7c8902b1dmr4620868eec.30.1769970608477;
        Sun, 01 Feb 2026 10:30:08 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:38f6:2506:345b:4004])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef40asm17983090eec.13.2026.02.01.10.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 10:30:07 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: charmitro@posteo.net
Cc: apw@canonical.com,
	joe@perches.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jason Hall <jason.kei.hall@gmail.com>
Subject: [PATCH v2] scripts: checkpatch: warn on Rust panicking methods
Date: Sun,  1 Feb 2026 11:30:04 -0700
Message-ID: <20260201183005.1681807-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <875x8gqt3y.fsf@posteo.net>
References: <875x8gqt3y.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added regex check in checkpatch.pl for common Rust panicking methods
like unwrap() and expect().

Allowed an exception if the line contains a '// PANIC:' comment.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-linux/linux/issues/1191
Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>
---
v2:
 - Switched from \b to (\.|::) to avoid false positives in strings.
 - Added : to PANIC comment check.
 scripts/checkpatch.pl | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c0250244cf7a..43b4c0eebb96 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3834,6 +3834,17 @@ sub process {
 # check we are in a valid source file if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|rs|s|S|sh|dtsi|dts)$/);
 
+# check for Rust unwrap/expect
+		if ($realfile =~ /\.rs$/ && $line =~ /^\+/) {
+			if ($line =~ /(\.|::)(unwrap|expect)\s*\(/ &&
+				$rawline !~ /\/\/\s*PANIC:/ &&
+				$line !~ /^\+\s*\/\// &&
+				$line !~ /^\+\s*assert/) {
+				WARN("RUST_UNWRAP",
+					"Avoid unwrap() or expect() in Rust code; use proper error handling (Result) or justify with a '// PANIC: ...' comment.\n" . $herecurr);
+			}
+		}
+
 # check for using SPDX-License-Identifier on the wrong line number
 		if ($realline != $checklicenseline &&
 		    $rawline =~ /\bSPDX-License-Identifier:/ &&
-- 
2.43.0

