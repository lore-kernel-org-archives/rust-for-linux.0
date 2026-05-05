Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E993E8C5D;
	Tue,  5 May 2026 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987565; cv=none; b=nffweJYK6PVZuqsg5aTR46PGFsD0c2rw8BIRgL8P6KU5UBjcgq1ERg29EYn/gcXLTXS0i2doIPLX0zN7fx8Rpnoh7BegSTMVj1a7ETzC3NSae8O7kCanYR6VpLI9wkW5L9IM+NwB74t8HYEaXouOAZh0KnXgP0t+6vNLciA5b4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987565; c=relaxed/simple;
	bh=2rCh0cm5RWMg9+ON81fn8pbk1MPx1pRqHPKriNZbsTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Owl8g7r6RlJgKu0niPvb4QlAqxrjVtBd6wJWfc2qWWflcIQWn+/ilN9DqNWbZhY3GXGNtaQEbrbStf2VeOX9KuwAgYI6PdqUEfQSws43txojFD+Df4F6MXpK9ohJzGMivb5YNQNEg0btwsd3OYb0Vg85okRE6QEeEJkZXfCfsDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SK4T6LlN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SK4T6LlN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD50C2BCB4;
	Tue,  5 May 2026 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987564;
	bh=2rCh0cm5RWMg9+ON81fn8pbk1MPx1pRqHPKriNZbsTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SK4T6LlNaB+w5YFGd/oEcCVU8377bM8Q1F8a+ebVIQ0dQP3M4g1pj6rRgtQ4HTeXr
	 K+3UxO4Omte6C7dN8rIbb3DQ0W08NYOPXYr/43AnWiE57kEib+mtsRzan+9K7CyaPA
	 kw6fhN33fYCL4inDcWPoeBOnRPyTXoh2I0YlaRVViDRTwb1PhRVp3CHDZSDqmDQg55
	 gPA53w05Q2HFYJhZvwNczHO+88HuVfsCJ9LcquywK2xoNvi7EEcIhy103DjR+050UA
	 Jc7w03QaDFVyG6EDuNek2WgbhCbY4ASBgj3pT7hFrsZ3C4tU4yO3pRlc3bsTiVogku
	 0lxe5gjxlxJkQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFmk-00000004idJ-3IPB;
	Tue, 05 May 2026 15:26:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 01/11] docs: maintainers_include: keep hidden TOC sorted
Date: Tue,  5 May 2026 15:25:48 +0200
Message-ID: <e6b302f2826e6a5c0124bb33cc517e8b5888252b.1777987027.git.mchehab+huawei@kernel.org>
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

There's no practical difference on keeping it sorted, but
it helps a lot when checking for differences after patches
to the tool.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 436e7ac42ffc..694cdbdc4caf 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -265,7 +265,7 @@ class MaintainersProfile(Include):
         output += "\n.. toctree::\n"
         output += "   :hidden:\n\n"
 
-        for fname in maint_parser.profile_toc:
+        for fname in sorted(maint_parser.profile_toc):
             output += f"   {fname}\n"
 
         output += "\n"
-- 
2.54.0

