Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592A344BC93;
	Tue,  5 May 2026 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987565; cv=none; b=H1gJWUXT0OZ0qZngKN/PDVi5Kgph3NZ/zJ2pYW+rdS1JtaX7NMGrSkPT3+I9AEDYpZ9tNlNQ5v2AOuftFc9d4regeGGygC/JdFJBRE57kwQ4lrxlCGqS0t2x9DWVAlN7OLVbjPCBeDt6MES6Ti94pvK4mMctO2zpFS7ss+snexk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987565; c=relaxed/simple;
	bh=xX8jdqJe6OyYVBhHmMog5VS+gV1ubfBCDKiP09ArwZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ldC3rMDydAxto4mhLZvJezsrHM6awrEq0z2I2R9ap9ClJ9TPHR4pIkWj30LKAbYgmpUnqqtTJIHl1ZIlbWxAmEAYLFSoyzUshy39OViv6aWhMPvr3s7O4voFN3wOv6MqmBE4cN/SxB4f8JqFR6jnAQs5F1nOiys/nW+jzA2LYqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DI3ZC2I+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DI3ZC2I+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255D4C2BCF7;
	Tue,  5 May 2026 13:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987565;
	bh=xX8jdqJe6OyYVBhHmMog5VS+gV1ubfBCDKiP09ArwZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DI3ZC2I+/wkK7PmKhCqwZ/qIcGwtYTu5oyPB8gwPNj2tXDXnX70wH8ScI2HV3ISY3
	 As1LMteYqI2xTzg9/+6lSWDV95buMZduufUDOA5PNg54jruSVU3nPQrl1aYA7e2xza
	 Nh+wJtVmViBPM5FetIjGj5pcOVjeKWritFyPc7WtduzuX3wV8NXNcGDrKqpTBZb6Db
	 +BbNcoHZpsfV7Cu2g1ALKkWD8bh++JbqMZS8heucz332XOzvD/t05pUCnBerePnMFs
	 bXabPclpCLclcJAYqr0u2Xu8wh9T2l21ibXbo8u94ASPuxqbKqvcK605idaul9K4Wp
	 0kydC6QDo8Jrw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFml-00000004ihA-1E0p;
	Tue, 05 May 2026 15:26:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 04/11] docs: maintainers_include: clean most SPHINXDIRS=process warnings
Date: Tue,  5 May 2026 15:25:51 +0200
Message-ID: <b57d83081c28aa52683b403f8836d098fcdd8530.1777987027.git.mchehab+huawei@kernel.org>
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

building docs with SPHINXDIRS=process is too noisy, as it
generates lots of undefined refs. Fixing it is easy: just let
linkify generate html URLs for the broken links when SPHINXDIRS
is used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 44 +++++++++++++++------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 615af227a8f8..d3ad01e5309e 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -58,8 +58,8 @@ class MaintainersParser:
         self.field_content = ""
         self.subsystem_name = None
 
-        self.app_dir = app_dir
-        self.base_dir, self.doc_dir, self.sphinx_dir = app_dir.partition("Documentation")
+        self.app_dir = os.path.abspath(app_dir)
+        self.base_dir, _, self.sphinx_dir = self.app_dir.partition("Documentation")
 
         self.re_doc = re.compile(r'(Documentation/([^\s\?\*]*)\.rst)')
 
@@ -104,10 +104,25 @@ class MaintainersParser:
 
     def linkify(self, text):
         """Linkify all non-wildcard refs to ReST files in Documentation/"""
+
         m = self.re_doc.search(text)
         if m:
-            # maintainers.rst is in a subdirectory, so include "../".
-            text = self.re_doc.sub(':doc:`%s <../%s>`' % (m.group(2), m.group(2)), text)
+            fname = m.group(1)
+            ename = m.group(2)
+
+            entry = os.path.relpath(self.base_dir + fname, self.app_dir)
+            entry = entry.removesuffix(".rst")
+
+            #
+            # When SPHINXDIRS is used, it will try to reference files
+            # outside srctree, causing warnings. To avoid that, point
+            # to the latest official documentation
+            #
+            if entry.startswith("../"):
+                html = KERNELDOC_URL + ename + ".html"
+                text = self.re_doc.sub(f'`{ename} <{html}>`_', text)
+            else:
+                text = self.re_doc.sub(f':doc:`{ename} </{entry}>`', text)
 
         return text
 
@@ -176,27 +191,32 @@ class MaintainersParser:
         if field == "P":
             match = self.re_doc.match(details)
             if match:
-                name = "".join(match.groups())
-                entry = os.path.relpath(self.base_dir + name, self.app_dir)
+                fname = match.group(1)
+                ename = match.group(2)
 
-                full_name = os.path.join(self.base_dir, name)
-                path = os.path.relpath(full_name, self.app_dir)
+                entry = os.path.relpath(self.base_dir + fname, self.app_dir)
+                entry = entry.removesuffix(".rst")
                 #
                 # When SPHINXDIRS is used, it will try to reference files
                 # outside srctree, causing warnings. To avoid that, point
                 # to the latest official documentation
                 #
-                if path.startswith("../"):
-                    entry = KERNELDOC_URL + "/" + match.group(2) + ".html"
+
+                if entry.startswith("../"):
+                    entry = KERNELDOC_URL + ename + ".html"
                 else:
                     entry = "/" + entry
 
                 if "*" in entry:
                     for e in glob(entry):
-                        self.profile_toc.add(e)
+                        if "html" not in e:
+                            self.profile_toc.add(e)
+
                         self.profile_entries[self.subsystem_name] = e
                 else:
-                    self.profile_toc.add(entry)
+                    if "html" not in entry:
+                        self.profile_toc.add(entry)
+
                     self.profile_entries[self.subsystem_name] = entry
             else:
                 match = re.match(r"(https?://.*)", details)
-- 
2.54.0

