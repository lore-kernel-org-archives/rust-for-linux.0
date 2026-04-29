Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021EC372ED6;
	Wed, 29 Apr 2026 21:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777499416; cv=none; b=UesqxhJQ67SkwDqOg8qYCVHqX45CLTcQpDzUgBfNLGcO/g0CKED5XcArvVeX3GmPfla0IhcEzZnvweWyt/3j2TTiFmux8+ypZj1xSodDyjlYmVXgEoUB6qqdMiV0BPnBVbZUWX2g+5XAhFRsb4SVmuzpzp/mdAqCpUEKL3AocSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777499416; c=relaxed/simple;
	bh=ODlGdXyDhiXyEVfT2TgZg3gVDBJjq2N48Ef268SDmWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fJZpuXxvlIaKUt4qK92/V69+YkY2IO92ORjG4vIprMEsOUfLvXjJBOhz2jyIE0kcf280xTkCCyGkvbQQ7/qMqGT4cQxXgF8bs4EyPtemBWbKtf6bz8p/GT7pgD/GskcPIWpAWmsHnGhxsLSMmh0GKNPJn6SLMwwuGbKzQA67ZHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3YaWcxd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3YaWcxd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD099C19425;
	Wed, 29 Apr 2026 21:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777499415;
	bh=ODlGdXyDhiXyEVfT2TgZg3gVDBJjq2N48Ef268SDmWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q3YaWcxdyYTi0RIwOgWlnM0awzjG/bALbM1i0CWv8QthY1MbwnIjAROiJ7HzdYiW0
	 DEeV6FUDtiK1V6aXS69UEoTb5jBSOWxqWb40X56xrU2OjV8SBvxbHNwleUy9NYEWSp
	 R2cKbYoit/vhnXDSDeB/uJL9DOu3Lq3Pv5rZoRUectFuuMH/1bonlYybCwVtWxyh99
	 +e7CQ2M3vq6/qDqtCPG6A/BeSS2VM/kUZSFRaokrXCMlZTOWWQQv1RQhzrpdGrO/lt
	 T1Tamf6MaAEtXMc8Gk7fX3BssDpQl2R///qMm31h4Tv/exwT+9afa+j/qt0KMY9SlK
	 Y7qmMDyQGGsfg==
From: Danilo Krummrich <dakr@kernel.org>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpu: nova: require little endian
Date: Wed, 29 Apr 2026 23:50:10 +0200
Message-ID: <20260429215010.3181390-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260407-fix-kconfig-v2-1-6b4fb06c690c@nvidia.com>
References: <20260407-fix-kconfig-v2-1-6b4fb06c690c@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 07 Apr 2026 12:59:50 +0900, Eliot Courtney wrote:
> [PATCH v2] gpu: nova: require little endian

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] gpu: nova: require little endian
      commit: d39e22cf87b6

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
