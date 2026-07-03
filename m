Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD3D38836A
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 06:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061836; cv=none; b=ORLaqRGIl8r3Mho3frwNSDrpTz3DvFeDcvBb382pEivYLMd7S8O2zY6MyfRLrYIpsgBkNVH1orVLbQyDT8+u8TqsjKCeQSmd96HF/81Y2m/x8KjhfYwn42qEcklpQKNSlGk4FgAXMztCSLIxRd+S8o5CrE69hiW3+4n9tSDVJXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061836; c=relaxed/simple;
	bh=zu+IOxXFKrGNzkLXkE06hfNESRivhLz8Db53LMrXkPs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SeaCoaa9oN15lrs+8oZbIYIiwDXCgOiapVICTDI9rLEAfMnMxiYqXHB8MQ3I1Ma9fu4t8ElPoq4xo4TxOOPkrM97XV1IkqYBi3uD2lehoaFcXT3CVDS11jkuECNa8H81Fds6c3QMmV/vSpfakonmIZsVXh7Uhs8cMR2i740v93o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r4p+/K1l; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r4p+/K1l"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-698aa7d76deso283285a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 23:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783061832; x=1783666632; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HujDRhpSl/ullH14BHuwOZTRSH3cQtgUzZVCJi2HQbw=;
        b=r4p+/K1lHt5gxfQGvRahZzexmXD6fXh2HClpHhUmpT4lvCSCojCnK6Zkgu0jD06844
         Z/CAthGrhAwAO/J7+JK2IKmATXQoUi2Bm8BfZRW8xtZ1QKp4oAMPXzHwKoMqW7/gfWwW
         MQzhSMHYRwDaMxciJ3OrOI+Znp/hTQZ7aBmjOH+w2zDPKnNrTc62qryOly5JvSTuVkdr
         IuwRdnK/zUQRrc2ZW3L5HhTriI3XfowebIWq7bDff1PvyYF8TkJORa1DsiAhDdy6zXUf
         LKc8rcrK4H5xyGqX6AGcgGea7ohmmHColgM1L1/Wtyi1iKS54L17tbBZXrn5aqeTmHOV
         KY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061832; x=1783666632;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HujDRhpSl/ullH14BHuwOZTRSH3cQtgUzZVCJi2HQbw=;
        b=FPwJCvoEKYPPnLDDOV7HisYVTYQxbMNLI8oBuNXbyQzga0yeSrCxdNv638bbZWVEVu
         DY9r0/Q+S2jGOB5CCEq1kMfmCQFK3qYcpQ/ZbLuNe1ksUkaFEuJemTWFDrwFuVnHNd5I
         Jh912RhqmpqqOXiSs0/DfMwomvQj8LYjzdBp2iVh8MJVuTcLjhQ2XzUFflc2Orpz0VMo
         mWLYDJv5B2cl21+o3m3kL3tbgkCoMwtC7yyrH5GkqrNpFTxe3zltdKHY9IkOANpwiz7T
         UNmofdWBC/nAo56bmx2QKTQ5Ylcu7pLrHq7qMPFWTp0WjMqgH1Lm6IXwNuwgAn6JywJx
         5Mbw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0MNf4nReoqNKIoIqXSDKK8QU60u8LicHPx8SDERRJIfVSZCmMbK1O68JNnVkCHN8qwzlgXZJ9s3BmDzowvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJO6rdv4IsuNqlfsN7s4bM3okoLa1bTxv7ILe729RcymRex5+j
	nnzkKH8vAJf8Fk2E+ZMSzQyO7FFZ3N3MqpMUfKoSqbMjeDsmYieEG0zry7BR+4P9djOy5AW7yD1
	+CV0NZetpOYbKM0AG7w==
X-Received: from edwl16.prod.google.com ([2002:a05:6402:1250:b0:695:64c5:a8b5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2b91:b0:698:81ab:c61a with SMTP id 4fb4d7f45d1cf-6989f37807dmr4111766a12.23.1783061831877;
 Thu, 02 Jul 2026 23:57:11 -0700 (PDT)
Date: Fri, 03 Jul 2026 06:57:01 +0000
In-Reply-To: <20260703-remove-task-euid-v5-0-c90c7e2ddf54@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703-remove-task-euid-v5-0-c90c7e2ddf54@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2920; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=O6D6AyOElcbWFraYT5ffBZVrvQPqocycYP2c00vbVaM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqR11ES7i/LvNhPgiyASlEW4tbM9A5oYhb+1smF
 NYdTM6OPQ2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCakddRAAKCRAEWL7uWMY5
 RjuXD/9O2+73b1AZgC+/boV6XAffWK+Q84nyvgN9n+B2Ing5nch/7PQPvDnTq/G57xnMu+Rdlf0
 Dt+yFG0pzRQUUDhsKXtMGvBHrLSm96bjOE8e6rLM/bQmntBIv8DCgM/9LiNv+VkgINbbOOF1PZ1
 t/3g33m6NZd5wz/RD3+kkuXMPD+bV/R3Ob1vM1ZFNn1WPZrX3h6nj34znSvhTsZfLNS1W7NkLvj
 o1rRr/pkoxaOn9iVaCOFBg10OKX8dUvBcl5qBj6h8hf+YHNuLTBvNe4THbJTytIszcbyD9fEcBY
 86yxFuRUdyf4ZcBCyaDzX02sr/u6gaws+XkzMwFjBFbcjylLHp1Jpndg9lZBKnoa00vWTsYu4VL
 0yhBidBXZlqG/AVRTf+XSTb92JBhpxi17o+8703uBb8zhbaQbuR2l86yiErv5sycx/SG6icaFY1
 W19y1ulbei+jfyxJ9QzqDD0tvLLFy+S6mg0HPfBGsNzisubaBVjcNl4V/NfVssrzAc3NREtOGXd
 XTQZDSz5rZ0rKWSiVnDidWzHyUV3bFv6IaeMbR9rRRlHY3IEoBzOTpH3qTqhSX/PNp3u27ifaIm
 5RkKkLz0LJpPIkh2FUxZyHxl2wn6nBcZnmSnbf4BnkphUzFqV0VfYPw3IjHBnzsY5scHkrs66Ee 0Zr29taKoZl8ClA==
X-Mailer: b4 0.14.3
Message-ID: <20260703-remove-task-euid-v5-1-c90c7e2ddf54@google.com>
Subject: [PATCH v5 1/2] rust: task: clarify comments on task UID accessors
From: Alice Ryhl <aliceryhl@google.com>
To: Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Jann Horn <jannh@google.com>

Linux has separate subjective and objective task credentials, see the
comment above `struct cred`. Clarify which accessor functions operate on
which set of credentials.

Also document that Task::euid() is a very weird operation. You can see how
weird it is by grepping for task_euid() in the history - binder was its
only user. Task::euid() obtains the objective effective UID - it looks
at the credentials of the task for purposes of acting on it as an
object, but then accesses the effective UID (which the credentials.7 man
page describes as "[...] used by the kernel to determine the permissions
that the process will have when accessing shared resources [...]").

For context:
Arguably, binder's use of task_euid() is a theoretical security problem,
which only has no impact on Android because Android has no setuid binaries
executable by apps.
commit 29bc22ac5e5b ("binder: use euid from cred instead of using task")
originally fixed that by removing that only user of task_euid(), but the
fix got reverted in commit c21a80ca0684 ("binder: fix test regression
due to sender_euid change") because some Android test started failing.
It was since fixed again by commit 65b672152289 ("binder: use
current_euid() for transaction sender identity"), which uses
current_euid() instead.

Signed-off-by: Jann Horn <jannh@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Originally sent as:
https://lore.kernel.org/r/20260212-rust-uid-v1-1-deff4214c766@google.com
---
 rust/kernel/task.rs | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 38273f4eedb5..eabd65bfde12 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -210,14 +210,17 @@ pub fn pid(&self) -> Pid {
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
@@ -371,7 +374,7 @@ fn eq(&self, other: &Self) -> bool {
 impl Eq for Task {}
 
 impl Kuid {
-    /// Get the current euid.
+    /// Get the current subjective effective UID.
     #[inline]
     pub fn current_euid() -> Kuid {
         // SAFETY: Just an FFI call.

-- 
2.55.0.rc0.799.gd6f94ed593-goog

