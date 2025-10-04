Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51B72571BD
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Oct 2025 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759572494; cv=none; b=Ta/INBMUxQcUuN5GYUnXFGeXsLj41ae9qOKuOtr6yrzxMkwXd5oGuBLchzP/t6h0njZBq1WpDMXIISFpKwErTgBAZU/rG3uBS9EU35/usTFIItN8wmkrHijAOMW3XO38mr8X/F492U9UL3EcIcXC/BOC2ELNVyDJXNdfqgN8+UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759572494; c=relaxed/simple;
	bh=QpvyhwnXAfXkQ7I1kL3n8PvNh/8XJMhS30c4xnByIew=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I/DFpljmcRygqr/lo15eyfe2SP+JQz2Crhc4vE8ILfmF4QiBOlZz2eMpIE+aCebRBxEVj63A8K+llm2QTBmES7g8qc9Vjs6iEpEBdEzFYt7RXqCi9y9XI1XzaoUe38JNdtKJoV/RG7uPBJMFo2266SuXeJdgS6zYeWv1viEYuG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oRnheWsC; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oRnheWsC"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46e2c11b94cso14702995e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Oct 2025 03:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759572491; x=1760177291; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PD7m4V3LcOsNmzAyutP1ZogMCH/P0pzhxL44mJuhTQw=;
        b=oRnheWsCZyEFN93F7UvCuGK1xktE3zqnvyTizF6HGa+CHmthLoX+GHPt6BhoHPOYKR
         XLxgpfQBjsnaLXJcJnCDu3ezvDbqbjkC170pv84LNv4MmEGr8QFHbOXEkYhYuOcInRp4
         EA/qrDAWZL5mk07DjtVrXK97rz8LoGjz8Tnrq/oGTlqJUGJVJExbmd4/hH5tDb3jf6XQ
         Q91B8FlLdDlHnl1IQ2MLpg/wgv9Kgr69bJhjXS4ufSyfl+lSloFn1pQpUKl+7DzDlKVB
         T7K0uIWD1zA+Qdg43jKzcojov00WHIjv8hnf6OJeUiQufURjK11PdkoIxwIC0vYTtQ0G
         9nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759572491; x=1760177291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PD7m4V3LcOsNmzAyutP1ZogMCH/P0pzhxL44mJuhTQw=;
        b=eVEAgXeL8K8LHW63I5tBCwTz+PCcNUMhPTSbtGq74evDhtgUA91ywj+5OLODEeubYR
         0EStd9+rJG81CI+F9x1TW3LxJZTYLQVxejdv0qtBE+OkGf9pOMPumfR0lht/xL0ZvwHe
         Xm75OOlkHbh+B/vlMlIMk4DW74EwZ5ywb77oedeG25ewfG5BVYEOtYBP99SgyxDywpxw
         3KXDw+uGJDc9pOlxrM8x53pp7hiJjYP7xUOFclrcL0tYZEbQ5rHO3F/q9q4WzvXeDMfV
         A6X3SYch5MXIMtX/Ytnl22QbPpawqBfdKh67TQMfPHCkh6p6a2Q3xvJ2r15MwqXZloaK
         FCoA==
X-Forwarded-Encrypted: i=1; AJvYcCUee/++UYZachxPqY5LG9wboZS6Iu8u7xI5JPbPYsea7lFfqv5l1FJnYwU+4TPEyyetTReygu1Zmehc2ePf3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5jMKOf81YSKWqgrZpZ+X5XDOtSSEcOwToeIYM+KpRh9gvLZPc
	IeeUn/Jxhgrb5CwQFSvCaDTSo8Irn80ZujOXtxxLs2z5gBslJMw6tJWWfGH6HlpbVhP5aLXdmQu
	6+gMfIoXimad8hkt+Mg==
X-Google-Smtp-Source: AGHT+IHWzxbv1MfbNVfAzWAdE5QTxwCdIUKUjX678W8xOCLxpm4vp7vvoUtDz03xKEL+YbtZBPohG4HU9IXusuA=
X-Received: from wmbju1.prod.google.com ([2002:a05:600c:56c1:b0:46e:2f78:5910])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b08:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-46e7110cf6fmr45919975e9.16.1759572491043;
 Sat, 04 Oct 2025 03:08:11 -0700 (PDT)
Date: Sat, 04 Oct 2025 10:07:58 +0000
In-Reply-To: <20251004-binder-freeze-v1-0-fb9fcdcf2b73@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251004-binder-freeze-v1-0-fb9fcdcf2b73@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=QpvyhwnXAfXkQ7I1kL3n8PvNh/8XJMhS30c4xnByIew=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo4PIHCX7G0wS+ULmlB1Pj5EtReUQCUcOKsgMTS
 UN+IVXoMyCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaODyBwAKCRAEWL7uWMY5
 RqnZD/4scx2V0Zg3OUESuXeBN+lwHTPLcNynvK7Nre7ZltCpjeVUDKCjVJvh2IEXOMCuV0JCLF1
 SEhG9nb66U/bHg2RK2Bz1nKNK5jadFFNPR3vWZZLo4Aw2g40eoMMltFAZJOosU4CZsGBBGKwxl4
 pgcjPl68xWY7k5L0C5qEg6dnfVQdn4UQ1X+a0RgoesOzjY4DhgVLAzldOjp5y7tpql75WipzQbY
 OfOSTaSJWJLBDlSqm6kX0eJ3hA0APYBo84MoZW38uc/4VzawtgKqXBPQwquy38xkQOZFhnBzL+V
 BNDiuiDxuzET/OsMmIuVh9ugSh3S1Q1U/yi+Gt7V+YmIB651KsU3ypDsTYNd4Xdgns1mpESRzrk
 RAAfr7T9Uh4ewY5hhWewGt+CgW+RdVFWxDvZ1tM3s9X3q2VLDtKOJRjvLyEENbvZ3jOsh/5ZH1x
 WzhH+Jr2n7F1nZeqbsoyymFAMb/0f/o0ziTFn0s3sJQC/LQtVkLLibQYs3+NldbBNKljV95HNqL
 9MXDU2DCrHo/uKb7AxLTijf0e9FsWMegnoaO7VFCkbw8BY9QJ9dDSrAd0Ax5n3Lg/l2OomRBIvR
 ZP0xef+zAeuLjv2D/9b979vg1BeE81sKfu7EVFYsnEh5qyO3/k0WfFFvxYjDLK5vkY51+SXxG4D WY+FgAaPbtntJ+A==
X-Mailer: b4 0.14.2
Message-ID: <20251004-binder-freeze-v1-2-fb9fcdcf2b73@google.com>
Subject: [PATCH 2/2] rust_binder: don't delete FreezeListener if there are
 pending duplicates
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When userspace issues commands to a freeze listener, it identifies it
using a cookie. Normally this cookie uniquely identifies a freeze
listener, but when userspace clears a listener with the intent of
deleting it, it's allowed to "regret" clearing it and create a new
freeze listener for the same node using the same cookie. (IMO this was
an API mistake, but userspace relies on it.)

Currently if the active freeze listener gets fully deleted while there
are still pending duplicates, then the code incorrectly deletes the
pending duplicates too. To fix this, do not delete the entry if there
are still pending duplicates.

Since the current data structure requires a main freeze listener, we
convert one pending duplicate into the primary listener in this
scenario.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/freeze.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index 74bebb8d4d9b24860eed34363ce69b1c6df58028..e304aceca7f31c15444cf67bb13488cd144345e6 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -106,7 +106,16 @@ fn do_work(
             return Ok(true);
         }
         if freeze.is_clearing {
-            _removed_listener = freeze_entry.remove_node();
+            kernel::warn_on!(freeze.num_cleared_duplicates != 0);
+            if freeze.num_pending_duplicates > 0 {
+                // The primary freeze listener was deleted, so convert a pending duplicate back
+                // into the primary one.
+                freeze.num_pending_duplicates -= 1;
+                freeze.is_pending = true;
+                freeze.is_clearing = true;
+            } else {
+                _removed_listener = freeze_entry.remove_node();
+            }
             drop(node_refs);
             writer.write_code(BR_CLEAR_FREEZE_NOTIFICATION_DONE)?;
             writer.write_payload(&self.cookie.0)?;

-- 
2.51.0.618.g983fd99d29-goog

