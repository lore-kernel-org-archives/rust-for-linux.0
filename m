Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8823DF012
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997606; cv=none; b=O0X7qZJ7IR6yWiOVT2hzQSr/tXll40QIG9u50r4VISDufnURoTtUNxZzEJTP8rwkdTVnd3+nvUS6mKMxZhCi9wWvX8bXp2Tm6k2kU66q5iDEKZcwnD/kCt4OWRa6eRR6fN980DuHNvAnqDO9sUrymRxM9L9ELysTH+8jknXb69Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997606; c=relaxed/simple;
	bh=i4lUMOvBW4IInX/kaLGSZGsHAq076tqR3LS3nXwBfz8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eOl4aer59fi/ixQnQsdTCPuXxK54F9+12B6E+5A3DsCe00hNBET1eITNDoqW09bTn12q6sJF/+JZP8ETIFfRYwhXlVsjHpF82sKXUlrQ+gvfo6AYVxgsO/zKCZ1xzvNwYClVF45aOa/Jr+SLn7l9txP0w8mFw52ASPxY77YVZjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pvcHhd7N; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pvcHhd7N"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-46011aa5000so2300108f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780997602; x=1781602402; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QNWfi/EH6aA6qx0F+mbUFEPAfqMITAcxm9jr2u8jXw8=;
        b=pvcHhd7NFgi2VjIPZfJoXRkMMbce+Ddc1KBoOglkQlZDcHcL7SpbtDTGMDU6xSdo4B
         pc4DXOxgrSM5ICGZLpfsOYr4C1TDYJthvU10jrceBRPrvW+nKY/2v5EDtwBpkRSAZIeU
         vCHf30oeah1bPxfGECtkJfR3QiXgRvjNajgMlZZIod/SYyz9aMGeUQAabJ8ROpLV7gJc
         GcxdjIA2QWTthR1MyFtP7P1/HsSitAgJa8yfBtOqr1kNpdczUvk5ac98JFUxrvM18IQH
         WHywl3zD9WcrZtIP4Q/6Nc1Wj198skmJHGmd7Zv8Bx6S1H985HkN03HdVve4RbTvxmq7
         LAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997602; x=1781602402;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNWfi/EH6aA6qx0F+mbUFEPAfqMITAcxm9jr2u8jXw8=;
        b=oqg9NTrNHr9GUZHIDU5cMFnA0snKkit+oTDx18ztjP7V525HFF6995cntqTzpgZEFs
         qkCX7zNIY6HetDj3JRU0c6VUeReMnnD8aK8G0Byp8bWKEb4jz0wi7THYPoep06KqLaya
         VuGhDR4EJHVtOl+h7jFY2Q4XaIRWy5kGIwPXYgTkZVCNkrO5ak55rHxAcsdBlO89I0+A
         zGnTEZhTEAU7PGe/AsUlZ9hDWBiohu9Dc9aZosme0nA1DuDySGryHNPxBOTHLMUH65HG
         x0aUnoGGQLxJGZKNK41RewNkxA5PwNMh4JBJG/XSJTOWKlJBpR7EbuuJ8qN7QlqgFcKS
         JTYw==
X-Forwarded-Encrypted: i=1; AFNElJ9XEZTLRuZgaY2lAmeKwXVdZ+AH0tzV1YH7x6KnpxDdcUSp9uS2fdyqRIPT9GaIcuVNOtrnl5hqazpl+PIKhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKN0eTeZG4WKgfK3pEvj/xZB/aDTmVftvTrGzpszS8loGI8Wol
	6Hi2bi0WsfTkfSes90hZtP4+xb6PWOpasiFAy/Oe3WTW5zNKlBmzzAC+iUivGOn04HczfPnPqWc
	aK8+7/tudWsgPst9xgg==
X-Received: from wrwd3.prod.google.com ([2002:a5d:6443:0:b0:45e:f50a:d950])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f44:0:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-460302fd190mr30210789f8f.15.1780997601699;
 Tue, 09 Jun 2026 02:33:21 -0700 (PDT)
Date: Tue, 09 Jun 2026 09:33:09 +0000
In-Reply-To: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=i4lUMOvBW4IInX/kaLGSZGsHAq076tqR3LS3nXwBfz8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqJ93aRDGd/bmbVtsJ69BD/2ps0Ok8sLklu5grY
 UuefjNX7gyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaifd2gAKCRAEWL7uWMY5
 Rnd/D/wMUdMHXB51jJ6C/wZLcANpGQQ6gKzNzAVuGMTGp51VuTPF/Zulgm2OmxMlepAltm4gnrx
 H5G9bkcjprFFHC3pZt367RFb6nOSgJh/4fZTrCmAJXg/s6O2FmshWr2X/2/tMZiD0BsMr1Ul7AS
 HKC9eBvDsQGLbbkzrfx0Fs+YpPGLTyOW0p1lrXWIVl0L2lZKs15o/ywNSY/f20/0Fl/uTEoYeE/
 pEX0IUHmtouA9EhkhqNkuIFbf/jLgTZqMeaxb50/8zk46E6J3T+EOuuvqR4EiSDp0fFqwNGWsIg
 Zi4M2TSZNXnv9AvHSDGlyH1GcA2xSZH65Dd3/yGRITTcL+VzrkkJFrEmP+MYpCf/WLvBNYghLPG
 mTM2qd/RguK9ORomGaePfSIQnpHhbrnXBgQHzpJ2OFWTx0ERdWUM+H9WkP6/l8hBA7kgzCHPYd5
 KNP+ogFzpsJ9FwtbSm+8RjgaeA2hcg1iPEtepV6fqXecprief2Oh9oh/c0H2cF+2h7tY2OvdSP7
 rfa94Bf+QNmESX72xS9eduk37bvGy8tzBu6RYi4Bv01yKZwFcZ3hLdwhu5vLWnHYhn1yC47nsdJ
 YXu/Jew0ip3Cove13M5p08riEgG783YzhHXLqKqLXPESGXSCG0QT4HLgnpOoKL4PfTGFaM6tqyj rVaEqSkQsrqvv0Q==
X-Mailer: b4 0.14.3
Message-ID: <20260609-binder-noderefs-spin-v2-3-eafde2ff376c@google.com>
Subject: [PATCH v2 3/6] rust_binder: schedule NodeDeath outside of node_refs lock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

There's no reason to hold the node_refs lock while scheduling the
NodeDeath to the thread todo list, so don't. The call to set_cleared()
is kept under the lock so that the state update is kept atomic.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index f4f4d45e1ab7..a8836cb8b8cc 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1289,7 +1289,10 @@ pub(crate) fn clear_death(&self, reader: &mut UserSliceReader, thread: &Thread)
 
         // Update state and determine if we need to queue a work item. We only need to do it when
         // the node is not dead or if the user already completed the death notification.
-        if death.set_cleared(false) {
+        let should_schedule = death.set_cleared(false);
+        drop(refs);
+
+        if should_schedule {
             if let Some(death) = ListArc::try_from_arc_or_drop(death) {
                 let _ = thread.push_work_if_looper(death);
             }

-- 
2.54.0.1064.gd145956f57-goog

