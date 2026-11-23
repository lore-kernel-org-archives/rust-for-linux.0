Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795472506;
	b=qna1rbIftHaM2etNH3x+5bO8AjsnvuG1XXm2s3lqMb+Tm4Rq+YnKH1wReLoSTFCf9BHN
	 tPiesvtOjWYYXbQKbalzz0couXjP+KuLRP8/U8lV200Lxetc/QwKxswWbXtQMXPwR3Bgz
	 Kw9xecXgqCQ6V+WGLmlZAVGp3WwcOLDWrb4Phui1fkE578oGaIDcI2XLJyyhd3uuPXTET
	 0H9xYsMYxIXoXTwqGomMYLG8/uBwa24D60NC7TvVn9yrxL9eWJErkTdKteFhBgjZwKjRY
	 D3e/IZM0Ysa+yEmnIzSMnGobQTzYbrXyMedUdKMWGkQg2J86V3SGnv2j72d7T9ZoZig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472506;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=loCklCyG3lJZLM7HB7hwAb7zV0bfVHMUtT4+DsQV5ow=;
	b=H7rMplOqbI1/M/PMszlhKBW4e6XWDws+KxKFNJgtO8Re/5FuxH2zwvcjofHeTv43FdgV
	 02rXoZfLnct973UoqyalOV5upNlVwBcFOlGk06xUW4uguPiYE70PRrF0bnNJO5oYgTBJV
	 +E+3TrtlI8tPcIumD88SnIPBakbFUOaTnGKzif7qU0acG0y96x2En4cBYvjpm3R5mZG01
	 AkrlDXZLWFW3DwuGxeExfKnnyPGU03k+2aMSSZp5dYBQPMvjjwy9plGBObevl0AvTFDAS
	 2vFp1DQTMg+QS/Jw/iCo/qSnnAWCxYA9ZZxA/UBXOw31pyuMKgDpvbAtuYfeVEZAKTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=fPj8nhdu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6029606A31E;
	Mon, 23 Nov 2026 22:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6029606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=fPj8nhdu
ARC-Seal: i=1; a=rsa-sha256; t=1795472477; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qvr9OkM55YewH7a1kmhujGsW6GcLuosTdF022DYd/zazc7OK8UZvW/64GLOgUxsBqqyRYYf4iV8ZNKM9IWXWQusjaOU3OPx52zhC8KESjJ80Mh4xxS3SVoKb21MeVuzvflBWZwBXFMTuQ30dRI0E8JSRtfmbatrmGk1wHUS/zVU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795472477; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=loCklCyG3lJZLM7HB7hwAb7zV0bfVHMUtT4+DsQV5ow=; 
	b=U7gNiCjPtnl8JfCe8AC3wf8DlRJgvtphfH0AoNT4TaQI5XTxB+t8H1nr6TMhhZGfz13Hp+drDEStzHWE9rLkMZHTTRcokuSuziirq8nC53cNNd4a/b7R3vpcmc1p+p8xHzPPB/YSsuYO7B2KRi1QZgm61jwF9Dcbuf4AGyK0R2w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=fPj8nhdu4HYbwinx47ZHtg8XWT3qbjnckDLHHuvxfWpgwJqfNBGyQ08uw3Rkn/dHy5gSts20yOTmbBh3n/wsmzVBE2hR6Zgxgn8swbLhk02pRitGwk1cuNQVjo79Io0S4SdErs51hF9lnGW5CLVX0J/8MjMEmQby/VNskgo8CKI=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=loCklCyG3lJZLM7HB7hwAb7zV0bfVHMUtT4+DsQV5ow=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795472475631655.0565800257085;
	Mon, 23 Nov 2026 14:21:15 -0800 (PST)
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
Subject: Re: [PATCH 0/4] drm/tyr: use pin-init self-referential support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261118233727.3147222-1-dakr@kernel.org>
Date: Mon, 23 Nov 2026 19:20:59 -0300
Cc: aliceryhl@google.com,
 airlied@gmail.com,
 simona@ffwll.ch,
 lossin@kernel.org,
 gary@garyguo.net,
 ojeda@kernel.org,
 boqun@kernel.org,
 bjorn3_gh@protonmail.com,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 tamird@kernel.org,
 acourbot@nvidia.com,
 work@onurozkan.dev,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <084F476A-BD3F-4FAA-B47C-E875B542AA1B@collabora.com>
References: <20261118233727.3147222-1-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Hi Danilo,

Thanks for doing this.

I spoke with Gary about this topic at Kangrejos and again a couple of =
weeks
ago. What worries me is that we might introduce some restrictions that =
might
paint us into a corner. IOW: we have significant downstream work, and I =
wonder
whether it will work with this series after whatever refactors are =
needed.

To start with, Alvin's VM_BIND ioctl series [0] will need some changes, =
since it keeps
the VM pool in the file data. I think this is doable if we move the pool =
into
the registration data and have each file hold only an index to its own =
entry?
i.e.: something like an XArray<Pool<Vm>> indexed by a number associated =
with
the drm::File. Same for the group pool later. Is this what you had in =
mind?

Anything storing a KernelBo will also have to be outside of the file =
data,
IIUC, since it now stores a &Vm. Also, downstream we defer KernelBo =
drops to
a workqueue, because they can happen in the fence signalling path. I =
suppose
we can keep doing that using ScopedWork/ScopedQueue?


=E2=80=94 Daniel


[0]: =
https://lore.kernel.org/rust-for-linux/20261122-tyr-ioctls-v7-0-3a2af624b9=
92@linux.dev/T/#t=
