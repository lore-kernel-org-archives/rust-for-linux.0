Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F3933AD83
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616987; cv=none; b=TeH7d/nSq5zIARrepr9RGyNWZ/U5FETxsgE0pXivzBHsDjDRbJ/1R8lGVVaBbcYBBTx45tLUjK6CiKwdoUv1O4nSGyHz4et4LPJO1isxodLe+7n6+7/F561rLtE6X7iiPSXDYCGEeHNZJjouTsAhplWZ30hgDXwji2WoBq9+Dto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616987; c=relaxed/simple;
	bh=XJDth+sPXzvDab8A/vMoxX7pf/G+eV6NUOZcGtDeoCo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Gy6/S8Ha8kDOiu7luZctmYMnfPQoLtz/Wi5R8K62V9B+G0zAyCzTNkRpVT9FLNPo+jXWEJgz/GDSonkm7m+fdM7pqmb+lWVA+GNNwcBjSbvs6Hv2hPp6du9xuUlToO23RMfTpoSHl4oX/AUBhmxK5JZM44NLCZFVuL9sJuwdNkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TxHiEG3t; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TxHiEG3t"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d3c9b8c56so94828265e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616983; x=1768221783; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Frdd68Pz1CT1ixXQcGAA+0dj7YFabKIGS7lflaVt9eo=;
        b=TxHiEG3tCuicGM5l4fc4yh7ulKIjWjKMR28ey+AfaY7g5FEcg+AewCsTVBdxveTTEU
         VARfJjBjr765o1SHjLe73FMLi/sqZv5ZCGRFH8oJpXma5tu8frYo3UqazaoniD4j1NyZ
         zthACvE/0Dc+OkDzq/Vn87CgxeFjQAcRAzsCpUA4n/IgeFzHXpVY5mTQERvbhf3IjpDh
         GNiVK4185Iwq60pjJuSe+ExxJ2cY8iFonQMPwClbKo5dCVettobPIAXwJ9SIRNkq3Z/t
         SrFqvEpsGmdLLYjEj/5b0KA96XjZHoTZQV8tXo7IZOWi7zY/eCyEOmjYKRO/n1Xee7mc
         0Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616983; x=1768221783;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Frdd68Pz1CT1ixXQcGAA+0dj7YFabKIGS7lflaVt9eo=;
        b=dY1IajBEjeqNMJJzVD3RApF+InvmYf13/tB10aq8KTHKcq62gBjGuZXXwfmhRrgU+x
         PTc2Nmt/gGz4G9Lt/fOR+Cybb3CtyhhU80RvrSphK+4kdbPNcln1A5Tw0B2X+G5BoMCk
         b2wErR6DclazfT6L/RyjoArmwTogg6WqPn7txcA25FTYG4VCoJ0aCVd4h5UoFZgrXVkY
         vxpfeeNzBIbdBZ6tiiX1HyAKmD+716ja7lgSePTZvZit36NUP/UL7I4TrATU2xdLmK8n
         lR2/N7X49HOnMC7UzJBdZDNHBLHt3mJuIEe0UQ1E1u2knPRQE3M2/fKIIvdYHzHhWWUj
         2xng==
X-Gm-Message-State: AOJu0YxVjsuaQxStPCvMjluMhT2pbblXf+RIdo7MuJkxaH9zJ/4aki30
	GEmkdH9dWpUxGAi00xywJUZoPZCAx3f6jAy+FtfOvgXlO79oyfUwrtLDiWsewfkKkLHWJSMtsR0
	1i6uUf6rzJGiwtKkJK5x+KfHZ4xUX6x6J/Vm8VeprGmrMjxCOxgXVfSj8L48grQXU6RtxNGweGZ
	yglROSTUwuujwdIKsLWQN/D745173H1qU4Dl9j07h32oBANIkJen1Klh0a++kZcGU=
X-Google-Smtp-Source: AGHT+IElABs2fu4mBasa4gNBDtT7xHmiBhL9gcdCCxp3ToshdVXpOHPns0gIRzLgWj3whcaar++xDr69z43i+qs=
X-Received: from wmdd17.prod.google.com ([2002:a05:600c:a211:b0:477:a0e9:dc85])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8718:b0:479:1a0a:ebbe with SMTP id 5b1f17b1804b1-47d25082cc8mr555397845e9.14.1767616982737;
 Mon, 05 Jan 2026 04:43:02 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:31 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2604; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=XJDth+sPXzvDab8A/vMoxX7pf/G+eV6NUOZcGtDeoCo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G8insy9uiAoqQQgCfqVrdjL3I1134oJ0Qis
 /W8qmTNGNqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxvAAKCRAEWL7uWMY5
 Rh35EACbQV0euux11CERYl55eWlBL+CofVnpPsFMaPyQ/VQoZhzbyGz0/AuS24aBUrIXZsfSBhr
 tQP2ejSIFrqw4RgFPLR/+HH6HPtkIYR6yvAH7LXpM4GrX7lYj/1zF5+yioEf0KQpQqmlW/syYUN
 aIdG2cvGS8UpDtuZHA+2yvSOz02Y13oZ+rSr4BXTP7+/o3bKjaxLaB5zilnyA95XGAmpFpaLWU/
 1TT7xwMAByqOF/0Mi7OEV4iO7LU7vNVtc/8cRwqFAW1Uoffv+c/1+R908FcCAzkqneRenz/F87E
 prT0thQNyB0YdXGQHzdS059VU44IfffzC8Hkw8kucllk6KxY06UJSDpBu9390WtRXU0D3yxl3tt
 06m/lB5ucLuiuMT1TqlzH56pOnG1+Ur7qx6LKGlhMkrTV/Iq2emsrK2AudHkxExKIpZuClqVJXZ
 k/fHM4xve+f764qlO0fs2FyRdx59aBkiuweL8JZR0oMUeEjd8ZfHbTLx93SJcXvcthW7Ew5MJiS
 eyKDEsar5NpTxQiG7Rx/vzhj85UytVhoG0X/jV22JOtVVLDxivua9gSD2xVVM87Ub14WWjME/lL
 G1XOJ9VLnPq0Ddn3oyROUmVPicKY9AryASX7lRYXg2C+i+2flLaS9bgIOmoU5EKR5dGL3C8NfiJ KkDHiCAfYfErKag==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-18-51da5f454a67@google.com>
Subject: [PATCH v2 18/27] rust: security: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Paul Moore <paul@paul-moore.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Paul Moore <paul@paul-moore.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-security-module@vger.kernel.org
---
 rust/helpers/security.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/rust/helpers/security.c b/rust/helpers/security.c
index ca22da09548dfed95a83168ed09263e75cf08fd2..8d0a25fcf931ac6540a986aa10187c345614fc9e 100644
--- a/rust/helpers/security.c
+++ b/rust/helpers/security.c
@@ -3,41 +3,45 @@
 #include <linux/security.h>
 
 #ifndef CONFIG_SECURITY
-void rust_helper_security_cred_getsecid(const struct cred *c, u32 *secid)
+__rust_helper void rust_helper_security_cred_getsecid(const struct cred *c,
+						      u32 *secid)
 {
 	security_cred_getsecid(c, secid);
 }
 
-int rust_helper_security_secid_to_secctx(u32 secid, struct lsm_context *cp)
+__rust_helper int rust_helper_security_secid_to_secctx(u32 secid,
+						       struct lsm_context *cp)
 {
 	return security_secid_to_secctx(secid, cp);
 }
 
-void rust_helper_security_release_secctx(struct lsm_context *cp)
+__rust_helper void rust_helper_security_release_secctx(struct lsm_context *cp)
 {
 	security_release_secctx(cp);
 }
 
-int rust_helper_security_binder_set_context_mgr(const struct cred *mgr)
+__rust_helper int
+rust_helper_security_binder_set_context_mgr(const struct cred *mgr)
 {
 	return security_binder_set_context_mgr(mgr);
 }
 
-int rust_helper_security_binder_transaction(const struct cred *from,
-					    const struct cred *to)
+__rust_helper int
+rust_helper_security_binder_transaction(const struct cred *from,
+					const struct cred *to)
 {
 	return security_binder_transaction(from, to);
 }
 
-int rust_helper_security_binder_transfer_binder(const struct cred *from,
-						const struct cred *to)
+__rust_helper int
+rust_helper_security_binder_transfer_binder(const struct cred *from,
+					    const struct cred *to)
 {
 	return security_binder_transfer_binder(from, to);
 }
 
-int rust_helper_security_binder_transfer_file(const struct cred *from,
-					      const struct cred *to,
-					      const struct file *file)
+__rust_helper int rust_helper_security_binder_transfer_file(
+	const struct cred *from, const struct cred *to, const struct file *file)
 {
 	return security_binder_transfer_file(from, to, file);
 }

-- 
2.52.0.351.gbe84eed79e-goog

