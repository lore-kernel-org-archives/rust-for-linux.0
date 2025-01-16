Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E181D19E7ED
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737016493; cv=none; b=OpOh1C5pmVgarF4OLORzoY+CMPb3jvZY3oKk7pg9XrD4kxmvMklYNKpL9Oh+WtNx/6u7QlehK3UMN3TYVGHG35cr3W1JidEL3hffI0puPR/JoRv7SmYB8A6v7yH64p4XfIXPfrb7XJ31okoEM/rFrQJP8LY6rGKmjDwD9/qfIp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737016493; c=relaxed/simple;
	bh=LIjmW2FX1zEGqj0YeZsDzNV2nEB9HFE9TnEvmxtVOmM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vvy98qMXz5h2XVgA32wtTSFCukDee488HQWarzubqWbvYf16h//Bb4T4rNBzzNKBwjhm362HRZjkvbUOSUCQrJw2HT8UIpp5ByvzlJgvDNrTLK31z0v8xEfJFrP1YN9FdadfzY+Ymj+nRGOQmUpjRZ6eZhO83V4UEPHhZQkxSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=no4QiVI2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="no4QiVI2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2166f1e589cso13717155ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 00:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737016491; x=1737621291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KNwF2TEt3KRdmvW9wJLK96ErGUWCHdu1SXXWgMYjIM=;
        b=no4QiVI228QW59lxM3oNEVBl5FuR7kk+SMIGpcNjNbJoMY3zNFWJd6CEVWD+NA3d/u
         waO3e3bfSx8614uGGLZJuHOu+50cHrCom496Ob2FdEFkAbSzubL2ojnxcC1McFvZlzW6
         uCnqALDPLP8A+7gF9Y9jFqEdcYgMbb4xyve4jO88PkTSvRIN6fX/1/50K7GB9VGFOzow
         wuOTk6fEgs+NidABcuN5kV7Db22TcpEYNDW8OC7ZMWkzuzaZ/9kR1bzx2AResLnd6FqJ
         FaVL8+9GHauoYdgYvl1EbJHNJujsGWVVpLC5fwCd7N2Ce+ICMGtRoV4FjRj8c5tTKgj0
         WP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737016491; x=1737621291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KNwF2TEt3KRdmvW9wJLK96ErGUWCHdu1SXXWgMYjIM=;
        b=kBsz9Ns0iBHpYLpb5pEsKUSsDYUw3jVYmXoKy61s1BKL/xC/6pwOXeyyyxLfrMV16P
         nxsysYeXnCr3WlhGZhg2GgMBzomptVzfPrRCv1/y4DNInqS0MjWe9RoZCY5fJvU/lvCN
         Ito/shwqySiXb0KNIMNU+BusJ3E3OnFDJx3cgjBem77I0mO+0P9OexLgFnTG2dSF/cLE
         76AROvdDlWsojiKI3TiyPhrYw6KunOe19OvWhqiDlUDOrhZ4C8pW/a4Ftq7WSe0ffIV3
         FL7Mq69sBF54MgftgRAliZFQn78IURiPayX0izRQRoIZR0Byc6bD3eExpB03+HhWWgXR
         ch8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqhytxEx+u7XnyCO/sKdr205kCWIjff81GqSe1ZDwYgsIEouqgMiY/qMrZdbGaBo+h0Ij/j/KYh2BzzG+WYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+YWoR9709zg4heNVVUfcEkewbDvGLQY/w5ntfAOHWtHNpGmXx
	9+5K77YfBwSv19G8BYYOgPfEAwiNoihOsWkcdzFdRPfx82PltzHjgvjcmalfaIE=
X-Gm-Gg: ASbGncvJXtZwbrQsa0/m5/VXxokae5/pPdgO1j7jp00riWfei67A8NUySF90VvQm3Br
	4Sji9+3Nrs3Ui7QsfRnMvmVlnz+I00Ua7ZQMRwtOWUJ9zLNiwKPsGLhWRj85eMdPsg15dJYK4Fv
	JtLuUWwSLcl7H4oAf6KGgMR8+afPGVZWHqnQfnJtmb2EhO0egNwLqKhYp+EIrxWRyVLHl/vcqQn
	TGgWOkpQnBT2GFF/ghpaJ/UHkc4aSsmfTcurBamiIFx6SNkSb4zFOl4LYU=
X-Google-Smtp-Source: AGHT+IHrny54ToSeVWMN2zsKMOrjl0BmIDaedi0byUk0NpOqTVW2IMKN3OfazwOByuRgeZtt0iGMvw==
X-Received: by 2002:a05:6a00:92a0:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-72d9cbc7c5amr3212241b3a.11.1737016491063;
        Thu, 16 Jan 2025 00:34:51 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d406a5684sm10372061b3a.165.2025.01.16.00.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:34:50 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: device: Use as_char_ptr() to avoid explicit cast
Date: Thu, 16 Jan 2025 14:04:43 +0530
Message-Id: <a88cd29bf01c8fbafd5c2608357f54ea10f6e492.1737016320.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <e97dcbe0418cc1053fb4bcfac65cc02a0afcdf78.1737005078.git.viresh.kumar@linaro.org>
References: <e97dcbe0418cc1053fb4bcfac65cc02a0afcdf78.1737005078.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use as_char_ptr() to avoid explicit cast.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Rebased over:

https://lore.kernel.org/all/e97dcbe0418cc1053fb4bcfac65cc02a0afcdf78.1737005078.git.viresh.kumar@linaro.org/

 rust/kernel/device.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index c775266ae164..db2d9658ba47 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -185,7 +185,7 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
     /// Checks if property is present or not.
     pub fn property_present(&self, name: &CStr) -> bool {
         // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
-        unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_ptr() as *const _) }
+        unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
     }
 }
 
-- 
2.31.1.272.g89b43f80a514

