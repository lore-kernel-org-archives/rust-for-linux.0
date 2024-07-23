Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EA014D711
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721731269; cv=none; b=pUBjYSeXLAQKQ0tu4zGzuyzDAeKB6G+pToOmOF96f7an67ouHZ4ljswxXT9lLvJEGUeby7BwLe+l+8iVXu/MCfSebaZ3mI6Cv+Xs+9zfFijoCA/d0GZeqOZGEc6xLheGqzOLN3fVmljWPxqQB6YC1/0zTHrFUOwiz4gKrZPJ/qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721731269; c=relaxed/simple;
	bh=mbQ5WF1YUiTVU5ABQQO9clAQKhASYPw9nD6faoQASz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jfv7jrCNtz7jZZWOU3rnqfqRhf+tSuMemTvXw3ZwrYPg4cKwX9EGYwBtIMTwR6sewcWotA/YP4SvPk2XU7MAWFhoeNQfnbPB/vyEknXh/AYThSXY4eqoGvom5FcPxbwXdipSdCgCuTyw2y7RYPck8arpWuG8H1IFrG9w2Dc9zU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JydVZn3m; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JydVZn3m"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc2a194750so4718595ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721731267; x=1722336067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIFmuSVzXfgV4LKmHB9S/yJtnZHYuGQBNlsY0DWS0uo=;
        b=JydVZn3m+V4TxI7MZlhaoSm44UWij6qqhEBom9y6T+g81o0lxhpUdhX5Cq29P3NELl
         NWKC38598wzQHp0bkE84oeCfE3LI2rX8gbbQwMb3TKkhuktOCFQqUU6PXtOI+2qTx8v6
         Hv3bj2ScGqRdtI4ttbbguJhphsaAlyVuJvZ9+sfhI7+2sX7IuoMMAoPhN5dH7Tvntu/G
         WDnkbR5aTDmlkksHzN5FAD+ouOdmWrAr8Qojca9nk+u9ZzsuFvJeM+AD5zcOqmsyrzyz
         5ahy3L/ApcdFeGEnzINudGMIxvES/4I6stqRjE/aodNlSSwvocwa8zQFO0gvj1Zymm3t
         PSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721731267; x=1722336067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIFmuSVzXfgV4LKmHB9S/yJtnZHYuGQBNlsY0DWS0uo=;
        b=BoHstSCYe33S0FiR/QZ9nyHPIFtj7+MOr3HzrdkeqeS36X14nDsPoVKXSPL6voeaql
         GCkKe2pUzdCWz/pQQOec1E5PT4hLrP34SzjM5Lh0NWso6PYGOhyldRxqhwjUPOXlDjaZ
         xc4az310u8IFUB9Yxnnpu65BZAco6LWCVl+UX2XItKgYGwObC7+XSrNRRe2kn28L3YHe
         8jUEyGXupWqsc7zyaP1fQxlnj5iTn6INETIuwv0Y0FnWM7IMIm9XODgfBYiGyaWKHJZs
         FHBEmJ4bgFXcjCzs9E9MhCekQf874Z9EAAdlYAeXrE98cMsNPr0xKKti/KUabixneX0X
         aUiw==
X-Forwarded-Encrypted: i=1; AJvYcCXqTX3klF1lMPLFTzMh266sGvgMuNUiHE/L6lXtC5RDYaLCdJP6qae/ZCaagsXiHSRRZQChKp3tq62MjpeohA0y/Kw1PqycZiknGitcYIU=
X-Gm-Message-State: AOJu0Yy7rvmbASnySohmfZgyIz49Ama0CxerxdD1pmD13ipTBIY9+L02
	6zf8DTaJo6d5xcZLZxq4gZdab9ImDDLr7DR9JCLUnnD9bKk9UYvV
X-Google-Smtp-Source: AGHT+IHo6xVA42L4mQHwG1MX6NDG6cTwyEifayDOHej9BOmwn6qsnTsilmECzmGXgPoJBHYCY5g8Ag==
X-Received: by 2002:a17:903:41cc:b0:1fd:acd1:b638 with SMTP id d9443c01a7336-1fdacd1b883mr34726375ad.54.1721731267186;
        Tue, 23 Jul 2024 03:41:07 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f30:240e:92d6:592a:7ca:c3f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f259fdesm71704835ad.53.2024.07.23.03.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 03:41:06 -0700 (PDT)
From: Sarthak Singh <sarthak.singh99@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Sarthak Singh <ss269@uw.edu>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2] rust: Support latest version of `rust-analyzer`
Date: Tue, 23 Jul 2024 16:10:51 +0530
Message-ID: <20240723104052.2924378-1-sarthak.singh99@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sarthak Singh <ss269@uw.edu>

Sets the `sysroot` field in rust-project.json which is now needed in
newer versions of rust-analyzer instead of the `sysroot_src` field.

`sysroot` over `sysroot_src` has been working since rust 1.74.0 (which
was released on Nov 16, 2023). Since we are going to target rust 1.78.0
going forward we should set `sysroot` to support all currently used and
future versions of rust-analyzer.

Code editors like VS Code try to use the latest version of rust-analyzer
(which is updated every week) instead of the version of rust-analyzer
that comes with the rustup toolchain (which is updated every six weeks
along with the rust version).

Without this change rust-analyzer is breaking for anyone using VS Code.

Signed-off-by: Sarthak Singh <ss269@uw.edu>
---
Hello,

I fixed some typos that I made in the v1 of the patch as pointed out by
Dirk. Let me know if anything else is wrong. This is my first time
contributing to linux.

 rust/Makefile                     | 2 +-
 scripts/generate_rust_analyzer.py | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index bf05e65365da..e3d0ba099b18 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -350,7 +350,7 @@ rust-analyzer:
 	$(Q)$(srctree)/scripts/generate_rust_analyzer.py \
 		--cfgs='core=$(core-cfgs)' --cfgs='alloc=$(alloc-cfgs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
-		$(RUST_LIB_SRC) $(KBUILD_EXTMOD) > \
+		$(rustc_sysroot) $(RUST_LIB_SRC) $(KBUILD_EXTMOD) > \
 		$(if $(KBUILD_EXTMOD),$(extmod_prefix),$(objtree))/rust-project.json
 
 redirect-intrinsics = \
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index f270c7b0cf34..8529c3940136 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -145,6 +145,7 @@ def main():
     parser.add_argument('--cfgs', action='append', default=[])
     parser.add_argument("srctree", type=pathlib.Path)
     parser.add_argument("objtree", type=pathlib.Path)
+    parser.add_argument("sysroot", type=pathlib.Path)
     parser.add_argument("sysroot_src", type=pathlib.Path)
     parser.add_argument("exttree", type=pathlib.Path, nargs="?")
     args = parser.parse_args()
@@ -154,9 +155,12 @@ def main():
         level=logging.INFO if args.verbose else logging.WARNING
     )
 
+    # Making sure that the sysroot and sysroot_src belong to the same toolchain
+    assert args.sysroot in args.sysroot_src.parents
+
     rust_project = {
         "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs),
-        "sysroot_src": str(args.sysroot_src),
+        "sysroot": str(args.sysroot),
     }
 
     json.dump(rust_project, sys.stdout, sort_keys=True, indent=4)
-- 
2.45.2

