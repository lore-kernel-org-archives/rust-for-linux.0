Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2C83E3C48;
	Mon,  4 May 2026 15:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909890; cv=none; b=W9IiHzIAp0B9ygS/Li8sJgxktA1shylACu84o+pThUlMoass00Guqvs2n9EXt5/nyHwRzfi+xqpIYoI4Fhckd+aqiRtaOyW9bnOinWE3Njc3jd7l3fbbXEywZdudca9SAAwiQtbUn8aybsjGs6E264yUPcItSYPjodJGOAPbcWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909890; c=relaxed/simple;
	bh=NgkZooe3CB6Mf13tkY5wF+JWazebe4oFO2B6aSDF0ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l2mThKqQff8R/gbOWPhZ68fGPo084q8CUAVwfyaMx2sJ5KMXkqGzOgXm72+DCO/TQlZM6EVF7vYtXTqwBEMpn14Vrqs3lSXf2GqRjv2NKS32eaxIrH9MctLg9xXLsAW5B4OD3M6ygyGfZeYr3vZRwb1mFEV740e/xOL4pjZ87Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLz4O8fQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLz4O8fQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86FAC2BCB8;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777909889;
	bh=NgkZooe3CB6Mf13tkY5wF+JWazebe4oFO2B6aSDF0ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sLz4O8fQkgNLMdM28+PuhOQanBqjVtECLrWGPGhQRU5l5BKcs6MCluTwPoOghXfAf
	 FpbB7Y1zCBkRaRTfPcoy8zvUO70aZS6lKDfLgMAGAePs76yHaBxMuYmDP2hl9whJR2
	 CVG08QZGyRbS75i5IEdUlMKsljFw4Gv0XEn7BU5bQw7l7SwHiofr5/ghemoMbbcmY5
	 vdheRRMq30R1cP50pcDe9jvty5xQTVFVdz2vnLyY8v3+EH1HuS//GmXiBMgOEvSfzA
	 EdArUZePOZ9Qoyfdp/sj44mAXFl3EkG695Wj7UKX2M3SK+aazGt5lilsIB++GyjbDK
	 29D+cIx5ejlVg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wJvZv-0000000EyFI-41NG;
	Mon, 04 May 2026 17:51:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 9/9] docs: maintainers: add a filtering javascript
Date: Mon,  4 May 2026 17:51:18 +0200
Message-ID: <854faf4127053c203cae479f68e6ac12a4e4aabc.1777908711.git.mchehab+huawei@kernel.org>
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

The maintainers table is big. Add a javascript to allow filtering
it. Such script is only added at the page which contains the
maintainers-include tag.

I opted to keep the search case-sensitive, as, this way,
upper case searches at subsystem.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 77 +++++++++++++++++++--
 1 file changed, 71 insertions(+), 6 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index bbdadf2aa4f3..f85298627da2 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -31,6 +31,48 @@ __version__ = "1.0"
 
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
+          <input type="search" id="filter-table" placeholder="subsystem or property (case-sensitive)" />
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
@@ -62,7 +104,7 @@ class MaintainersParser:
         #
         self.profile_toc = set()
         self.profile_entries = {}
-        self.header = ".. _maintainers:\n\n"
+        self.header = ""
         self.maint_entries = {}
         self.fields = {}
 
@@ -230,15 +272,28 @@ class MaintainersInclude(Include):
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
 
         for name, fields in maint_parser.maint_entries.items():
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
         print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
@@ -315,6 +370,14 @@ class MaintainersProfile(Include):
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
@@ -332,6 +395,8 @@ def setup(app):
     app.add_directive("maintainers-include", MaintainersInclude)
     app.add_directive("maintainers-profile-toc", MaintainersProfile)
 
+    app.connect("html-page-context", add_filter_script)
+
     return {
         "version": __version__,
         "parallel_read_safe": True,
-- 
2.54.0

