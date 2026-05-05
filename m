Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D133D47D930;
	Tue,  5 May 2026 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987565; cv=none; b=ZU+sRIW2W0YCsMpdUw3528LvGxuaxuqAF6JPQc0GcWGaMIHDJBWfBUBz3k91oFb+CHZycD3xbnbEAdnraalvGRGeh+R8tBRvdUppaXqCRAASF/PzK2QXZDs3FemFuBPne7w0KKMC0UyYSg6KdSZaFAcmuWYVkjrHBEjvhjgb/ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987565; c=relaxed/simple;
	bh=xlOkI4UY8PAm2Hj2oIZ4e62rvRVONV2P++giJ2k/+hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kt7Uk5f1A8LXLr4ZipBDHhc0Z1yNOYHSSCm+/ZqcAU1Sl3s0hEa/Fty2W+vh236kRLgq/lzrK12hpHZtTm+fYW6lUlLhLdADjKDNTJ7jBWGmTt/M0FzUKX7HO6n4OwfwkEznmbOOl/tit3YaQR77HfAVQlrsQJFdjUpR1fd1Tik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gt6T05Ta; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gt6T05Ta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD028C2BCC9;
	Tue,  5 May 2026 13:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987565;
	bh=xlOkI4UY8PAm2Hj2oIZ4e62rvRVONV2P++giJ2k/+hA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gt6T05Tar3mhkUsm5sobZaj30JGUFshA9nYWiVB7j+SKrN8ylNmOnJ0V3lgsVhQy7
	 MYwuAgGjp8tm7LFKfBhxZd5IiPR3igKNHTqwTQ9G+hnjhtnmdRO5opx/IX5+eR1PIs
	 Hu5aHNr/5xEXPTdfshNJ6RY+knXe0GzMY7NVDebfPcUWaRe6GoldePzzxPwtoZGRL8
	 P41s02nAtfJg4pXbK7Nf8e2+EuPbGRvzzRqCEr9km+4l1BHatMJY56rKbJmA1PLO8t
	 41JruwNpzkyMnMGRzcfA8XVTq2AxCQrSXp1cmtpTha/XDnVZnx3PJ02cG+BbvUxZ6W
	 OdtOxQNeNYsQw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFml-00000004ils-45Nk;
	Tue, 05 May 2026 15:26:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 08/11] docs: maintainers_include: add a filtering javascript
Date: Tue,  5 May 2026 15:25:55 +0200
Message-ID: <c435ef150f5d6ed16570969f43d92ba6fb857842.1777987027.git.mchehab+huawei@kernel.org>
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

The maintainers table is big. Add a javascript to allow filtering
it. Such script is only added at the page which contains the
maintainers-include tag.

I opted to keep the search case-sensitive, as, this way,
upper case searches at subsystem.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 78 +++++++++++++++++++--
 1 file changed, 72 insertions(+), 6 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 8916d3512e0d..572c382db2c2 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -31,6 +31,49 @@ __version__ = "1.0"
 
 maint_parser = None  # pylint: disable=C0103
 
+JS_FILTER = """
+(function() {
+  function filterTable(table) {
+    const filter = document.getElementById("filter-table").value.trim();
+    const rows = table.querySelectorAll("tbody tr");
+    for (let i = 0; i < rows.length; i++) {
+      const tds = rows[i].getElementsByTagName("td");
+      let match = false;
+      for (let j = 0; j < tds.length; j++) {
+        const cellText = (tds[j].textContent || tds[j].innerText);
+        if (cellText.includes(filter)) {
+          match = true;
+          break;
+        }
+      }
+      rows[i].style.display = match ? "table-row" : "none";
+    }
+  }
+  function addInput() {
+    const table = document.getElementById("maintainers-table");
+    if (!table) return;
+    let input = document.getElementById("filter-table");
+    if (!input) {
+      const filt_div = document.createElement('div');
+      filt_div.innerHTML = `
+        <p>Filter:
+          <input type="search" id="filter-table" placeholder="search string"/>
+          subsystem or property (case-sensitive)
+        </p>
+      `;
+      table.parentNode.insertBefore(filt_div, table);
+      const input = document.getElementById("filter-table")
+      input.addEventListener('input', () => filterTable(table));
+    }
+  }
+  if (document.readyState === 'loading') {
+    document.addEventListener('DOMContentLoaded', addInput);
+  } else {
+    addInput();
+  }
+})();
+"""
+
 
 # Shamelessly stolen from docutils
 def ErrorString(exc):  # pylint: disable=C0103, C0116
@@ -59,7 +102,7 @@ class MaintainersParser:
         #
         self.profile_toc = set()
         self.profile_entries = {}
-        self.header = ".. _maintainers:\n\n"
+        self.header = ""
         self.maint_entries = {}
         self.fields = {}
 
@@ -228,15 +271,28 @@ class MaintainersInclude(Include):
     def emit(self):
         """Parse all the MAINTAINERS lines into ReST for human-readability"""
         path = maint_parser.path
-        output = maint_parser.header
+        output = ".. _maintainers:\n\n"
+        output += maint_parser.header
+
+        output += ".. _maintainers_table:\n\n"
+        output += ".. flat-table::\n"
+        output += "  :header-rows: 1\n\n"
+        output += "  * - Subsystem\n"
+        output += "    - Properties\n\n"
+
+        self.state.document['maintainers_included'] = True
 
         for name, fields in sorted(maint_parser.maint_entries.items()):
-            output += "\n" + name + "\n"
-            output += "~" * len(name) + "\n"
-
+            output += f"  * - {name}\n"
+            tag = "-"
             for field, lines in fields.items():
                 field_name = maint_parser.fields.get(field, field)
-                output += f":{field_name}:\n\t" + ",\n\t".join(lines) + "\n\n"
+
+                output += f"    {tag} :{field_name}:\n        "
+                output += ",\n        ".join(lines) + "\n"
+                tag = " "
+
+            output += "\n"
 
         # For debugging the pre-rendered results...
         #print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
@@ -308,6 +364,14 @@ class MaintainersProfile(Include):
         return []
 
 
+# pylint: disable=W0613
+def add_filter_script(app, pagename, templatename, context, doctree):
+    """Add Filter javascript only to maintainers page"""
+
+    if doctree and doctree.get('maintainers_included'):
+        app.add_js_file(None, body=JS_FILTER)
+
+
 def setup(app):
     """Setup Sphinx exension"""
     global maint_parser  # pylint: disable=W0603
@@ -325,6 +389,8 @@ def setup(app):
     app.add_directive("maintainers-include", MaintainersInclude)
     app.add_directive("maintainers-profile-toc", MaintainersProfile)
 
+    app.connect("html-page-context", add_filter_script)
+
     return {
         "version": __version__,
         "parallel_read_safe": True,
-- 
2.54.0

