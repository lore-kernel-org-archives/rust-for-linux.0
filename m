Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702263;
	b=CXipXNC4sy3ufpar7xuZh9afo5Bmkt4fS8iWqGinql5qMXHC+KkCGZ0m/wBengEg47sJ
	 AeAqAoxzCqJyyMxcOFWUwJqPOFIRsoLikENmm6gqYb9KmPEREKwzpaurPRP9/A8Zd9y+8
	 Qicv0dqRZFRkrzF6XH7FHZdwowD0k2DFfXLUZyTySRGRLfxeTY0J/twR3KtG1AxaQJ4hx
	 v1b2bwbzqAel5dKI3d1E9sEgUACgjSTPilwPuennzdqIHUbOEzjzybQcaudamsKcMIrS3
	 TQeiuJAiWYB5KnEDStwjC0ixbVSgtXZsyY5JPKHCHhPhl/mt5xY9+C6HX3P3DS7mnlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yzKfe/HIkfkdztp3Uz7ZvCiWpLjrHeTj8pQ7u7u4b7g=;
	b=OTvYXfiIVuiqbWz5nhTrjvdk81GonuouEMc49EP9LDKWHo9jmEDpYZBetG42pWZERcaI
	 d1B5z/AScl5SDodB3B7LYkygr9GqDSYQ4eMXIDZlvCeucNCleEnXn/R5u+nRCB2TS7jQK
	 0NxLttuoPj1dXJe94OpkofYSao4GjjVRig48HVfIlG19lbwFYgJM9S8v9Xp9Kl5ytxkfN
	 /hXKyUxGKG02yg2tnIq45cIjxma6jRPZLYRqr6IreSCQlz66vDIrmsouafQmygX1iEKOu
	 NXnF3i84/KP7rGGMy5u8CnHtVyEiJvrwp/OFKr6UnPZZC09pS7Zqoix3HvC5vUbC8sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=omDFPABZ;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2975B60A2601
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 20:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2975B60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=omDFPABZ
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b2232d8ef5so203114a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 13:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702261; x=1793307061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzKfe/HIkfkdztp3Uz7ZvCiWpLjrHeTj8pQ7u7u4b7g=;
        b=omDFPABZWukNshfcvKsiAfrd5oEwJzH92xrxWZfyaxZT87hQuuvMlXKLnDRDKgUo68
         C687Ocg8hgOdeFsVYpvaLK7qc3vT7yod2iXu3Yh8iI1a1pXcb/xaQ2z5ShwQ5elPU59/
         0cR2ftqTCpoVQKKyg+pjRrIU/UCAx47Ju9Ls1R0yubnoGA90oYnKjGgK5HMBzyVVJNtU
         o/KKMcLmyZZ4zmrjnL8NQ7AEpYUB8nCkBnrQ/eTB5xNIpIGgBeTxeY5p1doKvmboCNr3
         o0IiLb/7eTirYlQmUmAn0+nG8dyjyX0IF52mJTmKuEeioyHDw7I/UJXyfxVxKr8cM3B8
         TeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702261; x=1793307061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzKfe/HIkfkdztp3Uz7ZvCiWpLjrHeTj8pQ7u7u4b7g=;
        b=OAyUt6CbB/48OcrniroxEjGlOm31DbntjxGVn0B9SezafR27o/VdE1vDD7xA38xJGO
         pAmEGEQAKNqV1It9mUG8ydTP23e63TFE0Jl0j2uUhdlV11+gZL7V9GVwI+veWo1PIbq5
         zlvHSo+3c5epP5iOYzz5G5JSXnp95PV41LDfO7YGl3Q79oFFjGN2QIaYfK9TZynXPFzs
         opV0ZjF+GxIQJfpmE26TfsaPigxxnRNT1Qi1xQiUKKRGHaKNma0+DYnvJDRJ7PxBWGP0
         V3wKQmzNl/NvEa7GiWspiOlU9s1RjgiBB886RDmx/qvKDOf82Y2/xtG72ZbciR1WtCXM
         pCCQ==
X-Gm-Message-State: AFq9FYIGlI/QAgv3at0P8xaudVYcw/t7a0d0A6D0AClhfhodtE/dINEd
	V+w0i2PflTuBUvNureOrVgqGS3b8xR7oBOSmUH8ozVXZlzBfn8kIk3GgDFAcGvqSt9bP+w==
X-Gm-Gg: AYBFou34zTn+Ed/2mYcZmEW5wmeNENdIc91lzgW+EJziZgJ4JXaC56I/Pv/ssWSN+Ut
	cBnKDV7OD52bHraJAh/KS4acb5PS69iwc4Olyol7hXi8Vhxg7IjfpuE74SiLkriOEm8D7Yy8Wi7
	jQPuT2RDBSdoN+Qyi9UwdjQC5SzML0tMt88hMEMD1uhLFpt7KoNICnuSLnNNR39ZcKJl7qOnIr/
	U6y4yAByuzVx7sk5dBmn3PaPHVlEVY48xgzNpDH8qwWsrTTL+h0JSZnLnUEM1b/r74i7xyWlSWi
	YS4LT/duRPTX5VwxQfYmP6uYMcqFE0XDteJ+8AHWoQNXilfejROWd5IolIU8Lox8DqCqh+lbJzj
	nn66UXt1zSIvVEXbKTTzqZiEPxDeueHl4L7tPtFa5p2PAde3RBw9AGr6gxmgaW/IE7abL81+WwM
	FAPq7FeGS76Ox24VtuKr96aR0UqZVXjTjLcphlEIUN7rZp8RQtCjzugj7F6sDImLe05thzvmz7N
	et14f9PFm9qwocfrYb6m3CHdRF6QPdP7JTHyRZ+/LpFtwmuwICrFFxAudBDRFCADDFTWisDvmyk
	J5DlSLg7Ldtuq++WV3WBT1qaukwULWxxeWdJxX6uThwqYRlJJZ54qsTzuUmSPvZIN/vhJXT3JLL
	0gtA6VrINkjuFN5AfHrckf66OmjxNJegJWaeMQUhifFcfJ8OXM4CBDDZG+g==
X-Received: by 2002:a17:907:3dab:b0:c2e:3b23:1468 with SMTP id a640c23a62f3a-c46a94b7c7amr47733066b.48.1792702261240;
        Thu, 22 Oct 2026 13:51:01 -0700 (PDT)
Received: from martin-Virtual-Machine.mshome.net (h-98-128-181-228.NA.cust.bahnhof.se. [98.128.181.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d518sm28898066b.17.2026.10.22.13.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:51:00 -0700 (PDT)
From: Martin Nordholts <enselic@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Martin Nordholts <enselic@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nikolai Grlica <nikolai@nikolaigrlica.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: list: Improve `List::remove()` SAFETY comments (and remove TODO)
Date: Thu, 22 Oct 2026 22:49:23 +0200
Message-ID: <20261022204924.230453-1-enselic@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

See the comments themselves for more details.

Signed-off-by: Martin Nordholts <enselic@gmail.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/351
---
 rust/kernel/list.rs | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 0f367264ee2e..24f2896feff2 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -599,11 +599,12 @@ pub fn pop_front(&mut self) -> Option<ListArc<T, ID>> {
     ///
     /// `item` must not be in a different linked list (with the same id).
     pub unsafe fn remove(&mut self, item: &T) -> Option<ListArc<T, ID>> {
-        // SAFETY: TODO.
+        // SAFETY: The user provided a reference, and references are never dangling. Additionally,
+        // our pointer will not outlive the lifetime of the reference.
         let mut item = unsafe { ListLinks::fields(T::view_links(item)) };
-        // SAFETY: The user provided a reference, and reference are never dangling.
+        // SAFETY: The raw pointer is valid because we just derived it from a reference.
         //
-        // As for why this is not a data race, there are two cases:
+        // As for why deferencing is not a data race, there are two cases:
         //
         //  * If `item` is not in any list, then these fields are read-only and null.
         //  * If `item` is in this list, then we have exclusive access to these fields since we
@@ -628,6 +629,7 @@ pub unsafe fn remove(&mut self, item: &T) -> Option<ListArc<T, ID>> {
 
             // SAFETY: We just checked that `item` is in a list, so the caller guarantees that it
             // is in this list. The pointers are in the right order.
+            // Mutating `&T` is ok, links are behind `UnsafeCell` (in `Opaque` in `ListLinks`).
             Some(unsafe { self.remove_internal_inner(item, next, prev) })
         } else {
             None
-- 
2.53.0

