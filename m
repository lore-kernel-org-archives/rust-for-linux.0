Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E054756C3
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383620; cv=none; b=P0sOhR2ZcKLtqdV6UBUHGaLcxZEV5iju5fN6M+g5LID/8qHQEspK+i+WdFnmOodg4Fpo1LF93X3smwRdS6hhrqIO+kcBZ0u+msfPIeWQ95fb0otyVBxaegT8AaQag+qa+c5ZezF5CEpQT+06noBNK8fE3G2IAaV4dFnPNNJ+GlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383620; c=relaxed/simple;
	bh=7yYnTkDLzueMSUsYZysN1eVLm4bkwc3Fym28lNXfUtA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FSLAHyeo00VeQNPTWmfSW8LVi/rJZXwN+Rmr6bMJYxQ8XeYHFGuY2hTw2tEt8lqSy/s4LyD8JN2NypIOEEdJM/XfksMCiVbzByJINeEVEUh/et7rLJDwaXd0aEoJevotK2cpPSADs5vlwKRITDppfsaYeYWBHap0/Cp+bkW8NnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=stQrNy6Z; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="stQrNy6Z"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c4f6f66dfso1844732f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Oct 2026 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791383613; x=1791988413; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3eFBvcoNf1j+MWtzWga2AOfx4ORJ4p8JbpHFXtfrLRs=;
        b=stQrNy6Zvlw48PZej0O4Qb42ZdugpJsqEt55BEz2FAxbth0GkVE02L4uP04/fHVoZg
         wji/Nk//1vy9dGEU44Bx8qhdY/CSyMEMGigICRvzZPRXqnWtKZWLnLvdCI6G6rBSvpZD
         y72bI074ARvvq2lrVs09JLRwbvOrpLtdejcQOnOJrui/LCNgLquAhnjO35jzMjhm1q8i
         F4UgqUuLmNzeSxj3PCfXJuTdk9rnffIKkNUej3DgVttqvLQnGvl9NJalG9MvA4Dn1shP
         CIqfkL9kt22PzLtp0m7tfsoA1WQT1Zfv2SK6yULb+811bajWuTSP5gyUaG3REIxiZ7zv
         jsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383613; x=1791988413;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3eFBvcoNf1j+MWtzWga2AOfx4ORJ4p8JbpHFXtfrLRs=;
        b=sTQRiU578lhcSDktIio/vOdTUowwy09Rj3NkLFZ8Md/TRvz8mhN2QCmuW64V4eKkp3
         ua9XLC7b5lS9iW+77TJOgzUiw5bul/23pX9Ff1kD7ZNharEuZVYN6Vy3GBpNYRSK9QCl
         HmvbApzqSayA9psNDC33Eq/Nudw1M544CENzAdpnmDLpxfwIk3cEsJKit86k57d5huo8
         JjCiT+1E9h1o2YVLdrSz1+kBAdJ70cJwrTTxAOw+e2oGEJWtx1sVYqxNV7OqJ8SA3Ics
         qsNmFGBsw7fk6x6FFKy+Ht7c/hTvXju0x9K2eR9++jhf+XAL2QfILh0Z8hcUOPj8oBPn
         u0bA==
X-Forwarded-Encrypted: i=1; AKwUvBx2EOyIUcJXbm4BA90xzLqQ2QwxcbT549u74P2dGaeJPRE24G9GXUCquEPwLjM0saPZRkcPPw4f5dQs2W4GJg==@vger.kernel.org
X-Gm-Message-State: AFuF++lroXHFKh1zYETvFd+7b7WKBypNteq34ZE0ezIFSwAfycYA/Zzp
	QL7lto1pi9yGxpaC97h1ikmhakV5xJLUtPXuXS7q4C3HNdYkckCMjUgQ+bi1Z7KowFHSQYRw4eD
	XWCtzSkRLCpMmn4qQkQ==
X-Received: from wmpr35.prod.google.com ([2002:a05:600c:3223:b0:4a1:7ed0:848b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64c9:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4a1800d417dmr38827685e9.1.1791383613372;
 Wed, 07 Oct 2026 07:33:33 -0700 (PDT)
Date: Wed, 07 Oct 2026 14:33:27 +0000
In-Reply-To: <20261007-binder-consolidate-txn-prints-v1-0-c1032ed3221f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007-binder-consolidate-txn-prints-v1-0-c1032ed3221f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2793; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7yYnTkDLzueMSUsYZysN1eVLm4bkwc3Fym28lNXfUtA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqxlg5g83qZuMylpNIDat+dHdR6bJPs2va6ac08
 ZsG4+gQVXaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCasZYOQAKCRAEWL7uWMY5
 RjsIEACbB8svpZNFa9U5Py17pB9wR8DWlzldpnGpY5hnhIy0cPiYkXYCBEYHocu+d97SBiixD7m
 5eTZR65YfViawQ48eEt5ivy4AjDIV3PIzUMSbawBdvP5WSNSxOidD7z3oKwTSzOqUFise6qnNAQ
 cBZz/6t2LdWYmnfhovcvli8g2wScwN8UiP1gpqEAqhbtsKUOani+HJCg+AbWLXdn3OtrK3WBpH8
 7XqfjsKZQcobkqGhPsGnMpL71m16wukor1jgcrgJr+yZMABb4v0miwOfUjQQE8UVzht+4a79cFM
 YrLEm6b4mlU60A+iaZRcARicyZXHcs9V0OjP0zFTif+IENB45Rwze2hXqMUKuhOg0nIa6FlLLrv
 0+nDrzfan3LKj6u6qb9fxvRGHyqa7r5IV+hf8I6JYw9ONvWke6cJrRv9ZE0o05dgpDypnI5udIj
 uGFh6/FCfU6mR93Fi4/vEF4wN1C81ZTq3h9I+40Ux6O54eBFVU3AJEuRZBVjPfrnq9gkiK9brCW
 SQXzyaRByp8uLCMolt+iMdo3SSMD0k/VPCTnMtr7v5eftPYR/x+oVcHPC9S/unF3KgsnMTY+RLL
 fYPYSdA+6sZbuSTLgozGcl96Di/Qi7OeANUKm/mjOnhKJn00KFbK5aC8hj/hzTvJV0RAnQg4YqW ORGHVdpB66vgsVA==
X-Mailer: b4 0.14.3
Message-ID: <20261007-binder-consolidate-txn-prints-v1-2-c1032ed3221f@google.com>
Subject: [PATCH 2/3] rust_binder: store Option<Error> in TransactionInfo
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Store Option<Error> instead of a raw i32 errno in TransactionInfo so
that the Error value can be used directly when formatting transaction
failures without having to reconstruct it from the integer errno.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/thread.rs      | 6 +++---
 drivers/android/binder/transaction.rs | 8 ++++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index e5ae3b0e56c5..5bb7ae2f7920 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1333,8 +1333,8 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             if err.reply != BR_TRANSACTION_COMPLETE {
                 info.reply = err.reply;
                 info.error_line = Some(err.line);
-                if let Some(source) = &err.source {
-                    info.errno = source.to_errno();
+                if let Some(source) = err.source {
+                    info.errno = Some(source);
 
                     {
                         let mut inner = self.inner.lock();
@@ -1476,7 +1476,7 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
             orig.from
                 .deliver_reply(Err(BR_FAILED_REPLY), &orig, Some(ee));
             info.reply = BR_FAILED_REPLY;
-            info.errno = param;
+            info.errno = err.source;
             info.error_line = Some(err.line);
             err.reply = BR_TRANSACTION_COMPLETE;
             err
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index e627522141b8..d934c6821b15 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -136,7 +136,11 @@ fn new(info: &TransactionInfo, ctx: &crate::Context) -> Self {
             offsets_size: info.offsets_size,
             return_error_line: if failed { info.error_line } else { None },
             return_error: if failed { info.reply } else { 0 },
-            return_error_param: if failed { info.errno } else { 0 },
+            return_error_param: if failed {
+                info.errno.map_or(0, |e| e.to_errno())
+            } else {
+                0
+            },
             context_name,
         }
     }
@@ -254,7 +258,7 @@ pub(crate) struct TransactionInfo {
     pub(crate) offsets_size: usize,
     pub(crate) buffers_size: usize,
     pub(crate) target_handle: u32,
-    pub(crate) errno: i32,
+    pub(crate) errno: Option<Error>,
     pub(crate) reply: u32,
     pub(crate) error_line: Option<ErrorLocation>,
     pub(crate) oneway_spam_suspect: bool,

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

