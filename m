Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611915;
	b=2h/DSvtPpnqMctELQtszqaqce9ADk/jrQCfPlai4rK6Ugfdi55Mr+nNHsvWEtgSH5UK1
	 BC7LA3sMWpex5Zy7dROpFcycPwSQEDOAmAL9dO9BfK7WZEIli5G6r9D6s8eXT16O7cBWf
	 jpxu6W2PsnV63+39QP3fyANGYky3OzWe9R/QLNP8JpCN6uF7W2ncP2n4Nz6hBF7b7ME4y
	 eS4nCsNRBRirYOpRUrA+DyzjFRQSSqt7T/ZpuTXShnGm+ppvH8QrwnOoRYdbkkG6TAnMh
	 W5pDPyqn3EC63n4DAyP4BpdwXgZOV26MZVW6rjqpUXQSRFze1CgLOi1r56+HH5cX9zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XyYaJTVeUo/ZrNDMan/h+hbNnbGsNJR1hi+lyA22qZ0=;
	b=LuU93UYYsFsuysCAiqsilD3BnG3CJ5K2lcBu9HKmkv8CPAVgLSL46wdOJkuBZecyemC8
	 qY/WvLSVWOYDyU4qs+vADTuPpbI9HFHljltnP2q05e4PEQ05L/S88BobaWCag7l8omBd7
	 hnp2vd0Ly2wx1uSuIUWyYM9BrIgzlZC/nD8lSSLe9GSMH/CrowCx6PKM5bvd5ivzlcVOR
	 hMvAUoWuApBHKs5Bk04OJtkpUvRR0gwIQrTKOAD+omAjZCLcyqVICpbLAv3TTcYmG1qfb
	 16JLa1xPDhJ09LYiiTU2hVG7SbxfBw9sjIJ2xp2GzbX4MEAfxFUZdd4I6UHaMx0yBLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZSDZKN8;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE4D606A31E
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 13:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE4D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZSDZKN8
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2f08b80a840so27501475ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 05:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795611914; x=1796216714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XyYaJTVeUo/ZrNDMan/h+hbNnbGsNJR1hi+lyA22qZ0=;
        b=WZSDZKN8RsmVFDGKmBgvjOl212k/cyO2Wz4n9yVsyntOlNsfu8vTO/zkx2tavZWj4Q
         Ge3BF69j393Bh/Ch7EmbJx1NDUSrJ1Ap0dl1K8fwk1vb7fZDSTdEQTWNt6n6t3t3ABpm
         TLpsDP1OiPMb5IwZhfI3bGGoEOTTR8NQkqnZpi18yrUk00qZlZCYqp7eV3kMa6jrcLnm
         xuyk41UnUY8YSGki3ZtYbrxluIv2BWUpmuI9RdcTpB1+LL6FiQ+liFKJ+Nu7cxJ0CV0v
         boEMs7moHoir/002WoD3aEJNhpnWCq7sc4fXLpDmnzB+NCWvdF3Wu5wvFni0SSiez7EU
         Q+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611915; x=1796216715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XyYaJTVeUo/ZrNDMan/h+hbNnbGsNJR1hi+lyA22qZ0=;
        b=E4dHXFs9ZjruK9VKzqTN6mGofy0aT7oKxViUyY55IyzWxyq/FYcyTdILpjRPhPv7iH
         LRVGp8AIUXYqr6g6Dwo+OaAkTRdRe90lnjIuBmfeSxNbUMgCDdJ1m/p7kS5Z6vfUzDrW
         6koDtqPF0WRo1tMM1Z08lxXglWhjDg05ZEPBNd01/Qlj6v/iHFXRPV2sEOzBoQN3aTku
         t69YVKCPfMZCkUCGoVKflm5cOpMAcMT/O404aLBMf6F+0YECQAYOwIU5wTK5H9avqqvL
         AUelyvv12c0+h+8GOEacx143hIj5Z+qXWD2I9hWWF1l2H8MKAHSDZon7T3V+Lk/eSK0G
         9gaA==
X-Forwarded-Encrypted: i=1; AL+hErGBAE72h9a66hzCyPGSELP1tWKwgC1vS/lWwf8ybFknJE5gP7ZYyhhk7UJ4XDhN1isYxBryYA4lPBHv6+RQNA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+BeMHexqxj9VukmjNTeU8uZc0VTY0zVsVhnQXkDHSQogpcfOVP
	t5ns64WIZ+GXwX24nHH93iXLbdjaoz3LtwUV9sMzNhIqRlKeM4linGgZ
X-Gm-Gg: AZFdTZe0QLHVYGtpInbZ41G9XToP0NF7z9gcNBsLevSVNmw06x3tr8760aH3hxUd99v
	gpaij5oZcNph5gYX2OzhX6E2CZrhbgysNh7Gi394X/TEfNOE6T7xxLZgmeFS0Aql+yBTa/2MmUw
	0DIkr4/D3VFrx0c/2gf+PDBhqKDlIgw9D1Y4CL58esQ8oFPB/G9/LWQ4foMCYX9ewAHOwG11RAE
	MuTPYMoN0zaNSMrHR9CD1g7nPafqVKikOzlSaWNkGQTNypEIj7OHLvWS9vCK6Sk0w4FCPgJ5XFc
	omdLE3P3r4PxxG5RKb3xkzM4PaHYj748lNrpTh7xntsJBsUVH0fyOtEEwYOeJo1nyrKrhoQA7Ip
	+wWHKdk601BgKemev/VNBcb+5oxVgJz760J2yWmRe1SChtBjYRCP/k2dIEUpkHIGDDJ4vdny25l
	NvFTV0Ut7I9Tn8TDiJiMD1817LnHARSlrYliPYQosDRzlL/poPh6GVvbdrAX0w7SnkGIgPoMxij
	kRemcX4Ul75jI3EdYY+eymVBgX6BMSyF0L9j0zd4/96LIqPcK2XNx0DmX/8OHqM673uIu80B5SQ
	+IRCYVe87b99YHLO/Ffs4xG7mw==
X-Received: by 2002:a05:6a21:7d05:b0:3d3:ae50:97c7 with SMTP id adf61e73a8af0-4014ca44582mr18500592637.20.1795611914518;
        Wed, 25 Nov 2026 05:05:14 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:3645:b698:a929:4bcd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm3577976a12.26.2026.11.25.05.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:05:13 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: error: add KUnit tests for errno conversions
Date: Wed, 25 Nov 2026 13:05:00 +0000
Message-ID: <20261125130501.287132-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CANiq72k-30fquxsch0mtiLR30WxsOHGqQVxD1prkwS+VxNAs4w@mail.gmail.com>
References: <20261125120959.244175-1-w1355457260@gmail.com> <CANiq72k-30fquxsch0mtiLR30WxsOHGqQVxD1prkwS+VxNAs4w@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yes, that is better -- the disabled case is now covered as well. I will
send a v3 with the two sets of `cfg`-gated assertions; both configurations
now run all six tests.

Thanks!
