Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBB63C9EF0
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 11:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784200872; cv=none; b=cns66SF8Oev/zqpeAWNXAKaUkwc/8OqvT5l6VVMDOoie1Luj23lb6b6ZwDCvsPK9ee0EnRD37WqXwcJ9GaPdW0rDImv0pQ42NUVVEBPnHG8F27uMctBla9L8DIP4vQOrNYo5rnGJslayHzT2HBBuOK7Xkd6rhUUo6ysp+PFBsEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784200872; c=relaxed/simple;
	bh=W3NhSWg0tsprk47tppJWMR8YMpbznk/oMdZuD1IuwN0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YJkUYMPdgAvAv7IdAfCkcvoRTsnVZ9JgNAS0s/2xn8T8JGDl0A+XaiqmrA+lH+El+uz7hUk6WqrVOAbG54dn6EHhzXwH7TL3bXojL2TBafNXlgRelr+vGuzizaBFa8UQiZsJgITIaiewleFZ9fotrKtO86xTTvpL8XJ9v3Dul4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I5aOWy47; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I5aOWy47"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493ce08a6b4so59209835e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 04:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784200868; x=1784805668; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpOqwCIEUbEle4X81KofeBhY9X8cgtr1JlUxywJZ+lY=;
        b=I5aOWy47cylq6rl4jCxdEnv8GzQAE8WpzT/cTfLp6fJDqWTvkmY2EpMs1jvwT3JkW+
         fUJPDCGAOihJDOLvSYR+FCerVqUzFjJL7GJWMfkn3e5MV5qOYAJu8zgTPQyHlBffOVGi
         7NeCGdCUrnT0pzcG7xTWCKIfII7Fu2u3hRwKRkyUK6zWy3Y65suaZ/Nk193A0mDbvzs8
         gwVwnTiBRnxX9PgnwHbZn17kK42vx4KcTTnt55dj0XjDRoY+Zkz3M3oAgj3G4NS+vnv0
         ao9OH5QW5QznjpLEklrer/9lES/q4Ra8YuGCvpccdUyUvdwTuJmS+DzY25pPRjuPlJtK
         YEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784200868; x=1784805668;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpOqwCIEUbEle4X81KofeBhY9X8cgtr1JlUxywJZ+lY=;
        b=BK83Hk6iyM+HZ7UxKj0JdwCgbGIUOk/J6ld63TjGMMZmFqyoSlsauWcmlwwfEqVmPG
         iH9aA5C6aVpOLfp2L0xwSSdx6ytJz1NJyRJXa1t9HAtq83ln9wkhBXYQ+Z+mHBWMo3Nz
         Tf/L707BoymcyYxIPCnAx+v96EHgUEOuRSMD91QfdseWd0Y+Jb35UuhGTh11mgW7+lW6
         MELJfyJcsbiAEQ01706rnAO8MMZHOQ+9uUoOfTfPKiPu5JV+ocTUmOZQeNxAXxVsWz8p
         P5I0t4XrnyFATK3VtdNPMv58LLgju9PVA5MdkP2fpQuLynCY+1A1w2J0nRn6KrM08nCL
         dvKA==
X-Forwarded-Encrypted: i=1; AHgh+RpzTUcBDoRuXfAEc/ytLu8RLD3lm8OS1x68KXCWo8Tuy2yXc3on/PfiQvQ4cd1sgWcwLFuboJ3MkOw1E6Z+2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR97dl54J8S6wQx9+dKvI1Mx0R2OXBYq0HjveyWagMz+OFUO9H
	gjxfL2c3OJY7ykKQGggh71iy6I+ur73QLkuKxcCoQcYCiYZVeFuEYSwyzh6wtnGOxdjgzKEL7Y2
	i7GMrQ+OGLxMkxD/mgw==
X-Received: from wrqj14.prod.google.com ([2002:a5d:448e:0:b0:46d:fce6:b164])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b90:b0:493:c182:6b08 with SMTP id 5b1f17b1804b1-49538a1e2famr119234665e9.36.1784200867971;
 Thu, 16 Jul 2026 04:21:07 -0700 (PDT)
Date: Thu, 16 Jul 2026 11:20:56 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJi+WGoC/x3MSwqAIBRG4a3EHSdo0XMr0UD0ty5UhkYE4d6Th
 t/gnJciAiPSWLwUcHNkf2SosiCz6mOBYJtNlaxa2alGWDgEYfx+brggnLLQg3aq1j3l6Axw/Pz DaU7pAy67KGZgAAAA
X-Change-Id: 20260715-defer-complete-f1dea9af13a8
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5665; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=W3NhSWg0tsprk47tppJWMR8YMpbznk/oMdZuD1IuwN0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqWL6bfP26osVwS0W7h6zx6vxb2CpyhKxjDGB9T
 naY62VhsBuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCali+mwAKCRAEWL7uWMY5
 RkdBD/94OZDqdmg5SAikjik8V9HRLWgr+CFVErxUF/pLhk9I0T1CDo6OLhHoYAErEwHKXR68mtp
 gJTE7U/f152b7nWLOl4A9Ibk4Uc0GYsj3GtteVfyZDvRs9JCjWKbSnEfUguzq1kyegjt3jsOAkv
 vvZ6JSMAIVT0SNXzvmdxp5enS9GP/WFzzxaXPngMcHC7xbvDX5Rnhq23yZmAkVTYR/EBNKYSa5w
 DImyoYlZqkxbm2mprqLeUV1DZIoHkkwEgeUvOj0jqGG75tsaxcvtUMist+2U4ZASYeLvyQTt9FP
 Dwz+1456lgmwwE20/ZlMPDufCVaJMlnhijHqFzzhfyJA9LwEH5L+11M6WLNXy2AhK353W68V+uC
 Dp/FyH8b2EVprsQI6iShLOIeej4CXgaMGqmhEJUokov4Xd9fH9kE7G7BT80XFEPE4cVYLfVJUZe
 +7qkWo+L+hfajPZnczg9Z3mqgmjVEAmzyU1lPd1eqCfnGgH0S48h/mnCUQzLXPeuGyVjXfz9UBi
 jGQhW/oTuH1pnyC/OCZ/Pz+rY68oHgvZEaXKMv9rbpXiQ8FV5KHU7IKIA3m/SuXneWqDOyzR1Zr
 PsVeyhl6ip2MZGjFXboBA1ZjoX1f/1XR2j1t4KgzdzNmd0VlG/tyuYKov3816tR/sKK6B2iaaY7 8XejncFKyAQV5BQ==
X-Mailer: b4 0.14.3
Message-ID: <20260716-defer-complete-v1-1-ce0e38d30dc6@google.com>
Subject: [PATCH] rust_binder: add TF_DEFER_COMPLETE flag for avoiding
 userspace roundtrip
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Todd Kjos <tkjos@android.com>, 
	Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Outgoing transactions are able to send a message and wait for its reply
in a single ioctl. Why not avoid a userspace roundtrip by applying the
same logic for replying to incoming messages and waiting for the next
incoming message?

Generally, when you send a reply using BC_REPLY, the kernel sends
BR_TRANSACTION_COMPLETE as a reply to BC_REPLY right away. The
BR_TRANSACTION_COMPLETE command indicates that it's safe for userspace
to free any resources associated with this message (such as embedded fds
or Binder nodes). However, the BR_TRANSACTION_COMPLETE message is
problematic because after BC_REPLY is issued, there will be a pending
message for userspace. The kernel will refuse to sleep for incoming
messages in this scenario.

The way this is handled for outgoing transaction is through a mechanism
known as deferred delivery of BR_TRANSACTION_COMPLETE. The idea is that
when you send an outgoing transaction, then we do not return to
userspace right away if BR_TRANSACTION_COMPLETE is the only pending
message. This patch adds a new flag called TF_DEFER_COMPLETE that lets
userspace opt-in to the same deferred delivery mechanism for
BR_TRANSACTION_COMPLETE when using BC_REPLY.

Given this new uapi, we can adjust sendReply in userspace libbinder
so that it writes the BC_REPLY command into mOut but does not flush the
buffer to the kernel. Then, userspace simply continues running until it
returns all the way out to the top-level joinThreadPool() loop, which
calls into the kernel to get the next incoming transaction. At this
point, mOut is flushed, sending the reply. The same ioctl then proceeds
to sleep for an incoming message.

Userspace only actually specifies TF_DEFER_COMPLETE when the Parcel does
not contain fds or refcounts on binder objects. This is because
otherwise said fd or binder node will not be freed until the binder
thread receives another incoming transaction, which could be a long
time. In the case of fds, this is especially important because delaying
fclose() can result in processes hanging because they read from a pipe
that isn't being closed due to fclose() not getting called. Note that
even if TF_DEFER_COMPLETE is not specified for this transaction, it can
still be useful to defer the BC_REPLY command, as it can still avoid a
userspace roundtrip when a new incoming transaction is available right
away.

Observing the cuttlefish logs while booting with this change shows that
there were 4297 opportunities for this optimization to kick in (that is,
boot invoked BC_REPLY 4297 times). Out of those, 3441 binder ioctls sent
and received a transaction in the same ioctl. This indicates that we
successfully eliminated a syscall on the server side for 80% of incoming
transactions. Generally, this means that a server is now able to handle
incoming messages using one syscall per incoming message (for each
incoming transaction, the syscall handles one BC_FREE_BUFFER and
BC_REPLY command, and then waits for the next incoming transaction).

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/defs.rs      |  3 ++-
 drivers/android/binder/thread.rs    | 10 +++++++++-
 include/uapi/linux/android/binder.h |  1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/defs.rs b/drivers/android/binder/defs.rs
index 33f51b4139c7..52e4540a0dc0 100644
--- a/drivers/android/binder/defs.rs
+++ b/drivers/android/binder/defs.rs
@@ -75,7 +75,8 @@ macro_rules! pub_no_prefix {
     TF_ONE_WAY,
     TF_ACCEPT_FDS,
     TF_CLEAR_BUF,
-    TF_UPDATE_TXN
+    TF_UPDATE_TXN,
+    TF_DEFER_COMPLETE,
 );
 
 pub(crate) use uapi::{
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 3b8520813941..d58a9168d908 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1340,7 +1340,15 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
             let process = orig.from.process.clone();
             let allow_fds = orig.flags & TF_ACCEPT_FDS != 0;
             let reply = Transaction::new_reply(self, process, info, allow_fds)?;
-            self.inner.lock().push_work(completion);
+            {
+                // This performs a deferred push so that `read` can wait for the next incoming
+                // transaction without a userspace roundtrip.
+                let mut inner = self.inner.lock();
+                inner.push_work_deferred(completion);
+                // However, if `TF_DEFER_COMPLETE` is not set, then set `process_work_list` to make
+                // the push non-deferred. This forces a userspace roundtrip.
+                inner.process_work_list |= info.flags & TF_DEFER_COMPLETE == 0;
+            }
             orig.from.deliver_reply(Ok(reply), &orig, None);
             Ok(())
         })()
diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/android/binder.h
index 701cad36de43..96e5b0184a1b 100644
--- a/include/uapi/linux/android/binder.h
+++ b/include/uapi/linux/android/binder.h
@@ -296,6 +296,7 @@ enum transaction_flags {
 	TF_ACCEPT_FDS	= 0x10,	/* allow replies with file descriptors */
 	TF_CLEAR_BUF	= 0x20,	/* clear buffer on txn complete */
 	TF_UPDATE_TXN	= 0x40,	/* update the outdated pending async txn */
+	TF_DEFER_COMPLETE = 0x80,	/* defer transaction complete to userspace */
 };
 
 struct binder_transaction_data {

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260715-defer-complete-f1dea9af13a8

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

