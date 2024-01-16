Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152844439
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 02:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAHlCFtW"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbed788aad4so8058486276.3
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jan 2024 18:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705372158; x=1705976958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sH1laFDXk8hrp02MYAWXRBWi+RFxD938wv+nJX6Eg0=;
        b=XAHlCFtWhgIxFGob3k4qia4cQRqkt7O9/CVtU1Sue5wB++t1puYYG2KdEP3qjRA5d4
         z5EXSgChZtzEiCE3Ywpv1kwh2/YybJUQo+f8zY6ttsUkKPgKeO5oce9okfWVKtsrKtOf
         4zzaIsJgrkiJyi4dIlZyij6fNAa+7QPxttU2J2JSWnLN0A/LZ6OQuSd9iL20mYOGZASj
         paIBpiJMf7D2zxg6Hma2zYWRilHNhCI3Zg3oN5XlCkGZTJg8and3mcAWak2F4zKmkaRW
         WS3Afi8JSS2Z/fE68WJY/pUjVJVwB9tKDLyqEnwsyx70aGJnrr7TuJKajJGHpYSGAJtq
         73UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705372158; x=1705976958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sH1laFDXk8hrp02MYAWXRBWi+RFxD938wv+nJX6Eg0=;
        b=Ps0b4a3WRgudvSFqzL6Zs9CdQFZTVMufjyd5mOje08Y0g+JuU7yffdxlGMMX0uGVBR
         BrQ5Lmnp/fEZ8+ezCEIxjMsJC4cUPM9RhIPDkuPbZXD2QgtMq+X/ofWpsvEORlMQ8+d2
         CAuy9BZcb32Q81w4minZrpxGrtNiFK0BzSUD25RlZuJTqiytp2l3E3mIFC7ojTgUSstW
         xERm6itt5RNB4sdJ6RK/1SKUccAMJxmcPyGm/5xc3uBHnHcaA801HpZjVTFCMgyhlwGt
         8KxGaX6uXwnr+0b6goL9TOXbS7Y6aBEty6Hj6aIYGn7Vyh8XYkxOf5jOTmhVn9J8Gk3S
         3n9g==
X-Gm-Message-State: AOJu0Yzkgt+Dx8OBJVkNpTmov7x5HhwTEV4IHHWh34+L13TlHFYWCIW8
	3CISYcJhACOX5HY2WUWbzwU=
X-Google-Smtp-Source: AGHT+IEkfD0m3h5fZS3ljxLh45bASXrSJCGMHYTykxwG8ehqbo2Ynlbts7UQDPOL8Q6U+u44GnFSUQ==
X-Received: by 2002:a5b:90b:0:b0:dc2:16d7:22ce with SMTP id a11-20020a5b090b000000b00dc216d722cemr938928ybq.115.1705372157959;
        Mon, 15 Jan 2024 18:29:17 -0800 (PST)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id m130-20020a252688000000b00dbf261d3fabsm4039460ybm.33.2024.01.15.18.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 18:29:17 -0800 (PST)
Received: by Machine.localdomain (Postfix, from userid 1000)
	id 78DBD6A40038; Mon, 15 Jan 2024 21:29:17 -0500 (EST)
From: Antonio Hickey <antoniohickey99@gmail.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com
Cc: boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	Antonio Hickey <antoniohickey99@gmail.com>
Subject: [PATCH] rust: task: use safe `current!` macro
Date: Mon, 15 Jan 2024 21:28:23 -0500
Message-ID: <20240116022823.64058-2-antoniohickey99@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116022823.64058-1-antoniohickey99@gmail.com>
References: <20240116022823.64058-1-antoniohickey99@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the `Task::pid_in_current_ns()` to use the safe abstraction
`current!()` instead of the unsafe `bindings::get_current()` binding.

Signed-off-by: Antonio Hickey <antoniohickey99@gmail.com>
---
 rust/kernel/task.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 72737f5d86ab..ffe08c348b72 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -168,8 +168,9 @@ pub fn signal_pending(&self) -> bool {
 
     /// Returns the given task's pid in the current pid namespace.
     pub fn pid_in_current_ns(&self) -> Pid {
+        let current = current!();
         // SAFETY: Calling `task_active_pid_ns` with the current task is always safe.
-        let namespace = unsafe { bindings::task_active_pid_ns(bindings::get_current()) };
+        let namespace = unsafe { bindings::task_active_pid_ns(current.as_raw()) };
         // SAFETY: We know that `self.raw()` is valid by the type invariant.
         unsafe { bindings::task_tgid_nr_ns(self.as_raw(), namespace) }
     }
-- 
2.43.0

