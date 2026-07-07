Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331E73ED5A4
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420159; cv=none; b=PpUB7hcTt416GliAPOvaaDF5PjNsE+tFSQD8yFWZ0f2MEoJ1ACBzaZw0x/IGzzYOBoXDGowKVv8ZbrJQcA716XerlB3aKuHwPxImL0CPQixuZ7uvZYiqFKOqDwcr9496T7CLNiLg1r9WVCBRbxwkJNAWtmeUt+yiU9dhAZ78kd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420159; c=relaxed/simple;
	bh=VdO65ee8Oy2hGTU8bXdJCczmaRnhaBLsP6Lpojort/U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=puxN7Zkz7ZV3hD+r3a134fnnuc71MIOSMnme/CZtDC9IKxrhUPtyd/XI6l9HE95VGtBPlrn5aRpzTMVTEMWLoizn9Fa+aNzR+xlADWQKmqQNsOY2Tsn1NhlkJ6NJuAwVK+aRWRQJTDCt54e7e1aRng4BgfYKfXIknkb8367brZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E27VRte0; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E27VRte0"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-476d52b13d7so3059273f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783420152; x=1784024952; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OMybGqYVMxTRRjf88FLx6NDrYnajLzjRuMCbUQogUXU=;
        b=E27VRte0K/gsjteMHtJN8oc9rVhstELnHD1cYFFOnq+7TRN7SnQjgmHCSSoxyH3i9B
         oZfcXTkU4H3oQRpjCSYnKoXRFuGhz924KlACjjglrtxh6yjoJujBOQy4wbh2lLYRcUO/
         BEg5sOkkz+pnCY5ZdnfbHDgs3EGnuaDC+43FTzKBZeWpVgCmj3bSKmaLFBvOtPAxmarb
         5UraGgWgrpulXbRK9tO63WEOEmZ7LPYOhWRx4UArs+DKRzh3Emhglx6lSh/kmPBtOFdc
         6b4aLsUmJI2YK6irCqmW/djv9pyDZn3u5Hlp7Eyc7Yq8QIfUyAaCrHgcuT+1WHO8Pvhi
         heJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420152; x=1784024952;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMybGqYVMxTRRjf88FLx6NDrYnajLzjRuMCbUQogUXU=;
        b=kBaBkWWFhdRCFCx98bbZWda0sKoY27Id3UmtA5MxjV3rPkcfRu0UcbL4f/x5Pb834Z
         MdH3/4e/bATzpZVbSA23gYR5wxXLubb26HIyGrtD4owBtcQUxfHQQVWHCCV3/H4/zwpp
         gSQ2kbV8Z0Ttms4hTHSKLWxcamX6V/tg4W+c+GEvEsl45eXkzJw8eIxSMBclW8mHtyed
         O6cmuSvRCQC3dL3wnRK86TN4MhhU926vgpHROm8A765qQ+NTmiHf9cQWSc3CsZV9KIOo
         Xn77VteDlCSlKSOFlPL8ad5NUIzb7gfu0+IV3jeF0ExNG2b5mFDVpXaH2hVNgg8GQJUS
         i0CA==
X-Forwarded-Encrypted: i=1; AHgh+Rqatwfua71ZIeIjw3xOSlanhXiTVOTd9oSFSUeVh0JAH2q1kIgZPTGGPwgkYmGMYthEbo5CAtrLN30GpKbc4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqQzdgqLzA45WK9pEUvMgcMQzA1UNKuhc/J/4jvM3MuzRFXjuz
	/IcrEOvZhX1JOuUgDme/5u49d51EDkzDn6NmtzoGvYP6iO45Kh8ewn2PAMYLotJD2vzI67bHOLS
	gRiwP8OlnbmRue5UmMQ==
X-Received: from wrqk7.prod.google.com ([2002:a5d:4287:0:b0:479:a6a9:baf7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e807:0:b0:476:8d5:cf34 with SMTP id ffacd0b85a97d-47de6689f31mr3695976f8f.8.1783420151529;
 Tue, 07 Jul 2026 03:29:11 -0700 (PDT)
Date: Tue, 07 Jul 2026 10:28:56 +0000
In-Reply-To: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=VdO65ee8Oy2hGTU8bXdJCczmaRnhaBLsP6Lpojort/U=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqTNTq2ZlxArx1Sf2Zj64UevIVMnMs8R9gRMS12
 mnVk2CRpW6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCakzU6gAKCRAEWL7uWMY5
 Rjl0D/9f087V1daroCrNdVnllejpfcoUm+HXnROl3iNRLYGw+KjTr8aENmewSbERnZr8tzF6asH
 ydzx1YtFy7iS8o/kdBkmREJOFoHLb9aq7dfdlg3ziGl4gFLIsnglsMc/1zJCMORsiHC8QCn99sW
 XM6QHIr7wTUvXjHQZlBfC/58yJeUpGBs9YSNC3bAdoHplP54/NQ6dgUzBX7xcpxE4hZXVuTWdBQ
 WGF2I9daHCOFsAkhkcROdVM8HnuG6nkfnm7ukxm6JoT+LaXT/uRbF7fQ4zZGTpAb59kphaDhIVT
 5wRmnYy6vlki0QKP9aUjgZKvy0p2D4og5dVQcEl3ZGfhq6MMPE+06Z6xFXVfQSSdDhk6fe2ow8t
 q+brL3gRldtWSrw0ed2aCQaDNZsriGiw4NjJTkkXBjUTsrB+mTWky8jRmL9v7sQqZOK3/S44+cb
 1lk0eHk0e47QHRkSw4i83FPTrk2qlYhQ6kiYYR7xplB6YIzOqmDgHTUkngujzlDKOOyBbgQb5oX
 4njp99DvIuRXcWgCmNBqlPuNmLvJdchxszlAL5h2bN9gutOcsdswohaag0PLM8Y8A6Vyk9GkcJ1
 pMCt04AMASLuzwrGaHaN16rx4nrQnnExSJxiYOFmd6uWKjtiWZpnU6dJGtfbmtHEHJeScGitL6O NYQEx0kl6qq6Avw==
X-Mailer: b4 0.14.3
Message-ID: <20260707-binder-noderefs-spin-v4-6-7c3c8bc16339@google.com>
Subject: [PATCH v4 6/6] rust_binder: update Process::node_refs to use SpinLock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Unfortunately the current use of a mutex for this lock leads to priority
inversion. Traces have been observed where a process is trying to obtain
this mutex for 22ms, but it's unable to do so because the thread holding
the lock is scheduled out. Since this occurred on a UI thread, that is
an extremely long delay.

Code paths that might sleep under this lock have already been updated in
patches leading up to this one.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 04d39e5fcb63..0555c4bd503e 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -30,7 +30,7 @@
     sync::{
         aref::ARef,
         lock::{spinlock::SpinLockBackend, Guard},
-        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
+        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, SpinLock, UniqueArc,
     },
     task::{Pid, Task},
     uaccess::{UserSlice, UserSliceReader},
@@ -455,7 +455,7 @@ pub(crate) struct Process {
     // Node references are in a different lock to avoid recursive acquisition when
     // incrementing/decrementing a node in another process.
     #[pin]
-    node_refs: Mutex<ProcessNodeRefs>,
+    node_refs: SpinLock<ProcessNodeRefs>,
 
     // Work node for deferred work item.
     #[pin]
@@ -510,7 +510,7 @@ fn new(ctx: Arc<Context>, cred: ARef<Credential>) -> Result<Arc<Self>> {
                 cred,
                 inner <- kernel::new_spinlock!(ProcessInner::new(), "Process::inner"),
                 pages <- ShrinkablePageRange::new(&super::BINDER_SHRINKER),
-                node_refs <- kernel::new_mutex!(ProcessNodeRefs::new(), "Process::node_refs"),
+                node_refs <- kernel::new_spinlock!(ProcessNodeRefs::new(), "Process::node_refs"),
                 freeze_wait <- kernel::new_condvar!("Process::freeze_wait"),
                 task: current.group_leader().into(),
                 defer_work <- kernel::new_work!("Process::defer_work"),

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

