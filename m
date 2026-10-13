Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE174FC329
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895083; cv=none; b=EVwPO1lkD6afth01QoUGVB0Us49cKq8zxpTdLoraLpTibPJleiyvEi3GpQG5ANjN2zEVv1qfcFNF9H/nqsgW6Fz+7mpY7F/nd4sVf6hdKj9K8IH7xUy6nXPbzwEoNDSBaLbrdfTF8x8kuuGomWWEOYue7V0FDbp/NbQsclV/1xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895083; c=relaxed/simple;
	bh=iowhCacAK2V4dX8SDv7KjqwhUjEA0e42Z48+3/gEqvI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RKP25OVQJYknv+mKFxpgT3DWNlq3Nlc8rOheiLCaUCW2+wpeE9Ky0ivfS/KeJh3EB8tMBSRhkd1ACOUVMYew9WY02iIDe33OGBvpooqSfJmaTzSe6yvk3LjdrXhOsYeqofkXaSsxgz1KNCaeYog178XflYRqTnMcVHLVgJnV97I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CmrcVk9t; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CmrcVk9t"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso34328505e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 05:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791895080; x=1792499880; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZSwHr1dc/2t65+3ouAeLrzr/54Ej8/Nu3EILLvl0ys=;
        b=CmrcVk9tdkAny+U20n2XKrUT2T1Zm6jrDgjARANGTHev/KR59040crOdcPzH2UfkKn
         ebo8J+vv/jvG0Z9ePxNmMDP+7k8nq7GcGQ2qFYZmcAB+xMJrxXewGW9opCOB6Wivujeu
         3qeosbcZWP7dbo0E7Hj/yEPorZTouEkq+Z1DYeKTX/DaI9OBPh3/yZ9gYf0sSRLrEKGP
         MV9hoZs+3gtSZiM+f/seXZZ/qdhQAZm0NnA0jdZWknx+fImBuxL5AACMBG+aBX28TTzx
         H1f2inZHRYilh9j0itfGxbnLBTgsMbv0ZV1ha0FN6GrtjZBnLaUY7T0+DbFASZQ8V/c4
         p1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895080; x=1792499880;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZSwHr1dc/2t65+3ouAeLrzr/54Ej8/Nu3EILLvl0ys=;
        b=FYdFI9VVrzuxvxkTIVHzda4TMSdEREWpI5RJrpqv638j0+mLHEyJbKvdRG3UN2Nhpf
         9PeE8VVIp+QDFRnHYy2lGy/EXC+LtdngwU3/jovjf4ZPZ/Do5kkHV/VUG2V8ZzJoy/IV
         ONxxAyhMrdEu34RHWB/emr2D7aqLRs+ChYM0JWTeYDPXvc8/Yi2MGVhHv91OJtY31tbX
         ++nrZ3rXGLcKIuiHaCdS77U8L+v70hrjHl/aREx5I6sJtqP+tApIwOBwsYdBXpJ7/H34
         tZqiPL2X1yDQAk9AZDoUQPfLq+l/oLHX6zAmvXTIPRiX13ilfRC2UXfnbxeqPqrWfNr4
         v2Vg==
X-Forwarded-Encrypted: i=1; AKwUvBzhHLxXg7eGVZz+7B6l//OU6D/lpd7f5ML3PMNoo7RhnJbYJ0NiXLyBgR8ywhKQWKUZia366pGYWpZ/6RTlPQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIsuS0AkrnqoOOj7A7JPVObe6HG2dQlYHqJabf6YeJxdw7vBzQN
	qyIUPKWPrmnyv8GhMbCUlzS61EALqpI+bBlyP84AK4ZtsSbxaCTrtJk5uyIGGGZUaE4J/H6QTss
	dc1U0s3ZWWvbFNfpnpw==
X-Received: from wmog7.prod.google.com ([2002:a05:600c:3107:b0:4a1:8dc9:744a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5391:b0:4a1:ac66:6ac8 with SMTP id 5b1f17b1804b1-4a1ac6671c7mr37454675e9.4.1791895080202;
 Tue, 13 Oct 2026 05:38:00 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:37:55 +0000
In-Reply-To: <20261013-binder-consolidate-txn-prints-v2-0-cf78927dab23@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013-binder-consolidate-txn-prints-v2-0-cf78927dab23@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2789; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=iowhCacAK2V4dX8SDv7KjqwhUjEA0e42Z48+3/gEqvI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqziYj8TJIYQl2pxY+fbHRHM0GIVONcWTpaNLAp
 ppJ0dnfFQWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCas4mIwAKCRAEWL7uWMY5
 RvQHEACNoXZiEwD2Kzq8rxiL9RhRrtgJKWsHnP0zVEgZvASV18KUExmJkt6+wW9wfLPKOYtKpgo
 CHfunQQgHhiGYsavklxyV9zkEiNdh5sJS7L/lOe44LTFWgQftZhbx3Rficar6wlbHXF88xckOO5
 55udFeSaHyS1oPK9Kukd5qiMYEZJVpOPcuPHhdAwRYyzYk7qyf10CWr8g8pidzrITMMM1UQrV6B
 C1+ACuLBKp+bpvUICNVLvxYrWKwne9MNJQwIVsIET+4W9AIwjxSb/dbDU/FKvBdeHtVA5PFOEjy
 bM9eIqhd4Ib5q1h4SFetgYO35IxXtvI72Se2H3qvhPXVmd/x2kR+5ogupjsHuesneeAepBVyfpQ
 eyRzoftnzKBGuaaw7Uco8Llk9UXh8stICrtXnREaJWhlRO9nrhLhsXRlejw6qYn/haydtzDSixL
 d5LnSEkPDjHhBVioiVqPzP3vlYpwqGkheoE6McTOzmHD6lhK5XEBZkpXk3qHIjA6cs9q9A2nwLI
 c6Nt3k3hlgUffBC7jz5y5zMCVivL0xWqzVHi9y23eYT393M46T9uh7RjmkJQlFG/+xamfVHe9VD
 xYue1Sa0vh42EG8yyYANlDeHmjtwvAnj4N2ex4v/Sa9Q4aV6mb9oOEd8aw6u5PTxCgTbWG/7nsK nuY03LNCpmMekiw==
X-Mailer: b4 0.14.3
Message-ID: <20261013-binder-consolidate-txn-prints-v2-2-cf78927dab23@google.com>
Subject: [PATCH v2 2/3] rust_binder: store Option<Error> in TransactionInfo
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>
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
2.56.0.385.gd3acb90ef8-goog

