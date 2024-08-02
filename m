Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1274E1DC474
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Aug 2024 12:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722602743; cv=none; b=GbD4BeSUQ8rQgkBqM9albYu8mUkvr3LzjTIAJMQq7inr1qg9/LBBDLE8Eq0GC2nl3qIB9mVVwVwEfgC54X79mfCQNXrUcJfV+9i3h+NIFA5+Eccoxu9kQnxr9fT4un861ZYmbY5TtRTjA/H6wEYcE0ZZLgnV0W1GYopnG9/PHAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722602743; c=relaxed/simple;
	bh=tiHV62W1WLgEASnBkRMbzZagftzo0qxoQXN58XE/beQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CqvTYWPatXDJ+p4Ng4npkB57/47kjiYAQg5+VAg7aeo5aKd/E4epnaEynBjD8mvQMAXER6Jp5PIcJhKJJ5pHrh2KVyJrdk8+UJvKgBCKnURkc2zgVAZcuPlh0lK3DMuFSghI+m0Q0/lA4JAoP3esf45XsxcfvW9Ar6CgMMQ8EoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BDHU9Iws; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BDHU9Iws"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so12631866e87.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Aug 2024 05:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722602740; x=1723207540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQadfcLj0dbMeA91m7FGzai+vkUYG1DvlG0x0uq/CWQ=;
        b=BDHU9IwsyPc8Kxp6Shf6D8mk5SRsKDOGAWneg8zYgzdz5YTHBLQGRjGuxaDas1svgF
         Doj6+F/qllxfgLvKESC/OnZQYBpRsCOsfNvrn9pfLNmwjyD50+8Olnu6EGmw57aK6vnL
         DXtWkTWmKWJ9RTsYE2/wW9PasY0/UsUEN5F8JUAJA2j55E80ctkj+HcWH7SXQxWrNMUc
         1MyHfVByzmIJQcrNNtq4scXxfaT3gOM6vnIG6wsCH5MwU3ArARUyOS7s/ERt7Q0LQt7T
         zRCOGzn+imRxRyrqyBE1E9uSsRx5BWIJd4CYEXH9EnA7gZHbBUONxdcUgbCPALAWM73/
         dTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722602740; x=1723207540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQadfcLj0dbMeA91m7FGzai+vkUYG1DvlG0x0uq/CWQ=;
        b=JRkjhV/7nAMyhASw5BIFbxMPTGoKUxE0EW27N+PeyEvIOy9aYKPH037cVCJQElztQ+
         hGbQlg4KmJdkltQHjHQDRr4Y7R5nJU0vcMKlD1r5/eMU+TPET9Vu9zLIfidIyfsCZDLE
         CuvJtLJffrLm6nIQY5QNrQ3xBepVacXeNNdY9Zu2YvS81RpjEByY3HfKtJivdkl83fco
         eybC0UWAFKcuNJyNuigPtV00eiKgPSwVdNziSaRrOn67zWk1pQKOJpT6BkoI/bpteX9s
         ixwS8mwVEEVn6+5iYBDEcisLbRVk2YoKvNJYzGunGf9V9JuDMiH0kTLp6FQRZPcWJdtn
         MYkw==
X-Gm-Message-State: AOJu0YzhVwT4NZJfert5uPkcgbzMzPg2zeqeCGplbhlTY97m8FUgrzMz
	wojEVvWMS7SADRl51H93FsD5eGYJ0r89abBJG29KyMcmBLekpeFIAL0NK5/Q/yU=
X-Google-Smtp-Source: AGHT+IGPr/cTRmNKJixkMUcjn1GhBezt4VMjTUceJqHStS9ST6UWMb+IoVyz7mZbggjMOS71BVFYIA==
X-Received: by 2002:a05:6512:3e15:b0:52c:e0fb:92c0 with SMTP id 2adb3069b0e04-530bb385315mr1973294e87.34.1722602739950;
        Fri, 02 Aug 2024 05:45:39 -0700 (PDT)
Received: from localhost (c-9b0ee555.07-21-73746f28.bbcust.telenor.se. [85.229.14.155])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba07e6fsm218765e87.39.2024.08.02.05.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 05:45:39 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	shuah@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 1/2] selftests: rust: config: add trailing newline
Date: Fri,  2 Aug 2024 14:45:35 +0200
Message-ID: <20240802124536.2905797-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If adding multiple config files to the merge_config.sh script and
rust/config is the fist one, then the last config fragment in this file
and the first config fragment in the second file wont be set, since
there isn't a newline in this file, so those two fragements end up at
the same row like:
CONFIG_SAMPLE_RUST_PRINT=mCONFIG_FRAGMENT=y

And non of those will be enabled when running 'olddefconfig' after.

Fixing the issue by adding a newline to the file.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 tools/testing/selftests/rust/config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rust/config b/tools/testing/selftests/rust/config
index b4002acd40bc..fa06cebae232 100644
--- a/tools/testing/selftests/rust/config
+++ b/tools/testing/selftests/rust/config
@@ -2,4 +2,4 @@ CONFIG_RUST=y
 CONFIG_SAMPLES=y
 CONFIG_SAMPLES_RUST=y
 CONFIG_SAMPLE_RUST_MINIMAL=m
-CONFIG_SAMPLE_RUST_PRINT=m
\ No newline at end of file
+CONFIG_SAMPLE_RUST_PRINT=m
-- 
2.43.0

