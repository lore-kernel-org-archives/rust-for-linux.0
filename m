Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE262F1FEC
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499166; cv=none; b=eRgEP3EBUR5zyI2ammSmeYFw6hNYbLgWbtgLhUdTJtHdDqoSbYsVK44qXKaovVqBvo31Xgh6hTCUNjfiRrhfCgjBvaqUYSTuUAPSthp92KwMhWhUTc3y03S/3yOk6M3xnZGf7K6D+R7nY8pSS4a0jP1g8/h+ZMuJDnq1lw07afs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499166; c=relaxed/simple;
	bh=DslXIw+GRv1wOiIX1SNqLhsBYlKXgQRISJI63XytIB4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDVNyFHVvBz13G4ilDVQ0YtYCFW9+zCsr98vI9IokuNUJyKQ71IJcvuYb9dIfagCRzoSLNzzui8ps4qtRA++HRH+9z2hrtxC1zW1K7bGln6uYpkUAlvPjfc4d7qnqpjaGD27d6ABPMCc50ZXJX97Il7BCuaJ1CCeJMy4lw31Ypc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApoF+5Dh; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApoF+5Dh"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b9d265355so419484a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499161; x=1784103961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N7/TgPupofOaFBPAX2pw0tL7gzCEKb6TKZTW3jPqY/0=;
        b=ApoF+5DhOlSxoxpuCyPXy4OAOSYcmmmu3agP2jwCIu1KA1sONWOrRqEfU9JfgbSKQs
         yb27tqRuAL5mmjdxg51ysOEYV4XnfRFQT7hXLBIUGgg0ShssvJh2TB37x9bqOIcMwhJ+
         OMyqk3dUgLrZ0knyXKkEK/jvf/DLSfXggUD7SszYIXWgw5VsPNHVguG/4MeXBOUk2k2y
         AYb65Fds2UBfLohJOj8xXXZpQ3QPm4Ovpw+WxcGazm3Kw5QCduEIsC1e3rvxO604djKR
         wDQ4GjJNOZQoInkh9qADr7m+uTwInoghy1O/yIsevS/MwCL3JsvRVxxd6d0kkzZWYiMF
         +D5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499161; x=1784103961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=N7/TgPupofOaFBPAX2pw0tL7gzCEKb6TKZTW3jPqY/0=;
        b=ZYpV+vDO34PCEijO7BCsRW7Qc+B+fJcoCp5cTZW6xh6aWdglzAZB3k4ji1fRvbWvGl
         8yJfQR274NuKCQ5lYp23b/8QmHneAdDhJdMkLjLUT9WzYwbEQ7d/JI418oYvRJRrjU7U
         6bEjjqtcs8J3YcAbufZ2ELIi+7trQKHWC455CxWxrXt+ygJdbj5/zHwfMCxiYpuixJoR
         mwBia5he79Hr7tIjn6ZhzKXQDXDCLUacShojWn+qUWOoq/q4kl41105XUWJZ4+T8UAAD
         M/Hhf3RmMego/yTwYhGYu/DNcfnm0S6hi5nqFbXg/WnGTxn4G6lRgpZ9lk9CXKIHlYwO
         hEHg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7fr/nmT252jcBxj1p4gpe/HdC8nlCzgPrr16fUdb21sLLfiqixMzamyGSiYVv98wBedT3M7ZfDFmsIPI1iA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9C3CkVclnmMJSO33wKoXSmM/ht0rF+pRfokBhIiSP0u4o6sHF
	UUFlIKgznxpyAYdLrtjeWwBjHeFIPd12w3d+mnX5F6T93BS8JbqW2VLx
X-Gm-Gg: AfdE7cngRu7yHcKzdUhNCXHvEZSURxn/DnbHnLtG+ppwc6pZJNjbRghDNF2PqkGffCI
	umUHQqVojxngyW7NrJuXINI2agzuwSiCw4y3f/m0wEjl7QSbXU+pzMVnG0FlrI1wYc7/vIBcpi/
	2e/c8GgJxhlL5yXP8hPdgCNFPEjb/vKT2kuiTxg92v+QFqrpup0Jq94zcfsbtibpMwZV6rmgTWi
	zZ30kD0KIJsi/kqFR759wAcq0UOVVcfsfAKbxajIS0QSNEzmLrbi1dUDDwrCbxNFXyKGYeFQEBb
	tJ1mtqzcbsClyB8GmVSWyhCcdek6rYHhwwqmNFIMVfZ/3JrdLKRZUWxcZJB+MHwUGhHQxcR9LmH
	cSuUz4QxE+UZ5nIjzd1u0K+qXzDX3P1hw84bd6QqCRBsW2bcL18kmwZMPDBZgDPnYB7cqI/MM3x
	FgRcEw8k7fKJ9nWzY/gjKWBIVf+rXDFSzE2d43JSKTgYVXtcaYCwGsrOGqX5YFAyL7dA==
X-Received: by 2002:a17:90b:2d89:b0:387:e0db:bc23 with SMTP id 98e67ed59e1d1-389420ad00emr1735318a91.35.1783499161101;
        Wed, 08 Jul 2026 01:26:01 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:26:00 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V17 4/7] rust/powerpc: Set min rustc version for powerpc
Date: Wed,  8 Jul 2026 13:54:51 +0530
Message-ID: <20260708082454.1254320-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708082454.1254320-1-mkchauras@gmail.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
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
 scripts/min-tool-version.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index 031f2192b390..99bfdcaa3396 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -33,6 +33,8 @@ llvm)
 rustc)
 	if [ "$SRCARCH" = "s390" ]; then
 		echo 1.96.0
+	elif [ "$ARCH" = powerpc ]; then
+		echo 1.95.0
 	else
 		echo 1.85.0
 	fi
-- 
2.55.0

