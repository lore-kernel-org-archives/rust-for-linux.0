Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729FC32AAAA
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 19:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770321521; cv=none; b=N740Dk6ce6Zjp2EjJdCiSNQpx4O/ADmXgerWQtBbmBcwdtbcOJ9CO9BOi9sIrdLmIUB1P8P5WpEbscK1QwpkROdAn1xb7aoxVGUcXbgghyBJewz7PjhMWdxXPN/fXYKbbxc2D8TQIAf76RV+hORMIqyuzaGIipz17buHn+ay9C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770321521; c=relaxed/simple;
	bh=rp+KY3soTs9OffEIYMUs0A+TcFMDd/NIg5e/e7FzZcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nRIpujxIcRGdkO9bQFTXWJEBYYsC+kMU+4aUx4q9sWOYNnwUef9XMS02JjSCLGQ9SHRfqQL8TW//gtaqV8ky72XrDgsxfM8tY75IUmjHbdjwjRcJeC6uZYCKewNho9Lvti+tCbsPMyyT8KXpssu5XdfhDQZYhYOD3CMsY7NztfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SywDh0S0; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SywDh0S0"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12336c0a8b6so758148c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 11:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770321520; x=1770926320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lutadAeu4e7BBQbDMidbIXRD6r3yDEuccAzMlRoMGq0=;
        b=SywDh0S04FRt0hWCoyPD+33RGx+lQsmyevcBM4wVnNGVOz3UPCu1NmaEzkLPHQdeqJ
         XvzqxdZgUHM7rqRde/0D1GNmSQlDZGHqUR3vDoSMjwuwFt8Yfm0zJKyQ1DpNyIAKzTSV
         Yykiz1sDQ4tMYUPMMo7sUPw8QNmah8lHtysE2S5/n2GLNHvRXWECeMrBroBiPQu329Fw
         wn2pPrA7bai/GOpQCrTFTLxcOEJ1Xx5Pka0vuRs10mv7SchX1JVinTq0XxB+R6DNJbZF
         8NReEQ/lsIlNCRr0EatQd/QI/FJcVl3NT0prcR5FVJCNZjjazzH+sdp2cSm7EceYPL6i
         MFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770321520; x=1770926320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lutadAeu4e7BBQbDMidbIXRD6r3yDEuccAzMlRoMGq0=;
        b=CfvCXc/Uw3uxW8vNTW1/3JE8SidxU6UR+634zWh+N25UPwVw/CrvmSpJsLFfmoUVQ0
         qP57SNNWwWByMmRA9ySjlCVv5h2GEeMqirsJBlqohhu8VSDeNAL6CGqSwCpXXwIreGK0
         NqBW9JTo1LQeH+eu3WVxAEhBry12ZvNQhnv9c7waGS1v80K59TWrT2g8Fa+Ifq9ql85m
         +1fsUIghh+jej9OkQIPcifgp6jF6+KIY8PEWdoeJDTtUlF5oIAMxPT8XKQfJuzzTLvdB
         M240DD629f3NlrjyuoiLj+HHDtbDNiA/Zqt4+wGQXawC+/TdhL/2Zj7DOKs32tCXCZxp
         ImbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4w6HC+EDRm/8e+it0VzS8G0Fv+aiM+Vq8Rn/jjhj2PkBnF2lPvvxx2qS+wBs2kB7WYwY9bMfq8tX37uG0sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx35jQLE//kCajralGccIBgINFAOj3LmGbxuBEe8+6/5CZED/F
	rgCzQ+WVGatJqqa3J4ck9egQ6hAgeMGK6OKSeUuxtJ5gzpzfN/cbMyGHjAm31Q==
X-Gm-Gg: AZuq6aIv0HUQmGObyLf9OBGfNLoIIQnq2YKhcE2VuWzl4H6b2SIoQVO1qazBlSUweKY
	dtMoFkK3hMBGHdhfZt41FiSjh7Ud7mP+svukRiY0klH8h8uJJswQ7ms38eV4OfcxX+fcBcv9uBs
	QsojtNtTlv8d4MjviRlo5XGykWIGX7w+DmViqN2MEIv2RKXw6ajT8M5VtoCk8LtkPVgmgSasXsL
	Mhl9KdpYak0SIsEAhEjwJLiHLdIVjKS0MqeYG1UHXJsPS3ZKLTn9W9E2UCfTg8dSB6sYQC2oC1L
	nB2rUsK+UVp1Y4lxqI6gpfZa6SG3koXUNfSDXVk+Ih1ZDxkopqL/YfpvohLPmY2G4NYXsPDAT9l
	2HMJNoFn9s8Y71UWb5QxUJGEMNX0mx8RrEfc8D9wjVOxtu3kuI8tu6OvrzklwUdpR90Y8qzpkRX
	SsxzH/sSWuxuV2aLcM/19gWZAZvhPa0ug0aOx6Kz7ukg3OjSXt90jL0BLYFyBD4w==
X-Received: by 2002:a05:6a20:3d0a:b0:38d:f405:709e with SMTP id adf61e73a8af0-393ad307e51mr212862637.48.1770314685545;
        Thu, 05 Feb 2026 10:04:45 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5436c5sm99812a12.15.2026.02.05.10.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 10:04:45 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V3 0/3] Rust support for powerpc
Date: Thu,  5 Feb 2026 23:34:26 +0530
Message-ID: <20260205180429.3280657-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable experimental rust support for ppc64le and ppc32be. The patch for
ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been 
merged over it. ppc32 needs some toolchain fixes mentioned in the patch 
`rust: Add PowerPC support` and the discussion for that is done here[1]. 

This has been tested on powernv9 hardware and power10 pseries qemu. I
I request Link to test the ppc32 part as i don't have a hardware to test
it out. 

[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V2 -> V3:
- Splited HAVE_RUST in 2 lines
- BINDGEN_TARGET_powerpc initialized before assigning the same to
  BINDGEN_TARGET
V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com

V1 -> V2:
- jump label fix for rust has been moved to a separate patch
- PPC32 support has been taken
- rust support has been marked experimental
- target.json dependency has been removed
- HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64

Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (2):
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 Documentation/rust/arch-support.rst   |  1 +
 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  9 +++++++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         | 12 +++++++++++-
 5 files changed, 36 insertions(+), 11 deletions(-)

-- 
2.52.0

