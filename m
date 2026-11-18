Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015745;
	b=OyESfz5Gt94VEOlc7jet/5AforTXDoWaXZi6PFZseTDJ0xm9WDckatcRieSKhHKHTAOh
	 RKdam98vYDoMeiB4PxHmOyCcS1p0T7MjwIXJwVZ1xRo0p2iDtkjmuvfYtpQC3Tejv+y+m
	 LjOCpdhQri44CxZyj/BiDhXhpWh8gCRshUKtDSDTKsUshcDRxUs3VrME/Fxy/nVDnuDPZ
	 BW9inpAx6E8rfCvTx5SSv2e9nvQN3cMJPtt0T7ytfI2Ztl91QVSV3hTbQ4an2xvjtpZ3c
	 cMegc/G1qHOCsP2OHgzcIgAfVAGHn4o8ryijZK5ccn+FllM5HBT+p3obaea8zI3Z2IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WjQ+lJ948dIG2BXocv8WBAwSlCVPjavCtkad1QsAfjU=;
	b=Gb+KGUQ3VcJKpc1AvGP41LmlV57L3ZAXH01G2xW5vOx/PNZ5DnkqNeFJqa9dY+eU+d8B
	 ZAAIRpVgV4C3em+2cUCN/mz3CRoqE+I0smgP41NcEztCKl0Cjc3MOTw59BxNCLqRK2BPV
	 akdKGie36D1f7NgDQ2dAG7216YkI7Wmfj2TmNrKBGNcULpiR3N/woNFeLVgAcHyYkZlb5
	 41i6MnSVQxRZxKTDOzM077k39RnG6tJS6roXhnFv8hgFHUD2l0ul3KwEPTkX+KXJ4CR4u
	 pcDZH5rBOrz4LijCeCK2W/ltBHxe5Opo/xfxxT8SJReVFeXE7U1gEIfL9zGm3WFyyPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hPY7twFf;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D84606A332
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 15:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99D84606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hPY7twFf
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb68d624baso11556725e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 07:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795015743; x=1795620543; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WjQ+lJ948dIG2BXocv8WBAwSlCVPjavCtkad1QsAfjU=;
        b=hPY7twFfgYZsSLpm/wBE8tsEMaXzEm/nNAVYiPPBA9dqn4wo0krrCyqdAl0387aRxu
         1BkfEWIFZWDQfdt2PUiUWMxYoKJC3IBq601vzPk7GjLZUGwH2tFs/7M9TB335oxhkLsY
         RI7HVnzOzF2zUMAfM8S6a4TImmXhOlJp+GY7cKK+7fMHinhpy8FSvoFSuwEpIzvAmCBk
         kCcVXAhFajBtkmn43NVyY+QpiZmRhsI2aYK4WKH8VJdPZCBpu8zBsiHqFQAOyTSkCRKA
         IzsVxA4hkULC4h7dTed3Koig49lAAwp1aAvSs0S1HMf0JKtFMR7BTPEWTLFNa4JaLcCY
         rdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015743; x=1795620543;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjQ+lJ948dIG2BXocv8WBAwSlCVPjavCtkad1QsAfjU=;
        b=IlbOCXdDbkOdk1afCr/quKoamUEMIUFv9bBhEzNJC+gWAohPHulAo9UNGY1LSYl/e5
         EcRayvbAVikGKfAcqAMRaS6dKeCQvc2knlMv83VdLs2uMxAdwSuJQiM28oxHdNqvvyx3
         tzWpspyx5sGw9OzynNFmJOoljW5u5SfU3bKgc6Av9TlBEnKBiGim2PZ4X1JATjTI0hXR
         1tKdTUIVIDFbcHgpmN3Jks2Fw6ypvv8IkY3k96YVzMtEecNX7S5RhboIDUxRQTFovkTI
         VcFDmURKMgO45JgVJOt0ztSAO5bIjEuOlEFaTEiUVCbuaJbBrxagM4WO7xsmSoFkXMuv
         mojA==
X-Forwarded-Encrypted: i=1; AL+hErFFFIOY9tP/wfCfGP+CFl8Ol1nT532J8YfByHV6SHJrhU+ci/xi1Pff5g8+/5dwsEQCt87MwIoB87GSJwsNLQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JlDsrIu7tJprFgm35x8M25uNRcLXDNx6OrwJ/wRZ7r4qIsD2q
	Ksma/DEMbLPIJugvKrBGv1QjP/WZlRgudNri3huYv5FILZFEkGEQ9iRBQx4yr4/Ye/IYy6YoS16
	hLjfYdpBA/Vu2ObCYGQ==
X-Received: from wmbeb10.prod.google.com ([2002:a05:600c:678a:b0:4b6:5d12:e070])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a55:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb7da2bd37mr54038905e9.30.1795015742420;
 Wed, 18 Nov 2026 07:29:02 -0800 (PST)
Date: Wed, 18 Nov 2026 15:29:01 +0000
In-Reply-To: <20261118133232.48603-1-vishal.moola@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118133232.48603-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118152901.788942-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: ioctl: fix call to unsafe function
From: Alice Ryhl <aliceryhl@google.com>
To: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	Asahi Lina <lina+kernel@asahilina.net>, Lyude Paul <lyude@redhat.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 01:32:32PM +0000, Vishal Moola (Fractile) wrote:
> Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
> Signed-off-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
> 
> --------------------
> Based on drm-rust-next.

Note that patch commentary needs to go after a three-dash `---` line
rather than `--------------------`, otherwise `git am` / `b4` includes
everything above `---` in the commit message. No need to resend just for
that as we can strip it when applying.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
