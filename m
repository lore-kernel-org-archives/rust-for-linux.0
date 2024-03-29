Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2D84C89
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Mar 2024 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711726238; cv=none; b=tJ6t7ZfbNaEjK6yUrmuu7tRWogtkqC21+wf/jP9Q9VNA+ohxpNmYR51J+ro758AGoIC18StRVKRAUo1Pi8ZxnAQhyxQnpruDoKq4q6vhBn/n1ty5fB+/p1ku0VoLLMrQwxTNPadgIxepta3CNlaVdYNYjxVErg5q/YDv6pi/3Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711726238; c=relaxed/simple;
	bh=4GmSRYCt1tXa3I6neGOfIWibn51R2sbrgglBMoO5B1A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K56/PNyJzGPGCtDfTecUmzuaDw7zmUUcQ2m0ueScgsuX0Dto083z5yDLxTlq9U+CgBgVf0agDRb1Sv9Pxhpt91SZISFzOw5QJGQk4uKm0XXwVQybR1xgBBhnolweD0zn480s4WFemcy+Cnpu96Mlm7bFzawZ3NbPnMIqrl8rpUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VnEQWD6s; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VnEQWD6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711726233;
	bh=4GmSRYCt1tXa3I6neGOfIWibn51R2sbrgglBMoO5B1A=;
	h=From:To:Cc:Subject:Date:From;
	b=VnEQWD6sJh7NYp36NPsw4lviJy2nafhCuSHH9nrht1nXssLlj3ROCi0YpIcatZbm4
	 qaKEvLcxa7zz1c50ySGxm3BgrJ4wYSNtx1xMpBqWE05IjPPo2fCEmB5iZ67IJ1F1Mm
	 W0b/+RU9Q4gruf/05rEBMsY/NKlRgYHgbg4nKD74H6Fl4u7HzQp/I01rnKJb/3CfeO
	 jo4kx2XXn4F7UpmCId1m4cHH7SzriRATWNkWrQaSyYrZtK2+wTpAUfitOAmtSQ2py5
	 EHZNmAVq/ACV1ZQFg+xPzUGUHAKgwm4af0zi0V7Ltt2TMTNvYg4h/wo96zjAmcfbtS
	 i+aNspCGY55Hg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 28EAF37811D4;
	Fri, 29 Mar 2024 15:30:32 +0000 (UTC)
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
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH] docs: rust: Add instructions for the Rust kselftest
Date: Fri, 29 Mar 2024 16:30:25 +0100
Message-Id: <20240329153025.150112-1-laura.nao@collabora.com>
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
---
 Documentation/rust/testing.rst | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index 6658998d1b6c..b5b99e625a01 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -6,10 +6,11 @@ Testing
 This document contains useful information how to test the Rust code in the
 kernel.
 
-There are two sorts of tests:
+There are three sorts of tests:
 
 - The KUnit tests.
 - The ``#[test]`` tests.
+- The Kselftest.
 
 The KUnit tests
 ---------------
@@ -133,3 +134,22 @@ Additionally, there are the ``#[test]`` tests. These can be run using the
 This requires the kernel ``.config`` and downloads external repositories. It
 runs the ``#[test]`` tests on the host (currently) and thus is fairly limited in
 what these tests can test.
+
+The Kselftest
+---------------------
+
+A Kselftest is also available, which verifies that the Rust sample modules
+can be added and removed correctly.
+
+The kernel config options required for the test are listed in the
+tools/testing/selftests/rust/config file and can be included with the aid
+of the merge_config.sh script::
+
+	./scripts/kconfig/merge_config.sh .config tools/testing/selftests/rust/config
+
+To build and run the test, use::
+
+	make TARGETS="rust" kselftest
+
+Refer to Documentation/dev-tools/kselftest.rst for the general Kselftest
+documentation.
-- 
2.30.2

