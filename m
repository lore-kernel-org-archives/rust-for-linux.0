Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795472818;
	b=hnXHf+kkd+HwyIYLRTgbE9tjolvwkmGPcoMkq1gpPqSBgjVQAITOWtMp/IvcjHsU0hHJ
	 NG8zMVHjVmiscEJl4W0Jv6PYGZsZaLQNxcIYHAjFFi+1lGgyb1MrxR1JGbbeO42x6LcvY
	 XMaLi6si7kV2ietcQoa8BtfUNTXSXQmZ5CprXLOBp9vNnyE5Vb0j8SxK7ij3ODmJlctwX
	 c9ckDi4ajiM1CAmy/1AuJI6o2TeAJTUjMCYO8zt+PnBpHyWNBOTMrRW3hDE90vyhQ7zT3
	 mEIEQerOD/KzajYHYMvlscVeKRbpDt3ipfJEGboO1QaFYdRNVhhnJGLSKCQ4NAo5Keg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472818;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=k9AdsQ75C4VFTI3Ny+V7EnE4MQOaiUpfZxRopOuTcOg=;
	b=WvrHR1H7bG6JFZGP4x/vggBtxM7tuz472wsQC4QyegQrUmcMoUwJbBlKDvSMEJXAw4cA
	 HLAPVMetHx404gckp0Q1oH+ALMG4c6ZlNH/B800HVWuC+OCIh3gRYW1NqIMZw9+qMY+oB
	 5dba67Q002OgLIzmhM8PIxXYboPetElkQOFMyN6umX0ZSIX11dok/OVsE776mdOMLVMgi
	 9DymWGmMQDiSCMuGUAyasuGRWBEkkL/NSWsG2r9Sv+4Pttx0rl+H4VGf1D1yG8++KZffe
	 ho+W+U3oUbWJug6Gh35lFn7pv/pfeEZBlcsd5WmeFjIEcXExDvuJStKFrV+fwGaAp2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=E8ilBHpW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7C9606A31E
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 22:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC7C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=E8ilBHpW
ARC-Seal: i=1; a=rsa-sha256; t=1795472763; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lk7EJhzpaJ+wBBDlEn8gJKP6rvwE0AtPPiz+pvSeF/ou0sYTpM/2tE6Q3jybpYsHS0U+31NxkENAEc5pooCC9EP0r8mbtXd6zC9yXMaNlu/HdyQcjkAFUSNTt00zLypAg7dQHdoHwsgghNa6Ko7+UIZlpE3jNzNXf8ApUtr0NF0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795472763; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k9AdsQ75C4VFTI3Ny+V7EnE4MQOaiUpfZxRopOuTcOg=; 
	b=kahc7bT71Pn0fa82ABYYPL3CTo9qsUQ5ZFG93poNOET3MDSkzQq38u4zkH8sHwY3W/nqufIdbwL8DJyw5vObWDXdaY7LWLKYx3aYqgVQLYiNKj75IsPAaA08SRX2C5RX0sjpNhpr4BWtDRHA9PkMAybOILeQVjWVPosK4lrN0lM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=E8ilBHpWN4kfzwkBtr/JbRk2uHTFGzIxZhxtrvR5QU9bRZxskkCKuPd/+x8HxzPKNTbk/DTFidImiP3pjbz0VL+lp7JbmWYbshCVjPWrNwj5zmb667M6ECACgsrOh9Z5v7rfzBJBDIIqOvfJZZT2AXjNDGWjlYabS8p9gBQyztk=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=k9AdsQ75C4VFTI3Ny+V7EnE4MQOaiUpfZxRopOuTcOg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795472760727373.83086376046344;
	Mon, 23 Nov 2026 14:26:00 -0800 (PST)
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
Subject: Re: [PATCH v7 00/10] drm/tyr: add VM and BO ioctl support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
Date: Mon, 23 Nov 2026 19:25:42 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Johan Hovold <johan@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 driver-core@lists.linux.dev,
 Ke Sun <sunke@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1103933C-C9A7-48C8-8890-449313716EB5@collabora.com>
References: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
To: Alvin Sun <alvin.sun@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Alvin, can we have your thoughts on this [0]?

See my reply, which is directly applicable to your patchset [1].

=E2=80=94 Daniel

[0] =
https://lore.kernel.org/rust-for-linux/084F476A-BD3F-4FAA-B47C-E875B542AA1=
B@collabora.com/T/#m14abaa8f4cffe0475a8ee9c1387d61c077ff7533
[1] =
https://lore.kernel.org/rust-for-linux/084F476A-BD3F-4FAA-B47C-E875B542AA1=
B@collabora.com/


