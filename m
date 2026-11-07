Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019584;
	b=l/a9744daKMocEhUlyqrBuBmx1jL52mv3pdMjIqSdnPxOtSbk5kqyQ26xgImGF+EuPFi
	 fYpKPpkxMSlHO3+VtJ7DjZ++5iiSABZ/xsYbheJI6M6FLp9Tp1Y5DNiZLc7Kl66rc31B+
	 J4aYYgqoTdIrIgU2ISv61Po5ZMe8eNw5lsz8AVGp+rT6pstILpWs89Ny1s9DNYgakmRS4
	 C5kMjMpKWrTt2ZxEG+F+ACmj8ZIBJOctw33FVPWrTm6devzkjA2b5BLFyaXMXbNrFffpd
	 BqFjDzXpDVvnh3ReSkYA9c25VwhJcLqDacb3O8TiAfTj+4K++4Orvpsys896otxQ5Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019584;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=w59mjSqZhCIbLNOEV8odit4PhlHv2lbLkIQIzr13ow4=;
	b=vs7z87ubdnwzbCIwQ7SNsBKhxdQlKwCCRSiWZlF7SbTTDKTMSXzUNBLgAuKAvRA5wOUF
	 XpIf3y07jRWlLlYnB0Te4TBvym+ZGhnV/lAlym4e2QuYcddycB/7WnfTkxHTHhcuzzNy4
	 YefrU4His8OaSe/L3Zrw4GbK9rfaitu5tIrerpwjOCdrXa9Ug/nSRaydxFx8IvOe9R2cP
	 w2B3ER4CW/TT7cMbK4B09CyfBLHKmGaXpZwiqJx5ipeLT89rbHNOc+dphLwKp3p7PMKKQ
	 4e2ymm/e/IBZPZxHN5QWiVeewWkgXOfx1P77AaSXKzmD5YF1bHzC8ED5QvDLdqjeGwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=OduZUIbo;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3E8606A330;
	Sat,  7 Nov 2026 02:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F3E8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=OduZUIbo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1794019574;
	bh=+5mznvrQrsmlH6EKJOlra9AFwNtxXEN6hLVCz+ODpnY=;
	h=From:Date:Subject:To:Cc:From;
	b=OduZUIbo0rTqm6BKslHdbpRODFvfLodPH74XO10wjy/hxCjsXZrPNZoVIA6IrGYv7
	 75/h+hbr+ci4t7u5fhZmnX7G/eOT2xirVQ/fFs7iTavreHIBbutWbGalCupL1SFvuW
	 n4QtQODMm3wDeg9h9VuMjPF0V+9AqPRTLJjDU9VI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 07 Nov 2026 02:46:02 +0000
Subject: [PATCH v2] compiler_types: drop the Rust bindgen workaround for
 BTF_TYPE_TAG()
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261107-rust-bindgen-workaround-v2-1-a97b7a956eca@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0K6dkxLUFJX3sO4aDsDrcZipi2YE
 O4u6MKVy5f8/94sEnGgJE7VLJjGkMIQV6h3lXDexJ4g4MqilvVRKdkCl5TBhog9RZgGvhseSkR
 AdC2SchaNFuv7ydSF18d8uX45FXsjlzfdtuh4eED2TOZXkOp/YVSgoLOo9UE2trH6PFFIKTlf/
 D5SFsvyBt9rz4rPAAAA
X-Change-ID: 20261107-rust-bindgen-workaround-ddc7de1cbda9
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794019570; l=1435;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=+5mznvrQrsmlH6EKJOlra9AFwNtxXEN6hLVCz+ODpnY=;
 b=9dwmm2OUNbIhpq0AE8uo/Ms/NxRCD85SOjE9aXCJb99NsC+L0lotMM83gVGlbhGfSt0RquqFL
 m5SMLbGI/igBNQEEhI8n817ERs/7Bo1+Zz70FtUZ/mgRwN/4Ay7RrzZ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The referenced bug was fixed back in bindgen v0.61.0.
As the current minimal supported version of bindgen in the kernel is
v0.71.1 the workaround is not necessary anymore.

Drop the workaround.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Mention bindgen v0.61.0 as first fixed version.
- Rebase on current rust-next.
- Link to v1: https://patch.msgid.link/20261017-rust-bindgen-workaround-v1-1-fbd99504b4b9@weissschuh.net
---
 include/linux/compiler_types.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c5921f139007..cdae5823c915 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -30,12 +30,8 @@
 # define auto __auto_type
 #endif
 
-/*
- * Skipped when running bindgen due to a libclang issue;
- * see https://github.com/rust-lang/rust-bindgen/issues/2244.
- */
 #if defined(CONFIG_DEBUG_INFO_BTF) && defined(CONFIG_PAHOLE_HAS_BTF_TAG) && \
-	__has_attribute(btf_type_tag) && !defined(__BINDGEN__)
+	__has_attribute(btf_type_tag)
 # define BTF_TYPE_TAG(value) __attribute__((btf_type_tag(#value)))
 #else
 # define BTF_TYPE_TAG(value) /* nothing */

---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
change-id: 20261107-rust-bindgen-workaround-ddc7de1cbda9

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

