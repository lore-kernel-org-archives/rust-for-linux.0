Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353711;
	b=39XkljJUT2SzVJkjaCzLZNV2C3Oi6Er/F3M22ZuV8KYeyesno3shn10REy/JsDWVknGh
	 8/P1jqx7fqJD20KGyQmjzTSNldvdypLTNlmCWoism6a89i+z2GmBcAvameddrvzxrhi2r
	 AAtGq4Xho/zjHJDj4zrZJKGrd/sNglpXJRBagfaDlTRqbs9Y+7T2feHJQtG3yzar4my+t
	 QDRRILId4SWZvEcWC0GT5sYkNsb8mf0Hqy4pLq8Z5AylDDgaZefjFalZhlmif8g48xJCa
	 M3ygc5k0+jreBMPuDhuc2aPtkaZMyIvAfcAv/n0B29wgB/PpgyIol3blOdgJjJJi0sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353711;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e53rf/H4WymerCr1S2SACB31JRHUBytOz6/yCvy7EOY=;
	b=YPjmxUMnupf8/kRUj7tcQ+bFQuLcB8w6GqbkZ/cIMvUmjazu1oknv1nvS9i5LsX3ItkB
	 uABlWjDYpIU6UAlBoVjgdKLnc2AGZpbXLXMdhi4v3lE+RbfMXa96a19CAlfXyfWXS3w1O
	 YlAR4C2eOWwsrdC+eZzLiW87bZubBKkDNabj/TjLNh9E9UxDxEbCn1pxJsVpKUsLY1gMd
	 huy8ocIfkq77uQxbGBQgNDwcEJtvdhkHmJBLudC9tnxFTMCBEB+gahuXt79ZaV5s3uqV0
	 /zd96HUdSgchuIXjjmdFHd44FE3ZZ3iizAjEhhv3kgmHjpa7V1C1cb1vDCGrVaqCaLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=vs6RCKCq;
	arc=none smtp.remote-ip=162.62.57.210
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3FC606A31C;
	Fri, 30 Oct 2026 09:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A3FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=vs6RCKCq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793353692; bh=e53rf/H4WymerCr1S2SACB31JRHUBytOz6/yCvy7EOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vs6RCKCqdjE8RF9jZOWygjnfTNtvcWjwV/ok0oO6TjEXuVkPkXBv7T2X5t1vbtkbZ
	 3EsQCk/byeQ8ppEAqODRePlvvJa1x9ltD6ht863fpgPQdoRhL97YApT2reysuWGR5X
	 8FLu+GCLnB2mIkGq4M9+8jUiTPFzPKFkO8tdNZNA=
Received: from shuai-VMware-Virtual-Platform.. ([171.8.225.58])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id C09892B0; Fri, 30 Oct 2026 17:48:09 +0800
X-QQ-mid: xmsmtpt1793353689twqw5wxio
Message-ID: <tencent_87090B7774E9681639F99FA67B5C3A31C007@qq.com>
X-QQ-XMAILINFO: MeukCuWaRbQlPGhU/iY3QiAeN1c0E42oDo+pM3GduSoMd8lPMBG2yemsBHiuSo
	 McVMuLxPMyrZ874zvtvLwBywneUxkrlQ+jzcE4U4+XDShLhUhNNklHB4qlAwGN79wdUXurvJq7sk
	 p31gQHkH7unG8RV4JNXeBxSFHpqAJaumPjNdeFSbONn2jQYz9/EZ1sRK7AvrxOUlmdMRo08GQ+R9
	 XYniAOQR6OhwoBCb/KhIGSjAmHNxEcJfdUpEU+UmJy0Bba62h9M5f+uSU/7w0pqMxgaSnGe6KcvT
	 NkB/MW/HTuJsheBvVZkwq+xdZgib//ChQMr4lhIoG2Z1pLud6lx/NS2c1u6Doybmmy0kF5q9kvsr
	 ZIH3S7RHcrx4OteiKAj+eR1A5zg1HFCB5R6jdsvF9JS1+U0KpzsAaUMk+o6thdilPPoONc6yPwJd
	 v9180VwpHNYFF/LOJo8hdh1AT89FSF601cDh8rnVxeX213u/uq+AyAccMTNHYVkymlcZGJrHE5/U
	 yxtSSzqRp0etQUCDCLJ0nhJImnTDCA07G4OBvcn1VbnvO7hj+vBncZGJSNTdTIpza+mmXF1J4gTJ
	 qra5QCg1Im1/R7jUioaXRt94GRcN3TEwt5VGq0GF7l41O2tPLy6/jySc7zcfprbm9IIsEKHfU7QC
	 cbEQar17ovvEn1QKWLwGTkWnNX+racGWn19esd6QcE0723UwrbNn59/DLZ1+UUyTGZP/VtWsBgOf
	 eKX5QqOgc8kZuMJZDAfDrS94ba5KcaftxrWN3c4x4guXZLTQuB7Lh8QXogohVV79qe4e0bX/AeTr
	 aSvBvy1Apr0sH6rpe0JZj/8OEpGDSAt0KTSmzcjj2z5KpTfpvDivXPNSKJXwkPq2FeK1VSu3trWn
	 yvYshfh/B1G/BYB+5qwFE+YtKDeamMm++ki/MiI7Vx5t8w88NfCsQU5p0ihg5nWT8y3Azs60qMy7
	 KqMtL1tLrh3Ep/xhafrI9qeJ02vpNFHohLwmXx7JELft58rN90mkE+NaGqgFfnPH+m0Z7hY3CX1F
	 Z+IKg76iUGfmhQBzUqSAtTCWquveaUwupQjf6dQ2vqlydxqj4JsT/vFFTrupuoHxfpIxtEuFc4yV
	 CVFtQkQNI/dbKXFo/aRXz+RL52xZg+qlC2YYda
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Shuai Liu <847807867@qq.com>
To: Mike Lothian <mike@fireburn.co.uk>
Cc: dakr@kernel.org,
	gregkh@linuxfoundation.org,
	colinbrauncl@gmail.com,
	rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] rust: usb: host-side abstractions for a bulk-endpoint driver
Date: Fri, 30 Oct 2026 17:48:08 +0800
X-OQ-MSGID: <20261030094808.3877985-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030075758.356879-1-mike@fireburn.co.uk>
References: <20261030075758.356879-1-mike@fireburn.co.uk>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mike,

Glad both findings were real. Here is a shape for the Altsetting token,
along with why I think the strict borrow-based draining version cannot
work in this design.

Why a &mut-based draining shape cannot work here:

- The window is shared by design. The adapter holds it on one side
  (close() during suspend/reset/disconnect) and the driver receives an
  Arc<IoWindow> on the other. There is no &mut IoWindow to take:
  Arc::get_mut() needs refcount == 1, and Arc::make_mut() would clone
  the window out from under the draining protocol.
- The drain itself is a cross-owner runtime protocol: the adapter
  blocks until every outstanding Io token has been dropped. A
  compile-time guarantee would require the compiler to see across that
  ownership boundary, which it cannot.

Since the open/closed state is already checked at runtime, the setting
validity can ride the same mechanism while keeping the token-shaped
lookup API you asked about:

    impl IoWindow {
        /// ENODEV once the window is closed or the device unconfigured.
        pub fn altsetting(&self) -> Result<Altsetting<'_>>;
    }

    impl Altsetting<'_> {
        /// Validates the endpoint's bmAttributes against the active
        /// alternate setting. The result is a plain value.
        pub fn endpoint<K: EndpointKind>(&self, addr: u8) -> Option<Endpoint<K>>;
    }

Endpoint stays Copy so queues can keep storing it, but it carries the
setting generation it was born in:

    pub struct Endpoint<K: EndpointKind> {
        addr: u8,
        born: SettingGen,
        _kind: PhantomData<K>,
    }

set_alternate_setting() keeps your v4 behaviour (EBUSY while a queue is
registered, cancellation in the queue's Drop) and additionally bumps
the window's generation on success. Every transfer entry point checks
`ep.born == window.generation` before submitting and returns EINVAL for
a stale proof. That turns "Endpoints obtained earlier must be looked up
again after a switch" from a doc line into a rule the transfer path
actually enforces, at the cost of one integer compare per transfer.

This also mirrors the window's own open/active machinery: revocation is
runtime, the proof is just cheaper to validate than the window state.
A debug_assert on the same condition in the unsafe C call sites would
catch missing checks in development without costing anything in
production.

Best regards,
Shuai Liu

