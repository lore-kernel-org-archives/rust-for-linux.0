Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DBB3B42E2
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jun 2026 15:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780760437; cv=none; b=tsuIeIL5rARvWl5Am3FtW+PcoLPWULjvAAvae5iAQ0B4VkjAjxWDTltQyjTtAYKAVX0fQ/fMGCcRrn3j1CbLRkqjSdRcooS3/Bdl5wh99la9+Jl6CBgs2tbXpspXFMraflE5XAZcqne+riYmU8n2Zc7MhTZJGu44dt3KcqevLD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780760437; c=relaxed/simple;
	bh=WMgSsIfy1PKU5c1F/a0SxehWuwllFQQMDnT+Xt03d10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpGfxjG+RxqIGxLVorN5utBI1XJgGjlk/AVs/t9FzgHLRHNoAE/qPKguwWmzhxqC4OqGJ+TeyvK7LS+equeytGaNBK7XogeP9BUmc8D/XrOvNd+9ocH9yAmXqzlc7++J0jGbinjZsujuaxChhywOlqL2lygUxnJ1urEdKYPyfhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I63/lY+l; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I63/lY+l"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf2d865383so172775ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jun 2026 08:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780760436; x=1781365236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8MExWzCK0h60vFzBsWlciFXkcrb99eODWvMTGLnsCKQ=;
        b=I63/lY+lBk/uKJkFygNWStq0sZK4yVCue3Qp75cW4LgVGFUReFXDU6ZppBSzCxXHcu
         5zNtVpwsksdJJFn5pIeKwbJzn45juV8Gk8O3GhN4oZSL6fm20LkYZZJDm5v10SIuPixw
         TX2GyMGIGUGcHIsVDPLlnrBiJuT287o+iZiHfyPTF1S4MBqiqUOP8S+pDDR/Qbm8mxk5
         KyKHaD6cF7BnY6Ne1NfeNLk1WXZrXmUBgxkpsz8z5Usas0QOu7dnOMp2uGKcrSOVuotR
         lgq3W622eZ58XOTcwZWYrxGiI2EwvymdKG/MmjX2SN/g/19qExWxaCRgQYak3SCsLxVI
         RR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780760436; x=1781365236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MExWzCK0h60vFzBsWlciFXkcrb99eODWvMTGLnsCKQ=;
        b=stI08OV4OC2GsppxrmGngC4wO+R1JrTu8MIjKKA6l1UTXmwaMlSBn1kD7kv4bd9B01
         ZyoV5N9KbBo3hvRDWZmwXIj3otvoKEGI525Rk8mbg3C+kO8i6UVu0vSLgDpNCfuyr/su
         St/3TQwkrig37/WmSbfIsOf77UcmQ6Th5pTYGM8MEoYYe+cth8b+bzINFGdLxBCy4tv6
         o7hz0/odLj1KpGqnyQs3d6dp1dBYLcZyfCg0XMThb3rBaGX5MDqu3ijKDcPF2iXpbqlh
         hQ+bBQm657WkwvMod8oLpLlCWAxpA+GsxAU/q+Lt+MlgvV07eF7CrsLmQzKMwDOoRBB7
         DZIw==
X-Forwarded-Encrypted: i=1; AFNElJ8jrI3mIIGS8pbmxWgHVpaK2FYIJK/QjQ+XuA3UZMQ0EbQiDKboiOwZJem/sg1U3tKcz1NuXDfjK2jTTsn/3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YylAvr55rmyPGwSgXWC7e4ihR4j98gZGLbeHx8xZZgJAs9APsYw
	bT5WB693XatUoHDE4c9ShejxZU/dgjX+nasch8n0u6yzBynB3rS5ecmHCPbwSwjk7Q==
X-Gm-Gg: Acq92OEVY8kBwCSpF7BDkm6r/dO0TqZED3wbCy05hgzCQZpuOo85I0UqdzgNXo3Pl7y
	tpWlyUBA9Lw4AZ2oPkoEOFsKD5k7WpOpJPoQ+2N4V2eY5+VcsIe2yC3V/UGyscQql7jH0T3zyPk
	gWMRv0IlHmW7cq82RLlyH7VDF4/FWZ9f30O/iokE3fyhlg3hcftr16WlwSSKdM/i7PRrwWECN93
	WWvZWN0vyMoY8oLjqwj2JXXZ8GiQiOvSmDuHQp6oiebaY82u1S6dqEx1aZwNGoYWfqKpjCKRHV3
	z7lbI7WEIB+26XjCgtR/tWBBQ+H4M/Gkd7Kqix432MzqTfo4e9ahC4RF4Ea3iNvCK0/pvMjgCgT
	wsEbFMET1vpAZPZdDJC0omIhnNmi5VpKAdP3GHU7lcu9agMX7axkOqFYegxOh6huvYZWjSkIPP0
	6eB/aKjQPF9XiUAUmEtQgZwzmySYwOlhTwXWooEELOqfY452seCRnhmcHzwd+k6YKlWcAlblPCu
	DTvIxTsBTVG5Wa7Io3ZnixQx5KGYoHdW8SdwHfLGMY7fbYiFfeYwkiY
X-Received: by 2002:a17:902:ced0:b0:2c1:ee6e:be20 with SMTP id d9443c01a7336-2c1ee6ec4f3mr2991205ad.30.1780760435203;
        Sat, 06 Jun 2026 08:40:35 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm127016155ad.2.2026.06.06.08.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:40:34 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:40:30 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v6 3/3] rust_binder: report netlink transactions
Message-ID: <aiQ_bgoyRGyFDL8m@google.com>
References: <20260529-binder-netlink-v6-0-92dd74b6a32e@google.com>
 <20260529-binder-netlink-v6-3-92dd74b6a32e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529-binder-netlink-v6-3-92dd74b6a32e@google.com>

On Fri, May 29, 2026 at 01:28:40PM +0000, Alice Ryhl wrote:
> From: Carlos Llamas <cmllamas@google.com>
> 
> The Android Binder driver supports a netlink API that reports
> transaction *failures* to a userspace daemon. This allows devices to
> monitor processes with many failed transactions so that it can e.g. kill
> misbehaving apps.
> 
> One very important thing that this monitors is when many oneway messages
> are sent to a frozen process, so there is special handling to ensure
> this scenario is surfaced over netlink.
> 
> Signed-off-by: Carlos Llamas <cmllamas@google.com>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Acked-by: Carlos Llamas <cmllamas@google.com>
