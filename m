Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795642098;
	b=fk7yyJC2PUvlZzslwwd4oNWCHp9ONfwaJoTU5lbhroUZ8S0WhAeRZkcGfAIeuVUNzTck
	 ywMvmeBUz45FR/f2yGf2EZmoVrFmJM8OcmdwxkexLNGctAUj5MEDFsiZGtKuYBhYLGlZP
	 vwVR4VR8DdytGVFK1WZbMP73pNFuQeMQ7cmLxznVu65gyYPmo89JW2VP2YGkIiex2rxwN
	 V6zsNTmuQw7+Ba4xk4uc4y4pGUrhYHbigaRvk12uyFa3TmUxu2HvtfvyrnUhpLOt+1X10
	 cRNNEw9c3lE2NSWi4yR4NjO3sQCKpToXpcrm+md80bKzaBkEuT5FIRvae0QsNGqmn2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642098;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=Y2umKh47JBWXcWSgT/K5RcUaMy+5/WKy+OdqOQJ6WgVz4rtOJYulAMe0gj36ChOu0XWr
	 62L87LGFU9VnojHMdgzlTmYx7B297Hxetz+VnDPo/n2452Nd4ylvEfoC5y0bKYGOZNKxe
	 pAOCdoHBoY84UeFsHBu27xlSDjOiIDFt2Kflq4K/IdmSBQYj5YpCahwN81Uc/v17SQ0wz
	 VSZFXfFli7L+rn10yTUaV+iEomRSJtPnHUXa5z2egUU1kvemKiZ9W0QB3cwRF+Hgsq7Ap
	 EwlG2llBtiMYglZ3i5Sa5QM8vbwhPuHISzcVMUpgDgScP5hJ1A32tJ+yYwvnkWi6l5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Z5tQ8dfU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9544606A31E;
	Wed, 25 Nov 2026 21:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9544606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Z5tQ8dfU
ARC-Seal: i=1; a=rsa-sha256; t=1795642076; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MjLcmEYP4dfYgDJ1mAWe0gCDumOjchif5rjLyGxg00V3WjYCwzbi11yuEa3fFi8gOTHJS+NjxXczyqP1TSqR64XgusnxoAuBQ4bBxcaEb7XsFZVGg2luGgNbmxjeSzEkoQc8YuiDr+oJlJO1oObu1HahoxXskwM5TAGJYuXxNDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795642076; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=asJ1AS5EdNp2gkQfi3EfZ+TytbJ8iSpJmJjcdvk4afJDaYVYsVSR1f1Vn//nV+jluurid23nf9fGye0uATwiVW3zZNiC3VY0vVsjR6DyEbx4mHKF+sYdMI3PWC3T9O2BgyCIt5OKjerRcIX7nE+B7lZv+JGP+YXctchkNehuhy4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Z5tQ8dfUbRupGUOW5D+gWjdTRrDJVJW+m51QlD9Q+uKSrmGCXo7afcug9oPOG5rr0xBk8QmlYwdbu0XJIrO1uBfUa6FBF7pWql0E3S/KJO6yjg84rdjghifRwoR0piB6Zkk7PBqjPJ3flQoYI7ieTsZYTMErDIkoslv7sp9H0LM=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179564207465225.02107895592883;
	Wed, 25 Nov 2026 13:27:54 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH] drm/tyr: clamp va_bits to available bits
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261125-b4-va_bits_clamp-v1-1-07e2bb33eb50@collabora.com>
Date: Wed, 25 Nov 2026 18:27:39 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 sunke@kylinos.cn
Content-Transfer-Encoding: 7bit
Message-Id: <9AF45BE4-9E86-4663-A759-62E4469D4228@collabora.com>
References: <20261125-b4-va_bits_clamp-v1-1-07e2bb33eb50@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
