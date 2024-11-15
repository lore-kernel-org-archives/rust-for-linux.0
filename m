Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEE91F754D
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Nov 2024 21:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731707401; cv=none; b=h0piVdge/H3rkfFmEmPSo5P94uET6VkkbSH8xckzaDgH8BOKMNduxUohr9fkTGX/6TYb0Hz+WJhRdYcdo+DDsL3tUVftO7B2PhLIUb5y2s5/t48cEUxOa+jqRCOWHRhUaspZTuN9UrSY44LDgXS2WWsxfeSz0AbG3aP8zwlK0TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731707401; c=relaxed/simple;
	bh=UaKzM6BSySDnkz6pAA9mWgD1ySiqjEVsln8iFlrmpi4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Naq9fr4n+6RYbcZQdOvoq+MHT3KRfcSbaAKHwuHGKn0cyx5J+X6GksxPNzrAtj42CPBOn81qKxvRKUc5XujRoIhIIiQRAeOrbuV5oSAT0SrqODA2COzEG2oY0UAbeGpGrdAl1VAaaX5E7FpiGaRFLK0GhDaAvZmvIy0yCubn/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandragore.io; spf=pass smtp.mailfrom=mandragore.io; dkim=pass (2048-bit key) header.d=mandragore.io header.i=@mandragore.io header.b=ciQs43ce; arc=none smtp.client-ip=185.70.40.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandragore.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandragore.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandragore.io header.i=@mandragore.io header.b="ciQs43ce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandragore.io;
	s=protonmail3; t=1731707396; x=1731966596;
	bh=gGSNDKPk61g3Z3APCGyRObl0T9S3w3801NZcu2rJlBE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=ciQs43ceamUWu3jIrSLag5keQV1s7PCBir8wLb1qHnL1JzgMy3pfHhHkVR3J3oNiE
	 TM8tDZ+pLQz1x37Iv5TzbYegpUs2G5u7Ru5ZaOlSgPKgtjuDMKDLyPQTSwfZuHAXXm
	 HtF+EiMdut2ilSSQ/8nlC5rnj0s+rNixMDwCBCdYh+/dfuQfZ5uFLYmxogtKH144hC
	 VupLCfQfM/dOaxOT95RMplQFN9DWjlMULwK4IZ1VrdlXSp5fCFgwchLQx6QVl9laR1
	 MqHX1MqCLVzg08QwmOH/iNY0OvB0j5/7sX5nJ0JaK5CsvAX6hhkknbJNLKwgQI8y8j
	 Gq/qcWm2+jFSg==
Date: Fri, 15 Nov 2024 21:49:50 +0000
To: rust-for-linux@vger.kernel.org
From: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: Konstantin Andrikopoulos <kernel@mandragore.io>
Subject: [PATCH] rust: add safety comment in rust_fmt_argument
Message-ID: <20241115214907.191454-1-kernel@mandragore.io>
Feedback-ID: 125704292:user:proton
X-Pm-Message-ID: 48b95fd3d319b48dd2fc7d3a0232a58b93bd3596
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

The function rust_fmt_argument derefernces a c_void pointer, and thus it
needs an unsafe block. The safety comment for that block was missing.

Part of Rust-for-Linux#351.

Signed-off-by: Konstantin Andrikopoulos <kernel@mandragore.io>
---
 rust/kernel/print.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index a28077a7cb30..3545dd08fde0 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -24,7 +24,7 @@
     use fmt::Write;
     // SAFETY: The C contract guarantees that `buf` is valid if it's less =
than `end`.
     let mut w =3D unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast())=
 };
-    // SAFETY: TODO.
+    // SAFETY: The Rust contract guarantees that `ptr` is a valid pointer =
to a `fmt::Arguments` struct.
     let _ =3D w.write_fmt(unsafe { *(ptr as *const fmt::Arguments<'_>) });
     w.pos().cast()
 }
--=20
2.47.0


-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYIACcFAmc3wf4JEP6FRRdCoj7tFiEEZVtNSmVGsZsFReCA/oVFF0Ki
Pu0AAPvrAQCD8WeORM8+Nqsp4WQBmItlZz0S0fP5C9aUZpXjcUSmtgEAnMAV
CwlhJFanwZteGT8wM2Xodx2V8dWCmJxqiucOLwg=3D
=3DwJMv
-----END PGP SIGNATURE-----

