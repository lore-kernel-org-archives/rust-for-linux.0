Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731855;
	b=PHQgL+93Mn4CET8ADoBbM6HxxKQlWTsU4ThiS6ZrMREO3KhwsAD9TqvW6btHbUedUJoD
	 wODqMbvLgHdfWrgRnAizwmPdn+uT2H5heXUFm8/vv0NA4Gn7XNj9VYw6vgR+hgdXCtndh
	 HrP/KWlbhwc1gbtZj4hwrIkJ+uUea7IWT/IOUAlAauH/30oL5S8mjkfnftIoIY5mKBZaH
	 rNyW+EAvDRhE4DpckM6XXki1WJ3bpARtEDWvDSJwDlHT/OfmDHG5JMlw+28akEzpnu1Xh
	 lo2gHjtscqrIwatPa/dMRVaydL90u+vsghKOFhTDWQSev4jlQqZonn4G7RwaTPNIuIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731855;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zKh8bGgPjNUn6eijVJOarVjoGuOWzL0hg0ZPVgpp3Yk=;
	b=qcbKMF1yRH6xAHew9aVrS/i0Gy/KgLXnHUxm4yKN+utF1Q1UxTsVULPfFMl3Fng6ld0T
	 noWckot0dKqN0E0BgFujmypQG011SwqCdaKXnwcTMzQ7G6YjDuoix/5ILGdAS+wG+N4IS
	 Ps32r5mg/eShDFm4KuqezGraHn7UGV1aGfCKkbCPS31pyESoA2WV8vsIZX8ZiV2aMLfkD
	 UC0QiupdsWGrOjxEIWow2eKz1WZP4JF7Y/Pt9l3fXlwghOMYlJoYs90tgKQ/VDl6EWJBA
	 tlajIWZ6izXG6nQXzor3qEv5Tr6oL/TpOrUh5oUj8R203lmkxliBe4OqukDBafoI7KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IMpjP3mo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7796606A31E;
	Thu, 26 Nov 2026 22:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IMpjP3mo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E986E1F00897;
	Thu, 26 Nov 2026 22:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795731854;
	bh=zKh8bGgPjNUn6eijVJOarVjoGuOWzL0hg0ZPVgpp3Yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IMpjP3moMBy8eR/4+FgXApC4ZJuospR3X4WEgkuC33APmBD19LHU/WsOjDLq3MK9s
	 s+FiX00MR0fCXb7fSED/v0NX+M3HI1jU57GH8C1iNcqqZtaMerhF2GAUpxVyhS//Vr
	 yIyGMQIj2Vjzrf4myvcIQf9p4fZMpcYMYCkvQcgIKtFqnmttWNtmxv3t5xSyEPqSvJ
	 iTRWaweXGvxFd6kSLRgDzj3xfQ/cXXv+BKzmBuaaG5KbbSxGcSxrCymHR8AT2mvmZx
	 jbii3FQNO6w3MqrmwrUtjkvl3+DowNkDpDgSHYqwZUn3sVkfH4D4rIyUB5CyE21+z7
	 pWmzbyocd2g7g==
From: Danilo Krummrich <dakr@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: drm: gem: shmem: Drop unused unsafe for vm_ops assignment
Date: Thu, 26 Nov 2026 23:24:08 +0100
Message-ID: <20261126222409.3819227-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125-rust-drm-gem-shmem-unused-unsafe-v1-1-d6c5cb0b391f@jannau.net>
References: <20261125-rust-drm-gem-shmem-unused-unsafe-v1-1-d6c5cb0b391f@jannau.net>
X-Patch-Reply: applied
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 25 Nov 2026 13:24:28 +0100, Janne Grunau wrote:
> [PATCH] rust: drm: gem: shmem: Drop unused unsafe for vm_ops assignment

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] rust: drm: gem: shmem: Drop unused unsafe for vm_ops assignment
      commit: 335792313aa3

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
