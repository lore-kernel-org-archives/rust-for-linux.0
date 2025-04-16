Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4078522D7A2
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 06:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785605; cv=none; b=GZXSBmsxtW7oR9ZTxWeYU5VWx0BSw2yIECFaO/unD8me4rHWOXuhw4hUG+dxApDgVJT0b/G6Y3tCWmeO+1rsefps7O/Exyjgz95K4PDTyhIo34qWyTOys0GIhy0Y/YVy26W46rVejLcwvC2psWVvutoAmFC8RuHADZsqlpShbO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785605; c=relaxed/simple;
	bh=pRm5rikPg836Cpaht6T2Bti6G/gsdEEiL/oreW2ehWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=We1yXSr6BIT3E2bL2DK8Ckw/TcIyFqQtvjSP7y3tHUz+/OeRYuWEQaixA4hhJziLii0Fv0yYOXOJgXT3OBCVg8+e2faNCqNde16XXQUiXtgzkZbJqDj5vf+fWK1qyaFYyQ8BCibI3m2RpvqlMLaVgExBgB46BghcRaR0gUSLGl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JhrTT8/m; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JhrTT8/m"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2241053582dso88484905ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 23:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744785602; x=1745390402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaMUD1BDVL417dtmG3+/1YWJeUCWl78+KVSs+NX3TJI=;
        b=JhrTT8/m6kO4m1EAju7eGEsIHuUpRJFWF1FdOvfrMlmY8vdAC0MKW92hpOqLqIeD3u
         C91iwFkVxT9dlwB7IPoQiEch9vxGD9JZwTpKADUy542/ZXjDrR80cTQ+QtYbjH4Cvi3k
         ZT5pqaH/w+rTipU32vW7bx5E5gP1WqRpDNi1+7KTzkCo5OjtcsQYsD09bBal5lgmVyIV
         RNGSuguuqi/ASd1VOp/wdEzjEC4/eENq0TaSJjXJUmIm59x+6VS7c7CMVTqJE1Zzalbs
         xHoZkCoyF6S01/ZP4kCq+S+vBViL2B6fngMgXJOBTcqF4UclE9+fnanYGihsQazr3qeG
         q9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744785602; x=1745390402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaMUD1BDVL417dtmG3+/1YWJeUCWl78+KVSs+NX3TJI=;
        b=W9WDoF+h34MWjkXRnw6Auelyn0UPKYDyZXYuq8nohsEL1ULc+SBkQXsadaIuJTvz8J
         YPaVxPHRDZpmU75oYVa86V4fDtErK63+kUby8FBW2dj84gETrKtoCblhwJZDmjmTvZRG
         zmh0eo6K0CStBHAc8Qv+hPWVDagIi8lHpNHcvKclg6kRKW45HDDbOuZOQQf4GA6ism4L
         32CkJ34K+d0uuHwGEC8CsUpWmG5InPl3NRFajrQaj96OY9In1kJuEaqpRWyWl7DMyn+A
         ElcqgY3L5eAcgc+rXptKCs/4cOq58m0oTNy/QxHwdXqFs/yjqdjspqLIgie0uFM8tfGR
         OgNA==
X-Forwarded-Encrypted: i=1; AJvYcCVmXNYZTinW5Eme5tSvZtZ/hxP9+hW0is8N6ztgvuYFfJcg1betAZarzscO1Z53Dtivg6lArGB1wB/6A7Cw8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAHZs8fio9ttKBbc1H1Mwta6dPqlgh9Kq4rJm2OE6UBiJ/reXz
	CZvad/yPUJOPbewy681Q4tZre/obrrKsnfsGLp6dlY7J2s1pUCv6HGdvza3c2QU=
X-Gm-Gg: ASbGncsGw4VMTZ0lT42zY1zWpNfeZYJBXm3TLpCPk6GV1ga8rdK23+yZ9W6ZxJ+Wdo7
	VfpFXqeyVCXriu9n6eg7sh0C/tGMCKvpxEnT5su8b+waWap1vwTV3RzACPKvYDZpV7dNVGW7475
	AR1+w1hfEl5VlDzW5MIW4JaCj+IYYOwABXyj1jwGOKSwrhLGGaRgRmT6lwKqA536uZIm+6TgtjH
	3i+u1bqVztb3u6kCu/hAq/F7so1aI42xs2jlPtdqnc0dk6/hwFT2SeQwdtiTdgh2s4qbBm6dt5b
	4/SJPvzdYKsu9oUrTBWmpE772Vq3kiKA7NcflZe7Qw==
X-Google-Smtp-Source: AGHT+IEZ0BjxMEufYyWXS1DlCdKaeRakmruSioO3vp2nVRyRnB2tMQN8Qlo8XDozRJzOoVI66wZ2Yw==
X-Received: by 2002:a17:903:1aaf:b0:224:1781:a947 with SMTP id d9443c01a7336-22c358de2cdmr12563915ad.21.1744785602483;
        Tue, 15 Apr 2025 23:40:02 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1d3cbsm6459055ad.97.2025.04.15.23.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 23:40:02 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V10 03/15] MAINTAINERS: Add entry for Rust cpumask API
Date: Wed, 16 Apr 2025 12:09:20 +0530
Message-Id: <9115c43e4eae9fd958344e7befc945e0e649a6c5.1744783509.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1744783509.git.viresh.kumar@linaro.org>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the MAINTAINERS file to include the Rust abstractions for cpumask
API.

Yury has indicated that he does not wish to maintain the Rust code but
would like to be listed as a reviewer.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Yury Norov <yury.norov@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..bd7c54af4fd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6237,6 +6237,12 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	drivers/cpuidle/cpuidle-riscv-sbi.c
 
+CPUMASK API [RUST]
+M:	Viresh Kumar <viresh.kumar@linaro.org>
+R:	Yury Norov <yury.norov@gmail.com>
+S:	Maintained
+F:	rust/kernel/cpumask.rs
+
 CRAMFS FILESYSTEM
 M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Maintained
-- 
2.31.1.272.g89b43f80a514

