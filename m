Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7027421FF48
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 12:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761483327; cv=none; b=CXJwpwLqS6LK1lAnSWWFA9k4hzzWMD8f2OMkcuRZcvahb53R4Dhs+rZHnUnPaUH8uZArQ9fx+ZaY135Z75rV7bd0RxuQaxlE156TCjCmbq6rNG0W8u9o3NvHqyk6j0QPABzRmpO83GU5/PwsAzzdymFzyOoE2apqkamoxskOjyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761483327; c=relaxed/simple;
	bh=7hYaukdo0Jdq8vOEcDX/02TcRRrIfzHxZFzM5wkRCO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBU31Ks/n6XQxqTewPg1iLpQ2IOrg48XsHys5wyPMfuWQZffW6n8cAhXM3krHdexKwXMf4Y75K7HRmJYrV4cp3dqMQOmkq74IumMU4L42/X8tEIBegy2Rr6bPhRsJcT4upF/cEdIDMkD0/jU2eEjTR8EuczBJ6SYobGbbMP28Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbsTvMzn; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbsTvMzn"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso3195791a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761483326; x=1762088126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aH6tCO/cQOJwkdwpg0bYZ2HnPHzmOgjXWnEfvG+kC8Y=;
        b=GbsTvMznh2fS6wyXiKJUWKzg5YBvJriNpH1u3x5fKFrl+ZOY0ASMA2qkvHXNwQo9fZ
         7/HfxSy8wOgl9SH1yW9kx+yfj8IVcv047LVVwZI+6RzJUoOUfOkgUjUgz6JGz5heMT2t
         ycDf9R3vtcLg9smp+tZatDnZH6fwULm2f+6cu48Thf5MwjzRr/pioOeI71J8DApByfpX
         BRmxWFg0kSYENKdDPjkXgkSPmo7xWur7QX+rNy3U4SewjI4amup+wy0T8k5T3YsPMgX2
         +L6ox1eRVFSLrJEMc75JQclORWH1LjDluvlpyFibVraaTM/4zJwXr/UCETH+PJcI0G1X
         WZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761483326; x=1762088126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aH6tCO/cQOJwkdwpg0bYZ2HnPHzmOgjXWnEfvG+kC8Y=;
        b=h33/9/WbqdGMzr4YyWxL2MsMSXVzbtCVAEF/Wt6TvKDb+I9PcCmbV3POzpRkHLcCju
         Us+CteRLJWl3C2wQbBVit/iVcOW58m35Q2WPFyS0qv5CQwmHAZpzSXeuB3VjZOFl8NS+
         OHiUMhqVaqSFx56qB+bZLb8VydwqkGGU7l+lZD3WdCNTg1Ht8wz5bmPnFrR1/rC7TNlz
         31KgdswBxzkhOBHr0ibl+nGdGJZxU5QObgLYe77RPVR3ziU9iHYe+2ahE1DY1KQInjps
         MoxkQucd8BRgBMJFkrlFyXEdcyBaT+yEN4aBnbbijBN8KzOtJbRpwoLn3G94B0tbKGB5
         bDHw==
X-Forwarded-Encrypted: i=1; AJvYcCVQK9wMOJyT+CFw6vq+PqRh50E/NNSLere82E+hA7FR5KmAYAYdRuUkA40VAEUqdvVsF2iKbYdZiiSHOlQdtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjkGB5u+TVD+vqWAPA3HiQX+6/vaiBokxcRP9lQcO+Cl+EieBW
	gwMfHgVSLLB64ovME5sGYwGCiCt/Dd/eGJ9nn4LBK9BZh666ybils73U
X-Gm-Gg: ASbGncvAyVnaAb3mra34RGfUVL0XTbOTvnzzZvywIwyOrCmqwBFgUeqMkToCP75MKbK
	b9V4GIItq7d8+nfofMgHD+LR/i5KoPFCy42ynmCjH1BSvabN8kwYAAe7llA9qCnLAYVckTQyism
	04ywjRMwhu+S7z5mWymi2IwLIWNiNBwrCKbAqwEn5VDTxVjKLTWmA3SMtKSK3aB53CeF3DJKmAF
	AUK59werJpdNUjbUv3X0XWgvpEXilno8ajmdT9ufrmrfG4wA8+mPGUHOYASYgjmaPaw0spCDAAA
	dJfxG0F7eGfDMutzKzJyfju/YFwQmD4h9tn8RBCJhXOpLci6EkXLxrTsg8Ayj5/rdSg7yAZ3F2i
	4mhgM72xHQYzCn250M60Zh+crqqbAoqRic2oZy28XFwH+KGWVwmSROEtGGE90d6IdpSlZtwDUag
	Ax2AbNDa0wpzm3AYDNm0tAKCUfyFARCfeXBLnRgw5iw0iplLBDVg2LKP/rcZDXAIWgmFQjDw==
X-Google-Smtp-Source: AGHT+IFrOdWWMYR3d25fK5nwTlcliYXymU0pj/pOVfjUBs702aTNlLeGllm9A3rfl/Z7gtdm4PmRNw==
X-Received: by 2002:a17:90b:1dc4:b0:33b:ade7:51d3 with SMTP id 98e67ed59e1d1-33bcf8f78c4mr45902883a91.20.1761483325564;
        Sun, 26 Oct 2025 05:55:25 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bdb2dsm4641759a12.5.2025.10.26.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 05:55:25 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	ojeda@kernel.org
Cc: anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu
Subject: [PATCH v3 0/2] Add read_poll_timeout_atomic support
Date: Sun, 26 Oct 2025 21:54:56 +0900
Message-ID: <20251026125458.2772103-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add read_poll_timeout_atomic function which polls periodically until a
condition is met, an error occurs, or the attempt limit is reached.

This helper is used to wait for a condition in atomic context,
mirroring the C's read_poll_timeout_atomic().

In atomic context, the timekeeping infrastructure is unavailable, so
reliable time-based timeouts cannot be implemented. So instead, the
helper accepts a maximum number of attempts and busy-waits (udelay +
cpu_relax) between tries.


v2: https://lore.kernel.org/lkml/20251021071146.2357069-1-fujita.tomonori@gmail.com/
- revert the function name
- simplify the example code
- add debug_assert to check the range for udelay
v1: https://lore.kernel.org/lkml/20250821035710.3692455-1-fujita.tomonori@gmail.com/
- use the attempt limit instead of timeout
- rename the function to read_poll_count_atomic
- add the comment about C's udelay behavior.


FUJITA Tomonori (2):
  rust: add udelay() function
  rust: Add read_poll_timeout_atomic function

 rust/helpers/time.c       |  5 +++
 rust/kernel/io/poll.rs    | 72 ++++++++++++++++++++++++++++++++++++++-
 rust/kernel/time/delay.rs | 39 +++++++++++++++++++++
 3 files changed, 115 insertions(+), 1 deletion(-)


base-commit: 26c1a20bf7ce76e9afe4030f25bec20e3c63dcf8
-- 
2.43.0

