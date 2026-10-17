Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FCA3A7D82;
	Sat, 17 Oct 2026 21:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792274121; cv=none; b=ZbJ9zmoMIkfGRTaZnzvS+AP3BnBGu8MuQk/P0CQEf+U7NWeBE18pmzyHAEH9MBEy0RnSs80X6sTb4h97tX396yarvCoitNFjy2gg05M5svhFhgMa5mJdIRp+ToF7GbZwRB4zuq/SFWHDKHq9IVtdLv9Fd1CXxg1jF5yJbPfo/X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792274121; c=relaxed/simple;
	bh=LwoJ68CIrq+FdWeZgR5xasunl1meogn4LDK537ERRxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Fq2/mA6kLBYT9QP0tT7ZKF04fWv1MxQRgev3afgBfpUePxqXnazTvO/+k83HeMPjtLxSzVqPrEcwnQ4nh+F9Z1Kvy7be24lt10KOhLsG6+O78AvAFuK4JdqG6otP/LQy7iVZ3GNPxcre+lClX0zORs2K3E1IiZ8hIBYNLL4pSgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Z+218y/v; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Z+218y/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1792274111;
	bh=LwoJ68CIrq+FdWeZgR5xasunl1meogn4LDK537ERRxQ=;
	h=From:Date:Subject:To:Cc:From;
	b=Z+218y/vINFL9S8ToJuE++g75XmmBzmr7CUa1GTJh+w2rq/BUlC5a4HW27PI+bD8m
	 7iACKlNq9jieYULU1iUI56hp0zCXSO4CGabm7pQP7T8YjMUwLFozyw9i/opmpsb1UB
	 2TJF6a8EZRNCRadSW4rnB0xKkquEIRcvmHGts794=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 17 Oct 2026 23:55:05 +0200
Subject: [PATCH] compiler_types: drop the Rust bindgen workaround for
 BTF_TYPE_TAG()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261017-rust-bindgen-workaround-v1-1-fbd99504b4b9@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORto55jFVxEPXRtnFFJJVhXG3
 t2qx+/w/ysYKZPBsVtB6cnGRRr8roN0jTITcm6G3vWjd35ArbbgxJJnEnwVvUctVTLGwYUxhhQ
 OtIdWP5Qu/P6dT+e/rU43Sst3B9v2AQ2STWZ7AAAA
X-Change-ID: 20261014-rust-bindgen-workaround-a4086a8c87e3
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
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792274111; l=1223;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=LwoJ68CIrq+FdWeZgR5xasunl1meogn4LDK537ERRxQ=;
 b=Ar8ovICqtUtBC9lzJC2AhjeKkU3xYTh/xacGCdPadz6UvMd8sMXAw9X+Ba/9l0smUFlpePopf
 qyQy6fUjHfhD7TXy7bfuGUqmTTdeknprpKR12UDmxVPBRud/tH6mxrA
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The referenced bug was fixed back in bindgen v0.66.0.
As the current minimal support version of bindgen in the kernel is
v0.71.1 the workaround is not necessary anymore.

Drop the workaround.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
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
base-commit: 3132a951a7e4ec2e18bc314877137deee96ab83e
change-id: 20261014-rust-bindgen-workaround-a4086a8c87e3

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

