Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536CA28850C
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 06:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805963; cv=none; b=V22t3OU+1qGxPg6GfAf03WEfNYU58cuWmO9bAf1cGuoQgndWWP/8cRP+wGxUgsaWNyXExueg1cVwGPwooRY/DGKAT9OFY4F1gvGc9yMQRFd/Hs2wToJ6I7NxYF8fBzwf+AxKksM1v+hvSjaTBHZ2T96rAGk599OaXWAv2zQ40ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805963; c=relaxed/simple;
	bh=dq4EEoCw+67yQU8fR515AtIubgN5O1i71t3sFWX9JN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzlZpBfcL06OwqMNbJD31Wm2OGaVJXBXtF2CUnQXx7JiIq5JOVwN4ykciBTA42JMMu6YmhXTVzuZ3xZBQ6iqopBaraZEIWlqBHq87wiyMKZ/9kDh+M1/QHsQLFbxHDuGEbS/UCufvW4pfuMKoyrrrLIaEMOS0+C2LKj5af9G5P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f416c0473so3352170b3a.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 22:59:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768805960; x=1769410760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0E+O181V8JNO0qwlnrPEECHeekzJsptwjmVVwr5k+r4=;
        b=Kk0etwr9FFYE6fRwXqMjJjqrgn5zWiUv1H3XN1n8ji/DVBaTjOvNSPould28f6wY8d
         Uf1zl0qj9YSu/9piRii1i+CE/UsHGPAReW8l5EC2Vkom2c0F0irT6NSRYVb+WLCv3npW
         yj8wmgLkCw8ZV177T18es20jwunL8NUWp7XzXldJhBhs+TYJWCoeZCec4ub6fnvIxR2D
         po53aaIk29EqQau/1dNH8K9t/pfVmjxAO+ANZBXblPPHZy6fWewK7A753IsxieyKCstv
         tQCO5JYLDqZQ7lXl6/OfCHzlQFk/eJDNBCC+5vKAY43uwI8N7ibQrDsk4LgF4WAS6bfO
         nAVQ==
X-Gm-Message-State: AOJu0YzGgV0sLWZh0+S+cBZPsr5OOg6tZu+TKJc7OQsPOKQOijZT4oI7
	NKUeUJv9jaqXLC75LAFpI2MidgnbYNWIkaC2UnivVkf6sd1nNTTlsHeOsauNbwJE
X-Gm-Gg: AY/fxX5r3HELp/TADABsGWSgY6pXQ57eFdeCDjvFsrnbTwalGex4TdqA13rINbbHF8H
	DYVUl7kiWIcZ2msJi05UCbnZ/LTP6O2nrA6OEG3yrmW0JiAcJAR/WfqDfI9GFVmbqiwDrAqQ9vN
	DF9j5s2E9eAkWSTFulJbcuL2UKT1TOS2KljOJ7+s72HoQWmVQtYy6ZyWcjUi+I4ybkAY+9fZbcq
	fBHSZCeYilblwUWkmdp2RVDqJ6wNMxNPjuyf9RJknHlHowUmgMJsQ0r6yJG1LJfvNEcT1ZxAGqb
	ke/Em6RtqO7YlcuGiPs1Bo8Qunn79QxRxageJrHAN4qjGOBKcaixKiuq+ObZG2cQRmAitVdNXFq
	HWdHWMjmoZVGzuGzpN8Yg6oNPHgIqcpUu56TAOeVzabhtpypVQo7QgYR2fjUo17inBXnBUDqCon
	jugPZdeWCkSDyNePb1VumB1yYkKdsNUfnZJ22iwqugyjamAgOMy7gGbSU=
X-Received: by 2002:a05:6a21:1493:b0:387:5daf:b302 with SMTP id adf61e73a8af0-38dfe7c6758mr9631113637.65.1768805960201;
        Sun, 18 Jan 2026 22:59:20 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d82fsm8161979a12.19.2026.01.18.22.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:59:19 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v1 1/7] rust: auxiliary: use pin_init::zeroed() instead of unsafe zeroed
Date: Mon, 19 Jan 2026 14:58:53 +0800
Message-ID: <20260119065859.1914178-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119065859.1914178-1-sunke@kylinos.cn>
References: <20260119065859.1914178-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
auxiliary_device_id initialization.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/auxiliary.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 56f3c180e8f69..d3e94a78c9340 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -112,9 +112,7 @@ pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
 
         // TODO: Replace with `bindings::auxiliary_device_id::default()` once stabilized for
         // `const`.
-        //
-        // SAFETY: FFI type is valid to be zero-initialized.
-        let mut id: bindings::auxiliary_device_id = unsafe { core::mem::zeroed() };
+        let mut id: bindings::auxiliary_device_id = pin_init::zeroed();
 
         let mut i = 0;
         while i < modname.len() {
-- 
2.43.0

