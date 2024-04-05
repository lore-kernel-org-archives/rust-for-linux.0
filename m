Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD27016F913
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Apr 2024 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712331544; cv=none; b=SWQ5FNOIg9vod8lJdLq6pWoh87rm999Ab3Z9PdKe2K3Tx6NTk88qZYmzRlsIlN46bO1NlNgcrmbQ8rx3/iqVP3B5VgELvxioqlcjRUEjOjSriR4OZ5sBNnP/zwuDZeA/uZZri8/TGOUsgPfZ75Ro6VgyBCA8m2p+zIA8i8ZCmZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712331544; c=relaxed/simple;
	bh=mpBfLCwWGTb2DhqecllOoxL1uYU9sVI8qGOMODrtZy8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uuticHEOKYxl+WKOF4D7qG/gMLjMGOcXJ8m3lSHvw5+TkTnzAiK3DCtNPTvbWZO/PloTq8OXYpp4x3WAt9Uy9BQoFhpATVnjRQ9K/LCTP0CIydgozAulvLmgs1M00JCEC0PNv7EufI+fUae0MQT/Qp8tXK38CKU2i+CaWLPjDUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BvQHJQuv; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BvQHJQuv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712331540;
	bh=mpBfLCwWGTb2DhqecllOoxL1uYU9sVI8qGOMODrtZy8=;
	h=From:To:Cc:Subject:Date:From;
	b=BvQHJQuvFz8y3AFbMwN9bTotX/ms4B9CoE42ix10iEpyK4sur114ZNFdyOURSATw+
	 hPIYtLDESGCEE2xQ7zM76Fy08s0TiFly4N3JPR0ldJpAZqXlOHJDAXax9QhMZNIaoG
	 Lk1+NI5KKULa5Ty8htTEX0C9Jkr/U/zZikJ+3b5slkbxQPVvyl4VaGhS3wm9smjtVo
	 +h2Bs2A2HfP83wmmDxR0TN8HwGK7e4d8206VwBmjoJMsGVM1bu6klm4M0rtco0+V5m
	 ypv2U03KSb7L6WdpM2zFaxIRhamj5gHKsWTMrgOr9coeP9gDKksz8cvRrEv0XsmWdx
	 rTkaoF17yr2/Q==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B3548378200D;
	Fri,  5 Apr 2024 15:38:59 +0000 (UTC)
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
Subject: [PATCH v3] docs: rust: Add instructions for the Rust kselftest
Date: Fri,  5 Apr 2024 17:38:41 +0200
Message-Id: <20240405153841.320459-1-laura.nao@collabora.com>
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
Reviewed-by: Valentin Obst <kernel@valentinobst.de>
---
Changes in v3:
- s/test/tests/
- Specify that the test kernel needs to be installed
Changes in v2:
- Use plural to account for potential other tests added later
- Omit details about the test_probe_samples test
- Clarify that kselftests are intended to be executed on a system running the same kernel to be tested
---
 Documentation/rust/testing.rst | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index 6658998d1b6c..eb58b2475042 100644
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
+The kernel config options required for the tests are listed in the
+tools/testing/selftests/rust/config file and can be included with the aid
+of the merge_config.sh script::
+
+	./scripts/kconfig/merge_config.sh .config tools/testing/selftests/rust/config
+
+The kselftests are built within the kernel source tree and are intended to
+be executed on a system that is running the same kernel.
+
+Once a kernel matching the source tree has been installed and booted, the
+tests can be compiled and executed using the following command::
+
+	make TARGETS="rust" kselftest
+
+Refer to Documentation/dev-tools/kselftest.rst for the general Kselftest
+documentation.
-- 
2.30.2

