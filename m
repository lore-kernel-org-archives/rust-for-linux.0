Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C174F3603C0
	for <rust-for-linux@vger.kernel.org>; Wed, 20 May 2026 06:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259660; cv=none; b=C2voThxI1kqnjTZbzKGRQ3Dbg4fGovmf0LstOtyIjYipvaXbWD32y0tzZHSn10ckEvbtqEQGtAwimCQWtIFGkPIT14ukV2xntPnVTddSJG98rUkh2KdnF3Q2EQDxJE6/kA/i9ivYHz5rfxsJEPRiRqaG2M/v/hmRIp9eRTpsE40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259660; c=relaxed/simple;
	bh=IE7Rc7fvs9GPBV/ek1LPWWvDTbBnI90elNYNDzaduxA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YlbVEB/wgFnl52G0kQlpnhax8HDZKy035/6KTH6Eun3mCVLgyq06AFafw3cy7WPqVR0piPHGJ8I1lsASIy+pnGe+6gaa0fNzQFg5TefNaAoI4nRSy823/ehPLvZtGKQuww3f9TvI81xNF0i8O8rPNJPPCASlj3GKyqA9QbxPSgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoF3alV/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoF3alV/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-366375c4076so1640616a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 23:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259658; x=1779864458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAXxYbsc5I9eqWTeSv6j9oBSm3zo+5SB8Z+tNOyX718=;
        b=BoF3alV/OQLT1GXcx3R1TiNauBdZs3Brl5PGSkbsrJx6chQGCB48JOPN+CPhMW0tx4
         uTwLh3mErm6GB5OaFwmA2kAyAmGJWrnnX/tp/FCx58SaYNmz41c4Hto6Iy2D6qR9t+v9
         LkHNhJ3q3UpNsQ1cT3PPMc1H5/wesFR4MKN+544KfPaO8YmCg7QRjui5+j8/ahKSlSiS
         GF+GBJ4B4B+wfXLmkAVz0CNP9FIGEzhql1PiFwp83N55SwTCD/YcHhVQ95YOw3EwcYjB
         mOPb7noas585F14zxjxb7po2htG7ae0AqSXFawHqW0VTDnHTBASjUuzHr34dCb6kp8zH
         ppTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259658; x=1779864458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yAXxYbsc5I9eqWTeSv6j9oBSm3zo+5SB8Z+tNOyX718=;
        b=m6MsjYdDFcDPf+YGGMBMHVuKFQmGXakjHq/W6ijpKPWrlBR4WDTtz8mVGb3rrfprU/
         qUzzKuw4OoUFr+WKoaN3034QvQF+N7ldQrnZvhLL3EERklMS9uk5JrDxjF4M+IyCERjb
         eW4aTzfigSPTsWb5PKIrDM7Mlm5/HRFE+YFdN759pfL7VhmLgh8Kqi0XhmS1ODa9ASEw
         pBZVBqgLuGHFg8ZDQHAMLXZ8/lg+opXmyGZIN0pAOBipJCI5u3Qco2laT2Yw7ImmMkff
         1L0pIUNtwyAQdkkmI6+fEmFhE6+LtlS08cUr2Dc1Whr2v/Kk68ZyRkfA6gc5UrMQtDuG
         crHQ==
X-Forwarded-Encrypted: i=1; AFNElJ96kC+wIyPwgLSPkH4VEM3MqIhqkSY1sk/CYt9UMM0f5CkZ+DW7dcRpfIobQp1g+ZCzH7bLYZvDMlihiyLg1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YytOJrrTt9nL8VzNzPwH1Bno5r5h9+VImxbniSmHTcSInsZG+RE
	D+7VX6wSuif5ZihDPOVea561UQgRX6CvzOSBGm0g831eDx5XrIe3ThUs
X-Gm-Gg: Acq92OHqKdzr/il+nEYFrtUJRRI5sHnpSbfk/OVbnwLoCeg4yOAjWdq2sT6SPDW43o0
	dXZSm2ILBi+uy2fxIk38PBnI+HWXyqEL9rSxjgU4w4R40ynH0E9YLptplguBEqyO5mTL4+FvKU8
	Mk2obJFHCqFg+evVesTfW+3j5ndpiru0drqKwfLxYKk/XwLhySjJfYhiaxCI7eX+hmbcbfXs4L+
	RrvgFSrmEzx4w0NdTKziRLEQSr/vJ6w+u2lDpwQT+AteyvqeAfl/rCJtu/h+julDXphWwKTEmFt
	i2ziOAtlGqgZ+W+p6iQnULXLLJ5ZTe1RjJ8P/50P0T1dwxICUkGVWfUszEMZmHxI/g5fZJGptBa
	GEAN/6FbK1ijAvlLicUe8Nlcxe6sRyro8qpCOtuCce7U3KDS0ra69DSvvJKvKhnY04nLrA8GRQu
	tmr5WzwoCJ5K2U8LccvbQ5bhpMgwsRkdoLBjJJPWnCeLAjHQUQD9NuPhX6GvSBz00mz7wcq5w7G
	d1CVkNabCFtD9A=
X-Received: by 2002:a17:90b:5688:b0:369:a9e8:dbf5 with SMTP id 98e67ed59e1d1-369a9e8dc51mr13102353a91.3.1779259658100;
        Tue, 19 May 2026 23:47:38 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm6069970a91.10.2026.05.19.23.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:47:37 -0700 (PDT)
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
	acourbot@nvidia.com,
	fujita.tomonori@gmail.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	tamird@kernel.org,
	kees@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Date: Wed, 20 May 2026 12:16:26 +0530
Message-ID: <20260520064630.1785283-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520064630.1785283-1-mkchauras@gmail.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
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
2.54.0

