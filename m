Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC89212550
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777196859; cv=none; b=cLgrS1beUA1psf0bJp6OoLDZ9YDM1PxR5dGs72Vxz62GumZXbTyYwwEHeiKJbtrbQFJbQc7vgsOyAmdcd+zk1QwtcDN4SSeUxGyTiK8klO3V8uZTnLjBzUhO892gH66HSOgPqxFVUTjgKYtgM8Y6gBAxmadkgPnBkWQIirVNshM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777196859; c=relaxed/simple;
	bh=PIQm8lQh7A038Yes1RxiS/8VDfG8cL9u8pjRL8DVj10=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=LdwhQgHmsctyBS+tCrxuyG1S3IHPFtrZWxKGlpBec4S+3iDTv4Yf0G6qh0yWmkSNxnkAHVXrNK/FRdSt4l/wr1qzPVSI8RajaSSAJz4B6kj08uO7P/tONjqE4AtXSvNMDBUJBhykSGgFrmxCkjlTL3y39RnpICmXDiHSycsqneE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dT/cVjYe; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT/cVjYe"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso6272376a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 02:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777196857; x=1777801657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vAS4ETnzVa+zgF2nxAAi1cetwDrRrqxC6W6wHfZIEQk=;
        b=dT/cVjYehFQDze4WeQtXELbgcITZBPr93QGvrTf59dx3jNQOfD6/hNsbrqPLNr4u1n
         UBN9D8/wbU/uzPI4oaXEJ2FHc3hS/5IGwxxm9iyTxr0Q0wfOAjDEVHmvNKE0vqOuppFd
         UOxHV3hQa/CEBEwFNgPO5KS5G0LYswlsKUXEVoRyas2AcOR9GqJ6Ym06H4zwlyCH2MGu
         o1CsW2xs+qL7hJ2Xm2N84qBID/LeBqgA659hnAqZxXerYCtcNPgtQs7FUycMToQlvMvX
         06jLKrmQmjAp2wqV9P88GLwPCMb8Ju3BtIHVWhkDSXxKTv4akbYPaB0eP/ID2d34lbZd
         RoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777196857; x=1777801657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAS4ETnzVa+zgF2nxAAi1cetwDrRrqxC6W6wHfZIEQk=;
        b=gm3cOhARMydP9gsono5JQeDfoDjtj0rQ6FT1fuFn66N6eC5N3rQBxvp58KARntp7Nw
         +KcM4FsPHqakXhb3ixkTFeTML90xtIjHU9dJ34IhkbfzUwhtuoDmZb8LCUbCVsoIfBv/
         xFy3cY/ARi3KBdQExmfQUScKb9IirzNBtlHO2lR7G2J3/QhFU77U8+OfKB4KvJ/BEYdx
         nj2pahUYruE/xId9vwt3bHs/6vsrLsAMNMjNJU0PFL8K/5NCw8a1cO3+wZFX4jRLjnfv
         bfQ+Lu3BUhkRsV3Y4Dt5PcgfcGYERanPk0nevF+e/0yNqjuENWovWEICYtLzRf9a8/J5
         GifA==
X-Forwarded-Encrypted: i=1; AFNElJ93KWIP094Lmmbk9kwy7pi02qW6YnSRnE0Dk/nEZq++QBA2PH0UYf9N702I/3oyVYk/8jHGP2jePJLSisjXHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjfRr5pTc39igI+TLOu4zkvJKiR+V+9kEzqyFirmg5d7fnF4bK
	GgjOTQZPq05wTJsDl5T99gLkieGabp3mzcXy8ppocikj4SdSCDGol+OB
X-Gm-Gg: AeBDiesxYYgTggX3mkfHG3tMK3ITeYjnfdDE4YHcazf3xP+cql2xyiGSgVUklqQ8yMJ
	jqQlgPCkwfXXrrGmZYqq34w5DGHzR8tAyvnmNeTo7dW6N+JVmwwiUj79oXjr5OTxGWWpjXm8Hr/
	yBU/KM61Wa6PxaS4yNK6blZ+My1rgpT/7FPhydzRbgIpzHr2nBk3PN57nNSDkg2GEQQDlsE7eUM
	LHmrt3qqp1fGooDxfA+qD4Ciux+aaZrZCYA9WhgfdFFCYzVbHK6Koqg96C+gOLfr1z+jZYuJI1V
	jqZn7/BNz6SjQp4W+nlKQRft+Lt+CRotig+ClusYNHSSsLjgc+O/fwhEXlT52mzc9SEsY65r8qG
	phsMXiQMeNfvHwRaaLdXg4NYCmF3FqPWOI+DVG1kQIVf5PJYth7n1Ls2H6HK0Pnqek3xDcBVoEr
	69aNWE1ePR+43R8jyhzSzHpRATG1O1tJDso9W4RXAAA2QZ2fQ2WEwcaTIdD0Sypz5V70lodUlMt
	i/5Lomgkj+NbDo=
X-Received: by 2002:a17:90b:2243:b0:35f:bf4b:c396 with SMTP id 98e67ed59e1d1-361403ca5femr37242198a91.1.1777196857110;
        Sun, 26 Apr 2026 02:47:37 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614371a7c8sm28450073a91.5.2026.04.26.02.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:47:36 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	lina+kernel@asahilina.net,
	lyude@redhat.com,
	j@jananu.net,
	mkchauras@gmail.com,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/1] Rust DRM build fix
Date: Sun, 26 Apr 2026 15:17:24 +0530
Message-ID: <20260426094725.2188668-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rust drm gem shmem doesn't builds due to an import error of ARef from
types instead of sync.

Changelog:

V1 -> V2:
- Removed the 2nd patch as it was by design
- Removed unnecessary braces around the Opaque mod
- Minor change in commit message 
V1: https://lore.kernel.org/all/20260426082234.2026908-1-mkchauras@gmail.com/

Mukesh Kumar Chaurasiya (IBM) (1):
  rust/drm: import ARef from sync crate

 rust/kernel/drm/gem/shmem.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.53.0

