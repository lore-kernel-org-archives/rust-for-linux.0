Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0592EC0AD;
	Fri, 27 Feb 2026 15:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206265; cv=none; b=HhBvI6oo2rk8eP5KDbPkYhHFmwwKr7Ju8449CKYdJoRHU3H1JlCVj/w/yl2kXI7Fb6AJRN6LJuQsBsa39EDtJPV8WsflyyyQ+m4Vsp4Lg6bXwLD1NO9Mcizl69WTtv17L7MT8x0Q+xjHG6eSdPI6QSw5vDny2Q76ALV7/ulpNM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206265; c=relaxed/simple;
	bh=7A0RQWO7/WUrNQxPpTBU+9huawgN3Z9Qhkl/D4IOhLw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PvYoAP/ql0F9d/VBP6MHX2Q+qYiVO7lLHs8KX65vOed1EAPpITdW72ld+1SOALOVSOvp0OpH9ffbRW5wXTYJ2p52LYlv2zlPse6w28nxxhJKhVHLDt8kFPb4Id0UOAswKRWiqj8GnBhaT0mVpwAOBqF+jfxGs6IDjQ6rPPxdCE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5r72cBp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5r72cBp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C791CC2BC86;
	Fri, 27 Feb 2026 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206264;
	bh=7A0RQWO7/WUrNQxPpTBU+9huawgN3Z9Qhkl/D4IOhLw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=o5r72cBpsiURnQVyLLs4B3KbHvIB5w1XP9NFLxdablThCyHEqDd7BJY+M9dYFR+SF
	 xId0trpoH0AQL/hnVkHaHOa3jSxc/+an4YA0WMIlLxuNKM0MroN9tSaM6wVb7nUN24
	 1sYn4r5v6jInkog4rdmlPej3N11R6vsZltSenZ7G0DA61Q1IxvyKlB2TARoQQx4D30
	 W2msDR1NTzlKqM9RaiDhEDu6Liis7R/9+JwNcWHQhiE8554vA57Mm5GYIHV5ls2rtq
	 Uvf/ETrnHjxQt6mDMYMWYd7yvhEOm6crysMWUz3jBRYmKf0qInnbqqaV8+XHN6Wnjw
	 IPctDuYmx2Xog==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 16:30:59 +0100
Message-Id: <DGPUOSG5I4GM.1N5AWMP5ZFY4M@kernel.org>
Subject: Re: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
Cc: "Tejun Heo" <tj@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Benno Lossin" <lossin@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-2-87de133f7849@google.com>
In-Reply-To: <20260227-create-workqueue-v3-2-87de133f7849@google.com>

On Fri Feb 27, 2026 at 3:53 PM CET, Alice Ryhl wrote:
> +    /// Set the maximum number of active cpus.
> +    ///
> +    /// If not set, a reasonable default value is used. The maximum valu=
e is `WQ_MAX_ACTIVE`.

Should we just mention the default value?

> +    #[inline]
> +    pub fn max_active(mut self, max_active: u32) -> Builder {
> +        self.max_active =3D i32::try_from(max_active).unwrap_or(i32::MAX=
);

The workqueue code prints a warning for max_active >  WQ_MAX_ACTIVE. Maybe =
use
debug_assert()?

It's also a bit unfortunate that alloc_ordered_workqueue() becomes
.max_active(1).

At the same time having a separate ordered() method competes with max_activ=
e().

Mybe a type state, i.e. Builder<Ordered> that doesn't have max_active()?

> +        self
> +    }
