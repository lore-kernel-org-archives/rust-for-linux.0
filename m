Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556473E1216;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909889; cv=none; b=gt0mRHK0iaZY8PswSQDAs7ihHY7j8GLEqCEgkFwfObmGkJCFaBtm+WdJdCXZc5cU6qE4S46N/2h4qMf9ErJtr5CVuSGLOL96pXT6Zxpr21bKn3xshzngpB/Oh11Oot6BtN5qyQ1JcXC9H6VaakNGNHDif1dhWJIEvPIXrsGNZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909889; c=relaxed/simple;
	bh=UuCZFcJnawl6nLf6W20Xv9a5MwXy3NjFTm5AuWY4wyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mo0n9eK8nMP7ks1ZWqXnRL0FjKWd3Sl2M8q8rLhoh5Ho+WX+yeRC4SUttuGBx6IQ3zL2tFJ2uW8dDsowKLKXqz+aHPdfScy1csmCDMHBnGpF3LXEIB2lV5rQ0Ccq/Ymq8LqlC/qVVq0CVUZaXP1rKNYiIja17Vyj6fjdp8CL3fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJlfgb8/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJlfgb8/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B59C2BCF5;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777909889;
	bh=UuCZFcJnawl6nLf6W20Xv9a5MwXy3NjFTm5AuWY4wyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hJlfgb8/l5VBqYzpfZIMmXaSRwHsc34XGhbfbmPHuNSaxl3dog4Wj8AU/7k0v4R38
	 H5YUteG3JykwyHvxSGfaNTfsqtBx7RtZi4qAjTTU5VZu9ynOuhx02hEha8fW7X8pxW
	 yhs7z2izyF70XWmEV8toTkUl8yYOfKEXOs275alnRQI1n5bU9flUvwxPvYlxfymUwP
	 rbvquwF6diUhUmhcwCjd6IYmF7TJ3G9Su/vlkbGFM7D35mfIwBUDzGICYsQGDLMl21
	 x931avm0N7mxQFXyYR1iQGO+vnkmBVfpgAk+jOhYQO1pkxx3KoAbg39uvxTHwFmlAn
	 CiNrbVe4ZcHIA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wJvZv-0000000EyAZ-185n;
	Mon, 04 May 2026 17:51:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 5/9] docs: maintainers_include.py: clean most SPHINXDIRS=process warnings
Date: Mon,  4 May 2026 17:51:14 +0200
Message-ID: <ec035e7520be7cf143f0e9440aeaee8320abee5a.1777908711.git.mchehab+huawei@kernel.org>
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

building docs with SPHINXDIRS=process is too noisy, as it
generates lots of undefined refs. Fixing it is easy: just let
linkify generate html URLs for the broken links when SPHINXDIRS
is used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 4fc894b377e6..1d7d441e281c 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -104,10 +104,27 @@ class MaintainersParser:
 
     def linkify(self, text):
         """Linkify all non-wildcard refs to ReST files in Documentation/"""
+
         m = self.re_doc.search(text)
         if m:
-            # maintainers.rst is in a subdirectory, so include "../".
-            text = self.re_doc.sub(':doc:`%s <../%s>`' % (m.group(2), m.group(2)), text)
+            fname = m.group(1)
+            name = m.group(2)
+            ename = "/" + name
+
+            entry = os.path.relpath(self.base_dir + ename, self.app_dir)
+            full_name = os.path.join(self.base_dir, fname)
+            path = os.path.relpath(full_name, self.app_dir)
+
+            #
+            # When SPHINXDIRS is used, it will try to reference files
+            # outside srctree, causing warnings. To avoid that, point
+            # to the latest official documentation
+            #
+            if path.startswith("../"):
+                html = KERNELDOC_URL + m.group(2) + ".html"
+                text = self.re_doc.sub(f'`{name} <{html}>_`', text)
+            else:
+                text = self.re_doc.sub(f':doc:`{name} <{entry}>`', text)
 
         return text
 
-- 
2.54.0

