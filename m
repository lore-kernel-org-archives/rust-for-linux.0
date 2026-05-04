Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A57B3E1234;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909889; cv=none; b=rLiWvmvrkxyhJ49m0z15vzJOka3MFvh+pEXw02UuZyBjxUABf34lQ7c1aH41Y9cUgblJ19J/M8pCW5DPcK8xogjF8j6DkMJFHse+TjP9cp9YYHtZK7XGQzCSjHYVC3OuBfBorse7N0qvYQunqNOccuq3Hfw7xjhnVQvTYAdbmQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909889; c=relaxed/simple;
	bh=0ZF7C2vym0JWYc+Iq2I2h3qGDgn5cwCC8/0LA9SeTms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H3QzesEr2PRWdXAQV5mTwyPUucHkVKSZk9Yq4b4I39sI/2NlfyZYQv1CrFFGzPFEIdhh4lAwglQbY8OU/F6c1kUCuuJJs7Lxw60lyutAIH+V4/cnUG0iPRv7MkbtokdBO4eTuWtGyOpp8U2NU2j615tqM9lyPz0ld8b+ukjcLck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fg+WKY03; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fg+WKY03"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8025C2BCFA;
	Mon,  4 May 2026 15:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777909889;
	bh=0ZF7C2vym0JWYc+Iq2I2h3qGDgn5cwCC8/0LA9SeTms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fg+WKY03hSuZiANPYfSujOYx0ChH4Br/u8ib8e+HnvTpjcn1qyswR5cyhhpkpD1MP
	 kQ/iGRAALSz38h79cD07i4AZj5yXeFJjoU4bjEzt4LumggVC/Zj1sVwfhmkP8pZTZR
	 n7D1OgtIced81FX080QvcPjge4BXvR1T6s1D8Mk9FML1Sa1P3mVo8oJoKSFD+ZCOxA
	 KtDQE2UGxlRMivU/pZswZeNtt1oONyJzB/XMYNvMiMXTaz8KjPawJofiief6RpPAv/
	 fU1+b2g7V2cJ8zzEYRKhoyc4l8pmAl0JbyMQEX42q/MNSMk+jok6AEunYPGcSnge+A
	 HCkRMzmtu3KXA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wJvZu-0000000Ey7u-3v80;
	Mon, 04 May 2026 17:51:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 3/9] docs: maintainers_include.py: split state machine on multiple funcs
Date: Mon,  4 May 2026 17:51:12 +0200
Message-ID: <7cdfae61b68c7613663ddd528020f6b4a4ccf8ec.1777908711.git.mchehab+huawei@kernel.org>
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
 Documentation/sphinx/maintainers_include.py | 299 +++++++++++---------
 1 file changed, 159 insertions(+), 140 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index e679acf0633d..8867ecc0aad3 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -47,168 +47,187 @@ class MaintainersParser:
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
-                output = "| %s" % (line.replace("\\", "\\\\")
-                                        .replace("**", "\\**"))
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
+        output = "| %s" % (line.replace("\\", "\\\\")
+                                .replace("**", "\\**"))
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

