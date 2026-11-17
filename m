Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957573;
	b=OcEdl7fHBS1V+jjdD945bYcu7QmvsFDuDCb/N77NPsiNE/a+kO+fmGqNLf4+Jlgtk7dq
	 ph72l7TKdne54GD+aKvWyyuzFTFf+zi1Vgnz+If8ylxDhtFFmJIrCkdcrqG605uy1mbC3
	 lFDdiOaJVGSLBYHPWljo0KumildurIwgn1zH2otx53Mo/GhJnj5GmLF3RJYRaC5MnrSxG
	 ASVre0ra2f/3En9Pvkivqk8FYcmVGP6xXK96scELllitMO30iROw/9CymEfyyjgz+cWt8
	 KSZvCqN/Q7uUmnuxkqYK/FDUBokVGFbRO7RtnDAy1daJUD3uUNXVtJwm9LkklaQiPpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=gUGlqWYHoDvFFPdsJt6mn1HEJRjMR+qNjaGOxe+inKk=;
	b=TEVbL9i3Vv3fpVWC2MzClovJ86h2+9R6/MO8k2h20OaJBZQ4u9Sc4xtzLNI74JwjAwxs
	 L2m+oc1gH114xuPo6X1Lor2VbDCitCyeUyTMK7ncRl7VR8wg4tAI3XLjd16syJImy+EKH
	 kO08c1hkQqYMxLu46ywN9VM1GPh4pFkzAzwLTwMN0h+VlQlJlikQj8oy8sT8GyooSnwnh
	 FqJuxxEmFeC9S38VckSJwQlrSyXREnyFGwU0LIx1gG0SAn7KJf2j2/bBeUZw9kGK+WD23
	 cy8tFgOeluGm8k6L0zS7eYliVcbOpHf2gUf9FasUXOJCLjFkqh3YBYwSvpqq+G3Gevw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OEldnhS5;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36AF606A32A
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 23:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C36AF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OEldnhS5
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso506809eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 15:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794957572; x=1795562372; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUGlqWYHoDvFFPdsJt6mn1HEJRjMR+qNjaGOxe+inKk=;
        b=OEldnhS5zkaO6vUwK0z1qiQWsR2ZqmvTx8qO8c0QNLsDb+rs7mgEEpBHHynZfrne/r
         lR5vdO2FVpSvAqoOArwEpS5i0tYj+rtoRWKJdTNEkb2yvdiUL2viY5b1YIK44ggqrkiN
         P19Gj+k0RnIx5JFqLctE5VIH0dEUxtN/ij9tmOb73uZ0KPnRzyFFKmS3mpAuLB1PR1sZ
         dEf9XKRIuswuC6tcnLrl1obzswCycmz9mZuXkZOrB3aImbJjkF/GudwtiT8vS1pXoUJA
         /Rid1NJGaaFDADX5sLF/4eUYMhwZOWTUplZwzZKpPsl4ggryWoOq0tYi578Jhuo2p4kR
         NjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794957572; x=1795562372;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUGlqWYHoDvFFPdsJt6mn1HEJRjMR+qNjaGOxe+inKk=;
        b=jlZ2iWtJPFfAYzE3mDW18iGsJyNXXqHUFmQdUvyqObg0fTMztrMuEVP9DYtWjVHA30
         zqvwtS0SfMzucaDGNJQGbrD/uNgESFgZiIGsgnl/CMiz0viga9LwnThsSGD7bwCqZ9x/
         +y/wOlxll2pQcdWoWBTJAE9HiVttAmDbbBaMobshfkmZn/jSxLtJGtYy4HnqydOFJ4lF
         Pro6866eUG3qzW2R9VUCkwA+IPuipJsbf+s64u+7fWp/psqsKwTXbHuPuURrTo8ez1j/
         muwapdeZre9Maf3ciHkW67I+7MLZW3q0tqxPTE0GYGjAogS27Mz8yYn+yPHXPmO/As9W
         TIpg==
X-Forwarded-Encrypted: i=1; AL+hErED1E6awp8dhLnIEI0tnbFG7G11rx3GSsXK211YC74xJAeufHhjpjuC+R3YGmOvQpbGZNH8Gb3s7wC3HToHIg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/NxVkZSgdI7lC7AMxsgwkrzaLEnlBPiUbWq9DcwxvoS+0AGQd2
	KC3KdE/Oq0s2/doxfOS86VN6vID5lYAmBxSNikmx/9vkUn0w2jwo+jBRNmmKB6Xv9VqYBL8ZhvK
	uXnhkQDvx3GS5Xg==
X-Received: from dybqd1.prod.google.com ([2002:a05:7301:6401:b0:36d:3429:f79f])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:88c9:10b0:36f:350b:3838 with SMTP id 5a478bee46e88-3828121ba36mr958286eec.31.1794957571614;
 Tue, 17 Nov 2026 15:19:31 -0800 (PST)
Date: Tue, 17 Nov 2026 23:19:26 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117231927.2200674-1-cmllamas@google.com>
Subject: [PATCH] rust_binder: disallow binder fd transfers
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Transferring a binder device fd via BINDER_TYPE_FD or BINDER_TYPE_FDA
has no valid use case and can create direct reference cycles that
prevent Process::release() from running when a queued transaction is
left unread. Moreover, a binder file is bound to the opening process's
task, credentials, and mmap state, so transferring it to another
process breaks binder's per-process ownership model.

Disallow binder device fd transfers by returning EINVAL in
Allocation::info_add_fd().

Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder/allocation.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 927bf47d5d20..8cd4c2a4402a 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -182,6 +182,13 @@ pub(crate) fn info_add_fd(
         buffer_offset: usize,
         close_on_free: bool,
     ) -> Result {
+        // SAFETY: `file` is valid; read `f_op` with `READ_ONCE` semantics.
+        let f_op = unsafe { (&raw const (*file.as_ptr()).f_op).read_volatile() };
+        if core::ptr::eq(f_op, &crate::rust_binder_fops.0) {
+            // Binder FD transfers are not allowed.
+            return Err(EINVAL);
+        }
+
         self.get_or_init_info().file_list.files_to_translate.push(
             FileEntry {
                 file,
-- 
2.56.1.703.gf848ed807c-goog

