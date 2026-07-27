Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9CC37F312;
	Mon, 27 Jul 2026 20:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184748; cv=none; b=eehP1QSWAq6/8IZMNmM32bd2KprIiw1qE+dX+u8+iE8ceBvnZF/tyn7al4geufNgvHDpAjS/19oJx7Ij37BTfzG/tQD3XR/Nu26GO9nynA0rXJsIvn4V66Kc1Kwbn9TKSjQOm2pAfnoqQsuFe5hoesxVCQUO0oH6MJgONTf/Rfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184748; c=relaxed/simple;
	bh=1jU3SSVnZksJo+htVGPcounRwgbu7IpnTbla9akcccg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ces1sg1FY1P8UEbaZsnVtWcCIIEQDEiTQve5pitKGuWfFjP0rCZPcnIHK8cNUa59YGIOtspfrdyMkoQYe0z18AQCbK2dd1ZYE8OrbSMbcZ/H59AfXv50E5X5aOHC7uGBu8BnTwkZb4zh6xGmjax4qjkbKT6ljmkxCeAZUkoscz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzE3lm/V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzE3lm/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76CA1F000E9;
	Mon, 27 Jul 2026 20:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785184746;
	bh=9MBLqZcQejQgFZk0sO359niPoruaJF9yAp0lSaSnXf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HzE3lm/V+6ory0CRn1KzyV2GM4JbELSV9fzYu3ehA+veSF2TT5gyquOebYT9F6bKB
	 5NlVnU5U6TI6x1PEMV0JrOG623jsMvVPNEFsskUV1NAWjYIybdDoo2z/kKFYLfDpHP
	 9LAtGiST27MVHRJksHcIZba88jk2+69Ro1/WubVH5V6QB0jLGgCPd8RBib2zB28MYf
	 zCv/l7KeeFslW3I3jOUuEeudZo+7rX8W9jb4BT37z61Y8zxrvXYfgA52/SnRy3EUa9
	 3ASss9fEtrmo4rYDY5L2SI+3s4D64Tto0BNJZwJQDIQl/gge9zgb9DCsnhZ+mUWHzl
	 clvxu1soBWqxw==
From: Danilo Krummrich <dakr@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] rust: pin-init: merge `__init` and `__pinned_init`
Date: Mon, 27 Jul 2026 22:38:58 +0200
Message-ID: <20260727203858.2275755-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722-merge-init-v1-0-d4594de76538@garyguo.net>
References: <20260722-merge-init-v1-0-d4594de76538@garyguo.net>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 22 Jul 2026 19:50:14 +0100, Gary Guo wrote:
> [PATCH 0/4] rust: pin-init: merge `__init` and `__pinned_init`

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[2/4] rust: devres: use `cast_pin_init` instead of manual reimplementation
      commit: a1f1b3b478b4

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
