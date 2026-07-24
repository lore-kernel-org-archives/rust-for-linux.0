Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A461D390613
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 21:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929831; cv=none; b=sc1UC/CD/5V2q21WTv6TKmBFqnfw/EoOBcjkcHzCWua8Tj+bTKjXD7LQ3eaw61xak4hPepC74yKugYHBZskN9a3A+T36xLPVt7xqB7jwAcqv/3xHkAbL/bi8bxsu5fPE+WIZ6kdZM3tO359fTX0YxDLKHdy22zX4WPgWH3HU9Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929831; c=relaxed/simple;
	bh=kKKmq7jufGIPyfk8VrnaKD8ZMuWoYzZl5hWNdLhisvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAZInVUcLGdR97x756BV9mCUsT9819e89hDpoJX14dr6Z7JiHbsSIHWd68l3LqyuyciQsqE7ycHlqWCtlIKoH61woVH5vwJFb1qaamUUoFAfLULCOIGVd2gt+xsAf8bRSGbQFyc4AcC5hn4f3Xm7MOAhkXXx2ItSDpZC0E9Vymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcOG/IpG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcOG/IpG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954dff6536so6500325e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 14:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784929828; x=1785534628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUkrcS3bT47EateKo7yg7zIM6h/BJq/nEtdQpmc8z04=;
        b=QcOG/IpGvAlQXqHLwClcJDIoD3eEIkONS8+eiAXnx4KENbHrFk/HZtV8+asADfpQWJ
         2O+jmpoMZLvkBefibMLEr/l94tcuJ2gqAmE+FoxVBCIjZ1gcALzk1JgpGuBUgc/+lZYX
         b0MSdNSV/K2175mLrduolQ0KaSGJDlBpfK9HjP/pbmP6mNm7v1EaCp/KPJ4p4dpS6I64
         nzRtD+HIzdXdQpDpGLQRBlzJCrOg6iwbqpL2ZuP7zJVrqo/MSPkXne+Y+khFnupEzth1
         YVNOuliYzNHEJDj5FxWncCYcEY28ozl55yyJNw47TQfUa41MlVJgqc2xFV7bgPj/ALHi
         1R4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784929828; x=1785534628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QUkrcS3bT47EateKo7yg7zIM6h/BJq/nEtdQpmc8z04=;
        b=goR/jg7b1mSSOv/Iy/vlT1RveAESgXDc4h+XIiJIUpGGW+UawnzRkHcUcFrQ6tfY+T
         qkVhVxeovhlRMLEucYG7P0wYQhxQxsSbzrBIEaHWyYBWDZZNiUKe6bvS9nVGz/ojRkQF
         Pz3q5uNRfyg6EUnwczj5nO5/Z3TXOBkSMx75HHZF2AeJ3rPrnlgwxi9rBl5s9s3sJ5zy
         r3i1narrJMKw6NBDH7qT8J/9zRnj2ZvuhDY1PhrQPQP1qf9/a7m1G1WlRr3m1dhYuLLp
         3bmrX003o3uSBfdmx2z79FUwGHrXU8MI3afXOPZELppTmjI3V1ELpEE23SuAZOJv3fk4
         r9Cg==
X-Forwarded-Encrypted: i=1; AHgh+RqvCtxi3XWZkuiclF+CYEc2v01G0S1VLwtOKq1kqASY0LaOX+7nwZhpfL7+GHDnrc8Kb4r9ATaUs5cIkjskig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytb3bVj5//+kaTVZwXwxIkd+PCLPTXDuvq0HPHiU/5KskPn4S0
	7oxXNCwfg4PzZ+B9yShLG7fc7wT/b2FHPqaphDacslZRNY64y3vB4LL1Jxsop89iQrY=
X-Gm-Gg: AR+sD11DAdQCnkOPO2oOwo+1xTjjiS0NyvAt1VXdDhW1kcC3MJgRGNyLjWPC/Ll1Wxv
	s/Xt6I20K/TDHjo8BqLKY/dwS+3bvNPSEqP2EKkZm45ceRV0X0gN1BwSG851siprmh2XtRQnhwl
	jiUGf89K5HJUMhnPZ565pYvgTV0tpOEeBl8drglK/8wz49xtR8u0hcLG51S/EXXV+/mixhrGARS
	/fHRSjouBOlDAun7dv337ghKXQC9v0uU9+cVu0fT1U5o9LNVeIzk2AfynOOYd0cUKn2xwtsaboL
	GEiKtVsA1WVjXgXBcbkNWG6DZxCH5l7FxqxQB78f3zEE9VJUBvcIiCiRXu8gAUM+HCWuIvsqICH
	yKVBeXJKk5qm4PxmUU4WPECqE9PQ77pDyTmEs2nYph9/8gNf/vVkOrbF9qNPNTDjZ+64RF8EmqB
	JUt/wo6biM3p3ps6dBIACca/sRzcIOXluTnmql2x/aBYzy33XSFwrDJZQR
X-Received: by 2002:a7b:c847:0:b0:495:4856:2659 with SMTP id 5b1f17b1804b1-496b56f14a9mr704945e9.9.1784929822663;
        Fri, 24 Jul 2026 14:50:22 -0700 (PDT)
Received: from Cian.taile2c8f4.ts.net ([2a02:8084:d03:fa00:819d:8e1d:c966:142d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4d8d6efsm17588265e9.0.2026.07.24.14.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:50:21 -0700 (PDT)
From: Cian McGuire <cianmcguire167@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cian McGuire <cianmcguire167@gmail.com>
Subject: [PATCH 3/4] rust: list: document safety of List::remove
Date: Fri, 24 Jul 2026 22:49:39 +0100
Message-ID: <20260724214940.1070221-3-cianmcguire167@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724214940.1070221-1-cianmcguire167@gmail.com>
References: <20260724214940.1070221-1-cianmcguire167@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The call to `ListLinks::fields(T::view_links(item))` in `List::remove`
had its SAFETY comment left as "TODO.". This call chains two separate
safety requirements that need to be discharged together.

`view_links` requires its pointer argument to point at a valid value.
`item` is a `&T`, and Rust's reference guarantees mean it is always a
valid, non-dangling pointer to a live value of type `T`, so this is
satisfied without needing anything beyond ordinary reference validity
(`view_links`'s own doc comment notes it "need not be in an `Arc`", to
head off the assumption that anything more is required here).

`fields` requires its pointer argument to be dereferenceable. The
pointer returned by `view_links` is guaranteed dereferenceable by its
own documented guarantees: it is either the pointer from a preceding
`prepare_to_insert` call, which itself must point at a valid value, or
it points at a read-only `ListLinks` with null fields. Either way,
`fields`'s requirement is satisfied.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/351
Signed-off-by: Cian McGuire <cianmcguire167@gmail.com>
---
 rust/kernel/list.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 406e3a028c55..22b497eb10c0 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -599,7 +599,12 @@ pub fn pop_front(&mut self) -> Option<ListArc<T, ID>> {
     ///
     /// `item` must not be in a different linked list (with the same id).
     pub unsafe fn remove(&mut self, item: &T) -> Option<ListArc<T, ID>> {
-        // SAFETY: TODO.
+        // SAFETY: `item` is a `&T`, and Rust's reference guarantees mean it is always a valid,
+        // non-dangling pointer to a live value of type `T`, satisfying `view_links`'s safety
+        // requirement. The pointer `view_links` returns is guaranteed dereferenceable by its own
+        // documented guarantees: it's either the pointer from a preceding `prepare_to_insert`
+        // call, which itself must point at a valid value, or it points at a read-only
+        // `ListLinks` with null fields. Either way, `fields`'s safety requirement is satisfied.
         let mut item = unsafe { ListLinks::fields(T::view_links(item)) };
         // SAFETY: The user provided a reference, and reference are never dangling.
         //
-- 
2.55.0

