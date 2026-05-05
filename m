Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D90336884;
	Tue,  5 May 2026 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979251; cv=none; b=DW7FzSoGCxoiDZeGq41CtpiCAgwFu7bfPB786wFBWsDS7F43U0NWB/bdqc3ZR9rNxwjkGGG7131SE63Tj0RtDYdtIAPo2f/TJ15cKDx1yMs6+rHy4YXaNcQBTplD/PkaPtLMRDFIp5uWO0snyGEW4kjJyi/KeUFHOXl2qskBSLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979251; c=relaxed/simple;
	bh=+mbJVJDz2rcaV2Rf1wlZKgi0mA8pPdu5ECdaV+S2Tgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q+8VmOKazDF9B0W6C7ZSHXc+Urmc6KYSHWagqHG9ChLB8seUZaYQ+6geevEWoAsolGcPRLCO9IF1YlDn84x23Y63v7OdionyELgGVhrRG7lpalsCn4ABeFZIu6WvG6xRzccVu5upnE/m9nT5OUq5jiDVe6y3D63hLBBEGLLpADU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWdzXtP6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWdzXtP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD805C2BCB4;
	Tue,  5 May 2026 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777979250;
	bh=+mbJVJDz2rcaV2Rf1wlZKgi0mA8pPdu5ECdaV+S2Tgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kWdzXtP6UXfm/8sG9MhvRxaCCy/suLmBTIPHXRThX0U1riRxAojXd7JUJz9x7BhnB
	 p60YXNWnMB+7HyqoN3CNCSCic9zs3Hva8jM5sDf8IlHpeNSvwn8zoBoTiDMZTU5MmU
	 spcFiOLQFVSLcIKbs7EPZtiZ+6XW98KWOQliMdXoY70jV+JdR0R9WJA0oCxSfWQqyk
	 KEC1oY8TAlU5yMwoY/Yxuo4JM6lMrsPec2uDBp9Sd95IYouRkcfKrTUt1s3sQSGHj9
	 vOe6hmYl8HgIxu6EZ4tRB7mg040RwCZkK7KmY4DWsotnK8VP9P04cJDZckMro9FrJH
	 72Bt3t72V0hzg==
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] drm/gpuvm: rust: add RUST_DRM_GPUVM option to Kconfig
Date: Tue,  5 May 2026 13:07:24 +0200
Message-ID: <20260505110724.3690888-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427-gpuvm-config-v1-1-8ece03771f8a@google.com>
References: <20260427-gpuvm-config-v1-1-8ece03771f8a@google.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 27 Apr 2026 10:54:51 +0000, Alice Ryhl wrote:
> [PATCH] drm/gpuvm: rust: add RUST_DRM_GPUVM option to Kconfig

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] drm/gpuvm: rust: add RUST_DRM_GPUVM option to Kconfig
      commit: 37f748ed0c19

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
