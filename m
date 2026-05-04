Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54C23E2754;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909889; cv=none; b=XBulXDPN16q0B6+f8OG9cEb8oOkXfvyyBMRT3sXMLE2/NVaIKx7iljVveoueZQxrTQ3JzJcqiuaksaUdjean9WBNxY5Q0+TeNzcuOTvAZPYUyhhz7H4oce85e/kkKYJHbPxCRAe9kFvfIcDYiI10LhRsOEGcmYoWAtmVYI6gRZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909889; c=relaxed/simple;
	bh=bBEz42S1x27nT6zHZwr/ykJ083aYhHNYLcxNYqgBQBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=phnxyl/G003j2w3xO43plxuEkDx3amHSs3p7DmcFkUcMvOhOwWGWd1c2BtSF6ePQn5S6iqv/yole+zOVjImioST5KpGhjJGLZ2oyJ1hsFlQq2/CrfGnu/5uJt1+zk5t/ImP2GqSazGQhqox9f+1ahWRAOPaUDWrO/D7M7Be+7V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQEexr5n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQEexr5n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5BAC2BD00;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777909889;
	bh=bBEz42S1x27nT6zHZwr/ykJ083aYhHNYLcxNYqgBQBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nQEexr5nZSX9L+eemkGfOprKrMqQNPwFar9O41xWDw8/vWoiNwkU6I+SwtwbmsTOq
	 6wXEa0x6Oyj+tWUXmrRfIPW6TOS0E2bQUx6X3O/h7V1ZMPbCD6jw30Q/hpoRQyxqyZ
	 QE/z+bO/tKNbOc2ACfyyRmeboKTUgBfYJz9sIImSrg6aWON3I2HhZxDs6PIBcy0WJR
	 KWa42JL0vNMQL5CQaYSZnCcNVJehk0HobFkOBIIstKr2JGHQbJDQqVh8AUu9U1hIjw
	 5pJMDoFrxtSk8oPkQpkF+yjfryfo4eSAInbSjFC2rxR0mSAFCUYFl2DSS4DIfj7Bi/
	 av/J7w6HIDbfw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wJvZv-0000000EyCw-2aJ0;
	Mon, 04 May 2026 17:51:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 7/9] docs: maintainers_include: store maintainers entries on a dict
Date: Mon,  4 May 2026 17:51:16 +0200
Message-ID: <beb983ebe4f7e38975eee4eb8c1c304427350e04.1777908711.git.mchehab+huawei@kernel.org>
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

Instead of creating just a big output data, store entries inside
a dictionary. Doing that simplifies the parser a little bit
and make the code clearer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 82 +++++++++------------
 1 file changed, 35 insertions(+), 47 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 189f22e5fae4..50359b125db0 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -49,10 +49,7 @@ class MaintainersParser:
 
         # Field letter to field name mapping.
         self.field_letter = None
-        self.fields = {}
 
-        self.field_prev = ""
-        self.field_content = ""
         self.subsystem_name = None
 
         self.app_dir = app_dir
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
 
@@ -132,12 +124,12 @@ class MaintainersParser:
         # Have we reached the end of the preformatted Descriptions text?
         if line.startswith("Maintainers"):
             self.descriptions = False
-            self.output += "\n" + line
+            self.header += "\n" + line
             return
 
         # Escape the escapes in preformatted text.
         line = self.linkify(line).replace("\\", "\\\\").replace("**", "\\**")
-        self.output += "| " + line
+        self.header += "| " + line
 
         # Look for and record field letter to field name mappings:
         #   R: Designated *reviewer*: FullName <address@domain>
@@ -160,24 +152,8 @@ class MaintainersParser:
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
@@ -192,20 +168,22 @@ class MaintainersParser:
         if field == "P":
             match = self.re_doc.match(details)
             if match:
-                name = "".join(match.groups())
-                entry = os.path.relpath(self.base_dir + name, self.app_dir)
+                fname = match.group(1)
+                ename = "/" + match.group(2)
 
-                full_name = os.path.join(self.base_dir, name)
+                entry = os.path.relpath(self.base_dir + ename, self.app_dir)
+                full_name = os.path.join(self.base_dir, fname)
                 path = os.path.relpath(full_name, self.app_dir)
                 #
                 # When SPHINXDIRS is used, it will try to reference files
                 # outside srctree, causing warnings. To avoid that, point
                 # to the latest official documentation
                 #
+
                 if path.startswith("../"):
-                    entry = KERNELDOC_URL + "/" + match.group(2) + ".html"
+                    entry = KERNELDOC_URL + fname + ".html"
                 else:
-                    entry = "/" + entry
+                    entry = ename
 
                 if "*" in entry:
                     for e in glob(entry):
@@ -222,23 +200,23 @@ class MaintainersParser:
 
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
 
 
@@ -250,7 +228,15 @@ class MaintainersInclude(Include):
     def emit(self):
         """Parse all the MAINTAINERS lines into ReST for human-readability"""
         path = maint_parser.path
-        output = maint_parser.output
+        output = maint_parser.header
+
+        for name, fields in maint_parser.maint_entries.items():
+            output += "\n" + name + "\n"
+            output += "~" * len(name) + "\n"
+
+            for field, lines in fields.items():
+                field_name = maint_parser.fields.get(field, field)
+                output += f":{field_name}:\n\t" + ",\n\t".join(lines) + "\n\n"
 
         # For debugging the pre-rendered results...
         print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
@@ -286,6 +272,8 @@ class MaintainersProfile(Include):
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

