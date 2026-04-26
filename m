Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D50359703
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201243; cv=none; b=JCa5eBH1u1GmVuYNtxIVforwUMg1skD8zEBF1os97XC5hrafQCRvscWdl/cdSDx/l/v1URsZKPSPKYjkK8405qeI8IEfn4IPipvFNspMfI9LF1s+5LK/O9VadcTyeet0gC/SW+6CfvI6WW3pyq87uQGSyOLjT+w+jx4cYjEt5q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201243; c=relaxed/simple;
	bh=r1aKh5I901VyW1MTDbYbzZkzaliwYbiMtV4wPKGZXxM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRc4OG9o8pmLv1ffsXLkQY8W9xRVBm3edXbh0S0GSQUnryC8CYfzYc+389FF73uaEmYrCVgD1i19CJDVkLWN4AbxqYu0px6+yCJ4kmscSPVI9GmnsRPMN7dG+NPe+X+1XtRtA6L8LDS5r60ErmLa3fvj7vC4T/tDClcIebfEFec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMbfMKAi; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMbfMKAi"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so78903075ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 04:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201242; x=1777806042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKjAi9HbHD3A8vBvpsVmPpMZEiOAHaxheYu3agjVGmU=;
        b=CMbfMKAidMbeB29RqxtuvykHyu/bjvrAjPUDA1UL4M9FXchCxCkGfBokPYCvZtwyge
         g/Y/BGmqxKQIbnE519jIGH789DPPG3VIdAEoaW3qYmCpk9j4Ts1Uak/hNqEm8JU5jQ/N
         kUsN32MZ860ba9lrQsacPO/wmsFcTd5bAYaE+7vPNBFcJf6BHBQDthR8DlWqmTkii37l
         OFnNSW6Gil3xUxIW81qrDTaloMtSzR5ytNc9UzKXSvBEn7XtE4o4yE9dMeI7PKnJwh9A
         vzooHdE70GO3EqRcUi6HF6guxcx5oRRV/zuyQoW/aAn3OwAGRnd7POT1CC8NGnjUKDu3
         0Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201242; x=1777806042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xKjAi9HbHD3A8vBvpsVmPpMZEiOAHaxheYu3agjVGmU=;
        b=rgO9x5zzW5Z2Wie0cWLgXgHLJnfAlAP5FSoo+h4z0uNueotACTXoQ15RHJpO+Ct21z
         fO1U+FmfNDq+Ge7cKqkYYPoJUzHb1+iUHI/gXE18LdCdmL1itas293JtdDS3EaVQ+Ccn
         V1z4U0WUPdQ+g5+DLhsCKAWZF3bKR6BuppGu5o+l0gpUaQd2EfGBj18IghUsS9m8UEXA
         QllZASCRM7IdN1bc9BEi874a50z08fW5OgJlMa8FUj9pOXZEBXBvx5fcaeSPIj2kTsQT
         MUOa4OymNwgeX6M2Ug694pYyWdZqLHzALwfT2vJHr63tNCpGpMVOs3OoyZ+4cX5QB4KT
         EdXw==
X-Forwarded-Encrypted: i=1; AFNElJ/RT33uKNSCldlCFKHqfz25fSejzgHvZ+rn1APdLjABzc3KwLupnJBV2se7qkwda5k0Kyrb9ivYKroFvl25yA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3L+bXir9Zvn1h+jFi+Onfg4AxZsj7Enk1QVM8u8BqClBam6UU
	45Bq2XsVoeYMKE1jVIp4Lxh1dW9YnCgSF6EAxgJ/dM99eT2hCbGDyb0X
X-Gm-Gg: AeBDieu7DTrlla0JytJNW/cnG7ZWUzIEgZXoATthIih3SpraZE9kYq9b7WfXVhLXE48
	da2f2Jjo0rk5VQtJxo8odImVpSKQYX/Q9yM7CEvFHoYLflwxVfNOHMn2UT3YHwgF/MvNlHtIchs
	1v2GZLDZhI/NMW81oAI2TGqpfvm0TelcjloiOJ50380j9p+wLsVJ7Z3FDZEhxe0VCoYmVAK1VE3
	cIlBbXnrZt0fYNwz3mHUKEOU58+nHdY9nrPg1L2GryvlfA7vFsevlmauZUVXwT/zchQLp06f+FT
	Qqrk0MvbPyPUuuJW/5hO7vORnhY229fI1MNEA7nqsURFC1a/lYJkQLjAvLhS0W8V2Si8w+H+x3D
	puchD5F7vF3j/j4ZsXnCSKceID0Z0acRds4SSoDAy0jVzWoedtnV+4gz9OkiJGqTeuwq+fw6rKO
	3HQ+HknhzmeT9U1+9+KN1MFqgykm4RMVg2jFNTK+/HyJO314JNqnbpGhYY00Jb4nqt+nZCSvmM9
	0g7xyFpb47qcLE=
X-Received: by 2002:a17:903:32c9:b0:2b0:5923:5194 with SMTP id d9443c01a7336-2b5f9fa70e1mr403887325ad.27.1777201241796;
        Sun, 26 Apr 2026 04:00:41 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm256667235ad.29.2026.04.26.04.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:00:41 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mark.rutland@arm.com,
	mkchauras@gmail.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V15 4/7] rust/powerpc: Set min rustc version for powerpc
Date: Sun, 26 Apr 2026 16:29:29 +0530
Message-ID: <20260426105932.2270364-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426105932.2270364-1-mkchauras@gmail.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minimum `rustc` version required for powerpc is 1.95 as some critical
features required for compiling rust code for kernel are not there.

For example Stable inline asm support which got merged in 1.95.

Link: https://github.com/rust-lang/rust/pull/147996
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 scripts/min-tool-version.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index b96ec2d379b6..406895621511 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -31,7 +31,11 @@ llvm)
 	fi
 	;;
 rustc)
-	echo 1.85.0
+	if [ "$ARCH" = powerpc ]; then
+		echo 1.95.0
+	else
+		echo 1.85.0
+	fi
 	;;
 bindgen)
 	echo 0.71.1
-- 
2.53.0

