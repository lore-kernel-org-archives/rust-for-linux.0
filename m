Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21BA23D3
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Aug 2023 06:23:18 +0000 (UTC)
X-Greylist: delayed 726 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 02 Aug 2023 23:23:16 PDT
Received: from suitable-modron.relay-egress.a.mail.umich.edu (relay-egress-host.us-east-2.a.mail.umich.edu [18.219.209.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E331706;
	Wed,  2 Aug 2023 23:23:16 -0700 (PDT)
Received: from commutual-kasha.authn-relay.a.mail.umich.edu (ip-10-0-74-76.us-east-2.compute.internal [10.0.74.76])
	by suitable-modron.relay-egress.a.mail.umich.edu with ESMTPS
	id 64CB43C7.22C5C780.6C770CBF.1872949;
	Thu, 03 Aug 2023 02:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2018-08-29; t=1691042753;
	bh=IMCiJAtHEYq1/G5fIOJlIPrjUVMkIOOLBM9xNgMNLgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MmuoDNxRglAARpbYMSq8UWyq4ft+jo9FPct9PQcFSqmKndC5ZsZxJTb59bwdKYTeR
	 mA+n4q+n7MrJ4uEyxua6CgLklf9aTAVtGmT8B6PMjkFQ5T0JLDlb8PpTXlk25QR5l5
	 xgsK3x9i1naMGGeyfvhG1+EW02cjKyk89rDreFHUi+Uh7PCvQAjIq4gbpNSy5/MnNG
	 0vwrJD1EZW7uP6/d5SMBBFWiwgFvRG1wcrbc5dmt+aIgoxVfSWiTjUDd3qsV2sWmGv
	 eurIfmcbhiNrFBAsjoRUjqwhhGUTqeKr9vM/7U/MTY8vh7ZeCHhp4fVRHFxRJkrHIM
	 xS1LxK9cc1yZQ==
Authentication-Results: commutual-kasha.authn-relay.a.mail.umich.edu; 
	iprev=permerror policy.iprev=68.32.216.219 (unknown);
	auth=pass smtp.auth=tmgross
Received: from localhost.localdomain (unknown [68.32.216.219])
	by commutual-kasha.authn-relay.a.mail.umich.edu with ESMTPSA
	id 64CB43C1.8906381.44ABE1D6.2496870;
	Thu, 03 Aug 2023 02:05:53 -0400
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
Subject: [PATCH v2 1/2] docs: rust: update instructions for obtaining 'core' source
Date: Thu,  3 Aug 2023 02:04:36 -0400
Message-Id: <20230803060437.12157-2-tmgross@umich.edu>
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

The source for Rust's 'core' library is needed to build the kernel with
Rust support. This sometimes needs to be obtained by hand when using a
standalone version of 'rustc' not managed by 'rustup'. Currently, the
documentation suggests cloning the 'rust' repository to obtain these
sources, but this is quite slow (on the order of a multiple minutes).

Change this documentation to suggest using the source tarball instead.
The tarball includes only needed files (<5M) and is significantly faster
to download; this is more in line with what 'rustup' does.

Also simplify wording of the relevant section.

Link: https://github.com/Rust-for-Linux/linux/pull/1024
Signed-off-by: Trevor Gross <tmgross@umich.edu>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
---
 Documentation/rust/quick-start.rst | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index a8931512ed98..632b115dd20d 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -56,16 +56,17 @@ If ``rustup`` is being used, run::
 The components are installed per toolchain, thus upgrading the Rust compiler
 version later on requires re-adding the component.
 
-Otherwise, if a standalone installer is used, the Rust repository may be cloned
-into the installation folder of the toolchain::
+Otherwise, if a standalone installer is used, the Rust source tree may be
+downloaded into the toolchain's installation folder::
 
-	git clone --recurse-submodules \
-		--branch $(scripts/min-tool-version.sh rustc) \
-		https://github.com/rust-lang/rust \
-		$(rustc --print sysroot)/lib/rustlib/src/rust
+	curl -L "https://static.rust-lang.org/dist/rust-src-$(scripts/min-tool-version.sh rustc).tar.gz" |
+		tar -xzf - -C "$(rustc --print sysroot)/lib" \
+		"rust-src-$(scripts/min-tool-version.sh rustc)/rust-src/lib/" \
+		--strip-components=3
 
 In this case, upgrading the Rust compiler version later on requires manually
-updating this clone.
+updating the source tree (this can be done by removing ``$(rustc --print
+sysroot)/lib/rustlib/src/rust`` then rerunning the above command).
 
 
 libclang
-- 
2.34.1

