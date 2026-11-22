Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795358499;
	b=sTcyt2kvtbu03zl4tfhl1MtFtsY0pPO3OXD1OLqKiGRlsu2iq9k0Hk+m7TX6O5FrKifg
	 U5Q6jtwI5az9/Om3IXNiIPgQ4rGTHHA/oE6nMTwwIjNDb8hzsNELCVUKclrFB2O1DPxQ+
	 GPIGr2Haux+IswCPFaTYwPFSiPsmT0RBLzzysIhMc842RZQk9ILkcglw+4Ln95JnBYvZ6
	 J1X4WOXL6oZWXw+IxVTlLHbLi6jV6+NYy4LuRxdO6h4Wg23ad5pWAnyAXec3KhiPBR7qP
	 OSCsZdClhBDcTFD1qPS45zeuDxCDX60sYuSSd9GQAGMWIlpWsrfpKW9RJokVOPkRtsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358499;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=OAs13tz1zp/V0FXsNuU43sQnuDXZ2JK6gLC8wvitSVA=;
	b=q2vnJwrDYck+u5YYbeCGTyQPgjkfydeeDKzAQpN26sIw5uRXb85jU2bsUugCSpDbKRDs
	 irONPds74uGP8Q17uttlmlKuQub1uoDnX6XYXhrKWd67JSbQpIPsV7cUVSWmODo9oyupS
	 cDYP9DxuIgm3zEkP8jUceq44s5U3G09liZUuhUTuM+3qmQxNb3Bf6hAQJwHKXBRENUHDm
	 tMRnvbW2VJcmtbHODc7uGd40RugsAeMH8uKTvmaG7ikCxF7QdicsddJbCh2Wh370Opf5/
	 h0bYtUkSDV4dI+i4QPG5vy/t+W3uENLhTl8PROx4O7STXugEFAcjTx+a7VZCEzijccA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=iUlw9AP0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7843606A320;
	Sun, 22 Nov 2026 14:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7843606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=iUlw9AP0
ARC-Seal: i=1; a=rsa-sha256; t=1795358467; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KLZoxImi/gLRc5IEyb5cQvAK0V4Dz41Xb6f+OH0JaW7n/3y+F/jaQRJBJKi9ln56cZ87I7YX3upq/wZkRP3KqZPiIFmiSCxc6f+8o+tda74u6BJ/KCQmMRRvC0A00FpxfN8QkFqipX6l5PWC7cAoDgVV42p+2cFF9T1XKm6Cm8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795358467; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OAs13tz1zp/V0FXsNuU43sQnuDXZ2JK6gLC8wvitSVA=; 
	b=NdSm97msQRfBEanTZa4vhVxHcbmj0M76Sb498KU5Awm30rC0SOSPYTTqODJFdxDcRzg4xNGTp5jfeHlk1Eoj6gQdcj07Kxm7SoY+/ysE92a+k7a3E9cCHgBXQxz7763wXvllIGBMsZo/fbkdQqHvykztbFkZLrahlZgB9blTqBQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=iUlw9AP0eZxLbWFQSQ6ZbMipLVn1sRzoht2NE9FRSavf7MpzLAdk6nkgQEp1wA3lxEI3IrrLbKumoE1RPOyWtO6rGWVk5gCFZeL07MlGO9UdMyN0RnWzIC5HxyTP2/elO7y/wuN4VXMVPr56G9r+etB35lzpIX0LPOcneWT+LDo=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=OAs13tz1zp/V0FXsNuU43sQnuDXZ2JK6gLC8wvitSVA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795358466185585.8202777739539;
	Sun, 22 Nov 2026 06:41:06 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v9 0/2] drm/tyr: GPU reset infrastructure
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261122-tyr-reset-impl-v9-0-ed42d8f513ec@onurozkan.dev>
Date: Sun, 22 Nov 2026 11:40:51 -0300
Cc: linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 dakr@kernel.org,
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
 boris.brezillon@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B7A7F936-E696-41F1-8B9D-5A29DFBED07C@collabora.com>
References: <20261122-tyr-reset-impl-v9-0-ed42d8f513ec@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Hi Onur,

We can probably fix the sashiko findings once the Clk typestate patchset
lands. In any case, what we have so far is good for the time being.

=E2=80=94 Daniel=
