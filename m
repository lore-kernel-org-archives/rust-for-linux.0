Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE0320E334
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 15:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753628664; cv=none; b=lv0oLuPpnlz8qa1eENX3x0EUJUFYM/7CaZ3V3dF/IaZn0hztSHd0lG9Et29jZkNz/iMZzL1MKUhGkefbEl0eHIF+Ot1r8tUVctajZrM+TR4l6PxTfO9/LuxRdBp2zv3F83EHUM9M3b1iIRLnsJz3hclTU5hoff4V39ycOkX4kzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753628664; c=relaxed/simple;
	bh=lq0rvADk0ip5/mydADtM0En2DQCVdDhGMreH6FgPDVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gdbQJVlPveoz4SsGplwhv+R/BIo8PxI8Cq2mAPC63gDXhjlq89u+74ACKVvKfJtKquA6f9gSgzrb4NFyhjVXaa9hT5THjrNQE5B5MTaw4PkxKIiVGlpO+5OGAo34uRJKPxPlMKGhFqEC2xrZUcenX/2U+98A3W0SdG5+P/y8OXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=iOEnQwZv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="iOEnQwZv"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23aeac7d77aso33109255ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 08:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1753628662; x=1754233462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I8fMaV7c+UtGlaRMtsdXr3vVISUVpzDVRmnS+us0bO8=;
        b=iOEnQwZv/cVZs2U7/iys6edJfNysimk7xFgnXVJun2ATq/8ab9oIn58iqyHiUhzN+1
         F/evwjxkJvFUZvqanlZwosyoBAmUagJFn0dva0oXexwxUPDWdDJ54Y7vxbf+Tb+BsAq4
         KLfqT47wWABwAjlGusEubViRLWf40XMytiCjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753628662; x=1754233462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8fMaV7c+UtGlaRMtsdXr3vVISUVpzDVRmnS+us0bO8=;
        b=l1Hlm5xhuLS2qmLs51JSZ3CZfSB+E+kpMR564BQ8itMQ05CFrEYGThnZcBvGlU+RYw
         42o49cg29+Rqi9/r/ehG3TbMBAtM1fjYG8dCUK3Rn11z2H7+m1ohBW11OoBK6xnsshGc
         ttTOx+EbyjmtpwqBzuVqiPR0oNvP2oMgtvAmlNx9PvH1h6tgHQV1Mjo0U8Ka4y3jSseB
         +u9R4GosGpbi4ZWeYSpcZpdRCOIKryqryHwtFyn0N9NIZlZocO9UdKKC8ui4HVujBGD4
         OaWG9q+lr4EZ3Hl62wCTF1RmE3NZmlZWKAfLE6LW2B80eEPmMFia37RUJqwC7P0IBJxn
         DFKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWliTTf7GhAiiozWLPTjsog7CVpO4qW7EoaU91nFewrFHmt0dJUr9ImXaRVQToAGoq3J9hRYACRBdYqjT5aRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxcRDDa98Yr8FpasKFN5oIEDaKDFoVObJ9U8APYY5XFEqNG5Z5
	v0MQNEXM/s5t+nG5FBOjAdRNis9S09sxzuEKQ6ewYBW0hi9WEaJxYuYSUeCAEB1FcGvFoLHl5kg
	ggTH5
X-Gm-Gg: ASbGncvsrT38UXBZuKGBUfvzgsxJzHOgYptHrHaFJBGFtAT1kc4D9Mj5qjVGc6Q6msB
	gR8xAQxqF0Bo78VoyCWnLCGOcU6YN/uOuv45umYd3p6Qzs+Yrk3gH84E8YSAf5/4iBSWl1aw612
	Ha0fyzOvnwAKopaq7PFAgQJ4w0CbFpFWIK1R8OZsFUgmdRwR1nNmLPeYW98duO6aNa3aohzLEQJ
	TL0Jiz+ALCX1mV5GL/FRkP4E1QFrM0StSJiwu3dbBh3hh3S1crF+FPn2XZzJ4g7nCmw4J1UGMDM
	T6z2kSqRY45wcmLew3ke/4HQbOwbMSi4ShBdUvXxj+WiJ3LZC7nklTQDSmkV6VMoMpLQ9Q0elwN
	g0337lzOK3Hs9xJ+m78l/aMj/qaQGm5Uq9gAlb6TLoFmligNwLaMrllJIehPl2syZWredwY8i
X-Google-Smtp-Source: AGHT+IERy6bHNyPQYc6vhNgW+EwcyEcEdVXT80IqNzqwwqkceUiP0GUosARdB51ehMoaNIFf//OcvA==
X-Received: by 2002:a17:902:ccc4:b0:224:910:23f6 with SMTP id d9443c01a7336-23fb31675bfmr164192955ad.45.1753628661986;
        Sun, 27 Jul 2025 08:04:21 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ffdec96aesm15381965ad.165.2025.07.27.08.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 08:04:21 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [RFC PATCH v2 0/4] rust: miscdevice: abstraction for uring-cmd
Date: Sun, 27 Jul 2025 15:03:25 +0000
Message-ID: <20250727150329.27433-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series implemens an abstraction for io-uring sqe and cmd and
adds uring_cmd callback for miscdevice. Also there is an example that use
uring_cmd in rust-miscdevice sample.

I received a email from kernel bot that `io_tw_state` is not FFI-safe.
It seems that the struct has no field how can I fix this?

Changelog:
v2:
* use pinned &mut for IoUringCmd
* add missing safety comments
* use write_volatile for read uring_cmd in sample

Sidong Yang (4):
  rust: bindings: add io_uring headers in bindings_helper.h
  rust: io_uring: introduce rust abstraction for io-uring cmd
  rust: miscdevice: add uring_cmd() for MiscDevice trait
  samples: rust: rust_misc_device: add uring_cmd example

 rust/bindings/bindings_helper.h  |   2 +
 rust/kernel/io_uring.rs          | 183 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |   1 +
 rust/kernel/miscdevice.rs        |  41 +++++++
 samples/rust/rust_misc_device.rs |  34 ++++++
 5 files changed, 261 insertions(+)
 create mode 100644 rust/kernel/io_uring.rs

-- 
2.43.0

