Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795703325;
	b=1wxfweUEZadbtOK540yFEdQDlABRd7cgZRHQGK0Z2p29e7vB++g8wz5aOwd12ZkLqhOj
	 UCxPoaAYEqrLsBwknGMhTfW+ysdy3mmS6Ke+5hWQU58jauYBGpcXvFv6XHvLULE10B1NZ
	 1/DsrCYfI+GhJiavboqoMU43tV56A5m3HMfS5/MrAx1A5NW/jKydK3s7dF5X5zl1Y1cqB
	 tWBWGNA7h+07nveIyM41dTp6IJK6LxOsar+BFzP3GtrwzO1kGxzkiAkL2Koj9nf3GSgpB
	 Kx/hqYpXByrw/pvwVWNvfUqPcfdI3+8nC8LxBIdyUpXhXfyJOjK2Dlx+CEojmrKc7Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703325;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-ZohoMailClient;
	bh=Ht0m74IIqDY2j7B7Fbe6y4jdNGqEQTyrZK0DRDZj2Ok=;
	b=npOs03nGee2jqYyF1gz7uDZyPewluMD7+Td5naNYnPMCo8NdMhzXgarr8IE1TAN1xSlX
	 Ef1EYNzWAJlFaG5pV05INB5XHH7rgdLo6KRunZfa4aQ+Y0GzibLWqLhWK0SmWD4atRW0M
	 0Z/y/XkP/NbnAY+YHs8YL8gKuhnxPf+L1e/go/HUPTWkSGUf+QfWCKRVAmc3O/x2m3kSW
	 k9hX36s2kNTrFSVqa+Kgh+HZ0FIKbbO7PR+542fBCYopmfuw9fgm/W/QXwTs+ia2DR4Uy
	 zSr2bHIo578EDNteWQJ6cmgcfVw36xf28WXHuCJWV9wTpRkqvKKgTVnd1j+2+7cAVAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=cY4fLDzS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7155606A31C;
	Thu, 26 Nov 2026 14:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7155606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=cY4fLDzS
ARC-Seal: i=1; a=rsa-sha256; t=1795703293; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LdIOmtEVegZIZhL1rINOEoKgNdeDmSWrg5uT0C4XvKBSReqEjphxgGraoSy48QD/y1oG+Q10rKrvPOBFKGAffDoGLWjscPFSHFLhUF9EcfAoUFqVWvBP3I3ADainZmo74XNMXTaUZ7ZAY6IwFvfnHDR4dmgtYuWVr82gUq8Ok+Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795703293; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ht0m74IIqDY2j7B7Fbe6y4jdNGqEQTyrZK0DRDZj2Ok=; 
	b=Zoadj0HWDzAVEOH+Zofdh4YjGzTin9+MP7Ry5omPJTJqO3oz3qpIAIJ69p9lf5dIgPPh4/+tpC0oUgCrbXW4fUbBWs1YzhvfhKAEXuc242u/t5q2Ep7cBP0SfFEaujxza9BFcVt89Qgr6clsBoDv/X52WSHJjSl5daVo2h4Q1fc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=cY4fLDzS0/8Rk5mO5FXOp2GR1w80Dx5qxWFxoViYI+cqS4BuXbb9CGu9xqAZaLa2f2m0hZZF/alO6bKHkXRLMN2tXsBKOwt7BSjZ94OSUFit8zR2FE1YGLnVjUoWGU35Fpje1ZWwB0QxKEbXX89JEBNO8mH5p2OzrFU/seIvM0c=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Ht0m74IIqDY2j7B7Fbe6y4jdNGqEQTyrZK0DRDZj2Ok=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795703290555180.45960646424385;
	Thu, 26 Nov 2026 06:28:10 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sunke@kylinos.cn
In-Reply-To: <20261125-b4-va_bits_clamp-v1-1-07e2bb33eb50@collabora.com>
References: <20261125-b4-va_bits_clamp-v1-1-07e2bb33eb50@collabora.com>
Subject: Re: [PATCH] drm/tyr: clamp va_bits to available bits
Message-Id: <179570327763.2912049.3505803472059954057.b4-ty@b4>
Date: Thu, 26 Nov 2026 11:27:57 -0300
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

On Wed, 25 Nov 2026 13:28:20 -0700, Deborah Brouwer wrote:
> drm/tyr: clamp va_bits to available bits

Applied to drm-rust-next, thanks!

[1/1] drm/tyr: clamp va_bits to available bits
      commit: 94c9ad2fd7a15f58782c50e471397d1efe6b6363

