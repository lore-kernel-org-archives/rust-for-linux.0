Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675801E8337
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Feb 2026 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770559273; cv=none; b=j5EWTbNi9aZAI11byUvVrnlVCVgaoFtHGBHP1EGeCjEyM7ruuoYlTBfC6uJp0/n/xU03OtkNZoBppS1q/YS5dKozM2GLsu0tDZwe+yhhrZcnTu+iYrp+hCKBOLYPa6g69o6mchF0Otwp6+EXM9BJojiK68+DCcEgY91AVBxXemw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770559273; c=relaxed/simple;
	bh=umceI7vizZ4P181DAwDZX2JP5p8gIIHrTMmWUxzt7os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9x1XoIZAzjpHn3QYUmXW7CxV6pQw4ZLiEg1zhO9Zg1OYg5p3MWWBmUtW/siFJXFrUKOiqATPYyFotdqvCTY2yWBV9rkZ2cuC6ZrN9h7HeUhzH5HNGrqNeqBF4B7O5Y6ndt113E6fiKWLfSq6h0zJ+Hw2rWUYSHJElEWa6t2zSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfRa+KPf; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfRa+KPf"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b6b0500e06so3450458eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Feb 2026 06:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770559272; x=1771164072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrmAJYa1aBa1Jp5ZX6d6/0/lVj7Z617W41SQYUSKTTM=;
        b=kfRa+KPfIkjsk/RaM74wb16Yh4QaTFtb23PP+IZujvQ6MErSlGM1BQeZapLBR1tII1
         eEdv+ewTeTeHXB6WUl1g3KwnllFTSYE3Hr4V9VD4QkfnlrIkPv6dmr6fmsnC53lcQb1k
         MS2kuhPSUS5qAm2yzP8fhT1ampUVu4uamG3iaS1mqrnR/r6h/SZJcHLSFcWt4qXgG8iE
         NRvTo7S8E1PEXwsAwst+r+wDAstghZrLhSUZpUBUDFPK4pBb6itvL6tQO/VKT+S2/wHW
         kvog3bWdrEzhU7NvcR6VpnxCuJtjb+GZA59xuI2YHQQ6Pwqc7M5HZugvbGKDI7RTepGy
         ip0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770559272; x=1771164072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MrmAJYa1aBa1Jp5ZX6d6/0/lVj7Z617W41SQYUSKTTM=;
        b=GG6bBtRmHLGTwxdFtXgQYpYQy3yN+OQx18E3Ry48/uhjkvozPwoXXTHconNNQMGoaK
         D5LQgzv5piqdH5GQbIExLIkR7tmpM1IjN8PRI8ACU5tSZ0bFSpmvn7uuu8+pdNwSyYhA
         Yl0xIHgonIRUYIIGhdVSU2buSo/p7+fT+HK8TVHNkkB4M07Psq+JUoG343DYexp78Ex4
         5cT/zkqodOiThZV0Nk4sBw2UFpMOmOk2bgkIYgc6Uh9cJenSnG4RkqAUoy34lDGkd8Bj
         Ku5bPxnDPJTVZPFe+62+6ljnKelvsc7oUd7gbEur9mTsKA/js1UrDCD2gTTy8Eqb+RWo
         nEpA==
X-Forwarded-Encrypted: i=1; AJvYcCWaRBdtGEdTprNvLy7zzhmyEs0DxmpYordnhF2X7yVvUckvyvmFd0nT5vRjOO7kl0Y4qZ79tQLiYwJTM8eZHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5JcGNOAbaDCIn1NAEslv3PDHxQJaVbLjtyvio0CkBHEyHFIFI
	OPf1gs7iaYzTDtLSXZOs5R0g8Nfvy4YNiwdLPyzz4idahGKBnG+Jn7Kn
X-Gm-Gg: AZuq6aJ6KBCfp/EwSDlej8MrLxcRTINQGakL3oRxDi/9UksFrPftPOK9st+iZzXhkg9
	4lpjTK82bPeothObSfLdh4F149N/Z6CrP91LPnWieL4wwsk0D/MaYQpz4IycCGBi0G0c/2QbZPi
	3qADAQevB7507l8KQS0YY9PyQJoz/ChpLkKKaHdhmGwgCuTNW2iX4UBp7hjHFx1rU0Kg1JVzyaY
	XgHh/zxqrDkwwzNxLJULa0YBXOQemq3nnqKhYK9qzfgghwMTEvscgzsOb3z5JOK5dak8pAYZXPv
	92rtxnWUEAWJFoDGP/36FQI5FbRSLp+l19FBZ+LYm3W43S3cdr0Iyji5MQtu7afIDhC3hszcbr+
	0XAvWdgspanpsl6LjunfLOkmmltKPCrWvgkCsvzUbnV6zRt4w7Ncvd3sETuZwhB7/LgvnWih2pK
	D5CVsXEjOU0/TcJ2D+QnNoH9JPXVgHbvjberl/j/HUJQSFIXoK3S8c4kCjnv1ADP0=
X-Received: by 2002:a05:7300:4347:b0:2ba:6c13:bcc1 with SMTP id 5a478bee46e88-2ba6c1410d1mr525091eec.13.1770559272332;
        Sun, 08 Feb 2026 06:01:12 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:b70:255d:b0d5:dc80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855af7806sm5799442eec.10.2026.02.08.06.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:01:11 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] scripts: checkpatch: add RUST_UNWRAP lint
Date: Sun,  8 Feb 2026 07:01:10 -0700
Message-ID: <20260208140110.258311-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9ecadaa2-0f6b-411f-9faf-0ecc93b26bc2@gmail.com>
References: <9ecadaa2-0f6b-411f-9faf-0ecc93b26bc2@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dirk,

I have been playing around with the lint logic. It now identifies 
when we enter a test-related block (like mod tests, #[test], or KUnit 
macros) and suppresses the warning for that specific context. 

This handles the false positives you encountered in the Binder patch 
while still catching "lazy" unwraps in production logic.

I tested the scenarios laid out below.

Proposed Logic:

my $in_rust_test_context = 0;

sub process_rust {
    my ($line, $rawline, $herecurr) = @_;

    if ($rawline =~ /^(?:@@|diff --git)/) {
        $in_rust_test_context = 0;
    }

    if ($line =~ /^\+\s*(?:mod\s+tests|#\[.*(?:test|kunit))/) {
        $in_rust_test_context = 1;
    }

    if ($line =~ /^\+/ && !$in_rust_test_context) {
        if ($line =~ /(?:\.|::)(?:unwrap|expect)\s*\(/ &&
            $rawline !~ /\/\/\s*PANIC:/ &&
            $line !~ /^\+\s*\/\// &&
            $line !~ /^\+\s*assert/) {
            return ("RUST_UNWRAP", "...");
        }
    }
    return ();
}

Scenarios:

--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -42,6 +42,7 @@
     pub fn new_with_data() -> Self {
-        let x = Some(1);
+        // Scenario 1: Production code (SHOULD WARN)
+        let val = some_kernel_function().unwrap();
         Vec { ptr: NonNull::dangling(), len: 0 }
     }
 
@@ -150,6 +151,13 @@
+    // Scenario 2: Explicitly justified (SHOULD NOT WARN)
+    pub fn proof_of_concept() {
+        let x = core::ptr::NonNull::new(ptr).unwrap(); // PANIC: ptr is never null here
+    }
+
+    // Scenario 3: Already a comment (SHOULD NOT WARN)
+    // let x = something.unwrap();
+
@@ -200,10 +208,20 @@
+#[test]
+fn scenario_4_standalone_test() {
+    // SHOULD NOT WARN because of #[test] above
+    let v: KVec<u32> = KVec::with_capacity(1, GFP_KERNEL).unwrap();
+}
+
+#[macros::kunit_tests(rust_kvec)]
+mod tests {
+    use super::*;
+
+    fn test_internal_logic() {
+        // Scenario 5: Inside KUnit mod (SHOULD NOT WARN)
+        // Dirk's specific 21 warnings happened in a block like this.
+        let mut v = KVec::new();
+        v.push(1, GFP_KERNEL).unwrap();
+        assert_eq!(v.pop().unwrap(), 1);
+    }
+}

If this looks okay, I can resubmit the patch series with this.

Best regards,
Jason
