Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1286C1922F5
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 02:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502034; cv=none; b=ppfpxpXgCgfi5fpVi7Yw1ABWS/RFzAdPhcwnF9kcoZM9nuB2EDDhp8FnY8O7W54J7/aUWd1nfwps6thBgkoXy2wv5dm4+Zw0gNtd1EGCXTsB1NPFxzEQJYaVM5Sh149KzptNnxAbRonTU3OzylZRXNsAIN1yD6LMnnfsHkh0WeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502034; c=relaxed/simple;
	bh=efKx6Da86cvaqkEhrTgbUPr3ko17dq4/hbeAAfTQp6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=msLheU+t7K6lYKqkRllKlfeGlhX3fc5ipNPFnTQKCeNWqQMZ2E4pTlzZCmOvlJHfIbLhUJ8uzSrhTV5+odRcMQglis1dLS6GCfi/RAfxjb8iY0JezRMG7cCGPtpRFpnCat1CqKjpwVH1gMnL7ckr65Q8cHJv0igQ3+9BqB1NhMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fipGEUQ+; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fipGEUQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ef
	Kx6Da86cvaqkEhrTgbUPr3ko17dq4/hbeAAfTQp6o=; b=fipGEUQ+FsCeRqtiTj
	pRL9+tNPVCEFk7vY8oAoOWBFMpvOjWarMeZ1VZclsUHIvZX34BhzX0KBYVZmxPXl
	SZfV68+FHCNPettOPTr41Rvz33VMa92MJxCQLorolfFLM5r2O+wmV4gt4nPQkvvi
	AZxrLGffAOd23bhTppm4P7xto=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3PwJ023tqXejXOQ--.41442S2;
	Wed, 12 Aug 2026 10:33:25 +0800 (CST)
From: liujinlong <liujinlong176@163.com>
To: acourbot@nvidia.com
Cc: liujinlong176@163.com,
	liujinlong@kylinos.cn,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	wedsonaf@gmail.com
Subject: Re: [PATCH 1/2] rust: mm: add VmaRef range query helpers
Date: Wed, 12 Aug 2026 10:32:37 +0800
Message-Id: <20260812023237.3141881-1-liujinlong176@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <DKM3SRUKRG7B.3B9E6YEE9JTST@nvidia.com>
References: <DKM3SRUKRG7B.3B9E6YEE9JTST@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3PwJ023tqXejXOQ--.41442S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrury3WrW8tFWUJFWrWr4DArb_yoWxZFX_WF
	1UGrZ8GF13JFy3Ga98tay7ZrW5t3W5urWUCa4qq3y3Aa4UGr17Xr4DXr93Ars3KF4DKr93
	Crs09w4FkFyfujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUXTmUUUUUU==
X-CM-SenderInfo: xolxyxxqor0wqrxwqiywtou0bp/xtbC6BWNoGp723WF6gAA3A

From: liujinlong <liujinlong@kylinos.cn>

On Tue, 11 Aug 2026 at 21:12:35 +0900, Alexandre Courbot wrote:
> I guess a more useful implementation would be to just return a Range
> of start..end and benefit from all its methods, which cover most of
> those defined in this patch.

Good point. I have replaced len(), is_empty(), and contains() with
a single range() method returning core::ops::Range<usize>. Callers
can now use the standard Range API directly.

contains_range(), is_page_aligned(), and is_page_aligned_range()
are kept since they have no Range equivalent. The updated v2
series is posted separately.

Signed-off-by: liujinlong <liujinlong@kylinos.cn>

