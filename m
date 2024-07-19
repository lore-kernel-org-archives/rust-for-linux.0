Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEE41A269
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Jul 2024 08:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721376441; cv=none; b=PpQ9JHrOVWtJmDjTnUVZb4G8Ohve89v9bbeu9BsjrWV3z245pnmzNCS/MgUEq3DnZ9rprmG1wpXxSOnajDbPs/HvjOKcipUV7Ncmte0kL1H2v5FwyC6iEei/bBwNn5nYdsoUX2MUnxqFVLbYehJ+quTolI/bgdVxNrM9npftYco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721376441; c=relaxed/simple;
	bh=0MhvMBRddy6AvNMblOZYRVGvDm84WgKnpzfIz3vLxoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u8aOkazzs8R1A4AIkIRX4Dg/PRG2JWczAq9NezUBhfJiDMmNUVEgzyZxGdsTINX5bEDcNTCwo2q1VRfXHqC1SU7Gx6v56GO48+Bk9I44XRlqkNA6OJujLfXfWnoptd+RLReZNtJwkmyYFdPbvTV/NMiLH0qXkCL4KDwHIGpVOPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nof3QtHh; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nof3QtHh"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fc587361b6so16434735ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Jul 2024 01:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721376439; x=1721981239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7LNTUxGczoA/GyocupVqg018EUtoYd+QoFEMFNR73w=;
        b=nof3QtHhCM+XMZSZFzSm7OhWszu/y1TaAro2ro3NObtAcuYNHkiWb4zVN0rycOXz7/
         Y0nMolhd2BcVk/Ni8I97f7abtpdRszoY14A2Zpa0X2A+XfnL/Ixy50kbpX8QtdqnG0Vb
         7nalX85jtRRs4DhPZMIk6vQWC/y6GH7iuXFOhXW5JBQYfxaN31ysM+AZH4ib8eBfKeAj
         dwaAKmhRosgXRcybL4Tq/sro3L+xgByISzv/V0TUJkGjJTQAxv8rjOHrPA/Tb0PHWcGN
         hLaQPBAqJzYGDloxPWYuo9g9/d78xApUzeJbGr9WWRgvY/mWu2OPSM3D0agFjHDu8IFi
         1pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721376439; x=1721981239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7LNTUxGczoA/GyocupVqg018EUtoYd+QoFEMFNR73w=;
        b=N4DzQFoK+qIVqWCNdWLzgL5cc+qvjHMCJej8wsgLs4rACQbOEw1XwV/wd4y37Mmv6c
         1KoGSUnhJ+yYRmvGQwovZmk0Mgy8PWkU1D4Ez26WqLN/kbllYlgGSB/rQ2EV139CO+4p
         qCNNUpsqwjTdXkQ2YAbS868ILiDVtgKW3r77s4xCoAsQzjfPb+9Cjs0NpYoaJtBYkBXs
         rNwnBB7QjtUyca6ap32qUYnRlcR4uKfbvZ27j9enN5UTPWtKR8VeCSdl9PMx7p5TYudH
         lR8unifOVsM6hwCcL3CmefZ5pAWRuRm4tnOL6Evt2LdP4uJmfdMLVaYN5tOYUfTbuq/Q
         VW1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGo6QRLIZI4EVRSG7+GOqIQKeWSTKX7X8ZyF84r19xF9mVzG/DDF1fF7d+KKKXVLyHy+s7KzHY9svNp9RN8uQpiS+T25rfWCAYVA4QPBU=
X-Gm-Message-State: AOJu0YzAZjE74nInWbrz/+RvOG4wzTThMw4fH3mMDjs1XOU62fvWkeU0
	pcqGevqGSP2/zqKICo2PrIDiY24vh4RbVI+v4Kl/X4TYl/L+viNw
X-Google-Smtp-Source: AGHT+IFNM/eBnA5cv+VtThkPXju/uNDIPaGAmOC97v6CMRhzrkwf4kBAg5L8cXEB4V6w7XyAD2lpfw==
X-Received: by 2002:a17:903:2451:b0:1fb:8a61:12b0 with SMTP id d9443c01a7336-1fc4e66cfb4mr64796575ad.54.1721376439017;
        Fri, 19 Jul 2024 01:07:19 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f30:240e:92d6:592a:7ca:c3f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64c91345sm8305895ad.115.2024.07.19.01.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:07:18 -0700 (PDT)
From: Sarthak Singh <sarthak.singh99@gmail.com>
X-Google-Original-From: Sarthak Singh <ss269@uw.edu>
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
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: Support latest version of `rust-anayzer`
Date: Fri, 19 Jul 2024 13:37:08 +0530
Message-ID: <20240719080709.1804899-1-ss269@uw.edu>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sets the `sysroot` field in rust-project.json which is now needed in
newer versions of rust-anaylzer instead of the `sysroot_src` field.

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

