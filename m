Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A0C223DC9
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Feb 2026 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769961445; cv=none; b=uPiXQ734vpzy/ER//Tvnr16A1g54vX31akLwCSKk4jje7vcKPPrtOuMjunaieFMnwH/p8B1aTFIek24xHY/YGbZbTcTjQANcC0c3c72LTS4i30wcas7i+BGg/Jt6qq5nEjkJi/q7g2f9O8Lv4O6QfHGhhHL6GcHobS7KhI0DEfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769961445; c=relaxed/simple;
	bh=fTBRg750ujyzrVY0PIhgaUQeKBthwxG20Fv/y/qnnEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gvRPtdruWiXAUWCtlJZx+KNhyzzfDAdXXm1DcTSjAzxADzVChbkQ37j0I59fEff5z8IEBaBucgYspFSAMTvcFjlY6lXvcT4aqnMQiocxuhy6kfHAWospD0wOud1GjfE5l98fjGbNo99IEC/1z3ZSey5FCGkNYYVvERn8bQaMaFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJzwFqa9; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJzwFqa9"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-124afd03fd1so5393252c88.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Feb 2026 07:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769961443; x=1770566243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v62NnW7F51LkxZDVn9mSUadOypAxQ2Jh3WxYLgEsz8U=;
        b=jJzwFqa9mlYUfHU6NxprLuOww4hTiNbcNrDa27lVooBsWdd5dYIXoUqWpnUU60YOVG
         er7pyoUdQu+JWBLSPn4p5X0w83PTmqib1WaNWm/faH2rMjMLWcjTCZpO1NOSZtvEWp2K
         FuvMl9CqkrNCTZzYIT4zjPgzuQRiapLQsbPD/nxDv8PzNIjF6DDMk9+Pmb5vBTxTnkgR
         2KdSF1l3o+CoSr3c0Nc6eFSbES3zHZikKx+wFmU3kErSheSfCmq/XckHab9DFLFlCPIu
         mapxwtcQb577p+8fqh80gRGbUFR1DqlkHqIG0uuLvB4L9vTHPX0Db5chxG3brYX+sPVk
         6iEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769961443; x=1770566243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v62NnW7F51LkxZDVn9mSUadOypAxQ2Jh3WxYLgEsz8U=;
        b=M6Je/ztFmelLUWsWPtGWKAjnKjP8wmkd3ELSsmnyqIpjCmoROKjr0F0gAnii4xeIrb
         heeZb4M4/QtRseHbyTNl4R1GHWQxA/OlpnLzYLvAcGU/V5BTbTeoTex/+nKPLJUfHwa5
         4mUwVzLqN4crPf4pCWCbzbgymsNRjhcNq3hKTxlVjR0qapbL4/vgaf3ZwNbhsO8y1h8h
         2qX3bZ9TP0dpPBpx4l4mU07cF0bcKd5B23Qawfr4iYRM/ohE4WbTH5F7KmHDGnNGU6eD
         r2yD0UMhi5pGiGAujUz+Kgh1P/0UsFqrX+W7g7xu4fAIvkbtL75jTrvXGLSp3jwBXXqa
         +weA==
X-Gm-Message-State: AOJu0Yy8BemiPDdGtPnqrgLl2t/71v8bOcBTFtUA8vycxGTLrnIUYni+
	bJmu8O4G5Dtzj476VfAmdLda12RWeHM/XWnsE/ZZCGd2CAdR/7U+sGC20IrLvw==
X-Gm-Gg: AZuq6aL0gsqoNKKJ4OGvYmiuHHMQ/07pCF1/NMi9hNM4ffRQzwsBkTiZb+dX3jPpE1/
	FXHBvDTmJcycE+vfKhwgF7SRFTmIFJJZL+zOVNlBS3fOXytEog8VpfvXC/rTqRrp57POMzSLHoE
	NqtZikbdJ9sWv8fIknofKNSkv45FqKoEr0SdlRcNo7xo4KcFyxf6+NnZmruLsu9/1rqcI6vvvjv
	dHnoI3+n9m1L34UzDq011kdSGU5k9P4NAEedWZfEtSfeQPqlfwmafeESNGGZSvKZDUyVrzjj+FI
	bQVUzNOozfK6hEuuu3VKM039m0fuo3J2oxa4wf9+pzBVoM0AJ8wZT96f5/jkEpnRnNemzJwuPmF
	ZGI0Y6CH6oXdJR0IiHjJG72zoLlT0CIQ5kjsyQkDDgRcvu0T+P3rzvnZPNsHjAN65FvF8gmqpSk
	v6YBl4zbWZzXFh2BdwTzrnfckSoUYyuAsdj1tg7GG57I2Q7LO/3cdqOsid5lvm7Kc=
X-Received: by 2002:a05:7300:4354:b0:2ae:5f34:e93f with SMTP id 5a478bee46e88-2b7c8655810mr4511543eec.15.1769961442543;
        Sun, 01 Feb 2026 07:57:22 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:38f6:2506:345b:4004])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af88c4sm18053683eec.31.2026.02.01.07.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 07:57:21 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: apw@canonical.com,
	joe@perches.com,
	ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jason Hall <jason.kei.hall@gmail.com>
Subject: [PATCH] scripts: checkpatch: warn on Rust panicking methods
Date: Sun,  1 Feb 2026 08:57:18 -0700
Message-ID: <20260201155718.1623802-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
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
 scripts/checkpatch.pl | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c0250244cf7a..fa9f55031129 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3834,6 +3834,17 @@ sub process {
 # check we are in a valid source file if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|rs|s|S|sh|dtsi|dts)$/);
 
+# check for Rust unwrap/expect
+		if ($realfile =~ /\.rs$/ && $line =~ /^\+/) {
+			if ($line =~ /\b(unwrap|expect)\s*\(/ &&
+				$rawline !~ /\/\/\s*PANIC/ &&
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

