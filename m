Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B311F03DB;
	Fri,  6 Dec 2024 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475960; cv=none; b=hp51HO3XO/eHvFBz8Cd/zNd8IUdf1bU6+c2+vRsWkIztKqRed7om2IHi0XVoP/SiirVWG1T2DaVMnPar9BR7B0roTixys5+mvdt7mX0DqmXY6vsOcGsz5r8yGlztf0jbhgVDVCQptas75lj2DtHYkkRczSGaAxI5wN1Ri/dSzR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475960; c=relaxed/simple;
	bh=23hCTKG960bDy1N3PIz21oRrK0JViO+CB1Bwjy/jA8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PcHetvpt2zUmOelwIxw6WRg4ahU3Zgs6A/wRu/uX8+HaLetWtoSoANUvz3r0xPbJJQ87P5vTErFP47ldIYeFKiArQvOXWEzHlKwfwUv8XQeASfLU3km8R4s4bEU2MSdCvK3jRFUoEOH6cmArbBTszymIhQpkia45hyyENIQYHLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P74wnPHX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P74wnPHX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89676C4CEE1;
	Fri,  6 Dec 2024 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733475959;
	bh=23hCTKG960bDy1N3PIz21oRrK0JViO+CB1Bwjy/jA8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P74wnPHXOLowZ4cv4YPEOQ0OoM0njxtWxkenrmyY0eYHqqotiTvqxnQmchXw7ACOT
	 +/iXxOeA1TcBlUKAyMw5skc0aRCYHS16PhMCjky2K+4h3i0vrOmX5KFG0BPg9W5pLT
	 M4eOM95mTt/dCxw/Xl2zRn84C6rhtCToVg8Jlf8YtQ71NKaalEb4IYvMhbBC7iQ7+Q
	 FdiHQMuyODirO9EhRi8nVRR4wZGY8TglOg1cjYDuTLr/l56LwUkwVvC+g433pKIsOB
	 SDo2uM6iJevT/tpxaVLDZOd7JVqHKbVKWg9yavTufPa0n8N+s2mQRnXxm5KSK30dv6
	 /u9JTHJaEXXmQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 5/5] MAINTAINERS: Add Rust Misc Sample to MISC entry
Date: Fri,  6 Dec 2024 09:05:11 +0000
Message-ID: <20241206090515.752267-10-lee@kernel.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241206090515.752267-1-lee@kernel.org>
References: <20241206090515.752267-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Lee Jones <lee@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 21f855fe468b..ea5f7c628235 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5328,6 +5328,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
 F:	drivers/char/
 F:	drivers/misc/
 F:	include/linux/miscdevice.h
+F:	samples/rust/rust_misc_device.rs
 X:	drivers/char/agp/
 X:	drivers/char/hw_random/
 X:	drivers/char/ipmi/
-- 
2.47.0.338.g60cca15819-goog

