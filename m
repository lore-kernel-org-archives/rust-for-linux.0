Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EBB36D9E0
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440560; cv=none; b=kpLL3Fmm9cvVbGkfc5aPSDLFivbJmOB36sZPcXOH8KSJbg6UPDlla80Xn8NvJgzVnziskZebmlMiJEnoNZ24p56DGauhhNLyh3qXtI0Zj88498l94IsNfBzPWE8m6qjjIkOXLuAIz/LpKfq7JuNrGT/olMzLkle7q4k/PCkyKLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440560; c=relaxed/simple;
	bh=5VNrVx4ZKAIvebGxfLNqPgw9xDv0RVGMqeAFRyrl6Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6ixsvnQqgNFqAXY2W5jKZgc8j/KDbiB03kgghIrtUjRa9BHznWDOQ8m2mkz0jMn96NEA6EAWg5u5IMF1m/kLmGK9Ag1nRmMKOM7xcCES59YPjkdkLw1a7rmuU+Zou/hUk01ck3Z8YHqjPpVfEXgTxaq6AKVU+AYH2k+Jq/pTlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMRKMigy; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMRKMigy"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so11190235e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 09:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440556; x=1791045356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92J4cdfV5TssQddcjnr52AW40i0MRdcSuU09rnmRkE4=;
        b=GMRKMigy15lhxSBtsY9tLDNnBp7jDte0j+9a22hpyfopd7WK/kzTZkyKuCrx3FDgOD
         QB62hxpqiZiEpg/wmJfp15seOyKZJ8t8M3+LpotC1nj7mwchNUw10R3mSKxa8i8ZZNbI
         b/u9ThPqkGvnDsDmuEe6Zsv4pTruh2Esy/PivZgp40yVT7/hf9XNRk5YrhByOlrkl54R
         wCUToG/F7yMPkEDPSu12arX5Iqj3LrIVuNzZ9SUO2G339eTPuq/PKvbWzDJMkNNY2p/h
         Ah1+crCdkTu/2KxpVi7Io+iyE/RJ7NVX2mWT7t7QTaljZLkZhfJeXSmNsXGKMol6+9lu
         fBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440556; x=1791045356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92J4cdfV5TssQddcjnr52AW40i0MRdcSuU09rnmRkE4=;
        b=aauNhOZzcBu24/Ek1QQ9q0oKZAg9+rOqo0UpnLO5Tbb9pr8pM48dQIRAKYNEyAz+EF
         iafFlCNWrzikvp9M7KHEX/qcXRIixAlME9GGlitz7aH/K1ciI2O6Ja3FQnNfuJa043pw
         XOeeBwzP4jVXCj97XnLNG9TvTdVmDVgwnPylj4KO+dnoZjuoBjO5XgMIZZsWYceQMAxf
         VoslRcDbTUnBgNh26WjBFZ8qJqiycHnZeoglepTmFlaVLWLiblQfSuFhw5k+c7/m93N9
         nWyyz4G5buv7KcPjDusHWsvoKvthmJU/n5PAac4imUu6M/N7EUVpLgRN8m8fVOjBNgLZ
         NBaA==
X-Forwarded-Encrypted: i=1; AKwUvBzn7BY/lsEWdRBO0oQ+cnxlQ0YElnoU/8SvhEBYAF7kS9qTUB8/gX6VQ1LVMa0n0a1srl5kMDDFk/gk4jiKLg==@vger.kernel.org
X-Gm-Message-State: AFuF++k96ZBEBkPpCQnk0MSb+1hG2bRmtBgLVAfsqa86KUgK3Unjqvx+
	tUxt0aIBURpg7jRAWK+cT4iY7AbHPSQHBEbBwltub+ONHFAKGykE1dVq
X-Gm-Gg: AYBFou04aaceyCF067Y0BljdagSFx30ak26SVod9lIHmBINGjoLpRcDBjA0kZqFaE1J
	ugGcAPW2WehTB3+Q2ulQ9Isl92suMXAO/CKQYJQkEggbp93bIbyPZWVlbom4dcA5fTFcZS4eIh5
	DV3aTSodQaCKtT9nTeZy6Q8snXLcK7Jq1jy7Rgc2SSCF+OtW7tS9j10iNU/PgXO5W08B9xe+Xkg
	eEwcBUSNxbcdSO6guE1EdlYQEqNl5scKYLlFesHKVYxzDyy7JWEI3aV1ZVbakI6MQ358dBOaQlv
	ggL/pF2+ArnzCnIoIqAsmhphULomN/Zk1o1KDfB9eWqWhtCmvQknrSMIBZwGBoi7hrm4Q/+jpS/
	Qr0H9u46U+AjtfkHyk6cfHgBekGGGS1YTlqSrEvT/8Il/NGm2WTTczhIVhlPds6zvTVKhUM5uVN
	dl7WQnkPCSCiiizBx0m3OzhtGWsDM8oGZ3ByNlgvPHeSd6vOvTRKR+iYH+UN7IjioVOvgpwhmE8
	xOMZ8GhdXsg0fSjsz4wyZ/jqNTx0RNLh7W1uo+J5MkGCBSDelXP2CtLl/sjOWppr2WxDlDN3v1/
	5A==
X-Received: by 2002:a05:600c:1546:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-49fe66bdee6mr155118895e9.4.1790440556411;
        Sat, 26 Sep 2026 09:35:56 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm16176146f8f.17.2026.09.26.09.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:35:56 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] rust: add DropGuard KUnit test configuration
Date: Sat, 26 Sep 2026 19:35:47 +0300
Message-ID: <20260926163551.52371-2-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
References: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit configuration option for testing the Rust DropGuard API.

The option follows the existing Rust KUnit test configuration pattern and
defaults to KUNIT_ALL_TESTS.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/Kconfig.test | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
index e6a5c7a795f0..011c72f14e2c 100644
--- a/rust/kernel/Kconfig.test
+++ b/rust/kernel/Kconfig.test
@@ -33,6 +33,16 @@ config RUST_KVEC_KUNIT_TEST
 
 	  If unsure, say N.
 
+config RUST_DROP_GUARD_KUNIT_TEST
+	bool "KUnit tests for Rust DropGuard API" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust DropGuard API.
+	  These are only for development and testing, not for regular
+	  kernel use cases.
+
+	  If unsure, say N.
+
 config RUST_BITMAP_KUNIT_TEST
 	bool "KUnit tests for Rust bitmap API" if !KUNIT_ALL_TESTS
 	default KUNIT_ALL_TESTS
-- 
2.43.0

