Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494560;
	b=4HLwi1dlzEE0lFNd3bmFJDbn6WiobXkQObmKnGplR6dMUq2KAXEzN5OkDc1i8DIj2mVq
	 PuahEEpdsEuhZgSzEy2TyRoapYRqZaRNTR/LOyJQ/3HpcWOSAipwgsbRXcuGA8qtBmnkl
	 ltxssVA3LADVNwEQarOC3HM/UBN2OsgHKAEkRTHj6zVqpC3E93nsDWmycbBRdBdBUg3LZ
	 SeHE6P/Fsl6sMkX/zbn3lR9DweupdBWHchcmjjrXHIkvkTQD1CWWWo54IbPUxpknnK43E
	 6i2oBFV5SZB+weDTbLg75EjFzi2JvHME9mnurX0IRKiWoBWFkpZjPU13N7ALDRTzZNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494560;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=aq0o03R7e9F2pw69m+iUpHwCBUrNrj8FRpthGHachfU=;
	b=nDShsOQqn9edCwpqVSQ537dBPsOD4+drt7zUEqZrcjLutTnm1ia8Es6y4R9YSJsiSh7l
	 bHy5UR+tKPFSJrorxVD+6ZF0XMv/pKrQAcQfrDSGn7lI7rvNXybsuQH2PCNLef75FU7+E
	 g4JW4l1SDbiRIATJL2qLYIlceohUL6ZKGXpjc0KQvncQIWxG3othNac7OmWaMAxpetEEZ
	 eW14UBDAs4cAqpyn4jckFEzK6/4NaBE6Yv/JKimNY4qRao44mZVobk5IR/EyGHNm47828
	 adfkIsYJhiApt8DnzUCgnMqi6oC8z2+Po20s9XZvaogBA7/hw8No4YjkntbfnldsZUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=D6i1tabR;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B718606A31C;
	Thu, 12 Nov 2026 14:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B718606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=D6i1tabR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1794494555; x=1794753755;
	bh=aq0o03R7e9F2pw69m+iUpHwCBUrNrj8FRpthGHachfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=D6i1tabRaiEabLSjKLt60DBdRBgc1ghMp/8bV7MeYncwMKpZbKK5AAv1JEBCvN7mG
	 NAHVRlu5d231+HRbVexe+koI+ubiZZX1olmurWYZjkLfMZFTmhy0cg9Lg6BeXneYu0
	 msslEAx9R23M6rViDj5jTAqogNYMjpgOEeuf7E59esqA6WKnFUP+PFgWIBGdSLBwX2
	 hN39xgBJl2xBY6D/eKneQFGvb4LSe5r668ZbM/AW3jEsJrxQWZd84uaCf7LQ5vQbiD
	 mJKrsNO4SNSEcrBQjbU/A8RzVipo2I05KdurWxBE8phhDuupBSA7K60VPAwlfn/SJV
	 apHpNx4EsqQQg==
X-Pm-Submission-Id: 4jQNQc4KLdz2Scmw
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
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
	tmgross@umich.edu
Subject: Re: [PATCH v7 0/3] drm/tyr: GPU reset infrastructure
Date: Thu, 12 Nov 2026 17:42:27 +0300
Message-ID: <20261112144231.279851-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <AE29D511-8F4A-49A3-BE4E-31E6411816D7@collabora.com>
References: <20260912-tyr-reset-impl-v7-0-077ce72084eb@onurozkan.dev> <70AFEE33-C637-4D49-88F1-9DF3A9BBF097@collabora.com> <20261111100745.3929894-1-work@onurozkan.dev> <AE29D511-8F4A-49A3-BE4E-31E6411816D7@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2026 12:33:47 -0300=0D
Daniel Almeida <daniel.almeida@collabora.com> wrote:=0D
=0D
> Hi Onur,=0D
> =0D
> > =0D
> > Any updates on this? I am preparing v2 of the GPU unplug series [1] whi=
ch=0D
> > depends on this series. The reset patches need rebasing against current=
=0D
> > drm-rust-next.=0D
> > =0D
> > Would you prefer me to send a rebased v8 and base unplug v2 on it or ar=
e=0D
> > you planning to pick up v7 and handle the rebase?=0D
> > =0D
> > Thanks,=0D
> > Onur=0D
> > =0D
> > [1]: https://lore.kernel.org/all/20260823-tyr-gpu-unplug-b4-v1-0-e99c07=
d4c785@onurozkan.dev=0D
> > =0D
> =0D
> I'm only waiting Alice's R-b before bringing this in. Feel free to send a=
=0D
> rebased version, since it will probably be needed for the unplug work too=
.=0D
> =0D
> -- Daniel=0D
=0D
Okay, I will.=0D
=0D
Thanks,=0D
Onur=0D
