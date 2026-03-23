Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244DC38CFF3
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 10:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262012; cv=none; b=YsB5FOeH/rFFrYJiqT/bV6l19QQefiCbUfVVSsRb0CJ2sFTxNtAo/Sm/lArEjFpb/5T1BnnNSt7iGIJOgzI1fZxBC37dj05u0kYxTt2ZhDnT9/+QKiKwf+ihD1G9ZlBBi9wZg/VJhLntym4K9qReIQMhvCUV91q5D/riRpxbIhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262012; c=relaxed/simple;
	bh=0NDUGRZwk5uOld6MMOr2tuHSCfP+PEc0iYbeGfdR12A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kiij6A0t2IHg0tCCEBmKXvcZs0HewVTMldM5mYRZX/mDiwVYa9m3SaJ8JvcpLxwGDPsXZiSRIjUBE7PNOtqPPTWqVPAlGO9/USk1q6NX7zT1za330IW6hsA9t+p1qu52Gj+OmI7AvAsAqK7rrPaNApzQWXOyMexgJugxKr3uBeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U7A/fOqD; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U7A/fOqD"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b940da8ec09so463745466b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 03:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774262007; x=1774866807; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Yeiatc+pINFBHwlsxMYopCtRI4xRYV4LjxYmtdeTlM=;
        b=U7A/fOqDYA5EAJ1U89zftgeZurGwzqRvzVlnsII7yU9TZZcGBtN/d2oarJLYAtLhc1
         n/4dute9J4FwazOFb804qZL/AzyHROKDrp0eXCPFdKF5yokhEF94nT+0MsnCmyiTdkX1
         QWuBkfnGrJLaXHEQdjfiFJoIQ3Q0WuqG5QRguWj2eaILXCbbOI9EgYIMpCCDNmpwUvJt
         O3B0K17mfzu5tcnL4M54DVlV4qthMWV1KeY8yIeVyj4QvsxrsU8IAmldsnNbIf3dRCJM
         nG4RXPT51RzHyLP7cM7dAhd04X+6FCS0Jy2AeEGYktTnkgIleV3NN61jVebMEQ+5ocP/
         br3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262007; x=1774866807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Yeiatc+pINFBHwlsxMYopCtRI4xRYV4LjxYmtdeTlM=;
        b=j/KotOJftS8wPPgZi4QtFS7Dy+ZKxBEvUf4/nW9YVacOJl8UirXcQL5Ctyw0inbixi
         4OwB5zAa1Gg+GDnpG+fTHXCFKj/cvIX5ih7BO/Oe3mjtzDME++rEa3PfWe1omEWXthUw
         FdtWJawJ5LIprga/NzPU6vR6S4xKYitx1Y0pA/ly5G/EnkAhcmIgoVQJTmtQu1qXepjx
         UbnO5Ihwp8jPE+nZh5Gxow2gvkzzZZNRdbVBM5ob5p2qPDp2RXKkdmoW10Uvw12sd65b
         4xHflmTqAv48LI1Zi8jH4tlZiW0HIQ/WgvdrLl/mE08vJIsIIDxRuz5EL3Znj2ZcTW+X
         S0kw==
X-Forwarded-Encrypted: i=1; AJvYcCVXuggqwzRhHl7Tfwf2jQ3bprBGCZ6F6mKeKWl1TFnb8jkgVRIw3AtnSZJn5+EXECOZw6O7FNi7BYzuRmdT1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6aAoLiq47ypEUEbK8WXosS+m22k09BkMLBEl+X+B42ps/rvKd
	rJx3X4u5rjn1vwPWdLj6TrkEY08zFU+lx5x8FDLLU4QXxops5fxKW/Q5Xyt35oSHo/5Gq8PhWkY
	0JK1NkXedCuEZAwek0A==
X-Received: from ejcqw5.prod.google.com ([2002:a17:906:6a05:b0:b97:3111:1324])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c50a:b0:b87:2f29:2060 with SMTP id a640c23a62f3a-b982f399b4fmr773886266b.26.1774262007045;
 Mon, 23 Mar 2026 03:33:27 -0700 (PDT)
Date: Mon, 23 Mar 2026 10:33:10 +0000
In-Reply-To: <20260323-binder-crate-name-v3-0-c6e00f239fb1@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260323-binder-crate-name-v3-0-c6e00f239fb1@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5100; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=0NDUGRZwk5uOld6MMOr2tuHSCfP+PEc0iYbeGfdR12A=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpwRbzNf7H3Ne82WA8r4Tks4qMR/DRP3G+cdtr+
 FK5OUUrhXuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacEW8wAKCRAEWL7uWMY5
 Ri1zD/9P9C5PTvJyRRS6GXNbDiPNI7DF5DqhpHBGagLtaTLUB24cZGnGDyMx1e53QKEKOryEDPq
 L5FLLIV58DelEQ8GjoA8gG07rDLsY6AcbhUH+yd+/JyPbZBGDdfcLGT1xqVS6/CR7qo0xLAwK4d
 xG5RnRKR+aCVjRPnRkRwMqfJq4ReW0agBwavxZs6LRpjvmVuVmBM9u3Z/+/z6TeXJDXoFm4NVfY
 ZwuCFKpW5/3uHuVVzQVgirMLZFwL0GxSagXrQ0wDA9eaMPG1h+L1Sg7Ff0hz/qoAidqLcIgOWWd
 otdPgEJ8qWOS5FpkHMDDxj6TbPIgIfgyw2U3mGhSeAI1ScHvDzABj4jXUtqaJHtOh+dKNMwLLrW
 NLyruyoTfukNxbTIuprGS9yT7ktJbtEdrRDSb/xCLAuBbbc2C6yoYu0qoqT3FIFsDWEgNZrkaqa
 jsmEd8iFCcyOSj8Cyevz3E+wnoOC+S+leRvyd70aKn5UaKn/+8A1VBusQ1T2CQTFnldoSgGkv40
 pGnX7RtHKsYMb/BIyfqnaEeIcs03gB69r0tcfxgLFULcwLY7mGFhhYL83DHG0YBYD9OK02iMADE
 TspbpGAN9eZUp9NJ/lDOVZ3qfdRgQsBcfLg/xorQ5SWCtjfi1IsDsljEBwBJcFnLmTQBcImjSy5 UD7/Gbh2cBMHBXQ==
X-Mailer: b4 0.14.3
Message-ID: <20260323-binder-crate-name-v3-1-c6e00f239fb1@google.com>
Subject: [PATCH v3 1/2] rust: support overriding crate_name
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
 scripts/generate_rust_analyzer.py | 28 +++++++++++++++++++---------
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 32e209bc7985..adc3e2d1ac78 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -332,7 +332,6 @@ rust_common_cmd = \
 	-Zcrate-attr='feature($(rust_allowed_features))' \
 	-Zunstable-options --extern pin_init --extern kernel \
 	--crate-type rlib -L $(objtree)/rust/ \
-	--crate-name $(basename $(notdir $@)) \
 	--sysroot=/dev/null \
 	--out-dir $(dir $@) --emit=dep-info=$(depfile)
 
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index f9b545104f21..ac7f1677acc3 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -19,6 +19,12 @@ def args_crates_cfgs(cfgs):
 
     return crates_cfgs
 
+def invoke_rustc(args):
+    return subprocess.check_output(
+        [os.environ["RUSTC"]] + args,
+        stdin=subprocess.DEVNULL,
+    ).decode('utf-8').strip()
+
 def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edition):
     # Generate the configuration list.
     cfg = []
@@ -49,10 +55,9 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
             }
         }
         if is_proc_macro:
-            proc_macro_dylib_name = subprocess.check_output(
-                [os.environ["RUSTC"], "--print", "file-names", "--crate-name", display_name, "--crate-type", "proc-macro", "-"],
-                stdin=subprocess.DEVNULL,
-            ).decode('utf-8').strip()
+            proc_macro_dylib_name = invoke_rustc(
+                ["--print", "file-names", "--crate-name", display_name, "--crate-type", "proc-macro", "-"]
+            )
             crate["proc_macro_dylib_path"] = f"{objtree}/rust/{proc_macro_dylib_name}"
         crates_indexes[display_name] = len(crates)
         crates.append(crate)
@@ -194,6 +199,9 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         except FileNotFoundError:
             return False
 
+    def get_crate_name(path):
+        return invoke_rustc(["--print", "crate-name", path])
+
     # Then, the rest outside of `rust/`.
     #
     # We explicitly mention the top-level folders we want to cover.
@@ -203,16 +211,18 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     for folder in extra_dirs:
         for path in folder.rglob("*.rs"):
             logging.info("Checking %s", path)
-            name = path.name.replace(".rs", "")
+            file_name = path.name.replace(".rs", "")
 
             # Skip those that are not crate roots.
-            if not is_root_crate(path.parent / "Makefile", name) and \
-               not is_root_crate(path.parent / "Kbuild", name):
+            if not is_root_crate(path.parent / "Makefile", file_name) and \
+               not is_root_crate(path.parent / "Kbuild", file_name):
                 continue
 
-            logging.info("Adding %s", name)
+            crate_name = get_crate_name(path)
+
+            logging.info("Adding %s", crate_name)
             append_crate(
-                name,
+                crate_name,
                 path,
                 ["core", "kernel", "pin_init"],
                 cfg=cfg,

-- 
2.53.0.959.g497ff81fa9-goog

