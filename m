Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE55182C3
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 08:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722412830; cv=none; b=Ze+O6S2Rp4X3SMCOS735YfhYei74ulkKG/c0hKFHdbMBMJHgBAG0sN9AlvUliVf9WJqG60vE2dN2L5POEcs8Txd3jh/aXH+sJV43MXPdQxY1S/m/cwUI53ZFMMRavf1srUqiWH/V9DuHFoIUbbOiGoG4Rf/0pI4Gu0yFGJzZkbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722412830; c=relaxed/simple;
	bh=LC4kVaas2E6ye4fF9u5SOI4TTdn8Xq2lZcZsTL0WTwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K18eThF6V1yvmzwsFhsgebr/0Vc//goYug6vDIDROxOhysFZyEpRyzLHYNE6rHxxTv0u4i1Gnlmzq4d+wNeKxCS/iOXvQ1WbE6B3NX1UomGf9Y7szBd+2hQfsBIaGZCgM+5zf0j6d/evJHXV3aULxyZoHdeNzYuyBHV11PQEcFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2Y1T674; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2Y1T674"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-70940c9657dso2664305a34.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 01:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722412828; x=1723017628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LC4kVaas2E6ye4fF9u5SOI4TTdn8Xq2lZcZsTL0WTwA=;
        b=R2Y1T67451CDvoTiRIyr07PkRM8L9jMmkXRaZFx0yCExJXkDN9BGVrboXjMuEbSH9R
         pWYFKzokYEtzSUVubD3Hkib1RbaWhu25Rb66G45kMR7le8Tv0UJk8EyriYhAzXYbiifc
         WaH38OiU5qGWrQTX4amluj79lUULkKCXuztruPWzTEdNS/6bnyw4MvksHohQFiQtw3NA
         3GVmeSNw4+ifd7fS2WmRxwTJNXDPRo0kSSzK6lxp2q+A71sdDtCerqnUTXMifYNnW8b+
         2z4UF4VyLYswEerXEr38PSyExlTwdzzQ8RbCFo9Y4WGSSINlY3I+LBOpnlG/mVIW6C3B
         G+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412828; x=1723017628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LC4kVaas2E6ye4fF9u5SOI4TTdn8Xq2lZcZsTL0WTwA=;
        b=VOTsUGPxAfH5OPEkiUwjf3he/mVBJpXcS0z8L52WL1vZETUWqQJqeUY1f+EpPk6/J0
         kgYb2qViGSoQwTEOOimlHKEVCibJKjw9lcXV0JDMQGSGQx3wfBAY1K6GHExUR4Xw0jJh
         zmk0FbJQyt8G6WyIOcbcQAEX0zCmMyY9c8++cBOB+qdBn5ra+dhrCJ1LUTocNHUStLZS
         IjXAVWOALSgJRoM2cTqYonfYqArW3MogdE3AXHN/TuipAp50VxmZoiK1HpAI2lS21Z3X
         eiRcq19Gf8D1Y0TR+tD6fDgkh59gMb14kOiAM9wb2Yo3B1Wpeknfl2zG7GqOSzO0/uBz
         waug==
X-Forwarded-Encrypted: i=1; AJvYcCWsp7D48YVRfvaAglDc4y25aOT3EhwwZv8N9MeZn/9ZhezIXVD2geyFFUYFQ9mgMyoSi6WbthsiLvCsSlGTzZsqJAmzmloPbGq0ly8F2Xw=
X-Gm-Message-State: AOJu0Ywr9yQUBsH4SJ4o8kY0UQnNBQel4hx9hciMBDws55pBuu0/gsh3
	7LoJg4B9gL/BG8Q6+wIlijDXSc0MoIrIVKvTK0uuDaR8q7WNrBip
X-Google-Smtp-Source: AGHT+IGI+y5qC8itjtEdOMBqE0JKivKf76s9G6L+QKR6AVhBPgmsqctb6pi8TdeBrKodCgn4oP8rkQ==
X-Received: by 2002:a05:6830:2786:b0:709:441a:351b with SMTP id 46e09a7af769-709441a388emr14138929a34.8.1722412828297;
        Wed, 31 Jul 2024 01:00:28 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f31:5bdd:9177:d907:56aa:2044])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e333asm9466567b3a.8.2024.07.31.01.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 01:00:27 -0700 (PDT)
From: Sarthak Singh <sarthak.singh99@gmail.com>
To: sarthak.singh99@gmail.com
Cc: a.hindborg@samsung.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dirk.behme@de.bosch.com,
	gary@garyguo.net,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	wedsonaf@gmail.com
Subject: Re: [PATCH v3] rust: Support latest version of `rust-analyzer`
Date: Wed, 31 Jul 2024 13:30:21 +0530
Message-ID: <20240731080021.195732-1-sarthak.singh99@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240724172713.899399-1-sarthak.singh99@gmail.com>
References: <20240724172713.899399-1-sarthak.singh99@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A polite reminder to please take a look at this patch.
