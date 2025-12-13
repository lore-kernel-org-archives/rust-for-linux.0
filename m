Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98A313D8B1;
	Sat, 13 Dec 2025 00:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765584071; cv=none; b=O/BMQL2ULWCu0UKolD/xdHRJfFPgsqrQeSGm+cfWPwlRQ0xfSsEizxYq41U/zYEEheHo2n0IFJBxvwN+WHTWHyq8kpD5J7wcxh4nLPMtwJ4ESm2S8AxTWs0zBWDK8knHJo7tsuqzzVTtTURGn/79YIJ4G0NW8ep0iG31BeuwK3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765584071; c=relaxed/simple;
	bh=ygnPTdtrSkVZiTnHhrQo6Ytny9BCjcOEi0bO2jqXtLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dzR0CrlAhwJUniB/QauSp2vhNg+xrxUAuQaVbsc2vKNk1NgocmWvvj6cE0Rn2MedLo3rG+ErFcYGuZYHcXpcMzH/+4SK/rb+8HJtzhF+IJdvmh4RA1x4SC8URqIsZ1an/9+RQr3+19hzxLw4apcnC1tyUznNhX/nwbGHHehyeuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLjT6v28; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLjT6v28"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD69C4CEF1;
	Sat, 13 Dec 2025 00:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765584071;
	bh=ygnPTdtrSkVZiTnHhrQo6Ytny9BCjcOEi0bO2jqXtLo=;
	h=From:To:Cc:Subject:Date:From;
	b=ZLjT6v28N4yM7ef1xINi+v2n6PszfN1SE9yZOfWkmD0Q0jLn7yx8V8MLzCMmaGNjq
	 uPGafTAfIj/czv8YiBuQ+/05NWYyOcMqfeekoPvawljbMcBpSnlO3ILgz1bmrDgTYL
	 oyPrG8kssoaX31hvU719Fi1OP1D+EqdzS343yKUvSrRLd8NrHyt95M1t/EFZuoOQEL
	 1xOOlhP5gP9MC+M0PhRJLYPzGDO094IDYk3LNkgQPE7u1qxy+7O/rcnuXHD0TR5jmO
	 PdJCFfQQ8E25gxLjHNVOviLH12nyPVjBRu8Um0AgTHHPaSjlMtuxh6JYizgdWBJszw
	 oJouBYdYLae7g==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: conclude the Rust experiment
Date: Sat, 13 Dec 2025 01:00:42 +0100
Message-ID: <20251213000042.23072-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rust support was merged in v6.1 into mainline in order to help
determine whether Rust as a language was suitable for the kernel,
i.e. worth the tradeoffs, technically, procedurally and socially.

At the 2025 Linux Kernel Maintainers Summit, the experiment has just
been deemed concluded [1].

Thus remove the section -- it was not fully true already anyway, since
there are already uses of Rust in production out there, some well-known
Linux distributions enable it and it is already in millions of devices
via Android.

Obviously, this does not mean that everything works for every kernel
configuration, architecture, toolchain etc., or that there won't be
new issues. There is still a ton of work to do in all areas, from the
kernel to upstream Rust, GCC and other projects. And, in fact, certain
combinations (such as the mixed GCC+LLVM builds and the upcoming GCC
support) are still quite experimental but getting there.

But the experiment is done, i.e. Rust is here to stay.

I hope this signals commitment from the kernel to companies and other
entities to invest more into it, e.g. into giving time to their kernel
developers to train themselves in Rust.

Thanks to the many kernel maintainers that gave the project their
support and patience throughout these years, and to the many other
developers, whether in the kernel or in other projects, that have
made this possible. I had a long list of 173 names in the credits of
the original pull that merged the support into the kernel [2], and now
such a list would be way longer, so I will not even try to compose one,
but again, thanks a lot, everybody.

Link: https://lwn.net/Articles/1049831/ [1]
Link: https://git.kernel.org/linus/8aebac82933f [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
I could update the first link to the full LWN article when published.

 Documentation/rust/index.rst | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/Documentation/rust/index.rst b/Documentation/rust/index.rst
index ec62001c7d8c..e61524959dbc 100644
--- a/Documentation/rust/index.rst
+++ b/Documentation/rust/index.rst
@@ -7,24 +7,6 @@ Documentation related to Rust within the kernel. To start using Rust
 in the kernel, please read the quick-start.rst guide.
 
 
-The Rust experiment
--------------------
-
-The Rust support was merged in v6.1 into mainline in order to help in
-determining whether Rust as a language was suitable for the kernel, i.e. worth
-the tradeoffs.
-
-Currently, the Rust support is primarily intended for kernel developers and
-maintainers interested in the Rust support, so that they can start working on
-abstractions and drivers, as well as helping the development of infrastructure
-and tools.
-
-If you are an end user, please note that there are currently no in-tree
-drivers/modules suitable or intended for production use, and that the Rust
-support is still in development/experimental, especially for certain kernel
-configurations.
-
-
 Code documentation
 ------------------
 

base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
-- 
2.52.0

