Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840D9337BBC
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 05:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773639144; cv=none; b=ikXIQ6oeQvcUEyIiugoXF7HR5mf5CSVvD6Tgi91jr6WlzeCNc8qrl1LSSUsbKluJZ7XQPsjRr/EuXQ34+D+D6T+CYHXhJ3ovl2Qf60yvXcat93JLazCbPJZSkd8U/jqmVzLLEfoa4SzVkf0oQhhplvuGeNNEBEnF9iRfGAAJ5vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773639144; c=relaxed/simple;
	bh=nzP3FgUJvN28liBDGU1Qql3bixZ51QkEGMoGsNCw550=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMMzjqeOn5/jxXaS/wM4sGgH/yJEfpZ+yl1yqxLp2c9Ao+rO0cbnEQMd14U+rQ7QtxtZfIbBl8M/dtX75zEBCzOSRnjKXcLo+DooRfj/IMv3G9vKyc1PeR+fZj0FCINO8Fyu4lVlOt2yD9sInq5mRTZ2B2okXTnVr14ijVVNymE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JhjM+qb7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JhjM+qb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nzP3
	FgUJvN28liBDGU1Qql3bixZ51QkEGMoGsNCw550=; b=JhjM+qb7ZR5cn+GnyvF5
	QvM7Ch/9Ty41WF8+GoFGVxjbkQyUIo6RUXTLuRYaVfH2fEf0U4NsNHIn7eWz0vMB
	8U+DAm3y28sp2mePm9xLWRvtmjsC2UxqtkCKWk+YL2UXN2PmQub3eXtgRdzLgRSv
	hByr1EvZElV/nmqcn2Z3dgJGGPXcJr5xJaSkSuxmsL25i9hKeZW3ENw9aKmLCV9v
	5bbc9usrswMqUzINIwkerycb8qttilMNxXOXp6pxp4pl3hV4LiJsivKgPM1sHeYU
	CmbYTbg4Uf+Czr++V7XgE1N2rUA1Zpjioj1cBEAep3opmGFqzuT/hfxU1OmPGXwT
	1g==
Received: (qmail 1278888 invoked from network); 16 Mar 2026 06:32:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2026 06:32:09 +0100
X-UD-Smtp-Session: l3s3148p1@N647ih1NxpAujnv6
Date: Mon, 16 Mar 2026 06:32:08 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Shankari Anand <shankari.ak0208@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wolfram Sang <wsa@kernel.org>,
	Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/4] rust: refactor ARef and AlwaysRefCounted imports
Message-ID: <abeV2EISBJh_57rP@shikoro>
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
 <CANiq72nXHj2q6=1jPYTds99=sLf6VX3WQwYDXBCjWfObnx9tFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t9JPUEqx7eXXxF2B"
Content-Disposition: inline
In-Reply-To: <CANiq72nXHj2q6=1jPYTds99=sLf6VX3WQwYDXBCjWfObnx9tFQ@mail.gmail.com>


--t9JPUEqx7eXXxF2B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Greg, Wolfram: if you didn't want me to pick them up, please shout!

All good from my side, thank you for your work!


--t9JPUEqx7eXXxF2B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmm3ldQACgkQFA3kzBSg
KbYpmBAAqucBE73Wug/gkpciBXbGAjuG124JrgUEO3yvqwdeYO1ZZ0TkyOr3B3Ng
b3Pg02DHZftAyQ6QtjjFVT1JA9770hxnl+HrETXwXyUhjTkz9gyMH17kMuSIOop5
4GmCpD86Rafw0iK1jx3SsTMGAumgfW41kgsgThnSAzT12HUasN6mZF/emhtJdt04
j/x5MKV+3MduN8MjCXIVz1NxjNV/8Ff62xFJVO0i6OKu6zZACgh+dd7JFSK5sV1/
K3WB9iVSmZQ8v4X6ij3gB+Bv3Z6rYnaCC7y15EMopXSG4q0/aXTmrCqG8QA9jWwL
Qo2zxVq+67VGSzaI9HVJkaqS9qGvIpUCFl+vu1mdWC7JcXUZ5A7ftz/UzcF0w/iZ
P5lxeVXyTf0JAQd1m3l/DvIcBl82BQctvRLMICKvv2hOrg9nv5RJphNBYvracLs0
hHwuuE4iDMBnvxc1Ax3mXeZs7iYVZzimSXppwMjda8KbkWdlAnMPRIns0ZWLGIca
qXH7oqzZ0c9ZbdtQTRq+8qUjQjqVC3JPLEQctmeu7uJuYSz24Cj78f3DVq2V6kly
Rp+r+H8j26UqJeptFbYfTlmWs/QKh2/oByn6fVpkRxAX2jYIZjyzfQRnADhieWRS
+HrT7HpewPKO4mn3X6aQv5gKXE9Y8S4nnVjCo17Q37RDI6jjf6I=
=37Xq
-----END PGP SIGNATURE-----

--t9JPUEqx7eXXxF2B--
