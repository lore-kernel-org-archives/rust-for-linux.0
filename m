Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6A32550D5;
	Thu, 18 Dec 2025 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053492; cv=none; b=cM+IROYRoezR47qHBLAblfhLCZSMfY71JlQtH1WHCiZGb07hbhTW/14e1hBjMBvj3oRxdapaLDUyfa/z98ZitVyybOyTlgkWiOqc2t84vllogsM2oMBcrS1qQ7pwYJCKj+zgEv+tK7eFqNkk/SSmGDyqmd3uJSQLzf0xF+eDPzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053492; c=relaxed/simple;
	bh=UJKagR3gv6xSeuSBEa/dQrOutnce3H/m0xcel8NF+lw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DlnZuxBh65r7xkwCRKmPvJQtC4yOSMsL2sTiuNiOy91hVM1cf/1SHw0F4T1sI5fD9qUScnycXAn78+QEKp7x0atvglqroEIkw63mWPXm36OMnZelukTPRv3T4jWGLIt1loBsLOHyZ4XI4oNID1XDbAFqorqdqNfR1b/RESCyarw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hohxNmtY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hohxNmtY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89EADC4CEFB;
	Thu, 18 Dec 2025 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766053491;
	bh=UJKagR3gv6xSeuSBEa/dQrOutnce3H/m0xcel8NF+lw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=hohxNmtYyQLtrM1pHkwGNdkHYYgSnZP53DSvv4TJYm+ZAYCQKl9XgEMDRwKgEhPkn
	 A3byjrWZl71BKJTL9pwK9Z2LaNA40GfATxaRwUEcRHWKjZSJ+WATfpG+rlBE+QsZ7I
	 4kpahVSWtFrrJpaTuQoQzvyLCHhuN0Bifxj6sA3W+m61HMwKyXgJqYk4EpxIdSAU+4
	 ZQvjfB2q9hA6Hz7Ch2UeDroHXG1WPyNMuTHfg1cZIJCGuaaWbnvKt9G/tNMXt1/2YJ
	 bA7qTvf4y2bc187iPaZSUS93MpLWoqckYvAedHm2HhdLEX+CgwVfLjWpJu6F7C3IT6
	 uxVO8or4mqoQw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 11:24:47 +0100
Message-Id: <DF19PO1J860C.1A15C38JSTK1J@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>
Subject: Re: [PATCH v2] rust: sync: implement Unpin for ARef
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>
X-Mailer: aerc 0.21.0
References: <20251218-unpin-for-aref-v2-1-30d77129cbc6@google.com>
In-Reply-To: <20251218-unpin-for-aref-v2-1-30d77129cbc6@google.com>

On Thu Dec 18, 2025 at 9:25 AM CET, Alice Ryhl wrote:
> The default implementation of Unpin for ARef<T> is conditional on T
> being Unpin due to its PhantomData<T> field. However, this is overly
> strict as pointers to T are legal to move even if T itself cannot move.
>
> Since commit 66f1ea83d9f8 ("rust: lock: Add a Pin<&mut T> accessor")
> this causes build failures when combined with a Mutex that contains an
> field ARef<T>, because almost any type that ARef is used with is !Unpin.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
> Changes in v2:
> - Add T: AlwaysRefCounted bound.
> - Link to v1: https://lore.kernel.org/r/20251217-unpin-for-aref-v1-1-8471=
1b747d02@google.com
> ---
>  rust/kernel/sync/aref.rs | 3 +++
>  1 file changed, 3 insertions(+)
