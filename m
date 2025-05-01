Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0071AEEA8
	for <rust-for-linux@vger.kernel.org>; Thu,  1 May 2025 00:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746061053; cv=none; b=gMq8bWIISp3mwlIkHcFSS/MuESxm8X7EdvHxINcfHCcucZaMdOj0upm8jlyNs8Ot5dFs5MbjXe0/40dyep2hwe0e+6qLtYlebnHTVfAxLN1Ycbm6ZCQqtoeR0ZsSGMqZpcaoVskOI3MBKQQX3jFhI191qDvw5Qo3Bpx0XgPlXSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746061053; c=relaxed/simple;
	bh=Isa6ZqIMgXzkI1d4s90yw+F6YIICIspQQc80fkj297M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iIENdYCYlgnT3JjRgGwLe1XR4Ba5bUf2l++5u3CpSUpJMYcH9mUMdhHuNBPmhxuhSC2kd088am8isGQeJra28+JrTC+2dbhFcf/LmEuwGUzQj3gtR5k9muQbo8NPhinTvRbRQzrs+fed+nPqRjEVTRwke0eCvLeONYXZu/Th38k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vve+ANRO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vve+ANRO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224171d6826so6601065ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 17:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746061051; x=1746665851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=seJv2vqR4qDF6T9e0PoV6RNeVYH3HHbim1BZhuGyy2I=;
        b=Vve+ANROHEsZ4Y1zfSmwp3JQT98Me+tmOcpENQgWMSG8sGKcunecnh4Qaa4BISl216
         G5VvCAuzXwLTZ6Qr8io909YzD+wnMjcY0yT2fdObYy6qTZbW6nUYLGRuxeHiyDJmRiqR
         kaWZAuVD7JFdB7dxC/nKWu9CdxzwyEYiqC0s5h/6ANiA26SGbZyZCFLN5BR17RsGtrjK
         9BFdTQIX1MPOstL7EmE5bbDGYZ6vJah6S9sF4DV9y1zFA9zdKRR2moyCGGLN5mby1qsv
         j10kcdveYT0DT84Kcg2Aze+iQ3tdRCMvpkRQM66GeXBMTco95W4cUy/eIF4Amkcu1Xmz
         Ezow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746061051; x=1746665851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=seJv2vqR4qDF6T9e0PoV6RNeVYH3HHbim1BZhuGyy2I=;
        b=TvSrxBGj+VeKtiXMY7bHcfr3hqmnlIgGz0ZrV0E0c9N+wN9FX7fKQgA1TIE7PtE1Np
         idt/DR8iykeemdlOP2mKQhau6jpMCToCgLVeQ8Fmecc3l6Xw9iJg5NJWSQ74q9apT34C
         5VC1z0gcglmr/BeIapHRADt/Rx6S49z+RiqwFN9fwDU+L2Y6HEz2QEGutu1CD4nnxzH9
         SccYQoc2/qmon6oXcB5O7HlI85aEEV7i9h0PDx2QXZIyHHTT8xk3FcMG0qFyiGpQd/cv
         DCpF+XUqnxEItrwpwhUP2Ajt2uM/D/cOrRag2uehFqkLe+4Zl+RUm26Uxvq7Ywlu7Kg2
         hX+w==
X-Forwarded-Encrypted: i=1; AJvYcCUkg3b/COICWuRqqHTHZNCe3mChJy4AINfUfvNJNMk+qOVpb1e+/qz2guXNYgb6BIijYfxIPHkrom3lZguLag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2msyc9W5r7OWZVvntfSDTgAcHa8nhNErTdytmeGqyAYchMf0W
	9XFBOzBw+4WyGXRk8UQkAfmX9X78GDSerQTiQbw1HmLUu8kw9ezk
X-Gm-Gg: ASbGnctMaz8X2gEDsSAof7AU858tE/FoJI5k/61o8oukqU3KTmFDzAkXz8hTr/N9rG6
	xCoflnWAmOuhnClO/k1ck4uRj/3uIxvmgKr9DMqtgiqD7LNFOKZ3eVdyYk8QLaIQ+mJunbOzMS4
	iUhA8/7FLgaXfKaGiYjMMxoJF4bhWyx8yAfMPU1ziipKVfPNmn4KEmOqadPVgEw5ACQ25B1vkYJ
	YpbZIXDny+MD12pmY5EGOILrFo2F7tqaXdgbW/4Frsk1F3SIe/EPLh2g8f9ypu0kWiw7zB2HvTj
	NvIgTYO3T3UTEHzv1nkEDFH78pZVgA==
X-Google-Smtp-Source: AGHT+IFBmdPTIPgN3stiXEWqdjO3F1B0vxFt9RNvgVez2m4ZbDEUBSt3+9nu16CMhB2dXa4cFwwI1A==
X-Received: by 2002:a17:902:c40f:b0:229:1717:8812 with SMTP id d9443c01a7336-22df56afa5emr69290555ad.0.1746061051130;
        Wed, 30 Apr 2025 17:57:31 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221677sm128447465ad.248.2025.04.30.17.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 17:57:30 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: benno.lossin@proton.me,
	ojeda@kernel.org,
	aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] rust: revocable: clarify invariants in safety documentation
Date: Wed, 30 Apr 2025 21:57:05 -0300
Message-ID: <20250501005726.744027-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarify the safety invariants for `Revocable<T>`, documenting that `data`
is only valid if `is_available` is `true`, and that access requires
holding the RCU read-side lock.

This helps developers understand when it is safe to access the wrapped
data and the role of RCU in ensuring memory safety.

This is part of issue #1160 ("correct safety comments and documentation
in revocable.rs"), reported by Miguel Ojeda and Benno Lossin.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1160
Reported-by: Benno Lossin <benno.lossin@proton.me>
Closes: https://github.com/Rust-for-Linux/linux/issues/1160
Tested-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 1e5a9d25c21b..2da3e9460c07 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -61,6 +61,15 @@
 /// v.revoke();
 /// assert_eq!(add_two(&v), None);
 /// ```
+///
+/// # Invariants
+///
+/// - The wrapped object `data` is valid if and only if `is_available` is `true`.
+/// - Access to `data` must occur only while holding the RCU read-side lock (e.g., via
+///   [`Revocable::try_access`] or [`Revocable::try_access_with_guard`]).
+/// - Once `is_available` is set to `false`, further access to `data` is disallowed,
+///   and the object is dropped either after an RCU grace period (in [`revoke`]),
+///   or immediately (in [`revoke_nosync`]).
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
     is_available: AtomicBool,
-- 
2.49.0

