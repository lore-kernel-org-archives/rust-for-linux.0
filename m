Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5897947DD75;
	Tue,  5 May 2026 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987566; cv=none; b=ar7kKd+YRCjEB+TO6tUKuKvKh0C4ampFyk3wkBUxYZFNOSxrXdBYw+oykL/DB/mjZpPpLB2v3fX4oIhw4GNTFk8vOkr8Z37AjTLbsRdwzHPJmS3LgVo4fR/1NhYs7xXJ41iH/IxHInFfGiSyxO6Cw8ba3w2YP6TMNzltHvNZyRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987566; c=relaxed/simple;
	bh=fkRw9ZQ/Nl/SEfPMSjG1656WDAr3XU2weNlQw7TtpvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AOrD4qZ4jfsE7LcTQALcq4uVgfZbRuEGZXKbBcCEorDHpDdCfK5CcAvdo8dBsTK3B8r/kYoJWo/EjudNM5+CPtAjh3yk4tqzp95jG1F58391ahqG30PH477X2v807M46ASY0k8OXMHukZc3VqZz7X1hVIQU8oNNHTdLOWsnIVAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ToXNKaLK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToXNKaLK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E15C2BCC7;
	Tue,  5 May 2026 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987566;
	bh=fkRw9ZQ/Nl/SEfPMSjG1656WDAr3XU2weNlQw7TtpvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ToXNKaLKcnlaqF/9haKDHnE3hf5TqX0XfMZQx7b3knq4Qxk/5PgPFJVRGp6IQoLrw
	 7x7gRFVxhCioX1brTd/qZi5yyHUx1MQBrnQWttR1p9pYc6doQ96XIwQ0vtS2TTEBrK
	 3gsxKe0DPyq2ict5X5nPCfNHlBZGXhVYTXB1lRJJ6jXF5yvR70N8hg0u5MUDAVw5og
	 irZO7JJfCFK1XAJXo/eEVNP6pw2afnSR75utYxGmEkXzmjZzb9Rt7b5xvi16jsKg6k
	 nhFvwE4gOOqAVV+n0yKY8tVqyVHmzJKqGmNpgs62P6kxVWYYUhRwtpfxMnhDYQ9sPv
	 hGa+M4zrDjc1Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFmm-00000004ipP-20YD;
	Tue, 05 May 2026 15:26:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v2 11/11] MAINTAINERS: use a URL for pin-init maintainer's profile entry
Date: Tue,  5 May 2026 15:25:58 +0200
Message-ID: <1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777987027.git.mchehab+huawei@kernel.org>
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
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
---
 MAINTAINERS                   |  2 +-
 rust/pin-init/CONTRIBUTING.md | 72 -----------------------------------
 2 files changed, 1 insertion(+), 73 deletions(-)
 delete mode 100644 rust/pin-init/CONTRIBUTING.md

diff --git a/MAINTAINERS b/MAINTAINERS
index 8700472b3ae3..b16c8f85d099 100644
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
diff --git a/rust/pin-init/CONTRIBUTING.md b/rust/pin-init/CONTRIBUTING.md
deleted file mode 100644
index 16c899a7ae0b..000000000000
--- a/rust/pin-init/CONTRIBUTING.md
+++ /dev/null
@@ -1,72 +0,0 @@
-# Contributing to `pin-init`
-
-Thanks for showing interest in contributing to `pin-init`! This document outlines the guidelines for
-contributing to `pin-init`.
-
-All contributions are double-licensed under Apache 2.0 and MIT. You can find the respective licenses
-in the `LICENSE-APACHE` and `LICENSE-MIT` files.
-
-## Non-Code Contributions
-
-### Bug Reports
-
-For any type of bug report, please submit an issue using the bug report issue template.
-
-If the issue is a soundness issue, please privately report it as a security vulnerability via the
-GitHub web interface.
-
-### Feature Requests
-
-If you have any feature requests, please submit an issue using the feature request issue template.
-
-### Questions and Getting Help
-
-You can ask questions in the Discussions page of the GitHub repository. If you're encountering
-problems or just have questions related to `pin-init` in the Linux kernel, you can also ask your
-questions in the [Rust-for-Linux Zulip](https://rust-for-linux.zulipchat.com/) or see
-<https://rust-for-linux.com/contact>.
-
-## Contributing Code
-
-### Linux Kernel
-
-`pin-init` is used by the Linux kernel and all commits are synchronized to it. For this reason, the
-same requirements for commits apply to `pin-init`. See [the kernel's documentation] for details. The
-rest of this document will also cover some of the rules listed there and additional ones.
-
-[the kernel's documentation]: https://docs.kernel.org/process/submitting-patches.html
-
-Contributions to `pin-init` ideally go through the [GitHub repository], because that repository runs
-a CI with lots of tests not present in the kernel. However, patches are also accepted (though not
-preferred). Do note that there are some files that are only present in the GitHub repository such as
-tests, licenses and cargo related files. Making changes to them can only happen via GitHub.
-
-[GitHub repository]: https://github.com/Rust-for-Linux/pin-init
-
-### Commit Style
-
-Everything must compile without errors or warnings and all tests must pass after **every commit**.
-This is important for bisection and also required by the kernel.
-
-Each commit should be a single, logically cohesive change. Of course it's best to keep the changes
-small and digestible, but logically linked changes should be made in the same commit. For example,
-when fixing typos, create a single commit that fixes all of them instead of one commit per typo.
-
-Commits must have a meaningful commit title. Commits with changes to files in the `internal`
-directory should have a title prefixed with `internal:`. The commit message should explain the
-change and its rationale. You also have to add your `Signed-off-by` tag, see [Developer's
-Certificate of Origin]. This has to be done for both mailing list submissions as well as GitHub
-submissions.
-
-[Developer's Certificate of Origin]: https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
-
-Any changes made to public APIs must be documented not only in the commit message, but also in the
-`CHANGELOG.md` file. This is especially important for breaking changes, as those warrant a major
-version bump.
-
-If you make changes to the top-level crate documentation, you also need to update the `README.md`
-via `cargo rdme`.
-
-Some of these rules can be ignored if the change is done solely to files that are not present in the
-kernel version of this library. Those files are documented in the `sync-kernel.sh` script at the
-very bottom in the `--exclude` flag given to the `git am` command.
-- 
2.54.0

