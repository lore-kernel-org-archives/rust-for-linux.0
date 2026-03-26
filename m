Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA47399373;
	Thu, 26 Mar 2026 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519001; cv=none; b=hbqoGiCx2m9JZrIj19boLPWBQ9W+Pr7SHd7IBTQnEsZHpnl5i/gaeBHNzZyWPc+DffgOAkzshw/fpa3/fDZtoNOLp0wZzsKCAwJc6EegLRXUsaPE6Gd9MWeIpOcSkoDVkBU5M9mkSHb5T61CBXbEy8f+y/wIjXA6ZpBd6Jf6OdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519001; c=relaxed/simple;
	bh=oxLEHSyPDOJq6YlAAJJ31hcPTj4lQESEaslWNLLATr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eNusaGteg7qxME/xHZzPsDuUB0BYJo5fGs06RqaGe/+OUBiV1HlZPTKVPjPVdD7r3x0ZjXCnBMdl3lB8vEiByeZBQjXFT0bICbFEtDvLeCHzj0xbYCbjv8iVdRUCWXuRJCNaJ9KQ/0OOiJwdoYO7SHiXGa9UbmEI7nWQWwrtzFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=oPJywjp3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f8jmmo/b; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="oPJywjp3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f8jmmo/b"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EBC787A01EF;
	Thu, 26 Mar 2026 05:56:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 26 Mar 2026 05:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1774518989; x=1774605389; bh=bcQY02q9hv+iDe7CgswR/
	olrC8Bp24cuVgEWdmZ8/Kw=; b=oPJywjp3W8O1ow9g4xwLJgpOWoea2J9J5Zc1U
	wb/ezEn01qAiyxkCkvAi0e5V94ARYP8dTIqU583qYhXIqq6IJ6hDpSQRcK2ODUMN
	rRfiT96mgS/P4040owStD+Kr+2YjX1hYC8kaYgEMh3I1dUV+X/ZAzarq/P953c85
	hkVNu1rW9dUPSNDd5n0IFDn79LTICD8ssi0H2FTiIBRZmjbC43sXAaGN3ZpYBMkQ
	/QT8YcxY4EUO7sO1wVommwM0DXGaqMECZtFHU2ThoLi4oI8Y5gaJo5NH56dBKJS+
	wnnBhwW+4lX+HrG9LF6/FvmzYOMLaO3wxTbfPy3iR+A5Gv0BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774518989; x=1774605389; bh=bcQY02q9hv+iDe7CgswR/olrC8Bp24cuVgE
	WdmZ8/Kw=; b=f8jmmo/brsnVpCK0W0NYJyhUQ+AR4jpYz4ARTFyInLneBvqYJyo
	IE1TCOXKbT224ONPdhThRqvr0hOXu8B6+iOprKyZYjtx9nagzVjKYEx/qFn2pRcp
	0yXvrtZOiM6LHIlTa86u1Z0JixFgzzvkdFfNphqYfa/ubqRboi/hv+grIpiSCHR9
	3tqTUc+xnrKjcxNIQ8zzG9qLoatvzO1SWE7wLJkzOFksCetgcAl7kgWZUVoOjUfB
	j0iDhR/K7IYlO+UQeuobTqeQIrkDRVVSdCZy9IvoGzdYLTjO/ZHBdDn6IqXDE8io
	5faWZlABMMuZh+7/nJQrs4Bxiqe8xSftzKg==
X-ME-Sender: <xms:zQLFaeKOjpjuW_FkN3F8X0joX62x1Wq8zwy_XqOtgh86ed2-vaXCcA>
    <xme:zQLFaQj3nkTyVu1-mxZ48JBHBDC6FxH2aAzvTPPg-PWSW0CogFF5-RYtAm0jH40IL
    dBGcG4yJ7HhdR9z8zozill-WvjoczAYRaqIXAi5KKAF9ODV1Yp_td8m>
X-ME-Received: <xmr:zQLFaU3-xmHjp1Y1reKFh1gNt962vbd3hMOhnv3zJYoXdQzIXkHdw57q_Kt3ef0kk76blRuqIG20OLQLQy0_Jy4O3toijyLiLPigPUD3X_GiMgnUrGmNCbKGjYM8H2XyAlC3vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdejtdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepffgrvhhiugcutfhh
    vghinhhssggvrhhguceouggrvhhiugesrhgvrggurghhvggrugdrvghuqeenucggtffrrg
    htthgvrhhnpeeuteejgfelteeiheefgeekheektdejhfetheduieeuvedtffelteejhfei
    udehffenucffohhmrghinheprhhushhtqdhlrghnghdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgusehrvggruggrhhgv
    rggurdgvuhdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegurghvihgusehrvggruggrhhgvrggurdgvuhdprhgtphhtthhopehloh
    hrvghniihordhsthhorghkvghssehorhgrtghlvgdrtghomhdprhgtphhtthhopehvsggr
    sghkrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhirghmrdhhohiflhgvthhtse
    horhgrtghlvgdrtghomhdprhgtphhtthhopehurhgviihkihesghhmrghilhdrtghomhdp
    rhgtphhtthhopegsohhquhhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhi
    esghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothho
    nhhmrghilhdrtghomh
X-ME-Proxy: <xmx:zQLFaeiYlroeH8Fq8Sz1EPhBiT1O_Zgw6b5XCJsZzNbs7diQND4PSA>
    <xmx:zQLFad-PinllDNJ_Aw64P02DH6ghpzppfTEmcqcOQu5lUej8_7Q4yg>
    <xmx:zQLFaSIPgHT-vyOv7njoa9DFdPHlUjnCNtKf-X9W7TIsZMfYmt7_mA>
    <xmx:zQLFaaxtWng0uOe5gtwkJ4wIGnkSttPYQ0aGtVQ0or9nQD_L7gCZIw>
    <xmx:zQLFaTK9nxRr1PkMTGV-R1ZQPp5hMNiNG3_AXZv5JkiaXXwHz3cBvzDJ>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 05:56:26 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: David Rheinsberg <david@readahead.eu>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust/alloc: add Vec::into_boxed_slice()
Date: Thu, 26 Mar 2026 10:56:20 +0100
Message-ID: <20260326095621.846840-1-david@readahead.eu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add `Vec::into_boxed_slice()` similar to
`std::vec::Vec::into_boxed_slice()` [1].

There is currently no way to easily consume the allocation of a vector.
However, it is very convenient to use `Vec` to initialize a dynamically
sized array and then "seal" it, so it can be passed along as a Box:

    fn create_from(src: &[T]) -> Result<KBox<[U]>, AllocError> {
        let v = Vec::with_capacity(n, GFP_KERNEL)?;

        for i in src {
            v.push(foo(i)?, GFP_KERNEL)?;
        }

        Ok(v.into_boxed_slice())
    }

A valid alternative is to use `Box::new_uninit()` rather than
`Vec::with_capacity()`, and eventually convert the box via
`Box::assume_init()`. This works but needlessly requires unsafe code,
awkward drop handling, etc. Using `Vec` is the much simpler solution.

[1] https://doc.rust-lang.org/std/vec/struct.Vec.html#method.into_boxed_slice

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 rust/kernel/alloc/kvec.rs | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ac8d6f763ae8..537818bb66d0 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -826,6 +826,23 @@ pub fn resize(&mut self, new_len: usize, value: T, flags: Flags) -> Result<(), A
             }
         }
     }
+
+    /// Converts the vector into [`Box<[T], A>`].
+    ///
+    /// Excess capacity is retained in the allocation, but lost until the box
+    /// is dropped.
+    pub fn into_boxed_slice(self) -> Box<[T], A> {
+        let (buf, len, _cap) = self.into_raw_parts();
+        let slice = ptr::slice_from_raw_parts_mut(buf, len);
+
+        // SAFETY:
+        // - `slice` has been allocated with `A`
+        // - `slice` is suitably aligned
+        // - `slice` has at least a length of `len`
+        // - all elements within `slice` are initialized values of `T`
+        // - `len` does not exceed `isize::MAX`
+        unsafe { Box::from_raw(slice) }
+    }
 }
 
 impl<T, A> Drop for Vec<T, A>
-- 
2.53.0

