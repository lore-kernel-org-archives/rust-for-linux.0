Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DEE3E1D12;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909889; cv=none; b=RTABZ5sNOqRmGFC/RmlOniLPJb3UKVPCxztWKszRksb93gL7jI2eLGx7yMTpYpT7sN5SQTv5YMSYbUQMC4/TqDyr2mcbQU+ei7nPoMoKlf4KCFy7pz0HgG5worr3dd/1oJRWfnVYkcUWqhUzG0PhBXsRs1Cl5NExCGlzWHBGF0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909889; c=relaxed/simple;
	bh=gGS+Sq20I0mOflr7aaM6CTdnP+p8jMyJW95cC7Ufmis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZCNbb4atwDInWQS5WNAFdq8VRGg1CSGrSOWpAKCh2TShtDdPP5B2AMBvviPu+pbMXusaMSjYWxsJpG0J6qyE2fPKdFc7vF6A1WgmQ5gC2TOZd2fN29ueQhLbEC63ac2Tluqub2fFgCB7ovhLQmHBomM0Koot4PwKiC42JF9IoDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uq6GxmTf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uq6GxmTf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56526C32786;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777909889;
	bh=gGS+Sq20I0mOflr7aaM6CTdnP+p8jMyJW95cC7Ufmis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uq6GxmTfIE0M6h1D2DB6OyYiCfP23DmvoYplO1+xsjP7JqJHVAoHTw5SWHhGsDW5q
	 rmUiVXdXP8nmsfvy10yNLyZ00etzL69HlK1eS813T86uBlrL7vbaXJ6xfmUgMp7zR/
	 Tbj0ycv1LN+5gClVj3D2ObC/hVmaXF45tVBtDF5y0j/+jQAKtRm+9ztyhvXmQtQkOM
	 MVYXdGqPcSo6jfawD23V9fgAfYEWB9cSoGh259fe2sfn+8FzMi0DiE4FyV0eDPSytS
	 ujsHf+rnH1HIGaE8k5+LTqzDJOAgvaqm8h/TZUJ/WFhuOBDFAnY6cA+2USuEiVz4Gu
	 nGFJjnlmulMOA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wJvZv-0000000EyBl-1rWQ;
	Mon, 04 May 2026 17:51:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 6/9] docs: maintainers_include: do some coding style cleanups
Date: Mon,  4 May 2026 17:51:15 +0200
Message-ID: <477be28411d10879596e5864a95e1d495e6ad20d.1777908711.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777908711.git.mchehab+huawei@kernel.org>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
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
index 1d7d441e281c..189f22e5fae4 100755
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
@@ -132,7 +130,7 @@ class MaintainersParser:
         """Handle contents of the descriptions section."""
 
         # Have we reached the end of the preformatted Descriptions text?
-        if line.startswith('Maintainers'):
+        if line.startswith("Maintainers"):
             self.descriptions = False
             self.output += "\n" + line
             return
@@ -185,7 +183,7 @@ class MaintainersParser:
         # Render a subsystem field as:
         #   :Field: entry
         #           entry...
-        field, details = line.split(':', 1)
+        field, details = line.split(":", 1)
         details = details.strip()
 
         #
@@ -246,12 +244,11 @@ class MaintainersParser:
 
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
 
@@ -267,20 +264,21 @@ class MaintainersInclude(Include):
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
@@ -317,15 +315,17 @@ class MaintainersProfile(Include):
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
@@ -339,8 +339,9 @@ def setup(app):
 
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

