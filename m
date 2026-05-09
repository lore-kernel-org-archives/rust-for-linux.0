Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195C237C93E;
	Sat,  9 May 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309813; cv=none; b=EiMzRxG8Ko32DM/C5uSRV258N0wkdYbNBqpxMSKwei+sA4nTlUABUs9LrpnzIFtUwRi8a0rs8eL6anxsCgMH0LCIwoD+hHcMS/2YM+V9jwedSPvLVLCNtC9e4aC6m68vwhjTh/ZYIYfinw8EnjqCBBxTXJ2EDRRRxqLjR21L0z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309813; c=relaxed/simple;
	bh=58D6TREjKdd2Wm2oWjAknodr8BsKAXN/7isMMM/lcGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CmMNzq2xWHngeHwCadPuARAkhlxVDaf1Z00xySnTZOwQrOA/UflvqWCbP3LG7Z6CuW8iWRMq9fJ6G6EH0xKvj8TJLmtMzVXR3mwYRpXWMzOP1BxOVao1ujuG6U3Fzm8ZtU1tPbLM4IGiwzEh7f3rZuA8mtySUici3oJWKFuaEPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLu5qk7G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLu5qk7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98479C2BCFF;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778309812;
	bh=58D6TREjKdd2Wm2oWjAknodr8BsKAXN/7isMMM/lcGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GLu5qk7GhIrT6JTMOnJQS/lbwBpaNqBA/bM6C3Amutwc27QLp99D5D5ntx6CTGHnN
	 36bCkZG21B706nInN17WJYKHFCoF91sKJzP68V5ZkCOyq5BbH0nOKcFnFtfUtBMAWU
	 GmWXKWwgDGAxpZ1c8ekBhIxt6CzjroWtBYLQBn4j7BAUVaSn4HeT9h/kBi/NQeY/pB
	 85c2JzoezOuknVxasVOKkAXtq78v/bbWCvYYn1ZTIEtyOdab+c+qCJLJsWnUGjSvo4
	 uiBrcWGaWqc+xrrzCLDhM/6UX5ljtZvvNtf3FC1Ta5s9WatOq5AY82H5ZL6AuVeyJw
	 Qqe4gvv2cpLaw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wLbcI-00000000GIj-2O8m;
	Sat, 09 May 2026 08:56:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 03/13] docs: maintainers_include: cleanup the code
Date: Sat,  9 May 2026 08:56:36 +0200
Message-ID: <5f48bf411925e923d206239a4de0a3e34592de88.1778309595.git.mchehab+huawei@kernel.org>
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

Simplify the logic without affecting the output result.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <24a83995778de8710cac40a3089c2f2fe5c38dbd.1777987027.git.mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 184 ++++++++++----------
 1 file changed, 91 insertions(+), 93 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 6d47d55f5b73..615af227a8f8 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -44,10 +44,6 @@ class MaintainersParser:
 
     def __init__(self, app_dir, path):
         self.path = path
-        self.profile_toc = set()
-        self.profile_entries = {}
-
-        self.output = ".. _maintainers:\n\n"
 
         # Poor man's state machine.
         self.descriptions = False
@@ -67,6 +63,13 @@ class MaintainersParser:
 
         self.re_doc = re.compile(r'(Documentation/([^\s\?\*]*)\.rst)')
 
+        #
+        # Output variables with maintainers content to be stored
+        #
+        self.profile_toc = set()
+        self.profile_entries = {}
+        self.output = ".. _maintainers:\n\n"
+
         prev = None
         for line in open(path):
             if self.descriptions:
@@ -98,6 +101,16 @@ class MaintainersParser:
 
         self.output = self.output.rstrip()
 
+
+    def linkify(self, text):
+        """Linkify all non-wildcard refs to ReST files in Documentation/"""
+        m = self.re_doc.search(text)
+        if m:
+            # maintainers.rst is in a subdirectory, so include "../".
+            text = self.re_doc.sub(':doc:`%s <../%s>`' % (m.group(2), m.group(2)), text)
+
+        return text
+
     def parse_descriptions(self, line):
         """Handle contents of the descriptions section."""
 
@@ -107,14 +120,8 @@ class MaintainersParser:
             self.output += "\n" + line
             return
 
-        # Linkify all non-wildcard refs to ReST files in Documentation/.
-        m = self.re_doc.search(line)
-        if m:
-            # maintainers.rst is in a subdirectory, so include "../".
-            line = self.re_doc.sub(':doc:`%s <../%s>`' % (m.group(2), m.group(2)), line)
-
         # Escape the escapes in preformatted text.
-        output = "| %s" % (line.replace("\\", "\\\\"))
+        self.output += "| " + self.linkify(line).replace("\\", "\\\\")
 
         # Look for and record field letter to field name mappings:
         #   R: Designated *reviewer*: FullName <address@domain>
@@ -127,105 +134,96 @@ class MaintainersParser:
             if m:
                 self.fields[self.field_letter] = m.group(1)
 
-        # Append parsed content to self.output
-        self.output += output
-
     def parse_subsystems(self, line):
         """Handle contents of the per-subsystem sections."""
 
         # Drop needless input whitespace.
         line = line.rstrip()
 
+        # Skip empty lines: subsystem parser adds them as needed.
+        if not line:
+            return
+
+        # Subsystem fields are batched into "field_content"
+        if line[1] != ':':
+            line = self.linkify(line)
+
+            # Render a subsystem entry as:
+            #   SUBSYSTEM NAME
+            #   ~~~~~~~~~~~~~~
+            # Flush pending field content.
+            self.output += self.field_content + "\n\n"
+            self.field_content = ""
+
+            self.subsystem_name = line.title()
+
+            # Collapse whitespace in subsystem name.
+            heading = re.sub(r"\s+", " ", line)
+            self.output += "%s\n%s" % (heading, "~" * len(heading)) + "\n"
+            self.field_prev = ""
+
+            return
+
+        # Render a subsystem field as:
+        #   :Field: entry
+        #           entry...
+        field, details = line.split(':', 1)
+        details = details.strip()
+
         #
         # Handle profile entries - either as files or as https refs
         #
-        match = re.match(rf"P:\s*({self.doc_dir})(/\S+)\.rst", line)
-        if match:
-            name = "".join(match.groups())
-            entry = os.path.relpath(self.base_dir + name, self.app_dir)
-
-            full_name = os.path.join(self.base_dir, name)
-            path = os.path.relpath(full_name, self.app_dir)
-            #
-            # When SPHINXDIRS is used, it will try to reference files
-            # outside srctree, causing warnings. To avoid that, point
-            # to the latest official documentation
-            #
-            if path.startswith("../"):
-                entry = KERNELDOC_URL + match.group(2) + ".html"
-            else:
-                entry = "/" + entry
-
-            if "*" in entry:
-                for e in glob(entry):
-                    self.profile_toc.add(e)
-                    self.profile_entries[self.subsystem_name] = e
-            else:
-                self.profile_toc.add(entry)
-                self.profile_entries[self.subsystem_name] = entry
-        else:
-            match = re.match(r"P:\s*(https?://.*)", line)
+        if field == "P":
+            match = self.re_doc.match(details)
             if match:
-                entry = match.group(1).strip()
-                self.profile_entries[self.subsystem_name] = entry
+                name = "".join(match.groups())
+                entry = os.path.relpath(self.base_dir + name, self.app_dir)
 
-        # Linkify all non-wildcard refs to ReST files in Documentation/.
-        m = self.re_doc.search(line)
-        if m:
-            # maintainers.rst is in a subdirectory, so include "../".
-            line = self.re_doc.sub(':doc:`%s <../%s>`' % (m.group(2), m.group(2)), line)
+                full_name = os.path.join(self.base_dir, name)
+                path = os.path.relpath(full_name, self.app_dir)
+                #
+                # When SPHINXDIRS is used, it will try to reference files
+                # outside srctree, causing warnings. To avoid that, point
+                # to the latest official documentation
+                #
+                if path.startswith("../"):
+                    entry = KERNELDOC_URL + "/" + match.group(2) + ".html"
+                else:
+                    entry = "/" + entry
 
-        # Check state machine for output rendering behavior.
-        output = None
-        if self.subsystems:
-            # Skip empty lines: subsystem parser adds them as needed.
-            if len(line) == 0:
-                return
-            # Subsystem fields are batched into "field_content"
-            if line[1] != ':':
-                # Render a subsystem entry as:
-                #   SUBSYSTEM NAME
-                #   ~~~~~~~~~~~~~~
-                # Flush pending field content.
-                output = self.field_content + "\n\n"
-                self.field_content = ""
-
-                self.subsystem_name = line.title()
-
-                # Collapse whitespace in subsystem name.
-                heading = re.sub(r"\s+", " ", line)
-                output = output + "%s\n%s" % (heading, "~" * len(heading))
-                self.field_prev = ""
+                if "*" in entry:
+                    for e in glob(entry):
+                        self.profile_toc.add(e)
+                        self.profile_entries[self.subsystem_name] = e
+                else:
+                    self.profile_toc.add(entry)
+                    self.profile_entries[self.subsystem_name] = entry
             else:
-                # Render a subsystem field as:
-                #   :Field: entry
-                #           entry...
-                field, details = line.split(':', 1)
-                details = details.strip()
+                match = re.match(r"(https?://.*)", details)
+                if match:
+                    entry = match.group(1).strip()
+                    self.profile_entries[self.subsystem_name] = entry
 
-                # Mark paths (and regexes) as literal text for improved
-                # readability and to escape any escapes.
-                if field in ['F', 'N', 'X', 'K']:
-                    # But only if not already marked :)
-                    if not ':doc:' in details:
-                        details = '``%s``' % (details)
+        details = self.linkify(details)
 
-                # Comma separate email field continuations.
-                if field == self.field_prev and self.field_prev in ['M', 'R', 'L']:
-                    self.field_content = self.field_content + ","
+        # Mark paths (and regexes) as literal text for improved
+        # readability and to escape any escapes.
+        if field in ['F', 'N', 'X', 'K']:
+            # But only if not already marked :)
+            if not ':doc:' in details:
+                details = '``%s``' % (details)
 
-                # Do not repeat field names, so that field entries
-                # will be collapsed together.
-                if field != self.field_prev:
-                    output = self.field_content + "\n"
-                    self.field_content = ":%s:" % (self.fields.get(field, field))
-                self.field_content = self.field_content + "\n\t%s" % (details)
-                self.field_prev = field
-        elif not self.descriptions:
-            output = line
+        # Comma separate email field continuations.
+        if field == self.field_prev and self.field_prev in ['M', 'R', 'L']:
+            self.field_content = self.field_content + ","
 
-        if output is not None:
-            self.output += output + "\n"
+        # Do not repeat field names, so that field entries
+        # will be collapsed together.
+        if field != self.field_prev:
+            self.output += self.field_content + "\n\n"
+            self.field_content = ":%s:" % (self.fields.get(field, field))
+        self.field_content = self.field_content + "\n\t%s" % (details)
+        self.field_prev = field
 
 
 class MaintainersInclude(Include):
-- 
2.54.0

