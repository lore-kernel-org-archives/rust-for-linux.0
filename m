Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686833;
	b=2RE+XY5Ha5iqRfKCpuaXQP1wxoYS9Gnzd+gkN0kN0coUqnz9pJ9jJHYumzrltzyZeLN5
	 nYAmfPWqerclKivnTSZorbmfPsRy9R2aB7epMtVRwzTVLt7EejTR6pa5iwcwCUv4TVFNF
	 JnzV2SCSaIApC3CHe/6tmWGz+eXFMS3gJmszrZ8JW214As1DeMlsitzW53wqvgohF2c4D
	 cASaF8bLmY01Er7xXyviX50slHOgUfVbPadSHd1MjWFkmyfemDjyBYRtwQrKKD79sr2y3
	 w9zB8kzc0MY4r83j2xpRc3WbH5/9FQP5B+Vz+gkpTJiV9LUrQAme5BezyKVmf3lM13Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=pdTN5k5ljISeX4Y7RP4qX7eVJP6sJ2SABjzpm0RRdMI=;
	b=2WuB2tfbrd4fMWIIVJ+awsJ0eSF4rtluQspEDsB/zPmVXSxuOCJpHBAK5b88ifSggSmH
	 0UT0Fn0327sMLJKG9hJSoLwr8n3PfRw18EAPIlQHqsVD6/sczkoKFYj4sTHH8185zzmUY
	 ZJ/1cLgEqzNfZKWEu/QrXR04ytwxFozqkMajsfWEX69WBdhbc/wfXOZAzrIteMJ4PnqdB
	 e/ZiCmN1b+H3ZvQorEaOY6xWNERsUihL5wSSOqbmzlT3ZjB6oMQcEakDGCQE2NsvlrJUB
	 cE8vhBhNiqu0SxDvQWTwxjU6JQI1dZHQSKewOAfYCcJA1ZrH9TABL3X1G+xFKPc+HsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KxK5CpM8;
	arc=none smtp.remote-ip=209.85.208.198
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F6E606A6A0
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 09:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F6E606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KxK5CpM8
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3accf0b1addso21850101fa.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 01:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795686831; x=1796291631; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdTN5k5ljISeX4Y7RP4qX7eVJP6sJ2SABjzpm0RRdMI=;
        b=KxK5CpM8Uy4nT8ZmGA3aPQ3diwW6+siEZpmqsdyTnIjDLbUasIReNR8GUKpiARIKjw
         hieUypXR2ZZnmnSUN3KNltr4SOQPWokU7x99HG/VCZEqxYCH2UPu25GX9OY8O+HOV1J0
         P07riwqXkmevaoK2BNItAHTCAl63d58fXFoFQ0bV91j4aalTOIN1MjtzzCKPor8osBXX
         qcWUnrH3VfVBNnWBphBTXVWhYp4cfEVDfu6jqWtP/Z9kESGg/jcQ14GXWdeyXqeJ5z8T
         fB23OTsJ3XkN3snMWi4lShbagEF1t0FRY74SShIkH/murUkiWHkJBFItAFuOSwERXyT6
         r61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686831; x=1796291631;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdTN5k5ljISeX4Y7RP4qX7eVJP6sJ2SABjzpm0RRdMI=;
        b=beuLP/z3Vq/FN0XjuKAwExO2hnieyUZcb27xGkRKbBG/3NEq5e5SPAT3i/Yw6ksTv7
         maqof4kVv4pFDWwkISxnI/emZR+g18C5FWyWgwPhlpiylD131zjFTJURLqdQ6sNPbE27
         y5Pnkz9JIxWQY1QKrHMehHSmlhWpC35NZEMcTplsC9h9+lF4DkqZX1SZsC1EebBXYiPk
         Dcr4TZaZI8zgAQcqVRn1HJh7uxFhT5sMdtFf5RRcLDXDEUXo1vqeMh2XcI1hP0k/m4lI
         yzjZzZ4gfBUHPsrZaCj3Mgh2LOnV5TtamkKh/uLv1oIP7NJnKA/RU/Dn9Ai+KPL5Yw/G
         UUiA==
X-Forwarded-Encrypted: i=1; AL+hErFm+UCjIMzoi3nOV+9uAVW65O9rWoaUOLRH2HXEEYu+gQdf6U/py/m4F8Sr8vczF+ExHscAiWzOpORTj8rivw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/MdXa2q4TnauGU058BARBiAosCEC82tbyOGZV0/8HKHUe7Jgtn
	BSICP5F/cNesWk1h0d9049595v+RA3qb96oVSlMrH3ujbhxSGo6UBYK/iLQsC6qwcjlc3aUPJu3
	XAO+Rkc8Ykw9UQs6w+w==
X-Received: from ljis24.prod.google.com ([2002:a2e:9c18:0:b0:3ab:1b6e:f31f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a2e:a98e:0:b0:3ac:ee2a:ce63 with SMTP id 38308e7fff4ca-3ae7fa13056mr60047371fa.18.1795686830885;
 Thu, 26 Nov 2026 01:53:50 -0800 (PST)
Date: Thu, 26 Nov 2026 09:53:41 +0000
In-Reply-To: <20261126-binder-32bit-fixes-v1-0-22fc21baf6f8@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261126-binder-32bit-fixes-v1-0-22fc21baf6f8@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3242; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=RlIYXXPHdukFDAnF4wZCL+AIuLeA7xeGITe8j6jhzlo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBrCAGqr4I2163inFA/Zi3cpPfSdhO3k0/n4Genc
 N5kn7IOOPKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCawgBqgAKCRAEWL7uWMY5
 RhF2D/0fBgCYQx+auxYq7WhW7zTx5GvnMYrqA9l4lwwthI8HTWYwb3ygn+VWkl30lZOME7m2sJL
 8JQfQFpR9pgi7s2N7/h/wI7aYE4kDSfr2taVYlbPUkB0JHIe2bcm84RS9Ag5mFdfOOSGREmrCAR
 uNALZ593EIEpChdkQZ2Hiik73Qxi6nv1mx5nma6l47Xuf+SW7Ppok3YxG7+Ha3PmCMGLw3b6FSO
 EWdckukNuXKiAol2qCAu1nhpJr7uK5UlV86M/4h8DFz1zO45iqZ0Sp40/uwRolWiL1eHX1mO50K
 w1MA9xJU0O3Q6dUv+gYUGT+RA+rwgTrOQw6uDlkCvTza+1ZBZb1zZG0Ju2XSVrn//LP9yt5TWRp
 xv6gVPLBzMHiETa3r6LIwOGj3jU2GH9nCpJcr6z8D8MiBXEDPHjvfJue3OU7DyMpNiQgQkpRDAs
 vv6J7fw41cEzDGVENE9T0YJeZGZ3U1uPxUhrPpFBOK5H5r0JpeZKNP7pt1fRSYokxwIA7OJvvNd
 VGO6TkR2iZvfVSWFtQcTL8b0Awym/N0ArUDvFNfL5FQ0CKUcHze3tW3G+r1yHyD/AVUuK75wq1y
 ASCcZpWwotsngV0w377NhSaR7dWY+7cowdqLb2I/nZTMApByOiqELlUo5aSYYq6rhqnvAhxNWoK B/P7NtQwkYRXiYA==
X-Mailer: b4 0.14.3
Message-ID: <20261126-binder-32bit-fixes-v1-2-22fc21baf6f8@google.com>
Subject: [PATCH 2/5] rust_binder: clamp write_read buffer sizes to usize::MAX
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On 32-bit kernels, casting `BinderWriteRead` buffer sizes to `usize`
silently truncates lengths of 4 GiB or more modulo 2^32. Moreover,
`Thread::read()` subtracts the remaining writer length from the
untruncated 64-bit length, inflating `read_consumed` by multiples of
4 GiB. Thus, clamp these buffer lengths to `usize::MAX` and compute
`read_consumed` from the clamped length.

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/thread.rs | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 54a208caebe1..8357313875d5 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1520,9 +1520,10 @@ fn oneway_transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> Bin
 
     fn write(self: &Arc<Self>, req: &mut BinderWriteRead) -> Result {
         let write_start = req.write_buffer.wrapping_add(req.write_consumed);
-        let write_len = req.write_size.saturating_sub(req.write_consumed);
+        let write_len = usize::try_from(req.write_size.saturating_sub(req.write_consumed))
+            .unwrap_or(usize::MAX);
         let mut reader =
-            UserSlice::new(UserPtr::from_addr(write_start as usize), write_len as usize).reader();
+            UserSlice::new(UserPtr::from_addr(write_start as usize), write_len).reader();
 
         while reader.len() >= size_of::<u32>() && self.inner.lock().return_work.is_unused() {
             let before = reader.len();
@@ -1592,9 +1593,10 @@ fn write(self: &Arc<Self>, req: &mut BinderWriteRead) -> Result {
 
     fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
         let read_start = req.read_buffer.wrapping_add(req.read_consumed);
-        let read_len = req.read_size.saturating_sub(req.read_consumed);
+        let read_len =
+            usize::try_from(req.read_size.saturating_sub(req.read_consumed)).unwrap_or(usize::MAX);
         let mut writer = BinderReturnWriter::new(
-            UserSlice::new(UserPtr::from_addr(read_start as usize), read_len as usize).writer(),
+            UserSlice::new(UserPtr::from_addr(read_start as usize), read_len).writer(),
             self,
         );
         let (in_pool, has_transaction, thread_todo, use_proc_queue) = {
@@ -1654,13 +1656,13 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
             }
         }
 
-        req.read_consumed += read_len - writer.len() as u64;
+        req.read_consumed += (read_len - writer.len()) as u64;
 
         // Write BR_SPAWN_LOOPER if the process needs more threads for its pool.
         if has_noop_placeholder && in_pool && self.process.needs_thread() {
             let mut writer = UserSlice::new(
                 UserPtr::from_addr(req.read_buffer as usize),
-                req.read_size as usize,
+                usize::try_from(req.read_size).unwrap_or(usize::MAX),
             )
             .writer();
             writer.write(&BR_SPAWN_LOOPER)?;

-- 
2.56.1.839.g22a8290db9-goog

