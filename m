Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86BF344D81
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 05:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009722; cv=none; b=ix85yMfm+Ao/xUaZyAQh/tAvqdJaNqCt/1DOQgL/+GAV3BlrBREWtb7cqfCRMfiDA4BTpKJ2by1MxKRQ/d+6+FRY3EbsnXDd3+n/Mrq56hGI02LVUA4om0UXkBFU+X0F5RnthGEfXwttZF31CAINEoU1e6CTOwvvNHT2cXE4vCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009722; c=relaxed/simple;
	bh=g4L7C9uN0rpytwf/MlwodVI8K8mAxgIk4T8HtuH8eBk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6ca1G+FtAr3+0A1BSsoCu1hlRj1bwZmoK1ekG5yhbUBPPVh8tGWCaEhwfS3tEIBzfDY2kUZA4nGChaEEYTxuLk3UIyIjx2mvD2vDLCxUAt5ctXIJWqbhqB3aPmayHlfumfM2WVpj637Fta7O4dmvZVjtcodcyk9b2g1NJOuFcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qr3x8mBC; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qr3x8mBC"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b461310af5so29212835ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 22:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009721; x=1777614521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUmefGJqV+IRkFPz6sSuv3GYeINth0c7dueYg2gp07o=;
        b=qr3x8mBChy13xrFs2CI618m0GGybqCQ3y7V2uDKDhW2FCCRvwFLoXceP1AG3dxHjg0
         aYhokGCtCuYCWMYFQq8kwi+KBz/Pkl68vQFAGrOFh77BC3Q94wCtMLEunggzxc7DoWtj
         Jy1up0zPtxiZySk2DzkoDJioXsry/7RjDbcARoRBFQae9HCkkcUKw3LicjvyD/T+iN2u
         8vXt4ibmP2Ej9GQg0p77h26T39Rvmlsyw7vsz/b2ywyeIueiq7KXnqjep6HyJPlG24BW
         3cozFqVWo0eNSkiSW5DGXjEdI0ooT3eTkYpulHn563zc5lrAKml8wmLWr8eelzj5i+db
         MlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009721; x=1777614521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUmefGJqV+IRkFPz6sSuv3GYeINth0c7dueYg2gp07o=;
        b=X50tyQYI1MnCSrlwdLzjHTUL9IKLxIEU+gWRAYapJIf2Bi9EuQ2Lqs6dehnL8CY++O
         9iZXqUTHb8MjyzM3Poa48YC9ZnMlhR1qY0aGrgNX3kF0ENpW/U3plibR/pM6V+jGFY/M
         NAR+8CQ8M7OotkKKinj62Cgi+jE2kGQsFel2aLev83hUEioLyyIsJKYappdkbwX16jWI
         CZu+HiW+sZc6wMEippoBt6gA1NMyxJ6tUTyt+JPGGgf/4TN7mvHRC15PkvMvOJwpUV2/
         aGKJbEu5+ezq7uSIdMUTPROyyPYBlF8U6Ik2cFkfNzYOtYpFeV6l4W3fcS7W2DvLPFx6
         7L7g==
X-Forwarded-Encrypted: i=1; AFNElJ85FQenki9jH8QGAqskzzg9TCb3FjjCLLaPvrVrfbflKOTkmX65fH149YWqgg6DNPkvr17uKE84woq44Vtxkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw95L0Gp8/+zFDTdksvtmuixT1D24gIk23pqj2gON/LCfSqIn06
	ky6Z6MaAj/rvhQXntL7kO4jwD5RTt4ByGfF8EbgDvJwK4nwgU/zh/jDX
X-Gm-Gg: AeBDies6Xk7MdRLsR6f+5XbmRzK/EUbTl4NOj40b5rzwjD+SkO8qAC+gpSWzDl29xop
	MG5r+ym0HWEVfR8kjVo+fOPbvRIIdbOZy4rHS79RTnVOmNsQXzMrzBvbBZ6nGHdifJeJ5ftRyDh
	pLgJzJ8AZFZlgee1vbJFKONPxCkTgpWefJbpRFHUuZadqgpbfbmrJ20D/aTwv6OiXEAwMgqGHO3
	dwqRvbEPHs3PO4/VsrYdQeYaiBCaC1BVUA48bEZ0VjDBN6NBHHIf+4Fj/veBvGwEECylmsOn5U0
	oRGSz/Z2K73jHbjk7kyUcuXdn8y8SmydqWUyIY+UdpNUpn5hKObj4uMA+ewWZJeS+vmRJxyj7qI
	CAde869wF5hs21R3Z2snfG/f9QH1Z+0v1uTxu9Rmpt3usVY759Q49DaWAS3pEN0Xi6hbpIIIL3v
	iSjPQ8y39GLkv3ZDjuoA7kj3g1IC4Zs3go6Wp3mvg3+YU8hxjNkuSpKIrmFdzi7CFK7ttQWr/Kj
	Wy/zaOZBeKr/vk=
X-Received: by 2002:a17:902:b195:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2b5f9eb272fmr183181305ad.20.1777009720961;
        Thu, 23 Apr 2026 22:48:40 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:40 -0700 (PDT)
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
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
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
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V13 4/7] rust/powerpc: Set min rustc version for powerpc
Date: Fri, 24 Apr 2026 11:17:39 +0530
Message-ID: <20260424054742.45832-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minimum `rustc` version required for powerpc is 1.95 as some critical
features required for compiling rust code for kernel is not there.

For e.g. Stable inline asm support which got merged in 1.95.

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

