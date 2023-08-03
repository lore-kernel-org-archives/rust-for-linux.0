Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264A38F5E
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Aug 2023 06:23:19 +0000 (UTC)
Received: from suitable-modron.relay-egress.a.mail.umich.edu (relay-egress-host.us-east-2.a.mail.umich.edu [18.219.209.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DD110FB;
	Wed,  2 Aug 2023 23:23:18 -0700 (PDT)
Received: from commutual-kasha.authn-relay.a.mail.umich.edu (ip-10-0-74-76.us-east-2.compute.internal [10.0.74.76])
	by suitable-modron.relay-egress.a.mail.umich.edu with ESMTPS
	id 64CB43C7.259FD9A9.11B72FB0.1872949;
	Thu, 03 Aug 2023 02:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2018-08-29; t=1691042758;
	bh=5mhAm6jPr/dCTY1x65fzBu3cjprRxi0dMZQP4F4Gdnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F4RkUMbHqeRV0+qBRUfrjUn4YYQDLXNfl2anDyGZTgPxCfup1W+MEisRJqPV/DgrS
	 2ciASMFfSQeJZCXGiEpC3vlhS6dkBYId10wcN4Ll8aiYm3ZocNx6cdNPf3yDmd3Tfp
	 +HBtPl33TNsDN/ewQ4f55j0gEBwdpyq8strJ/K8UeG8t/OTx9IxeOjTYyjSnC/2nAi
	 9tbrAXnsBD0Lpbv/RiecO8hvIJ4MDcGLYbU8EJHG6FvyqNH0OGo6ptyvjZkg5ezBeA
	 uGaZdE/42z8/SFNObCWmBsR8aDMVOR5Wve9vRuzTKUSvN2JjtJRwTyiOIhHCX/8oc+
	 2Oy2UOFZ/E05g==
Authentication-Results: commutual-kasha.authn-relay.a.mail.umich.edu; 
	iprev=permerror policy.iprev=68.32.216.219 (unknown);
	auth=pass smtp.auth=tmgross
Received: from localhost.localdomain (unknown [68.32.216.219])
	by commutual-kasha.authn-relay.a.mail.umich.edu with ESMTPSA
	id 64CB43C6.27F6E04.7CEFCF81.2496870;
	Thu, 03 Aug 2023 02:05:58 -0400
From: Trevor Gross <tmgross@umich.edu>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com
Cc: boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	corbet@lwn.net,
	yakoyoku@gmail.com,
	aliceryhl@google.com,
	tmgross@umich.edu,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] docs: rust: clarify what 'rustup override' does
Date: Thu,  3 Aug 2023 02:04:37 -0400
Message-Id: <20230803060437.12157-3-tmgross@umich.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803060437.12157-1-tmgross@umich.edu>
References: <20230803060437.12157-1-tmgross@umich.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The behavior of 'rustup override' is not very well known. Add a small
note about what it does, so users have a better understanding of how it
affects their system toolchain (i.e., it does not affect system
toolchain and only sets a directory-specific override).

Signed-off-by: Trevor Gross <tmgross@umich.edu>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
---
 Documentation/rust/quick-start.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 632b115dd20d..0612ea517bc1 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -38,7 +38,9 @@ and run::
 
 	rustup override set $(scripts/min-tool-version.sh rustc)
 
-Otherwise, fetch a standalone installer from:
+This will configure your working directory to use the correct version of
+``rustc`` without affecting your default toolchain. If you are not using
+``rustup``, fetch a standalone installer from::
 
 	https://forge.rust-lang.org/infra/other-installation-methods.html#standalone
 
-- 
2.34.1

