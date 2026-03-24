Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFD42EA468
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 20:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382570; cv=none; b=gWNVXQn2K3SaY6dLxwnHpCNN2U1djVyUdWXBREdO6Diyw4UfNizhAaKVanmDJ4BMhNfvGJQRsK/qY6ybiWMWL3yLqtyEJXXTaKyXMK+Cqg2OgmdNiUCgd2CLeE+9dPG9EALUkxtLk/9J03Sx1IqIj5XdxwVBv2rPz1LK05M+LbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382570; c=relaxed/simple;
	bh=d41NgLg8zXu9D/UFei/nQ2mRCnaWdYXV9EopXPaOlxM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u4l4PNXGFm/q/EwYihVB1SXm0dx9u3hZ0nywjd5+rDb9T9+QGRdtOeyu5ssGIA1TMevjWl/l9q4ZSSl84wkqAfrRIhdiQQ6NBsZasYpmhy4KijWCvDE+/H3XHRvK+cbHFlQzTOAwW9SpNeWSRUIpm4bm7YE7rpwGLYnkXtzqdzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Txvm/Xno; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Txvm/Xno"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-487018c8244so23354695e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 13:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774382567; x=1774987367; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kIoQ7lbv168bi0FWWS4e+m0tEQWBFDeLOgV3ZRoxmXw=;
        b=Txvm/XnoMZenV6R1/lro2sa6vY/de3jCOzjHr+eMyE3vgA9LzYfk7xmLxJZfDm1KHh
         RROYuTCA54FK9jhNqND3eINj3OvdWvQSPytj3oHu2Nmg64ofMyCoqoNU2ZP9wWKzi7M5
         Uv0NULlLFuMiUwbXww/Dmx83Y580slXxTjV7qgwCoPi5tOujjIV2YphBQtwE95+HNIag
         Q0jqNK3c1pK3saOTffWnAt4DEKxxidTXXy8QtDjPedtW7QwzmoFy87jdk/fGn6unBH3N
         RBUoTiJspJeg4QAR3z+GduQ9NrOgfnbvMsZZKetRM2fBlO5qwMN7iYq7DjyfUcfOw+LC
         uwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774382567; x=1774987367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kIoQ7lbv168bi0FWWS4e+m0tEQWBFDeLOgV3ZRoxmXw=;
        b=JZBAiqILygiG92K3X4NGL367CIM1ugTFu6yycZMJtbXtpnHBc/iybrBeIA6wZ1Qu6r
         rZ/s8819AsoqXHkpgzOfwzOXw1nUqxPVF0ie9aIbq1GG5I66bm2QYStKu0iy0jXT5cHh
         1oBvObC6oxdZoOPGQtPnju+n7hYvPm2CeY5AJv1+/pbc501xK/0URqNAuGTBr3+ZRMnQ
         09tG44WthcNckWKSRjEQqf9h8Z8PD7+W6BpsnHgcj3ESmlig3jpr3a73igoPcq3qNe9v
         d/45NlczgU033kgugds7UKZg0vYCJG0EP9xY8PD+I9SE2dRiIFRyQjnJqRpv8flWXUk7
         3/6Q==
X-Gm-Message-State: AOJu0YygvEOGYAVhfC5ch8KagfqFdx1i7PPMHxLyR0fjGJHum/tqzx6n
	g4QkyptzceuyexSKO9R5vKr+5AvlhZ0WC0bikXAs2P53zgXvqk/PfLm53YO2lUh5DkC5fw0Rhsd
	P7Qn90/WfWf3QuPVhmw==
X-Received: from wmog18.prod.google.com ([2002:a05:600c:3112:b0:486:f774:82ca])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8489:b0:486:fd3a:fd22 with SMTP id 5b1f17b1804b1-48715fc384dmr14610175e9.4.1774382567398;
 Tue, 24 Mar 2026 13:02:47 -0700 (PDT)
Date: Tue, 24 Mar 2026 20:02:36 +0000
In-Reply-To: <20260324-close-fd-check-current-v3-0-b94274bedac7@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260324-close-fd-check-current-v3-0-b94274bedac7@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=835; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=d41NgLg8zXu9D/UFei/nQ2mRCnaWdYXV9EopXPaOlxM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpwu3jM3DPG26LxR8+FA/RRLIp+z/KOckDFSQLE
 CaVfNVyaZ+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacLt4wAKCRAEWL7uWMY5
 RpLvD/9QkWliYN16tfFXcDhh3+LWekHLVvCwa7tCNevqxER0/exUKxW9RuBMgwd7uZblvtoCyLJ
 Xi57NgCgCWcWDvuHGFE4SiwbY84TVFg/+RWyiVpYvCxc8ADfiQ7ZtDBGCP433qd85zvRBCYxEGI
 wVunJwCJVrYvXjxWuemEYQWlOgmbcTxPuSaSXhqyH6xaG0jOxwK6L9lIhq6QHI1imP2utDoVSdp
 NDzaLW96Hy0ACQHE0guHJ7+QEtuPyKrG76W3hjJgsUNzrLfGVosrc1x+nfAzDTFl/8JuqP3bqdN
 0Vpin///+X/L8PZktYSObv9iml7Dhw38hza2Jmb1/KLmrdM4rEI2J2nyk1hmQOtmAhG47I4zD9+
 RGX9RPA1/fU02LI4GFnCXxo2AK9ZJ0J7yG1a/Te96u8RZyWK/815huyjdPeJdDSjxicch51sD3A
 lUj9mfszeDaKfg0twls6rrzm63Po7KEG0A1b5pvGgeuyp8+7d2TftPiJUkQ/PcHT4tBvmqmN22+
 ti0r+MGEcgpQV6CBl96CJZP+FxG4SfKKFMNYc9TTTtTO00jxcglEn3rDpqqRszGuD/RrKR+My1a
 cD71Ic4mOfSDl3q4esI19FgPeBotFmKdy/tyAqxb4ZYCY44NpMj++Q8lsTQM3E7DTkmjna1qTEF lPLWhnVYPU/EvCg==
X-Mailer: b4 0.14.3
Message-ID: <20260324-close-fd-check-current-v3-2-b94274bedac7@google.com>
Subject: [PATCH v3 2/4] rust: task: implement == operator for Task
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

It's useful to compare if two tasks are the same task or not. Rust
Binder wants this to check if a certain task is equal to the group
leader of current.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/task.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index cc907fb531bc..deb948d99921 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -362,6 +362,15 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
     }
 }
 
+impl PartialEq for Task {
+    #[inline]
+    fn eq(&self, other: &Self) -> bool {
+        ptr::eq(self.as_ptr(), other.as_ptr())
+    }
+}
+
+impl Eq for Task {}
+
 impl Kuid {
     /// Get the current euid.
     #[inline]

-- 
2.53.0.1018.g2bb0e51243-goog

