Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF9B23AB87
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777112208; cv=none; b=EEnpwzrPhjtC292Y16LKaObVfimh8SZ3tNcY0FsMnNPvhX3pLhmZQgbAqyEjbILshArlnHoC/EJDTG/1bEwKGBkAure8HVIi1UfzWs13PTCTKn0eh9KqVxqjDqMhLchrbZKl4wAE+dm4C+EZOoXyV9dhD0biFsXi0Fa1FUnrHBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777112208; c=relaxed/simple;
	bh=r7m7FpHYgiydjDQCQcBkepufb4pRl48h2jOvTY6XEDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+GSwvu2wugX+ENfWvyjqIHmZFOVqwOmyRIow4TiNPX0xpJPVgoOIsLRXiPsgyaM2KWEY07yX3090S8PFiAnZN6MBAULCox/ry7gam5gcuLDEQqX3dppncGKN5eqWCCxFOnRQ/NSB2QoCw88sqoFz57qMlV+ZZ1O+qHDilZ8EeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UB/n7zJf; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UB/n7zJf"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35fbca04006so4391667a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 03:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777112206; x=1777717006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzhhIdYTUt6DzpmF/J/TCQbQZrpDtXG+91ilSUjB94A=;
        b=UB/n7zJf++c68NNbyTO8vMlq2vn72zy8TX+6pl6G4i9ndMScXxZvqAzUVeU6tnz3xb
         9bRj98a7wyG8axBKkHRxOsUiwPUgS77/CqGl3RafUB+hbikSJTCtoSS4HhwSuVBNUHrx
         92/gmnKb670tWMqn2Vy305fwZmz50ZDo4eHzNLJMO7UuNquEWKw4wn1WxSF1Plclgk9+
         kShHzNkCOSq8jF5LZE3AOzz6aJ9LLQY9Rt1Rs4cxctdx5vhnNfV2l7dwMktdR72dDg2B
         Pe7e9j58UYDjDOnMKllESESblJoMfv15mTmLKnrFvT97UX4CCPD2cIDNwyCj7N5BxQj8
         pXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777112206; x=1777717006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XzhhIdYTUt6DzpmF/J/TCQbQZrpDtXG+91ilSUjB94A=;
        b=f38gNo9e3d1ARL+eoR07VU8wFD6H0dL1UZaTucPjFRBsZv2Kto/5jfzFX88B4KBGgV
         6VZ3IqyUHeY9tOMXEvYSz6ZC1qUIOqJyP7+2zfiaQRf73+0SGB90XXOhpWmMZe51Ej9M
         bXzzc1vvFXvb9UXW+WY5qel1fwlauAS4fgoLEntq4cxvHepYQSHxP5h67HK8jKaADjEL
         sHwTuS6pj563MNGBNJsno9ubLMCysTD9mplMc5HmUmis8BTHTiAMPTSAOWoDDm1QP1ZZ
         Ky9g1T0xtv16BOvmeNHRcqqEuCA7v/GwgpDNsaFHwxEjEnuSyeOi+6mvxU2vUd39mst4
         tGDg==
X-Gm-Message-State: AOJu0YwTiXOPyTGL2azQ0Bmw7K2bAu/+3Cg6wcULBBAIucFt64mx6Mwy
	9s/1D1r5mmMefzik6sMUajcsqLCaS4jFfIb9UrKPm7gQVdSJufuh9mrqI5H0q+ct
X-Gm-Gg: AeBDietC4yRUQXT7MUD+5XhtHxpDskkKyk2cVSZG0A+RDzhCnM3N/OK5PRIS/A/OB/z
	9/+36c+lFBk6o0SV/2WQnJtY5LVtLW7a5vjZYP0lGxZlA/9R1kOzVee1Ru8QgghlrEW0C2RRk98
	B1uA1jnQknLtkLSR97QRJ+iqY4kYLj96eLSkknYoQTEBzRzQeyr3pOMm4L61Gt/DJriNvraceaA
	J63ksNYXfvnVfVVOYcN3dCeu/rY3jw6y9g08Gj5SI7yBZ2BDfLlpCiKb6AO1xp21WWGn2shI4Ky
	Z3kPTCSuWn/L461AlT9MN9tvp6JmXbEYUAWWrA3F3+zv8DCFlMDCIaVb69o6hthZap+tC5qJ2r2
	Qj8taxQKYQeTez6eMBGkUNZBzpD/SLbSwtie8In1J+An5gRgj/NGYibyrsohMvBFvnpJC+EylM2
	8ORC8u6qMshpfhIk44776uteat4XApgwuN56kvaHKCQW4dX+mRJKPZMkQteA==
X-Received: by 2002:a17:90b:5288:b0:35e:5051:fb18 with SMTP id 98e67ed59e1d1-361404a2830mr35938103a91.26.1777112206327;
        Sat, 25 Apr 2026 03:16:46 -0700 (PDT)
Received: from localhost.localdomain ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362bc4f9360sm9883027a91.1.2026.04.25.03.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 03:16:45 -0700 (PDT)
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/2] rust: alloc: fix and test `Vec::extend_with`
Date: Sat, 25 Apr 2026 18:16:17 +0800
Message-ID: <cover.1777111268.git.yu.whisper.personal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an incorrect SAFETY comment and add a doc test for `Vec::extend_with`.

---
Changes in v2:
- Split into two separate patches per maintainer feedback

Hsiu Che Yu (2):
  rust: alloc: add doc test for `Vec::extend_with`
  rust: alloc: fix `Vec::extend_with` SAFETY comment

 rust/kernel/alloc/kvec.rs | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

-- 
2.43.0

