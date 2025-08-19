Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B873E2FA0FF
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755626545; cv=none; b=POwJyhCFV963eIQfEpCd7EG3SNPV++9eDGmW1XmW9zykJ2EqkRBT9SLuWvWwpA5yhIaZA6SsBKvqoiF6PmtV2xuSz9XlolzsckiX2Pu/JU/WVqC0nkNraJrtNS6MQ3yb9VJvYuUY3gZazaWQeyZWRIooMqxBsnxCbTKticet1M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755626545; c=relaxed/simple;
	bh=ak2Xhr1RaizJ7hP18FRRrylp/o33W9xGB14X86TRAXA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ez/WjD6jHN+Q+yIkx+JP04Olam/rdphMqPfS4LM2NBas7ipEYnb8GmWsb2M3UCYXLR2Sv3QhxDNTy8PhNIkykKEoRgme3V48u2vS8bbIAk6l4jtITfKEQe3sPpthP2kuyAN5zalYQWXWM6Ml0vSm082YSftw7kmj4aVGx4Jp9j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNCInYtI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNCInYtI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E20C4CEF1;
	Tue, 19 Aug 2025 18:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755626545;
	bh=ak2Xhr1RaizJ7hP18FRRrylp/o33W9xGB14X86TRAXA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=XNCInYtId3bXC20r07LGhKSEb4Xo2g9bb+CKZRKeB/ncexFguTuv543XvoIFo3YHW
	 mTn0eGDlXOsbD9ixI/YKztZGtPis3BdfO23DP6m8lkxlQtAI3X5sAjaQJqYWoHjvHz
	 Jtem84nNJfAUIdsWw4/MosFCX7FAAX+d1r8UKJWiRrQOOskyOVeL+WuQH0f8YbqLdK
	 Ki1AcOd7OCrRqOmgxqsjmQUgzqr09j2XM70Gy73jTi5ktnpJ4O3yphIFjxIeaLPmzu
	 pn4nHycxW2kiAemfoATBI5owYG/ACr3g/3T8321lXKGJfvJov3muf5upZdIOeB9SJX
	 rYaQWgIoFYLag==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Aug 2025 20:02:20 +0200
Message-Id: <DC6LO2MHWMQH.2L6R1C0PK0FPX@kernel.org>
Subject: Re: [PATCH] rust: alloc: add ARCH_KMALLOC_MINALIGN to bindgen
 blocklist
Cc: <rust-for-linux@vger.kernel.org>, <linux-mm@kvack.org>, "Thorsten
 Leemhuis" <linux@leemhuis.info>
To: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250818180923.192042-1-dakr@kernel.org>
In-Reply-To: <20250818180923.192042-1-dakr@kernel.org>

On Mon Aug 18, 2025 at 8:08 PM CEST, Danilo Krummrich wrote:
> For some architectures, such as X86_64, ARCH_KMALLOC_MINALIGN is not
> resolvable for bindgen. E.g. due to being defined as
> __alignof__(unsigned long long).
>
> Hence, we have to create a rust helper, i.e. let the C compiler evaluate
> the expression and store it in a const.
>
> However, if for other architectures, such as arm64,
> ARCH_KMALLOC_MINALIGN does evaluate to something that can be directly
> processed by bindgen, we end up with multiple definitions of
> ARCH_KMALLOC_MINALIGN in the generated bindings.
>
> 	error[E0428]: the name `ARCH_KMALLOC_MINALIGN` is defined multiple times
> 	      --> /builddir/build/BUILD/kernel-6.17.0-build/kernel-next-20250818=
/linux-6.17.0-0.0.next.20250818.423.vanilla.fc44.aarch64/rust/bindings/bind=
ings_generated.rs:134545:1
> 	       |
> 	9622   | pub const ARCH_KMALLOC_MINALIGN: u32 =3D 8;
> 	       | ----------------------------------------- previous definition o=
f the value `ARCH_KMALLOC_MINALIGN` here
> 	...
> 	134545 | pub const ARCH_KMALLOC_MINALIGN: usize =3D 8;
> 	       | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `ARCH_KMALLOC_MINAL=
IGN` redefined here
> 	       |
> 	       =3D note: `ARCH_KMALLOC_MINALIGN` must be defined only once in th=
e value namespace of this module
>
> To fix this up, add ARCH_KMALLOC_MINALIGN to the blocklist of bindgen,
> such that we always only generate the symbol from the rust helper.
>
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Closes: https://lore.kernel.org/all/8aa05f08-ef6e-4dfe-9453-beaab7b3cb98@=
leemhuis.info/
> Fixes: 1b1a946dc2b5 ("rust: alloc: specify the minimum alignment of each =
allocator")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to alloc-next, thanks!
