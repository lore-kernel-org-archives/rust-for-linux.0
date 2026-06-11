Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176BE49218D
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204370; cv=pass; b=sN0GzD2ssNHVFeMIBHBYLLaq0nCPAf2aDbc3xyq0/sp47oZrDOPMxj4csJyf8GKJI4CVMfonBcLlxUIpHGs5GMk3yqykx/u2goukbAgmxAVQhG2qi2v9K30cauk2TgUPLH/VkC4AOXZv8ke+kmdWD2E7QlbkdvgxDyv3KsJN2AU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204370; c=relaxed/simple;
	bh=l+7amCg6yD+HWmzoNn/kHJ2PsA6mrUELJ9023pVu+Vs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GJFAwpkJQci7C7DJ4yPrep8ifXhFaBL0gxSDF9L7Oy2SLIqEW1NjnxifRA/IJue7jIBy/rtVoFUWa46fMPH3Gtq29ti6Gg+uNCNI7L8xuXMQT7beY+FD9Ukk36XJR3XsVrfM5NfYtTuOjzrJYtxhcaQ6iIKDFZvJ22AHudQUwIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Eg+s6VR8; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Eg+s6VR8"
ARC-Seal: i=1; a=rsa-sha256; t=1781204349; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SbAp81Ex/F3mB1LmYEc/LS/pB4Uul6HwCpWEVZmnPIXHfvLkK/qQoT3LyT8nsi6XuK633IRWvpoNR3IXJKBFG8zDJCCyfl9WZXXyX252MtEhgt7os1sh02OB0aDwwDJe/9Xufz69wmAJ2TRvegvXA0uccMwz+DGvA4tuMocVc7U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781204349; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=l+7amCg6yD+HWmzoNn/kHJ2PsA6mrUELJ9023pVu+Vs=; 
	b=jkY1Igctk2ZiCMrVvu0lLQvEB/hnxhgSAnWynP9xF0rM5X6LSbrErs/nBKPdRVNmEy/qunk0+bfRgUlZL2aQ5zBvkHeW2JI+6sOqlP/RKyT18SITaDmmENWrZwLcaiGnHbXV0xM/lHUnQ1ZWs+hfJoinyUQ0mQKvJnCPIj0sK18=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781204349;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=l+7amCg6yD+HWmzoNn/kHJ2PsA6mrUELJ9023pVu+Vs=;
	b=Eg+s6VR8obVmuxWhLWbwAHysH6XHBbIWaqdu0aUAuGXuh+B1FAIrzZBd5bELuBFd
	7bap8WCA52TDEpPazXRr3Zm2WoQjDxjXC3x56KzLEvHWntG8CC59VZCzWgQF3kA5/Se
	CWoVj166MIrmnACI+WCosHms+YtKGBZK1jAcgHls=
Received: by mx.zohomail.com with SMTPS id 1781204348101736.9572882913078;
	Thu, 11 Jun 2026 11:59:08 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 1/4] MAINTAINERS: add Daniel Almeida as Rust reviewer
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260611055538.61425-1-ojeda@kernel.org>
Date: Thu, 11 Jun 2026 15:58:50 -0300
Cc: Boqun Feng <boqun@kernel.org>,
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
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <221CFC60-9AA4-4FB0-8022-D808EF00F089@collabora.com>
References: <20260611055538.61425-1-ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 11 Jun 2026, at 02:55, Miguel Ojeda <ojeda@kernel.org> wrote:
>=20
> Daniel has been involved with the Rust for Linux project for more than
> three years now. He is the lead of the Tyr driver for Arm Mali GPUs
> [1] and submitted many of the core abstractions that drivers need: the
> `irq` module, system resources, `IoMem`, the regulator API, the `bits`
> module, the basic USB abstractions... He is also working on the =
initial
> Rust V4L2 support [2].
>=20
> He is already a maintainer and reviewer of several Rust-related =
entries,
> and he has been very active reviewing Rust code in the mailing list.
>=20
> His experience building Rust drivers and the APIs they require will be
> very useful to have around in the future. Thus add him to the `RUST`
> entry as reviewer.
>=20
> Link: https://rust-for-linux.com/tyr-gpu-driver [1]
> Link: =
https://lore.kernel.org/rust-for-linux/20250818-v4l2-v1-0-6887e772aac2@col=
labora.com/ [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> MAINTAINERS | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d40e0c606893..5d34aeaa415a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23393,6 +23393,7 @@ R: Andreas Hindborg <a.hindborg@kernel.org>
> R: Alice Ryhl <aliceryhl@google.com>
> R: Trevor Gross <tmgross@umich.edu>
> R: Danilo Krummrich <dakr@kernel.org>
> +R: Daniel Almeida <daniel.almeida@collabora.com>
> L: rust-for-linux@vger.kernel.org
> S: Supported
> W: https://rust-for-linux.com
> --=20
> 2.54.0
>=20


Thanks Miguel, I appreciate being part of the group! :)

Acked-by: Daniel Almeida <daniel.almeida@collabora.com>

=E2=80=94 Daniel=
