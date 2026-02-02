Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C0635EDC9
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040569; cv=none; b=twpWOmB1wu/HSchyprXER6dVwruO9h4kzKR9w7WXmANy+21VJjTuw4yzLM7eCDKQz8RaUIQa32mQn5TYLlzITvbxxwrN0AUxjig0bM0ffdBn+Ewovv+qEsIUboxCJ+05ZNf4AkFQ0zQi2ky18AQ0kFotNe8u2rFMsx+RUw/PMQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040569; c=relaxed/simple;
	bh=I3hdn0is2B4hFR7yLjTdMqo1s5U6WpPHWCgDsrJ45Ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KhPbbIAtWe/hFGn7bc3vmKIoqpbyppHTYsUmxFByaz4UB+6D+eDNLaWqDA9xIWxJRIw0YtlHAX41bZSXjN8uNlcUWhR/zfi89yifGw1B7ekphlsSaHNTbeiAceDFg/js54xooPOhADU/cIwWSfMscflIUQHPddGPUIfLJpvATlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJDCR7JZ; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJDCR7JZ"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b71557299dso4519723eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Feb 2026 05:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770040567; x=1770645367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4szHbuFxqmXA3vP2xDtj9lQOqQZM7yRsk7nkYjSTgFc=;
        b=DJDCR7JZOwmfHQpgS0YLUzotns4Z90sOQs+l6vwsHmu2EnsiLVn+K1NhaWMlqhJZHZ
         gQYMAD9Xqt58VfDUY90ws4ZGNNCinpk6+tEm2vwKHyR6HA3/+CGr0E8sP9/CslQ24Zz6
         vBfAwMthU7sSflCkl4CS1h36jY/u5r9L7/wD08zEDYeS/DScrvs1omD1vCPLua2JqHKW
         nW/VAu/K2t8zUiJl+owwTPXGjEevfEs/XgVxOp7bhTN0GxytuhCDxj61DJp/vlqbAoyo
         0ZoXeJctbnqeD/fTWxrxwNOs+lHx5KwLOwQy4mLMWn1oOzjFlzArvsl5vlRTzwwIszNc
         ZOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040567; x=1770645367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4szHbuFxqmXA3vP2xDtj9lQOqQZM7yRsk7nkYjSTgFc=;
        b=JC5/TJEO157Fq+1unbPKixjT3VjpBg6jNZQrFDZTGtXbJIzSj89xC3Q6I179caYaEt
         Q6CvYjY0J6FVbcein9DgmfjCwGIE35oJuMsx28eLd70Ol+60FxqrsZlHCEwl81gObX/2
         z/zagZ12kjwOhl3xL1T8ggxced3Kt5GkvTF8i6jNcM2uUt3PXY9Nvs0xiB8VcmWmFPY+
         rpixkzCjLnd1KvgCVfv8flLR0NErBku2Ia6D5lLToCPeVoX+xcJDMQA2s8LiDnYKw9Vh
         uHyYwYA+mz1LhMUjYgj12RvNQtXehE4+0VQbBviLOC95i03VT7e2LfuIOP2mwDnMQ1rb
         Q39A==
X-Forwarded-Encrypted: i=1; AJvYcCUl69CwYZHDu+bGTXj3v969j7Hsv8kRVuGDW55jVTxaObtmpz8t8RyuzLjH2k6YTfVySn8ZBdMSYsw4lb0bjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLiXf9mLJkHHto7beP5pGWMkaL+nxdwMBeFcrmoVikF0cfuGSl
	/1nTMGs+O2e61xE0MXERdDE2FJudIVIdXE9hOBgRnmTyeA+Pn2mlSx0fhvRA5g==
X-Gm-Gg: AZuq6aJ1hsHiqRGHg0aOeDJqdj4O/LBZa5XyP0qqAcXcjPuVBmBCV8dvW16d8Q3+Wjz
	+j+VyK518xISVVdQxQgZSGOQB1b6kUerFtDcrHPhz7ZoO+o0wEjNs6eXPeYQytGlycwAIzhoSx3
	t2pIEVWJ89lDGuxUsggkIjrQ3cJDi9+av6X2hIbwxQcOIw6Q4JtzQzUTamp9a7vC+x7inGb0vNl
	sHi28o6bXCAi7gg+rZB30RdFSNucdY7uRmi+rcGqjbpY/g/26trOPeu2PK9EurtjBpoShTumpuC
	uzVQYtRzditH8mzr09Wc+q8CPaFJV3wkl8AYpUZYElYKJYCm8lm/GeK77tiup+qPz+uPFrsw4Gc
	s/w4SC5KJm0V77FO/shThad//UaKxtx6+C5yntxs7lJNSxnSR43X9/5nY9C49OpxeWg7dR2NWeV
	Lh/5sPG8xjK6gx2tQhNIXBBxYZJ6FpgVx5g8UkpqY7Xee9r4XxkU4+E0q6G8XPAA==
X-Received: by 2002:a05:7300:8ca0:b0:2b6:aa89:4b59 with SMTP id 5a478bee46e88-2b7c892cbb8mr5770852eec.36.1770040566836;
        Mon, 02 Feb 2026 05:56:06 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:4339:af89:9643:898])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfa25sm20061490eec.5.2026.02.02.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:56:06 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jason Hall <jason.kei.hall@gmail.com>
Subject: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
Date: Mon,  2 Feb 2026 06:56:02 -0700
Message-ID: <20260202135602.1886134-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <14d95956-05dd-4c9b-b748-894c1d474c1c@de.bosch.com>
References: <14d95956-05dd-4c9b-b748-894c1d474c1c@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add regex check in checkpatch.pl for common Rust panicking methods
like unwrap() and expect().

Allow an exception if the line contains a '// PANIC:' comment.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-linux/linux/issues/1191
Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>
---
Hi Dirk,

Now using imperative mood.  I decided to keep that logic stateless
unless its agreed that we need to add state.  Adding checks for #[test]
and other test identifiers will make this much more complicated.  There
is already a check for // PANIC: that works fine.

v4:
 - Use imperative mood in commit description.
 - Fix patch formatting and placement of '---' separator.
v3:
 - Use non-capturing groups (?:) to optimize regex.
v2:
 - Switch from \b to (\.|::) to avoid false positives in strings.
 - Add : to PANIC comment check.

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

