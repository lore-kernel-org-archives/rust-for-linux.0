Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C07F384223
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 18:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128384; cv=none; b=G1TPIfu21CSGFlU7Oy3pL5kPcNHd8NQU6Bjotif6d4do+/RhKN8zswWq4gAcXLkHYv4+2k9mwo7uoEY3rXVEH7ZX2Y3X5lE8biLofgt9r7f1dZ/y7uj+AnwP+fdqzFj5MBwo44VsCGKat5VI/aobqLiNu7SF8efu/fZjaR5SycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128384; c=relaxed/simple;
	bh=U8xFS+reyo4EkCXhRcUbUpO8uVADqC7MT0R0uL+qQus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCOZnBp91eUok73IIZvdMPQh7rdJFvHDFr8YzjtytTMuTxxbVP8ulLML05nLIzr9q+laHmJMXmuj9w5PnGTSvEVxH6ULRmMCzpco1ZBOjJmjpsobOuMsnFxtfs2RlKyfK6slLt7A/8crBAK7PVKaKHxGZhOBK0PXgrT3nd4xOwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nL+HNbQT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nL+HNbQT"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44509921fbcso1571771f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779128381; x=1779733181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=U8xFS+reyo4EkCXhRcUbUpO8uVADqC7MT0R0uL+qQus=;
        b=nL+HNbQTZ5Yn0Xoa60Gk2Cgr9XqqZwlFFkJM+ShxdK11YEOMUNL0vcd9tzFug5sWKz
         2cbOBz/prx6kJcgFYNBM1FLljWds9tb4vqxxFQMTYB7MD75k+H4JbVE0unI9JYs17B8I
         EiSZrfi1IGvRX+Up7LSwDpfC31FpyEecWBmPHViLUB/QB8EeyVzI1iRlxu0TKWHXMAvf
         MTfMOXVygd8oyFybXQGKl+J9N7Ey7+3UM3SCoI1Ff8MeePJPZp8urv5Lz4hTIkj7Z2wB
         WfIjcPTevk8T3N+DhUH1nZzMGPQdBRHwRhoQJZh0Bt6czDbd/hwd8E8bRRncfQBgKJDK
         p83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779128381; x=1779733181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8xFS+reyo4EkCXhRcUbUpO8uVADqC7MT0R0uL+qQus=;
        b=H3Qy5flQ60rveb8L4fnZ1GAXmm8vsrWCmS4Ft5Mw7MHJEUSCKD4RvIkjk787NfqI8p
         HrKT99SGkybHZrBJVGak5Bj6Gl2+42ZxYYNYO6aN7elHyuUV+pf+pSfHLZmQyi5HuCe1
         QR1E3lxa7vIYU5K++DGxmcQzn+8uSYoutVKmkadnWn9HQUFPNz/a72zk3WE+Rs24kEL+
         axMiLFxVdpmuvcYAOGQb6/kxGakFBjWaC/l+Ox3upUuvzBOFdFVRYVBUn0VAm+XUscWs
         iOdieQYy8l8wsvVqLk7dvFC9Y2P5wo84SQNn9q1AnVJPHOX2z0Rd2ODnBq6/hqsamVPo
         Nglg==
X-Forwarded-Encrypted: i=1; AFNElJ/yBpG+uQCCVIKS+t5LJSAr77HwqVjS5nqLhzqCy7KCYaTr6N+G1OGXEqnnihXGo8r4CtTZ09Lv7uf6RDgKhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDey1zp/OcxZJE34JBlp99rOdnXjB8HUc3a8QcZz5Re0TSMog6
	cEW78orqIq54TlLckFP/r7lVUQqznMcRfQx8r9Ry/tcRuGeY5Ndou2Mn
X-Gm-Gg: Acq92OESsqluRMYohw5a7JgnRX4Oyk7sPqmGTnAMy8Kj5h4AZLvtGvZWozUCeQMsHLa
	m5jIww/zF+D5Eb/Q0fT1CdRyXkwvj9mvjFlhWUSCdwJ1WjuRu0aXs9gjKO70NsS4Fo+qGlHWac/
	gGqwKlnBOmPRfwoe+PkcC4mZOWQNYBTpz1HvFUcD0vw54RnjyVTr3tl/kWjNuGS4ismrWKgP4D4
	9RAep+0dUXX4PNLFSqz+yAs0NcYiNVhH/uAiL8Lh+clQ3DxM3yyUcKR39lEa6kQY1WhJLVdlrxu
	huuRyt6C7v+hHbZJEOljVIACBmMvHxE3lxBSFXJ8T4Vq0EVKN9CdZP4vX/rtjnEmL27/zZM52Q/
	UbpHwu0xXoSIpP1ZJwFp09i7WIQEO/PzbIDSlt8qopFCHuM1f7YKooDHuvNRft9Lnv4t3hpRsGN
	9ngsZSSSoeGGEVViYz+y6z/HiCHqkrNSQr+oGuJmH4005blFTa7mLVE535QfE=
X-Received: by 2002:a05:6000:2489:b0:43f:e2b7:7160 with SMTP id ffacd0b85a97d-45e5c58fe72mr24859160f8f.4.1779128381341;
        Mon, 18 May 2026 11:19:41 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm38425105f8f.30.2026.05.18.11.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 11:19:40 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <8294a089-4350-4013-a644-b7cb4ffa5130@gmail.com>
Date: Mon, 18 May 2026 19:19:39 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Arnd Bergmann <arnd@arndb.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>,
 ljs@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, qingfang.deng@linux.dev,
 yann.prono@telecomnancy.net, ej@inai.de, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com>
 <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
 <CANiq72k_tXGSCd1BEg8XmTr+acZHfdRbcFOVD7=O6yAbmv-nHw@mail.gmail.com>
 <f77a4858-2bcf-4bfb-95e0-24a5d91e0862@gmail.com>
 <CANiq72mGTehUWS2-MgukOKmwAn3fB63boFNqbNENse6B00M7Zg@mail.gmail.com>
 <ef59ee46-87e2-4f99-babf-4dc8ee3cbec5@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <ef59ee46-87e2-4f99-babf-4dc8ee3cbec5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/18/26 09:08, Arnd Bergmann wrote:
> What about dependencies that are normally shipped by the distros
> along with the rust compiler? Would it be possible to allow a
> range of version that matches the ones that are present on
> common distros like we do with C libraries, or would that cause
> more problems than it solves?

Hi Arnd,

Yes it's something that I would like to enable, though we first need
to wait for all of kconfirm's dependencies to be available for these
distributions.

I've filed a GitHub issue for this in the repo of 'nom-kconfig':
https://github.com/Mcdostone/nom-kconfig/issues/149#issuecomment-4480419622

Also note that the author of that library is CC'd on these emails:
Yann Prono <yann.prono@telecomnancy.net>

I will need to do some testing once all is available, but as far as I
can tell, this would not create many additional problems, though we
would still need to provide crates.io as a source for distributions that
do not package Rust libraries.

- Julian Braha
