Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1613E37C927;
	Sat,  9 May 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309813; cv=none; b=VwdIF3kOyrqp0uEoz+PEjfw7KcTqdGSSoYR2wzpzA9i6wOhcwcimhLPs+lgsbUCF9AaKRfdTweuX01Eeu/dxwp+cR1ZjC77eZnC+wCMVtpncW16tX7fdedjcCCPct5N8DfW2CqH/znfS4l9VDHUu0GeqCaLZkwk0bwREYBUzK6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309813; c=relaxed/simple;
	bh=EBEG6jjE7Xv7G7J6Z3BZCIJYD1aVH2l9srB6VgRlOys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EAyOVypJz96TImFfFPZ8bn/doTaD47iUk8JCoYHzbXU0DvadwdV9Vnhlw5bNRgpjOzm9P0obPpLQ+XX6JcGsAd6JBG7ZPeWi+uqVliid3s2i8lpHP088R1+vKTgvCd0YS31oI5CdtEbvwmEZmn754QMiboHYT2nEiXjwA9LWovM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BysW1rLI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BysW1rLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B185C2BD01;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778309812;
	bh=EBEG6jjE7Xv7G7J6Z3BZCIJYD1aVH2l9srB6VgRlOys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BysW1rLIzw7p1aiCgyiDLd2XEMVglxsp/j8mBvWMJAsH1AkU2+rewIu+fFD8udOJU
	 F7acP88Rvfm060W+wg+LWUc/sCJWrLfwhqeK/MTPDouq1UcYNz215tQ3UnmP+QPTJY
	 D1bfqwWQ7RVJxERDmlBL4Tp6iu5wy2FXWLhByZExgMX0MiG5oVu1Xlz9fUi8uV6EHq
	 IBI1iVGiRNrEsp3xMzY+36SPHT/PN1ZPUFoGSjXjg1gidKHPSG6LL3w0OVmcxn2bVJ
	 jlRJcokUrZLJtTwh2TVsT4sadRd8XkToIbKm9LBd4g/mVAZLj4Q2PWD6QkXWF4Ln36
	 NPOVdUPDKqLRg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wLbcI-00000000GJN-3XGM;
	Sat, 09 May 2026 08:56:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v3 13/13] MAINTAINERS: use a URL for pin-init maintainer's profile entry
Date: Sat,  9 May 2026 08:56:46 +0200
Message-ID: <59144e7323b95166e61a7c7f84096a0b9bb5d26e.1778309595.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778309595.git.mchehab+huawei@kernel.org>
References: <cover.1778309595.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This maintainer's entry is not inside documentation nor is
ReST, preventing Sphinx to create a hyperlink to it.

Change it to point to the already-formatted URL.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mchehab+huawei@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77244b7f9545..dd424a4f9f3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23402,7 +23402,7 @@ S:	Maintained
 W:	https://rust-for-linux.com/pin-init
 B:	https://github.com/Rust-for-Linux/pin-init/issues
 C:	zulip://rust-for-linux.zulipchat.com
-P:	rust/pin-init/CONTRIBUTING.md
+P:	https://github.com/Rust-for-Linux/pin-init/blob/main/CONTRIBUTING.md
 T:	git https://github.com/Rust-for-Linux/linux.git pin-init-next
 F:	rust/kernel/init.rs
 F:	rust/pin-init/
-- 
2.54.0

