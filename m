Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904C612FB0A
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Apr 2024 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136297; cv=none; b=MyEZeYe6EVnW72QcnKByKmH107KprVcNrAJ3d23ptUSXH2tgKPCQEx3DIsHMyvkKRAc1WuPS9+9vI92uKjc7QHbJEJfMdCeMyi1fM7MbqokC/TajBDZFaQKrFEEdHGWgEclk6k5+wuEMo02AvX1ziUYT+hbWhnUCZDQiaBi9yCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136297; c=relaxed/simple;
	bh=92mPhUlzzfNV0qTQVkW5nYHAFA+RzGdjVgEd9UIRvNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mzUfgMoNY7jrJ7EzJ/IjTBQL1zcCDwlFzrDC67Qg85uTsgxxZqlNY7p+4JARjda7ZLF/qMWQdX+7omZAkLtqqe7DaGrp2XVGILCE0N86shflMUzd/r4KKfm6IIg7x28RM4x87S3JUns8MYDfiAwjZVTqIesOH3SYyRAlyGJW1GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o/NzRqmu; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o/NzRqmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712136293;
	bh=92mPhUlzzfNV0qTQVkW5nYHAFA+RzGdjVgEd9UIRvNQ=;
	h=From:To:Cc:Subject:Date:From;
	b=o/NzRqmujkp/ilEqEilJXwAjBboAnI583x/SZw5LJnCAJuOzlDHefFQJhij//w3SE
	 U8P3bl+Qs8O0qm2Q90NOSXvtAV2gfTshtGyfdRlN6QYp/861UKGKj0MHd4NAKYaJip
	 2Rl+sy3GEYe3RmhuGSrvC2lSYVtfBvWxTUPaVFmlVUeUBObgHGQNht/AYnIou5quvY
	 A5CZwljTTcQlG6I1pyZHb1flHoABQQETPUpp/fiJHlED3+SjMrNM+Fi1JT0J713E0m
	 gjTXOJJgpiUdhnbfJe+cwC0oN+XgrIDCpzlwFmrDRrU1CqElJubzxs8ceaCImGwxrk
	 75d5iVN3sVsZA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CCFCA3782089;
	Wed,  3 Apr 2024 09:24:52 +0000 (UTC)
From: Laura Nao <laura.nao@collabora.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com
Cc: boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	kernel-linux@vger.kernel.org,
	dirk.behme@de.bosch.com,
	kernel@valentinobst.de,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: [PATCH v2] docs: rust: Add instructions for the Rust kselftest
Date: Wed,  3 Apr 2024 11:24:52 +0200
Message-Id: <20240403092452.30300-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add section describing how to build and run the Rust kselftest.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes in v2:
- Use plural to account for potential other tests added later
- Omit details about the test_probe_samples test
- Clarify that kselftests are intended to be executed on a system running the same kernel to be tested
---
 Documentation/rust/testing.rst | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index 6658998d1b6c..64f58c4308f8 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -6,10 +6,11 @@ Testing
 This document contains useful information how to test the Rust code in the
 kernel.
 
-There are two sorts of tests:
+There are three sorts of tests:
 
 - The KUnit tests.
 - The ``#[test]`` tests.
+- The Kselftests.
 
 The KUnit tests
 ---------------
@@ -133,3 +134,25 @@ Additionally, there are the ``#[test]`` tests. These can be run using the
 This requires the kernel ``.config`` and downloads external repositories. It
 runs the ``#[test]`` tests on the host (currently) and thus is fairly limited in
 what these tests can test.
+
+The Kselftests
+--------------
+
+Kselftests are also available in the tools/testing/selftests/rust folder.
+
+The kernel config options required for the test are listed in the
+tools/testing/selftests/rust/config file and can be included with the aid
+of the merge_config.sh script::
+
+	./scripts/kconfig/merge_config.sh .config tools/testing/selftests/rust/config
+
+The kselftests are built within the kernel source tree and are intended to
+be executed on a system that is running the same kernel.
+
+Once a kernel matching the source tree has been booted, the tests
+can be compiled and executed using the following command::
+
+	make TARGETS="rust" kselftest
+
+Refer to Documentation/dev-tools/kselftest.rst for the general Kselftest
+documentation.
-- 
2.30.2

