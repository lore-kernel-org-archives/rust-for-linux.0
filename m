Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEBC3E832A
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 12:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527020; cv=none; b=FLaWZxSu8B7dswzZg8Vo67hGHZraRp2sH4nY5MBhAjHw7tVsnnLd6uOS0l85vDAQ+YdMXJWU4lw7ax6VOcJJIK39GYIYUMm2E0fWRFlG3JvVCZ9/wuPhnNc4WrKIKWq6zBGSjYSp2r1HLhBwflo9d9W07t2MZMgOpB2EwuWWdYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527020; c=relaxed/simple;
	bh=ThSc+6XiOvSEhAbI2lJs7zFq6IdGVbK8QsvE8anlggY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fPJNGUMWw0W6xpXwryJC8/A/9mUaI7423EVkxRI/qZu+08/9yVHIojtaRi/xjm+VvPJkeWOWJUpmLt27kZ+Qi2Wz2Z5ZSdPXJpA7QUlw+cGXHYfLWSTltLCZFIvFOemr+LP6kcFAHtifbPMm5FYpGDMvk6KItY929TxeeGiUGhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q2c3KDkB; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q2c3KDkB"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-45ef93c359fso2878110f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 05:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781527016; x=1782131816; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HWyMFpHbuhfEOGkd8h/3QkINHBAM8Opdb+24koLfu54=;
        b=Q2c3KDkBtqH3vhoWMxoZXx0kJTB3qhbKoD3Rc8By1uxPST+eHxix/w28EJ9Z7kB2yV
         Cs99U6jAaVSg7y5nADtspRHkRffoT51ZlK5fs24MhWmLwlP1Pdy2YtTmKU2b8BRyB4OQ
         D3Y5XNThj23/Pzk7bojU2mccru+0JYyk+CdEc4bpnVps7W5PtGWb83pcD3T17ZEDxQDu
         8TOUQ1lA/zobsyQN3M8xBLTZS0REV4DOhvjNNaO/7FhUVEbWarw6wvb6VI5tJbzNaNBd
         PVdX10+fajM8zG1IivSVAImDPYpPkhE4P3f1f4c4+UAlrFGcrMxRJLman1O+09sfq9M1
         fRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527016; x=1782131816;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWyMFpHbuhfEOGkd8h/3QkINHBAM8Opdb+24koLfu54=;
        b=k1FQb8tTcbXfiYxIaCAMIh//Uyz4CwHjW+buZladO9XhJioJOWvePtHr4kdcSiQLMs
         zPt/82Howvcuwh0SOuy5H5atUnpkJ/RjQLs8bdVfJ2juo24xmia0PUETZHsnjz0Tf+Be
         JtSsjQUhk62osZYiEGnlkvqfZxiN0PEoEFAm6iYiHP8UZpG3CBbtbhxJJV55BTLvTMN/
         cMtBqKMCsgKRdGMszZGSm6NSydrpvnzaJIqdv1zFN1RQ6uBHEbMFhkyLSA44KjyKG/bq
         WkR6dsk4g/OXZO+fgxKyerj1ZyT2TpLmZrUY/qZQDydAV0FYSFtR+rr0AYrAc2/rTZsf
         PzpA==
X-Forwarded-Encrypted: i=1; AFNElJ+YUp+AtRujaGYXzqVJFrXWuIRH4dATmYD3w2ED+inr9KfhJwVetBfPW/Rm+R+3kOiWtenm+OdOE5U/TMCZcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaktfJ85te7e6mFtGl9yDXoZ5VScQONodv+R+iZafMfFr7jy4j
	WHDSbfpVsQ13FiyesBX3Z3d3aMN5V6mWtF0t+LYC2b3jeuvT94yTWtfe+BLdwipMezhCfmPqijj
	qIV27ggEx8B55hb4Dsw==
X-Received: from wrwc1.prod.google.com ([2002:a5d:63c1:0:b0:460:d09:6e7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:469b:b0:460:e00:1215 with SMTP id ffacd0b85a97d-4606dbba226mr13872014f8f.31.1781527015626;
 Mon, 15 Jun 2026 05:36:55 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:36:40 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANjxL2oC/4XNwQ6CMAwG4FcxPVsztoHgyfcwHmB00EQ3splFQ
 3h3Byc9GC9N/v7p1xkiBaYIp90MgRJH9i4Htd+BGVs3EHKfM0ghK1GJGjt2PQV0Pk+yEePEDlU
 ryIiyboRWkE+nXPFzYy/XnEeODx9e25dUrNs/YCqwQFnW2nSadGPtefB+uNHB+DusYpKfSvNDk SiQWtuTtFYdK/OlLMvyBmEr1QP/AAAA
X-Change-Id: 20260608-binder-noderefs-spin-3a0ec0589043
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ThSc+6XiOvSEhAbI2lJs7zFq6IdGVbK8QsvE8anlggY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqL/HfiWBjn2pQX9i2okdRrgf8VD743RIyfUFIG
 JaqOU9px0qJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCai/x3wAKCRAEWL7uWMY5
 RulWD/9+k+2svdB3anl6lddCSSuq6jznBLx03PjvRK2Jc13z3hrDimNB3DQVMTYiwCzjB1rj37L
 Ma3V74rz2lH2OeVN3iQid2x503qkuatUmdrcd7yakPvMKadr6oayzKt8ohHhiXI3gr9R8WiyUha
 jN3XL+FHWvgyW1fzm5dvjlNJ2OywnAj+vX5YdZQl2/t27k0HkUmKqju+hj0LS03qDqC/lOruDE1
 6rwPQ3YRvWlEKQp2J9X4SoMF3p1w7oKsvig4UaKp0yzovAPhc+tRwX6SOIOXE9v9BPG0ztNNB2v
 UVQRLs2r7x7lNTzmcx0w2vjn2+NWNUTM+t9Zb2gDSCvBu6OHplojc/sx2E2ypTqqiREXHwkB/o6
 e9NpKhgxNlsgS/pduT7bNUqmKoJhgqSwOS6mSkaS9JZ6dD62XPuowtkjzFbDDfgom+MlNWnv76u
 tcYeAK0rTmKvlfCsKTxD7VRWvfAhtGLYzLp3BGNKt5oBjXpkg6PgilU9Axab7AUUffPxTIuhoPS
 yJhIrBx1xbt+KC0stTUYlks7vZFFvzj7Chk6K1ILSnM2g6zzQNN4ewQsLtZUsRyzz+P23jyReHb
 yWlrkSFMig8SDm/srwpMKenP9VAe0/ZgrjevyDByAQ+H6sVV2rGk/Saf2FAhJcjVilKMIVARDd5 X5/AbN7zAa0fUog==
X-Mailer: b4 0.14.3
Message-ID: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
Subject: [PATCH v3 0/6] rust_binder: update Process::node_refs to use SpinLock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
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
Changes in v3:
- Clone `node` after loop in freeze listener patch.
- Inline `resize_for_add_freeze_listener` in freeze listener patch.
- Pick up Reviewed-by from Matthew.
- Link to v2: https://lore.kernel.org/r/20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com

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

 drivers/android/binder/freeze.rs  | 65 ++++++++++++++++++++++++++-------------
 drivers/android/binder/node.rs    | 47 ++++++++++++++--------------
 drivers/android/binder/process.rs | 57 ++++++++++++++++++++--------------
 3 files changed, 101 insertions(+), 68 deletions(-)
---
base-commit: da61573f783897ae5a96c8f1c71aad6242344feb
change-id: 20260608-binder-noderefs-spin-3a0ec0589043

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

