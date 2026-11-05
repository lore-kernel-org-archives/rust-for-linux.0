Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863865;
	b=nqqf8+yNhv2ny091XP6m49FNY75/IbC2nXJXQFY2fOyRLUAG4fR61spRpgbzyDtRdz6A
	 xiTyluvkBPpBc9cf9IHZtShV8qG7yHYQIqM989FzT4D3jh/yffjXSS6Jli6X0DRXrb0Q7
	 2mXW9ujogylRwuXp0ovbDRqPRMporWiVamHWi529nddAyCs71tyzKr+wqsv9GUZTZ4o/d
	 jieb2ylHi/Yqol1CVmkBKXk3sMWGRDwqElTPje1UcpLdX2Pr3ShkqF9wcJwL1HSqRybP7
	 GoCsTA1H05G9Ts1cHTT6pD+TnPFssxLN5cDMwTB2qy6FjX29VbJkytB1qLFKfboGVdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863865;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=tzpAoC2omTJl2fzGtB/LbdqFRSKRKecrRzXJsFBarKQ=;
	b=e/CLrKmZImAKP4Tz9PD74UtvTYPd2UhojG1KUGVmE+B2QcC2Ph2+rBpfD9WYk2MP7Uy8
	 JkYIUx2RlzhWcr04dwYeZqSxm5c2g13GMEjIAYMW4dm4owpXvx2jMdHoxL+zyTYW2+uMN
	 JKQCiLfKn6fJRkXSJ+uSukVJoRw6BNeDV+X+CqDsjzthpE94xqc9nvTOD/f7eoUoYuTOx
	 WbvOrDYJp4zEmQFiE/qIMS8cl6D9YihNf1/JBy+tQ0mZLLUCT7hARFEuXvWyQJQpmYSq6
	 kZBdP7Jav/xYyhUHE4saVPbOfpwf0B+1NpYWHcsanFMg8VjpmD5Lp1/TMIqwhbDhNXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=EAwqa1YD;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D43606A326
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 07:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=EAwqa1YD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=tzpAoC2omTJl2fzGtB/LbdqFRSKRKecrRzXJsFBarKQ=;
	t=1793863864; x=1795073464; b=EAwqa1YDej8zPobBD8fjOdf66y5cRMKjBIE+r1rTbj10DNS
	EtBzQeSuDofRsF6Eusd+/nLfiiFrrAwXjpsv4mkdWoDj8buAStscOpfpvthToHl+4HKZw19SjFolF
	46OxgTYC78ob/SLG/IJ7KfUrWOvo88uAADL2tIYeRDHMqWVSFycc+u3YXbsAqpH2WYxQ6/E2CtnT6
	YSoYh8Dgj3DsChMLLiPwwPMCMg4tAenWtIctR+db6YPtOzDtqtq10MYy6Ko/vtuRe99tH+yV2Sd7U
	JHOtekdtJXy6iD2nyThEECx6+X/ZISc6uWpeBJ4qDuDLzefCmApaoUTYTb5ES/YQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xOrvv-00000007QDT-1O6r;
	Thu, 05 Nov 2026 08:30:52 +0100
Message-ID: <d2496da0ffca1e425c194cb746088fa174fd3cf7.camel@sipsolutions.net>
Subject: Re: [PATCH v1] rust: arch/um: Fix loading Rust modules
From: Johannes Berg <johannes@sipsolutions.net>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: richard@nod.at, anton.ivanov@cambridgegreys.com, ojeda@kernel.org, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, david@davidgow.net, gary@garyguo.net, 
	linux-um@lists.infradead.org, lossin@kernel.org, tamird@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	fujita.tomonori@gmail.com
Date: Thu, 05 Nov 2026 08:30:50 +0100
In-Reply-To: <20261105.100942.1905172064477226868.tomo@flapping.org>
References: <20261004121230.373216-1-tomo@flapping.org>
		<20261103.180207.1243555897796693771.tomo@flapping.org>
		<0730c9d467af3897a547860d036a5591cb40905b.camel@sipsolutions.net>
	 <20261105.100942.1905172064477226868.tomo@flapping.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2026-11-05 at 10:09 +0900, FUJITA Tomonori wrote:
>=20
> As the commit message says, Rust modules still fail to load with a
> larger mem=3D, because Rust code uses the small code model. Zigit Zo
> posted a fix for this in 2024 [1]. It is the same change as the one I
> would send:
>=20
> 	KBUILD_RUSTFLAGS +=3D -Ccode-model=3Dlarge
>=20
> It was not merged. Was it because the patch has no Signed-off-by?

I have no idea, but I process enough patches (mostly in wireless though)
that I almost certainly wouldn't remember one that just gets dropped on
the floor because it doesn't have a Signed-off-by (or similar mechanical
issues).

johannes
