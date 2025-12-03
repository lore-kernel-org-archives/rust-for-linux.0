Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511D022D7B5;
	Wed,  3 Dec 2025 22:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800869; cv=none; b=Qq4t66e+J94QnYeBPTNTFvqI2dNZnUUbXqvvzus4Fy0CJt/fKrtm5k3+0XFCRMaZYsk7BAmyU8YgU3XAuiNjzuaFlnElvCipVPaNl4DxynOa1tSt+8of565lj2EqbgQDVAVgHqHHy7pDQ0qRay3amo75YGQRH1WO8Q3fZEmSpmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800869; c=relaxed/simple;
	bh=jHwuZu9Nn91bTZGEVqG/FVMZKxyXY1lK6uuLYPyta4M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iXhNnNtpUG8YPnGOj7JhttL83hTVhJ8bnXxCwg8tSZiRwIittvUzKFaAYg0XHHPeVRqY3n5OIZ5DnEv+I3sIy/Sz8M/sJAMSVcGnUjOIlMxYOnlvnTgwH+IGFu0g/1cmwthHgFG/OVB8RV8PBHrbIYQgxHFBE7jU0j0eFOaQ4Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moOlMAyM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moOlMAyM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DC6C4CEFB;
	Wed,  3 Dec 2025 22:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764800869;
	bh=jHwuZu9Nn91bTZGEVqG/FVMZKxyXY1lK6uuLYPyta4M=;
	h=From:Subject:Date:To:Cc:From;
	b=moOlMAyMDINAk58Xv1JnBQw6qHGDCu4queugGy9eiR7BjjuWAsVYzPhBSwauaTPOR
	 +YHpUsYTgXDV+9dT1kCHeZheusWwiIo2ojZFWNNhCehP256VZlHecqJKwnl+VkzXYN
	 8QLmhs3B8Z0vviL3burbf0ZeM24R1UpdT3TiK8yhgacO1a+K+L3mjSGudgwYOGhrR4
	 wDHCw6mHC8+0rTdm+3Y2KW/BitxNJw9wiO69qog4KoHwsFPZh+FhdyOIl7yxgfDW6X
	 lHX3yA/LrZJ8HTgb7KaTQHdaIDqS1H+45idY5/b9Vk9UN+aeFCZ3Rm6FTXuQ8tj9pf
	 SeCx78ccIjNgg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH 00/10] rust: xarray: add entry API with preloading
Date: Wed, 03 Dec 2025 23:26:30 +0100
Message-Id: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABa5MGkC/x3MPQqAMAxA4auUzAZi/QOvIg7FRs1SJRWpFO9uc
 fyG9zJEVuEIo8mgfEuUIxTUlYFld2FjFF8MlmxXW2owOVX3IIdLH4wcPBLZhlYa2pZ7KN2pvEr
 6n9P8vh9EhUxFYwAAAA==
X-Change-ID: 20251203-xarray-entry-send-00230f0744e6
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2226; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=jHwuZu9Nn91bTZGEVqG/FVMZKxyXY1lK6uuLYPyta4M=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpMLkc+qrI57Ae3a2LoDwr5iMznsVx7NOop/qZm
 Jzc7xi8nq6JAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaTC5HAAKCRDhuBo+eShj
 d8IwD/9G95P9HHxdsNA5MhNNd5tPZd4jR3HUX/0qEcEIXHcDImuYB5D+VGgzl2+0c9wHb923O0u
 wOsPh5J2KBOKZE/5WT7FpooMN6RerwlaeHINK6CfyHY+VKNXU/+viX2hWnHc6q47IVBduDwcd5C
 Mf1x4Eb33T3Mbyi9cGnVUZbNtbUjKb7siHLdoOT/gQBidrfGq4ZS5CO/JwvGNx+45gv7mL7r775
 2EdpdZTvvHVjJ6fvY+hfruNNduvLkgsGAhQ7oo76sVvxQ5+Uz+Nxnr668M8Ui6h/mNuhaI4j467
 bwUF4ijU6CyJWAAwoQfbRMUgeQiQ1IIInOgk6OFbhOSnQBKtUfnQGepOpXbP1lpwNLnU/1cYykp
 XFS3tEOocxcjlFEDbyJdq0d6fb7GOR4KHCyxJGcsHp7FE86ZedN4EZaCdVpWlu4DUJ3ClkUfWED
 f1GVfRH/ftUEEay/vjttTtq820+yR6Cb5H+oNJjLYUHjtlqrgyD8A5kgJKEez8aee1hFLh/s4b1
 wrDtB6heq+A+JMtlmBW/lKBJLTNWbKjBpEJwPwl0JYEIat0BEBf0jef9+LktuEVxpMYc8dxfJ5i
 M+ljcUVctWH/J+HWcHycjkKHJJ/c1qJ2bbthJazc29yTOENyXakeaQq8TLKSkmBM3dQ4Fa0q2YH
 2abRd+a3HfxJ7Zg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This patch series is a mashup of cleanups, bugfixes and feature additions for
the Rust XArray abstractions.

 - Patch 1 starts by fixing minor formatting issues and bringing use
   statements up to date with the new coding guidelines.

 - Patch 2-3 add some minor convenience functionality.

 - Patch 4 adds an abstraction for the C `xa_state` structure. This is a
   prerequisite for all the subsequent patches.

 - Patch 5 fixes a double lock error in `xarray::Guard::load`.

 - Patch 6 is a simplifying refactor of `xarray::Guard::load`.

 - Patch 7 adds two new methods for finding items with keys that are larger
   than a given integer.

 - Patch 8-9 add the new entry API with preloading.

 - Patch 10 fixes a lockdep bug caused by reusing the same static key.

I am sorry for the mashup, but I think these changes are easier to handle
in a single series rather than individually.

The feature additions in this series are dependencies for the rust null
block driver, most of which is still downstream.

Best regards,
Andreas

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Andreas Hindborg (10):
      rust: xarray: minor formatting fixes
      rust: xarray: add debug format for `StoreError`
      rust: xarray: add `contains_index` method
      rust: xarray: add `XArrayState`
      rust: xarray: use `xas_load` instead of `xa_load` in `Guard::load`
      rust: xarray: simplify `Guard::load`
      rust: xarray: add `find_next` and `find_next_mut`
      rust: xarray: add entry API
      rust: xarray: add preload API
      rust: xarray: fix false positive lockdep warnings

 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   4 +
 rust/helpers/xarray.c           |  22 ++-
 rust/kernel/xarray.rs           | 408 ++++++++++++++++++++++++++++++++++++---
 rust/kernel/xarray/entry.rs     | 415 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/xarray/preload.rs   | 217 +++++++++++++++++++++
 6 files changed, 1034 insertions(+), 33 deletions(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251203-xarray-entry-send-00230f0744e6

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


