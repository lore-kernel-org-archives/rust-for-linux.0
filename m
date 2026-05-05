Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5958644BCA5;
	Tue,  5 May 2026 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987565; cv=none; b=SpdBC874zL3HaXMTNQ2cmkAXYsJBvJ8+tfj6lhHnBPOq0fHtL0dt4iR8zm0VZ/FM8eBLr0gqKCBK51dVPXknAIAm3OxOn+wc3cX0AFiUHPkplAjM7SYTD+KmKds3DAWGA5E93GrzHsaKXqzd2c8xOGz3S448hyBKcusD0s8RIrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987565; c=relaxed/simple;
	bh=IZImVP8c+ey+xlWh+v0vjXYkjWCH8nfwkViflJwfEr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DseIWQhkeYpPX6KPksFBvSQeVkb3MZzTpZEIFHDFoM31LA8RVhTeeByi+gDyopQ2aaR34IiWgOWIhmDLJeIa2AywNJ8hYJcUc1GqzicL4bbd5OheLocT+yDhB8QFu44j+nI8fnvp10Gfh5x8+F9vTiP61VHu7FsfG7FjlRevYO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rg0enokE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rg0enokE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB39C2BCC9;
	Tue,  5 May 2026 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987565;
	bh=IZImVP8c+ey+xlWh+v0vjXYkjWCH8nfwkViflJwfEr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rg0enokEVv2NmJ+CTkhvhteYZQueTToh8a8YAX77qnSGUtz/UcKd/1v+iaBludaEa
	 duTefMawUmBYAHMhG19Saaor6a9cNHwENSH+cO6RIVSGKtpDtRhKwWPBVaJSUH+1jB
	 HDM8DnD6feImlygWhqU+akEXG4jjtbO2e2gVKvwjj3h9C0e5CIU5TSVzr8Y2idi5Qx
	 LPz/mi93fkQ+l601kBharpm4wAEwxkW2iFiUw7DMyylIjCNN8JEf3L7wiNTxjmUXAQ
	 4BPd93gV6inxbTXQ0BE+l6nJ4IyLI4H/RseNsBuc/0qh9Zdu+IW54cbocRXj9UOA5S
	 rI8okPmr3zykQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFmk-00000004ieo-3zzc;
	Tue, 05 May 2026 15:26:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 02/11] docs: maintainers_include: split state machine on multiple funcs
Date: Tue,  5 May 2026 15:25:49 +0200
Message-ID: <0b72530cf496ce5e2987ca784058a50f4dc814d2.1777987027.git.mchehab+huawei@kernel.org>
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

Instead of one big __init__ code, split the MaintainersParser
code in a way that the state machine remains on __init__, but
the actual parser for descriptions and subsystems are moved
to separate functions.

To make parser easier, instead storing parsed results on a list,
place them directly on a string.

That granted 15% of performance increase(*) with Python 3.14 and
made the logic simpler.

(*) measured by creating a new directory under Documentation/,
    and placing justmaintainers.rst and an index file there,
    building it via sphinx-build-wrapper.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 297 +++++++++++---------
 1 file changed, 158 insertions(+), 139 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 694cdbdc4caf..6d47d55f5b73 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -47,167 +47,186 @@ class MaintainersParser:
         self.profile_toc = set()
         self.profile_entries = {}
 
-        result = list()
-        result.append(".. _maintainers:")
-        result.append("")
+        self.output = ".. _maintainers:\n\n"
 
         # Poor man's state machine.
-        descriptions = False
-        maintainers = False
-        subsystems = False
+        self.descriptions = False
+        self.maintainers = False
+        self.subsystems = False
 
         # Field letter to field name mapping.
-        field_letter = None
-        fields = dict()
+        self.field_letter = None
+        self.fields = dict()
+
+        self.field_prev = ""
+        self.field_content = ""
+        self.subsystem_name = None
+
+        self.app_dir = app_dir
+        self.base_dir, self.doc_dir, self.sphinx_dir = app_dir.partition("Documentation")
+
+        self.re_doc = re.compile(r'(Documentation/([^\s\?\*]*)\.rst)')
 
         prev = None
-        field_prev = ""
-        field_content = ""
-        subsystem_name = None
-
-        base_dir, doc_dir, sphinx_dir = app_dir.partition("Documentation")
-
         for line in open(path):
-            # Have we reached the end of the preformatted Descriptions text?
-            if descriptions and line.startswith('Maintainers'):
-                descriptions = False
-                # Ensure a blank line following the last "|"-prefixed line.
-                result.append("")
-
-            # Start subsystem processing? This is to skip processing the text
-            # between the Maintainers heading and the first subsystem name.
-            if maintainers and not subsystems:
+            if self.descriptions:
+                self.parse_descriptions(line)
+            elif self.maintainers and not self.subsystems:
                 if re.search('^[A-Z0-9]', line):
-                    subsystems = True
-
-            # Drop needless input whitespace.
-            line = line.rstrip()
-
-            #
-            # Handle profile entries - either as files or as https refs
-            #
-            match = re.match(rf"P:\s*({doc_dir})(/\S+)\.rst", line)
-            if match:
-                name = "".join(match.groups())
-                entry = os.path.relpath(base_dir + name, app_dir)
-
-                full_name = os.path.join(base_dir, name)
-                path = os.path.relpath(full_name, app_dir)
-                #
-                # When SPHINXDIRS is used, it will try to reference files
-                # outside srctree, causing warnings. To avoid that, point
-                # to the latest official documentation
-                #
-                if path.startswith("../"):
-                    entry = KERNELDOC_URL + match.group(2) + ".html"
+                    self.subsystems = True
+                    self.parse_subsystems(line)
                 else:
-                    entry = "/" + entry
-
-                if "*" in entry:
-                    for e in glob(entry):
-                        self.profile_toc.add(e)
-                        self.profile_entries[subsystem_name] = e
-                else:
-                    self.profile_toc.add(entry)
-                    self.profile_entries[subsystem_name] = entry
-            else:
-                match = re.match(r"P:\s*(https?://.*)", line)
-                if match:
-                    entry = match.group(1).strip()
-                    self.profile_entries[subsystem_name] = entry
-
-            # Linkify all non-wildcard refs to ReST files in Documentation/.
-            pat = r'(Documentation/([^\s\?\*]*)\.rst)'
-            m = re.search(pat, line)
-            if m:
-                # maintainers.rst is in a subdirectory, so include "../".
-                line = re.sub(pat, ':doc:`%s <../%s>`' % (m.group(2), m.group(2)), line)
-
-            # Check state machine for output rendering behavior.
-            output = None
-            if descriptions:
-                # Escape the escapes in preformatted text.
-                output = "| %s" % (line.replace("\\", "\\\\"))
-                # Look for and record field letter to field name mappings:
-                #   R: Designated *reviewer*: FullName <address@domain>
-                m = re.search(r"\s(\S):\s", line)
-                if m:
-                    field_letter = m.group(1)
-                if field_letter and not field_letter in fields:
-                    m = re.search(r"\*([^\*]+)\*", line)
-                    if m:
-                        fields[field_letter] = m.group(1)
-            elif subsystems:
-                # Skip empty lines: subsystem parser adds them as needed.
-                if len(line) == 0:
-                    continue
-                # Subsystem fields are batched into "field_content"
-                if line[1] != ':':
-                    # Render a subsystem entry as:
-                    #   SUBSYSTEM NAME
-                    #   ~~~~~~~~~~~~~~
-
-                    # Flush pending field content.
-                    output = field_content + "\n\n"
-                    field_content = ""
-
-                    subsystem_name = line.title()
-
-                    # Collapse whitespace in subsystem name.
-                    heading = re.sub(r"\s+", " ", line)
-                    output = output + "%s\n%s" % (heading, "~" * len(heading))
-                    field_prev = ""
-                else:
-                    # Render a subsystem field as:
-                    #   :Field: entry
-                    #           entry...
-                    field, details = line.split(':', 1)
-                    details = details.strip()
-
-                    # Mark paths (and regexes) as literal text for improved
-                    # readability and to escape any escapes.
-                    if field in ['F', 'N', 'X', 'K']:
-                        # But only if not already marked :)
-                        if not ':doc:' in details:
-                            details = '``%s``' % (details)
-
-                    # Comma separate email field continuations.
-                    if field == field_prev and field_prev in ['M', 'R', 'L']:
-                        field_content = field_content + ","
-
-                    # Do not repeat field names, so that field entries
-                    # will be collapsed together.
-                    if field != field_prev:
-                        output = field_content + "\n"
-                        field_content = ":%s:" % (fields.get(field, field))
-                    field_content = field_content + "\n\t%s" % (details)
-                    field_prev = field
+                    self.output += line
+            elif self.subsystems:
+                self.parse_subsystems(line)
             else:
-                output = line
-
-            # Re-split on any added newlines in any above parsing.
-            if output != None:
-                for separated in output.split('\n'):
-                    result.append(separated)
+                self.output += line
 
             # Update the state machine when we find heading separators.
             if line.startswith('----------'):
                 if prev.startswith('Descriptions'):
-                    descriptions = True
+                    self.descriptions = True
                 if prev.startswith('Maintainers'):
-                    maintainers = True
+                    self.maintainers = True
 
             # Retain previous line for state machine transitions.
             prev = line
 
         # Flush pending field contents.
-        if field_content != "":
-            for separated in field_content.split('\n'):
-                result.append(separated)
+        if self.field_content:
+            self.output += self.field_content + "\n\n"
 
-        self.output = "\n".join(result)
+        self.output = self.output.rstrip()
+
+    def parse_descriptions(self, line):
+        """Handle contents of the descriptions section."""
+
+        # Have we reached the end of the preformatted Descriptions text?
+        if line.startswith('Maintainers'):
+            self.descriptions = False
+            self.output += "\n" + line
+            return
+
+        # Linkify all non-wildcard refs to ReST files in Documentation/.
+        m = self.re_doc.search(line)
+        if m:
+            # maintainers.rst is in a subdirectory, so include "../".
+            line = self.re_doc.sub(':doc:`%s <../%s>`' % (m.group(2), m.group(2)), line)
+
+        # Escape the escapes in preformatted text.
+        output = "| %s" % (line.replace("\\", "\\\\"))
+
+        # Look for and record field letter to field name mappings:
+        #   R: Designated *reviewer*: FullName <address@domain>
+        m = re.search(r"\s(\S):\s", line)
+        if m:
+            self.field_letter = m.group(1)
+
+        if self.field_letter and self.field_letter not in self.fields:
+            m = re.search(r"\*([^\*]+)\*", line)
+            if m:
+                self.fields[self.field_letter] = m.group(1)
+
+        # Append parsed content to self.output
+        self.output += output
+
+    def parse_subsystems(self, line):
+        """Handle contents of the per-subsystem sections."""
+
+        # Drop needless input whitespace.
+        line = line.rstrip()
+
+        #
+        # Handle profile entries - either as files or as https refs
+        #
+        match = re.match(rf"P:\s*({self.doc_dir})(/\S+)\.rst", line)
+        if match:
+            name = "".join(match.groups())
+            entry = os.path.relpath(self.base_dir + name, self.app_dir)
+
+            full_name = os.path.join(self.base_dir, name)
+            path = os.path.relpath(full_name, self.app_dir)
+            #
+            # When SPHINXDIRS is used, it will try to reference files
+            # outside srctree, causing warnings. To avoid that, point
+            # to the latest official documentation
+            #
+            if path.startswith("../"):
+                entry = KERNELDOC_URL + match.group(2) + ".html"
+            else:
+                entry = "/" + entry
+
+            if "*" in entry:
+                for e in glob(entry):
+                    self.profile_toc.add(e)
+                    self.profile_entries[self.subsystem_name] = e
+            else:
+                self.profile_toc.add(entry)
+                self.profile_entries[self.subsystem_name] = entry
+        else:
+            match = re.match(r"P:\s*(https?://.*)", line)
+            if match:
+                entry = match.group(1).strip()
+                self.profile_entries[self.subsystem_name] = entry
+
+        # Linkify all non-wildcard refs to ReST files in Documentation/.
+        m = self.re_doc.search(line)
+        if m:
+            # maintainers.rst is in a subdirectory, so include "../".
+            line = self.re_doc.sub(':doc:`%s <../%s>`' % (m.group(2), m.group(2)), line)
+
+        # Check state machine for output rendering behavior.
+        output = None
+        if self.subsystems:
+            # Skip empty lines: subsystem parser adds them as needed.
+            if len(line) == 0:
+                return
+            # Subsystem fields are batched into "field_content"
+            if line[1] != ':':
+                # Render a subsystem entry as:
+                #   SUBSYSTEM NAME
+                #   ~~~~~~~~~~~~~~
+                # Flush pending field content.
+                output = self.field_content + "\n\n"
+                self.field_content = ""
+
+                self.subsystem_name = line.title()
+
+                # Collapse whitespace in subsystem name.
+                heading = re.sub(r"\s+", " ", line)
+                output = output + "%s\n%s" % (heading, "~" * len(heading))
+                self.field_prev = ""
+            else:
+                # Render a subsystem field as:
+                #   :Field: entry
+                #           entry...
+                field, details = line.split(':', 1)
+                details = details.strip()
+
+                # Mark paths (and regexes) as literal text for improved
+                # readability and to escape any escapes.
+                if field in ['F', 'N', 'X', 'K']:
+                    # But only if not already marked :)
+                    if not ':doc:' in details:
+                        details = '``%s``' % (details)
+
+                # Comma separate email field continuations.
+                if field == self.field_prev and self.field_prev in ['M', 'R', 'L']:
+                    self.field_content = self.field_content + ","
+
+                # Do not repeat field names, so that field entries
+                # will be collapsed together.
+                if field != self.field_prev:
+                    output = self.field_content + "\n"
+                    self.field_content = ":%s:" % (self.fields.get(field, field))
+                self.field_content = self.field_content + "\n\t%s" % (details)
+                self.field_prev = field
+        elif not self.descriptions:
+            output = line
+
+        if output is not None:
+            self.output += output + "\n"
 
-        # Create a TOC class
 
 class MaintainersInclude(Include):
     """MaintainersInclude (``maintainers-include``) directive"""
-- 
2.54.0

