Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5355133B6E6
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 13:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771509161; cv=none; b=EddlpoAmnADLWrD645EWtW0YQEqLfImBK03tQ7F7ZfQ65CAnOEcrVSupgMXOvq2NcBQD875Ah0LD3w5fmWie77nwbl3/+2JpI26whpgFQXRYhSB+giKVnocCTbcvvy0pvl6jydSobdUaVc2lSSaLY0ayHBSyf/TxhhrhOUexVAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771509161; c=relaxed/simple;
	bh=4JkND1FpXVW3ETByYdyu09j/paImfIwZMIzFFcN6Nck=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T0dFXC8k3RaURFpdp+zWFaHl8PuY+qGX/DWEjEFGtcNY+znVCaFJ5C6a8Lihlkslsto16bJ9XKCQsnrwcm+dIMBssvMACSDwFQjs7d3fZnAqLGJrY236cWtV00kvJRjlqB0q5KBQoBf3g3/Rf5Tx50jrLKPGH4VuetvE7N6ztWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1yaEIrFT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1yaEIrFT"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837b9913c9so8258025e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 05:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771509158; x=1772113958; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/dntFHcpqkB/5crSkMLy+P+Y3QedvoFL3zjHA9Suyc8=;
        b=1yaEIrFTQuBUe8cegb6Y3DyMWE6utU9brB7Yr1DOBXLhKd2LWDIHB02+doJwOaYDst
         dHFeVgIdeh9WVZHpueRtiW1r7RSTAgIXXSUjLqIo7qHdWRZ7qxjQ2O0zETNmBH6KhGXy
         5urB2R8QGThccw3LvQgqlLFEu1O45JQ3XECp2QzC5uEmsurv43srwXdsSiTMD3WfuEt0
         wEOevOokISbhCe6X/D9c+mG9N0YRiHUWayJIff6joBaCNPGsozCAD3DCNquE9Lcsoj/2
         XmIGivmP7rQXfAF2SxMHe78x8eAcgwNl8XxLohPAoG6isX3iRwKRo2awGd+NhiXIAM49
         y49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771509158; x=1772113958;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dntFHcpqkB/5crSkMLy+P+Y3QedvoFL3zjHA9Suyc8=;
        b=evhuzLCKN/akzid1NlVWC4Cvci5e9FS+uiK2eacDMpG5bd5hbNKDybLJSV3+XLbr/N
         +k03KXP1dMF9eLDlf+hQfAM8PedawT4QcKuORE6wWq0xifa/zOzj90G34nGkwp7uiZWw
         yveHEE4dNU7OLl654IVVTzx1Uw62BK1cdKvviO/STMpmQE6Kw3vytwgiU5ayQAzxdhis
         sYwyFd6Dq8jczcSgeMDwnUz2b0nu3Zzh4BLtWMkm6xvYX4OdEYQI5XJax5otmjN4bAYd
         gwyiAjEf2ZMPslFQ+0dzh9PA/3jYeNvnB2wCtnzUGz7ULClLE0VUbi+oftySraK9GR74
         H8Zg==
X-Gm-Message-State: AOJu0YwSCeDVOHRug3ixmFfdI4ixP6NM/PzemnfjCzZXvQeGQDd3qBhY
	nCIyaNEqZZOsYtxwJCQdo/ULQAY9WOrAeYZkZYrE6kJXmg1g3TV5iZoHZfmL43KEgrw/bLFLLSf
	ZJHQD7ewlqMe+WhF4Jw==
X-Received: from wmpe37.prod.google.com ([2002:a05:600c:4ba5:b0:481:a662:2ac8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c7:b0:483:7ce6:1efb with SMTP id 5b1f17b1804b1-4839e6614c4mr42385265e9.17.1771509158453;
 Thu, 19 Feb 2026 05:52:38 -0800 (PST)
Date: Thu, 19 Feb 2026 13:52:34 +0000
In-Reply-To: <20260219-close-fd-check-current-v1-0-fcab8d8469f5@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260219-close-fd-check-current-v1-0-fcab8d8469f5@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=4JkND1FpXVW3ETByYdyu09j/paImfIwZMIzFFcN6Nck=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBplxWjlOM9j0uWGwX82m/HbXnv/pEb/CH+LuE9E
 rKdZKHWSwOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZcVowAKCRAEWL7uWMY5
 RsvWEACiLxND1kBa33oliayMGh7/gaVhLf2eXfsxrk/fXfCbOFxQoixBvJjoXct3FgiiL66TIrz
 cDv/YQRQMWT7Bw5djCbS8ORtHrZIuFd2hMo4fOy8V9wKni+gNWY5SilWBdnY50+qAX7rHfCXzz7
 qXNEOGfcOj0HE0c0H2zDuLGv7pwpW9qCJujLrFcdHsc6yN9OERwc8vwe5seUJLpWC24BjAdLu4C
 R6FtieVtADBxCtdWl3Z12wzhjzNP7srYPyQ2efSGEOrIuUE0XrCVB7KAJ1hnLSgXMRdhuTXcTAC
 xW2m1Z8aAYD+aRpTQlfuyIiJp5L/OG22C69QRMBizjIgAalcILpsnTksyY2/MOEx7pQUb6avJ7J
 PX1vgqaqpmp1upQCci7ErWLQ4sJ5bvIlkx80+wwH31F/q1ty9rCD10dgXmVYjk8oywU38p936gX
 H+56dt3np7YCc+8nfkAvfa6EXvQwL+dJ/HYdSrmU1yCQxKKk+ANfa0BC5o5iVW0VhdGSXMi7NlN
 X6mKQ1Q8bfjCtkCdhlQiydPm8ViJsrns7VnvrEe6qLqQVnFQ0OC7Z0PfG5TbEe8ciYxc7uG69hv
 wgCUFeH+LYle4hcL0ezSntqy5HYKPIzSMPZuPIHM3LDM7GeQMnhBibbiyR5a+X9rTk5ftM04uxi jGRZAIWSudX5BOA==
X-Mailer: b4 0.14.2
Message-ID: <20260219-close-fd-check-current-v1-1-fcab8d8469f5@google.com>
Subject: [PATCH 1/3] rust: sync: implement == operator for ARef
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/aref.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index 0616c0353c2b3b4d8b3be6c4b8156995a2f1d504..f56598a847e949b497f4cf2a05a7298a58a0ccef 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -170,3 +170,26 @@ fn drop(&mut self) {
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
+
+impl<T: AlwaysRefCounted + Eq> Eq for ARef<T> {}

-- 
2.53.0.335.g19a08e0c02-goog

