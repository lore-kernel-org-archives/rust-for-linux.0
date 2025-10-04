Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7256B2459C9
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Oct 2025 10:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759572493; cv=none; b=D/lu4P7jWmDsvyqpDOms/e1BHbTOpJUUXYPFlKXEJLwlp4XI70otvOuflY3yaHpyEsWdQfVUuDVov+JbU4CI/7F3f4sa0GEfS+PLQ7BIRdbfJqRt1uBussA+lra5a3X7EjS+BLn5KK8piggch6dAwr8wc0kJzGABnPFleGY95qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759572493; c=relaxed/simple;
	bh=7N0Fpu+DW2FdFHlxjkDuD/i4liq/xoZUtf6juSwFCIM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AGrRLW4y5ptaGX14EXTcLsC6KFn2JaWhr59tI4+Crm0V4qjSn6Tm2MR1s/iL84tyZ0OA1jcFCZMFu0X6X36JDmhGmG9qHFbae49EtarJoavhlJ5ftpu7LncG4iw0PZPmqsKlwtGWCslXODXfx1uOdE7RRSuGpvqysPbF807/1pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3SQ77dfY; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3SQ77dfY"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e39567579so15680885e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Oct 2025 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759572490; x=1760177290; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M7kCRzDJbTfZJ5zf17A4CJd5pPrUVwju9fZumSQIDms=;
        b=3SQ77dfYEcpGO3qhxaK9G/K6G1x2fFD5YZlBamtKWH+MTogvueayCMEHZur+ZhKQB4
         kBFng3+rRD+NZ1OW1BItv28T9rGtr3XEBCyGdFk9bq/v4TE+QWtYXVWdHdj/uc7FA2kR
         J6wnheAinvuGjWfCIecl4unDXkrGK4VY76gpta6XTW8covCt30T0dKbjQTUenr/qR9Kj
         PhF0DCgjoBmpsbOzwebYV4/XmMyKBdAkzgyIRmt7fjt1tlBODAx4NZkpxbhf9Zlx0JKc
         dkl3gB5mNff07Egf+UhlrAKkRDL6/x8gjyRE/qiSBa9poUix/AMbAb1jnnkqWS9lRlxl
         ax5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759572490; x=1760177290;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7kCRzDJbTfZJ5zf17A4CJd5pPrUVwju9fZumSQIDms=;
        b=DulMdWbY6mQGAo4z/WWIRDV0LvxXxuRIhYGUg0bMXqftZlvynAr68FT6o0dXCwVt6f
         tIwUAydEvsjAfiCbfHJcglWlQ/XTkBe/L1WjG1cBTiyoMoDK8wCwZCxMtftf2b3GVyeP
         azDEGXfpGPKeumWNRoY6ZJ7q9VdyGPyEEIF038sNN64z3kJCBu6ctjZlOjEL7FK3PNya
         EbkkfakDF9FsePRKEzSJ3ZhZppl9WOJeLGZhZxTSqZXbofJ14iXTyAN/7Plb+UAd+iJs
         WY9rFihFYuZ2rRN2cgwa/LFcFadiDgbAYYT6oj+qsO8iRYpiWnx+0/D2Zd0C+6MNQx7U
         xI2A==
X-Forwarded-Encrypted: i=1; AJvYcCUJhy+L/w4G8obPSiQvwbJWq7MjGGM963thmm0FPh8+trBozmnd6DslYWawVcbXTCsLi2XrUyQR4bV8KQMCDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRR061swVhE37vv1OOGPqljFPTew4Xw4Edi2HAn3SyFp5q6w2p
	NEw9FbihYySRKy+y/+8Kdnfcvf+O7B+QCFo/x/bGZnXVynW4KSxSergEr3dH43A+mfWJ0AoeMbV
	mUzocGjzda89TO8lkaw==
X-Google-Smtp-Source: AGHT+IFYFMQss7Do8mtPDXRu5QmUUCGBtniZAPka8E9obbXMzgH4Xlr6nsjkbBiLZymNTrp6LBzTrNSU4yJmJLM=
X-Received: from wmbje20.prod.google.com ([2002:a05:600c:1f94:b0:46e:38c2:1a34])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cf:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-46e71151b43mr46387585e9.31.1759572489863;
 Sat, 04 Oct 2025 03:08:09 -0700 (PDT)
Date: Sat, 04 Oct 2025 10:07:57 +0000
In-Reply-To: <20251004-binder-freeze-v1-0-fb9fcdcf2b73@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251004-binder-freeze-v1-0-fb9fcdcf2b73@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7N0Fpu+DW2FdFHlxjkDuD/i4liq/xoZUtf6juSwFCIM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo4PIH+faUxi1D14qhkWQe48YCs9OmU6GvOAscy
 GEGUG0pjluJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaODyBwAKCRAEWL7uWMY5
 RsrgD/4nxG0XFlj+UCmxQz8sexIYfnUcrFcrRgHR4gIo2d3XX/0/LEGdc4imfCpbMQ7LUfgoU3T
 TugBfzTEFTPYVp9CRqEqnr5B8hw2+slsnICuPTAv9+R21HO8KeqQIjbnoUC0fHUfc+DnBxuSyz4
 VXo+RxS1JOXnZeRMnwv1nGW88jMrn9JNqVj7agtEdCFF0Xf2N8ySPGFYxaUQbKDSONa+UEO7ELW
 8j4SyKKCCQvC2Ap23dIpBxIPItU4m36F9fVfrqxqSrp6N830gdWFa4D625CWgGvXkCjxUJozHfQ
 yl0Jw+KBi2ULBAtxVxP41GTTbz6D2Za5587PAiOvrJE8xRr6ch2CeD51xVfeRDa2x7m8WokWPs3
 6G9ZEkhVyv+4CwV2AGsImtmGIVoL2Nugc/Bh3h953G6y3lBJYMj9Nw+AOtXL8mSysUfbfqz3KkV
 9xU2hVm5coNdn0X6TK3Q+ROWsZyhgdZX24Y10iBURvgbIj7A7SJbPjzKelBUogZL6wEdFw9AEBQ
 YWOMNI70ngKYh/PmMUf1ySxX5I7Rq0TqwhqpH1dCSNZ3BHXfobtM5jW/3x+yWmujalGXMKaWz6m
 6yiSb7KTSYd5qIwqHCZyeaY8un8uBimY9Us1CO9ccc/QnofHGYl9N1/q7MVfhV/MNTUHA9k1Xgo jSXvzLZvKLJDI2A==
X-Mailer: b4 0.14.2
Message-ID: <20251004-binder-freeze-v1-1-fb9fcdcf2b73@google.com>
Subject: [PATCH 1/2] rust_binder: freeze_notif_done should resend if wrong state
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Consider the following scenario:
1. A freeze notification is delivered to thread 1.
2. The process becomes frozen or unfrozen.
3. The message for step 2 is delivered to thread 2 and ignored because
   there is already a pending notification from step 1.
4. Thread 1 acknowledges the notification from step 1.
In this case, step 4 should ensure that the message ignored in step 3 is
resent as it can now be delivered.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/freeze.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index e68c3c8bc55a203c32261c23915d8c427569e3b0..74bebb8d4d9b24860eed34363ce69b1c6df58028 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -245,8 +245,9 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
                 );
                 return Err(EINVAL);
             }
-            if freeze.is_clearing {
-                // Immediately send another FreezeMessage for BR_CLEAR_FREEZE_NOTIFICATION_DONE.
+            let is_frozen = freeze.node.owner.inner.lock().is_frozen;
+            if freeze.is_clearing || freeze.last_is_frozen != Some(is_frozen) {
+                // Immediately send another FreezeMessage.
                 clear_msg = Some(FreezeMessage::init(alloc, cookie));
             }
             freeze.is_pending = false;

-- 
2.51.0.618.g983fd99d29-goog

