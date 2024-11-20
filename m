Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B051DE4C2
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114590; cv=none; b=HUj48da/wcpVdWZglzTBGnJWjGUV8/I8YbpyzE39SzZQbawtYGSpnkx1h3eIyjYtGzvO4M5wuZTTwkPE2NcILhWO4+57im/JgM9a+UTxwDajnonEz4oL2gqPapB/To+ESGIWEj3wl+cLRf1V0yDo6kRH4XHnYfO9TuUH3sy5S+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114590; c=relaxed/simple;
	bh=zMBEVvavLox9MacZywaW5TO54AiJm41R1sgIdY4Cj4c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZxKDwBEWgP8NkK2JbAZY+Z0k1YKB1t+/rf0ONjU0PGKJn1PgXiFYcJ25fvWgI/g+nTmLV45Jh6Lm+Lzi6KHL/AZgRhEFVKGHfyw6SFTq6mhMRz+f9/LI8m+CLVs6Wc8Ku+LXUQWQuZsJmJqDAwGjbgA+EC/ZUd9AA+DT8KqdQ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hqxl74QF; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hqxl74QF"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e3826e5c0c0so3947625276.0
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 06:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732114588; x=1732719388; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B1qhmYZFewino7xIAVBLotqrei4FahWNdMxHocqLM/I=;
        b=Hqxl74QFh7YYvC4yARol1cTc20A5A09l77FyWn7ngpNU7+SCgwRDf/6J3hp7m7LlY4
         CwdF508A4XqqyP0MPgBAAs4BME+McWrrPy0NP9wEf4PNcGhwc4EK2Cq4O/7aw/RpRStC
         3vyo9eQ3kKSZ2x5RHHCI+NuMH3MJGjQG6ErNRbkIW1bTgAAEZ3ZKpD9COu4ZtpBWXyRc
         A4oyy9ldYFPW0ImDx+kd1yjn/2tq6OFt7cchi4dbjHnrWofL4Oj/5hzPgn0Gic7HOlDZ
         YUZ2x3OR1B4Sf4obTfY7Nop6nTmYOQ4q9lvUFdWiJ5gx0WML9w8MJdFqhgxQSQHkBL1j
         dspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114588; x=1732719388;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1qhmYZFewino7xIAVBLotqrei4FahWNdMxHocqLM/I=;
        b=rXhVJBz8eA3Wc3ubZT8O3uA4XZIg9zS5SYTHRRJzxvbkqSVp0h/kwp9xfXGinF9Jwt
         hJjn/+L0b7boultQnU9BOA711L0DZchP9R3PwD4NIgSy+VksiBSjbBz6c7Z08lc2kxaQ
         fEu24yuiMvX/1iHtW24btmUACPfO8hlLny/OitRnIDD3uJ5XEqgqdQyIvRjyQQgKCtkj
         pQA21BunG+xtqjlUQZfGi8JJsTu6Fdi6oHk99L4KzCjT4PGQFktSUw09ycEKviUHdy61
         sO9BXOHv86CalS0KF0XMe2FVgtdVxWGOz4qPVHqZDzNK7UlvQ7ftsNozfEdcy20fmutt
         qUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdutmrMwF8B/s7/pCaV0dhNGC/SmkOAncwsgYpah+aguZMcdewQAB1P/KIbqVkZtMhNEtmbLyiFo831VOiQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdx7TYa20vDyBRmzRqdDe0VDpRDJ1K9ICx+ZQw2g95NFHEWJHt
	EgVty9iAfb+RkWB8ptl/9dnUnhzN5iue2ng4mU8n1y0L1ouriA213aiXoawHfqjJqxyihOoltxy
	n2Y+LhGudtwZIjQ==
X-Google-Smtp-Source: AGHT+IF/fEeF7RZo4n1G/IhIgluwurThfGhJ8HHwALNv+tngK6vv1K4wFovn4nEL5pwq1i5uR+Y80sYHZ33r9Rg=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:68:fe9:ac10:f29e])
 (user=aliceryhl job=sendgmr) by 2002:a25:abee:0:b0:e38:bdf2:17f2 with SMTP id
 3f1490d57ef6-e38cb73348emr3963276.10.1732114587698; Wed, 20 Nov 2024 06:56:27
 -0800 (PST)
Date: Wed, 20 Nov 2024 14:49:59 +0000
In-Reply-To: <20241120-vma-v8-0-eb31425da66b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241120-vma-v8-0-eb31425da66b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3012; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=zMBEVvavLox9MacZywaW5TO54AiJm41R1sgIdY4Cj4c=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnPfiLa5bb5Royej/gvacnIe/2ZvajVUxGyAgMa
 dNsj+onQTmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZz34iwAKCRAEWL7uWMY5
 RumNEACU95kezGcsO/Br+P6owGa2xELObLK9zCf/u/XtIn3c8FNg85uhnzJziaGAaAd2cYqUpzy
 RwmIPH+7ZyFBtfJpVKn7NLRLtdVo+klyy9JVT2z6vKZBJr9VJUJSDEG6gC3gRxqE6UgrRlWd2Ys
 wIWtHMXp4KouQyAZWtSablEJ5spRaujZDuYaA8KD9UICei4ceVZAkgpluSWANS9W7P/465YuKd6
 kV+/4zDJVskpsK+bllZ8ONgS6OImPjDavA+ZBLXqGtcpBGVPfVQ71N25J8y0YjUgksmvXzoB6/7
 93aKzR2oaK6rWaCZbzQvh1UWQoJZe606PiqvMHGKvngM1Z8RA+d71ce0Cf2n4r1EyHyzAeU6WJL
 cOW3Ru9xOnLlGfECNblgdzVjOzhFqAuukhuzo54ZhUVmkpCwOdmXRUlOke5rCDEE5cJ5Qqd7Wak
 tAvR5mkY4rG3zy2C174XQRFs95SBBQmOs4YrEDCXnIUgB6ZB3hVwUmLlU8TJNsnFRxKLa/zgdI5
 6cQislthRO7rqBODUOhHBjizlWYGcoFwRkxjjS+nT7oRo8DpxZcCQ2tGV5z9cQbX3QEp1KuxDe4
 dGYcwM0fgLH1M09SIqdoGE3bIMWuplVaerFAXZKqKpYgC4by/xXMkwXkE0WGAKavS4c4MVBip4d lLCXPgjMMTYXRCg==
X-Mailer: b4 0.13.0
Message-ID: <20241120-vma-v8-5-eb31425da66b@google.com>
Subject: [PATCH v8 5/7] mm: rust: add mmput_async support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="utf-8"

Adds an MmWithUserAsync type that uses mmput_async when dropped but is
otherwise identical to MmWithUser. This has to be done using a separate
type because the thing we are changing is the destructor.

Rust Binder needs this to avoid a certain deadlock. See commit
9a9ab0d96362 ("binder: fix race between mmput() and do_exit()") for
details. It's also needed in the shrinker to avoid cleaning up the mm in
the shrinker's context.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm.rs | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index a15acb546f68..f800b6c244cd 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -98,6 +98,48 @@ fn deref(&self) -> &Mm {
     }
 }
 
+/// A wrapper for the kernel's `struct mm_struct`.
+///
+/// This type is identical to `MmWithUser` except that it uses `mmput_async` when dropping a
+/// refcount. This means that the destructor of `ARef<MmWithUserAsync>` is safe to call in atomic
+/// context.
+///
+/// # Invariants
+///
+/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
+#[repr(transparent)]
+pub struct MmWithUserAsync {
+    mm: MmWithUser,
+}
+
+// SAFETY: It is safe to call `mmput_async` on another thread than where `mmget` was called.
+unsafe impl Send for MmWithUserAsync {}
+// SAFETY: All methods on `MmWithUserAsync` can be called in parallel from several threads.
+unsafe impl Sync for MmWithUserAsync {}
+
+// SAFETY: By the type invariants, this type is always refcounted.
+unsafe impl AlwaysRefCounted for MmWithUserAsync {
+    fn inc_ref(&self) {
+        // SAFETY: The pointer is valid since self is a reference.
+        unsafe { bindings::mmget(self.as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The caller is giving up their refcount.
+        unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
+    }
+}
+
+// Make all `MmWithUser` methods available on `MmWithUserAsync`.
+impl Deref for MmWithUserAsync {
+    type Target = MmWithUser;
+
+    #[inline]
+    fn deref(&self) -> &MmWithUser {
+        &self.mm
+    }
+}
+
 // These methods are safe to call even if `mm_users` is zero.
 impl Mm {
     /// Call `mmgrab` on `current.mm`.
@@ -171,6 +213,13 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
         unsafe { &*ptr.cast() }
     }
 
+    /// Use `mmput_async` when dropping this refcount.
+    #[inline]
+    pub fn use_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsync> {
+        // SAFETY: The layouts and invariants are compatible.
+        unsafe { ARef::from_raw(ARef::into_raw(me).cast()) }
+    }
+
     /// Try to lock the vma read lock under rcu.
     ///
     /// If this operation fails, the vma may still exist. In that case, you should take the mmap

-- 
2.47.0.371.ga323438b13-goog

