Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AA1338596
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500438; cv=none; b=aeFbEc1l/wkiWgRit7MLdTpi9SCUMMOsDKdlOBP6K7c7Hz4I+2hWktLuFsoF/zsheeSiC48bqNEAWc9u8YT6d9TS5CiPUIQt2QvwoOKdFmEwXHHmldU5xbBF9lyOqG2tL5NOC8MKCxyVj6Vxc2cqDjsMgCC0A+rKi5J0xc7tUms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500438; c=relaxed/simple;
	bh=kud8Rw/Cd9klTCoUP4Wxhjtw93Ta53+nsPUvNFLO88s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=F9xIHHcJJrDr75JDUFit79/73yNs1TXw4fqAC7FrUZef4a9WZt4SVZxFBw2WmoO7NyIMQuwEQdDnkPWAiLqMaeIJakPBzNiMSPI2HJrHjqhOrApcIuyL6yVXHRXTa3Dp9RX1+zBY1wVqq5kdgWMkQW1RylikziZMaTO+GJZRJFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hMoRDTn4; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hMoRDTn4"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836b7fbf4fso7943435e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 03:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771500435; x=1772105235; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oTB+4zGlLiIk++llY73cireeXyt+xsrzbx0t1uTG5ms=;
        b=hMoRDTn4P2zMJ0m1yb2no+XmCvkD+P8oQ080B8aypTKk1iX+QjGO2Qy1ugL0ikm+4G
         gvitah2T3nAmtkdJdmSEL8Vp72D9b39zLbQIUdczxt3+aQBX5ZLztP8Yc8NyLblVOI71
         R4ypJYAfubXCQJGFMpL2y8omJIDntWyifnOdapuSWZGOm+OK0S9AJqrL5TtPQhqqA2qd
         FZ6W5ItCB5TFLZWt58T7fgs2sX8d1smuoDxCKLkuUHZAjAF2jrXkZEt7c1iABdR9eqHT
         90O0KdylhKia8VYJDhjanrXTBi1jg8Kx1gwJ6Vm98Ez2QHS6UI//UWd0lsYGRaCAMtsz
         SxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500435; x=1772105235;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTB+4zGlLiIk++llY73cireeXyt+xsrzbx0t1uTG5ms=;
        b=BPj6TWSleNtX97/ITlUc2wHnzHNMWrQPK9Gm7AzYArvDMSamMPe8D7luTSRQxtB8+L
         cRh6a+fJl2J9RGbUFUvqSoTCjmoesHGPAsHnzBBOOSB54H6Ba0NyD7KO39Z0AmmF8rMD
         SpyFTuilh9SdHfcYleYLmhDFXnq9Bx5ePUYTedvmDTe0ORVEKcWnoxWmL1udJ3yWI0uT
         bjIb6KRJivpoH4Y5WusesA0dWK04n9xf2zNXesP81wXMvPLuxI1FDAbbInyYqzdep849
         215FhXxpZJWiTek3gZ3vxox1ISrGjdrnVTyDsAQ1Q7j1kOHgdU9S2ANZwkM4pk7lfsZW
         HK2A==
X-Forwarded-Encrypted: i=1; AJvYcCXFo3Tt6y7isT297sY4B3BIEx+VxWd1AOfqK6KsATut2swD1JiCNSMrQ/T0xe951cON6/PA4KXF3Aj5tZOVZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNtELXzMUoebqhKuSYFXdXtVD9pJqQuoNYZOqZPkvUzvDvwsmP
	kVyhJr+FovC/LpbDY1zqPoVo79wi67krncfaHkLcB2fDDqYY3YbjvbKPf4LYr/tnVW5KCQXMN9j
	i52VpvLGNrlbYvXBEJw==
X-Received: from wmdp17.prod.google.com ([2002:a05:600c:5d1:b0:483:291c:7f23])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6207:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-4839e63d7aamr34476115e9.11.1771500434759;
 Thu, 19 Feb 2026 03:27:14 -0800 (PST)
Date: Thu, 19 Feb 2026 11:27:00 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIPzlmkC/3WMyw6CMBBFf4XM2jF9pRFX/odhQduhTKKUtEg0h
 H+3snd57s05GxTKTAWuzQaZVi6cpgrq1IAf+ykScqgMSigrlNSYX2VBx1OgjHNBY0MbRL2M7qF Kc6aB30fw3lUeuSwpf47+Kn/r39QqUaJ1rRgu2gtnwi2mFB909ukJ3b7vX6TiNC6tAAAA
X-Change-Id: 20260213-rust-binder-ps-46d9d060243a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3613; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=kud8Rw/Cd9klTCoUP4Wxhjtw93Ta53+nsPUvNFLO88s=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBplvOHLd0GYFbusVW4+JR3yWroKuAkhF7/YjSgL
 cVCvC6JWSuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZbzhwAKCRAEWL7uWMY5
 Rva/EAC3IpqMpiN/Yn9XJBKv/NdyQab5MuF11dY3O5Q/Iho3XG2gxKTf/Av5Cq10v1NS4/JZtmX
 CwuN8QxEVuDs8/hlZ2tF3SjXY2QpqjR65EMv+7rQ7Upi6pUndeJ6Qua70XsfAoFXfWPfiGVi1Vg
 d/h2aIXGzl6h5Zwo82D8Hiz6clM+cAk7MjvQwTtpRPoTKJcUi7RaTfC/kDUy3B27JQeYgHoV49I
 7y1rGRRvc3Gk9Q77dM2gf5oHJpRxsNnXp1HgTW9quPu04tCbO3pmKLerVzqDTrrhanRsFgoEUR8
 2vXd2ROlhbJUqxMQbf8UcMdZ5P++WyEUpBKRNvSv2oDoIoglEAxvEja7qE32Yjblf/wyj04J2Mi
 pOk41V7w24o1Md8SJqidTcYbKPS01QRsBHU41Wo6a++05YRSl7LTQZuwqPWumjmbBhgQdfr71mK
 G8n/ls/OB0gBOAfUa0AxFswvtK+7l8jM+n85MtoyuNdGaCGefC6XxCHsJwt4vs1WbADPbUl1Ahx
 jyXOQUzWowf9hx7cxmyELUTS2wgdQuX/6vPyu9yCChLE1vvR01YoFsL4152FKFMBZjDXlsm1DA8
 gi2yGmFXokIzJmxMp6MpbPM6oJxelfSG+UjBpPIEwAOqVbT40ZcggF9uo4Lm2umyYYlGYEWXVuu q/+M5JTNAs8leeg==
X-Mailer: b4 0.14.2
Message-ID: <20260219-rust-binder-ps-v2-1-773eca09c125@google.com>
Subject: [PATCH v2] rust_binder: avoid name mangling for get_work[_local]
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Currently ps -A shows processes waiting on schedule() in functions with
names such as do_epoll_wait, wait_woken, and the impeccably named
_RNvMs2_NtCs8QPsHWIn21X_16rust_binder_main6threadNtB5_6Thread8get_work.

To improve how ps output looks, give explicit non-mangled names to the
functions where Rust Binder calls schedule(), since these are the most
likely places to show up on ps output.

The name of rust_binder_waitlcl is truncated instead of using _local
suffix because rust_binder_wait_local is sufficiently long that ps shows
unaligned output.

This is intended to be a temporary workaround until we find a better
solution. Adding #[export_name] to every Rust function that calls
schedule() is not a great long-term solution.

Suggested-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Rebase.
- Clarify that this is a workaround.
- Link to v1: https://lore.kernel.org/r/20260213-rust-binder-ps-v1-1-6b90f83c0b4d@google.com
---
 drivers/android/binder/process.rs | 3 +++
 drivers/android/binder/thread.rs  | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 41de5593197cd29b71d1cb49829a1ff878bab249..f62f626f928e7ea4965d03c92cc988f344c6ae81 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1442,6 +1442,9 @@ pub(crate) fn drop_outstanding_txn(&self) {
         }
     }
 
+    // #[export_name] is a temporary workaround so that ps output does not become unreadable from
+    // mangled symbol names.
+    #[export_name = "rust_binder_freeze"]
     pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
         if info.enable == 0 {
             let msgs = self.prepare_freeze_messages()?;
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 0b62d24b2118abe10577029a0129887e4ee8c6ba..6f197be0fa75d9d485c6cd659fa28c872a88af93 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -513,6 +513,9 @@ pub(crate) fn has_current_transaction(&self) -> bool {
     /// Attempts to fetch a work item from the thread-local queue. The behaviour if the queue is
     /// empty depends on `wait`: if it is true, the function waits for some work to be queued (or a
     /// signal); otherwise it returns indicating that none is available.
+    // #[export_name] is a temporary workaround so that ps output does not become unreadable from
+    // mangled symbol names.
+    #[export_name = "rust_binder_waitlcl"]
     fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRead>>> {
         {
             let mut inner = self.inner.lock();
@@ -551,6 +554,9 @@ fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn Deliv
     ///
     /// This must only be called when the thread is not participating in a transaction chain. If it
     /// is, the local version (`get_work_local`) should be used instead.
+    // #[export_name] is a temporary workaround so that ps output does not become unreadable from
+    // mangled symbol names.
+    #[export_name = "rust_binder_wait"]
     fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRead>>> {
         // Try to get work from the thread's work queue, using only a local lock.
         {

---
base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
change-id: 20260213-rust-binder-ps-46d9d060243a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

