Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE403BBF6
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 21:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724103344; cv=none; b=A/y9CNbjPZ+uo8ob6Nfki0NkN/4U30NFAMk5sUtAC4H5xA1IuzwSwblD/y0AugTWhHSTIX6sp7Kpu4ITzQQ3K7HtiwhYOEqTGfX+ZAJvc5bSc0g3oK27wypEBBnclVDY+5pXlTKTX6dECVZsCLs/iGJo5SJxUiZLL0nFy/gLhLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724103344; c=relaxed/simple;
	bh=W+4z+9HWRgx7SMhB8z3ozZSOSuMGdyeH4bjUydY93d8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=f9GHwbHQySDi9YuwNgEn0UnbT7OOAwKyXsbCGMBCiOO1Fu9n7VQ27t2O98zMp7OnE1Io0ra4QkawW57eDUHPsgIzuvH9CkOHJmoT7qq/OP/cxDzsKqjKpBE/yVhvopTxV44RkexbvYW+OPD95iDV1OdwgdRlyyAM4+Y/uXFLPz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ibGDjNFm; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ibGDjNFm"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6b46d8bc153so36809977b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 14:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724103341; x=1724708141; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NHr+d6UmIU/9IG30FNpxZ6Aa0eu/YiD/uhxdbWXAtq0=;
        b=ibGDjNFm6sjns/+b0dSe1migKzuTIEywCVZK3/B8tZOHUNw+DLhFxlddqz6dLztnrT
         BmrUq1pcrxmN9gWFx5H672a3GRWFFdA+2EnvzSAz+lbEOscOWBShI8V3ONbwZCW8zQHo
         8WE7FPivszMyFW+Luog+9/2yWJjfe+RDtrSWTj6UB8kph5k8Wq3yB42XGlWc0235MzOs
         1ThICQzIx6qBt51nVd6Y8LnOOBUrj3VCb8ardTQpL39HFF8XlrFj67UKhnTfAuOEHC2m
         hZeZ9PpUx4cZ23CD7wmxsj4JAk+9cq6Qwp/33pJB32t1GfBIyCzF/kPLVamiROzziW3N
         p1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724103341; x=1724708141;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHr+d6UmIU/9IG30FNpxZ6Aa0eu/YiD/uhxdbWXAtq0=;
        b=kkIVX0Xun0tSuvJroqd9odpmtjaCnWY30VXH1vOW+Ra3OV5DnAz7OGbB37s2UV4wp5
         785aOqOUMBvjP/i6rSc0j5srjFRuPbrGdYmTGZM9tJ69RvJFiqnc7p8nmcNP3qbP/9L8
         2eHYed+FiCEbqO/KKcd6RGnvtEIXd9DyEAmColmYI9NJc+2Kpf3Hj3ARXu1j6ngef0cu
         hYWOOBG//iL6Gl+xBnpeJrtPWZmCA/BogIVp0WO4eNFpvZWssRxcJvFhf96YN7xf1WAO
         6LeuWW9xwagvf2AH8Hwy+HevnM2AX3TDAl6Sxhy4tk/hjGwKEVdvaGYAaFF2mMJj+bAW
         LFeg==
X-Forwarded-Encrypted: i=1; AJvYcCXayEmbfbH3xF/t2+UOyHyYLsTXQGkOVZ+R2SMCbq8rGVmSCV1pJmbmhT4ycWBeAsr4m+C0Kveh6od9wHCeBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTxwTXelj83H1sUNTpMlbUrcgywvhpjtvxWW9/zvhpaggXANXl
	E/a1aXcc3KtU7gB6czFctuBK1f1N50mBMi+wyoiXj/Ud6aUbcTE/nEqloXnKct6HdlFgHMcgnGS
	B29sWfA==
X-Google-Smtp-Source: AGHT+IFPFz0ZC/TObmbtIW+FNYagPR0uj4bw/LTpIWyJXejA9x5eEzGFXKmI7mbSTIJ28oCMdsYOHWMIix2S
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:688d:b0:69f:9a1d:a04e with SMTP
 id 00721157ae682-6b1bb099b4fmr445507b3.4.1724103341547; Mon, 19 Aug 2024
 14:35:41 -0700 (PDT)
Date: Mon, 19 Aug 2024 21:35:18 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240819213534.4080408-1-mmaurer@google.com>
Subject: [PATCH v3 0/4] Rust KASAN Support
From: Matthew Maurer <mmaurer@google.com>
To: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: aliceryhl@google.com, samitolvanen@google.com, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, glider@google.com, ryabinin.a.a@gmail.com, 
	Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Right now, if we turn on KASAN, Rust code will cause violations because
it's not enabled properly.

This series:
1. Adds flag probe macros for Rust - now that we're setting a minimum rustc
   version instead of an exact one, these could be useful in general. We need
   them in this patch because we don't set a restriction on which LLVM rustc
   is using, which is what KASAN actually cares about.
2. Makes `rustc` enable the relevant KASAN sanitizer flags when C does.
3. Adds a smoke test to the `kasan_test` KUnit suite to check basic
   integration.

This patch series requires the target.json array support patch [1] as
the x86_64 target.json file currently produced does not mark itself as KASAN
capable, and is rebased on top of the KASAN Makefile rewrite [2].

Differences from v2 [3]:
1. Rebased on top of the maintainer's cleanup of the Makefile.
2. Cleaned up the UaF test based on feedback.
3. Calls out that KASAN_SW_TAGS is not yet supported in the config.

The notable piece of feedback I have not followed is in the renaming of
kasan_test.c to kasan_test_c.c - this was done in order to allow the
module to be named kasan_test but consist of two .o files. The other
options I see are renaming the test suite or creating a separate Rust
test suite, but both of those seemed more invasive than the rename. Let
me know if you have another approach you'd prefer there.

[1] https://lore.kernel.org/lkml/20240730-target-json-arrays-v1-1-2b376fd0ecf4@google.com/
[2] https://lore.kernel.org/all/20240813224027.84503-1-andrey.konovalov@linux.dev
[3] https://lore.kernel.org/all/20240812232910.2026387-1-mmaurer@google.com/


Matthew Maurer (4):
  kbuild: rust: Define probing macros for rustc
  kbuild: rust: Enable KASAN support
  rust: kasan: Rust does not support KHWASAN
  kasan: rust: Add KASAN smoke test via UAF

 init/Kconfig                              |  1 +
 mm/kasan/Makefile                         |  9 +++-
 mm/kasan/kasan.h                          |  1 +
 mm/kasan/{kasan_test.c => kasan_test_c.c} | 11 +++++
 mm/kasan/kasan_test_rust.rs               | 19 ++++++++
 scripts/Kconfig.include                   |  8 ++++
 scripts/Makefile.compiler                 | 15 +++++++
 scripts/Makefile.kasan                    | 54 ++++++++++++++++-------
 scripts/Makefile.lib                      |  3 ++
 scripts/generate_rust_target.rs           |  1 +
 10 files changed, 105 insertions(+), 17 deletions(-)
 rename mm/kasan/{kasan_test.c => kasan_test_c.c} (99%)
 create mode 100644 mm/kasan/kasan_test_rust.rs

-- 
2.46.0.184.g6999bdac58-goog

