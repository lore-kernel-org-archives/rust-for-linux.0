Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3523A9630;
	Wed, 12 Aug 2026 11:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533822; cv=none; b=G1abTyS+sxUS+gNUEC9MIyL+aXH0z8Pb8q5bKstljsJeT3RYa9cHAoNrTzihBVJEWoG3mn/5Bgyk862ypMLVT404ET99va5RYcl1UWzhzuFrTQq+COiN5poZewm1/oCQFfqKel2iwHNWE2xyCilM17qVW/tKvzANMuvvvsVBkto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533822; c=relaxed/simple;
	bh=xgiVtgKxF5HznEECamCfejOSlIA66ywB/87bdA1hv4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BaXY3LYQo2EHHqYDtHu+o602fbccjoY4LPClxQ+JV3HEmQYUAJOrwt9tvSRyfMepgXxkt18AGt2GrjrmHeIneTZ5T/9V45SVtz2Gqu/34eAGphhGFhT6XccNLUEghynFD9OTHyYMWugOyVVDgaMELVNayel5YXyvUviDrFJ1B+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FygoDR5a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FygoDR5a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2FF1F00A3A;
	Wed, 12 Aug 2026 11:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786533821;
	bh=+NRYyarB63MhOto3FLclENVrVqzfEP/Ij6tLUiwoG+I=;
	h=From:Date:Subject:To:Cc;
	b=FygoDR5akw7hbejsBGwKArvu/WTKVXv29Ez+66qSX52TBeqbSp2ie2UaD/8NkJ730
	 Lx9PQpDFTalxLJ4as33uKIoXGLsgGOHX9sHwIuA6oDZOhbytgXJZD0jI8pDt3VIF+t
	 3NzoMGNMgOdjsPz0UhWpvUPGnLQNy6JMZ+1ozo+LIQZYPHRwyOcpqZnLHEKRhUiQ7B
	 u2i4TE14jGFFRsiDyf/qouV5O0I26sQ23n//heKkfQiTCRPtM2Ht/MlO+yuz2pYUWB
	 QnbFSYgGIGWMIXteVxahFq/cmmGvK27ir0r+AuGoOPbHYAYovNxF1073fSTAGMFTeZ
	 WboIZppNy24gg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 12 Aug 2026 13:21:51 +0200
Subject: [PATCH] MAINTAINERS: configfs: split configfs entry in C and Rust
 parts
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-configfs-maintainers-v1-1-ba1bd2f593f5@kernel.org>
X-B4-Tracking: v=1; b=H4sIAE5XfGoC/yXMyw5AMBCF4VeRWWuijbi9ilhUTRmJkk6JRLy7Y
 nEW3+L8FzB6QoYmucDjQUyri5BpAmbSbkRBQzSoTBVZJZUwq7M0WhaLJhfi0LOoZF3WJfa5Nhb
 idfNo6fyybfeb935GE94W3PcDu31J83gAAAA=
X-Change-ID: 20260812-configfs-maintainers-819797eb4acf
To: Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=xgiVtgKxF5HznEECamCfejOSlIA66ywB/87bdA1hv4A=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqfFer2aR7sTMZkXtLOhF75HWOd0P06tCIeykQG
 bcgrKkPEo+JAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCanxXqwAKCRD6UCkIqsW9
 0J3xD/oCP/MwMaF+ALoOrgL8DZWBF3F+4K8a2ZZklh2PYRzAl8gYj4gcoPAHUuKXOeEDpcq4Prk
 wnhP//XAXukyw5+Vvq9uXmqOyS2TObdktMf9qQIhWaEuL7WDHNYv7DA2pEAlwxPdBo0zBV6jkPg
 7Spb+Iqjg9ggdN0v2Df9GlZ8OT/VQLJNNx/3Uh50d2PFpmtixG/J7ycC+L1o6nrz2zareltUS1d
 Jx3U+ZdkfZ79n3Aw6fN++WJhRPdoLFPdx5w9uH4S/S45nItRkpR0DBeM2jyqWZHVGJALJfRx7Ac
 nCWNODWk1u+r4ey4n2cXaqiyFh7lP7aqqS5IaVYG8HIpve5jRie0TRSXX4OBNBFtwESx1ZgTSDX
 /EKS4fF3SqdeNqvjG64QqKHove0XBb9gfrxzMLCdy2GiHnhiFw4AkoNaZFNTDK6K/jkfrlk8IRl
 dwHwLVaaXlVaw2AvwWvEvMX5uSRKoLLWzDObSvDX6PrOOlsp76/jW8iMkhDLyGBtkVRiCV8vElH
 waiBX34Gmg8yp1IBKkArVc627UgikJvmT6R+qFzZQrfwTjREYltNJ5E7qB92q3Z7mRxR8QAdvyg
 9PqTXAI4OSd92MC453s0vu3UXoN+QmkR6QKe3jaT3uL6Ya6HKmwx+pK37YvhITUZSkMf8/yw/OO
 ALLa41JUEZGtLtA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Split configfs MAINTAINERS entry in C and Rust parts. Mark Breno Leitao as
maintainer of configfs C parts. Mark Andreas Hindborg as maintainer of
configfs Rust parts.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 MAINTAINERS | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f8253e..10e2f8fd1542 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6542,14 +6542,19 @@ S:	Maintained
 F:	Documentation/security/snp-tdx-threat-model.rst
 
 CONFIGFS
-M:	Andreas Hindborg <a.hindborg@kernel.org>
-R:	Breno Leitao <leitao@debian.org>
+M:	Breno Leitao <leitao@debian.org>
+R:	Andreas Hindborg <a.hindborg@kernel.org>
+T:	https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git configfs-next
 S:	Supported
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git configfs-next
 F:	fs/configfs/
 F:	include/linux/configfs.h
-F:	rust/kernel/configfs.rs
 F:	samples/configfs/
+
+CONFIGFS [RUST]
+M:	Andreas Hindborg <a.hindborg@kernel.org>
+S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git configfs-next
+F:	rust/kernel/configfs.rs
 F:	samples/rust/rust_configfs.rs
 
 CONGATEC BOARD CONTROLLER MFD DRIVER

---
base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
change-id: 20260812-configfs-maintainers-819797eb4acf

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


