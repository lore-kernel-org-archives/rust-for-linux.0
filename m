Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F69E349B10
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 15:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057795; cv=none; b=kM8znSQbwNNKg4NyqLyRzlYW2bYEN6ZxLDNkkKjhKajHcF8VLASga4/4pRHo9UrhFB2eYKc6ULJkbgQuE6xb1hnSYSdKOQTNv6+I6crPwuL+qAswWNpBk0pi3OUuvaNvazAX+ZquWQ9g4NuWWGJSIBxgpfD6XUoMuhB/vup3u84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057795; c=relaxed/simple;
	bh=pfH3AGgm+K0TiaxJVDEaqs35RUJB1GsVoRO74Bd7vBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M4G6SKI2Kyz6VzoMn+7/VTiU0Tb9ucJVlp2A+i0ryAq2yLPVF2GZwzToPVeU5YO5xRhVLE2MA7p6X1vKQgDw1+9eL1Ebhxxt35JCi03UcnKtEc2+7gX+GXXx8XgB926Tq3mOS1+ASYIzM0hzl8pbPPvv8kl5yY/lg2IoDVR0REo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUzJ5XyC; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUzJ5XyC"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b8364e4ccso1709003e87.3
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 07:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768057784; x=1768662584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEO230ig7NJAkoe13wY9aF3OcdLkvsjJUe6hRkAMlIw=;
        b=DUzJ5XyCyDSe5px7b8/qIA1OjfRFUhfxcDpQ7/Yo/nvf9q45qfD3FAEK/vesX/vT3S
         gEUYThv/t+baQc2CURHqVI4jTSzZYZDj1Hwu2bNiyFXtOySEhhWsf8abOjQsR+LeDQwO
         dZVXIg4OcMyOGBJ4i/QZleBwBBtZ2DeObV9ypRfLWWEiZ4l3OMr1Lk+X5QJphQxvAaW8
         ZwERNJY3S8Dk1nDhSE7o5wlSGZeW5qjOZGleA7i2pfP4lwHBNnzJUPYMX7o2l/e5xg5R
         wbduCaps4UqRzI/l9b18+4tum/DsqiyBJpBWrt8onTj+J7fBVDibTfF/C2V0cTdRAamM
         2k/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057784; x=1768662584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QEO230ig7NJAkoe13wY9aF3OcdLkvsjJUe6hRkAMlIw=;
        b=bCsb82fs2xPm1vajgzJd+9Uwj8yR0RaYzoPbc0Kl0JPRVh6NtMOS7DEx2V+OOZn/pK
         8BSLBobIOFNI4IG6tMM1ecQWdk7HL+efC9hZgPix+lleD53EFV5kuUVl86cYta98fcrw
         2q33QkRD/vYiSKOAJqQ0l2eryUVd+5Zff6ovNLSn46Y8EU94hAnoUAzI5GvEQSFee5UD
         kO+VPem2+Zys3snIDKl7onbI8EmNZ5QmnPYXWd+HvBX2ef8lbfs1IXkmfeWNYbml77td
         Q/0nsPZXL0WBIooIBh1emoKPjApWJboeUdRWLTEuRwwAJeafL8vTZHFwo33LTvhHQyTN
         dbsw==
X-Forwarded-Encrypted: i=1; AJvYcCWpcpC999+0fqJMzyZ9tH52JT9coFDKCY16feW9zdjGg7qt9YAHXvWJg6H70eOIRfj6QIZ5Wpi2g5vyKFpSbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWeHsX4t9JzeCnGxMtqJF3LrNP0bnxqVbA7+Hr1y+4IWVZT20n
	HUX+40o6+L902KvCCsZneGEmn0TJqmdsz+10kdjASpO1yjnWp+aZDybg
X-Gm-Gg: AY/fxX6AzzV16T+/BC9aac/lKqRLZ0ia1sUqMBHymNcB/YNndyTMuP2LlT05K+Giq2F
	vcxo3DkYnfwtKUqH/zwVvOtwl4HmOgtU22A3Oqq4onutfEUcwnyYBfuGPEGkFgCGFx9XlbLzMTS
	eGdisLE/oayVFgqEOt/SVk8hy/eEKqfp4HN0wi6piv2uHWsyhg/r0Gp3mwiweNLJc2XUIWSkFtR
	4amvK8lS8uw7DFbLhiXti3rF+wjIJ7SJy5t0hzw1NkvaXWta1bW5qeAbm4Pl5kTOLsd7JMzGRyb
	cHPLsTeLcEJsdvMINHwxqQrQF3OzvT8SIbxlmsCpelhShD7LYLYIgVhmwHVYclGgyogufqW1ZIa
	0+k6ewdg1YBnWq8IboBhom9IdEBFI0a8O0IBGeK8Dgp6JRiPvaT3k/mv7S61gXUAWsEWbB/VbFB
	sNN2/unpEtl9pX1GZOXTWUyZkDK0RsV/nie5MfZfSrBw84REe2Wmv3hDlo9LkBjA42YSoL7JkA
X-Google-Smtp-Source: AGHT+IEIQmFQiF0ZLik1zsJlq+OUA/lbf5+EKmbrA0WWELNhEphwh4e3fJyxYtg4u5UlIhAQwIseJg==
X-Received: by 2002:a05:6512:1052:b0:59b:7c9f:625e with SMTP id 2adb3069b0e04-59b7c9f62c2mr1936509e87.44.1768057784204;
        Sat, 10 Jan 2026 07:09:44 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-148-7.bb.dnainternet.fi. [37.33.148.7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b75543a64sm2137059e87.49.2026.01.10.07.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 07:09:43 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 10 Jan 2026 17:08:12 +0200
Subject: [PATCH RFC v3 14/15] rust: remove kernel::ModuleMetadata
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-this_module_fix-v3-14-97a3d9c14e8b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768057742; l=1735;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=pfH3AGgm+K0TiaxJVDEaqs35RUJB1GsVoRO74Bd7vBY=;
 b=NyjzfLzXSJdPJdEypMEaLFZ1UzScd7sLn91FWqga5fbZGrFtuuTya8mHIF9TK+GjZjdQY4J9f
 0F7dL8GFLgbDaw+9kU8HkJChnr21OqYRxiKEYyWkXpspR6iPeBG1oC5
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

We have all information available also in THIS_MODULE. All users use
that already so there is no users for this anymore so remove it.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 rust/kernel/lib.rs    | 6 ------
 rust/macros/module.rs | 8 --------
 2 files changed, 14 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index d6111a44fb3a..3acc60a83b09 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -201,12 +201,6 @@ fn init() -> impl pin_init::PinInit<Self, error::Error> {
     }
 }
 
-/// Metadata attached to a [`Module`] or [`InPlaceModule`].
-pub trait ModuleMetadata {
-    /// The name of the module as specified in the `module!` macro.
-    const NAME: &'static crate::str::CStr;
-}
-
 /// Equivalent to `THIS_MODULE` in the C API.
 ///
 /// C header: [`include/linux/init.h`](srctree/include/linux/init.h)
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 7473a377a3bd..97635aed1598 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -374,14 +374,6 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             ::kernel::create_this_module!(\"{name}\");
 
 
-            /// The `LocalModule` type is the type of the module created by `module!`,
-            /// `module_pci_driver!`, `module_platform_driver!`, etc.
-            type LocalModule = {type_};
-
-            impl ::kernel::ModuleMetadata for {type_} {{
-                const NAME: &'static ::kernel::str::CStr = c\"{name}\";
-            }}
-
             // Double nested modules, since then nobody can access the public items inside.
             mod __module_init {{
                 mod __module_init {{

-- 
2.43.0

