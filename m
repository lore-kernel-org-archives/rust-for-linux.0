Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD0E2C0F6C
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767340329; cv=none; b=q4cN2ePfy5+ba0WnFhm+nh7C9fADftQXIbb6tMbMB3exMeZ8YaF6IQppeuT1BpqeMIrrtD9L53qDeu5eeC5J+lyE/k5udnhuHw9umfQJd4g8qMNcgArHeQke/1SQjJN93lOLSfR1KDxfcADo1ObNs1/ggU2yIoP8vVLBqwYsylQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767340329; c=relaxed/simple;
	bh=Q6a+OL7+xR7FBhQ8E7EDUAYDtakbQh4kXFo9WQcfiXE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IGopv2xvUGs7McUiRGSyIdVLy88p/vptiyo0Vo6AJKT4FKp3sd5MNxnnv5bX/6M6Q4gf7dG2sKqW42Pm86WU/91/j+CM80TVu7hAR71MUfMVDB/tMRar6Lb1I7CHT8UcSt7n/VKeXaWVy13DxB+WUQl0c4QX+w092TrflccOxmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrVVpHmi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrVVpHmi"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59583505988so18173066e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 23:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767340325; x=1767945125; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W2saNlD4YLRu5eDzJ7LgWITs0Np3bAKpvAb8pzQ1AsY=;
        b=NrVVpHmizjE4mIj20v6VAcd7NTVhEMALkpAcTCXES90dEZyexJTNWpR43TYVDKv3HA
         moTnaz6Gq7lvDdcJikRFn/yKGXDgKgmHmNUvAiGpoAMTBQIpBsneQ+7UEHFnvfDeRkGa
         xrXOKScaUEbgN0+ELz9owQ8aim/0vvB0KViXuhzqH7MXcKNEesC6e+C3notev6ghfVMo
         rgmShidTkH8kaPWQ4dnnnL+drtOOzsdhSWLXpZtsipDOjMfn4ZFD4Vo9335eUVoruYIi
         DHR0Qjjlkf93WFtx1hxyUTFLPMRiar32d54GIiDjStzyVmKw/GqbON/X5/b7MUpA24l2
         LF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767340325; x=1767945125;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2saNlD4YLRu5eDzJ7LgWITs0Np3bAKpvAb8pzQ1AsY=;
        b=qXIz54hAi16rqlQYQGR3SxVzuuwEDgDBsNl67vxxeBgs/JA4s1twccGHcrARyV61Qx
         fIFX9969XPJtq2YPrn95PkkueKtANoZVGL5X0kM60R5d/93sGFGiASAPSP2aQXftr48g
         npaAviw6ooBRLNk9LyU4ChF8c894H/7yQuq7uNxvSng0FVdLZMSM6euEqWYa52pSiYmc
         MQ9kw6C/02JKz7vjuytZumXJsaK2PhnE+PWKRXT/lkFCHsVuLDQrKLt0bO6wbVrbnHlH
         Fa7GDsH9p0hO5qqwzW0GGRH9zm3DUl74XT9MXQ/woIpOZyTYULu7IgtyrH45QOaqvrg1
         X3gA==
X-Forwarded-Encrypted: i=1; AJvYcCXpshx/TiIOCm28LpP+AaPY5GhfcgQ6Ka9K0LO1zY7GOed72PsB6j7Fsu7MUesoswYXIKMen6Qx68ulNUK/Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHzr6uqoIvZCb9bB86QHemR6VeSzExoOoe0BzZRUFl0orOcMJo
	QTU6hyWcAe6/E3gxa+NeDlFTuduaWVn2icmyrzUCjZfZ82HxrwOqiF5E
X-Gm-Gg: AY/fxX6WgiyWjyjNWE/V/zXDNQenaWoy8p/jE0t41s9ZyGIpykH8xXpMbyRgjuQEj8w
	JymtJ0fIpr1ikNQVmY/on6H9PJLUJJXRwbQw8Lb3o/AV5i7LUpjTq/o6A3BmAwSOGfmjVJjbRIa
	ESD+nSUF/v0WIhpX4p6+7vXNCmELIczNF5qvRfUOK4JhXnB0lSCJpVhXcqKt1/FQTJSM07Q4Zte
	d3Ihh5RDizlW0MftQM1qOhAOIshy5YvU/JPI//oP275dT/6wycU1gwhgg9yW+UWHuss6qew0wpv
	qAdVAdOiKZrT7wUzeVm7PN86BF8xV29augR0PZfqfcjdlbFtqYEIdM1iZmT6VansVyrS9gD3Pdm
	vt9rRKvBe9YVV97k+oGq3fD17co6GpdCSzoR+tK1aQetFj2hRviksRodXeFVsvTBwi8hJx+SXSv
	PdISYgCJZpidVls4lZv0KfeG/AH6SOk1brmQrsC4pKLnds
X-Google-Smtp-Source: AGHT+IFHAcifTVnP6L978ufKvxPiVZE13KxXx3nNBPeRryrxrvaahWms1Vw2tRm6qz5m0DYaU/2MgA==
X-Received: by 2002:a05:6512:12c8:b0:596:9ebf:25a2 with SMTP id 2adb3069b0e04-59a126ea38bmr13792586e87.19.1767340324877;
        Thu, 01 Jan 2026 23:52:04 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com ([83.245.248.13])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de35bsm107688061fa.7.2026.01.01.23.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 23:52:04 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Subject: [PATCH v2 0/2] rust: pwm: Fix init error handling and tidy style
Date: Fri, 02 Jan 2026 09:51:40 +0200
Message-Id: <20260102-pwm-rust-v2-0-2702ce57d571@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAx5V2kC/23MSw7CIBSF4a00dywGaOXhyH2YDpoC7U2kNFBR0
 7B3sWOH/8nJt0OyEW2Ca7NDtBkThqUGPzUwzsMyWYKmNnDKL4wzTdaXJ/GZNiKNU50w1DHVQr2
 v0Tp8H9S9rz1j2kL8HHJmv/UPkhmhpBNKtpZpIbW5TX7Ax3kMHvpSyhe8uTOroAAAAA==
X-Change-ID: 20251219-pwm-rust-7df846d0f183
To: Michal Wilczynski <m.wilczynski@samsung.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767340323; l=984;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=Q6a+OL7+xR7FBhQ8E7EDUAYDtakbQh4kXFo9WQcfiXE=;
 b=/0urX8Mgu/X3gLbseyGwjoiJE5i3Z41wlNFwEKMo5r8VPH9v9yim7Wp2oJ9A6/sujHEX/KA8h
 6lFDJAv/o0fDtFMvrTtss8G6Mv+iqg1WaGorxcYWm8dac9Ce7JsT99V
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

This series contains two small updates to the Rust PWM bindings.

The first patch fixes a potential memory leak on an error path during PWM
chip initialization. Someone needs to decide if this goes to stable.

The second patch is just style-only cleanup.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
Changes in v2:
- Use inspect_err().
- Reword SAFETY comment.
- Reword git messages.
- Added Fixes tag
- Link to v1: https://lore.kernel.org/r/20251219-pwm-rust-v1-0-46873e19679d@gmail.com

---
Kari Argillander (2):
      rust: pwm: Fix potential memory leak on init error
      rust: pwm: Simplify to_result call sites and unsafe blocks

 rust/kernel/pwm.rs | 53 +++++++++++++++++++----------------------------------
 1 file changed, 19 insertions(+), 34 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-pwm-rust-7df846d0f183

Best regards,
-- 
Kari Argillander <kari.argillander@gmail.com>

