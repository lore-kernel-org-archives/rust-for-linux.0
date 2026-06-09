Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9E382F08
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997600; cv=none; b=m0fayGP7X1hWqt7XE5kiYB5auT+YZ3tJ+6+zAQZ/twgO1NR4la+hJVLihFlLzo+9/TRV9hCc/QX57tB0J1fMOdPEqrEsTgwny9pfr6GAz16QtjW+/HdXJo1zmONbZJ2pgIuY1Hz0sh2f/diEY/1cGebsn0Ed9jgIurodvoeaQKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997600; c=relaxed/simple;
	bh=JJkyc2Gkrb56jcy0/eEAqacgPad4r8AeXEd9piHqCqo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YO0u2+b8nrK75jotXoR7tw1Q09OxWk3iynSB3xUcj475+rqlmIlyWilMQ9vV4scXfobveGcsAtqowGGwFqmaZq2ymoSx+kNxqOlbXksXK5YPaxNHP5220L9gU5w3d7z17Xe0xSuBG6istu5frRdfU1O27bARsRe7Fh5EAf0mzGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L78ISzef; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L78ISzef"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490b9318944so37354085e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780997597; x=1781602397; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zPt8yXjD696/Vi+r5BQEsVm7pl4tMhdx8EJDQHcaN/c=;
        b=L78ISzefCzvOUCVUGcwfIUBrvSprwtjAtxn2I1hMc6/CR0fGuTiIKbWnm6ntGygcUw
         br7AUgfrOKEM4TDsBcwwonwXHU95lKRB5kSuwMOQTAHxjlI4/FmrL4oH1m5qFetKj69z
         2uI80bnBJJOTF4WuafuMFMx6qb3VpHJMO8d1e8PPSjlMMsHYmUSV6CT++mJAcZbLruI+
         CZtaJ7Nd6F42Gzsu+4J0bsZUPq7tlT4vir3lnJulr0jUagPein/WpH012eEXwrOdlyJL
         xpEnDghJWm1xJ8sm5sXXepW7o9u5WIoS4al/RCR1lUgXNwsRZKTt3xoLxeqoeLR44Az/
         eLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997597; x=1781602397;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPt8yXjD696/Vi+r5BQEsVm7pl4tMhdx8EJDQHcaN/c=;
        b=NaG9775mAN+mrZi2FywXDSXqeOlYLM+B2/izQuK7Ii8AIfLj3D2KhSG3OnhKqdEU/a
         Emv0iHVdNoeMnMI5FM2tAumyx4cCBNJgEY9mgSaZ84WR4nXidlKXPqOplLTmVDeJCbms
         J3rWtbMCGtLIcIS7LrDq4aaKUKNy23FJ+El8jTzB8PfxRQcgtMg+hRx9U6PO4gkM9MD8
         FJrS4+mCqc3Hd4i0t6KPERLPyoCTOrGVXrPSbe6R/KgRNUFLnDxNaWNMHC1BXHJP+sZI
         ulVyktGtorpuPCZTg7bPFbauTw/EkvuXbW27qkHLBHv3s/pZvxZ2+atbbILlmhO6b2jr
         2w0A==
X-Forwarded-Encrypted: i=1; AFNElJ+5w6Na/j3+nQSgtxtM+fd0hEAZpcDv2XCYbX63mOWZ8ZjyZVGKvw4sDNWmsFRyxTuztJa5kCn6dPLzDnZnlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBZg0OxRLclmFQAYn+wQoj7XRRh7UybY4EKJ/QU3t6CMeX9D+
	ai3DKPVm7jIqfCC0tgN4f5jiTN6+dRtbQaKaTiVkwSn0ZQOZNoVetPMimmIAdXJM5zrIJvesZbS
	x7W0iTS2WF43X/NHvMA==
X-Received: from wrre14.prod.google.com ([2002:adf:fd0e:0:b0:45e:f573:5f45])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:821a:b0:490:4973:91a0 with SMTP id 5b1f17b1804b1-490d71fa976mr20911175e9.10.1780997596724;
 Tue, 09 Jun 2026 02:33:16 -0700 (PDT)
Date: Tue, 09 Jun 2026 09:33:06 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANLdJ2oC/4WNQQqDMBREryJ/3V+SGCV25T2KC43f+KFNJCnSI
 rl7Uy/QzcCbYWYOSBSZEtyqAyLtnDj4AupSgV1H7wh5LgxKqFa0wuDEfqaIPhSlJWHa2GM9CrK
 iMZ3QNZTqViJ+n7P3ofDK6RXi53zZ5c/9M7hLlKgao+2kSXfL0rsQ3IOuNjxhyDl/AdfXDjq5A AAA
X-Change-Id: 20260608-binder-noderefs-spin-3a0ec0589043
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=JJkyc2Gkrb56jcy0/eEAqacgPad4r8AeXEd9piHqCqo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqJ93WYKs1CVZyanR5RdDUTHeb3zUotruWbS1vN
 3RSrd39ZxyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaifd1gAKCRAEWL7uWMY5
 Rk5hD/47VEPSQ5Ap3VP0TBRn7D6hsMnb2z83frxedE85JQBgukLNGQAruo4bcaGvJy/nwSbj9Wx
 Tx0s5D6F5KPEYP8mFZNtXF1KHp08HMsBumhgA1XfrzH5d1V6oTIKCoaPl+GJJ2xKhTDnOox8CnO
 zTz7fR+p+ZkQZohu6y2KRw0c2OGbVfjpzccf0o6J/KhA6RJJO+nmV5StjCzk5MKgny97n/zkLY9
 zqmJU6Ob6wOxXpec/VEuj0GDZ4DVtsGDHi3OPAtLSng6tE5PUctBlvKxiJ7VuJmyoOEvCTUlP9l
 9YwtsgOLwX9TnMCYK2sJrWNFO6xRyhOR8TcTSGzwAm7h8Eybn9TvlfVDEHeAgYtUt+Gl80SXPD7
 4Y4wQhpsPsblaZen2JxY6lWDlXmeHKAFScsX05ME0T2+5j+rHhHp9Zb6OXIU/JjzuA3Mzu59o7W
 pj7bWQMW34l1qxY5zcEui6T9szX61KsC1c+Mg3s6wt+W2xbqTMBKeMuMIb0ZBVESK6uwkETyOu8
 oSkadIw1MlY3PzXg6cSX/X1AEHsuojw9Q8haHw5yqIBlKCurkaguYMrnvaBTXbBdyAGMluKuUnI
 FmwhCeMf1w8TIGdyGMu396g51VxuNG2wxz0sHUIeV03emD+m8hMwEZzLup0LurFc2xTXizZ7+2S +9wC+xO4/xnpQCA==
X-Mailer: b4 0.14.3
Message-ID: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
Subject: [PATCH v2 0/6] rust_binder: update Process::node_refs to use SpinLock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Unfortunately the current use of a mutex for this lock leads to priority
inversion. Traces have been observed where a process is trying to obtain
this mutex for 22ms, but it's unable to do so because the thread holding
the lock is scheduled out. Since this occurred on a UI thread, that is
an extremely long delay.

This patch series fixes that by first making a series of changes that
remove the possibility of sleeping under the lock, and then finally
changing it to a spinlock.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Make more tweaks to various critical regions and extract them to
  separate commits.
- Link to v1: https://lore.kernel.org/r/20260608-binder-noderefs-spin-v1-1-2584cb4e49ff@google.com

---
Alice Ryhl (6):
      rust_binder: avoid allocating under node_refs for freeze listeners
      rust_binder: avoid dropping NodeRef in update_ref() under lock
      rust_binder: schedule NodeDeath outside of node_refs lock
      rust_binder: keep NodeDeath in NodeRefInfo during process cleanup
      rust_binder: avoid destructors in insert_or_update_handle()
      rust_binder: update Process::node_refs to use SpinLock

 drivers/android/binder/freeze.rs  | 67 +++++++++++++++++++++++++++------------
 drivers/android/binder/node.rs    | 55 ++++++++++++++++++--------------
 drivers/android/binder/process.rs | 57 +++++++++++++++++++--------------
 3 files changed, 111 insertions(+), 68 deletions(-)
---
base-commit: da61573f783897ae5a96c8f1c71aad6242344feb
change-id: 20260608-binder-noderefs-spin-3a0ec0589043

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

