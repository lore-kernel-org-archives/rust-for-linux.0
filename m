Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA76747CC69;
	Tue,  5 May 2026 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987565; cv=none; b=u5ZC3JVoR0dfpdgpLmLRZmpXkS5yIVB6H0TrDeipNbHdPXM4e9i6M2vrFHJ8n55RXJ01UrpOFrrN5loQ/sTl3RKcH0AYN+F/Z9vt15zq6imptep+kkMhEp+zoITEHCDMX6yfPDMcOZhhRph02IfHOFvq+4jeu4fK661xOJnnAKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987565; c=relaxed/simple;
	bh=B8kHGAnSuUn7wWL9140Hx26Rq6FQnrbj68SYtjdI2Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5tT1MsaQICeiAs7HrHofMx2q4wzgQSokCSzBOEk4dk9F06CAdK8QRQqWK248X40nzw8wZYz08T8eXibxmf9g3S/CIDVxZPPi8DrO1mXfHO8OLalP6RH/+XgJEBf4d1asbKkA7eIjPX3VPD2iBgP0R+iBteepHnxkAjWT23Ugjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIauZf8D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIauZf8D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814DAC2BCFC;
	Tue,  5 May 2026 13:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987565;
	bh=B8kHGAnSuUn7wWL9140Hx26Rq6FQnrbj68SYtjdI2Eo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bIauZf8DEuj70yvZE9GnxX1vNp8kfZr6jVh2e68zgU/laH8lQCmvYnWstiMcFFiNH
	 Y0a0n894S0PjwQWaG8N1uuRcU4iX8L1XqBEhUz7OLfSB++x5GjsIiXbQF81ZVsylQY
	 CcvCeHQP/OPCSfZ5Gbpg4Aq5cMYkO3UZvqNbLJ84NVVYyj0zHu1xuOb7lb5TTHrh+6
	 pfZb4gFIaPYg41JP5q980qpvI+50xJ+7diaw+kw5nJMRrCmZ1FOo4hgZJCTgwp4Xgn
	 7N/7SmB77Ykp+eu6r7Ukfws+S90zakghEXe++wW0pZLik1WPjv8j35TPCZcUSi4wnd
	 hdlC1q2t7h4Ow==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFml-00000004ikh-3N8J;
	Tue, 05 May 2026 15:26:03 +0200
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
Subject: [PATCH v2 07/11] docs: maintainers_include: properly handle file patterns
Date: Tue,  5 May 2026 15:25:54 +0200
Message-ID: <89127706fb3493d00ecb21e528c8a27081e5ed40.1777987027.git.mchehab+huawei@kernel.org>
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

handling asterisks inside file patterns atdescription part is
problematic, as ReST has special meaning for them. Due to
that, convert such patterns to literal strings.

Reported-by: Matteo Croce <teknoraver@meta.com>
Fixes: 420849332f9f ("get_maintainer: add ** glob pattern support")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 26 ++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 6f1bcbde90c4..8916d3512e0d 100755
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

