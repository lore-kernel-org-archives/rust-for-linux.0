Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E16236AB63
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040798; cv=none; b=ktDkba7PSzFPm1ga0sW3al4n22MGkutHWXeCFlffZs5cNLKVoxAA6/Jb+z5RtiLi+4nz06fWXHXZuP2o2iq4rnULKu5Qpcf8a2dr9lC4fNA8kOEkX0akcqAjv97BL2kVVvffw64f1pyFj1tkhIZsGDKvhxGUB3UFfZBsEQnWVXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040798; c=relaxed/simple;
	bh=ZHDZ+1d+Nu1W6KsVOQzLxug/HqhWlvuTJLfR4nkkJIc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aHZzHO4rFKKe+wGCH3Jsd/bdyzaZteKMQ/+t9Sa8YJ6Dp6fm8wSkn1ptGoRRyvm8GTjknpQM55Yj15A2ECKioXvGXBleFYl1hTSDfXdbNsdvz+UqcYp3IDOqVph8N8hpjVltrOshzdNq5NKTzDVU1hYw+cmPJnsZc6mVGX0JUeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=MKF0dmhx; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="MKF0dmhx"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B3000240103
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 14:59:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1770040795; bh=to0E3ZmaejSRmlLvwm+2sGiwpYMPL1aJScsJZPk04as=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=MKF0dmhxqAbJBwMDRIQrxSrfR3XljNY6LlYrpNTUIKsTj1Jr245Z+8ejQeqLuTtxd
	 vHQDcFdQqq3L00rbdD8rY3hRoJl1sMgwPy6O0uBFGNCdPTT4njx3T1868UMGnmFoJf
	 cT4DOH6wzH5F5PP4zzeRwlyrL9BstbsfxSoQQETOE8LBSQYF6K3NHjhYcJMg7Ol4UY
	 5siimDOe5GB1NR8ovCVG1o4LZiM/vkIDUI01QtiVUx4z1sixaCsWJGTyen5hMQ1EIw
	 q3+pUCHJTkM8+Zrh8hwyIZzXojAJoo1+luHw8DMa2Bxf2SNyw3lMrcdnmEpK9KjaPj
	 747SosVNSbEjw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f4St10cpkz6tsf;
	Mon,  2 Feb 2026 14:59:53 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: HeeSu Kim <mlksvender@gmail.com>
Cc: ojeda@kernel.org,  boqun@google.com,  gary@garyguo.net,
  bjorn3_gh@protonmail.com,  lossin@kernel.org,  a.hindborg@kernel.org,
  aliceryhl@google.com,  tmgross@umich.edu,  dakr@kernel.org,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: Makefile: apply fixed-x18 workaround only on arm64
In-Reply-To: <20260202222144.2689495-1-mlksvender@gmail.com>
References: <20260202222144.2689495-1-mlksvender@gmail.com>
Date: Mon, 02 Feb 2026 13:59:54 +0000
Message-ID: <87h5rz8cvb.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

HeeSu Kim <mlksvender@gmail.com> writes:

> The `-Cunsafe-allow-abi-mismatch=fixed-x18` option is a workaround for
> a rustdoc issue (rust-lang/rust#144521) where target modifiers were not
> properly saved. This affects both rustdoc and doctests builds.
>
> However, `fixed-x18` is an ARM64-specific ABI modifier related to the
> x18 register reservation (used for Shadow Call Stack). Currently, this
> workaround is applied unconditionally on all architectures, which is
> incorrect and may cause issues on non-ARM64 builds.
>
> Restrict the workaround to only apply when building for arm64
> (SRCARCH=arm64).
>
> Fixes: 68e8e79e1bdc ("rust: fix `rustdoc` target modifiers")

Are we sure this is in the correct commit hash? It is not present on
mainline.

Maybe it should be this one?

      Fixes: abbf9a449441 ("rust: workaround `rustdoc` target modifiers bug")

Cheers,
C. Mitrodimas

> Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
> ---
>  rust/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 5c0155b83..2bd547611 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -136,7 +136,8 @@ pin_init-flags := \
>  
>  # `rustdoc` did not save the target modifiers, thus workaround for
>  # the time being (https://github.com/rust-lang/rust/issues/144521).
> -rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
> +# The `fixed-x18` modifier is ARM64-specific, so only apply it there.
> +rustdoc_modifiers_workaround := $(if $(filter arm64,$(SRCARCH)),$(if
> $(call
> rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18))
>  
>  # Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
>  doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if
> $(call rustc-min-version,109100),$(comma)sanitizer)
