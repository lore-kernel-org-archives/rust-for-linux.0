Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695947DD72;
	Tue,  5 May 2026 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987566; cv=none; b=cMigu63Z65WitUz4uSgGNlysXQnOzz+InU9Vd2i1480o9uYVBnGh6CdygkfWruV3Bjm9+nhRv/vR7cRdkUxCfzvERuSjFAIsGCU64cpsuhwlrVi8yhyqQJLRsI5aGmbXvYBYYrWVj5P4bRo1ixBPZw4CtlMrogq2e6vMW5+e1RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987566; c=relaxed/simple;
	bh=ji7IOhovAJkxdV5QZIeWOhYb6No0bgVbt8ZPTNNRvqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=po+aZHPu9RKQnPG7a9Gb1ri8derZQzGV+oX0D/IgafzLFHk/WlRSSR02zeiSpZFLB8acdTAWNBmfqXPJ+TUDMvy8g0LYdZah4gC6bgvdw6IbZeFIv+KmKlKXIy58lMPUqn855ShQSawD9FhmCWln5xyWXeg5MdrKcC1uhjKW2D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTDScZkp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTDScZkp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C387C2BCF4;
	Tue,  5 May 2026 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987566;
	bh=ji7IOhovAJkxdV5QZIeWOhYb6No0bgVbt8ZPTNNRvqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YTDScZkpNHVSSJnpitQn8qa1lqbhO8iJfJJ0O039pkzEBkkSpo23VXRe9F6pW5sH4
	 iIkMY2zVOwRJu60Broo9VzZvFaPJu37NjduKEDjFF0fDWA5HQQ3RdW26UvfZWgQWuU
	 bYsUnGqD3HIW9SYh9Z1fWZvonQ/0/nuUoKXnbPRzdl8qAUF7lhV4S93fsQybNN11O8
	 +Wy4QSEC5doB5BDQAJd8/A8MWFVQfK2GsDzS0Pcl5YmjZtUSdt7xachC2W7ycSHmTS
	 o/UzUJm9dEwX6dVvYbh6eZzpV8Aq8OOjP86HkEvVi+Qpk33oKwbiq0tW0lxmN8r5rU
	 C3YIqJsfTOAaA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFmm-00000004ioE-1IUI;
	Tue, 05 May 2026 15:26:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 10/11] MAINTAINERS: make clearer about what's expected for "P" field
Date: Tue,  5 May 2026 15:25:57 +0200
Message-ID: <921e5e6a074f9d8cf77483d73e6801f49254bbb8.1777987027.git.mchehab+huawei@kernel.org>
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

The "P" field is meant to point to a subsystem maintainer's
profile, stored either at the Kernel documentation or on an
extenal site. Make it clearer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..8700472b3ae3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25,7 +25,7 @@ Descriptions of section entries and preferred order
 	C: URI for *chat* protocol, server and channel where developers
 	   usually hang out, for example irc://server/channel.
 	P: *Subsystem Profile* document for more details submitting
-	   patches to the given subsystem. This is either an in-tree file,
+	   patches to the given subsystem. This is either an in-tree .rst file,
 	   or a URI. See Documentation/maintainer/maintainer-entry-profile.rst
 	   for details.
 	T: *SCM* tree type and location.
-- 
2.54.0

