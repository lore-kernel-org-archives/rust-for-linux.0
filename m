Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89AA30BF58
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758025439; cv=none; b=E8DGZsJ7Aw/aebSq4Vr2SNhqp2RWyG//BB5PpVUY3MwQH1VhK0Yj9D8oMzAssnVuC43GaCDmC4DOgHIrD15FOuT3HWRv93d7zGvTGa24OS/vQOa3/QKqVBAQO2GyoqbuHTZJdcMDpMyVyhCIsvCTPthYRCapee2Zm12R9NgicDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758025439; c=relaxed/simple;
	bh=8d+4DfcEU7DAu1276J4GsoKYTHfENDz0N3+uH7rn4hk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYX2LwQ6tS2iztMsfwjM0Akpk7QaFn2WsnRLwzrMYJqhqqTlWZONt74fvtxfyKDs3yJc0rgD8O2kOCd7ojaoIp/XfF3lTeFIwPM7Z87X7QuxkVdepeT/VF7XBhp7FyEFiBUsQbKHzncX8mk2vjqodyM6zHG37Etz1xXzzcwVxKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4QDVoUa; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4QDVoUa"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-776df11e5d3so3203057b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 05:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758025437; x=1758630237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cc9kbkk9FnY0voi4C5nTgnXXO4+ZBLvRjU3FYwX/xJ0=;
        b=e4QDVoUa0bSegwVfrCWH3f6cRJgTsjHBox6x+P+br4k6GM3nwSaV1BVqs/XXW+LPjV
         YyydN4y5rqVQjTFeI7GkRqUuzcrt2BVryIV6jG29qiD/Aden7CN20O5QKbbIlYuA8aoM
         LfGrrU/GxArHtfJov0kwnWRDCNuT2UW4CbHyG8UdzgUNazCoVhI3ZRQcoSt40VuXzzH2
         VoIKG50ejqp+BKvJXmK2TIqtVbTaO3Y+fIry8rDzvbXXsAmK5792VUiY5/vFqAdB8bLR
         HOx8cgYDQ804o5f7pbGS++A6DBNxlKbADGgP67yQh1e8ReHsW7psg1NMgjArX0eOsyEB
         jvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758025437; x=1758630237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cc9kbkk9FnY0voi4C5nTgnXXO4+ZBLvRjU3FYwX/xJ0=;
        b=MW2ioaTrZ0VYi0+zmsyPIiMgKaK66c8GV8vwDX5kC7Qtz1OgQkCBEV3+lJwkW5e1NZ
         TgNsh1MlwjmGVEPnKhUKWp56GN2bPDrltzcYXFQZANuMxpiCDEGH+lYsH0eKGaf2GMbk
         MoopEub5FJ7Zk+RzB5GYZdvUaelnoxjgmKG0W6B4RafjDZnHp8d1D9tEti1PN8fLozSX
         8Ln3bB8PPgP3yYLlE98D+94710u7n931XCBGfUJItDdvqVxlc7AIK3xc8GnAABbUCXK6
         kEWJDpNXt5q8GGE4Qn11GfraBn0YytEYO24bJE7OcKP64WBhcGNGqzL5pXsLlq9XIEuI
         6I+w==
X-Forwarded-Encrypted: i=1; AJvYcCUAOSnQKgJ6ecGm1koaM+JT/VqOayDp5DhjuRgPaFzGoOssS7Z1nFosKx3DaO6lBqZ+nv09Y8gRt8+NAvaXlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy0RfE5lADM1p6DqNjlN4NCI6mE8VOHIOD5/xhmLXrf9I4VFao
	YaXqxjd8LzliYhz/y0Sne7pdo1MQ/3veHIJVLRBFKhVWkCHT/skNy4Q=
X-Gm-Gg: ASbGncuG+l9Hux+XCW4vCpYwYBVhLJKv6NjgVcBBJ96k6CwI0w25n2j57mQZ7+NiSdE
	RAxUTx8zCY/TLPVzM7IyMzpbmDfIyRosAUSxSaPrH7yW4bSlTu2DyEpP6UAsJJBv0AS6RpM54wr
	lphbH0PeOHoSQRC+/C0edxYDBICJvt/it35WITAMSC4fcuEvlRcl+XvfSGIRWcA4llaZfZ63kXZ
	ck9/cgSbpR1Qx/y8cMW528GzULg6bE+9MKgJF/e8eoj0XdbWzMxwOauDCJ4vkIoWoumN0d1AMD3
	sWayay32X+tm3mbbRLCyQeqiShTlGNu6ziMYw3G9j0QemRxEbtRnyxrPnkCAFmWBOBJUi0rmATN
	dFbf1zgub6O/hlP9m5TCOOHbWZSs3iYDwag4nTiaAsZIeCvO/5VejRjBCPyZnUbbO8q1DM/7ptV
	LAFqlCcYSQsztDeTC6EOUL
X-Google-Smtp-Source: AGHT+IHtIClX05RqrDY5XgKAP5kdxB+/MutoSmf2N+uMhCBjW38bSKPehB7NjHoVU/+DVjIGwHNoEQ==
X-Received: by 2002:a05:6a20:3949:b0:262:af30:e5c with SMTP id adf61e73a8af0-262af303ec3mr13938156637.26.1758025436979;
        Tue, 16 Sep 2025 05:23:56 -0700 (PDT)
Received: from codespaces-8c10cd.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a36bf815sm14506851a12.15.2025.09.16.05.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 05:23:56 -0700 (PDT)
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
Subject: [PATCH] Fixed "initialialized" typo in auxiliary.rs
Date: Tue, 16 Sep 2025 12:23:03 +0000
Message-ID: <20250916122303.3364-1-jaimefine6@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jaime Fan <jaimefine6@gmail.com>

Suggested-by: onur-ozkan <work@onurozkan.dev>
Link: https://github.com/Rust-for-Linux/linux/issues/1187
Signed-off-by: Jaime Fan <jaimefine6@gmail.com>
---
 rust/kernel/auxiliary.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 58be09871..129eae8ff 100644
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

