Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434D190068
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Aug 2024 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725025450; cv=none; b=RgQ8lmadNDRb0zhKb7BtfOeKjqFQoVMZ0YPz0D4KhfjgOJwsXo6MfqRBSB6Pd4dewL2LeZkBFYs2jnP266gnCrLnx517YBsCCE4vZO6xrf7A2ySwfbv3LY5IfuXgX0492F2tFkKfz23WNedNYOk8VPRjwkfiAwahfkvZakt7dYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725025450; c=relaxed/simple;
	bh=djdNbVmrsW6hw8WUj/Mlg46zFCWw3zbmK3wHUsqxZrQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L/4qwfYUSCCyff5nnUdSiOPPXs3+uIAYXttlxNvzftEc050hy3R1lxx6OQoFIB/2bcJvgE5Dct0kqoApVwGDRWxWJuK0fg0Pdg/S3RMXuPE75xWi8xJyajR7n5tAmtXZue1YEAJ0SZm7f1J6pLBHE14zqtKVKpb1A59vN5ucl9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=O2k0hWVq; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="O2k0hWVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1725025446; x=1725284646;
	bh=djdNbVmrsW6hw8WUj/Mlg46zFCWw3zbmK3wHUsqxZrQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=O2k0hWVqhq8TMzWrtg0Zx0rjM0N6EwyUo9dJeYEnA44tPUt5JAS+yn50H1g8isKWX
	 GjQ+4FBomSLb157NXqpBlaPCJhDpHTVvBuMndGSVBZ8+vrV6JOtQBfqT5JAKwMIe6L
	 5gLRnxGCOgHWBEJpywLas+0m0L/steoQEJmh6uoUAi7EyQ4mPDo6BY7Zaq1pDR9c33
	 FMRjfenAzeWAU2SHKk+20FyAxUA6c9Dlg17E8LABBcNEjABAblNN0I2bVPipujitMo
	 c25uNvuV2VtwtXUrd+rvok6WCxSgVg+mx/noG3ojDLBI5dplLGMzNiPJWpug7tz/29
	 s4lRbFT7wWPyQ==
Date: Fri, 30 Aug 2024 13:44:00 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v6 01/26] rust: alloc: add `Allocator` trait
Message-ID: <097db593-d25c-4a87-97e1-b7214b4606da@proton.me>
In-Reply-To: <20240816001216.26575-2-dakr@kernel.org>
References: <20240816001216.26575-1-dakr@kernel.org> <20240816001216.26575-2-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 22877c4c02f7adf62ef126904bffd48369a0b00c
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 16.08.24 02:10, Danilo Krummrich wrote:
> +/// The kernel's [`Allocator`] trait.
> +///
> +/// An implementation of [`Allocator`] can allocate, re-allocate and fre=
e memory buffer described
> +/// via [`Layout`].
> +///
> +/// [`Allocator`] is designed to be implemented as a ZST; [`Allocator`] =
functions do not operate on
> +/// an object instance.
> +///
> +/// In order to be able to support `#[derive(SmartPointer)]` later on, w=
e need to avoid a design
> +/// that requires an `Allocator` to be instantiated, hence its functions=
 must not contain any kind
> +/// of `self` parameter.
> +///
> +/// # Safety
> +///
> +/// A memory allocation returned from an allocator must remain valid unt=
il it is explicitly freed.
> +///
> +/// Any pointer to a valid memory allocation must be valid to be passed =
to any other [`Allocator`]
> +/// function of the same type.
> +///
> +/// Implementers must ensure that all trait functions abide by the guara=
ntees documented in the
> +/// `# Guarantees` sections.

Can you make a bullet point list out of these three paragraphs?

---
Cheers,
Benno


