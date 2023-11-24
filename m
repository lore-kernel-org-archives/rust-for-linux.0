Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7615D2D60E
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Nov 2023 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQn8bLdO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F411DC433CD;
	Fri, 24 Nov 2023 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700835985;
	bh=E7iTdKu4fn1Ymumq/Ib66iyMm8jI92wsu47IFm8eWg8=;
	h=From:To:Cc:Subject:Date:From;
	b=QQn8bLdOcSteKKI4NoxTvR1kXBkQiIFnmnQfkvqFiTC35sbPSgGlsFkbwZJGoJC6H
	 eV67CPPIYP6ETHFZjCkemDsMvmYV0HlmNbzguszrB+bkC6JK1o306y0i6OnOu0JMHN
	 2bepf+TBMBQi0mO9wJ6Mf4/o249odpT0t89kCoG7j9c7AhtXjfgLpNtq8ciPHNnAPI
	 IYtScnGAg7RUFe6o4lUv0AMzx1Oxgv93pQFxWD58u8XsCpglvAVxiU7Myw4Hcg0+4+
	 6T6VuRKCHg0J+kvueF5ePAptcHH8WjxzldJmaFuUywewcW08RFKeAZr2EADTG3Dtok
	 cWEVVIa+aixmg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: [PATCH] rust: replace <linux/module.h> with <linux/export.h> in rust/exports.c
Date: Fri, 24 Nov 2023 23:26:17 +0900
Message-Id: <20231124142617.713096-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<linux/export.h> is the right header to include for using
EXPORT_SYMBOL_GPL. <linux/module.h> includes much more bloat.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 rust/exports.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/exports.c b/rust/exports.c
index 83e2a7070cae..3803c21d1403 100644
--- a/rust/exports.c
+++ b/rust/exports.c
@@ -11,7 +11,7 @@
  * accidentally exposed.
  */
 
-#include <linux/module.h>
+#include <linux/export.h>
 
 #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
 
-- 
2.40.1

