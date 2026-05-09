Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D089B325727;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309812; cv=none; b=sitilF6t6lbNfGP+Utj1Vr6tCHvgRAicRJQXKf9Zxev8atRWY3TRKwLlk6LVZOcCJNpVOjY5o0d4ruPdXbyfz3uirD/v2JPM0WcAzd4NOxJT88dyUoG9rSaEdSvRk67eNmyd6sfOGP4Gh+oAJtWI+SO0KqrhpjhQPHKodJBsDHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309812; c=relaxed/simple;
	bh=Ahut7zTu/U3hZrEkjrlS4vv3JRMDz0WHhByOcY8s0Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G6x4WvQFzSmQ/+XRab0O0BAsfDV2psi0h7FjyzpjjlY9BD7K3BHXNEDwxzJXDnvmAzNqw6250dtZvaP3qrE6a7NQFMKuQ8hiG8xMhKDnGpm7GUJXVPsrKiL2bL2y1Oez8zo9raaZ25dNkz3JNC2ma45MCkr5tTnDIj3CxIED4G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rYkUbYhi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rYkUbYhi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8297FC2BCF4;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778309812;
	bh=Ahut7zTu/U3hZrEkjrlS4vv3JRMDz0WHhByOcY8s0Ws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rYkUbYhitlbvvWaW1509ftEODdMGes0h+yqtNPsTYY5TuHlJOHtg/f+Aby3OXn1kF
	 RuM5Bjx5asQ1obucE8rvBNspckVsSH+uZkv/eIsE532Kmyn6/NnwMWdBT8iu/D+/96
	 O4U8CjNuxqBBXo0utgIPXmmxtfvsWIbdIrpu8a8jgnk4+Ym+OIGelqS7Kuz7pnmM+J
	 mwM8D1IdvMdhVPYpT1tm04ACWMo455KqxOAfkAErNP4KOugyzOfQDHDleH6G5YgvkD
	 OuXosmCWVZWEqV0cTifKK+8xFXhDBYKt/WwRJYFkuc77HYrF+taxWu9esUUmceUmsi
	 8j9LMhRAwyhvw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wLbcI-00000000GJF-3JBd;
	Sat, 09 May 2026 08:56:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 11/13] docs: maintainers_include: better handle doc wildcards
Date: Sat,  9 May 2026 08:56:44 +0200
Message-ID: <eb575072d60c20243afee6f94ef71427ef7b2e79.1778309595.git.mchehab+huawei@kernel.org>
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

As warned by sashiko-bot, the new logic doesn't handle wildcards
on Documentation/.

Change the logic to properly handle it, cleaning up the code
to remove some code duplication.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 103 ++++++++++----------
 1 file changed, 53 insertions(+), 50 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 8c7b79721edd..be8e566e0363 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -95,7 +95,7 @@ class MaintainersParser:
         self.base_dir = base_dir
         self.app_dir = app_dir
 
-        self.re_doc = re.compile(r'(Documentation/([^\s\?\*]*)\.rst)')
+        self.re_doc = re.compile(r'(Documentation/(\S*)\.rst)')
 
         #
         # Output variables with maintainers content to be stored
@@ -132,29 +132,47 @@ class MaintainersParser:
                 # Retain previous line for state machine transitions.
                 prev = line
 
+    def get_entries(self, text):
+        """Generate refs to ReST files in Documentation/"""
+
+        if "Documentation/" not in text:
+            return None
+
+        if "*" in text or "?" in text:
+            m = self.re_doc.search(text)
+            if not m:
+                return None
+
+            doc_list = glob(m.group(1), root_dir=self.base_dir)
+        else:
+            doc_list = [text]
+
+        entries = {}
+        for doc in doc_list:
+            m = self.re_doc.search(doc)
+            if m:
+                fname = m.group(1)
+                ename = m.group(2)
+
+                entry = os.path.relpath(self.base_dir + fname, self.app_dir)
+                entry = entry.removesuffix(".rst")
+
+                if entry.startswith("../"):
+                    html = KERNELDOC_URL + ename + ".html"
+                    entries[entry] = f'`{ename} <{html}>`_'
+                else:
+                    entries[entry] = f':doc:`{ename} </{entry}>`'
+
+        return entries
+
     def linkify(self, text):
-        """Linkify all non-wildcard refs to ReST files in Documentation/"""
+        """Return a list of doc files converted to cross-references"""
 
-        m = self.re_doc.search(text)
-        if m:
-            fname = m.group(1)
-            ename = m.group(2)
+        entries = self.get_entries(text)
+        if not entries:
+            return text
 
-            entry = os.path.relpath(self.base_dir + fname, self.app_dir)
-            entry = entry.removesuffix(".rst")
-
-            #
-            # When SPHINXDIRS is used, it will try to reference files
-            # outside srctree, causing warnings. To avoid that, point
-            # to the latest official documentation
-            #
-            if entry.startswith("../"):
-                html = KERNELDOC_URL + ename + ".html"
-                text = self.re_doc.sub(f'`{ename} <{html}>`_', text)
-            else:
-                text = self.re_doc.sub(f':doc:`{ename} </{entry}>`', text)
-
-        return text
+        return self.re_doc.sub(", ".join(entries.values()), text)
 
     def parse_descriptions(self, line):
         """Handle contents of the descriptions section."""
@@ -206,35 +224,15 @@ class MaintainersParser:
         # Handle profile entries - either as files or as https refs
         #
         if field == "P":
-            match = self.re_doc.match(details)
-            if match:
-                fname = match.group(1)
-                ename = match.group(2)
+            entries = self.get_entries(details)
+            if entries:
+                for e, link in entries.items():
+                    if "html" not in link:
+                        self.profile_toc.add(e)
 
-                entry = os.path.relpath(self.base_dir + fname, self.app_dir)
-                entry = entry.removesuffix(".rst")
-                #
-                # When SPHINXDIRS is used, it will try to reference files
-                # outside srctree, causing warnings. To avoid that, point
-                # to the latest official documentation
-                #
+                    self.profile_entries[self.subsystem_name] = link
 
-                if entry.startswith("../"):
-                    entry = KERNELDOC_URL + ename + ".html"
-                else:
-                    entry = "/" + entry
-
-                if "*" in entry:
-                    for e in glob(entry):
-                        if "html" not in e:
-                            self.profile_toc.add(e)
-
-                        self.profile_entries[self.subsystem_name] = e
-                else:
-                    if "html" not in entry:
-                        self.profile_toc.add(entry)
-
-                    self.profile_entries[self.subsystem_name] = entry
+                details = ", ".join(entries.values())
             else:
                 match = re.match(r"(https?://.*)", details)
                 if match:
@@ -243,7 +241,9 @@ class MaintainersParser:
                 else:
                     self.profile_entries[self.subsystem_name] = f"``{details}``"
 
-        details = self.linkify(details)
+                details = self.linkify(details)
+        else:
+            details = self.linkify(details)
 
         #
         # Mark paths (and regexes) as literal text for improved
@@ -340,7 +340,7 @@ class MaintainersProfile(Include):
                 output += f"- {name}: {entry}\n"
                 self.warning(f"{profile}: Invalid 'P' tag: {entry}\n")
             else:
-                output += f"- :doc:`{name} <{entry}>`\n"
+                output += f"- {entry}\n"
 
         #
         # Create a hidden TOC table with all profiles. That allows adding
@@ -356,6 +356,9 @@ class MaintainersProfile(Include):
 
         output += "\n"
 
+        # For debugging the pre-rendered results...
+        #print(output, file=open("/tmp/profiles.rst", "w"))
+
         self.state.document.settings.record_dependencies.add(path)
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
-- 
2.54.0

