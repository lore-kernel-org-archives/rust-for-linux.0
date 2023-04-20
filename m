Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699ECC77B73
	for <rust-for-linux@archiver.kernel.org>; Thu, 20 Apr 2023 13:45:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjDTNpl (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 20 Apr 2023 09:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjDTNpl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 20 Apr 2023 09:45:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00465BA1;
        Thu, 20 Apr 2023 06:45:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D770648EF;
        Thu, 20 Apr 2023 13:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8706FC433D2;
        Thu, 20 Apr 2023 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681998338;
        bh=RnOWekaQtj+JQYrTgnzTzI0QzSEmzMSVVESQmRMRKRY=;
        h=From:To:Cc:Subject:Date:From;
        b=ZXl0SDt8j18gYVDmXrZpG2TwC/PsWXwLBDzrCl28TeuAD+vKqDIS3+pu8msvQQ5GU
         Jjf2ano3ad+vpxYpnBxF5jn6O4O2TGHXubkCrz7T2Gzfdy5ywzKnJja362HKAJbk3+
         9VT76s/ZrZbw9DKmS7v9W70uwaJkARMJ10TwUfOP60ZYXVqN/JGL3DFDdp+/1b+5Ws
         ZyolKIf0DLPFRpdBstamYlaD5WucAxptF5bLooqBmYrJgyBmKISygM+hZNky0GG17S
         r4oPqabhapPKxLHEMzUgzGVbd/QajLx4ldJOFMMFosTg6oO4+/TW8znv/7ehWpdRCE
         Puzn1wBQbmNAg==
From:   Miguel Ojeda <ojeda@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 6.3
Date:   Thu, 20 Apr 2023 15:44:58 +0200
Message-Id: <20230420134458.942139-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Linus,

Please pull these fixes for Rust.

Most of them are straightforward. The last one is more complex, but it
only touches Rust + GCC builds which are for the moment best-effort.

They have been in linux-next for more than a week, but I reworded
yesterday the second-to-last to add a correction to the commit message
(no changes otherwise -- the original commits can be found starting at
8197cc33f421 in linux-next).

No conflicts expected. No changes to the C side.

Cheers,
Miguel

The following changes since commit 7e364e56293bb98cae1b55fd835f5991c4e96e7d:

  Linux 6.3-rc5 (2023-04-02 14:29:29 -0700)

are available in the Git repository at:

  https://github.com/Rust-for-Linux/linux tags/rust-fixes-6.3

for you to fetch changes up to d966c3cab924fb750fefef11e77a6fa07dd5420e:

  rust: allow to use INIT_STACK_ALL_ZERO (2023-04-19 19:34:43 +0200)

----------------------------------------------------------------
Rust fixes for v6.3

 - Build: Rust + GCC build fix and 'grep' warning fix.

 - Code: Missing 'extern "C"' fix.

 - Scripts: 'is_rust_module.sh' and 'generate_rust_analyzer.py' fixes.

 - A couple trivial fixes.

----------------------------------------------------------------
Andrea Righi (2):
      rust: fix regexp in scripts/is_rust_module.sh
      rust: allow to use INIT_STACK_ALL_ZERO

Asahi Lina (1):
      scripts: generate_rust_analyzer: Handle sub-modules with no Makefile

David Gow (1):
      rust: kernel: Mark rust_fmt_argument as extern "C"

Patrick Blass (1):
      rust: str: fix requierments->requirements typo

Thomas Bamelis (1):
      rust: sort uml documentation arch support table

Vincenzo Palazzo (1):
      rust: build: Fix grep warning

 Documentation/rust/arch-support.rst |  2 +-
 rust/Makefile                       | 16 +++++++++++++++-
 rust/kernel/print.rs                |  6 +++++-
 rust/kernel/str.rs                  |  2 +-
 scripts/generate_rust_analyzer.py   |  5 ++++-
 scripts/is_rust_module.sh           |  2 +-
 6 files changed, 27 insertions(+), 6 deletions(-)
