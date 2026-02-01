Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA89C1EDA0F
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Feb 2026 20:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769976103; cv=none; b=XEtbiwDSxVEBYV2do/ydZrPJbY+vYgxZivA7f4Y2XQbDlKG68XdpZfOE2k6w9tgneVE5b6WAv8UoEnQxyUunAHqtodJOFChgsKexQEnhNoQPtjnnmRegirNEeCj00sdZgKmG6LYWWMVhk/Di5PftrP//AoX461p+26AP2lnHGi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769976103; c=relaxed/simple;
	bh=ETc2WuUnn56+VKanb2VtkP/p3TRPNBAC+8RgtWoYcZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1/UceFnniPrKn8f1tNTUWY1djrQJrAYIdNlbFLVCeOJnUf+q9tHCchhFgbPYuDb4vgzX40871sq/HBfMrTImDmyCduqs42DyhzcSj7fbBX+0kx50xDJ87EDlEl69BBbDNSL3Sw/EmLkBy53FvT6lBbXZhxQ3AAwFQyuRQa39BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OR8ARAyw; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OR8ARAyw"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-11f36012fb2so4446165c88.1
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Feb 2026 12:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769976101; x=1770580901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjOcUjW0L3Es4us2PLQLz4GAhrL5zk2fsCTd8Kf8Rf8=;
        b=OR8ARAywjbsZ7LcIL9LgBdwOLMBpJDossDuS/zm85rlUFvuWOHTIpHcw9T/cR3rm9S
         u7tPV14VbbOvNRCM9zmZ59U48PROmpOBBTw6u4wyoyXwYEYhdD3ujcRTt4+sEzfMUoJK
         OxW1PDAEsKuKnKJYIHfUffZxDylL1/Jh1ZbDMkq40Ea+aaXG+oUyP2hRfOAQAbEhB2IR
         ZnC5Ac9mWptmpf1l+xcZ/uQuKZmxLu8Y8Ups3VzbWmQrWiJG37RzYxtx88cth0X7bC0Y
         t0D7ERus0+Amtp/xLSpitrSs0TRifOt83OmeLQxkRfHJXQElsnx0LQPqoey569y6yUNI
         7a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769976101; x=1770580901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IjOcUjW0L3Es4us2PLQLz4GAhrL5zk2fsCTd8Kf8Rf8=;
        b=jMWywtu26DjdcbhFFAnJhObWC5JB5Rts6TdFrRZ0sWyKI9WMv/7UivR7nOS/urd9Gk
         OilS2l7kiNzm171NCqEkcbzUgj9f8LKOCjx+WhUlKv1qG2/Kuxtka+aR8u06ZN1AL+6T
         eMzqzlQ+31CJflGe6VeV+RRbmRDKLbxaQAaWmpn2CGWTU8xKnX2x8GeiTumOVtPaSIsc
         L4qhXHmO6MDqFzaEiR1gF5D6h6xhUiiUbK0y1rQxP9315sYkgU6JEk4YT3yp3c8sUyT5
         ifLF3tAa9InJbdGX3WgIYtfH0pFW2sZwzb/KGRwwLGVEyJJv01ogx0ZkVetz0pm/nB6v
         VwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW31IwDo/QMfk2GnXsH9qLVhMBXEwxdN4CMS59cYgoWNNBXtmyKndGsPdVP4rxG+naA2gAzuVxvfmiD5XTPFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvlOCnequk3CIxwKnLK8wfQs01qf0jrEYpzqw/8SFGq8L8f/go
	e5ZnHurOXspAHlBrfXPbRJGLlwipBvmb6IFdy+lGBuzLD0DYMwl+O/LrPzy04w==
X-Gm-Gg: AZuq6aKpHRxc/q0jodhZPvPrpM8gmdFiT/PP7rYuMJj5QiPaSy5tr2rBbKZSkZzrQhu
	rSzcCpsfjjKt1OnrXNF3qa+BDhO02+593V5HmDduGwhC1MFIdSTmiQ9m5YQgWjxHRPYXbBKU08s
	+VQSMk/MTRC9yWcLog1glyP5g54Nbr4HF/Cd935f74EwuVlzaxuLw/1xJUK/bW0pynhZgltq41v
	4Dhb6Sc/TS9XDNdWGxpei+8l8vM1AuFUXD0gLV7hyMOQ9s3PG0f1vE91X7kPjYUSKSyrSMN+zzA
	ItqBuBZfTpERhcOqdzR2BTFZ9+xdQj6CTE3UjHVfZu3I42kwBKNpLJJwNYiWdtEgiIcONQMcl19
	+i4vvJLgmaXUnggVDUjN7TIJMzj0g/WMrjTBaNGzOjpWmmJv3w0JSFB9RsCO8Y62GjgbCmZcxxR
	QBjhVeQd9+DY/RhlmMV4LoVGRuEREX0x7HMgg+y8n61PHx3SH0CNw1aEzBYGWfzKg=
X-Received: by 2002:a05:7022:e1e:b0:11b:923d:773f with SMTP id a92af1059eb24-125c0f7da99mr3798108c88.5.1769976100910;
        Sun, 01 Feb 2026 12:01:40 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:38f6:2506:345b:4004])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f95asm16115252c88.7.2026.02.01.12.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 12:01:39 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: joe@perches.com
Cc: charmitro@posteo.net,
	foster.ryan.r@gmail.com,
	ojeda@kernel.org,
	gary@garyguo.net,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jason Hall <jason.kei.hall@gmail.com>
Subject: [PATCH v3] scripts: checkpatch: warn on Rust panicking methods
Date: Sun,  1 Feb 2026 12:57:38 -0700
Message-ID: <20260201195737.1715632-2-jason.kei.hall@gmail.com>
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

Hi, Joe,

I updated the regex, and I looked at Ryan Foster's patch.  These two PANIC
checks don't seem to interfere with each other as far as I can see.
---
v3:
 - Using non-capturing groups (?:) to optimize regex.
v2:
 - Switched from \b to (\.|::) to avoid false positives in strings.
 - Added : to PANIC comment check.
 scripts/checkpatch.pl | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c0250244cf7a..37bdf602e7e7 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3834,6 +3834,17 @@ sub process {
 # check we are in a valid source file if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|rs|s|S|sh|dtsi|dts)$/);
 
+# check for Rust unwrap/expect
+		if ($realfile =~ /\.rs$/ && $line =~ /^\+/) {
+			if ($line =~ /(?:\.|::)(?:unwrap|expect)\s*\(/ &&
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

