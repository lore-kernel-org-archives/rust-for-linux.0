Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8C93F9F45
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777373882; cv=none; b=pdHOW764DA4erm/XlGegs9GYm457mDN0zxqozil3Xgb0jo5o+DGijmznpj3c6qhcudMyoDkNeT8Zi8aaGW5APupjhT6+U3N4YDKyH9xzz7dPQxkfpveEGH3EMdZel+vB8Vz8klB46HwVO4IqeMma+j1dT+WellXhp+7uBL/Tdtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777373882; c=relaxed/simple;
	bh=9kWb/DKdV/Q7+M4ef903mD1mtzLJm+hZNzSOUDrk0Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ko2SabOUsnKUjJrOhVn1rgGmA8863apljG4hfCmLW/+YDZclsYRO7jA7rCxPxkHFiw0XKlprrwO6N2V2AbOtmgu0Ju2jwUxsqKNFeJexhEc3TLqGOJ4uAQjg1NoZZy4CZnPoI4YeT8giGsXSjOB6TxwqHzmveFm8dfUjrgNrjX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=gDfLabKD; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="gDfLabKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777373874; x=1777633074;
	bh=N7oI6X4BTbidksyrgcC2RYNXPOc31+Uf4h/P2gEOzwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gDfLabKDPYLMmvPzL3aGYlSO1rFHYINBvFrj9VmoYgxhv2PdjrBzLz/tUuIVdIjb6
	 1/fbEY7e1HpSJD0hRkMZlg3Wbka5REA3kyiV75z0H5pAdcjLHV/jvAsPWJejkD5sHZ
	 ZlJ+rP14zoGTeaZVHiCfUSBJ/tkG6hTSWbUrQlDpbWIO8mhOiJgWJL3aRBAFw3cFX2
	 mQZOyDktPMp1sN07udMVJ1cx+due1gw+yuMncii+8Ebtc9cqmH3ljZkLfXCj30DzS/
	 u8mTIolSwfdMreGytfxy9T4kq9eWj23VYJGDleA0w0VpBmicgIucPscb/C80LSHK/0
	 d/sxlYOsy/43A==
X-Pm-Submission-Id: 4g4cpm1yDQz2Sccl
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Sagar Taunk <sagartaunk2@gmail.com>
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	contact@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH] rust: workqueue: fix SAFETY comment Arc refs in Pin<KBox<T>>
Date: Tue, 28 Apr 2026 13:57:49 +0300
Message-ID: <20260428105751.193593-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260425135701.34010-1-sagartaunk2@gmail.com>
References: <20260425135701.34010-1-sagartaunk2@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 25 Apr 2026 19:27:01 +0530=0D
Sagar Taunk <sagartaunk2@gmail.com> wrote:=0D
=0D
> The `WorkItemPointer` implementation for `Pin<KBox<T>>` contained SAFETY=
=0D
> comments that incorrectly referenced `Arc::into_raw` instead of=0D
> `KBox::into_raw`. This implementation uses `KBox`, not `Arc`, so update=0D
> the comments to accurately reflect the actual ownership transfer.=0D
> =0D
> Suggested-by: Onur =C3=96zkan <contact@onurozkan.dev>=0D
> Link: https://github.com/Rust-for-Linux/linux/issues/1233=0D
> Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>=0D
> ---=0D
>  rust/kernel/workqueue.rs | 5 +++--=0D
>  1 file changed, 3 insertions(+), 2 deletions(-)=0D
> =0D
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs=0D
> index 7e253b6f299c..74c59f2b1c09 100644=0D
> --- a/rust/kernel/workqueue.rs=0D
> +++ b/rust/kernel/workqueue.rs=0D
> @@ -890,9 +890,10 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> fo=
r Pin<KBox<T>>=0D
>      unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {=0D
>          // The `__enqueue` method always uses a `work_struct` stored in =
a `Work<T, ID>`.=0D
>          let ptr =3D ptr.cast::<Work<T, ID>>();=0D
> -        // SAFETY: This computes the pointer that `__enqueue` got from `=
Arc::into_raw`.=0D
> +        // SAFETY: This computes the pointer that `__enqueue` got from `=
KBox::into_raw`.=0D
>          let ptr =3D unsafe { T::work_container_of(ptr) };=0D
> -        // SAFETY: This pointer comes from `Arc::into_raw` and we've bee=
n given back ownership.=0D
> +        // SAFETY: This pointer comes from `KBox::into_raw` and we have =
been given back ownership,=0D
> +        // as the workqueue guarantees `run` is called exactly once.=0D
>          let boxed =3D unsafe { KBox::from_raw(ptr) };=0D
>          // SAFETY: The box was already pinned when it was enqueued.=0D
>          let pinned =3D unsafe { Pin::new_unchecked(boxed) };=0D
> -- =0D
> 2.54.0=0D
> =0D
=0D
Thank you!=0D
=0D
Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
