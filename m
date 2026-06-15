Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5033A3F39E1
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527026; cv=none; b=bMqo/oDDTJULV13p8sydXPlr0POJ7oAKnk5PZb1Jn0OW9Q6GPLKby6/QygHG6YBmrgz/tkdVm9Tw1k4bCoK9OXOny0QH0z1rGXNJMGxfMyEaIz16VehhIUS1ePZbj/2HnHbbtg67KL/VtLSbZn89DSVFbl6Ui3WO9n6ILxKC8iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527026; c=relaxed/simple;
	bh=W2IWb+t74NX9igjCVuyqeHGDLyu5VzRPiMxHaddVGpY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PCMaP1olkwpMOV6fvxW4RWSPGKKsT1GZip0p5AWJ7OWQ3ZUKIRYIfUORTxzVFL0/WwOUodmIXa77U45d2HlPjeqpdQ/lFqFDTPRXzIyKwmy4M28aZ3LicPCi6yc2TYt/r6mFvlsnxTEdLdPvAqPhyms3pyiqxrQpmx7faGVfEzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jv0fgDsY; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jv0fgDsY"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490b61243easo36110875e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781527020; x=1782131820; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HhE7II6bhxRXqbDcn7166lmFn0VZBvJ/2LFtdoZlxmQ=;
        b=Jv0fgDsYd6jnuEEYAzJpkCWDROftg8SGy0NSueolAVgqZeZIWA/Fi3Tn8ZMvgr65Ju
         s/wTMJkyx3LeYz1Q1D9C5qQ+W6QkmTif5Y25iInMwgltKUW2eQQVw1EiDSWCSVI8XDTh
         2KkoUeVEHcmBp+iglwJWKHvmVnMBWSddZIKWENCHUi+3aeAbijtSrVaCZf18TMI9oq5p
         gn4gbJntGLk56V4sugcgpTVC4sZZq+1AJkPXMyyOerDl7BpsLKTR6dKjLr5K+miGgKKe
         MYNu2cAWXrnwZDRorQNty5RmztkiVnNyJtIO9yVpqEe+waks95MOvCM2U4F2UsoHGbIp
         9LXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527020; x=1782131820;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HhE7II6bhxRXqbDcn7166lmFn0VZBvJ/2LFtdoZlxmQ=;
        b=SBAmf4IzmICg0chI9QEofx+vycJBH2waGGzKs6U7YOX9NM8x0NKrULk0IlkWq47V6p
         G3qxpLFskRDfeAHaLLkN0cWDf84Ea1EcAnJNxz5qWCWhk4y4mL/fmhX4337Ctf4xUVDg
         2zYejo7Ma4y83shE8452OXGwg7Om5SFKEC8H+urLJpCz4fjLrAO++H1KwFd2Nqy8l4o1
         zZ6mMQL4B8FKNc52uoxG0w1NXg6es7gaCNR6f/woyWpTZETuOX8pM1jdSMC9TYmH80Za
         /3+M93x6CErLVs6a54hfM0yFAr7aFd/jmQXo00iBMupN/kiljxikqAFEmYgET1pSrzWF
         KqeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/QU8MoF1tFCl7X3idyofjeXikb98MCUk78MMiyhOcZiKjr5BLu4wXHNrPN6z/3ZSXn62KwSQXF5z22yIvjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyftPcgNSNo+O+IIxZOzZFq3h8Wo+OigKKdWrijj1hm2elALGIr
	xUx1hEcaxhYAwWKUVS1T9XzCmxraY1px3aaDXKLf/6WdEe2SrqLBJejbiFGlX5qNs8x0bFQuEsE
	RPNJS57mt8jwfJbcGRw==
X-Received: from wmat4.prod.google.com ([2002:a05:600c:6d04:b0:490:b2a6:e6f5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b18:b0:490:e1a6:25d with SMTP id 5b1f17b1804b1-490ec4fb514mr165979405e9.26.1781527019989;
 Mon, 15 Jun 2026 05:36:59 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:36:43 +0000
In-Reply-To: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=W2IWb+t74NX9igjCVuyqeHGDLyu5VzRPiMxHaddVGpY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqL/HlOhw+l4ZaXKyTjNHSq0bnBkaPdg5cumqw9
 CeYyzTUS6WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCai/x5QAKCRAEWL7uWMY5
 RmWVD/41LJvPWA9ORyeog4rBigWMc6VPAe4jnycM408efPnImnzogX/O0ZmO2Z/8jRmErPeoQSV
 d8yCIY+K0eaH3z408lS8xDx3ffUf1lOGfys8sHZS+b/fz85BGBvyTJr+GZYBAKxbs9kAwbEE3EZ
 0wFiNv9B+HDWQ6uPAmR5g9yTh3EHL3y+mP/2pZoKGLtU0amjwdlgkmVBZB8O85BF9pbsdiOjwWF
 kDvEBQ4MkZosv8edEIadxjkOZYEgPbGJlCswedIz4eJwF8xTyQqlrkOKInk68U3jBMzhLb39R2a
 +AH7o0Z85MspuuuygPIxkFfdwhlkIFxSF7wLwrHbRF2SscgBKbCqRBwq8eScmMS2Y9z+DUemigW
 IaJ/tobbAHj6Obe7A+jVY3C/SBMTaqqSKpQfnNkwfFg2Y2Z05kIebrpbH53vRQvswxx3W5/vedO
 E30BNv6t5Y7nt+cPmXQuSMvLbh5vZv6NQLtEbR0LGdOLrOrShH4wcbq4VxY+5QTiu+soKvmalMy
 4sdTIxMReNBrgskP7+reEHPyXVbiqcdEX20EFr7+Ne0KV8TulnvdV9C2xsPT+4wU4/9k2mNS+Ww
 YQ3nIbqNEut94zAXJ0IMiWidjRhbYFqhSHGv1rEdBqLef8se+uQhfaB3vD9VDaDstf6c5wxt5Yy yK03tKsml8Ff24w==
X-Mailer: b4 0.14.3
Message-ID: <20260615-binder-noderefs-spin-v3-3-3235f5a3e0a0@google.com>
Subject: [PATCH v3 3/6] rust_binder: schedule NodeDeath outside of node_refs lock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

There's no reason to hold the node_refs lock while scheduling the
NodeDeath to the thread todo list, so don't. The call to set_cleared()
is kept under the lock so that the state update is kept atomic.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
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
2.54.0.1136.gdb2ca164c4-goog

