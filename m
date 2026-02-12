Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE49B4A02
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 18:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770919261; cv=none; b=VIBOFur97zUi5/Xr0xmjPtUeCCBGLrXbRRjH+I24kmLmLHvouYG2bblNB1s0bflepnNY2ohgwRS9XVyham23gGcsI1IjNE4HUdMHiwkDKZn7zZyckNg7vhdi5sAXPK8nkJ8d/olJZ1KrVS8p7PXJrUNwj9+tUUkgFRC5k0PiRME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770919261; c=relaxed/simple;
	bh=ej0RY+FuHEgA0KT10wzva5i8NGoO/QxeSqlWKr+amPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lIjtnxUjDi83QFc1laM3pzwMINpNZ7ANIbELvXIEYCG+Sepc8AhQOuERWfoU2pqUDsIY9rhK8LmX+dhV2eUVgNuBhYtDFu3dSZkfPnNhp5rquR3KaDBwnygw3/GZ+BZ/LHsAOEmcG3LSax0PfgU0czp0DyB4zv+Yp9a9Xw7dUrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3W20vMuD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3W20vMuD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so3235e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 10:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770919258; x=1771524058; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pl/cLN4GI/TuYiyS1grr0MRZDEkOTzvjCuNXUWtNefA=;
        b=3W20vMuDtq7cmxy9lA0FYA7cAI5TVzSQ3rKKRmxxAAdpvEoAX74hCvT0FHaG9WKS4T
         it50EC9iz19MzFCnvn41SpGGiuT6JXHDwWA3IIvGVGMbeIBRY8IZu5DH+E2HuEVwAMSn
         vZBMwQt2yWHWx9lAq0ui9yUs5Vxfd5iJqc4EkMs1AmpqiY8StyoPcjj6+/f6lBVhjXYm
         EJqj/UHFxl04X2r0HtUEDnl6hLcDTq0dy4RtFmH1/bbew2YbjvG1QgVsH9EVPNqmO2GZ
         ZEkvHwCYxJvDJ7AgzJaGyBwBmJ+ns9NTfNRud1gOyXEp/kWXTZd7I5WX6/jU8g9EP90T
         5kGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770919258; x=1771524058;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pl/cLN4GI/TuYiyS1grr0MRZDEkOTzvjCuNXUWtNefA=;
        b=mQZXMuafpTEHhEje7xHngtmWg9KBfXW/IT6ChucE5YjLgRaLdRohwyNW1/obSFSgQb
         qtk/zRZ9azi4v6VWjJHNReRMFHskW9LPlkjxbeV3is2F+vzPFQYB0d4DadoTBCEwMLgL
         Qgw5rWhPp6zWPlAiX6S7PdqytFEbv/0ZBBMgfQSo99+/v1LOJO+54lJum2BEmc1ER0Pi
         mVnFWc2rfiMVbt01ViDWirc+968DfN3LH7iq9pCzBTH86B3q1nNswdOIE2vtcGKDE8uL
         BmBMDgJhIlqdHXW/UzLHfxbDV2ynk7EJTYkchaUx+ZxG+Xtxz6RGBv/O8tzt07B8nIok
         tq7w==
X-Forwarded-Encrypted: i=1; AJvYcCU8gDqTuhjLm1pBYYe9coL1aXCDsWnzsXHO89k8ESOZbGfhXrVl7/5lN53Q+M9rajtWLSGZkVLfT0XZ2nHpoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn7kznP/AQbc5t8fmCv5ZqChf7VwEUrJql2VQACcq+7Ni9WM3C
	O8XyivNQAPATBjuJjI7w4rzy7ZC/7zHe2qU2jc+dWw2NzAW02oNQ1q6Z2J0kO2DbJg==
X-Gm-Gg: AZuq6aIk/+0w3AvakW9a128humhibGYcethU14whnf+y53DSZAA1+PV0TMbDNhCl0fg
	6KFVCs9qeDdLBarp2DkAayEUJWRyo3afBvrJOyYLo1yrVsOg1XNnuOcIxY/RwAUXSi5/L0LPBXX
	bWmXg0BLR0ISnJgCHu17LW84l3trZJuhvBIan4Q20LpdIKFyp11LQF3/HfjD+yLRAGkufF5Sa6i
	fSvl8X5PUflahe5B0dFicxdeWNuagoe9fcvGg9Mn0iM9TOH236WekjLb0ir8+AYdlN/CmsPjjGU
	WK11x1MsyWStI4dQGbIpDZPP8UqbTZ4Iv6Z7wZIJ2PyVJpt7awZmgLqz/kE+sxpRdQrzo7PcG3K
	Vw3XEBPyZGrxnf05GMwecvZYFjvQDDzBHd9/evCgRklQNTNpKAHS1jsOJX8lc5cng9YnnJ79hn6
	Bw6t+YUxfbG3cLY6/iTmJSn+XrO8r8km3UuON8LLkzjkrOu+Yp/h4=
X-Received: by 2002:a05:600c:a14:b0:480:4a7b:228 with SMTP id 5b1f17b1804b1-48366d1fd3amr875395e9.1.1770919257888;
        Thu, 12 Feb 2026 10:00:57 -0800 (PST)
Received: from localhost ([2a00:79e0:288a:8:11ea:f041:437e:7de8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4834d5ebd34sm221155765e9.7.2026.02.12.10.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 10:00:56 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Thu, 12 Feb 2026 19:00:49 +0100
Subject: [PATCH] rust: task: clarify comments on task UID accessors
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-rust-uid-v1-1-deff4214c766@google.com>
X-B4-Tracking: v=1; b=H4sIAFAVjmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Mj3aLS4hLd0swU3TTDJONEE9NkCwMLEyWg8oKi1LTMCrBR0bG1tQC
 m9qX9WgAAAA==
X-Change-ID: 20260212-rust-uid-f1b3a45c8084
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@google.com>, Carlos Llamas <cmllamas@google.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770919252; l=2635;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=ej0RY+FuHEgA0KT10wzva5i8NGoO/QxeSqlWKr+amPk=;
 b=ffWdWbX4t/7CwCD5OBpKK9/ns/QmKZruw8v3OE9d8/8pcSBK4yUr6RKBu64DgDZB98s6yN+QJ
 Gpkc4KnHZ4SB4ujrAnC3wiuo12q1RU3mD9beXkKUTmsSHYbJTPyhOtI
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Linux has separate subjective and objective task credentials, see the
comment above `struct cred`. Clarify which accessor functions operate on
which set of credentials.

Also document that Task::euid() is a very weird operation. You can see how
weird it is by grepping for task_euid() - binder is its only user.
Task::euid() obtains the objective effective UID - it looks at the
credentials of the task for purposes of acting on it as an object, but then
accesses the effective UID (which the credentials.7 man page describes as
"[...] used by the kernel to determine the permissions that the process
will have when accessing shared resources [...]").

For context:
Arguably, binder's use of task_euid() is a theoretical security problem,
which only has no impact on Android because Android has no setuid binaries
executable by apps.
commit 29bc22ac5e5b ("binder: use euid from cred instead of using task")
fixed that by removing that only user of task_euid(), but the fix got
reverted in commit c21a80ca0684 ("binder: fix test regression due to
sender_euid change") because some Android test started failing.

Signed-off-by: Jann Horn <jannh@google.com>
---
 rust/kernel/task.rs | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 49fad6de0674..33e6d44b9a15 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -223,14 +223,17 @@ pub fn pid(&self) -> Pid {
         unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
     }
 
-    /// Returns the UID of the given task.
+    /// Returns the objective real UID of the given task.
     #[inline]
     pub fn uid(&self) -> Kuid {
         // SAFETY: It's always safe to call `task_uid` on a valid task.
         Kuid::from_raw(unsafe { bindings::task_uid(self.as_ptr()) })
     }
 
-    /// Returns the effective UID of the given task.
+    /// Returns the objective effective UID of the given task.
+    ///
+    /// You should probably not be using this; the effective UID is normally
+    /// only relevant in subjective credentials.
     #[inline]
     pub fn euid(&self) -> Kuid {
         // SAFETY: It's always safe to call `task_euid` on a valid task.
@@ -363,7 +366,7 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
 }
 
 impl Kuid {
-    /// Get the current euid.
+    /// Get the current subjective euid.
     #[inline]
     pub fn current_euid() -> Kuid {
         // SAFETY: Just an FFI call.

---
base-commit: 192c0159402e6bfbe13de6f8379546943297783d
change-id: 20260212-rust-uid-f1b3a45c8084

--  
Jann Horn <jannh@google.com>

