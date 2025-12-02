Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EA032570F
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704327; cv=none; b=N26YoMFp9XvocwwTzZXWA4fTB4bkQayUk6uR5K85w+DY4+pruORTr+yFTPFbf3MDQHbVKwKrsusn16Hd4eXy6VPjrYE/hkosujlH4LwJH0x11ysEt3H5Z5Y2qFppY3EA7AZRei7mLs/35HmVim0n41YAiwM7Ulecgs9UwGXp8ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704327; c=relaxed/simple;
	bh=+VIXiWvrLLUPSr9F++6Z7/xQPHblhODET0SGWnquYuk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WJ+p14zpWUFfrHEmcAAwnWTWJ+kmPijEt/3PU7Ln6RjNZmxYLzZ/1DdpQir+/cABCLMUx7Zu0pAu/z2tjlEt0W5UQgk+oFaQesaSeDgDtY4ts7iyvVGj2fN1S2dFxTT7Eg7SwtpL/tpxAw9yp9vDyIekhgB3IyqTnEdcRzm0hRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mpWOm+Q8; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mpWOm+Q8"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b2fb13b79so3108777f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704324; x=1765309124; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FCXFl4806rrcLk+dGcsO/+pKT+b/kulWmEySm1qJxXo=;
        b=mpWOm+Q83dYgfs1WKMNPOGheRtRz0TXhfIhzBS3j22Mxx71mqlp2x6JmDELv5lLC62
         jWtu4CiEFZ8dxn43tW3wuNeYDprIRFF7DsGwyVl+/zdH1hlIXPZ/eJPfHPncSwGjCsQE
         501K8CIi4P80+1IjIJVwFDsf/4HHJ2XVA/c0alH6s4Dscf2539lKK4vT4DEQo0EE0i2A
         x4tHxDG19xhKC8pHsaJ1TQ3bqw59S89Cujna19ceiqN2J4LffqVXdNtxdgjYnkoWqXQx
         rS0Vvub+ug79ff6pnS8OQcWm45n/P4df0iiw6r1lzXSAdYVeVltJ78pBJhTiwhm/KGdZ
         3zFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704324; x=1765309124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCXFl4806rrcLk+dGcsO/+pKT+b/kulWmEySm1qJxXo=;
        b=F2iMFOQkm5acFOQ/hPkNZ97zavaWg4/say3LM7BQ78nkqaBrCfDBDMQ56OSzXFo9Ul
         0LG7ENhx0SvQGZBW+pkEUkOeE7k+7V1i7f6RFbr1fNyjq/E21bPnfHvx3/cI6Gk2hEvN
         0RYWNEzqo66rlmdvRarHsNF2Hda3SehQSE3a6fbHfNj7wxnp3ftxQObk1LQk8vrROkN1
         BMDZSZOUJB27p+MfYfjwLUl97dThO4tL42CaLRDTF1+ASCRyaXBmNNHA3wYiOr+LhHhY
         MpEGhoV4RhRc6CYmyGG5q8jdy3Y6ojUscHqXiMLikdD8BfDuIpkL8aiY3cSrK+xrHspP
         KEYQ==
X-Gm-Message-State: AOJu0YzjxildIUafcKyGhjqRmCTOKUXsmkdkTI8U5xYHK9DeQfsByJe7
	albno+mZLuF71zI2kfN+EF11/bRDo0Gl9Ba8ac3Ul0VzvahRdECtTOxftkjCRf7/jPy4jT7L4jR
	at1Gyqp2T20VQijONCZ2iUWgTOfWarpQRtQ5hBuiLhbeQ/m/F2NT3mDfCzSpHFoAaGw/yXr6IVk
	K4dhp3OmhepKAA4TC78cmMT+y3JUbQ3j2YddH2RLmXp8mfCgqAK4R9+8a5Mg4kjFI=
X-Google-Smtp-Source: AGHT+IEhcya1K6x+pih8KjUYpSo3LZCMbw+ThNVgSxoNVzl3BHBMxCaSakgHBjbE22UzWv+My5uQpi3ZN+K43iU=
X-Received: from wrbfq9.prod.google.com ([2002:a05:6000:2a09:b0:42b:39b8:85b7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:22c9:b0:42b:3e19:b650 with SMTP id ffacd0b85a97d-42cc1ac9156mr44205239f8f.17.1764704324360;
 Tue, 02 Dec 2025 11:38:44 -0800 (PST)
Date: Tue, 02 Dec 2025 19:38:07 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=844; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=+VIXiWvrLLUPSr9F++6Z7/xQPHblhODET0SGWnquYuk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0ALHkAstOY8N1aChfh3zOLSvq4Gcx9ier962
 GFgrWbGDEGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACwAKCRAEWL7uWMY5
 RljbD/9qe2RtN1DxIsZj+SxOWmCyG/N3rxYj1vH8uJPWwRT0kLX1q2p9H36Ks/TT2FbSrRfraYs
 xxAq5O8c60v+j8T66ySBZxJyRsUAMSLEhARes12yaqkEhga2MvduKaP5RqaOnQsLzMCJW2UfYZX
 fPzjwI7wXkt+/1HNuDGFHKGeMFyx1/kTQy+p6hYuZIE+k3J0saOCoj4RQiQGGYwN1Jc7aEduLA5
 WatcVu2hlrtZscoy6DtwgMDoG533WUmEg+5xyCUVQxc5cBDnRY8hDOltNNeNWeFXUYyw2Gr0X3d
 Ee1taXSkTHPPPOKVt7ZqFEQT6JOBB+OUZ17YHwHNUlY8iFA8yHpuui7W2aIAv2LclLl7E0cDDXy
 VAoIjI+zOJbPUiONPzpb8biftEy3H1oPO/mN9ahRBnRsjPlXzLtkTBuCu8MiwGihFJqzTZEYA53
 eDwNCCcgPiIa04s6LoOmXRJfs6WiO+9o/GyVmzNxK+5U5lV8wogS4Qx+qZ4p5DNogkxOZ7hFWMr
 dB3ChQ4nQvealC9xulAGWXOkOLb+zGKbofcHVQA6IGC93uHvHN+MZA/iKlvCdDLueTv7pkMm/jC
 xjS+OdOltiooPvT/upyFJVwmDlBBem6z6rz0qX/mz9OnfUNNjs7YJazSo4htAKvFz3bq9BiLLZc sIuMS2ePOdxvO8A==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-43-a2e13cbc17a6@google.com>
Subject: [PATCH 43/46] rust: usb: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/helpers/usb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/usb.c b/rust/helpers/usb.c
index fb2aad0cbf4d26ac7fb1a3f176ee7a1d30800f92..eff1cf7be3c2d10b7e9248252d354eb8a4fd4c94 100644
--- a/rust/helpers/usb.c
+++ b/rust/helpers/usb.c
@@ -2,7 +2,8 @@
 
 #include <linux/usb.h>
 
-struct usb_device *rust_helper_interface_to_usbdev(struct usb_interface *intf)
+__rust_helper struct usb_device *
+rust_helper_interface_to_usbdev(struct usb_interface *intf)
 {
 	return interface_to_usbdev(intf);
 }

-- 
2.52.0.158.g65b55ccf14-goog

