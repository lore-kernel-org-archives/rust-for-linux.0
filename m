Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A741D2B22
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730803663; cv=none; b=i6xu8SB399MZLBt6UiBD+ZIwJ/l6yenX8qCEcQ3CQ4YtBoAWLruXg2ngSAzeMfBBRuBhmF8FdwxoZe2gxo/gNpMdGGdESNfRz6MNJ1eDFk+bjCwfjIvALnziGPFX3RHD4ttCcUakR9IB/evt6tAD1CtUsRZqoKkkbY9CYI8fRxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730803663; c=relaxed/simple;
	bh=giPXNvWrJ1zsJQZkQd2B2RCDaNpLkxleapOqDDfQfhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wff7YmiurGjAzf8gCL9XiHkC1awPT9yWlROEWZiYmeh7O6mM1czYMZ1t7JMsscSjUAImgmtGcWkxC4osPFdh65XNiX0Q1+xvT7bl/cK1PmQC5fMhBRE207fR6qASb/LnLuheG2ssmE0vwqVAZ2nqR0QrZaToCzcUklx1dPEZvqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrYVylB+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrYVylB+"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so6693300e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 02:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730803658; x=1731408458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLgsd+vXvTVhRmFeWAr5s+0uMHQtIheW0N8cf6W+eAo=;
        b=VrYVylB+Pf8lkCEDgNVpuLzOZwxlZPNY3fZMu6gFC1rofI0FKDtIehaWKCpeSZScT9
         kxQCZhIMSy+AqQq36ZcT+bVw0owzgyiSILk7P38vqrJjPvPpE46rRLoVAFNH/VaehmjT
         pNTLfBHpapoLPxqXuBOtVi+YEMa/HS1SzxG+esYRmZxHKyX8eWrx598/k7WPTGYv49fw
         yFA1znOPbxzaSWp0Lyy2ZjFuyBkSsiyK3oVqiiZHtrDFEJv2sNZxrJy8b2tQlrI6fUtH
         naeZiT2ntbZtTIobP75hwsgTB7STLSCDZmd0wwJpOvmcgkz/Ew13BCXCg5lKVLDb9Uy2
         pw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730803658; x=1731408458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLgsd+vXvTVhRmFeWAr5s+0uMHQtIheW0N8cf6W+eAo=;
        b=C+JHyX9WR0FDTD5SV4yiyvV7jbZlK+qSiztuuPdR383tamhdeHdcA9eopAolH/UZ4N
         D8hKrz8lLZuE4WSGwZej+d+kGSz3tPmOrPv8+/whTB3hhchIFX7tCggEOTBhSrYN+rEP
         dOTq5EJmsMfBpTQKSFTAgTJ1lUp4ykPVtEhH24cN8X1ih7XciUUCA7RmO2VP7tc3QxVT
         CNr1tdDvkM3gfiEJKBUSaJLnOc9LdYZihMCoGk5Tz6suFN1Mh6HYGC32LK6lFcsYQunz
         SOsqcsKbZM8fDimdkoEw4fATNBxwlflNspECgPnpH40fsIK55zZq1emnvNdrzLjG9P0n
         YFiw==
X-Gm-Message-State: AOJu0YyuHM2Clizp4T7WVyKkykovMnXSqNYt6A+dFEbeHzxqK9eDXiaW
	Jm0Aif6ohaOht0o/FcIXBvlzcrMFVcVBmE9SEHcbs5BUZIHvqNVZW3CKNQ==
X-Google-Smtp-Source: AGHT+IFEvcEpcyQMIUNpBUF1cdexcjy8K9NBMbhyFUCXqyjbejhERZj0T3A56644zUwkrlYdEjS9ag==
X-Received: by 2002:a05:6512:3b83:b0:539:f1ce:5fa8 with SMTP id 2adb3069b0e04-53c79ea3212mr7243117e87.49.1730803658108;
        Tue, 05 Nov 2024 02:47:38 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9620bsm2082686e87.37.2024.11.05.02.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:47:36 -0800 (PST)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: aliceryhl@google.com,
	daniel.almeida@collabora.com,
	a.hindborg@kernel.org,
	dakr@redhat.com,
	airlied@redhat.com,
	miguel.ojeda.sandonis@gmail.com,
	wedsonaf@gmail.com,
	a.hindborg@samsung.com,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v4 1/2] rust: error: Add EOVERFLOW
Date: Tue,  5 Nov 2024 12:46:56 +0200
Message-ID: <20241105104726.3111058-2-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trivial addition for missing EOVERFLOW error. This is used by a
subsequent patch that might require returning EOVERFLOW as a result
of `checked_mul`.

Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 7cd3bbab52f2..92bfdaaedb02 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -63,6 +63,7 @@ macro_rules! declare_err {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(EOVERFLOW, "Value too large for defined data type.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");
-- 
2.43.0

