Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3999372058
	for <rust-for-linux@vger.kernel.org>; Thu, 21 May 2026 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380062; cv=none; b=masR9Ji4drkDs3T9vImKob5BfTKPqJIMpUf11aGO0iXOI2gpioJdPARmFm0KSS/YnrDNNF7xCvFnr23b2YPwvnibLB+mZ4UWh5TsMItP751ELFKS8VwcuirBx2B0ycmntulwpwJ5Y/G1nAxkO1T3BtjlVK8VgUMfXyn5XniMuHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380062; c=relaxed/simple;
	bh=EvaOvJK7gUYlg9eSrzLdiPePr+0IURW/C6idzGNV3Is=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z2KvdaGVC16zN3cajo6xC6o4cSp/paAV0Z6VkEG15AyZ3o/7lakR5CsbxA82z5VHzKAFMtMBrqQAvAhgbARKcS0ARU0t/UC3wgWOHclfz3gefj5yzlVwR/edvJNSOzqwI7VrrpoNrCVFbq2D28cj0ct/w/NRStRFOjRbNKS0XzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oL6IFDmN; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oL6IFDmN"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7bdc947aaa3so60518427b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 21 May 2026 09:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779380060; x=1779984860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0dyt1TzRyN36X5hR8tAOgPi+dzA4gZF2bfoIRk7jjmc=;
        b=oL6IFDmNEDFbOLkKiBJk7piHl+DHZZdJi0RuoFGC9uplQs8lJ7ebjRG49Xf43M3UUo
         goj1bb7WBsVgPzDnWBFAesQjYroqEpr8wIvh60/C2O12p+lFpGX+I9+vGnEo7XEF7ikc
         WyhIAGjpwmqfNX3uvINJQzsgCjiGxfzsuHnfeSfJxBh9NxIUWm+HRBJvKhiay+4hLwxA
         wRa/4zybsbzLPFuGhDHTkOES6vCgDZ3kVgSoGeUQ629MMLuxHLaAGBGIxpmb8NCe2VaN
         W/ibIZWLFgkg9WVW54rGTJE6jCh+R6tewqgOXXixRH0qycvyqq4m/6pqL5gSgg7a4Bxq
         NEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779380060; x=1779984860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dyt1TzRyN36X5hR8tAOgPi+dzA4gZF2bfoIRk7jjmc=;
        b=KPhLlfZM5s4eZ52QW8mdGRtZC12FZdQ6epOWTPn/ALVPHvAeN+BcjBvo1xzWWr/nPF
         0hb4FOw9eI3PtYDjji3hs5MzsF1RXB/dYrcEjSGK5KFaAVPjAJ0vXpMAGIbAsbJvrZOF
         uFLCXy8Ijg2nogcFaQ405sqvrd1AuRpucecoXg8FfI3vN9A7UUMI64NSwwgwDSBFXld6
         yGeY5Nf7YejJvl14z2zoQgHHGL6HosU5Md4pqvIouYGF5ZNUEND48Xq/K+3AmOyXyQm2
         8yEqRoNGy6sBq1uUTtbfvBn5hY/7Kn5YSvOnIYxkmf2WLnnTnfB20znSrL3LEoihhALk
         jBiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JKe/+eMQwXceGjSDfuGZKAzsHsHWtbtUDFWl/GbXJzBeBUO4M3CJt6VP0fqnsl/N52j38s4LB0TeunoOUow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/BN+YOc5QITjnVCO2WTczNRy0y/KYEUbYE7GRiuN5u1kfAJls
	98T/fgdqltJYSb/o+WA7sUiz/xIjIEB8E53PAemqeq6g+iZ8SRrIz9h5
X-Gm-Gg: Acq92OE0af4wk5xCR+it7SQ/2EEu/61dMYuFwBI3akbfN9OMzkWY9LXlkJMXgckBGUj
	CwHDJptrnfbOS2LLvtT39XnjOKWC/Y7nyYb0AUWLJbnBzdI0pnCaHRHUd4HGi0b5DbtXxX+2Xti
	XPYccbaIzldexRqPnAQieH5/SIWBPFZKyEcvDT6gq24j8Jl+uB8ZDzp5iGE14O2oCnHO4Kelhiw
	DZOu1q/oJ85yMGTTlvbJIXTWER/oa0KLN7ogfH/0Kr9VtvuUHXVcnx+aNuBzkZi6XQkXs7N9HnQ
	FT3ZDfrXef/lowBiXVWnam20pU91tTYWB7a8Bo6WLRIRa1LezSoQqEMhhdVUitcLZTzLGqBx7nL
	I1YWVkUjlOex4eGA2DxfDL4b2zMPqVreTi9gvHw7jdboaGVq+z4Evm8FdhhGDGjKc/7tfce5Qt5
	Mm9BeLBY1KO6btotELI5bJxQPPciX+N2RgYI6Lsf96igK4Iq0=
X-Received: by 2002:a05:690c:9693:b0:7bb:712:a74f with SMTP id 00721157ae682-7d20b08586emr40415707b3.17.1779380059799;
        Thu, 21 May 2026 09:14:19 -0700 (PDT)
Received: from CachyOS.lan ([2600:6c63:417e:cfdc:e26c:e9d6:8bd3:e3fd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2ca76a8cbsm4621827b3.32.2026.05.21.09.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 09:14:19 -0700 (PDT)
From: Kenny Glowner <sisyphuscode0311@gmail.com>
X-Google-Original-From: Kenny Glowner <SisyphusCode0311@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kenny Glowner <SisyphusCode0311@gmail.com>
Subject: [PATCH] rust: module_param: add missing newline to pr_warn
Date: Thu, 21 May 2026 11:14:05 -0500
Message-ID: <20260521161405.64042-1-SisyphusCode0311@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a trailing newline ('\n') to the pr_warn! call in set_param to
ensure the kernel ring buffer flushes the message correctly and
prevents log line smearing.

Link: https://github.com/Rust-for-Linux/linux/issues/1139

Signed-off-by: Kenny Glowner <SisyphusCode0311@gmail.com>
---
 rust/kernel/module_param.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
index 6a8a7a875643..fa26089be2e0 100644
--- a/rust/kernel/module_param.rs
+++ b/rust/kernel/module_param.rs
@@ -63,7 +63,7 @@ pub trait ModuleParam: Sized + Copy {
     // to be null here.
     if val.is_null() {
         // TODO: Use pr_warn_once available.
-        crate::pr_warn!("Null pointer passed to `module_param::set_param`");
+        crate::pr_warn!("Null pointer passed to `module_param::set_param`\n");
         return EINVAL.to_errno();
     }
 
-- 
2.54.0

