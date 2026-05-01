Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2882221FD4;
	Fri,  1 May 2026 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777646761; cv=none; b=axH5OrtaSqFMrLiVLhrqYLBl7X30yr7eycSgMFXS8odiwa+V9Hzjxgfngl9HD2cfG36r9MfBcD90A7FQcqiASzpWb80V6sUONRT/dTn+us726zotCCbM8D4FiQZ3P0vD9FCvmM5FQwx83Ds7l/5ZzAftY9eA7BJLdHnjr09EGUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777646761; c=relaxed/simple;
	bh=lMo6vIJzORAxdZpMWmFhIapMK4zC43Mfyu/lKG6p3kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M1/a5N6gQp7J8+xbehWgMR/KIOlC7BVCCihFEkw55YjjaD9LVfJuTpiMOvrZW2dhOmah4TgX2LqxmpI02ZMiOUn0x4inr0yy7VwCnLwWGCptZYjDO73dxRWs/1DjH/OfE8NEB+RU7w0yxHOm3MCO5dmdHujPcnJexFOKbJIGW+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kL0E5rIQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kL0E5rIQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7B7C2BCB4;
	Fri,  1 May 2026 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777646761;
	bh=lMo6vIJzORAxdZpMWmFhIapMK4zC43Mfyu/lKG6p3kY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kL0E5rIQ4c6TO86H9i/B4XTuqcLsoMsdGJLDxfYgbzii6T1waUjGj21vwKKd8y8sA
	 ZnG2+m8oRn/Ql+rHE0x2eSbNboerASNN2XAggoHDEapGaZvSG5oxLRi0uu4kV6hvFq
	 8KKWCp8E8hNzGEZtJ4pSlxNIAKfNpfHGDhIzbOpyqzMkLrwfX2+PYQgGp0oixuf0Cf
	 swNspcndZvZshlE26bP0TrXEPgZhHmXZ235dcO+jJjxBU2jMGxxBxFpJYg6yx7wSJL
	 WshkGgNWlxx2dIhPhDqkJrcDiLd5OJfNb6ho6yNqTt8hOZXCb3npRhsd7UEy2CP7nY
	 nswo59aV02d/g==
From: Danilo Krummrich <dakr@kernel.org>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: drm: gem: clean up GEM state in init failure case
Date: Fri,  1 May 2026 16:45:30 +0200
Message-ID: <20260501144530.4193621-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260423-fix-gem-1-v1-1-e12e35f7bba9@nvidia.com>
References: <20260423-fix-gem-1-v1-1-e12e35f7bba9@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 23 Apr 2026 21:36:52 +0900, Eliot Courtney wrote:
> [PATCH] rust: drm: gem: clean up GEM state in init failure case

Applied, thanks!

  Branch: drm-rust-fixes
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] rust: drm: gem: clean up GEM state in init failure case
      commit: 2e42a17b8f6b

      [ Move safety comment closer to unsafe block to avoid a clippy warning.
        - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
