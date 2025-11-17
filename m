Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799032D7DC7;
	Mon, 17 Nov 2025 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370792; cv=none; b=Mz6zvsrADgACDLbsr5bzEXSaTnCS1NeyvOT9Mjq2um7OKexrDN2evJZxWGNR2CkLXpQEGSFtpCi1bsoPtz2UHE4ny4EbxcoEgagvJOX9vZVt+ZeUBpaflBigXAukPxZ8R019wDPF3I9XZ+S6VLM2OBgBT7w7C12molFo9mcnerg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370792; c=relaxed/simple;
	bh=5jZoEh4YzmKyE3iOabhCY2SYx6Jd8m5uSIHLCJuzqGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6bTgvdJSQ9cshfHKZ4EIsJ8zdESMfMIa9watb3sUzxBbiUsRin9hmwF4/mo6xfXR37DJaLQRhZ888curkoICrhnYLtddG43x4wpCz4WLf6tG3JUHR6qjTAUzg0/By26RhV/PYk41LSbz3AqpPSdWF/vQj3KkiVhTBP8KVIcCWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RU98JPs1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RU98JPs1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12618C116B1;
	Mon, 17 Nov 2025 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763370792;
	bh=5jZoEh4YzmKyE3iOabhCY2SYx6Jd8m5uSIHLCJuzqGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RU98JPs1ZWlJKETFMW8NGs7XndawhlCBZyrcJpq0Eka8GRCMIkwRXbhdNDZLu8XAr
	 Xzt+LtCGP4F5aQPlVPtKmNLCuVOP1aUvOSQ/tzclPOAihEq4jEWEOkrN77QNPQ6PT7
	 ONogx61lNQwRLAiwSN2NF9eEYvvtAwaCp299tEoreaiooZSidnJY1jTvXZ3HSyxPst
	 qjOypZ4/vJrB4FwpSAQeOFU4kqUCWpLBnhGMxcq69zgDCxHPe8FHj/O7V6sZJpry9D
	 onGz7SKQ6hT91mMXXQ2GGHLDTTxPADtMIPX1gXQRV5ACD7jBWJnlugCe/duxCPTivI
	 z+lKqBga5qRcw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vKvIL-0000000GgtA-2uJt;
	Mon, 17 Nov 2025 10:13:09 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Alex Gaynor" <alex.gaynor@gmail.com>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Boqun Feng" <boqun.feng@gmail.com>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Trevor Gross" <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/1] docs: makefile: move rustdoc check to the build wrapper
Date: Mon, 17 Nov 2025 10:12:51 +0100
Message-ID: <a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763370163.git.mchehab+huawei@kernel.org>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The makefile logic to detect if rust is enabled is not working
the way it was expected. Move it to be inside the wrapper
script.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile          |  6 -----
 tools/docs/sphinx-build-wrapper | 41 +++++++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index d514ab6761dc..d4c42aa89439 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -42,12 +42,6 @@ FONTS_CONF_DENY_VF ?= $(HOME)/deny-vf
 # User-friendly check for sphinx-build
 HAVE_SPHINX := $(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi)
 
-ifneq ($(wildcard $(srctree)/.config),)
-ifeq ($(CONFIG_RUST),y)
-	RUSTDOC=--rustdoc
-endif
-endif
-
 ifeq ($(HAVE_SPHINX),0)
 
 .DEFAULT:
diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 1efaca3d16aa..a554176b5a06 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -119,6 +119,29 @@ class SphinxBuilder:
 
         return path
 
+    def check_rust(self):
+        """
+        Checks if Rust is enabled
+        """
+        self.rustdoc = False
+
+        config = os.path.join(self.srctree, ".config")
+
+        if not os.path.isfile(config):
+            return
+
+        re_rust = re.compile(r"CONFIG_RUST=(m|y)")
+
+        try:
+            with open(config, "r", encoding="utf-8") as fp:
+                for line in fp:
+                    if re_rust.match(line):
+                        self.rustdoc = True
+                        return
+
+        except OSError as e:
+            print(f"Failed to open {config}", file=sys.stderr)
+
     def get_sphinx_extra_opts(self, n_jobs):
         """
         Get the number of jobs to be used for docs build passed via command
@@ -236,6 +259,8 @@ class SphinxBuilder:
 
         self.get_sphinx_extra_opts(n_jobs)
 
+        self.check_rust()
+
         #
         # If venv command line argument is specified, run Sphinx from venv
         #
@@ -306,7 +331,7 @@ class SphinxBuilder:
 
             return subprocess.call(cmd, *args, **pwargs)
 
-    def handle_html(self, css, output_dir, rustdoc):
+    def handle_html(self, css, output_dir):
         """
         Extra steps for HTML and epub output.
 
@@ -327,7 +352,8 @@ class SphinxBuilder:
             except (OSError, IOError) as e:
                 print(f"Warning: Failed to copy CSS: {e}", file=sys.stderr)
 
-        if rustdoc:
+        if self.rustdoc:
+            print("Building rust docs")
             if "MAKE" in self.env:
                 cmd = [self.env["MAKE"]]
             else:
@@ -622,7 +648,7 @@ class SphinxBuilder:
         shutil.rmtree(self.builddir, ignore_errors=True)
 
     def build(self, target, sphinxdirs=None,
-              theme=None, css=None, paper=None, deny_vf=None, rustdoc=False,
+              theme=None, css=None, paper=None, deny_vf=None,
               skip_sphinx=False):
         """
         Build documentation using Sphinx. This is the core function of this
@@ -671,7 +697,7 @@ class SphinxBuilder:
 
             args.extend(["-D", f"latex_elements.papersize={paper}paper"])
 
-        if rustdoc:
+        if self.rustdoc:
             args.extend(["-t", "rustdoc"])
 
         if not sphinxdirs:
@@ -749,7 +775,7 @@ class SphinxBuilder:
             # Ensure that each html/epub output will have needed static files
             #
             if target in ["htmldocs", "epubdocs"]:
-                self.handle_html(css, output_dir, rustdoc)
+                self.handle_html(css, output_dir)
 
         #
         # Step 2: Some targets (PDF and info) require an extra step once
@@ -804,9 +830,6 @@ def main():
     parser.add_argument('--deny-vf',
                         help="Configuration to deny variable fonts on pdf builds")
 
-    parser.add_argument('--rustdoc', action="store_true",
-                        help="Enable rustdoc build. Requires CONFIG_RUST")
-
     parser.add_argument("-v", "--verbose", action='store_true',
                         help="place build in verbose mode")
 
@@ -834,7 +857,7 @@ def main():
 
     builder.build(args.target, sphinxdirs=args.sphinxdirs,
                   theme=args.theme, css=args.css, paper=args.paper,
-                  rustdoc=args.rustdoc, deny_vf=args.deny_vf,
+                  deny_vf=args.deny_vf,
                   skip_sphinx=args.skip_sphinx_build)
 
 if __name__ == "__main__":
-- 
2.51.1

