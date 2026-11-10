Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332132;
	b=hZ59oCdlrYE3fMknJF3USqEMsP875D1dBHyFDrlRryT8Z5QDnruWkAC/CTV7HH1uQ/P+
	 wsWJo/9/boqcfPna6/tVosXfnebogVL8TzY+DMC+YOthFK549fyGYcg3RnF/eZE109Oj6
	 zsHuu0NBiHMtBRl6rqMLnjmTqYvq3Tj5u4Jp6tRIAdG0M/vmyx/em3IXul6SObERDbUHR
	 5c77TcaJZ+55Hh2HQ/DVH2AMzj3n7/wYfp9lq0Av8KPuRRG0CXfQecUbqrFKd7N0y+TkY
	 cYy/0nH3mzm4CCy/o/v9fuiP44M06/PwF2rcR3BpFvP7iQaL+fmU42vQGP4uPtN96aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VRe6DvGzMVEKtF/UjYGmmLxKrND1yOzI81LM0TfOFc4=;
	b=QrIz7J8+xGaH2K44VdYK+Voqse4w6UuaEsrFmwcACSe29pkk4oO34QO6+K/nR1SSEqB4
	 XByFrbfloz96LmhfAgk4YpKiCs7sKKn8/bDaAreYHAb5dK+8FsSdQD4t+UIx8ka9lx84X
	 xKxuPstePuuXY8DXcaTwTaMw0TC/FoEbehvk2jggLHaTZtXzXJLFVj0XaR8QA3OfvEwpv
	 RCMGa6jLBizRFNe4CEWQQqkQyiQd+XrBPIOPri1nW1OR/EfCi3aNB4Dc6kRQKWJDKg8f2
	 YFIQhoQmmaAkVAO1F6PcVI8UKkfrCYpyMudHMMh70OHlPzsfDtpSUV72fPg8qw9B+yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCLSelHd;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DB0606A320
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 17:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49DB0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCLSelHd
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490a0e72588so1287703f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 09:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332131; x=1794936931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRe6DvGzMVEKtF/UjYGmmLxKrND1yOzI81LM0TfOFc4=;
        b=qCLSelHdSwkXDi7F+RK8rmmA8JQQ27OnfUgKyHi0/X6kr7m2KA8dGm7eRUAYrqbs51
         D7TRDFJSEHBeni84txLs6nAwKtI2lABPTcjJh8BIczjVP/5VhJVfoSkDRM1e+8agSbys
         S+pZfy8MzfwPQdYNctro7QYB7ppaWgtguEuRDyR3n1Ml1JKHFyn18zB6DUgPET+ymMlc
         +4d5BZDoz6gW1VdsoGSZnm5sH2TvxF1vmD8mg/MbznEkheFS6YAVdQIj8RGAC0S8tkKX
         myb04BMRp3e8bvAllXH1hpN/35c6bYS7piAZXKqXD9aqfzHKuxflD9Y02Ej6fER5yXun
         xDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332131; x=1794936931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRe6DvGzMVEKtF/UjYGmmLxKrND1yOzI81LM0TfOFc4=;
        b=yQH3eaRf2Icv1n4OZ5yDcbNBWAn2LoE4mTgETsn6IurfPLLFV0WMQLu8kbtidH9tYl
         1bJVHp19pOr3/ygpOtZNjbvsF9xdKUSAKfU5OEmw7+Ziz6eoAH1osMzLfFiSDuxAURto
         svF3HqmWHmraPkLVh7Erbzl6DPuh1ZWfx0ZWIVK3AEXhhCzoJOt+TidU/OitxPl9Ugjn
         Jy1lPAWBDsJZ+LwfuahbgTZm/Lg1o/I0Yb1e4m5OtG/fbqzB6JBCRW4KBHV7wUuDY1Vu
         DU2NJDt99oXVhh1S0a9QdZjyzyStlzLlaaKuhUUBNPL8H/+JZJBCDujCxxTcCfz3UO+i
         iezA==
X-Forwarded-Encrypted: i=1; AL+hErFle3xRF6w5MiiA5hVsuKirXwGDAD6bs9fIiRKPsHKnEX/qSbrpx6qDrdJP0zVRvJGDNu+5cuuDRAfGL/7JFw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+qkBBxFuuAZA+dylwO4dXqeth2o1b694I3fEFvMcIYqjW/+M76
	Ep2RsiF89AsEij0x3jSiDAdW9Iw/qtk2ppsuJwYDfbn7+gEZmxx0ZiJX
X-Gm-Gg: AYBFou1BPT+uAR/F4OyIklDAjcaLbvtYGlMiTE5g0qF5MQydMrqpCNumGy8AF73Gnrb
	kxwxX3pPzKJnQRG8lnRMH3mbXhuznkgOr9uN9k0RAhpGxRdp1MKr0vEc90wLToL4mPV9DuSBIpt
	MsMcpxRC7umU5HQeTeYUtwUhENDM/Kty79X9rk9Tu2mrRKNwHYuksXnt8LTJw3B+IBB9dzvd7Sy
	SfEhG9IqrKHB84UGLDbXBUPDA72pP3+AJz3o8p2enSv1APqDY1iWo3bBSN8UoRnOA55Iqr4Or3K
	tH4LMWkf0iYREkq67KnZ2ljlW1FtRG5b8Au42hUSPYyNcbovxBYtxPIJEgJyqoafJ0Qhvg5LwmV
	UQce1N/UBfvTVQDLPoRMVl6XETCeBLX41RydmDjRaQrbLYhXAK+HNdCfCBnIdE2nPY6E1a08WrG
	FJGYeN2V20bRAHYpkxtx46YA3ea7UIH5thIwDnFx7v+xfP6rIGJiDRYtgXDSropwVVqlQPVbzyM
	Vm+RObzck0WVK8nwsEXK46hJ7Impyj9xHS6zwGrnWqggX2H6QL6y+yujw7o0BS3pKTYwHr4Il5l
	4+af3FUWHNlCnpVYfQhRZ8qkKqWuPSdBDByPGzk95J10zqkN847H8zuRWrsTwV5zM6nbl0gfgE7
	6tQB0HRYg0L4Ve8txMqc=
X-Received: by 2002:a05:6000:420d:b0:48e:7a41:d78e with SMTP id ffacd0b85a97d-4982e7379b7mr6438321f8f.19.1794332130261;
        Tue, 10 Nov 2026 09:35:30 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm6445687f8f.50.2026.11.10.09.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:29 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	a.hindborg@kernel.org,
	nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	jakub.git@horky.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 0/3] kconfig: wrap long expressions in menuconfig
Date: Tue, 10 Nov 2026 17:35:23 +0000
Message-ID: <20261110173526.1548434-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In an offline conversation, Miguel Ojeda reported that scrolling
horizontally in menuconfig's search to read RUST's dependencies has been
slowing down debugging.

Let's wrap expressions (like in the 'Depends on', 'Selected by', or
'Range' sections) between tokens at the end of the window, such that each
line begins with the same indentation. Ensure the '!' negation stays
attached to the left side of the option symbol, and keep the value
annotation attached to the right side when wrapping.

Additionally, write a '\' at the end of wrapped lines, to visually
indicate to the reader that the line continues. 

Patch 1 cleans up the existing expression printing for 'select' and
'imply' (which ANDs the select/imply targets), to properly call 
expr_alloc_and() and print the output of that function, instead of
printing a literal ' && '. This is necessary to ensure that any '&&' at
the end of those lines will wrap properly in patch 2.

Patch 2 makes the wrapping change primarily in expr_print_gstr_helper(),
which already handles writing expression tokens to a growable string, but
now also keeps track of the wrapping info in the 'gstr' struct because
this helper is called multiple times per expression. 

Patch 3 adds a visible continuation '\' to the end of each wrapped line.
This is because some line wraps are not otherwise obvious to the reader,
for example if a line ends with a symbol instead of an operator.
(Below example uses an 80-column terminal)

Here, it would be less obvious without '\' (GPIO_TQMX86):
    Depends on: GPIOLIB [=y] && (MFD_TQMX86 [=y] || COMPILE_TEST [=y]) \  
                && HAS_IOPORT_MAP [=y]

Note that the 'help' textbox uses the same expression printer as search,
so this has the side effect of improving the formatting in 'help', too.

In the future, we should consider a larger revamp that would wrap all text
in the search window, allowing us to safely disable horizontal scrolling.
---
Changes since v1:
- add '\' at end of wrapped lines to indicate continuation (self-review)
- use expr_alloc_and() instead of printing literal ' && ' (self-review)
- properly support trailing '!' and leading spaces (sashiko / Nathan)

Link to v1:
https://lore.kernel.org/all/20261010095001.265759-1-julianbraha@gmail.com/
---
Julian Braha (3):
  kconfig: print the output of expr_alloc_and() instead of printing '&&'
  kconfig: wrap long expressions in menuconfig
  kconfig: show continuation at the end of wrapped lines

 scripts/kconfig/expr.c  | 33 ++++++++++++++++++++++++---------
 scripts/kconfig/lkc.h   |  6 +++++-
 scripts/kconfig/mconf.c |  2 +-
 scripts/kconfig/menu.c  | 24 +++++++++++++-----------
 scripts/kconfig/nconf.c |  2 +-
 scripts/kconfig/util.c  |  2 ++
 6 files changed, 46 insertions(+), 23 deletions(-)

-- 
2.56.0

