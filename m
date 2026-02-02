Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316BC35E53C
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 14:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770043540; cv=none; b=sii6nEnyV8zaQK/ZftjV5pE5jh1+ET4An9OPQHgxQoncqP6TKikFJmhgzFZrSUwPmwZZhLPLsIaXssfdKTcf7f4/1+5gd0SQ0CSH7a7OqZjJkmbI3g5xhutJG7v1QWQyMqb85xPaJUFCbkaRkXutbkF7tUQqOWFdp/on87RSPI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770043540; c=relaxed/simple;
	bh=0ff8m36cwQJxXmo8SrA278zxhYVDjWA+RD0YOyFS2ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7/U6iDO2FAEg7Pe6rVwAtlmmt3yiG8PuFO/OHFDXY9IDjZKJxoThlRXq+JQ8Zr01+xd1Zv5UBAlh/TF4WCHIjtrcqscCe4mpe+eA1oFYA07FPVDkqJe4txPprG/PvmN3LsBEgmcWXyep6aht7LkVF1/x3yb1npSx74bH3Zq0e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIDI3Poz; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIDI3Poz"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0c09bb78cso37578545ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Feb 2026 06:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770043538; x=1770648338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ff8m36cwQJxXmo8SrA278zxhYVDjWA+RD0YOyFS2ZY=;
        b=TIDI3PozfbKCTUCCDKhc0v9cIq3IluqzxYtRlhOzrE/f6A/ByruThTR5R0aYxgdqyC
         1qoHEesWU1Y7EYJbFE5xCpVRa2FUEC0+onsOjW6dP8v6Asyb53qKrirt7jOOpv4Xj4K2
         Pp8s3KJH4egAHVeWgcEl7E9TSuG5ACVpjpKKgM+pLf0OysN0otkp6pq7ZYjIyOlAdSkS
         W6lT0Il62ksDwwY30Ufqr7r27v3c7nN0k1SaRVdLRU3femg6GUG5x3NYBZEnkCqwpKlI
         zBhNlAZEZiGe4Hdc9z1x+nDvEyDM276b83wTu0sFSGs4nDvXNHNsp3GnJoWUSBiBk2OJ
         +1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043538; x=1770648338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ff8m36cwQJxXmo8SrA278zxhYVDjWA+RD0YOyFS2ZY=;
        b=re6Whb+Fx2hPR2+vzWLsNxiYtLVFj788tLWouwgxImPh6k6u4RBJdrKRauCLsZIOox
         FKpL/BuH87m9JMnjgM/AhwciHgdSIEq6Gowgz088pEVnOn+qjZZPTEJnSu4LECtlbfbr
         SMAJD5PkBOcQJ0ugizR+hb6/gD4FkDjvPzewdkQDJcYxrqiqzcEH3e5WqeFf0nXgR618
         UFEpfheJ5C28gU4I+7cF32ga/zlzl2+WNcATI1gkhDYVrYwocqx/vfEuua7wfJr0Qckl
         MypKw4IB5j4q4hVVQCXrTyyqrs94oO0LOpOeiDSpdl+YuAPmg9WGI3ST+4hDYgzHWCWP
         ZwOg==
X-Forwarded-Encrypted: i=1; AJvYcCVCk6+0Q0JaGgqbh/cQ4fDJySKavpJTu5KIELVOiVVKOoGlgI24RPmCCGLog05FEU14Xd8fFtzjg1tiv/RhHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz+SSsdXdTPmqw6Q/9Bw1xEVcSdVf/EhLbCcJYBYMB8QgbVQty
	UKEea/EaNdrZjjHYE0PBDwUCMG90WH+GfjQcnuwTsCciKHKoR1mazKBV
X-Gm-Gg: AZuq6aIwsDmbisznx41RA/AaGWT/f8l9abybFfI4ULxdcyuL5qudGiKSnIl8JkCME7X
	U6WSuOwWADfZlbrDde20A/8ziutgVnesAntBYwJZktvrCEsdoTsAO1QSSqGbP67sYNU9SO7AJp0
	sYpiFaLhkfOvGnThEfGRmrkDt24ug2p99/joj0faJak/TOxLacVszHbR+DVq4fHBFo5z+w/BdK/
	pqe3FTvS6w5YfDtWo/kSIskbctUPPRHs2tc/LlaDbzkDDd3Saq/ZPs2j/PztC8PT3EIoCfiR+VJ
	Fsmhe2ulyfmZIwSX0iwyk8MqombPysp+Y4+GnR1ffyD3929TZmazA4g6F15lBeHFHhsZAAe1TYi
	9TydamDUGJ9KAMo9JqI0yluFK3GKlfHD/h35NcgQAsnM99WEJLEmquRUefE9hB+utR7Hhwuaj7h
	6ikqs=
X-Received: by 2002:a17:902:ea11:b0:2a0:f0e5:74eb with SMTP id d9443c01a7336-2a8d9b8caf0mr122600675ad.28.1770043538398;
        Mon, 02 Feb 2026 06:45:38 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c45c4sm142688275ad.62.2026.02.02.06.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 06:45:38 -0800 (PST)
From: HeeSu Kim <mlksvender@gmail.com>
To: gary@garyguo.net
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@google.com,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH] rust: Makefile: apply fixed-x18 workaround only on arm64
Date: Tue,  3 Feb 2026 08:45:35 +0900
Message-ID: <20260202234535.2700066-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <DG4JM9PU51M0.1YRGM9HVTY24U@garyguo.net>
References: <DG4JM9PU51M0.1YRGM9HVTY24U@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Feb 03, 2026, Gary Guo wrote:
> It looks like this bug has been fixed upstream already. While you're at
> it, would you mind also add code so that we stop applying the workaround
> for versions with bug fixed already?

Sure, I'll check which Rust version includes the fix and send a patch
with the requested changes.

Best regards,
HeeSu Kim
