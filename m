Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874666;
	b=1uRgL1wleClRFZMdvbuWJ7BJxGohtqNm0xKNckNcqOiHwocDOgn85I6vUPpht9riz/ZX
	 rJDmfdtqY7ahZk40+64RPOvoucQ76Vsxr6VZL8FrScHBoYtD7BjBo/t4dt387sfEZAhYo
	 DZFDSAtaiRMyeFxhidAbFTUuwCjPJN+OUyEpPkkvA9QYSUlUGwUaNq9ML0sZy4x6wsyQW
	 zhbtwKtsGY5VJ7UUqCENG5h5My3gNb7NhZWEmvEV3psHSYfu6G/eVskraP7dKn1qOhuBz
	 aXLn+U+f9lj4qo2syQTIcEBNb1/tBS1Oo3y5w5MpWhYo+eSYBK4I1Rj6hvo9fkKg8QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874666;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=216IiolCt20hkF/zrFebqwSFOmIcrARqNeJxVCnUpcQ=;
	b=jPGnuLqRBvT/GTFxGzF66P1+t43//VQezPYgR1I5Fx77Bky7F6WwVL3QiUn7fMDIVM8Q
	 md/JIohCCyHTQltWdwce4dfV4swBFlX1V5klErUA/RkH5/kRU2l5pjPuzwHvBTF+TIYH5
	 2UHVJd4ndfU6hp0SzTOzF+TW69u2QnGgrLj/k42zRJ3hytYAhjboT37QM8uXuM/KuyZlI
	 gV3IqQcDawYmaaIGaJYHSD66varW32pIXf3CEG0pAwr8M1qyafYc6nZg24mLUrAVOzXZi
	 6VkWd+mN2S5kUe7Vk+Ffq/y1fMvRB9E18WW4W0ji1KKgAGEmNmAMTuYOMcAvXi0zlFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MChgI2Cb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77DD606A894;
	Tue, 17 Nov 2026 00:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MChgI2Cb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9F81F000C5;
	Tue, 17 Nov 2026 00:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794874665;
	bh=216IiolCt20hkF/zrFebqwSFOmIcrARqNeJxVCnUpcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MChgI2Cb33KfZF3GVRy37yjBadBdUu3VBYQV5BvmC9gEBJi5iy2JJfZxcdEmlDwOq
	 ichTqM1QQ7fSfbCiuScx1cPn+Yggk+NUuGCPx4hX1ZXK5kVbxdIrI3koctnlxqY7lm
	 zQh1iUsBpP3svY8vWnR4X/cL/Js01xWEhhbT845xM5qWVRQUyq8lkoCUdNfmKx239x
	 CjiLrJyOqiyzzNaNp4rfOKCbh5klRtoNu6TIAonOGWLvGr+VDku/vTB49xcGaDXUga
	 tlLPqwp0KFkYihUU1c2ScxNMBp1N1IETwn3vGhvi7BX4hg+FJuDdMaVlN6Yl0bxkZP
	 h6aVS7R/93NEA==
From: Danilo Krummrich <dakr@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: aliceryhl@google.com,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com,
	a.hindborg@kernel.org,
	acourbot@nvidia.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	lossin@kernel.org,
	lyude@redhat.com,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v10] rust: sync: condvar: use Delta<Jiffy> for timeout and result
Date: Tue, 17 Nov 2026 01:17:36 +0100
Message-ID: <20261117001736.1614146-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261104235929.1282640-1-tomo@flapping.org>
References: <20261104235929.1282640-1-tomo@flapping.org>
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

On Thu,  5 Nov 2026 08:59:29 +0900, FUJITA Tomonori wrote:
> [PATCH v10] rust: sync: condvar: use Delta<Jiffy> for timeout and result

Applied, thanks!

  Branch: topic/waitqueue
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git

[1/1] rust: sync: condvar: use Delta<Jiffy> for timeout and result
      commit: d1353c4b45af

The patch is in the topic/waitqueue topic branch and will be merged into the
corresponding target branch soon.
