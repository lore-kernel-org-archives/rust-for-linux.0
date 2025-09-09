Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468CC32CF75
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441663; cv=none; b=huP2yyk8nF2Aa6LG2Wf4g6025L09gN+ugOX3S6X8hl1uiZ7QP+BoUXKfG+2NE5EwbfTDe6JP6C1JPpRq7h6dNU7cVB1gosNzu6D7xz/H2QnYOpoSjYaLpWqFvn7Y+/sYkpYob1mLM6ueOubz9m70RgXBJPW/Pqu3L47qW5fWbVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441663; c=relaxed/simple;
	bh=XKMYR0rZFryWAt82cmAKlov8m+wRjbLtNvTpIjuR2A0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EWvvRCnM+VHzWX9ItyMEZwhY6ge7pVJMh2YH84SGnrQypwod490rA1+RriDmxJ2DC4ANnK3xgRMWZ8szVLQJGAwG9nZG6IIA/WXOmVmwlzYUjwLDFmdI3z2BGWCwDgUqQ/5E321CmVgMUczAoINA5r88hAuSSU+W1wjXCkn2UC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c9KiSISo; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c9KiSISo"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b4e796ad413so9113183a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757441661; x=1758046461; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tvNduM9s7//sCfdhyoE/HdBETl81FPFKvCYM9u9MkSs=;
        b=c9KiSISoxYnAJI8f8bNQZNUJQI4UwUFwJ9HJv6QqFwwDRGQH7FIXYL8EoVOoQWQ1lZ
         SDNmEeIWXnIaOq+DkgUI5zG4RMDzFRGXAFiK8ayeLgiw+8Kw3qVdJVA/1U5KIu2mpSiI
         BiiVbKNh1APWw/Owlz/2hYa2eACNWM9Tbgsk26wG5WATOIG9nsliewzrC/tWIeWj7bl5
         +2CdmYMv0IiKYxZxeZtpQbP20nab3njbv53ADgKqM7sxxmGsqPbP0rxFwtvqI6unS8uZ
         zWOi8lT/aw8g/PJBSluUlcr7Sis5cbd4Rkz24MWshf+7arJS5XLJYp5BkbQLFBuxHDUP
         xC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441661; x=1758046461;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvNduM9s7//sCfdhyoE/HdBETl81FPFKvCYM9u9MkSs=;
        b=RFlyU1GkfdszM2bI7e2Fp2VePCuKWMaKYEEcN34XPY7OswYPB5BhKb62nG86WtBDWv
         ZdBYBesR+lmfvKdhSSkKHlMolVosKV6SVhBQZvvFbRis3/DSttV/1M5/9ifh2HpXOmcn
         M8WBa37tN5UTE1k3ce0p0qGeTvkz8oNA+HkTEIhZOv+LhUDyxKfb9yeaTtWwSqzzMMTl
         qo/F1lSGgmz8cswaThWG/IVKiVjlGZeH42PJeVj5oNrrdWI+BVJCTb+qm3aCU7gkuYXo
         7hzs2OFZUQzbnpQibJ5bpl9ZM7LZ+ohk+7FWUAW0XQcgydJVINv8Yn9sSf/1kpcw6aEC
         /ZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3W0rq6VCo2m11aFyQAp8pAzDEb6kn71J0rp/J0celJykAa/Uvol9pBGtFvHsg3hmzxG0NUrz+2zu+U3m6fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0zN9UT87Ny8UE/Re0Z5b0P139cmsJcbxCryNPG3GWYYJep+3H
	1XWGKevp1hXKYnaGaE57W2bgSZOiNFWFfmT6B5wth0uqjTjNKK1xEnq6UXFoCIj1p7naIaSYg2t
	A6r+/XpUKQQ==
X-Google-Smtp-Source: AGHT+IFOLpvhmDvGxk6t715bqYf6V40EcsZUuZVEqhl6096A5aJmAvnCAulGYXhst0wLjI2umouHZmOWzc2q
X-Received: from pjoo15.prod.google.com ([2002:a17:90b:582f:b0:329:ec3d:72ad])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:914c:b0:246:6d1:de66
 with SMTP id adf61e73a8af0-2533fab7223mr16781966637.17.1757441661606; Tue, 09
 Sep 2025 11:14:21 -0700 (PDT)
Date: Tue, 09 Sep 2025 18:14:20 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHtuwGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNL3ZT85KLUXF1DE8tEEwtTI0NDIwsloOKCotS0zAqwQdGxtbUAMDC jAVgAAAA=
X-Change-Id: 20250909-docrem-149a48521128
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757441660; l=1361;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=XKMYR0rZFryWAt82cmAKlov8m+wRjbLtNvTpIjuR2A0=; b=565KgAzEoPasOdaJ+pLXjqvOtQDtjOyYrVdW5SBIneocC/D2PFTKb0bGSsDIlakO8inXipOp7
 zaigKZE71GmDv3gBO0vPhHLkmIR02UghKhqKtVaw6RXZ3ehKuaqEFtF
X-Mailer: b4 0.14.2
Message-ID: <20250909-docrem-v1-1-dcc69059a5cb@google.com>
Subject: [PATCH] rust: kconfig: Don't require RUST_IS_AVAILABLE for rustc-option
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

The final version of this macro does not fail in the absence of an
invokable `$(RUSTC)`, so we don't need to be careful not to invoke it.

Link: https://lore.kernel.org/all/CAGSQo01mQfcU1EiW53be1hcts0c1p-HQAab_HBk6VcVmhq3n2Q@mail.gmail.com/
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/Kconfig.include | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 33193ca6e8030e659d6b321acaea1acd42c387a4..7d9a0b4f66a9667b2cdc9d7e87c582487476f311 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -70,8 +70,6 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 
 # $(rustc-option,<flag>)
 # Return y if the Rust compiler supports <flag>, n otherwise
-# Calls to this should be guarded so that they are not evaluated if
-# CONFIG_RUST_IS_AVAILABLE is not set.
 # If you are testing for unstable features, consider testing RUSTC_VERSION
 # instead, as features may have different completeness while available.
 rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)

---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250909-docrem-149a48521128

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

