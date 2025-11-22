Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA36256D
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763800339; cv=none; b=nhM1707tXEncQtzG0r81rVJeNvrA0fE4Gxhq2tOyWMDrtIMdq+xakBBS9wpyKMCaZ8CSuW0g2kXQ1KwzySvHtJKcymTS7nGS9Gm44A0+kIvACZNj5kLCrBuZUAWDC4Ucrw+OkxUDTx9yVI+O+1eiJBVlew2xX1w6Kpr/zsD7cNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763800339; c=relaxed/simple;
	bh=NI0a2+NxTLNaAncfw03WaxjaXYWkR+/6uAcLVAt3dvc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oQUVq5K5lPXBCAiRRQ69NDGsJYPqzg4jJ5q+7pyokp9lvx0H7vg+BwNEE0h8/d1HFVTDWl5bb7tYJhPadpFhPAkRYihJzGTQXq5OI1YuRtRrjOfjeQBnICLxJE0lXTUmOd5QGPh746gUqQoueX932D4cRJoL1Lxn2iOcgGyJyOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hYQwQz5S; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hYQwQz5S"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3438744f11bso7554819a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 00:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763800337; x=1764405137; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tjw8aI/2+6BpvAtWs9pCDpeY2rVZkm/V2EMdU6q1xQI=;
        b=hYQwQz5SczpzUWRCH9a8jBCceHwqc6HyA0nf/ClM89wZ2L/eNmuFFduEgpdSDAbhop
         CrJTGHj3zbed6l2E2L2UqvNszd80zJgdlweOTtuyZqg7b2f7FmRMO5bmmJItiX9R34Oh
         Idl5Ls70VPFgKntCsDNomkWaYuEkVPJlTJT/XPD1kDfrbPwSmogEM6amVo7/oPZ1GBXX
         UyCrTodtrjPH2w1s+jVEF69cYEIj81XuON9HTauGesZf1RcJC5d8BE5VIfTsG9SYtHXO
         H36vVmIO/1eb+NcIucGDCdsKCkq9yTyPO6k1Sc45YVuCVwBKL70kOlba28VF7EawQh7e
         LIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763800337; x=1764405137;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjw8aI/2+6BpvAtWs9pCDpeY2rVZkm/V2EMdU6q1xQI=;
        b=Z0nBxzLdNb5TGJlCJAUwkRP5klHwTo+CVvx2xqJ8RBKTwQBGHuZ9Xa7Sb5NsUXTUEp
         nGLHJiyMTp0zqaOsp9owFvXQ/btKKtUOCiZNNSMYJMHtOwtdANYbgDQ3SbVVbKE+red6
         XHyVMyeop7K8XRVa/krzoLWDVXNv23M59+x6U6zDe94zol/RHs85sLwFPvjwYD939hj6
         RjmRFpku5WmHD+15e1rN70eW1zoouwjuwhTdYx75G4Yvaqaa/WR260Aim3O6tS186g2F
         C67JyuenWJj7MivlQqiYboL9E3sVf8FziYCkN0BOuSst2masRX2VQcy2CCnr5rxkMvmn
         lp9g==
X-Forwarded-Encrypted: i=1; AJvYcCVte9H+fuXyaXVGeaBqL5RSb+w7i7pKpHfpJYmBdqKDEG/xHVFwJRN8PlldNZxZvJizxYDHW9sqQkOdHXnq2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaxOwtihXZ4Nj84Ii1R43tbdpbjqpwKHqw1y8paRnfuUrNpIkG
	KRv6J8cL/Jfk4B7ljwwhEMxrnEznnJfMhDPoyhnO9+xhvUucalvEwGNdCATfV8dkNYmM/ipfs6+
	M4poNmvQWEN+yDg==
X-Google-Smtp-Source: AGHT+IFpm4WPPdyNkn7T9C5i+DiRgpU+Gw7XnL1ezBCClEJfss/czSHMfxCJTpkY6PfTfg1L3XhRDYgd2jfgZg==
X-Received: from pjbpw1.prod.google.com ([2002:a17:90b:2781:b0:33b:c211:1fa9])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2c86:b0:340:54a1:d6fe with SMTP id 98e67ed59e1d1-34733e60868mr5397018a91.15.1763800336865;
 Sat, 22 Nov 2025 00:32:16 -0800 (PST)
Date: Sat, 22 Nov 2025 16:32:12 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251122083213.3996586-1-davidgow@google.com>
Subject: [PATCH] arch: um: Don't rename vmap to kernel_vmap
From: David Gow <davidgow@google.com>
To: Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Miguel Ojeda <ojeda@kernel.org>, 
	"Paolo 'Blaisorblade' Giarrusso" <blaisorblade@yahoo.it>
Cc: David Gow <davidgow@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In order to work around the existence of a vmap symbol in libpcap, the
UML makefile unconditionally redefines vmap to kernel_vmap. However,
this not only affects the actual vmap symbol, but also anything else
named vmap, including a number of struct members in DRM.

This would not be too much of a problem, since all uses are also
updated, except we now have Rust DRM bindings, which expect the
corresponding Rust structs to have 'vmap' names. Since the redefinition
applies in bindgen, but not to Rust code, we end up with errors such as:

error[E0560]: struct `drm_gem_object_funcs` has no fields named `vmap`
  --> rust/kernel/drm/gem/mod.rs:210:9

Since, as far as I can tell, we no longer actually link to libpcap, it
should be safe to just remove this define unconditionally.

(If it's not, we can possibly either disable DRM Rust bindings under
UML, or move the redefinition of vmap behind some config option.)

We also take this opportunity to update the comment.

Signed-off-by: David Gow <davidgow@google.com>
---
 arch/um/Makefile | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/um/Makefile b/arch/um/Makefile
index 7be0143b5ba3..721b652ffb65 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -46,19 +46,17 @@ ARCH_INCLUDE	:= -I$(srctree)/$(SHARED_HEADERS)
 ARCH_INCLUDE	+= -I$(srctree)/$(HOST_DIR)/um/shared
 KBUILD_CPPFLAGS += -I$(srctree)/$(HOST_DIR)/um
 
-# -Dvmap=kernel_vmap prevents anything from referencing the libpcap.o symbol so
-# named - it's a common symbol in libpcap, so we get a binary which crashes.
-#
-# Same things for in6addr_loopback and mktime - found in libc. For these two we
-# only get link-time error, luckily.
+# -Dstrrchr=kernel_strrchr (as well as the various in6addr symbols) prevents
+#  anything from referencing
+# libc symbols with the same name, which can cause a linker error.
 #
 # -Dlongjmp=kernel_longjmp prevents anything from referencing the libpthread.a
 # embedded copy of longjmp, same thing for setjmp.
 #
-# These apply to USER_CFLAGS to.
+# These apply to USER_CFLAGS too.
 
 KBUILD_CFLAGS += $(CFLAGS) $(CFLAGS-y) -D__arch_um__ \
-	$(ARCH_INCLUDE) $(MODE_INCLUDE) -Dvmap=kernel_vmap	\
+	$(ARCH_INCLUDE) $(MODE_INCLUDE)	\
 	-Dlongjmp=kernel_longjmp -Dsetjmp=kernel_setjmp \
 	-Din6addr_loopback=kernel_in6addr_loopback \
 	-Din6addr_any=kernel_in6addr_any -Dstrrchr=kernel_strrchr \
-- 
2.52.0.rc2.455.g230fcf2819-goog

