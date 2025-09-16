Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0101DF261
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758026483; cv=none; b=a5CFAKvsoA8OrrK0SCMUd4nI8Z0CZEhk2Y7yJQsVoRfGEqg3Wm+MfkyPfljg6mD9DS510LKIgzAoexhGAFSrb6Slq3Bvz3Ok7QVxBb3/LorMWnAUC6/rXGKEXkMB/aUJpw0+Jwvuohq4TZSnImEHQrRdT5awnBBTMHSCBhBIiYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758026483; c=relaxed/simple;
	bh=iuY67WVePs9KiduC+k9AQZP60zJpeVxjLxorW0CY2MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p/amE2qQK+ZtKfWFqJlnIw4BSwLE+fyl8n1oLm97uRYgHZxF93rMtj+CizglT5jDybvD5DCrO6Dntdt9yDe/3el3OQxv5V60BUOSDLC7hgUlWS/FCDKHsPV4sPlpTIj0XE4DHA3EvquTSxl9F5fbSLLaGeqpYCaXQJEUJWvpUmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgGCR0PQ; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgGCR0PQ"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2616549b925so27155485ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758026481; x=1758631281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tqvSw+O2QuvnDz6ws7PU1PREoECQAI/OBK+RkGaDJo=;
        b=PgGCR0PQojYebOE2e2JVaOvKTutdVoeMy9HniSlQf5Kj0MtLreNrtD8fw9KSEvdkS0
         Kq2qPwogbZc5bkjW9ImyhwTmcY1+hwWeRjzL36DzanNpSO4nrJjq+me4JC8XDakA1gKr
         5TFVNDp+wtwfHbkFSkRS7+GJofGRI/pqIO7SuAw6MZXXSipCW0AYBaW68EtcWaqMMMno
         ZDwOueL7YZA87bqG3RQohNqlqkqyqTkcq8/pTxffRRQxWpg5MQySbN2FNF9ENxqF/i+e
         GlM5otOS28pnQECmhscGZglPJDGJxdAhtjPWteVdY3I/KIanS+oUJbD6iWAj86W1Ao0T
         nvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758026481; x=1758631281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tqvSw+O2QuvnDz6ws7PU1PREoECQAI/OBK+RkGaDJo=;
        b=PMKaqmOB5cB/d5T1nqUdCHgIAT8fNYsfQ4pyOCMe1QOZQmQvBSPNZRgN2aOLbhF/kB
         wEPnkOHqqAG+6QL+67WLrM94OmFle4AfZPngoQ2ax8lzGnbE007Nlnd955mzqDxbExBJ
         EW2uP2K8qk2aKMBCFy2XUiI7WGin3p179iqpc+6ivIQY4bvbAVftGfMALCnqI/KzuVb+
         Cf39TK1SSfQSLKcw7pFbWwJJ5ed/YjwZ7aRf2PLsXA0m7EMyJGEDBenSr9HdhA+eH8e/
         MKeHNXf2+vovBRhof0gLATTJ32BH+Q+ivWnXdDsY1bIKkzx/k5SOjUBLP4h+Viijw8D4
         iRJg==
X-Forwarded-Encrypted: i=1; AJvYcCXETYil/fkdWmHL3H/xAlDd3quVcoA51zcPdrsBpxtfPb6HvCOL/bIqbEwwet3w21881PrcmszDI9NEIVCJMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzym4d+XrFLE0MMXQlP5CuubmHJqEL8mQ6gIQEG628avnv8cWAD
	+eK99tPkwPi2OGJ/gyzFaGunA2CVfnR5/lpdH5nIjGKAYfRETh5VokADISagxum9u0T7MPQ=
X-Gm-Gg: ASbGncvQl+N8afJwr2lnm7ySeZqVD/0CmNwPI+fUPSNnnG5FKQ2O8QZZVJy0c4Il9+V
	fa+1MRRS6V5m+W1v/QfkPp0ZrJn91wIf/RSFPQgihduYsUXWE2sGpVd78ZKQUY1lFHzcWMwbb/n
	eTLxnRrg7Ti3B/U3Mv+S7otaNWhsyEEH4bODhArTfy44ctif4VQP8e+UagKmMBBQPEJjdYqo9QR
	Wcjw5NcnL5EDwbgGYq3zuvuQ03qtr+Qo0Dj+T05Zs3qLP6AHNNHHiNQlgAZkiiglM2CUigeAGpH
	wk+aNwpTM1RP22oGoCnbuaXSojRGpZ0mLNne03WGN8Sm3F3oT+21uNbVy0c8Luy1sQdX2xiSY6z
	0z/u0ZKXjqfrBR4itR2APlHoF6dSvRUIGzSllq5Aoh5J8ja5L1Ao0K2Yl+l97XOwgACWxbyw7dx
	002kqG1uYkhtaXUQ2qxz0/
X-Google-Smtp-Source: AGHT+IHgUg6djFhXrbzUFkEtt+EVn1UGwMgH0i5j+uCXI/1jMyPy/YHcFq03zuX4cZSzyNY+bhbKsQ==
X-Received: by 2002:a17:902:d2ca:b0:265:ff71:401c with SMTP id d9443c01a7336-265ff714151mr102482135ad.27.1758026480624;
        Tue, 16 Sep 2025 05:41:20 -0700 (PDT)
Received: from codespaces-8c10cd.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26175efc667sm97050945ad.112.2025.09.16.05.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 05:41:20 -0700 (PDT)
From: JaimeF <jaimefine6@gmail.com>
To: gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaime Fan <jaimefine6@gmail.com>,
	onur-ozkan <work@onurozkan.dev>
Subject: [PATCH] rust: auxiliary: fix "initialialized" typo
Date: Tue, 16 Sep 2025 12:41:02 +0000
Message-ID: <20250916124102.14182-1-jaimefine6@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jaime Fan <jaimefine6@gmail.com>

Fixes a spelling mistake in a comment: "initialialized" → "initialized".
This improves clarity in the documentation and avoids confusion for readers.

Suggested-by: onur-ozkan <work@onurozkan.dev>
Link: https://github.com/Rust-for-Linux/linux/issues/1187
Signed-off-by: Jaime Fan <jaimefine6@gmail.com>
---
 rust/kernel/auxiliary.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 58be09871397..129eae8ff2e7 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -317,12 +317,12 @@ pub fn new(parent: &device::Device, name: &CStr, id: u32, modname: &CStr) -> Res
 
         // SAFETY:
         // - `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`, which has
-        //   been initialialized,
+        //   been initialized,
         // - `modname.as_char_ptr()` is a NULL terminated string.
         let ret = unsafe { bindings::__auxiliary_device_add(adev, modname.as_char_ptr()) };
         if ret != 0 {
             // SAFETY: `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`,
-            // which has been initialialized.
+            // which has been initialized.
             unsafe { bindings::auxiliary_device_uninit(adev) };
 
             return Err(Error::from_errno(ret));
-- 
2.50.1

