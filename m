Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4722C2F533E
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 04:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760501008; cv=none; b=qJJwTYtPkWWTPCJjmZn/GmNlAFsZRP3aeZt09fw2dwYSPafQvehE8HHUvvwKEUF37H/uWW4qBoPIS8ZIFsBvzBz1rZY7cCbSB29IG02g1eJeJkSMi+BXzYHHJVJ6k0maMs0p7T3sJsWgz/lP/hoHHST7jHCpFgeAAHYf1lRZLt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760501008; c=relaxed/simple;
	bh=+ZY9ISu0W16A5V+R31X/nl/Eyjev56GCHTyxRrxZotc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=DWQhbmfcleAc0Y+PsX/KL0JEZeZyzVuOhAKHjUYLOuoThF7SDcsdfLhlBuLB6NBRzilvygE7gHmfo1FnS7mu6p7La+TZFrIk+CXGz+vhXI9xV55wMMeleu9gOQxeRM6JBrX6sVM7ATTSckJj9xjIoD9+yp/5iMJdUivKES/5S+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dTcC4VDi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dTcC4VDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760501006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8uZpbkKbGsAFX9mFxTHGyfhWtkHglsy/t96i+4mTbI4=;
	b=dTcC4VDicRWZ20hhlqaa/csPlGEHSGR0eOwwUlkwOU3QJbtMLi5c5wLmZZEDtwimpT3GQE
	sBL4lFCKhFeVjSBWBQhxCE6aEcUcPFRWT70BTD0/7Sxyr7cCcTTC5UYZ+rQxdmpyl7aPmo
	wV2TCxJsrEtqht7QYpIWqWlun3Q4D5Q=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-pq72gJ81NJ-xohfOkxtcjQ-1; Wed, 15 Oct 2025 00:03:22 -0400
X-MC-Unique: pq72gJ81NJ-xohfOkxtcjQ-1
X-Mimecast-MFC-AGG-ID: pq72gJ81NJ-xohfOkxtcjQ_1760501002
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33428befd39so23202087a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 21:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760501001; x=1761105801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uZpbkKbGsAFX9mFxTHGyfhWtkHglsy/t96i+4mTbI4=;
        b=TIm/6WuW4RHp3iJ/sc85yB/t2RBnqU6WcdYm4zGtJUNXlvHuOGUB4fInW9mBCxugP6
         RVDMh3GMGutu+cvTlC4a7tklvWy2S85LLgOx8+zfn7YicvLCmJz0agiFoMgv0c3TRP1f
         n6tF7iyjCH8d5oQ8IvJifCOTNImMLbX+UEs+zzko7/h41WJiJ1hmj2kGcdPHn4Tbhao2
         +UsFANL/tWRVVmWt2sVVZuv2uObB4UChgz5Bm1oXoi6J3PqDLFDYmr8BCSYq/OecC03p
         nnEhLIo83XyyOOa2ma3Pm+2AZusDtCNK1toCDbLhHmgkqxA9p47aLBB8J94sTqP4OFq9
         MDng==
X-Forwarded-Encrypted: i=1; AJvYcCVQWrHcMVwnw+LwrUncuzouDGtRpnQ3T1lStjJRkjv+agpxiQpGbemx3Ul/Bf+B3aHFEf4bMMGddvY3tcgS/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/IVwbSet/khw9AElDTKcwBnfK2q1xH5YRm77vy1V3KeWlqjyv
	euVV3YkMeTUJO9Yjz2MHdAjHKeKjujECOK7hGHhtSPlaiMLVGCqks83McF5K6dBB6oa6i6vkpAc
	jYVs/XjRO53q8PRhekoL+gMr/ru7dmJ5VV3Fj5fCuztp++EemcOxt9ZV8K+lIsSvpCpUw
X-Gm-Gg: ASbGnct3idi6Hoq5722MEw4eaeY6SW35Qf7gW1t6jrQJ4MK8+i1xZz1MW86T9DQK2dx
	B5iwvU3uGnRifpwFKhwOf1+IWAdDO7tunUnOu1pZroDRPg7P1G0w0rEvG+3UmVYoVXGnCD8oGlN
	+6gfX/hebrHNfxiwXQksoVRA0k+ItX9YIG9Hexe60fWpZoyUPW5LQzlj7hWIWEBkRdrb3azPQ6v
	+dgYiHfbIsRGpBYwsFjVU6G0Jwusl86nMYtu9rbN8Da7k+Tm27KIR4j5omCvEz4aGHhKUrvGPk1
	Zxrk4Q30Hb+r/3aHznl9MogHT3EfdEGxJLmTnxC/XFAfuR3t3hMnBi21wd06aZc2zhanDA==
X-Received: by 2002:a17:90b:3a91:b0:329:f535:6e48 with SMTP id 98e67ed59e1d1-33b513a1f54mr36206178a91.36.1760501001453;
        Tue, 14 Oct 2025 21:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeB00/IAiV2A5VWR2GpIwimPRs4bIDRky9OnqOTaOwRvemdHPVbmX+QZZKvd8185HR/P1l4A==
X-Received: by 2002:a17:90b:3a91:b0:329:f535:6e48 with SMTP id 98e67ed59e1d1-33b513a1f54mr36206138a91.36.1760501001077;
        Tue, 14 Oct 2025 21:03:21 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b978607cfsm608006a91.9.2025.10.14.21.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:03:20 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH rust-next v2 1/3] rust: fs: add pos/pos_mut methods for LocalFile struct
Date: Wed, 15 Oct 2025 13:02:41 +0900
Message-ID: <20251015040246.151141-2-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015040246.151141-1-ryasuoka@redhat.com>
References: <20251015040246.151141-1-ryasuoka@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uqdczf9x4l0WtH-mnHRAfkhU03O9OKYje_zUBPrPjsM_1760501002
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add pos() and pos_mut() methods to get and set a file position.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 rust/kernel/fs/file.rs | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index cf06e73a6da0..bda6cc540dfe 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -283,6 +283,23 @@ pub unsafe fn from_raw_file<'a>(ptr: *const bindings::file) -> &'a LocalFile {
         unsafe { &*ptr.cast() }
     }
 
+    /// Create a mutable reference to a [`LocalFile`] from a valid pointer.
+    ///
+    /// # Safety
+    ///
+    /// * The caller must ensure that `ptr` points at a valid file and that the file's refcount is
+    ///   positive for the duration of `'a`.
+    /// * The caller must ensure that if there is an active call to `fdget_pos` that did not take
+    ///   the `f_pos_lock` mutex, then that call is on the current thread.
+    #[inline]
+    pub unsafe fn from_raw_file_mut<'a>(ptr: *mut bindings::file) -> &'a mut LocalFile {
+        // SAFETY: The caller guarantees that the pointer is not dangling and stays valid for the
+        // duration of `'a`. The cast is okay because `LocalFile` is `repr(transparent)`.
+        //
+        // INVARIANT: The caller guarantees that there are no problematic `fdget_pos` calls.
+        unsafe { &mut *ptr.cast() }
+    }
+
     /// Assume that there are no active `fdget_pos` calls that prevent us from sharing this file.
     ///
     /// This makes it safe to transfer this file to other threads. No checks are performed, and
@@ -337,6 +354,20 @@ pub fn flags(&self) -> u32 {
         // FIXME(read_once): Replace with `read_once` when available on the Rust side.
         unsafe { core::ptr::addr_of!((*self.as_ptr()).f_flags).read_volatile() }
     }
+
+    /// Get the current `f_pos` with the file.
+    #[inline]
+    pub fn pos(&self) -> i64 {
+        // SAFETY: The `f_pos` is valid while `LocalFile` is valid
+        unsafe { (*self.as_ptr()).f_pos }
+    }
+
+    /// Get a mutable reference to the `f_pos`.
+    #[inline]
+    pub fn pos_mut(&mut self) -> &mut i64 {
+        // SAFETY: The `f_pos` is valid while `LocalFile` is valid
+        unsafe { &mut (*self.as_ptr()).f_pos }
+    }
 }
 
 impl File {
@@ -356,6 +387,23 @@ pub unsafe fn from_raw_file<'a>(ptr: *const bindings::file) -> &'a File {
         // INVARIANT: The caller guarantees that there are no problematic `fdget_pos` calls.
         unsafe { &*ptr.cast() }
     }
+
+    /// Creates a mutable reference to a [`File`] from a valid pointer.
+    ///
+    /// # Safety
+    ///
+    /// * The caller must ensure that `ptr` points at a valid file and that the file's refcount is
+    ///   positive for the duration of `'a`.
+    /// * The caller must ensure that if there are active `fdget_pos` calls on this file, then they
+    ///   took the `f_pos_lock` mutex.
+    #[inline]
+    pub unsafe fn from_raw_file_mut<'a>(ptr: *mut bindings::file) -> &'a mut File {
+        // SAFETY: The caller guarantees that the pointer is not dangling and stays valid for the
+        // duration of `'a`. The cast is okay because `File` is `repr(transparent)`.
+        //
+        // INVARIANT: The caller guarantees that there are no problematic `fdget_pos` calls.
+        unsafe { &mut *ptr.cast() }
+    }
 }
 
 // Make LocalFile methods available on File.
@@ -372,6 +420,19 @@ fn deref(&self) -> &LocalFile {
     }
 }
 
+// Make LocalFile methods available on File.
+impl core::ops::DerefMut for File {
+    #[inline]
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: The caller provides a `&File`, and since it is a reference, it must point at a
+        // valid file for the desired duration.
+        //
+        // By the type invariants, there are no `fdget_pos` calls that did not take the
+        // `f_pos_lock` mutex.
+        unsafe { LocalFile::from_raw_file_mut(core::ptr::from_mut(self).cast()) }
+    }
+}
+
 /// A file descriptor reservation.
 ///
 /// This allows the creation of a file descriptor in two steps: first, we reserve a slot for it,
-- 
2.51.0

