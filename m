Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE683624D2
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184905; cv=none; b=RnCz2BXqRdQuBEeQm9j7c7KPNc8OODCqyxfJjhk3tH8gBmmR975xblJ96e2CAULniaxPoobwo1wi5O/aBp68eYwMAz+u1jNWVxr6itDDM0mff99QAnPrpq+bXdrA8TXMLUa2DWWPRNoy68DGh41RVnmJdYEOtK/jfb7GOK7Qr8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184905; c=relaxed/simple;
	bh=igTp2oiSWF7bJgZDiWBiWJBwajnyRdGWDts+vF7kwNQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kn9H5LmVSCmpEF7ItFqtYneHttGkUb19ht0lE9yzsPbQxFSUdUHGTFPOgfAmy3+yLHvYhiNUjVb1i4hpvmrtgiemnX5TpggtCo7uRn+NMJzYom7j0+EJwL7lQFeobxYuNEE8uSoya5HA6s2jNs26afHfQ625ZFmp2hl51qClVZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zOxYAINV; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zOxYAINV"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48079ae1001so16694575e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 01:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772184901; x=1772789701; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiJjwQOZahns7DaNQRgUmdkmVqPKjvMnvyfineX7jDE=;
        b=zOxYAINVG+7l19OI3H549HFOLXcYvTKflKC0I5a78kULwrEd3KE09AEGEgG20wgPKp
         kAYqewyWLziwZLsqP0ioH7ZfA5ArVl8xJtrugFORcEFGF8b1tsKSolKPKxfXlLrebCbv
         OFm4LDaKBfNa3JLj7U3Q/g+CYpzgUadLLcWPIlJxwNcfzCS+zG+62GulBvQNRKA2/Pg+
         5EUYeX3AGA03AvgkuqR1YBeWuJzFihuHAsQHaLYZczvRJRW99flw6sPmUzpl919Pciqq
         BEIDttzi+HZG3anD5QsHFzi5SJmIRb0t0/qs0qTACg+ir1oOD9+SKDvArSAbwajNWqad
         P5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772184901; x=1772789701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiJjwQOZahns7DaNQRgUmdkmVqPKjvMnvyfineX7jDE=;
        b=cUZpYsQ+i6AqrO+ilmBQ3AG5gsNrbkW5uxJpc5Cp2GdN4pgQvbc2P6mEsIIPSdHMoA
         yfWAIxbUkB4fq4re/Qtnv3CRMBEWuCbEq9BFEYOmlyEOl+6gFB6Uybs4q+LV5m5C6Hvm
         0rqalI+yT4SwgHnKcbnE/MciuMPAENBAZ5z70TkbSicL9vicAT+xKDu91NryhP3riyqq
         kaUL4+T0xAAo/c0UeI8z5HwmMudC3NWImU24aWCCs2RwI1vXNPqnTM01r1ZvsGz0gJDV
         +My/OqR2fn304SFQOSiGyIW36Xpqh8CQ1g+q4cLnInu0EJLOvQcgtbM3L/U7d3At/fJr
         aNgw==
X-Gm-Message-State: AOJu0YxqTShWNQ9eE4QvDf+Ld3n4DHbsq5Y5nxh/UF/RVDcltnl2eLMF
	tSoLVvCZlzMNKUcc1E96Z1arK9NMSKxb+MCmLsi06/uf7irqi1/xo6fIO7QNhhVMf/frUvaDI/9
	3kA0ALEmCrzcXTM3fXA==
X-Received: from wmwz19-n2.prod.google.com ([2002:a05:600d:6413:20b0:480:6bde:d3b3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c167:b0:483:7020:864 with SMTP id 5b1f17b1804b1-483c9c0fb66mr23001395e9.25.1772184900952;
 Fri, 27 Feb 2026 01:35:00 -0800 (PST)
Date: Fri, 27 Feb 2026 09:34:46 +0000
In-Reply-To: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=igTp2oiSWF7bJgZDiWBiWJBwajnyRdGWDts+vF7kwNQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpoWVBkUoYbjWhjPlFgPHonWCmJgnmmyYjZTx2i
 IMcKBC38QCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaaFlQQAKCRAEWL7uWMY5
 RqTeD/9prc1nqwlZ36FOWrFtwxf/wsI6B+JTjjTHgPvv09qjeJLYt0fNoY9nUMbML4VUNhLWbO2
 L5+N+6PAj7B8yvYkrnSthbtKnokZcBsGC8i2iidu9crYMKAEVz1ftZG5PCnzyQtGU29CSh1Qxzf
 vej+5THk76ywZbxmmeXOIrRt1/Ev2Jh4GCDp+JoiUWD4YEQcANc4ANK8fRB0CDgWYRB16cTVyby
 zQFET/S6zeS+4UN7EroV9K38MUBeN5eShnRHpxNXOz1v54AC4LYA4efALhAdo17UkG+PP1gKQy3
 K4PsBC/d7T0XDlmILEGQc577JCq1rIm+itPTCFuL3T/pMInyY8lkindq1hYjm6jejAGa5f0DWLU
 YTO3Ghgew9O+zMur6V9mZDBIXPphythycgTrMmIyaPX7Ldk6z3xE0b0ULvqUAheXnpebYU6QEJa
 rszhDDlfIxOa3r3e4CNw59/i6288yyftRCkw0JPt7dcTugPXAXaIV0iFRXHkfNLdhohoMN3XrVy
 mLUqBgksveIjukERD61xs+L9tV8L8hktvTcnCQyY4+hQg+sZjJbm9n6I8B5jXSGRP+hFIBSSUsR
 7vYO4arsfTbLzQlinv5lc06IZBkaeIqPqBDrOYRhVOYp8rxjTMfU1WCYUEemUqqLU1wpl1a4mtB x7WFOc6yimSi9DA==
X-Mailer: b4 0.14.3
Message-ID: <20260227-close-fd-check-current-v2-1-b3347edbb310@google.com>
Subject: [PATCH v2 1/4] rust: sync: implement == operator for ARef
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Rust Binder wants to perform a comparison between ARef<Task> and &Task,
so define the == operator for ARef<_> when compared with another ARef<_>
or just a reference. The operator is implemented in terms of the same
operator applied to the inner type.

Note that PartialEq<U> cannot be implemented because it would overlap
with the impl for ARef<U>.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/aref.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index 0616c0353c2b..9989f56d0605 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -170,3 +170,25 @@ fn drop(&mut self) {
         unsafe { T::dec_ref(self.ptr) };
     }
 }
+
+impl<T, U> PartialEq<ARef<U>> for ARef<T>
+where
+    T: AlwaysRefCounted + PartialEq<U>,
+    U: AlwaysRefCounted,
+{
+    #[inline]
+    fn eq(&self, other: &ARef<U>) -> bool {
+        T::eq(&**self, &**other)
+    }
+}
+impl<T: AlwaysRefCounted + Eq> Eq for ARef<T> {}
+
+impl<T, U> PartialEq<&'_ U> for ARef<T>
+where
+    T: AlwaysRefCounted + PartialEq<U>,
+{
+    #[inline]
+    fn eq(&self, other: &&U) -> bool {
+        T::eq(&**self, other)
+    }
+}

-- 
2.53.0.473.g4a7958ca14-goog

