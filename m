Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E591C3781
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Aug 2024 12:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722602745; cv=none; b=Cjru0lbKh6r0pjM0v8HeKd8pkxEG0o38GKYcevDYQvC1B0pVoZM/9TDTeVBwz/coYqjBh9hMAdLC/rx/6LBdJc0NMEfsI6U2YXbB+i0k7Kp5CvodeKEafc02pzJr0y3FjexlEAaadJ0Gebiq8beIPIRi4U9SKlSRXRvzpSMleYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722602745; c=relaxed/simple;
	bh=198IHW7p/T6PhidWJlWdPVwESeg8JNSFLNq+O29lKZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6nekND8sXw6Hl+9vIZYJnnv5gr9D0G+RjqACKwQ6SRHc89l/wPlIUV877Wx2ZhQYbzKHSSx8d6oPt8nP3U/yQrEWSzs0I1Imbdj2Tq1twdi8TmtpwLVXn+/PB+WbrMMglqnL1OEZZ219kTz7iPHDzv0/EjfbCqnqBWRwNN/P5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OPMpFxpQ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OPMpFxpQ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52efd8807aaso11977500e87.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Aug 2024 05:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722602741; x=1723207541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzvUY6CqajngImU9C1U2y4kXw0+36J578NUjQngUD0U=;
        b=OPMpFxpQ+X4l6hURXeGCnLy5Wre29BWhsKB3WCVv+0Yos54XQ3a1DXaAP1kkrRnRGp
         xBJhRtn4gnMcZoyrZ5k4GrWelkPczDlioxsvkspdBaxPqYWUKWyQKQOXGSSLkOXk2Wjk
         7Du66R+SFH6HFtAOaJH2NKTWkCy002aBBv/mMBNVfxKJdsjpnWnfrnqj0QGHnzxhk+NZ
         rXh/CVyXsJB86qI5GhaaBQdHiv+iJ/2t5Dc8TwR6bBWi3AFFpV6/g6cSaClLx9fr5Alk
         z1hA+gWu90zseR/Ecw04tjUxJw3EdsyzYED/iGLVPfsh8Ax8nHpHxnAlh+oEp7SJc8Lt
         9E3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722602741; x=1723207541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzvUY6CqajngImU9C1U2y4kXw0+36J578NUjQngUD0U=;
        b=tTKd4C6EUrhVmjhDeFSSpy6xRvuujxnj/OMnit+Fd9nSIyYxOSzdUTo9KgXN9B1mJO
         nVyGlzQ6ExbnXAmImrvxcMTifZSLpm9WKlEkM6OgARuTk+tlco/xQu5DkXJ/Yhf1xhrx
         9aIzL24yEyX3FhHZBF9G/bwU9wa9stuQJiq3rO9c8kx92S0MnaMWDhsBVnhtJVwOtt8p
         6Rlj5RvI3ZXD3OuB1Ph2wsh03oy75zOfJu7KJ1wpJK4rUkEfBL5J72DSNkTXzl0OBUba
         jOEKq7uqY2+o1RzTSQU7t5Q5fF8LVRbS8z76xfP7FQo/Hak1EVM5FJEfhziWoAWeCFdg
         z4Lw==
X-Gm-Message-State: AOJu0Yy8MHzibJfD3S0AH5Zb2qD4OK0fr4EUqxPPwwFLp4AkGfe+Mpkd
	Ef6FaBKO7sPosQltaB0dqzhqu8dAE07g5uiJJBsphsxRuoa15Osrdd4gedwBTNw=
X-Google-Smtp-Source: AGHT+IGKqSCamMxPEhPZg2DpP7McBM0k60aQHtIDoeS9/S1zbWrD4kLItzjJHFXfCo7lgU/gypkFzQ==
X-Received: by 2002:a05:6512:114d:b0:52c:8a39:83d7 with SMTP id 2adb3069b0e04-530bb3c7d5amr2168649e87.52.1722602741057;
        Fri, 02 Aug 2024 05:45:41 -0700 (PDT)
Received: from localhost (c-9b0ee555.07-21-73746f28.bbcust.telenor.se. [85.229.14.155])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba3ccb0sm216230e87.255.2024.08.02.05.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 05:45:40 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	shuah@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 2/2] selftests: rust: config: disable GCC_PLUGINS
Date: Fri,  2 Aug 2024 14:45:36 +0200
Message-ID: <20240802124536.2905797-2-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240802124536.2905797-1-anders.roxell@linaro.org>
References: <20240802124536.2905797-1-anders.roxell@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_RUST depends on !CONFIG_GCC_PLUGINS. Disable CONFIG_GCC_PLUGINS
in rust/config file to make sure it doesn't get enabled.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 tools/testing/selftests/rust/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/rust/config b/tools/testing/selftests/rust/config
index fa06cebae232..5f942b5c8c17 100644
--- a/tools/testing/selftests/rust/config
+++ b/tools/testing/selftests/rust/config
@@ -1,3 +1,4 @@
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_RUST=y
 CONFIG_SAMPLES=y
 CONFIG_SAMPLES_RUST=y
-- 
2.43.0

