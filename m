Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AC032C948;
	Tue, 23 Dec 2025 10:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486967; cv=none; b=UeYvnioiYuEaEbXbBPcDIClCCVFhFSvebCb9VLQUQKPqEVJ50GuovFn4B3HiFaALnBPZPPpwGMAgBtmlV+VoV8u1E+wv9FoSYSDFRd7e7ZcHsdKR6zN2C7T4KYaAWJRFNKks8fzfbLBFsgnmbp2nxX1S023T2ndj0gpMkeKRm+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486967; c=relaxed/simple;
	bh=p6BClDKh69s/BSnx6mzOSqFYXC7/xdaF2oAtmfMD0ss=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=GfzngxSuWkuHtvZEvzCcKCcp22ek1Ztb4/khGh4ed0se4+2WcCs6F7RcG+tjqvepeYOo7GbZLQzRq3rfroHSB96BJE0PsRVayojO70WaDAqpeLPdYxmsHK3h9txjOXXqEchanWJGq1cBgB7yfHcC2c3x2Qap+jbdZQP+HWYxNzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8Q1CSiF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8Q1CSiF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D86C113D0;
	Tue, 23 Dec 2025 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766486967;
	bh=p6BClDKh69s/BSnx6mzOSqFYXC7/xdaF2oAtmfMD0ss=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=P8Q1CSiFeYggwf6Xrc5eS0ojj50VbkQOJwggbtwo5DkHrloeaWd4m7E989BnrZJUC
	 +S7e4JDWL95m3iAhYJwydXveuudReHs2oxEv6+SxETTFdCPXkR9AWYiPRJyTHgh7U7
	 OeEr2933YId1kVQG+GCDXZp3fMfns7+4RSpUiy+r8fFE3isqcfsyll6hwjc2Ra4DAV
	 qze6Gke3ZUKoIEBe8xLvCbg6SP/IZBvvhTEprpOsLuWIwXBox6UFrIf5IwNbdniSEE
	 S1oP5RWYyUd2GXtcTY/prgLbEFA/x/zy6XSAzJfkxr+Rif6ukgo6Z70eeMEAcx1xIC
	 Aze93pujkh8Uw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 11:49:22 +0100
Message-Id: <DF5JD7FQGQB4.2B3HNIBF5XNR1@kernel.org>
To: "Tamir Duberstein" <tamird@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] samples: rust: faux: replace `kernel::c_str!` with
 C-Strings
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Tamir
 Duberstein" <tamird@gmail.com>
References: <20251223-cstr-faux-v1-1-ee0c5cf1be4b@gmail.com>
In-Reply-To: <20251223-cstr-faux-v1-1-ee0c5cf1be4b@gmail.com>

On Tue Dec 23, 2025 at 8:40 AM CET, Tamir Duberstein wrote:
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to driver-core-testing, thanks!

    [ Use kernel vertical import style. - Danilo ]

(Please use kernel vertical import style in the future when modifying impor=
ts.
Especially in this case, where the modified line is the only import of the =
whole
file. Thanks!)
