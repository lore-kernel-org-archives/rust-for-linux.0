Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D78B4611F4;
	Tue,  5 May 2026 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987565; cv=none; b=tem+4sE/GnAx5Ne+Ws1SGPWvtbQ0Nxg1O6GtlB4sF8fUQrylo6/9G6kvOhUewP1S+OXr7FxpqyUf6QH4nHYOwMXSDtIRNACiXuZTU7qsWSPopHpGV5i7hB8zpOD0tPCDeitaGK2iMkbNJDbdNnd2hD1dgcqOEX/y9Qk++2M9dmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987565; c=relaxed/simple;
	bh=YvaRCtftfZK5OkZseWD8Of6dwh1Rug3EykgCU5rGahM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bN9NjSjajvZyoiz/BDNVpnPWLo7qdts46YgbBnYWv3dikhAu7QA6N1B9T4WnfavftBKqbWEobaleWTlhX8ubb3HjZ6zUnAUz3LC45GrsUN1vAsRri1u7Uv/XCshAERjLFQTnRRenqH9Jg0PuDrcM8WcoypPr6G25gvG/re5gFTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ninsZURr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ninsZURr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29540C2BCFA;
	Tue,  5 May 2026 13:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987565;
	bh=YvaRCtftfZK5OkZseWD8Of6dwh1Rug3EykgCU5rGahM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ninsZURrTES27F46d8ksrE+BEEmVi7zaSeLOL7N/kfjFjirtZ+jrU88b6I7vwGDwm
	 8GlUgjfkQ8TNGqiUte6xoFyXOYEv5gp7HU968gqFbm/eZsrtBvTVeN7bMABVu8hIKK
	 AmIeUXWJ13Mb6Vt29xnPiyFzobEu4giJS8OGL7rsDEvF+6/WjyHzTDqikFn2GbWhD4
	 r1haXhgj4/w6BkWk6Ir1Hckk7HnMzIod3H36NDoqudwma+rHSSMhGjFuY+6irytw0w
	 Zor4Mmtnpzk7J4FiVpE4A1n1Mml68ZqfAhzQ/98XFZklJryy2s/nIjKo8FeNInsX07
	 xInS8ufw4e8hQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFml-00000004iiL-1wXA;
	Tue, 05 May 2026 15:26:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 05/11] docs: maintainers_include: do some coding style cleanups
Date: Tue,  5 May 2026 15:25:52 +0200
Message-ID: <460aabd0518f080b34e12fdc0beb7ec7685d5866.1777987027.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777987027.git.mchehab+huawei@kernel.org>
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Minor coding style adjustments to use the style most python
doc scripts are following.

No functional changes.

Assisted-by: pylint, black
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 101 ++++++++++----------
 1 file changed, 51 insertions(+), 50 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index d3ad01e5309e..7edda808ef99 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -1,30 +1,25 @@
 #!/usr/bin/env python
 # SPDX-License-Identifier: GPL-2.0
 # -*- coding: utf-8; mode: python -*-
-# pylint: disable=R0903, C0330, R0914, R0912, E0401
+# pylint: disable=C0209, C0301, E0401, R0022, R0902, R0903, R0912, R0914
 
 """
-    maintainers-include
-    ~~~~~~~~~~~~~~~~~~~
+Implementation of the ``maintainers-include`` reST-directive.
 
-    Implementation of the ``maintainers-include`` reST-directive.
+:copyright:  Copyright (C) 2019  Kees Cook <keescook@chromium.org>
+:license:    GPL Version 2, June 1991 see linux/COPYING for details.
 
-    :copyright:  Copyright (C) 2019  Kees Cook <keescook@chromium.org>
-    :license:    GPL Version 2, June 1991 see linux/COPYING for details.
-
-    The ``maintainers-include`` reST-directive performs extensive parsing
-    specific to the Linux kernel's standard "MAINTAINERS" file, in an
-    effort to avoid needing to heavily mark up the original plain text.
+The ``maintainers-include`` reST-directive performs extensive parsing
+specific to the Linux kernel's standard "MAINTAINERS" file, in an
+effort to avoid needing to heavily mark up the original plain text.
 """
 
-import sys
-import re
 import os.path
+import re
 
 from glob import glob
 
 from docutils import statemachine
-from docutils.parsers.rst import Directive
 from docutils.parsers.rst.directives.misc import Include
 
 #
@@ -32,12 +27,14 @@ from docutils.parsers.rst.directives.misc import Include
 #
 KERNELDOC_URL = "https://docs.kernel.org/"
 
-def ErrorString(exc):  # Shamelessly stolen from docutils
-    return f'{exc.__class__.__name}: {exc}'
+__version__ = "1.0"
 
-__version__  = '1.0'
+maint_parser = None  # pylint: disable=C0103
 
-maint_parser = None
+
+# Shamelessly stolen from docutils
+def ErrorString(exc):  # pylint: disable=C0103, C0116
+    return f"{exc.__class__.__name}: {exc}"  # pylint: disable=W0212
 
 class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
@@ -52,7 +49,7 @@ class MaintainersParser:
 
         # Field letter to field name mapping.
         self.field_letter = None
-        self.fields = dict()
+        self.fields = {}
 
         self.field_prev = ""
         self.field_content = ""
@@ -71,29 +68,30 @@ class MaintainersParser:
         self.output = ".. _maintainers:\n\n"
 
         prev = None
-        for line in open(path):
-            if self.descriptions:
-                self.parse_descriptions(line)
-            elif self.maintainers and not self.subsystems:
-                if re.search('^[A-Z0-9]', line):
-                    self.subsystems = True
+        with open(path, "r", encoding="utf-8") as fp:
+            for line in fp:
+                if self.descriptions:
+                    self.parse_descriptions(line)
+                elif self.maintainers and not self.subsystems:
+                    if re.search('^[A-Z0-9]', line):
+                        self.subsystems = True
+                        self.parse_subsystems(line)
+                    else:
+                        self.output += line
+                elif self.subsystems:
                     self.parse_subsystems(line)
                 else:
                     self.output += line
-            elif self.subsystems:
-                self.parse_subsystems(line)
-            else:
-                self.output += line
 
-            # Update the state machine when we find heading separators.
-            if line.startswith('----------'):
-                if prev.startswith('Descriptions'):
-                    self.descriptions = True
-                if prev.startswith('Maintainers'):
-                    self.maintainers = True
+                # Update the state machine when we find heading separators.
+                if line.startswith("----------"):
+                    if prev.startswith("Descriptions"):
+                        self.descriptions = True
+                    if prev.startswith("Maintainers"):
+                        self.maintainers = True
 
-            # Retain previous line for state machine transitions.
-            prev = line
+                # Retain previous line for state machine transitions.
+                prev = line
 
         # Flush pending field contents.
         if self.field_content:
@@ -130,7 +128,7 @@ class MaintainersParser:
         """Handle contents of the descriptions section."""
 
         # Have we reached the end of the preformatted Descriptions text?
-        if line.startswith('Maintainers'):
+        if line.startswith("Maintainers"):
             self.descriptions = False
             self.output += "\n" + line
             return
@@ -182,7 +180,7 @@ class MaintainersParser:
         # Render a subsystem field as:
         #   :Field: entry
         #           entry...
-        field, details = line.split(':', 1)
+        field, details = line.split(":", 1)
         details = details.strip()
 
         #
@@ -248,12 +246,11 @@ class MaintainersParser:
 
 class MaintainersInclude(Include):
     """MaintainersInclude (``maintainers-include``) directive"""
+
     required_arguments = 0
 
     def emit(self):
         """Parse all the MAINTAINERS lines into ReST for human-readability"""
-        global maint_parser
-
         path = maint_parser.path
         output = maint_parser.output
 
@@ -269,20 +266,21 @@ class MaintainersInclude(Include):
             raise self.warning('"%s" directive disabled.' % self.name)
 
         try:
-            lines = self.emit()
+            self.emit()
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
 
         return []
 
+
 class MaintainersProfile(Include):
+    """Generate a list with all maintainer's profiles"""
+
     required_arguments = 0
 
     def emit(self):
         """Parse all the MAINTAINERS lines looking for profile entries"""
-        global maint_parser
-
         path = maint_parser.path
 
         #
@@ -316,15 +314,17 @@ class MaintainersProfile(Include):
             raise self.warning('"%s" directive disabled.' % self.name)
 
         try:
-            lines = self.emit()
+            self.emit()
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
 
         return []
 
+
 def setup(app):
-    global maint_parser
+    """Setup Sphinx exension"""
+    global maint_parser  # pylint: disable=W0603
 
     #
     # NOTE: we're using os.fspath() here because of a Sphinx warning:
@@ -338,8 +338,9 @@ def setup(app):
 
     app.add_directive("maintainers-include", MaintainersInclude)
     app.add_directive("maintainers-profile-toc", MaintainersProfile)
-    return dict(
-        version = __version__,
-        parallel_read_safe = True,
-        parallel_write_safe = True
-    )
+
+    return {
+        "version": __version__,
+        "parallel_read_safe": True,
+        "parallel_write_safe": True,
+    }
-- 
2.54.0

