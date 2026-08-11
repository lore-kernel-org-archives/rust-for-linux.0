Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A04637C0ED
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 06:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786430049; cv=none; b=CjmnaYnSTC6hsMCylr3z5RDHMx06Lew3XYkxUVu85gqz5WzVAJPCrSbglC3kjBIvSUMKg3nQ1xyfFSm1mq+giQtZUY5wTHS41wqC/Da/2UXKEDWAWDU2gILFX+vAczlLksDsfihytSx11Ml9R5GRxRzPxVLLko4mOjmXayQpNls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786430049; c=relaxed/simple;
	bh=+7GhGXLEGPUz5iGB4uoeLstXKais/dJAz3maZh3x0CM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qkc6OUo1yMRoNABMsiFB8vVgI9Cw/P+6aK9cNqU9m9T4TAP3mf797WhlGXVVGSl1usrRS71nIS4V9J33xI+Q7XkZVegzEznmVy8tBe9IvFIIG/Vw4j5TKMT6ITUI+z8ZnmpBYjD8kaSBkhxT36O56VsqKcAcrR24+StcgxK1vsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqkOomWa; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqkOomWa"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3811f512167so3783878a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 23:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786430048; x=1787034848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e7G7fEbJZ8y/XNupU9AJh184DDjemZTaOluaGNPD7bk=;
        b=KqkOomWaZHhGP2eKrTA42W7qVaKBCgN+ZGqFOqfdlHlc8Y4giHn3Ekij1WAGqxVMEN
         DnUoPwA919IwvfQ0rbb2BxJrZmtssTzOwEorwDwAmTo+atTULLy+JDuzfiX5wq381IvO
         vP7XdTtyYmBoCag2cKFk9oKcD4Uqvbtv/jJkHpPz+UzY1naabHtClOKURMwxX9zZH8xB
         6DaP8eErRt7rf2GhOFR6vPZt4MqJOxeRg/FKEMXsNPOOE8XDjPV37BouRyCAkk9JMoHb
         g1Ar4lLCel6OpN1nS867Ygl35A/xIoJeFrjX35+lLiQTflEWtXHXMgmRQEVbnJFyZPax
         NLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786430048; x=1787034848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e7G7fEbJZ8y/XNupU9AJh184DDjemZTaOluaGNPD7bk=;
        b=lJbjhQPGjw9+Tf0EgjYvc3ftLV1ru2E0qhvkZPK2kc/Fv49imSC1dhKuvhsHDb/mgx
         ng0DLsekF1r3/sCBxqztXs0CTOl9mV3uFppDFaOjyTym+kGnnA0dncV7+C2DGw7DNL8F
         erMe90jWn9sx4anMrbudNCy7wLbMyF6safvHCyi3sadPGVS47VPjZCfvpDUnA2WXD6wf
         0HXc6v10EjzlUXUn+H61GQqMvrnvvFf13dsszfhhYfDnbx1xCyCQK9bK4y8hWSmjUTsF
         I+peo7AE5/815iV6w03aZkEwXa1lnsR4VaBeTVSI9Ht2zYLSGAWnkKeZk2RW0l38Bmz5
         PVvw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4rWvQRFAeAiO7tuYfJw2lYBzaVe5OTIvMep9Hhbt2MXEMurietUo0VmmePV3is4I5G2T5YFehhxOd/a53uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpgDsuaIJ/svX3Un9MUicA3WotPeakX2FewPv3nrvOD/yqzW7R
	X73OUOoKnRzgrqRGI+saVuMFrB2WSz/jC/TFV+hBPn3kG4uCFa9GJsZc
X-Gm-Gg: AR+sD11X7F8BNHLbRtzxpGptdQmjcYU+GZR8Yi6r1ACypJBBhhY3Q9mJKLuRsOw/y9F
	VLl+xe1Dhzk/b2HVpv+a4jTb6UPFLV5mSDRe1c3PTJerVFnmAwWiFtkL77nM+Vl3xJxv99KYtHG
	efDqO5vFSIPDDRa+cXl3qHE25SqqecFkvFAXaUk1vNU+IYpbDt6jFT6bWJH0/HAkINTlFkKMfKV
	fXNkwhml5yMZP9PHp+JvIE2Ypmyt9C9i79j2dVrkwzCSn012DZx33U2RmUZxu+SHeEVpcHSBkKO
	K+bZDWmTfa5YvnSfv1sn4YFUu+8cnMqlamsjpHqrEHYKWbN0/eyHzNFxZDiRigBjS5VF7kXnb7s
	1C0KuZHEkqelg/jRtaOolesvbkY4GUys1Sh7mhrgVpPNG+IJl/VRqctv0ivrsIruXGYH9tO+TpH
	mCFKoYXO2I4uNvToc3q+Ek3yf4bvrAkKdJ7eoyoWgpmR9/zQX3uWkBdWCuHxfz7vvuXyfDS8ZO3
	caMu4AvRmnEszGSkwV928HeStC64vsNbthTq/WDxQ==
X-Received: by 2002:a17:90b:17cf:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-392ec33737amr923917a91.5.1786430047553;
        Mon, 10 Aug 2026 23:34:07 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d537d905sm2248330a91.14.2026.08.10.23.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:34:07 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: ojeda@kernel.org,
	boqun@kernel.org,
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
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	cmllamas@google.com,
	gregkh@linuxfoundation.org,
	mkchauras@gmail.com,
	paul@paul-moore.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH V2] rust: uapi: replace direct asm-generic/ioctl.h include with linux/ioctl.h
Date: Tue, 11 Aug 2026 12:03:45 +0530
Message-ID: <20260811063345.685884-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rust/uapi/uapi_helper.h was directly including <uapi/asm-generic/ioctl.h>
instead of the proper <uapi/linux/ioctl.h>.

On powerpc, <uapi/linux/ioctl.h> pulls in <uapi/asm/ioctl.h> first, which
defines _IOC_SIZEBITS, _IOC_DIRBITS, _IOC_NONE, and _IOC_WRITE with the
arch-specific values, before falling through to <asm-generic/ioctl.h>.
By bypassing that chain and including <asm-generic/ioctl.h> directly,
the arch-specific overrides never ran first, so when other headers in
the compilation later brought in the full arch-aware chain, Clang saw
those four macros being defined a second time and emitted:

clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]

Fix this by replacing the direct include of <uapi/asm-generic/ioctl.h>
with <uapi/linux/ioctl.h>, which is the correct arch-aware entry point
and already maintains the intended include order.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608050618.9dekfjtF-lkp@intel.com/
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
Applies on linux-next.
Change Log:

V1 -> V2:
 - Put the original warning instead of trimmed
 - Put the base repo after "---"
V1: https://lore.kernel.org/all/20260808032143.2767112-1-mkchauras@gmail.com/

 rust/uapi/uapi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 86c7b6b284b0..489748ef642c 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -6,12 +6,12 @@
  * Sorted alphabetically.
  */
 
-#include <uapi/asm-generic/ioctl.h>
 #include <uapi/drm/drm.h>
 #include <uapi/drm/nova_drm.h>
 #include <uapi/drm/panthor_drm.h>
 #include <uapi/linux/android/binder.h>
 #include <uapi/linux/android/binder_netlink.h>
+#include <uapi/linux/ioctl.h>
 #include <uapi/linux/mdio.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>

base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
-- 
2.55.0

