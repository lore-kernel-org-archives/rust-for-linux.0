Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D097F33CE80;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309812; cv=none; b=Zp1aIzDwUVLNjeHF9KZK83m8yekZYcJd7+Zr+6biiGDC7MtprxC2OL6g8XJbSXF0AqqKk9/RxEv1CEZCE1RNpkqehjsthHpbXWhzWE2bS7S2QD6WIFXlvTdRsPkZnYZMvzmQcivSwQIYhceSFPBD5uqNSCmAle+RKehMCOc78to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309812; c=relaxed/simple;
	bh=k9b6iREAcYovXmkSWuj6Zi9Oc/0Ei0eob0uGnTRB3iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9XgBk5fJ2VhYgtoPTGlTWQ5SV9Q8yacZBQOhjLEKx++N5C89SMJoUgXDqsBnWIxbS+ke8QauW/9UtZoqyI0LiUztgGeDMbkvRV0vrFaXJD3QpQbmMUkcUFEvxOr11VZgixvQGElqOfeToqrlaOgOSmyzCZj80TRhH1lJ/NU+cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErsCJVri; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErsCJVri"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF79C2BCF5;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778309812;
	bh=k9b6iREAcYovXmkSWuj6Zi9Oc/0Ei0eob0uGnTRB3iE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ErsCJVri3PtVIaNXdUDGywcbtu7EM/UBB5VLuG8WL7dNgvhXTII/GG1EjRSZpCjzZ
	 RY8v5U9xTPY6FiLgmKqaGX67Hbv3Za4QJbUnQl1MF2w/4MOicv9pgi0KDxymyGl/hI
	 L6BBbbB56bO0eTEtLge0BWYXsKOycbBb5jMKTjdeRUYxhjdOhmV5klG7N++8ase25t
	 tTYOzkgVsQyWZGO1WlHagxDqftxTO68xTeBFhFIzQiRRPb/eeOGmz/EiJAO9TR1g9E
	 L5TD0fIUM3Zp+rhq8dyPZ+HieDT4MBiTb7VV66wrmjizMMKR6o0QW+NZSD0oKDJ45D
	 /C23xvwoMqKJw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wLbcI-00000000GJB-3CCt;
	Sat, 09 May 2026 08:56:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 10/13] docs: maintainers_include: better handle directories
Date: Sat,  9 May 2026 08:56:43 +0200
Message-ID: <2b07e12eaa07bf81824ad427335783b170e01dba.1778309595.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778309595.git.mchehab+huawei@kernel.org>
References: <cover.1778309595.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The TOC tree needs to use paths relative to the document containing
the maintainers-profile-toc directive. Fix it.

While here, address a warning from sashiko-bot, which points
that using partition can be problematic if the root Linux path
ends being something like:

    foo/Documentation/linux/

causing the documentation dir to be at:

    foo/Documentation/linux/Documentation

Very unlikely, but fixing it is trivial: just use regex to
pick the last one.

Notice that I dropped the comment about using os.fspath() as
the logic already uses os.path.abspath() which should work
equally well.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 28 ++++++++++++---------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 073a10575872..8c7b79721edd 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -82,7 +82,7 @@ def ErrorString(exc):  # pylint: disable=C0103, C0116
 class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
 
-    def __init__(self, app_dir, path):
+    def __init__(self, base_dir, app_dir, path):
         self.path = path
 
         # Poor man's state machine.
@@ -92,8 +92,8 @@ class MaintainersParser:
 
         self.subsystem_name = None
 
-        self.app_dir = os.path.abspath(app_dir)
-        self.base_dir, _, self.sphinx_dir = self.app_dir.partition("Documentation")
+        self.base_dir = base_dir
+        self.app_dir = app_dir
 
         self.re_doc = re.compile(r'(Documentation/([^\s\?\*]*)\.rst)')
 
@@ -323,6 +323,8 @@ class MaintainersProfile(Include):
 
     def emit(self):
         """Parse all the MAINTAINERS lines looking for profile entries"""
+        env = self.state.document.settings.env
+        docdir = os.path.dirname(os.path.join(env.srcdir, env.docname))
         path = maint_parser.path
 
         #
@@ -347,7 +349,9 @@ class MaintainersProfile(Include):
         output += "\n.. toctree::\n"
         output += "   :hidden:\n\n"
 
-        for fname in sorted(maint_parser.profile_toc):
+        for f in sorted(maint_parser.profile_toc):
+            fname = os.path.join(maint_parser.base_dir, "Documentation", f)
+            fname = os.path.relpath(fname, docdir)
             output += f"   {fname}\n"
 
         output += "\n"
@@ -381,15 +385,15 @@ def setup(app):
     """Setup Sphinx extension"""
     global maint_parser  # pylint: disable=W0603
 
-    #
-    # NOTE: we're using os.fspath() here because of a Sphinx warning:
-    #   RemovedInSphinx90Warning: Sphinx 9 will drop support for representing paths as strings. Use "pathlib.Path" or "os.fspath" instead.
-    #
-    app_dir = os.fspath(app.srcdir)
-    srctree = os.path.abspath(os.environ["srctree"])
-    path = os.path.join(srctree, "MAINTAINERS")
+    app_dir = os.path.abspath(app.srcdir)
+    match = re.match(r"(.*/)Documentation", app_dir)
+    if not match:
+        raise ValueError('Documentation directory not found.')
 
-    maint_parser = MaintainersParser(app_dir, path)
+    base_dir = match.group(1)
+    path = os.path.join(base_dir, "MAINTAINERS")
+
+    maint_parser = MaintainersParser(base_dir, app_dir, path)
 
     app.add_directive("maintainers-include", MaintainersInclude)
     app.add_directive("maintainers-profile-toc", MaintainersProfile)
-- 
2.54.0

