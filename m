Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403A396561
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127346; cv=none; b=umSlGe3qsw3/BfvPxRcyNTPgcj2o19JRnAZejMnrkkgcYm8RbCYIRhkJtevpaOnAhp2s8lrwP07jPP99AfaguTQzcKMFwctGQe0lt7ZuezO025x7lG95U3GGeZAFx0nnpgarbNrPpKpiiDBMYP+tcvk09b5bXJo+dZ9cycVprtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127346; c=relaxed/simple;
	bh=ZmE+nNBDaPsbEuu2aClzNp3yw85DQ527vajbOVt/NWc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uvxw/Q3/JctgnTRnUHv/3qP+hj8DBbM3iAlZ4hfFm0wEJeVzvlbxH4u6e23KwC+g9EovTHwzMjz6vsKevLz023k8jCd/w2UTqwXx+lT4EyW8mIhlGdasGO1rk0qa1gbhr7aW1Ptvthm/b4ngUZFEK9PZc+JpRD37Edq/F87LY7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BoNyfbqO; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BoNyfbqO"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so11138195e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Apr 2026 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775127342; x=1775732142; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hwjvyt+2J+K/b6fAv3oqRoboKE8A7yfR7lbsD69cb+A=;
        b=BoNyfbqOndDeTZpk/eHF90uXvsYY+adxxMSbZHJdpTDjFtmCZHdiHfibTulZhqpI3e
         HvGQDuHwvGK/lwp9OJ8mzB3kIvlFiLoxL6NHZ+LapKlcR5Eis24sw/zGqVS+CcfXHD90
         AGNwov1kTd6XyVtuZCFX0s8BY7Ne/OSsxo3l7AO5WBzUg5EEzbVlimcR2N27laQWOueI
         HOLIgjcnJLsWJtRyPo8KVW7QnJyiHIAmGUf5lnpPmWhySBGw77PMvN5mv6VjYL89w1UP
         aO7vhXCylZ6OU66DXZM65gcEHfT/yHQu4XSK/jDqOQh3hLbMi3j4o53fQJUYe9t4kEX+
         JFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775127342; x=1775732142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hwjvyt+2J+K/b6fAv3oqRoboKE8A7yfR7lbsD69cb+A=;
        b=HXASG7Z0mI6ydTdsasaOif/N9syQAjKl68WcopO6GBc1rudI260MsycP1s4Ncdqbs4
         SSiYc/x0PR7zLZLKsItxO03FXQZZc93ktY/isxgamnQuWRunBEN2yQPNfHqsGFWja1yJ
         FrDlbOBfo6WnB1YsKJ8duZ6BpuPpFa39OM9m0u6SCIJp417MO0gTvkF7d9jWy8bdkk1m
         ORCGi32qI2ZDqTSHZlmbhHynZAbAvtaebvt7bHjDpixiDxEMewcxHTBnm/dL/Lg8gX9N
         0S9Dji3CY+JWg9PA8Q+0S/0bIW1tPyZJo0FOKxBkfmOYwFnpYmV3v4VpKsXPf+EqcHO9
         +6Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUdVkfk4TfzHvUdZyK+pIIJUwXSgWNHUV7n43DUCG45nOCeU9lFqF7K0YTs8JBrPKydnuT3enszF/xqMhSJow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsAdteG6zo48O7WgZRtsngnCneI54Ni58brPBMI01IQfOoPIlW
	frvkMCM2OUxqK4npm4s0kZCHQZg9SffHNnW1btolZlivm/qIAoevV7TcPopaLi3CE+9R52F32yI
	BHjuWQgfU/qOHa149Qg==
X-Received: from wmfq11.prod.google.com ([2002:a05:600c:2e4b:b0:487:237a:92a8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45c5:b0:485:3193:6ddb with SMTP id 5b1f17b1804b1-4888356a036mr118681095e9.3.1775127341676;
 Thu, 02 Apr 2026 03:55:41 -0700 (PDT)
Date: Thu, 02 Apr 2026 10:55:33 +0000
In-Reply-To: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5189; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ZmE+nNBDaPsbEuu2aClzNp3yw85DQ527vajbOVt/NWc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpzksq9zGFqFfcKmARNBlaFTOXul2nbWi6t/nvx
 /FE+57niNuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCac5LKgAKCRAEWL7uWMY5
 Rlq9D/43O8cjJJL+NcwQVFR0o52kZKUf3OsncO66ud+LwwzUfEYJwMdxA2YyBSUpk2syTCo/QMA
 az85f3OS14jRN1wUIvVesnIhyPeVJ6q1hQ/9Hs03SaZ4CpE+jClieqds8KqTo9nbHrmgYRy7KS7
 lo4u20wYnu/CsXq50h3a+sWMd7VAQRYN7HedEuVqlSHL90rnb990Bfuv2fBTZKTw2WjVFbBZKun
 b1Kmwdn7Gg3vK5TjpC+3ciwVv8SyXIipj9XTiw1d8BLTcIiG8/+8DB1MMVOYvXKH8abLc+yKVtP
 1EcTTRRiiHegiHRZr7XAFRJpvja9w9Rg4WGAk/NeEtsjmSeURl6T20M0fIXF826vO1ijNwKaP8k
 8ILnIKhDmO1GKZaZf6BhxRYlncQty8xKy9decZEkVD34ZcPFC6AteUfzU/LTOXOtLlOifQ/ygH8
 YcuZ+8/tQosw0gcXQe4F1HekL34TeG8/nRDmurx3f3Er8fpJK9/npgexlquQ7ybn3z3OFuHJzOI
 lDG1t7hhslaYyWGLi/RtK3BiwmDxLnv7W9OPbeMZShvyLgpkJY7FiSRLxFsATeRFNAXs555QoS8
 4G9Kd6dW44kLeUW9Nl0SjKGqMA/JTY681UagG4yqfvVYNzR9cpLlv3lLXvePiYhB/kTWTAolyCU dxPE+TFBfTftNDA==
X-Mailer: b4 0.14.3
Message-ID: <20260402-binder-crate-name-v4-1-ec3919b87909@google.com>
Subject: [PATCH v4 1/2] rust: support overriding crate_name
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Currently you cannot filter out the crate-name argument
RUSTFLAGS_REMOVE_stem.o because the Rust filter-out invocation does not
include that particular argument. Since --crate-name is an argument that
can't be passed multiple times, this means that it's currently not
possible to override the crate name. Thus, remove the --crate-name
argument for drivers. This allows them to override the crate name using
the #![crate_name] annotation.

This affects symbol names, but has no effect on the filenames of object
files and other things generated by the build, as we always use --emit
with a fixed output filename.

The --crate-name argument is kept for the crates under rust/ for
simplicity and to avoid changing many of them by adding #![crate_name].

The rust analyzer script is updated to use rustc to obtain the crate
name of the driver crates, which picks up the right name whether it is
configured via #![crate_name] or not. For readability, the logic to
invoke 'rustc' is extracted to its own function.

Note that the crate name in the python script is not actually that
important - the only place where the name actually affects anything is
in the 'deps' array which specifies an index and name for each
dependency, and determines what that dependency is called in *this*
crate. (The same crate may be called different things in each
dependency.) Since driver crates are leaf crates, this doesn't apply and
the rustc invocation only affects the 'display_name' parameter.

Acked-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 scripts/Makefile.build            |  1 -
 scripts/generate_rust_analyzer.py | 46 ++++++++++++++++++++-------------------
 2 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a6d1a2b210aa..0b0245106d01 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -333,7 +333,6 @@ rust_common_cmd = \
 	-Zcrate-attr='feature($(rust_allowed_features))' \
 	-Zunstable-options --extern pin_init --extern kernel \
 	--crate-type rlib -L $(objtree)/rust/ \
-	--crate-name $(basename $(notdir $@)) \
 	--sysroot=/dev/null \
 	--out-dir $(dir $@) --emit=dep-info=$(depfile)
 
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index b4a55344688d..de6ebf14e2b8 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -12,6 +12,12 @@ import subprocess
 import sys
 from typing import Dict, Iterable, List, Literal, Optional, TypedDict
 
+def invoke_rustc(args):
+    return subprocess.check_output(
+        [os.environ["RUSTC"]] + args,
+        stdin=subprocess.DEVNULL,
+    ).decode('utf-8').strip()
+
 def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
     crates_cfgs = {}
     for cfg in cfgs:
@@ -69,6 +75,9 @@ def generate_crates(
     crates: List[Crate] = []
     crates_cfgs = args_crates_cfgs(cfgs)
 
+    def get_crate_name(path):
+        return invoke_rustc(["--print", "crate-name", path])
+
     def build_crate(
         display_name: str,
         root_module: pathlib.Path,
@@ -112,23 +121,15 @@ def generate_crates(
             is_workspace_member=is_workspace_member,
             edition=edition,
         )
-        proc_macro_dylib_name = (
-            subprocess.check_output(
-                [
-                    os.environ["RUSTC"],
-                    "--print",
-                    "file-names",
-                    "--crate-name",
-                    display_name,
-                    "--crate-type",
-                    "proc-macro",
-                    "-",
-                ],
-                stdin=subprocess.DEVNULL,
-            )
-            .decode("utf-8")
-            .strip()
-        )
+        proc_macro_dylib_name = invoke_rustc([
+            "--print",
+            "file-names",
+            "--crate-name",
+            display_name,
+            "--crate-type",
+            "proc-macro",
+            "-",
+        ])
         proc_macro_crate: ProcMacroCrate = {
             **crate,
             "is_proc_macro": True,
@@ -324,16 +325,17 @@ def generate_crates(
     for folder in extra_dirs:
         for path in folder.rglob("*.rs"):
             logging.info("Checking %s", path)
-            name = path.stem
+            file_name = path.stem
 
             # Skip those that are not crate roots.
-            if not is_root_crate(path.parent / "Makefile", name) and \
-               not is_root_crate(path.parent / "Kbuild", name):
+            if not is_root_crate(path.parent / "Makefile", file_name) and \
+               not is_root_crate(path.parent / "Kbuild", file_name):
                 continue
 
-            logging.info("Adding %s", name)
+            crate_name = get_crate_name(path)
+            logging.info("Adding %s", crate_name)
             append_crate(
-                name,
+                crate_name,
                 path,
                 [core, kernel, pin_init],
                 cfg=generated_cfg,

-- 
2.53.0.1185.g05d4b7b318-goog

