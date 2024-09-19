Received: from mail.tlmp.cc (unknown [148.135.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90C319DFB5
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Sep 2024 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.135.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726752999; cv=none; b=BaRzcTHzLxNAcRS2zijS7ZIQJoASZVT3ALBnlFz+WMUupbjbsXgDx87eLazIyw30NxXgBmJZtCYx+B3NItCD2kOkKNlgVz4nRsLgfE3ZUExbNaawiygy3gksQgxvgHvs3FpGsPpbXPx1BK+P2p/zTbV7WOQHMbJFeOmG8SrVMFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726752999; c=relaxed/simple;
	bh=/KypmyLCgg4+8C3xQrngmxr+U9GlgA4CDXwAOAQzk3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uOCvMlnuGjOgsbw0No4uVJKCcR1KfbhX4xwOT7+2CpmBDOXj+9RLISuUR3UD3WEt3hBzVpc+JR+sTdC0nZUuz6DG6h5H9O0hbGPzJ17obmbcKIg/kRwXXPuwwnZtgxisdmIM4MRjAg/y2UKipT4SIp9jqO/t9eir0IQm78bsY3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tlmp.cc; spf=pass smtp.mailfrom=tlmp.cc; dkim=pass (2048-bit key) header.d=tlmp.cc header.i=@tlmp.cc header.b=Egw2MLlA; arc=none smtp.client-ip=148.135.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tlmp.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tlmp.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tlmp.cc header.i=@tlmp.cc header.b="Egw2MLlA"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDA6F69843;
	Thu, 19 Sep 2024 09:36:19 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tlmp.cc; s=dkim;
	t=1726752990; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=2bExOyozlLKkNWf1a01yisUbY1uNY/FBKGdt0ypk1eE=;
	b=Egw2MLlABoojgRplxCKWIbnTj4wS4b7uurv5+QF/pOo9VGlKVM3CEdUSlJ00n+RrjzfwdO
	LePSPIMtBAeY5RcZg54F/qGggZ2ZUvHy1bpHEA/zdStXdZ6zr+545cV37C+iodsKJAh1KS
	6entuJPqSyjo2B5p3Zx3V57znsDsOXn/Pwlz17DU9+OcgQnW7rTyjKyWbTcOEEPLI4sBvX
	NOH8wh9pIEqMlieDMC1dylXQZ+EB8o4ZuzJq0b/rw2GYoUAdigON3qWXdsCwv8GePEd2cl
	qWF4qWlk2mzSL/mE9eAJq9Rx0T0CDGJfMI7Hh5HhIF0AQqvaghu0jGQ23Aih1Q==
From: Yiyang Wu <toolmanp@tlmp.cc>
To: rust-for-linux@vger.kernel.org
Cc: Yiyang Wu <toolmanp@tlmp.cc>
Subject: [PATCH 0/1] rust: introduce declare_err! autogeneration
Date: Thu, 19 Sep 2024 21:35:44 +0800
Message-ID: <20240919133545.942223-1-toolmanp@tlmp.cc>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Currently, the error.rs's errno import is done manually by copying the
comments from include/linux/errno.h and uses the declare_err! to wrap
the constant errno.

However, this reduces the readability and increases difficulty of
maintaining the error.rs if the errno list is growing too long or
or if errno.h gets updated for new semantics.

This patchset solves this issues by introducing a rule to generate
errno_generated.rs by seding the errno.h and
including the generated file in the error.rs.

This patch is based on the rust-next branch.

Yiyang Wu (1):
  rust: error: auto-generate error declarations

 rust/.gitignore      |  1 +
 rust/Makefile        | 14 ++++++++++-
 rust/kernel/error.rs | 58 +++-----------------------------------------
 3 files changed, 18 insertions(+), 55 deletions(-)

-- 
2.46.0

