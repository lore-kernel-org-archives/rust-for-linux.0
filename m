Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B62155753
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 23:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742339901; cv=none; b=nuCfSsnO8fLBckluA/W5E+MzmzA2YOZvpVNimZPysHGXuO4WoggsftjSDO6RshmXkPIuEoKDRXdpZ9BMh64nGPpcGfrylpNSVEjhbEsBFwPCVbmG79e8kg/OUFwkEptrau9amJB/TDXHFcVkeo5k26zIxFuMOyyjO6bz6LeK1CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742339901; c=relaxed/simple;
	bh=iVy3KaQcdoKMOIhykUTdZW6xpEXbbIbDjNSvxjr5gOU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Qq686h9A+zU2oF3jupUbrBvoJLE0iM5LtgN/eHyEOT9eOl16Dy03beHDZw/uvo45o1jW1siGhK8eLp9ExUJlTZtfJckaswJZeWAr3LaPKpGDQ7SFL5AP01ub29nBzR0xyiyl6ru4A/elCK0sK5kzMLOCXWVpC/EhJBb3L2T4810=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wVinB+Tv; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wVinB+Tv"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3010db05acfso6211929a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 16:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742339900; x=1742944700; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KXJJNZ/SsGbxD4tKsw6RwQJvmwsliXsJWoESYYVXQr8=;
        b=wVinB+TvpuHfZK9BmZ29WF0DjUBBBaJwZSNBcYIqA5PfZpfpnsQcF4tahuSIgXxyiy
         uuPvrDoAbUcbpxeO/7gV90wrId/Ac94pVUNbJFXHXB6att1gDs/FB7EqUyd06ufQipRF
         INA+LhPMheT8Ao5ULIfk4o852/wKhyjBIHzzzGoKh7shBH2DvoOiMEZea80CVDK1V6zV
         t8w0D54AVLDA37ZFmLUOWe2DGxB+URu8sA7eIV4ewJiSDkTWRcO4VEXskqWmZCIKXpqp
         NJTK2N7+X4JkFMhean62WcBWpo+/fQvCbJFvkdudlfZW3QGkUtUWV1eaavSWAHff5biZ
         FGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742339900; x=1742944700;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXJJNZ/SsGbxD4tKsw6RwQJvmwsliXsJWoESYYVXQr8=;
        b=b4ccGSpDtJn2xlPCWnZLute5T3q/POvLrHqH/4h1zQjykdK/YOQNKoIJ54CkFlKCek
         8xfOH6dYHO740ZPD0G8E7E1iT4SzLZOvTJvMwOEIa5H4KFwSIl+mw/AOha1oy4Pe+zXY
         Qo+HfIgkh1RQg/SdmbCtQOhVdS31fmdMmRAEjerbZM/sDR6rHV+EOwvHNtxgcgPP02GC
         V0KZiXM5TZbvliSqDaN105NTczifzdKVkcgcM0Vrawu986+T8VAo8he24ZzDpBkmz+RK
         WfDTZDT9DuHkRtmrh3iovZTzPp0GF8SdB9U3Mh8QUWSElt1XueuX90oAr8OoJhPWaBDX
         Sbdw==
X-Forwarded-Encrypted: i=1; AJvYcCUTJ74zWC9DsfNzutS8WhrlYKnX21s/WYQiS/49eURC7ZHt/Zy80eSnBpnLCLgJUJZ5e3Z0b9NCyRDtLp69aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8oLmXdz9Mwfv/WKlF9OLHJzM5G3kVFn5S44nwk1/N2T3n77/K
	Qy541+Tn0DkjB8pnu1f7DXBjQvwSEJve1tix9OMu8rFBP5uJEnjJ4T3LiSogghn88LTcZzFOccg
	qRyzSat2/g7VlsslqbqHtnNbHLg==
X-Google-Smtp-Source: AGHT+IFBdlwQchK4+FK9YV7gJ97fUHlHu1RufvH6zywOClvEOKpciZvdnSuk6HsOdKB4D9HM0v6Nw4swv1isqNS7COE=
X-Received: from pgbdn2.prod.google.com ([2002:a05:6a02:e02:b0:af5:5afe:79f9])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:33a6:b0:1f5:8de8:3b1a with SMTP id adf61e73a8af0-1fbeb7a2072mr822186637.13.1742339899651;
 Tue, 18 Mar 2025 16:18:19 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:18:16 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=samitolvanen@google.com;
 h=from:subject; bh=iVy3KaQcdoKMOIhykUTdZW6xpEXbbIbDjNSvxjr5gOU=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOk3/1t0fswvNypfEroj6v3n5Ie/uEosTm8xKnE6erHuy
 wflomNTOkpZGMQ4GGTFFFlavq7euvu7U+qrz0USMHNYmUCGMHBxCsBENoozMly47aW7YekU8y1b
 ruUZ3j542PZ5ZuZM5Wwbu4bDMwTFHacz/A8q4pLzePX56F3+B+8unA6/HDaz07i32PDDb7FK9oS sGl4A
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318231815.917621-2-samitolvanen@google.com>
Subject: [PATCH] rust: kbuild: Don't export __pfx symbols
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With CONFIG_PREFIX_SYMBOLS, objtool adds __pfx prefix symbols
to claim the compiler emitted call padding bytes. When
CONFIG_X86_KERNEL_IBT is not selected, the symbols are added to
individual object files and for Rust objects, they end up being
exported, resulting in warnings with CONFIG_GENDWARFKSYMS as the
symbols have no debugging information:

warning: gendwarfksyms: symbol_print_versions: no information for symbol __pfx_rust_helper_put_task_struct
warning: gendwarfksyms: symbol_print_versions: no information for symbol __pfx_rust_helper_task_euid
warning: gendwarfksyms: symbol_print_versions: no information for symbol __pfx_rust_helper_readq_relaxed
...

Filter out the __pfx prefix from exported symbols similarly to
the existing __cfi and __odr_asan prefixes.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index ea3849eb78f6..eb18b59d4f39 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -332,7 +332,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
-rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ && $$3!~/__odr_asan/ { printf $(2),$$3 }'
+rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__(pfx|cfi|odr_asan)/ { printf $(2),$$3 }'
 
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
-- 
2.49.0.rc1.451.g8f38331e32-goog

