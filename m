Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11CC225A1
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 20:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g8TpMIfq"
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A5FFE
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 13:20:32 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a8ee6a1801so69564797b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 13:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698783631; x=1699388431; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TIpaUvpPt/FXbzm5nKCXxMF++9wEyj/NimmkMOXmsLo=;
        b=g8TpMIfqmwvE4qRFARnYsmOLrd64zxKuq6VhQ55wVz58nYL09vKitIfhHApafnTJk9
         eE/c9028THd1H2WOgtbRLcj5mgv7JnKUNzlxLKqRsIiju0LGgqzbqjTQeNCSD3Zw00eo
         kP1n5q0zCrqFwN1blRazvwOEiX1mrNTRsam4H2EW7WsoaxnKS2APJaXQaAzE0PeP+mRV
         08lp1DQfUQhP5ejl/bKVXmdIwfQlbe94fTE/iJNPOgnNxBdglLexHVVBgFnzPRt/oNcG
         SHnfml5O/GMxAd1b5cDLcNKtyrTsjP3zOpOrJ8P6Lzz8twvQxt/DPq1fVmm/ppHtXqj8
         /mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698783631; x=1699388431;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TIpaUvpPt/FXbzm5nKCXxMF++9wEyj/NimmkMOXmsLo=;
        b=ju7RfDSTdIpJ4RdisAjUPPXO8dBCE1V8btZObT/p4KZ+57wPSRa4wZ+JrNn0tdo62P
         onlpFMKXtC4JsmCon3T3iD9+oIkbej7M/Y1JHLbg+0r6RCbmAYAUTfQt7ud2k7Cq273C
         eyaX+GMkUl0MLN7wlWzaLzEpJcmSiiyXiklp80SjcQ2b9SQP4mmvb3XkufxZhgB9aWeL
         +5t4DBIuBKKZXRxQ5dY0HQDSX0V/z5d7aXmc2a0xnk6pqeUfwv/LWvLOJnqDcanScZVz
         d6tyFCMRM/oMV3RCZpzNMfk7XotU0d3oia/dFQ4b5r74G4+47GrNcT52AY4/w5O8Bd4J
         XAbw==
X-Gm-Message-State: AOJu0Yy65X3NpjngsBgs9/YQkKg4A/YCtX/cuG0x8S6+6k9xBT1rQ41o
	9PZtAOx05TFFHVKD2lz9AYlbrnPxc7+d
X-Google-Smtp-Source: AGHT+IGLO+nOjD62+HLAfpYoCH9Rz2qtqF+wmxh11MaslROEb45vmSU864vwQzq+PEmwctuPBAUQaj3vRvU1
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:4c8:b0:d9a:54e7:e910 with SMTP id
 v8-20020a05690204c800b00d9a54e7e910mr278979ybs.4.1698783631471; Tue, 31 Oct
 2023 13:20:31 -0700 (PDT)
Date: Tue, 31 Oct 2023 20:19:44 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231031201945.1412345-1-mmaurer@google.com>
Subject: [PATCH] rust: Ignore preserve-most functions
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Neither bindgen nor Rust know about the preserve-most calling
convention, and Clang describes it as unstable. Since we aren't using
functions with this calling convention from Rust, blocklist them.

These functions are only added to the build when list hardening is
enabled, which is likely why others didn't notice this yet.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/bindgen_parameters | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 552d9a85925b..8d9f82d350b8 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -20,3 +20,7 @@
 
 # `seccomp`'s comment gets understood as a doctest
 --no-doc-comments
+
+# These functions use the __preserve_most calling convention, which neither bindgen
+# nor Rust currently understand, and which Clang currently declares to be unstable.
+--blocklist-function __list_.*_report
-- 
2.42.0.820.g83a721a137-goog

