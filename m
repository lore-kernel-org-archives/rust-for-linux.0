Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED00433D6EE;
	Tue,  5 May 2026 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976040; cv=none; b=slAm4do5+GT7clBSHWNLmVJ/3+/firBWPtLtdyYSf7kFzlH6vNJO6leXnAE0N1eWuM7E0BtV+llIoPMGkyTDx3v75Aum4fnbL00Mh5m2fQO9X94wcZGKzvg01pLhmTO5TEwDjqbVmYlidaEv35kr8xLuvGg3S7wQKfvI5JSs3W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976040; c=relaxed/simple;
	bh=4+5LaA19bF6n+wKsL6C3LO/pYMD+m4nVLA1CA1l9jeA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nvCnWLAO7OTGlqcK79fdrlUVmZj2rJdofX3cw5Hmm5bsut3cw98u9uPnhAG8cDzOpRFlFkKwty/OQuKrHyi7j/Zk/xEHZrgCj8JeJ3gCqIl4gpFG6SaWeIkXRaAASJys29P+bSufaMn5CaC6X7sqKbs0xeL26q9xJuRMUfG8FFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UKoldRSF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UKoldRSF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777976037;
	bh=4+5LaA19bF6n+wKsL6C3LO/pYMD+m4nVLA1CA1l9jeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UKoldRSFdvvlZNwY0033CxwsUCPDMDORXECiyGTvEE8agFaszVyO9XVtcMahfpUYe
	 9LSDp9VOyIOmyvRpt/jrzc4fT5I+AMQd9awRY0kOTtnUErvqHLsfh5Mk9PwbF4qZ+O
	 yPxYU1DS3MsPC9KIZlF3efn9HDY3nWFCgDe1rBjDb+RaWc+CqC3h7K0lanUnrDIbKJ
	 omYM026D+RhBoKBr9N7Q+AgBk6rFuqdTDVoTwE3HEqIfI3hLwIlGZOK7FCyX6kPgZ7
	 OTLdbLlhbwMd9h3y2m3C/0jJ+7XViSf+oL/hIXSJr0lFAajVv03yuTVT5O4E0nbL59
	 qPFAENw7DRYtw==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64AC117E0698;
	Tue,  5 May 2026 12:13:56 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: gary@garyguo.net
Cc: a.hindborg@kernel.org,
	airlied@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	boris.brezillon@collabora.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	nouveau@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	simona@ffwll.ch,
	tmgross@umich.edu
Subject: Re: [PATCH 1/2] rust: drm: add support for driver features
Date: Tue,  5 May 2026 12:13:45 +0200
Message-Id: <20260505101345.112368-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <DFUG2U4PVVTN.1DVPXGJK735F8@garyguo.net>
References: <DFUG2U4PVVTN.1DVPXGJK735F8@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Gary,

I just submitted a v2 [1] with DRIVER_RENDER modeled as a single
constant bool flag, as using a trait for this specific feature seemed
unnecessary.

This doesn't prevent us from modeling other features such as
FEAT_MODESET differently later, possibly with a trait and a constant
type that can only be constructed when the relevant trait is
implemented.

One thing probably worth noting about your previous suggestion, in case
it's useful for future feature implementations:

> On 21 Jan 2026, at 14:31, Gary Guo <gary@garyguo.net> wrote:
> 
> When building, you can use `TypeId` to check if it's actually implemented, and
> set bits in the feature flags automatically.
> 

Taking FEAT_MODESET as example, I believe this would translate to:

const fn compute_features() -> u32 {
    let mut features = drm::driver::FEAT_GEM;

    if TypeId::of::<T::Modeset>() != TypeId::of::<drm::driver::NoFeature>() {
        features |= drm::driver::FEAT_MODESET;
    }

    features
}

However, this results in a compiler error as PartialEq is not yet
const-stable:

error[E0658]: cannot call conditionally-const operator in constant functions
    --> rust/kernel/drm/device.rs:87:12
     |
  87 |         if TypeId::of::<T::Render>() != TypeId::of::<drm::driver::NoFeature>() {
     |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     |
     = note: calls in constant functions are limited to constant functions, tuple structs and tuple variants
     = note: see issue #143874 <https://github.com/rust-lang/rust/issues/143874> for more information
     = help: add `#![feature(const_trait_impl)]` to the crate attributes to enable
     = note: this compiler was built on 2026-03-25; consider upgrading it if it is out of date

  error: `PartialEq` is not yet stable as a const trait
    --> rust/kernel/drm/device.rs:87:12
     |
  87 |         if TypeId::of::<T::Render>() != TypeId::of::<drm::driver::NoFeature>() {
     |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     |
  help: add `#![feature(const_cmp)]` to the crate attributes to enable
    --> rust/kernel/lib.rs:68:1
     |
  68 + #![feature(const_cmp)]
     |

  error: aborting due to 2 previous errors

As TypeId comparison is currently unstable, I think a different approach
would be needed if this pattern is adopted for other features.

Best,

Laura

[1] v2: https://lore.kernel.org/all/20260505092304.108262-1-laura.nao@collabora.com/
