Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B338E127;
	Tue, 13 Jan 2026 11:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304804; cv=none; b=eULrnalfMmea/GIm6pDJB4X6MD0LGb0sjNgyvgNMq5eDKD3pE/wgT+43mswaG26JaB9WXnMzZRrmFdOpu+9oxu+Xc9YKXMYYgK4H5FyPJpmQ7TykvxITJ4hBh9MAu7QXjb3Uf1eJ0rmd/rbFJzBp0MN0nOqBxc44poaOm9SdfGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304804; c=relaxed/simple;
	bh=QBvEjggRtfBWW+wFoMsPP+V5V4/wuLjkk0gzonL5Dhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QormMiwhjWbZhYEBqFvGn5x0Ee/md233R2kH5hg+RtoWqpXE0I4mLxQzJbzydQLyQSh+cVBPD10PyjVpYW+V6W7ZQpTBSR9lU0XY5RmVAIFwh7ESlsMYfU32nnS3D2vSNTybpbLMw4a2fV1PdpZgDu85qc3BWDUJydJ5P3pWAtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0AV2JbL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0AV2JbL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B238AC116C6;
	Tue, 13 Jan 2026 11:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768304803;
	bh=QBvEjggRtfBWW+wFoMsPP+V5V4/wuLjkk0gzonL5Dhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T0AV2JbLHdR0uY1BGGkx3jnerLW4YUk8M9uFfmoXDD+YiKRUoKDT48KWILGPwObhg
	 fiLLCq/6wihMNvqP6TFhKlkt+LlgovaR1Vk3JUo8FR+Jw6XVnmIhHpGKlvslBRig7p
	 E26K38ELH3H9/CUW3q2za6sLxWeDCqsQp9fLGiNWBMTIK/WP2zW7Hc6UFW7TkO3G4j
	 bJSCXVo2HDHG3SJAAqcL3G16iSm+OUlgFYVIcsvBcxF/v5jV8Z1IBlbQXNo0CoCVTf
	 7/1884ejIbCljAZMMD7rOgVSAa4seYOtCyi9oQKaLz6CEJMzn+4Is5ANsFt94TtHzp
	 6CLNJvxMYJeJg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	ojeda@kernel.org
Cc: linux-doc@vger.kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH] rust: conclude the Rust experiment
Date: Tue, 13 Jan 2026 12:46:23 +0100
Message-ID: <20260113114623.114117-1-ojeda@kernel.org>
In-Reply-To: <20251213000042.23072-1-ojeda@kernel.org>
References: <20251213000042.23072-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 13 Dec 2025 01:00:42 +0100 Miguel Ojeda <ojeda@kernel.org> wrote:
>
>  Documentation/rust/index.rst | 18 ------------------

When I apply the patch soon I will also remove this one as well which
I recalled we had (Cc docs/Jon):

diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
index bc56dee6d0bc..f39d1d3dd9ce 100644
--- a/Documentation/process/programming-language.rst
+++ b/Documentation/process/programming-language.rst
@@ -34,7 +34,7 @@ Please refer to ``include/linux/compiler_attributes.h`` for more information.
 Rust
 ----

-The kernel has experimental support for the Rust programming language
+The kernel has support for the Rust programming language
 [rust-language]_ under ``CONFIG_RUST``. It is compiled with ``rustc`` [rustc]_
 under ``--edition=2021`` [rust-editions]_. Editions are a way to introduce
 small changes to the language that are not backwards compatible.

Cheers,
Miguel
