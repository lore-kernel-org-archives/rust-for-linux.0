Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC8285CAD;
	Wed, 14 Jan 2026 18:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414876; cv=none; b=O5vA5pBy6+4DXh/+oGm/OkrOflhTAh3gxAnC4dsn/DJzMVcOw8ugLmqUGcxgrNkFUDcXKyuMf1nkr4XeTbmx3MFsTCLRfFDs//tv3PpPZChAukc98gEyTrw6vfNEoqbkSU22eSSblfvSeIIBh/LslCEwNZC+vUGgwV09A6CFcfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414876; c=relaxed/simple;
	bh=q3XNO07B9AZPe+dOEA4L9nY8n4J27bqvLIEXJPlRe/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RH3FTA9Et4DyNXXLoEqy6209UzGDLIhOT/Y1ENXljbyvANJmetK888r2RKxy9XrBPOpVtrQ03IaocKg2b2g3vEGBy9waK/ZqcqRczUyq1bD1TYzvdrpRoP9HpTVTATH3jYwo8WrZnuCniCuLh6lnWRrirPLsQk/Xi5An8MMNhxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6XFBRXu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6XFBRXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A011BC4CEF7;
	Wed, 14 Jan 2026 18:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768414876;
	bh=q3XNO07B9AZPe+dOEA4L9nY8n4J27bqvLIEXJPlRe/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b6XFBRXuVHuxFUMU7VNBuwf/l0TGDL7/xkRqp50KDZsKoBPKUjfdgACq5ozNIkk9L
	 uec3MhyfTl8nM2TuP5pMEa0CiVComXKP3Pu7mvZ+mD6mdcfPM2wfQbgb01yPoNcGWu
	 7zDk4fdB/8YFUY+gAIKFqtLuy2I3bGEpUHM6ZOXnsSAAo7g8st3wa+Jvx+xouwH1tA
	 U6Czw+Vn6Ok/5RhYSkikQ/xPfE3WxIj7tr1iK1/pKHlkQDSqGDE7R7AXPS39w8QHmw
	 oYxKxoGk0yKZhQ1WgYFj8lqG+7alzuEMVr1SUtEye96584XM1D9agBguOIBq/lbKvJ
	 gbjb8avSr8Quw==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 15/15] MAINTAINERS: add Gary Guo to pin-init
Date: Wed, 14 Jan 2026 19:18:50 +0100
Message-ID: <20260114181934.1782470-16-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114181934.1782470-1-lossin@kernel.org>
References: <20260114181934.1782470-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gary has been involved in pin-init since the very beginning. He created
his own version before I even joined Rust-for-Linux, contributed ideas
to my solution, and reviewed it. With the removal of the declarative
macro mess, he is also going to be a maintainer of pin-init.

Acked-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v3: none
Changes in v2: none
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8fe..fb6534339b75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22916,6 +22916,7 @@ F:	rust/kernel/num/
 
 RUST [PIN-INIT]
 M:	Benno Lossin <lossin@kernel.org>
+M:	Gary Guo <gary@garyguo.net>
 L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 W:	https://rust-for-linux.com/pin-init
-- 
2.52.0

