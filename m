Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD033E120D;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909889; cv=none; b=So58Mqm3JepzrjktKsJjbqdtt6SnuZMPdhzYSkDGeDlqflk4DAB5kmqPimLgCmUpZMCscLHYopX55lpMycEcaYejlOQgoZ+D9UF1bJnWqaeUyH3wKQ53aCf4m9n0hsbRyZ4CU/kTcgbMnp2olVNRuyzrBe8Y131BLKNyjDMD0vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909889; c=relaxed/simple;
	bh=a0JKQlQp4GzAqop5uVBSnDqg5QnqT1A1PJcWeMOknHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PpM+F0ryGuCM86RcTSXmlSw+Fl5aPanaZ/UJzX+6n8ssW0OjlHJRYaNpM5qqVyATYC6nmSZXo77kZM1QoEPcP1kBiGpjtBLYggeJX0kqrJ9Y9lUiYetFqv3ic96NytTOc7TD6dVJgaMnqm1kjY9VjmJiGGu3labLvcKqvbY3K7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcX+4bQd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcX+4bQd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB52C2BCFC;
	Mon,  4 May 2026 15:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777909889;
	bh=a0JKQlQp4GzAqop5uVBSnDqg5QnqT1A1PJcWeMOknHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RcX+4bQd5rFL5jev4cJp/gTZRKX3lHU/XCWg8qoIoDZmlHYtU+YhguLzCOlvFJmqs
	 mHp7EmxMyUqaIGKEufjqV4CviB4EsbhKVh4fTmnt+wYrwYq9NatZ91wpCpm39a3R/2
	 7GjNw4oS7ZDmLXa3zsqA6T2M5cd36yoHr2eN2pSg1Ok8eLVy1Q9feTN0G5Kg1z9fnH
	 Jm+45pvrbbgUarNDHDpmennHqTGcgclaz5UBJTsFFxp6ze+zM68Rzh1nIKhHMPJVH2
	 /W/TFywnTnFsEelw3tF/TO4Cw5NaM6PGvk4TiEbFDI17mzVP9fgaPSizCz/vgHHw83
	 Q9WT3KvFZBACA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wJvZv-0000000Ey95-0RJv;
	Mon, 04 May 2026 17:51:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 4/9] docs: maintainers_include: cleanup the code
Date: Mon,  4 May 2026 17:51:13 +0200
Message-ID: <ed6a4577805be72bdcf31f72a27f62bab5e25f05.1777908711.git.mchehab+huawei@kernel.org>
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

Simplify the logic without affecting the output result.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 186 ++++++++++----------
 1 file changed, 92 insertions(+), 94 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 8867ecc0aad3..4fc894b377e6 100755
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
 
@@ -107,15 +120,9 @@ class MaintainersParser:
             self.output += "\n" + line
             return
 
-        # Linkify all non-wildcard refs to ReST files in Documentation/.
-        m = self.re_doc.search(line)
-        if m:
-            # maintainers.rst is in a subdirectory, so include "../".
-            line = self.re_doc.sub(':doc:`%s <../%s>`' % (m.group(2), m.group(2)), line)
-
         # Escape the escapes in preformatted text.
-        output = "| %s" % (line.replace("\\", "\\\\")
-                                .replace("**", "\\**"))
+        line = self.linkify(line).replace("\\", "\\\\").replace("**", "\\**")
+        self.output += "| " + line
 
         # Look for and record field letter to field name mappings:
         #   R: Designated *reviewer*: FullName <address@domain>
@@ -128,105 +135,96 @@ class MaintainersParser:
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

