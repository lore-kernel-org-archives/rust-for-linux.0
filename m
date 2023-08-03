Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3627E
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Aug 2023 09:35:43 +0000 (UTC)
Received: from keen-gwydion.relay-egress.a.mail.umich.edu (relay-egress-host.us-east-2.a.mail.umich.edu [18.217.159.240])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB2F422D;
	Thu,  3 Aug 2023 02:35:34 -0700 (PDT)
Received: from malleable-ellyllon.authn-relay.a.mail.umich.edu (ip-10-0-72-197.us-east-2.compute.internal [10.0.72.197])
	by keen-gwydion.relay-egress.a.mail.umich.edu with ESMTPS
	id 64CB74E5.130B4C7C.1A239A93.70545;
	Thu, 03 Aug 2023 05:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2018-08-29; t=1691055327;
	bh=Xc/AH5l4Iyyp7OtLp1W+ayvZ64gdQJXoJlypwl+ahyA=;
	h=From:To:Cc:Subject:Date;
	b=DeWNFKCo8ElkOM9/673Zdqcd1BdgDA3AL++FK0+eUh/m2OHm7jnaiHet1/zV2lSmy
	 xGc1Ttaoz7RYr0OM3etjwtW3D2tKmoVLUdhBcDGZyR3GQbpE813ZjX260sysIeZ95h
	 rB/XUybT4aGPfDstPiT8SRJBB41oNZvwhh6PVV5y2LmNGuBzI8KG4BAQYo7GrW+he/
	 lMGb/gMhA0DNXhYwnaY4bW5xnRCSHc/cq6KobDha+R8MxGYIvS40BIl+TEIpp+6EkU
	 EIYp/OL/KB6iArLHGGAo6JIYQIwZr9lBcjAQBZ12wmlFYyNpAjpEjr8yqqnsig4XAD
	 zmpRQah2Or7Zg==
Authentication-Results: malleable-ellyllon.authn-relay.a.mail.umich.edu; 
	iprev=permerror policy.iprev=68.32.216.219 (unknown);
	auth=pass smtp.auth=tmgross
Received: from localhost.localdomain (unknown [68.32.216.219])
	by malleable-ellyllon.authn-relay.a.mail.umich.edu with ESMTPSA
	id 64CB74DF.146D9BAD.63148A9A.1340056;
	Thu, 03 Aug 2023 05:35:27 -0400
From: Trevor Gross <tmgross@umich.edu>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Trevor Gross <tmgross@umich.edu>
Subject: [RFC PATCH 0/2] Generate API documentation for 'bindings' crate
Date: Thu,  3 Aug 2023 05:34:16 -0400
Message-Id: <20230803093418.51872-1-tmgross@umich.edu>
X-Mailer: git-send-email 2.34.1
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

The 'bindings' crate currently doesn't have API documentation available.
With this change, it will be generated as part of the output of 'make
rustdoc' (similar to the 'kernel' crate's docs,
https://rust-for-linux.github.io/docs/kernel/).

This patch is a RFC because there are a few questions:

1. Do we want to make this the default, or a separate target/
   configuration? I don't think there is much downside to always
   generating.
2. The entire '.config' file could be included in the doc output, to
   make it easy to tell what settings the documentation was generated
   with. Would this be desired? Maybe with a '--cfg
   include-dotcfg=".config"' flag so published docs would have the
   option (unsure whether it may ever have sensitive information).

Bindgen is currently invoked with '--no-doc-comments', I think this may
be because some blocks were mistakenly interpreted as doctests. Once we
upgrade our bindgen version we might be able to remove this.

Side note, 'rust/Makefile' seems to have a mix of tabs and spaces - is
this intentional?

Trevor Gross (2):
  rust: bindings: generate API documentation for the 'bindings' crate
  rust: bindings: add warning about configuration dependence

 rust/Makefile        | 14 +++++++++++---
 rust/bindings/lib.rs |  3 +++
 2 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.34.1
