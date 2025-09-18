Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67886305E1E;
	Thu, 18 Sep 2025 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196507; cv=none; b=T4S6iFlbOZGuViOq1P2KUYObdqBVHOK15DNNXceIbZGWN4i7Tknr7RyU3yONUIOwNqDzTagAGvT/foX6VK+JpHBoXVZwwrj6vPiUI8mPWjrGFDQvJT9pYsV5VUdb/+WfAMpCq1ZV1VATe6i115K7gZ8hqlekLefWxU9oaM9/p7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196507; c=relaxed/simple;
	bh=xi6aaKetpX4fDfqLRLgmvyJ++GISVlfrcSwACNlUxeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gz035z2BgaxukRKyw2me345zcGU+f3wCMFoNWrlpGsCv4S0b4wFnyhppubQGrxM2XYPPXaI48Ho3YDtck9sN/t00q4EJncoIrhqb3K5n4aaTwY4n6o6xS+N3FwuQdx1Oif0RLrIJkvq5uNTbqJ6xHdSEWqS5R5EyklKuaOcQa8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o32wMz4L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o32wMz4L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A464C4CEFA;
	Thu, 18 Sep 2025 11:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196507;
	bh=xi6aaKetpX4fDfqLRLgmvyJ++GISVlfrcSwACNlUxeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o32wMz4LSITpu8V6PpbPHsch6YkRhm6HnLwziF62iNeOvMDxlXdRX5B5Ms7h6BRHI
	 UfPFZ1nF6+MrxMHkg/ZKbMbuuLZYBYcAiPS9B7aAKcc8iDhG9KIg5rfn+s7gAI2Czb
	 0jzWnhOOG7CKt67pEUPlH7iSLl8P8I/bumMoWHL612uoSyslaaCfg+DUhZFmGBr1P7
	 o2fCGtVbLKVn6xiIRmEi65uuIMsjBwt2ltiPEFzYuHTE2uiaaleyEjC0+ZRNeue/MJ
	 xqsKx4y+Ctum13Iy4M7ICBzirYZtRLCdspXjCUP7xdneLmPKvWN08RbpIE60L61ShV
	 o6RKbTJZwpymQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE8-0000000Crtj-1zAs;
	Thu, 18 Sep 2025 13:55:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <mchehab+huawei@kernel.org>,
	Benno Lossin <mchehab+huawei@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <mchehab+huawei@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <mchehab+huawei@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v8 23/24] tools/docs: sphinx-* break documentation bulds on openSUSE
Date: Thu, 18 Sep 2025 13:54:57 +0200
Message-ID: <0635c311295300e9fb48c0ea607e2408910036e3.1758196090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758196090.git.mchehab+huawei@kernel.org>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Before this patch, building htmldocs on opensuseLEAP works
fine:

    # make htmldocs
    Available Python versions:
      /usr/bin/python3.11

    Python 3.6.15 not supported. Changing to /usr/bin/python3.11
    Python 3.6.15 not supported. Changing to /usr/bin/python3.11
    Using alabaster theme
    Using Python kernel-doc

    ...

As the logic detects that Python 3.6 is too old and recommends
intalling python311-Sphinx. If installed, documentation builds
work like a charm.

Yet, some develpers complained that running python3.11 instead
of python3 should not happen. So, let's break the build to make
them happier:

    $ make htmldocs
    Python 3.6.15 not supported. Bailing out
    You could run, instead:
      /usr/bin/python3.11 tools/docs/sphinx-build-wrapper htmldocs \
        --sphinxdirs=. --conf=conf.py --builddir=Documentation/output --theme= --css= \
        --paper=

    Python 3.6.15 not supported. Bailing out
    make[2]: *** [Documentation/Makefile:76: htmldocs] Error 1
    make[1]: *** [Makefile:1806: htmldocs] Error 2
    make: *** [Makefile:248: __sub-make] Error 2

It should be noticed that:

1. after this change, sphinx-pre-install needs to be called
   by hand:

    $ /usr/bin/python3.11 tools/docs/sphinx-pre-install
    Detected OS: openSUSE Leap 15.6.
    Sphinx version: 7.2.6

    All optional dependencies are met.
    Needed package dependencies are met.

2. sphinx-build-wrapper will auto-detect python3.11 and
   suggest a way to build the docs using the parameters passed
   via make variables. In this specific example:

   /usr/bin/python3.11 tools/docs/sphinx-build-wrapper htmldocs --sphinxdirs=. --conf=conf.py --theme= --css= --paper=

3. As this needs to be executed outside docs Makefile, it won't run
   the validation check scripts nor build Rust documentation if
   enabled, as the extra scripts are part of the docs Makefile.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/lib/python_version.py | 28 ++++++++++++++++++++++++----
 tools/docs/sphinx-build-wrapper  |  3 ++-
 tools/docs/sphinx-pre-install    |  3 ++-
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/tools/docs/lib/python_version.py b/tools/docs/lib/python_version.py
index a9fda2470a26..4fde1b882164 100644
--- a/tools/docs/lib/python_version.py
+++ b/tools/docs/lib/python_version.py
@@ -20,9 +20,11 @@ Python version if present.
 import os
 import re
 import subprocess
+import shlex
 import sys
 
 from glob import glob
+from textwrap import indent
 
 class PythonVersion:
     """
@@ -44,6 +46,25 @@ class PythonVersion:
         """Returns a version tuple as major.minor.patch"""
         return ".".join([str(x) for x in version])
 
+    @staticmethod
+    def cmd_print(cmd, max_len=80):
+        cmd_line = []
+
+        for w in cmd:
+            w = shlex.quote(w)
+
+            if cmd_line:
+                if not max_len or len(cmd_line[-1]) + len(w) < max_len:
+                    cmd_line[-1] += " " + w
+                    continue
+                else:
+                    cmd_line[-1] += " \\"
+                    cmd_line.append(w)
+            else:
+                cmd_line.append(w)
+
+        return "\n  ".join(cmd_line)
+
     def __str__(self):
         """Returns a version tuple as major.minor.patch from self.version"""
         return self.ver_str(self.version)
@@ -130,14 +151,13 @@ class PythonVersion:
         else:
             new_python_cmd = None
 
-        if show_alternatives:
+        if show_alternatives and available_versions:
             print("You could run, instead:")
             for _, cmd in available_versions:
                 args = [cmd, script_path] + sys.argv[1:]
 
-                cmd_str = " ".join(args)
-                print(f"  {cmd_str}")
-            print()
+                cmd_str = indent(PythonVersion.cmd_print(args), "  ")
+                print(f"{cmd_str}\n")
 
         if bail_out:
             msg = f"Python {python_ver} not supported. Bailing out"
diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index e24486dede76..103b0044bb0b 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -774,7 +774,8 @@ def main():
 
     args = parser.parse_args()
 
-    PythonVersion.check_python(MIN_PYTHON_VERSION)
+    PythonVersion.check_python(MIN_PYTHON_VERSION, show_alternatives=True,
+                               bail_out=True)
 
     builder = SphinxBuilder(builddir=args.builddir,
                             verbose=args.verbose, n_jobs=args.jobs,
diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index 663d4e2a3f57..698989584b6a 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -1531,7 +1531,8 @@ def main():
 
     checker = SphinxDependencyChecker(args)
 
-    PythonVersion.check_python(MIN_PYTHON_VERSION)
+    PythonVersion.check_python(MIN_PYTHON_VERSION,
+                               bail_out=True, success_on_error=True)
     checker.check_needs()
 
 # Call main if not used as module
-- 
2.51.0

