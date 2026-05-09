Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F12237BE9A;
	Sat,  9 May 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309813; cv=none; b=lFHnSONYyv3JYT7Hq1P9HN+1i82ZFowFYOHcJuZ4CsJtPzPlmuX3hOEPNrW7493gh4HQDKWaOari6xcvcJ29xkFm93Tu3w16d//LAhF72LrfW6HhmIdsVs23+AlV2hYg95VVZQQSwkkBxpjb2w0/R2hSb1HLziuOuLT11kH78JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309813; c=relaxed/simple;
	bh=mOVVsCv5LtyhTiEhZWzDwCJGXjoTo0YDPqDCnaKHxhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nMen0skVLap25AqX1Fc/LsuS9TsQ7qH3UVCSbOXCRP1Bq4HL2eg00w7Q4T6MrrblaIs51zNi6BvTcUxeuPf4m5HXK5auGEhiZAQMD5Oboi1m+3FYeqZEPgJsUkT+i1AI2Uy1lLZ6rEreFdtTdo4R2QFqPDURKVwjYbuIp1TQ4gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diFwpkYd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diFwpkYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E97CC2BCF7;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778309812;
	bh=mOVVsCv5LtyhTiEhZWzDwCJGXjoTo0YDPqDCnaKHxhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=diFwpkYdkmfGTqeg1I5ddLz5SCgCpDvr/J7YozBM8HVsr1FCpx1yg0mwNbiLDMsut
	 io8A/NLc2UBPpcIzRgjXO3k2Z1RucV9fa6dVHsVdMakdg6fbf4Prx1s0xXoOJIk9Mq
	 lDVLrQ0Zp+UFxurUEbYXXGUvoceyD6fIn65cWMn3oKgVV47rsYRW19wPMi5gDsl/Gl
	 aUDUOuldGsyWmFosH6+fi9hBaRUy0ver1ynh2aHaO1wzGKok0Ds4z28pshfIBqr3ZK
	 nxNdFc8kJB1U7wadnp7h2xOBC7kXa7J4OIMzl01eiNsl9y+kCOK+9qAEJVmYyf14WG
	 xqUhL1yaBRLmQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wLbcI-00000000GIz-2qs0;
	Sat, 09 May 2026 08:56:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Joe Perches <joe@perches.com>,
	Matteo Croce <technoboy85@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Matteo Croce <teknoraver@meta.com>
Subject: [PATCH v3 07/13] docs: maintainers_include: properly handle file patterns
Date: Sat,  9 May 2026 08:56:40 +0200
Message-ID: <abd5112fea4dd480f5e72ba46fe60c2463862829.1778309595.git.mchehab+huawei@kernel.org>
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

handling asterisks inside file patterns atdescription part is
problematic, as ReST has special meaning for them. Due to
that, convert such patterns to literal strings.

Reported-by: Matteo Croce <teknoraver@meta.com>
Fixes: 420849332f9f ("get_maintainer: add ** glob pattern support")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <89127706fb3493d00ecb21e528c8a27081e5ed40.1777987027.git.mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 26 ++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index ed9cd7b3dc66..5361774b61bc 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -47,9 +47,6 @@ class MaintainersParser:
         self.maintainers = False
         self.subsystems = False
 
-        # Field letter to field name mapping.
-        self.field_letter = None
-
         self.subsystem_name = None
 
         self.app_dir = os.path.abspath(app_dir)
@@ -125,19 +122,22 @@ class MaintainersParser:
             self.header += "\n" + line
             return
 
-        # Escape the escapes in preformatted text.
-        self.header += "| " + self.linkify(line).replace("\\", "\\\\")
-
         # Look for and record field letter to field name mappings:
         #   R: Designated *reviewer*: FullName <address@domain>
-        m = re.search(r"\s(\S):\s", line)
+        m = re.match(r"\s+(\S):\s+(\S+)", line)
         if m:
-            self.field_letter = m.group(1)
+            field = m.group(1)
+            details = m.group(2)
+
+            if field not in self.fields:
+                m = re.search(r"\*([^\*]+)\*", line)
+                if m:
+                    self.fields[field] = m.group(1)
+            elif field in ['F', 'N', 'X', 'K']:
+                line = line.replace(details, f'``{details}``')
+
+        self.header += "| " + self.linkify(line)
 
-        if self.field_letter and self.field_letter not in self.fields:
-            m = re.search(r"\*([^\*]+)\*", line)
-            if m:
-                self.fields[self.field_letter] = m.group(1)
 
     def parse_subsystems(self, line):
         """Handle contents of the per-subsystem sections."""
@@ -206,7 +206,7 @@ class MaintainersParser:
         #
         if field in ['F', 'N', 'X', 'K']:
             # But only if not already marked :)
-            if not ':doc:' in details:
+            if ':doc:' not in details and "http" not in details:
                 details = '``%s``' % (details)
 
         if self.subsystem_name not in self.maint_entries:
-- 
2.54.0

