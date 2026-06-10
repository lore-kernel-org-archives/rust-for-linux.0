Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46767272E6D
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 03:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781063811; cv=none; b=gVzqCdz/N+UvsGG6V+5zLDJ3JYTYPTzkVu/XsOdHGKG3BgHJCK2+eHrqMzF6A3WW9IUD+I2hvVjSfrY6YGd4yD6hxzj7SR7fl0XHKTHhq4V8FYK5aP4iCycyYj7URT1dGcwGvAGwgfjpM+3D7L67WS56pZxre6Y8DfiMDV8UdLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781063811; c=relaxed/simple;
	bh=JBQ9vjydbWm4e0LA6BzrFWn4WQGdz2TISxuMT8shB1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=STcIsMbLVczPo5CMtxMUtLw/ooz4OSOZP/YJjF0+MoT3OvwNZwu0LdIyvSAsfqTrTiLUyUQeSynE8gXQOrLPmTFfjINAt/iwiaRUhI+UKk8wUEPjlPyvHLBWmyZVLolBYjan1v0nKY/Ha3113115s0FYNQeGnkJjNVnC0LRPks4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9KTJvpz; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9KTJvpz"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66039d3efcbso6371054d50.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 20:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781063809; x=1781668609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+UOXDCtIzjeVx21Jhp3VgFkyakTv2qNWJLXKDOQ1Gs=;
        b=T9KTJvpzxCRg0mK2rbjnIkIPr4Qw1BUg7sX3Xc0KXorWkpr7Nd03SO5Dl3mJNr/8Cr
         vDHrB5JWCZExHKYncxElhU9v+8eLGwCc3n9rzBsXa2qdpiNhRDsX0XOXCAOaJ8jNeByv
         ZxY+GfCIyyRRcGQQO0b967b4zcDtmrFdS8vzrgIYNI6Y+49YqnW65jw6BJWKqISbsuPi
         4VQjFF4pspk2Ff2FGzXTYrCCBMJ093DaHHI1+17igDq7AFqvergUN+wqQ0RfzbOHF7Zf
         rGwBlsjHq25d4svZ2sZhpiVaDy3xmnmtUg538jpVdlbXJrsURTbzEIZuLiSul1F4gFm/
         73nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781063809; x=1781668609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+UOXDCtIzjeVx21Jhp3VgFkyakTv2qNWJLXKDOQ1Gs=;
        b=opNYwT3NRPDskUMZTR97hU/GPBZufL8OhMRQk4vMu3R62T+PO5HpPVJ3HU3dcg8UJU
         +qIzwjKJwSeOqGSyPnpWUiPEiUTTOsRMukZl2MsTRgNBaRcwBdBaPyLANVUQaz6b8edN
         gfAr5EKmDICjTaLXgm64jQA1Fre8Cs02Q25KU48fmlN/yQhdLjJAmmTJJc666GQaCE8S
         gLzLN4VrAR4XAiNM8YXd+0Y9lTFpe0b7wt79w+/Kmpg9K+/w/uT1Nes+UsaI/NNo1ZuV
         WCK+RdK6OpByvb+aHlCseqrmAyFhH9Ks/uHWSj942boIrrGkczrmeUbadsrNIJ7b0cDt
         bUZA==
X-Forwarded-Encrypted: i=1; AFNElJ+NgRmkbKCHW7gSKJDJ5jxk+Nv8nQLvJsBlhKVG7wYnHmj6wkuAYYs6na1SsMt3VfGMfKqGxNMmUwxnNiYQ+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJIlV6PuszSl8A5XppmbEgMBpODpj/h465wQrIAN5v5SqkIFfG
	VGRXYJvk/yDw3s+OA0LMyZFQqLl8DwRv28JEETn686ZP/Z5nvdOVW9zm
X-Gm-Gg: Acq92OG+8wmTdeE0vdwsl8ixPb3Gf4SN0Sve04vBTKIEsEVq+XpcYSiuKQCOogSLUDg
	Bq7GRI2NI8jWwXy75xP2pbDtkr/y4XPOwlVeJ+cZCGMz5vu+iRrrt9q13hUbMxhKywem5TE3DYv
	tZobUPGfTgWyCK7KbA1K8FtPgblsjRCXQrPCdSN6ZHGDm8k+MW3yepxmjenat8hKC2UfPpbn9Wn
	BmEaUkEQMlMQ8LqylqZ3AkvNPZG3UbcctubO22b3uFxAw+ZGoZQEXVzzYNXd/ApRy7/R3KWPjb0
	wQ0HolGYEa3FR1gqNOW/peKedb7aexsikpoy4TRBolBwAXpvy1vMjf3ylQfF/bMwQwbyvKlNmqN
	EsC8prtmnRBeS7uVWDBWDTp4BkI8nfEZ5I40pXJXUcPwpcjwbIocGSjZR9OAlCKcVZQO0AE8Li2
	WUMCLd4ye9vqg64bPcO+ohhgGcWD+a6tpcyi5fC6uuP6g=
X-Received: by 2002:a05:690c:3513:b0:7ba:eefe:9fa1 with SMTP id 00721157ae682-7ed0b874376mr211187867b3.6.1781063809330;
        Tue, 09 Jun 2026 20:56:49 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea8d0dsm105825967b3.6.2026.06.09.20.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:56:48 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH] rust_binder: add ownership assertion to Node::add_death
Date: Tue,  9 Jun 2026 23:55:44 -0400
Message-ID: <20260610035544.3333022-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `// SAFETY:` comment in NodeDeath::set_cleared assumes that a
NodeDeath is never inserted into the death list of any Node other than
its owner. However, this invariant is not enforced by the safe function
Node::add_death, which inserts NodeDeath into the death list without
checking that death.node == self, leaving a risk for future code that
may miss this implicit invariant and cause undefined behavior.

Add an assertion to make this precondition explicit and catch potential
violations early.

Link: https://github.com/Rust-for-Linux/linux/issues/1237

Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
 drivers/android/binder/node.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 69f757ff7461..20eaaefbd4cc 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -333,6 +333,10 @@ pub(crate) fn add_death(
         death: ListArc<DTRWrap<NodeDeath>, 1>,
         guard: &mut Guard<'_, ProcessInner, SpinLockBackend>,
     ) {
+        assert!(
+            core::ptr::eq(self, &**death.node),
+            "attempt to add NodeDeath to the wrong death list"
+        );
         self.inner.access_mut(guard).death_list.push_back(death);
     }
 

base-commit: 287afdc7671a03081f48f3407bc59862c202bd4b
-- 
2.47.3

