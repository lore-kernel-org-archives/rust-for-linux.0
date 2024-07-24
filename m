Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B771200B7
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jul 2024 17:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721842053; cv=none; b=LoVcxN0zHSB/36I0OJWKaFlH9vyfP9gjmXCQ95rTC8W7iao4A9mxuBsqYW9SZ+JIpiQ2eO8neiOek1261VU/S7cvWGipUcFHy/KNzvtdBkFK2PbuszVbKC7o6mRWsVv47RLiUtPei/fc3Mlp6ICOCeAuxbm2l51KAxrXYi/IdMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721842053; c=relaxed/simple;
	bh=NqX6h19VxBNufDMeq3W8poIkWd2I7rPJt/SYIqfP0zI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CxahWJ2S7upBZwY9odOIht9Bl8Ebu5EQ2ybFNwvcEsd5BcQmKDeHwEHmTqlNG5qOFXal++XQ//EXl+MN9THxjpMdN56nTdJlsTWLA4huSeCQrSwBgEcWEnfSHjfAd7kkDblS3xxPSZHWlSAzkipcibZyi0jcrkY7JLew8gkAB1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFvbsP65; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFvbsP65"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fd6ed7688cso45135ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jul 2024 10:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721842051; x=1722446851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzB9PMD8PcKaAYm8dE+5bJuLCxFtOflIEOEAQ3Z7ELE=;
        b=RFvbsP65+feZvqLu2Sv6AFNMd60VtZksOx3/g0z77IMHopY460NvO5xCL1N2WPkFVI
         vyVl/LioM4I462+3KbhvbwF061cQDsbs7mq0qgIBYy8qQJ9CI50FlPj9HzhCkc1BYOET
         w1mfk/WTZvcAEqysiLbLNJSg+9LN0zlL+m2i7HT2Kb+w7/aK1FxT4OlM7i6fgUUiSZho
         KIQKxatBM0YG+3MwcDI9HUN++MulSCf7qTWW0NRTsLLO1+OVuplADNkKEHoTB/Fawg2A
         yFiBpwMua4a5rQ6yaJ3BwUDQRUt42bU/FVHgjIxl+E2m0iDdQi6hK9samJLI18k/bp1g
         djyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721842051; x=1722446851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzB9PMD8PcKaAYm8dE+5bJuLCxFtOflIEOEAQ3Z7ELE=;
        b=UOG7BtCCl5U++h9jWFsyfK8t65gvv6yVuq63MjU2Sqo77g+FOMIWZQFA2aj0CjaxbG
         K/uZFHiiVaQXcyyNrX6HyvOS1+H7qO2+cb+ztHWzUK80wal9SXtOlWtt8+JXsXWF1kKp
         FiirjFH+DBZKgd52JZ1mT0Ubb3sC2CZWTeQEH3WSEWAA8fFm4BJgmUvlmK4xpfghEpAu
         lPQ8TAii1NxcEvi0Em3rbRHZFqEuJghmz232qzj1XA+buSC3JlisLZQKbEcEc+NmP39A
         zdWTmTG6NpAzFhPlYXdlZODC7mvIifDX6grCaY3pmasNmsWU3Ii4s+BQ0MuUvzFiVIz0
         EehA==
X-Forwarded-Encrypted: i=1; AJvYcCVA0IH8oQr5SQnpUCijOj/ZkwpDYK95BQSHYliIu8lShi/daTx+vXtr44M7XQAJ18/xBH6B6YysZvFkiZY+PdXhJZSIOXaKBx5sMXXObLY=
X-Gm-Message-State: AOJu0YzUhtilTQJZS+geHHk2bqtIJ+7SLHMv7u8f6Xdi2FIeU5WDIkN2
	rDCigW2pykllkd/3MXXFXh/yZIw9fqnEAiAvHJiytfIHqg+YJlxI
X-Google-Smtp-Source: AGHT+IHk7aJ2xO3ATyIJgfGAgU/xbJ+JV6Syyi8MLllme0NGlokCB7sVPGrqJpPDZNCmQ6/VsUYY+w==
X-Received: by 2002:a17:902:e88a:b0:1fb:8cab:ccc9 with SMTP id d9443c01a7336-1fed38da4f7mr2878055ad.45.1721842051183;
        Wed, 24 Jul 2024 10:27:31 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f30:240e:92d6:592a:7ca:c3f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f3181f4sm97452625ad.163.2024.07.24.10.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 10:27:30 -0700 (PDT)
From: Sarthak Singh <sarthak.singh99@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Sarthak Singh <sarthak.singh99@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH v3] rust: Support latest version of `rust-analyzer`
Date: Wed, 24 Jul 2024 22:57:06 +0530
Message-ID: <20240724172713.899399-1-sarthak.singh99@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sets the `sysroot` field in rust-project.json which is now needed in
newer versions of rust-analyzer instead of the `sysroot_src` field.

Till [1] `rust-analyzer` used to guess the `sysroot` based on the
`sysroot_src` at [2]. Now `sysroot` is a required parameter for a
`rust-project.json` file. It is required because `rust-analyzer`
need it to find the proc-macro server [3].

In the current version of `rust-analyzer` the `sysroot_src` is only used
to include the inbuilt library crates (std, core, alloc, etc) [4]. Since
we already specify the core library to be included in the
`rust-project.json` we don't need to define the `sysroot_src`.

Code editors like VS Code try to use the latest version of rust-analyzer
(which is updated every week) instead of the version of rust-analyzer
that comes with the rustup toolchain (which is updated every six weeks
along with the rust version).

Without this change `rust-analyzer` is breaking for anyone using VS Code.
As they are getting the latest version of `rust-analyzer` with the
changes made in [1].

`rust-analyzer` will also start breaking for other developers as they
update thier rust version (assuming that also updates the rust-analyzer
version on their system).

This patch should work with every setup as there is no more guess work
being done by `rust-analyzer`.

Link: https://github.com/rust-lang/rust-analyzer/pull/17287 [1]
Link: https://github.com/rust-lang/rust-analyzer/blob/f372a8a1176ff8dd5f45ab2ddd45f3530db0374f/crates/project-model/src/workspace.rs#L367-L374 [2]
Link: https://github.com/rust-lang/rust-analyzer/blob/eeb192b79aeac47b40add66347022af17a74fbaf/crates/project-model/src/sysroot.rs#L180-L192 [3]
Link: https://github.com/search?q=repo%3AVeykril%2Frust-analyzer%20src_root()&type=code [4]

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Sarthak Singh <sarthak.singh99@gmail.com>
---
Hello,

This version contains more a more detailed justification for this patch.
Also fixes some issues with using the wrong email amoung others.

Previous Version:
  v2: Fixed typos
  v1: Initial patch

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

