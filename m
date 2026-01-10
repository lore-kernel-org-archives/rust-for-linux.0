Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B60347FCC
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057781; cv=none; b=OzU4GqxJEtEV9Zw5Q+uOvwIEQger0Fi0EodwDNbT5jSYriVfMX3rNeOJbqBT7v0RqDK4fIo3jdJnTcSL9Fx3hBbkXh9fAZ5ahAwpxhhi7vFMuSjKe+4vs7wgbILfPfHfVEqJD0es/X3ji+9AdxHjuDVrZ475nMGL2hwZqfO4qJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057781; c=relaxed/simple;
	bh=16z+/p9/lej3nOQDzP3jcxjHTQfVy2r7xALqKBRkYmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KpYLfc5yOvdfrNGSeh7f1P1lV3XFqF+9mD/UEG3CQHuolEUOXFrYdfN6pBvv+4BXCQNeYDo5fecJUWzXTCP1be/ks8X6X61TK3Uh1dLZ11eiEmixHDQmeEyFHH7tkg6ZhSNR/rfD6b12ayLpjKRhxyt1cnWSnppUKPxXFluSrJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDYtQ7bY; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDYtQ7bY"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b710d46ceso3959223e87.3
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 07:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768057771; x=1768662571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlDCOqcpxSYZNQqRknLGjEy40YAMcG3nssNg0J3FjxY=;
        b=VDYtQ7bYrzbIpfZr3TKveqV+L0Vt92aohVqmBQpLJOuvNZrmYy9iRhj+hntu6mX6F/
         I3eullZ1g3ehZQoJ5MpgNASAedkVjsK7IgSlbadGEj1yGbgB/PyKaamTQE9vURL6CroJ
         RaWFnna4K1TkF1HG37OwWC/BLmSH8hqwSPnsu43LGI3+wsPK9JrX7IdPWYmHOD7BFLnr
         Ll2bkZ0TKiXrfdjti0gNp2lammdoNfSzLkTyvdOWN7HBB+7FClyNNT0SSs7QrG0V11mS
         87eZw1u8tEadA7h7uoJO2yEOXKwZz/yFUFku8vXOxhE9w48U0v2xF3SyngfrIN5v+1WA
         Rdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057771; x=1768662571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JlDCOqcpxSYZNQqRknLGjEy40YAMcG3nssNg0J3FjxY=;
        b=pQqhnOIomHHtg+qBR35LgnXbIezfvEi3wAjFNtByFRdfONdvGwCiyY8tLq+/ksVYUl
         pT2n4KR0jMz3yM6DzjJ3MPGt+fKC5il/n/AQ01sbbQzQ/BUnDDzb6QGnSJaErSjusCqd
         nP7mI2E39GxfMu3+DPC2inOgWBQsT3rvEXL2CMp/7BzLEe4nZk5FZWf52lvT0jZjieu2
         s7Rj6y0QEPKj6cUhAlO8+kUlnAmh+Y7d2ZWTAv/0h57qBHoxH5FtxhEDgZW1/4FpIeO6
         o/j1ukiYnPf6GKkaGY46IaUQChr/PBUUyk74mSUMPUB6T+TCCn0h83yjyCfYBfWtq4Oy
         RxVg==
X-Forwarded-Encrypted: i=1; AJvYcCU83ECRE3SOEBYFA1SY8R+0m5YQrF4jd9cI4AbQ0TaDzYsbGrMdM57u3tDPtlnNzyjaEUyKSiPHj4PwMGsaJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyinJxMiG48StJz7kWIOAOzyyrMKxXLQ10eEHGq2j9IK7X07ZsA
	QrZXAfC5mdyiwDMgbrqn9CLmHh0Hod+Z1/+zr73sQTnImHACTjjwAcIs
X-Gm-Gg: AY/fxX7YAVm3r5GlWHF84q07EVMR8ttNF22k9fZaH/5EHm6n1AZDYgMt4cEbE/N7/s+
	46ALR/T2AxM9US9trGkYF4UEuqtiu/bW6P8WSVkMkVjwcVVsQw1av3/QrzcAqIQjJTuQKXk1rLl
	RQAzRF5/isYfU8tYL9/DrlQTSCZuttbGViiOlBdlsCAcxkvjcfqYNu0IMSAAjKQjp5KyFLEoVZy
	6BP3ja8rWCL3Ekbj3+w/1tZumrsdU5cPXF+r//tAj/smpW5yB6ebj1ClW55oZDH+B6haOdzUpS/
	NAxBEkMkh5qvIdzp7wpSBn7vvS3/xzvjGojkAupr3NoZzsZr9gYm0Eps6UxoNRCVSFtybgLMFMt
	wfS7wmlYVZXsT/1EmqgNePELaCooBwgc529USvSTvXAUqojP3HCwZL7bgoz4AeEITLsF5tkDsar
	NurtxMKmgeFHg8QHiYfE9qVe3ID6WY64bi6RcO9fZqxJedjp9GJQ2TJ+5F2A/wStcoZEYVdUVjW
	Ok/l05xk5A=
X-Google-Smtp-Source: AGHT+IGPacMYwDU7ZheyDzxzZJyrY1/QIDRayqvxVVTESHnbCTj5MKU+UYyTZd3q0INr8ESQRaxDqw==
X-Received: by 2002:ac2:47f2:0:b0:59b:715b:4fd8 with SMTP id 2adb3069b0e04-59b715b529amr2926411e87.13.1768057770686;
        Sat, 10 Jan 2026 07:09:30 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-148-7.bb.dnainternet.fi. [37.33.148.7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b75543a64sm2137059e87.49.2026.01.10.07.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 07:09:29 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 10 Jan 2026 17:08:07 +0200
Subject: [PATCH RFC v3 09/15] gpu: nova-core: use THIS_MODULE over
 LocalModule for name
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-this_module_fix-v3-9-97a3d9c14e8b@gmail.com>
References: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com>
In-Reply-To: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768057742; l=801;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=16z+/p9/lej3nOQDzP3jcxjHTQfVy2r7xALqKBRkYmc=;
 b=2ckocfo0Z4z6nSjUTwSYROhT79u6Ea3s3woTynS15mrnKNn85RGMQtrTTrNA6LV8iIWiR/ceh
 WrveCD3jfC5Creqw6HHlcTQlrQlgwbm8kUGr3jdvp5DOGyCvHfXtMrg
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

THIS_MODULE now contains also name so there is no need to use
LocalModule anymore. LocalModule will be removed in future.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 drivers/gpu/nova-core/nova_core.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..c8d6f9e3be1c 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -18,7 +18,7 @@
 mod sbuffer;
 mod vbios;
 
-pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
+pub(crate) const MODULE_NAME: &kernel::str::CStr = THIS_MODULE::name();
 
 kernel::module_pci_driver! {
     type: driver::NovaCore,

-- 
2.43.0

