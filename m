Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795007314;
	b=V1lD4YqkQV9WmbgEQw7BrsckiO1nz8SGJ8JTtApdSEIXgvqLBTcaqLs6BfONTa2uHMyv
	 92wVKY3kj76dVOzhHg6JasXrlThiRq4lPTl61dtJli/KuYdh4LI/m3M4Lj5bcxOsQl0iO
	 nLK6U65p7bQnea32VYxKnbZpJtZCrGnzAaVkgasQdJ5kwVP/95lStVgMqBzLlljaJQgeq
	 ezFD8SN+n+eKI3A0LKv9JXDcrD0+wrElDX/fRWRrlOVJXcfTAautNa/L8hn6tskFrMLAJ
	 /eW3HOOM5atjqC2LxiAStR4Zp9+6IwXRbK0TidY/TSNle5fUSIiW+gmBqyV3OdHO3MA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007314;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=NJ7T0AiMRWiQis79R0RdVxGbgysmk1qBN7xbr3bMyWQ=;
	b=0D/UiCJjoXEhlu/t/9qlVgFoo89JavnHDV8iWC1yRx6RY33c55O8NUBIgJvh0QFg7xa4
	 dipI5wMCufBCml7I+OXHgu+/uxkRYhysrQXC2w+GEMYIIS+cWB6m9rQIAO+XVtXWFfsv2
	 ypgAJp1i7rCuyB09OIPaHk4I63aHNqUft4kaVbsi8WYTiIWfdFVRYIXEseUxJ0VRzyIis
	 iLGl/HjwyweNtDilUp1QjC9tyWIpH1Pfc78B9/pC3/r0dRSEJP422ayGUAqrvYpFcXZhR
	 2yhHAGQgSouVwJvvTTgOYAwUUXxR86s6LHVGchTZSbUw6ktCEi9k7KU77T6DpWzYEOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=BZkw0AtN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8358F606A320;
	Wed, 18 Nov 2026 13:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8358F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=BZkw0AtN
ARC-Seal: i=1; a=rsa-sha256; t=1795007290; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ufjs4Lh67ToZNkP0KJ/D+MIaXlpdBfx7QRjmlCf7Q3qcmV/pAxCtIOCGGv4/+5owJnYqEH3HArH9clTtjMZsA9v4qKrTi/BIcTF6iBD32T5kVIIhaFXOI8FhHeWm5Sge9Lsaw52mfqDgzJS+zDdoYTsNy8ig2gFOWUiWu5+ZXhs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795007290; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NJ7T0AiMRWiQis79R0RdVxGbgysmk1qBN7xbr3bMyWQ=; 
	b=TWIDctKK8qVRDeG6Z+0qXzq+KUFd14AjINf4uMBQ7J9qLO8dyAZAWdjgStL26yLGu2bJejHUdAu6dN0iM9YuODd0CwRP2eSQ59Jy+kdiGNzf+41ouPUxYQ2uyB0StPEYj22DlA48JGxFlIrf5/lbKGk7H2Z+B/xu7y1QjEcj0IY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=BZkw0AtNDJav65XEcFiBMFwRKKLpcPoAZPj/o0DoVSFyrqNtQsgXo0jkOtXd8jpPTfPGEV+PAIV9ksK9Ko/VIcYabeqPG8+h6Q407hR1r/KhHHVTy2dJzpESVIr+z1HR6sp1ogMvIt5EeG2qcOmEJO2ad34mEecCk2yNCTmOsXA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=NJ7T0AiMRWiQis79R0RdVxGbgysmk1qBN7xbr3bMyWQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795007286787165.91293514992333;
	Wed, 18 Nov 2026 05:08:06 -0800 (PST)
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
Subject: Re: [PATCH v8 1/3] drm/tyr: clear stale IRQ state before soft reset
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <av2U1FflKT1mEotg@google.com>
Date: Wed, 18 Nov 2026 10:07:49 -0300
Cc: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 dakr@kernel.org,
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
Message-Id: <B56A0B7A-A0DC-4BCC-8556-F7BC105B991F@collabora.com>
References: <20261113-tyr-reset-impl-v8-0-2ee298ac9808@onurozkan.dev>
 <20261113-tyr-reset-impl-v8-1-2ee298ac9808@onurozkan.dev>
 <av2U1FflKT1mEotg@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External



> On 18 Nov 2026, at 09:06, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> On Fri, Nov 13, 2026 at 05:32:26PM +0300, Onur =C3=96zkan wrote:
>> Previous reset may leave the reset completed IRQ set which can make =
the
>> poll return too early.
>>=20
>> Clear the IRQ first so the driver waits for the current reset to
>> complete.
>>=20
>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
>=20
> Do you want me to merge this now, without waiting for the other =
patches?
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

If Onur is fine with this, I think we should merge what we can.

=E2=80=94 Daniel=
