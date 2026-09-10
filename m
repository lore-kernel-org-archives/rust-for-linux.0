Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB854A64F2;
	Thu, 10 Sep 2026 13:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047392; cv=none; b=FVM0FPw1XZH90RQXQBePsZOyvS9rVC+/hFVh61b7Gl66TMcxxIMw/7Mnv60SRtIIv/vDvEfk5dzF+XU1C0XYyTssQCMUQXo5etpsZh5O+0r5oRqEtfnzCb22kHXfemCIQ+rHqVS5CekAW8h4vFuXkr7wAdwGHORKXIlUD1PO/WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047392; c=relaxed/simple;
	bh=+1l1yrgxeE1E2VUNtjihfmrfNpRRqWva50b5k+Xwukk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9rbjFGh6lSySF9jfkZDGYef0hUYCXzutAyOfowac0EBlEgj2AumCn6jt5hJGeALanhrMiFhIWm6yweBOAtYohL9LKNKww54b5baKXhpPbL4+IfiwYt8ZrzX7+ghtGGbZ0HF9N8pvAUqwEsEnOoMSnW6t4IC3bmf5FNtqYa/pTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1gbMyQI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1gbMyQI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0511F00893;
	Thu, 10 Sep 2026 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047390;
	bh=1FasGscCL7I3HUlFNc/jhfPhcO3uqS8otOMSF6iJ0cQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J1gbMyQIqy7WHnPONiqJhdXWzakR8VWh10XD2TY3C6aINKudQJvsIuN9dBYq8ikoI
	 OOX3OFnOoriZXyD+imhQ5t3+SNrgz5SwXRgyJuRzDLyDHk4WhK1yfDIVpWH+X8Vgrb
	 2xcTH7wn5hUMJ9T7Let1scnyI/FOFMEj6qxXYU/A5aTKUHIJfVGRCF6BphFEboAadN
	 Rp9bCg5TOthzErUosaj/drsSKj2zalqlBRz7pvb/GC0pz2l6SkjACKrHS9nSJ69o9v
	 3BKceOeRU/f5pEdJxY8reA2ZHVqsrmkqO0nkmnCRWrbAwSF97JXPmVzgq3t5Imr+7r
	 Rq0aGAiDVr0dQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Edwin Peer <epeer@nvidia.com>
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	phasta@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	jhubbard@nvidia.com,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-rust-next] rust: dma_fence: gate abstractions on CONFIG_DMA_SHARED_BUFFER
Date: Thu, 10 Sep 2026 15:36:23 +0200
Message-ID: <20260910133623.344658-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909202327.33285-1-epeer@nvidia.com>
References: <20260909202327.33285-1-epeer@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed,  9 Sep 2026 13:23:27 -0700, Edwin Peer wrote:
> [PATCH drm-rust-next] rust: dma_fence: gate abstractions on CONFIG_DMA_SHARED_BUFFER

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] rust: dma_fence: gate abstractions on CONFIG_DMA_SHARED_BUFFER
      commit: 73e5616f3d19

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
