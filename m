Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0780288530;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309812; cv=none; b=debaYKcrpajngqBWHndRD5cBwK2xvFVR/Gyxwzu6eXMUHHvVGtoUGJ3a85SluVMhCZmBAC+J/EELHXAt4gInCqvVqfGU7tmCk4VE54AUPtToUvx81Zl75yzljZ2Uk2HXBdQ2Skvi8QVnyQiuXJA9DRRMHl07RG9rcc/X8VEj/gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309812; c=relaxed/simple;
	bh=xKx76+aLteSfJDFOU+fNmwoI11MnqmCUXFoZhfsqPIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cIhWr/rLq3OfZGF2cSFHzOAnCVvGmEHqFRCYx4hzIiZvguMQXHskCBz/MRcH4MYiYranAW5XI+JDwYXumhlQDxVc8gI8h6eo1defS2J1MjVFnd8venk6a3kTGVoXHCb0p73jeElUtOCWX5lY32EBypVatTLzUSIPjMiVluYopSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t2Q1mdZB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t2Q1mdZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80886C2BCC9;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778309812;
	bh=xKx76+aLteSfJDFOU+fNmwoI11MnqmCUXFoZhfsqPIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t2Q1mdZB38fDnMx/U+tjw0cFqbJ/YXYSG2nOpBMHXCWFCODXdZRw2k0vT6Ge+bIgC
	 D+xb5vQou6In2hvGV9QfyCy6Cu4fcsuzOhapboQYsrI4XeG/k+zHpIFiNhdI2rAnrH
	 U2fwt7Awp6idP7deKPk4U+yv5d2ldu01aE2e6OK9BYTgNfiUbUuZsCQfrGUcviqhFy
	 6xBjmPx2Se5RA4LrsgWTLrZCWEoyxxE2pnLQj9iIg2U/YJMfjsdXgjAwZExXPlFY/0
	 xjredj208ZZCmVGMVXyRnTJjdFpStZNjjTy1UrXokiGHLHdTkCcZE52BwFvauwCbIN
	 x3OWU0imr2GyQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wLbcI-00000000GIv-2jgS;
	Sat, 09 May 2026 08:56:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 06/13] docs: maintainers_include: store maintainers entries on a dict
Date: Sat,  9 May 2026 08:56:39 +0200
Message-ID: <f7d1a206475ee54f757b2642882013097cb5453a.1778309595.git.mchehab+huawei@kernel.org>
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

Instead of creating just a big output data, store entries inside
a dictionary. Doing that simplifies the parser a little bit
and make the code clearer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <4ad88179e03436984f29780ae380d50591f86c67.1777987027.git.mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 70 +++++++++------------
 1 file changed, 28 insertions(+), 42 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 345eb28804ff..ed9cd7b3dc66 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -49,10 +49,7 @@ class MaintainersParser:
 
         # Field letter to field name mapping.
         self.field_letter = None
-        self.fields = {}
 
-        self.field_prev = ""
-        self.field_content = ""
         self.subsystem_name = None
 
         self.app_dir = os.path.abspath(app_dir)
@@ -65,7 +62,9 @@ class MaintainersParser:
         #
         self.profile_toc = set()
         self.profile_entries = {}
-        self.output = ".. _maintainers:\n\n"
+        self.header = ".. _maintainers:\n\n"
+        self.maint_entries = {}
+        self.fields = {}
 
         prev = None
         with open(path, "r", encoding="utf-8") as fp:
@@ -77,11 +76,11 @@ class MaintainersParser:
                         self.subsystems = True
                         self.parse_subsystems(line)
                     else:
-                        self.output += line
+                        self.header += line
                 elif self.subsystems:
                     self.parse_subsystems(line)
                 else:
-                    self.output += line
+                    self.header += line
 
                 # Update the state machine when we find heading separators.
                 if line.startswith("----------"):
@@ -93,13 +92,6 @@ class MaintainersParser:
                 # Retain previous line for state machine transitions.
                 prev = line
 
-        # Flush pending field contents.
-        if self.field_content:
-            self.output += self.field_content + "\n\n"
-
-        self.output = self.output.rstrip()
-
-
     def linkify(self, text):
         """Linkify all non-wildcard refs to ReST files in Documentation/"""
 
@@ -130,11 +122,11 @@ class MaintainersParser:
         # Have we reached the end of the preformatted Descriptions text?
         if line.startswith("Maintainers"):
             self.descriptions = False
-            self.output += "\n" + line
+            self.header += "\n" + line
             return
 
         # Escape the escapes in preformatted text.
-        self.output += "| " + self.linkify(line).replace("\\", "\\\\")
+        self.header += "| " + self.linkify(line).replace("\\", "\\\\")
 
         # Look for and record field letter to field name mappings:
         #   R: Designated *reviewer*: FullName <address@domain>
@@ -157,24 +149,8 @@ class MaintainersParser:
         if not line:
             return
 
-        # Subsystem fields are batched into "field_content"
         if line[1] != ':':
-            line = self.linkify(line)
-
-            # Render a subsystem entry as:
-            #   SUBSYSTEM NAME
-            #   ~~~~~~~~~~~~~~
-            # Flush pending field content.
-            self.output += self.field_content + "\n\n"
-            self.field_content = ""
-
-            self.subsystem_name = line.title()
-
-            # Collapse whitespace in subsystem name.
-            heading = re.sub(r"\s+", " ", line)
-            self.output += "%s\n%s" % (heading, "~" * len(heading)) + "\n"
-            self.field_prev = ""
-
+            self.subsystem_name = re.sub(r"\s+", " ", self.linkify(line))
             return
 
         # Render a subsystem field as:
@@ -224,23 +200,23 @@ class MaintainersParser:
 
         details = self.linkify(details)
 
+        #
         # Mark paths (and regexes) as literal text for improved
         # readability and to escape any escapes.
+        #
         if field in ['F', 'N', 'X', 'K']:
             # But only if not already marked :)
             if not ':doc:' in details:
                 details = '``%s``' % (details)
 
-        # Comma separate email field continuations.
-        if field == self.field_prev and self.field_prev in ['M', 'R', 'L']:
-            self.field_content = self.field_content + ","
+        if self.subsystem_name not in self.maint_entries:
+            self.maint_entries[self.subsystem_name] = {}
+
+        if field not in self.maint_entries[self.subsystem_name]:
+            self.maint_entries[self.subsystem_name][field] = []
+
+        self.maint_entries[self.subsystem_name][field].append(details)
 
-        # Do not repeat field names, so that field entries
-        # will be collapsed together.
-        if field != self.field_prev:
-            self.output += self.field_content + "\n\n"
-            self.field_content = ":%s:" % (self.fields.get(field, field))
-        self.field_content = self.field_content + "\n\t%s" % (details)
         self.field_prev = field
 
 
@@ -252,7 +228,15 @@ class MaintainersInclude(Include):
     def emit(self):
         """Parse all the MAINTAINERS lines into ReST for human-readability"""
         path = maint_parser.path
-        output = maint_parser.output
+        output = maint_parser.header
+
+        for name, fields in sorted(maint_parser.maint_entries.items()):
+            output += "\n" + name + "\n"
+            output += "~" * len(name) + "\n"
+
+            for field, lines in fields.items():
+                field_name = maint_parser.fields.get(field, field)
+                output += f":{field_name}:\n\t" + ",\n\t".join(lines) + "\n\n"
 
         # For debugging the pre-rendered results...
         #print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
@@ -288,6 +272,8 @@ class MaintainersProfile(Include):
         #
         output = ""
         for profile, entry in sorted(maint_parser.profile_entries.items()):
+            profile = profile.title()
+
             if entry.startswith("http"):
                 output += f"- `{profile} <{entry}>`_\n"
             else:
-- 
2.54.0

