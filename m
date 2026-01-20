Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D0938DD3;
	Tue, 20 Jan 2026 11:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907678; cv=none; b=SyNAxfJ2cyHmLozK9iJUpuP/Wf2i58q8MoFwINTGfGnLKBwcQu9kAITHZmIIj6QzdAd91aEGbORWUOtBv2LdNJan7hEJJ0Ynq17dKhLnH/GrUbem1EBc/lKBZOASJbLhYZ4lOkyQ9iJPn8u2lXMShHasCBaQK34uF/yQyGvFwZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907678; c=relaxed/simple;
	bh=M+5IH4rPhd3O/CiKQNbmPNdoVNjC+8DGvt8pxyAAxuc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=mxB5O2wmg0gvINSFmJV3t4lO2OGpHM6BMSA26b5TfuwWQ/+UEyFgCUjUzx9M8yulQjotJwyw0aGCTvPhG1h/ucqi7lZVd6wFc5q96bnJt+DWko9jfLiosYGOLOfIF07G+1Ooztr+68ldhEbXNM1dXbKibusBJsJUefIcbijruBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiEPzaJr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiEPzaJr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7E7C16AAE;
	Tue, 20 Jan 2026 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768907678;
	bh=M+5IH4rPhd3O/CiKQNbmPNdoVNjC+8DGvt8pxyAAxuc=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=EiEPzaJrbDRPOVNGuP19VhN1BcljC3yI9MqgN/+siqnDucSM/bFDH5jI7MGDAapUX
	 yxuN0+uAZbWonce1CDMfZgqf8NeLDtOUd+lmW4O+kmE9ZpKBRh3W2ekvGzKcD/kFWw
	 2Be7RbrFiqfl5QqRwCOTExitHsQv9/oWhTpijABhEf/WAlZJoa9n2SXGtG9UGnjsbp
	 aN/PDzVvxGkKxW2zTWbSQuaNiArkeVklWqp1UW7N82hqyEV4HLQVGuPcHTKEZLko1F
	 PmLJWF+lVtczRKloFhrnlqPBzg2zo7jisyF8EsolLs7oDTnN0kZG6950qasnCqI24i
	 HvZn4UhgvkoCA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 12:14:33 +0100
Message-Id: <DFTDFR0943NX.3RTHNQURC11XQ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 4/4] rust: drm: dispatch delayed work items to the
 private data
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
References: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
 <20260115-aref-workitem-v1-4-9883e00f0509@collabora.com>
In-Reply-To: <20260115-aref-workitem-v1-4-9883e00f0509@collabora.com>

On Fri Jan 16, 2026 at 1:36 AM CET, Daniel Almeida wrote:
> +// SAFETY: Our `HasWork<T, ID>` implementation returns a `work_struct` t=
hat is
> +// stored in the `work` field of a `delayed_work` with the same access r=
ules as
> +// the `work_struct` owing to the bound on `T::Data: HasDelayedWork<Devi=
ce<T>,
> +// ID>`, which requires that `T::Data::raw_get_work` return a `work_stru=
ct` that
> +// is inside a `delayed_work`.
> +unsafe impl<T, const ID: u64> HasDelayedWork<Device<T>, ID> for Device<T=
>
> +where
> +    T: drm::Driver,
> +    T::Data: HasDelayedWork<Device<T>, ID>,
> +{
> +}

What do you intend to do within work that is queued for a DRM device? I ass=
ume
you have to access bus device resources?

Also, it would be nice to see how this is used in a driver. Can you please =
add a
patch for Tyr to the series?
