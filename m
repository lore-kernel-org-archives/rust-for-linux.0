Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D53242DF
	for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784402331; cv=pass; b=gxaiVZIWT9aKi8b4jmFjIcHaTy0NMQEagZVUsUsPJExNtzvasfeng6JTSkwD2PzTSMlcltN7p7ln0AiOI4t3TCPG6bdcw01+p+XGoZqJhl6b53HtBF6AT7kt3qOkSaCDYEjUmcN2A1QUD7N755LP1BRwa+OXS7KbPoksvL7LERY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784402331; c=relaxed/simple;
	bh=E1qYW6ZJ1UYNlaqgIIJKg7oHLKVzrfGMujLweR77Egs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Fq2FbafR9m0NTcQ1euc5Xqg/y9IGkigWatScRGUZE0oNNNhBqrzpH3LOYVc3L2jKu8qWkpJP3cn+OBkOKygtMdUp3usmqm2FyYqZ9sczLjQb5x/opZGu3zJ9diU4MZX3vTWFYhzt1aNNe0GoXpIGgznnbM53KsUH5H1tSwz38mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zi0FYI2C; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zi0FYI2C"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cad4170e8eso117876305ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 12:18:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784402330; cv=none;
        d=google.com; s=arc-20260327;
        b=rJz+B8jG3J2ZZO8Vw9Wd+UV6mjSGhp1STDMhJQxLF9QQ89wj/AF0KiQkGrQ51PkaiH
         oYyWk4wS4P9xmzAD5miyEkDG/ixu4EN9Z7WOotlwkLMiQ56phVVGUKtdC0N/bL7TRBKN
         OQDw+FtUAK5Ifpmezj5YhY3DlMTUW/soCRVsxwp6tU28KBDzy8xQImVmcweZVf2GwoSu
         sXoX93dXi25hGlIFA+oM2+qoQUz2GBwPoPvvqxjRniAWBSoQ3F3CzLs4V9drOTNu6E6X
         /PC5YpJNZfyejZjgSXJZWykHsTQ2eC/82M/xXxaTu1ZSQ2uErjHRsz4Lj/mNFdlq0Ah2
         L9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=E1qYW6ZJ1UYNlaqgIIJKg7oHLKVzrfGMujLweR77Egs=;
        fh=8H9ktHP5QxsRo3CZ+ceNcEx2kor2amXinZK+t/855+E=;
        b=OdMirf+ZyzsW7CmEfX9UK4NzSVH3mfYxjqIM/wRe0se/9Kt7+T/3NRSbGCfAzpcmcN
         fcbzhcGuwTff+kjfZ1xW3ZAim8KenA9FXf9E8UoM07GmN2rv7rLcPyBOx9FvZW/hiMPc
         Yp8Le3ggZbzEernZbTnWXVubWAl933cFypQSmAfN3kk080C2DsCOaNzNxbBhVNr3HqPE
         hC1QhZzYx3iZfkW7djUEkyyJhh+EOGsLvc/ieZ1NI4B8gJasjdJ3EhoSSA8Eulskg41m
         KSUGRQ2WUhcmEqE317gVH6BFjh+fIpeV1rJ8bdqauHzV9UHFJlbFQA2sUoSbd61PWCvt
         0miQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784402330; x=1785007130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E1qYW6ZJ1UYNlaqgIIJKg7oHLKVzrfGMujLweR77Egs=;
        b=Zi0FYI2CJAYGnsjyPgNQFNEBkj76nDYygtCwaXITzymkOs7zJbveQIPBEX3PFST2p8
         BIYdtavB+xxwRgSETQtfa60nTtBF0mdymUwPpR1LNodMLePuRKUz6JOpBVXLIDPUzDex
         m8vwz8dL3lvRl9cO3R04UOrgSuZ+4C2WWHhXYx9sUBz/ARD/zKZ2Vs+Iy8sfYEZsvaMr
         nJLEEOSJadT9u3Fnsch+ocQRlhT0cxhof5VYFGuJd/Fql4N3zqsU4LTU06twpZ7wMwiX
         m71Fy2A2/+RnS852jRIBu6YDQy5fUnqy+K1RSW79BdhnUvjhq4Ge1OXsCjJZrrlzUGPu
         fGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784402330; x=1785007130;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E1qYW6ZJ1UYNlaqgIIJKg7oHLKVzrfGMujLweR77Egs=;
        b=b+Q2cdrZYhKwd/9lSj6f3oMoq7D4MtjRvu3h4h57EUgDXiXbs1J+TK4tJ6Cx+9drBe
         8yLYzIYHsDqCSY5nB3DizW+SYTR7FuSu81hBOnkISrpIJjFqo4G/wuMo9QNqUlXcw2mI
         63haoEbAUwHdHSE8yqoELD+/f/b/mW981QO8nFtxKcOSMJSgzQW9vrFbaz9CwrNWsO8n
         0zmwnCBQ2SRqT8/PI/9GqGuacw6WQ783NhI+czBOCvti6w6ASF7Rqc8kTD+HSaWM+ZpP
         9tklvL7cj+WCL+uuHe1YddaLuWX1HFfoCuikZeGr2LMpPg122OvSnVqm3hXGVCL6F292
         CWwQ==
X-Gm-Message-State: AOJu0Ywo3OWyr6Uy7B/46nSnt6U49kifgZlx0gFDPhtZwh9ybfxdqgOP
	rI4sJBph3RwLkJInAVIQ1jx3zO+V+pFTMKBgAtoxpLpQDc6WemxanyLH0a2jtl1KWsH8VDH46Ir
	KN+IJ2NsPA5ioFTla2IY1EpRo0Auw5eq2/+V9
X-Gm-Gg: AfdE7cnM8smqRl4ryRVvesNmOb9U5ZV5gyjddNuHxRC4SgAvtC5GKs3P8pw0jc8eF0X
	7oBY4EY0EXVN/YDe6M8aBFs0IOUvNHS8ogFq74Kz2couZMlGQfFGUehRkOAksmQwRu7tHUT7AAb
	26N3z/b0ddXjfRuvIkaOibNpJKz3iuB4cUkeQCRWqmQHnHYV1iSL6Is1XMWw8+cjbPhaYqsx1Yr
	XJSGfGY7WhRyPE8rxO4Avjx40fXyFMNkFlbAfQlsI7uOe9pwEjWkLp0QUElRBys+AMnWKTFHMZX
	72pv1b63Kmdka8CMav07jYsXi5+tnkwYaqqBGmll7mBtDdDx
X-Received: by 2002:a05:6a21:a8d:b0:3c3:954d:278d with SMTP id
 adf61e73a8af0-3c3ad5aed77mr8627569637.9.1784402329790; Sat, 18 Jul 2026
 12:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Burak Emir <burak.emir@gmail.com>
Date: Sat, 18 Jul 2026 21:18:37 +0200
X-Gm-Features: AUfX_mw_AFdvUaNqzvvUWdgpmggBgy39Hf6imaP9NuxYAxJ_LyA5TNvoDL2X6_Y
Message-ID: <CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com>
Subject: LLVM 22 needs bindgen 0.72.1
To: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"

Hey Nathan, Miguel, anyone who may run into this,

I just filed https://github.com/Rust-for-Linux/linux/issues/1247

I couldn't find this described anywhere, so posting here for wider
reach. Maybe it helps save some time.

I have run into this with the slim LLVM toolchains [1] which use LLVM
22. It could happen with any toolchain LLVM 22.

- bindgen 0.71.1 with a libclang LLVM 22 will erroneously generate
opaque types as bindings. This then leads to build errors "field does
not exist".

- Using bindgen 0.72.1 works fine.

It would be great if the slim LLVM toolchains could be updated to
bindgen 0.72.1

cheers,
Burak

[1] https://mirrors.edge.kernel.org/pub/tools/llvm/rust/
