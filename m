Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B682701C4;
	Tue, 28 Apr 2026 23:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777417590; cv=none; b=sZwjXpiVrY8ALaYDo9I/m8SbpL/qmY1lH80KVMXaDBt9/n8yJ5ZIxULIgVHVlN5/+qVG7O3Us2IfGm8ZwNjce4vcBG6/+RHsZKSP/TcTGaPImi+bubhh+snlu2HKyXVxR57iZPXjNbFceSZyaKckApkf2g7eHVmFljrAJOBgWiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777417590; c=relaxed/simple;
	bh=5ZDCKx2Smr8uuyi/TnAPG1ANCPLU4ttv3jnd8oYhov4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i//pT/TS7eitI9zyw+FpFoZmZv03KC7q7PJdO4A+wy8bcllUVXz/9a4NgbnAZ/rOCyY2quetbSR4isQBzblAczTk8yA4X2Hvz1o+pH/M0GUGDIx7G9YULHyQIH+SM24xtKgYkvvzVzlVA1UA4J0uUU1TSCMVFPaErExPiDl8OH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxybgngI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxybgngI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCF4C2BCB3;
	Tue, 28 Apr 2026 23:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777417589;
	bh=5ZDCKx2Smr8uuyi/TnAPG1ANCPLU4ttv3jnd8oYhov4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GxybgngIDjdUlhgfGbZzSTqR5nm01ppSoeRpLyqhRmXdIyHEUS/vv47ddmJdutxzc
	 XXBLFScpwV+JQZUzasKlipmQX7Wv9/qJ3OnYFhK/i8pxjLNUY5JPOIuQv0PoKmMSPG
	 lmUQERcjwZ0DpH1wYjnaR2EqXBf/H/Sz5ktKMstwfSWBlyhdycgflHBdeFZGWdCy+g
	 lK2sTpsVV8tYVKPz4qPvOS2otjF/2xaGu1+qXZsTx8aaxNwX2PPwppPLJO+o8tW+H8
	 PORvwkYLFMx3v+tJnE+n+Wf7+tL9kIvddP+gxhKE12ABN0oUW3RbisMhDunkCpa0cn
	 SBiGsbnq4OAaw==
From: Danilo Krummrich <dakr@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v6 0/2] rust, nova-core: add SizeConstants trait for SZ_* constants
Date: Wed, 29 Apr 2026 01:06:16 +0200
Message-ID: <20260428230616.2801185-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260411024118.471294-1-jhubbard@nvidia.com>
References: <20260411024118.471294-1-jhubbard@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 10 Apr 2026 19:41:16 -0700, John Hubbard wrote:
> [PATCH v6 0/2] rust, nova-core: add SizeConstants trait for SZ_* constants

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/2] gpu: nova-core: use SizeConstants trait for u64 size constants
      commit: 98e508e5b016

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
