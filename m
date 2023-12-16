Received: from mail-lf1-f73.google.com (mail-lf1-f73.google.com [209.85.167.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0129B30356
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Dec 2023 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m8Y3+oUm"
Received: by mail-lf1-f73.google.com with SMTP id 2adb3069b0e04-50e30efbcf2so43471e87.1
        for <rust-for-linux@vger.kernel.org>; Sat, 16 Dec 2023 07:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702740712; x=1703345512; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n21sZvx4OGz0fMgIbSc81FSV19tv9Tbnfac5je6hStI=;
        b=m8Y3+oUmLqKfjT0EcFYFUxcsv3jKvWJdMInKvCL/SSkihaOFi8KAPuuvicPlxFw/4h
         rD/R2MV0DmqJ9a6oyXo7s0Ny3grC+QoGsYXGbuVAuonST1a1WlXIiiwCfxFBlk8B494u
         xRYWn6OCBD2AQvgv5uZmkHJD+jo8u+VPpUmS1H3MKTx0izb+RCC/normYydep16boR1A
         CKHplCN3jZlE11upMPykQ+HoyyJxJEn392FMCYfo3R1WIktn4XJbdsEh/R3JPG/jrpPv
         dYZ0IVFs2BDguI/7po7j1EET1fjUDIqEaZTI3Y4qxtl1FixYXM43zAHBA61Wwt9R0iDX
         xghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702740712; x=1703345512;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n21sZvx4OGz0fMgIbSc81FSV19tv9Tbnfac5je6hStI=;
        b=rpOFhQ2W/vAXiZK+iLsldHJZnjw8yQDnrwimjENxXMvCXnoQcs6z30CJQM8XgdL2ZW
         YvQs1/tyjM2QMEHjoUHnAdzHYO4TvRRxF5lAguaj14b7tzxrz7klhb5tstxolCge/XSX
         jFGAm2bsC4W1JDS4IkZQpJNv7MPXFiiAzMPJO5KdczRcu9y900xY+077HmnYuQO1IHpo
         LZWlzQCm45s5EWyaVW4a/8bhLtmtzl12RItVs/TQ0QUOeplLjPaDIBeFFXUEGl0I7ONe
         bcOSRHiU/s9Z3ptntLtoU5vQmqvgom2ZUXFwmUVqneMssY3KfZL1gcjcZw5HLp04LxnS
         n4NA==
X-Gm-Message-State: AOJu0YwgesJOJwfny94RPMzhY1mA29Bv57tnuLJoO7dCYoy2z0HuTd10
	ZP0AdeLSnuqum8Id8iDeQWPX9IrMfSPhceI=
X-Google-Smtp-Source: AGHT+IFPb67LbaPE6VM7e+gjZkusqwNzggRxuRvHf6JAMNULNkMI2Zdv1CznDmLXgtlPx/vQv8kTuZ84bMJe+jc=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:118a:b0:50c:21d8:40da with SMTP
 id g10-20020a056512118a00b0050c21d840damr273029lfr.1.1702740711767; Sat, 16
 Dec 2023 07:31:51 -0800 (PST)
Date: Sat, 16 Dec 2023 15:31:39 +0000
In-Reply-To: <20231216-rb-new-condvar-methods-v2-0-b05ab61e6d5b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231216-rb-new-condvar-methods-v2-0-b05ab61e6d5b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=sq4o+0fCxkYUC2mgTGvD+vhZ6Pja4Fjl7gEOQStlLeY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBlfcLf7qSifHao52i6f1nLRLHyYtY4Wn5qsuFpj
 TxPIj7uwFSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZX3C3wAKCRAEWL7uWMY5
 RjJRD/4nBUX0NzHvzLrX/JKnInVQ1ftZ0lCrZTOqIzVNp3nZ5eAoilchBKaN9oS9VxiWwpjJpQ5
 LyW/kPMb2mqVh/qRKz82S1MjhDHKQXy66HQ43BscfEstQEgIj+hxNWJ+c03r9jpXTjo92s4WPM8
 CUM3Dc5ojYbE4IGW+5xi2KnXTCiRomyWmmxrJpNchhQ9w3TNxkxFwHsDD/gWXMlCJvRC2VnPnGY
 HUKLB4S2cruSCqRFQnkFhSBxfo0BME2OW0VWzhJUiHG1rp0yjgYjjApMFfPwghwUcHqKWvPsDvW
 1MsOc5CbsN06/WNCNJz956fVkSRrm03cxbRlG4UuuZ9wBKOj5ePmYSkN47e5HgsvYPKyASjtPp4
 W4FM4V9TPqN9d9RubDZCYsAzS74AMtzOOdcPoC40k6kFmiSBLh+RZnk3bKw4HPrnH45ZgUqaRch
 V9BVCM8G5p2ZhroNbe4FOt1ek56hhP1iftlgzESoNLUA/7+tH8ULFeIfNOjVAaSPx/YO85eLZE/
 xFWkTbzFTFzD+tYvYVbOmDPbTMFY+TLFvMHjHMZf7CXqD42DsM3O3hO8oPmd2N81WawVLWE19WO
 7UHAHYzQmOfwHYx7DstBYzg1pnkJQgJofA646MiFp61+oG9lfeVh9gKMFuabZlnv8jynOaluQYi tV0RYgXEtK0WPzw==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20231216-rb-new-condvar-methods-v2-1-b05ab61e6d5b@google.com>
Subject: [PATCH v2 1/4] rust: sync: add `CondVar::notify_sync`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Tiago Lam <tiagolam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="utf-8"

Wake up another thread synchronously.

This method behaves like `notify_one`, except that it hints to the
scheduler that the current thread is about to go to sleep, so it should
schedule the target thread on the same CPU.

This is used by Rust Binder as a performance optimization. When sending
a transaction to a different process, we usually know which thread will
handle it, so we can schedule that thread for execution next on this
CPU for better cache locality.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/condvar.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 8630faa29b78..9331eb606738 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -155,6 +155,12 @@ fn notify(&self, count: i32, flags: u32) {
         };
     }
 
+    /// Calls the kernel function to notify one thread synchronously.
+    pub fn notify_sync(&self) {
+        // SAFETY: `wait_list` points to valid memory.
+        unsafe { bindings::__wake_up_sync(self.wait_list.get(), bindings::TASK_NORMAL) };
+    }
+
     /// Wakes a single waiter up, if any.
     ///
     /// This is not 'sticky' in the sense that if no thread is waiting, the notification is lost

-- 
2.43.0.472.g3155946c3a-goog

