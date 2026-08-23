Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCB136728B
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Aug 2026 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787482271; cv=none; b=j9YGzrtlk8HJnoQzvWDQxweHQ7IZhRqty6GS+tV8cEBoy3s/ZnEcVdqm4TGHhZzW6eXh4+BTGXbsxtGSo3ZO1F5kLobu9YceHEyCtrobgIcMVKTEQ1L47C+fNgHqb3Ij/WlS8vlV6VYQXOxRKmVZeWTd11eriqXjbelDtfO7vZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787482271; c=relaxed/simple;
	bh=q7bomUAQ/XQ32auUDvhrFnbi9cK2cQuNw0Fa9ZUBqCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sgTczWcLT4Ktb+eDKsdVXUXqJ6BTNzZT+9eTQgNWhfzKdpjQ+OTnyHIzXw8ZJJVsgUHOuZURvuk6hvYGQ/wrl+Z1hgQ2Cs5bVgX3H1xZ7FdB+aF/LTiCDlNBPUTvaWCVKJUbCLlsz3rrVl+AM4XfFdQQR+d+VDC1+Ko442Lg/Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=G65WkyTc; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="G65WkyTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1787482258; x=1787741458;
	bh=S4R56nb5zLoC+axR43svDza4Pmat4wZRuXVPDD7kDu8=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=G65WkyTcDD71uaZQ3oaLgQkPie7dnUlM82q9l4qAZ+JsRtoyDpV++7GrUacEFgCHy
	 dr9+JR3LJTEd03Jim9uOEzTePWzXzqAmBss1oyBP5qzSCE9PND+FUU5sqP4V1IyNSD
	 TNZAdjozceigu9CvfkPdQh6FOOjbSscu5eNC7wT98UEpxUV1HkxvUuOhTc1hkX/iZO
	 m9O3PS5bHHOzEVCOH3C9hztlC0z3Q8BmV5qshBWTfO0gZBfi5tIUjzE4/Y1OjrpL1p
	 H/S21cZfblBYbGvFbwKPW8Fdp1/PrbZrF2p3ufqwYxeWSZJJuR4vCloEb+UbtmiMH7
	 35j24wLgFYJ0A==
X-Pm-Submission-Id: 4hSW6l4VTfz1DDX1
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH 0/2] drm/tyr: unplug the GPU when reset fails
Date: Sun, 23 Aug 2026 13:50:06 +0300
Message-ID: <20260823-tyr-gpu-unplug-b4-v1-0-e99c07d4c785@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260823-tyr-gpu-unplug-b4-711969ab856e
Content-Transfer-Encoding: 8bit

Unplug the DRM device when a scheduled GPU reset fails so that new DRM
hardware access is rejected after the GPU becomes unusable. This follows
the reset failure behavior implemented by Panthor.

This series applies on top of "drm/tyr: GPU reset infrastructure" [1] as
a follow up work and resolves its TODO to unplug the GPU when a reset
fails.

Link: https://lore.kernel.org/all/20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev [1]
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
Onur Özkan (2):
      drm/tyr: move reset work to platform driver data
      drm/tyr: unplug the GPU when reset fails

 drivers/gpu/drm/tyr/driver.rs | 174 ++++++++++++++++++++++--------------------
 drivers/gpu/drm/tyr/reset.rs  |  32 +++++---
 2 files changed, 112 insertions(+), 94 deletions(-)
---
base-commit: 53441a9cae3c4be552fa8aefa6e61b0f1bceb8a5
change-id: 20260823-tyr-gpu-unplug-b4-711969ab856e
prerequisite-message-id: <20260807165252.3849875-1-dakr@kernel.org>
prerequisite-patch-id: 4275f7d6e3cf96d61221d47f2398ebfb896db0c7
prerequisite-patch-id: f5e24f7b3717f2ab0445b5395c7f12b554861d78
prerequisite-patch-id: 0bf6ae4abcef7090d0e48921d6ec627a59dc6a7a
prerequisite-patch-id: 8dc24064e858240a6bb5411a261a987a7eae3fad
prerequisite-patch-id: eefbd4a72ed6da0083e20811882738cc3b05604f
prerequisite-patch-id: 7502236d334b13c547a8b47f0be9bf7171b5ca6b
prerequisite-message-id: <20260613065348.96750-1-work@onurozkan.dev>
prerequisite-patch-id: 9e1efee190d212ba1b01cd0acb5a4357e0b4da42
prerequisite-patch-id: 26aba035f4d1e212fa6ea7078095febefff5c5ba
prerequisite-patch-id: ffa25d5aadec4c04589af2bdd59a9c022f0fc9b0
prerequisite-patch-id: c2e05a4ac9d665d331952b291a622df6be673e41
prerequisite-patch-id: c14a4bd8a68b045356d61f7fa94690bd037ad08b
prerequisite-message-id: <20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev>
prerequisite-patch-id: 880860a119a24dde855e3b4bbeb9f9bcb7519357
prerequisite-patch-id: ec38b939da4016058b2db68835b74c8c5c979d26
prerequisite-patch-id: c7467ff05d88c9a9bd52630b9940f876114e695f

--  

