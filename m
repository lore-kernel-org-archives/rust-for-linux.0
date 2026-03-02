Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E90547DD54;
	Mon,  2 Mar 2026 20:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772481995; cv=none; b=T4uyEk5SKUhO4JdZF3s/zlPEahPjq8AKmiwYB8sLwn2Q5nSzkyXOw26XdROuMmS6GV7cJ61EbWeY3eabNbWCcZbmlgFUWpZJqaVZmF1jT02EKZsKfLLd1abSYOtc3EkbkXqY0eKumpydhOkIsevLjIovuO56OGQySlOm6rOg6RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772481995; c=relaxed/simple;
	bh=0MkwtUMicVTO8NCBGdBK9wNoEKXX+gd6wX3w7FxIH0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOUmaveaV3WwreAefDoLVeiDml19En1+UqM1szM8YKWpkmEqcLhftRgrbSzJwC+nyGBPCrw3TFwwwalf/XvIi0SoCj4eI2zSQiP7rqhMfXG88Lffl9bE368Td1vQKLH6TBANgGiDlx/96frO4JU66097dbnLvE11bp7zgBiuJ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=T1aO4ajh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qx+H5UmR; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="T1aO4ajh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qx+H5UmR"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 411121D0021E;
	Mon,  2 Mar 2026 15:06:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 02 Mar 2026 15:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1772481991; x=1772568391; bh=E5TpxCfsCk
	tR7cHuIuqFbgRNwCzU7pDzRQDLJAvzWSE=; b=T1aO4ajhzZs9Gs/84ptoR61O2W
	XgWvZ9bgpd65iZ+nHTLiIZzy+pY/ZrV4HS88gSXt36i0fLTfr9Siv2zUhlFP0A68
	r1gkxRHM+pNSXATVuhZuVhyVugn+uJg6dKmpNYf9XvicZt28U4NUaOgrFNeKdR8M
	uLWmeLTo8ZY6dbn6mvC5RT24ETOSUJpku/sdz0Mnyn/D5RODCoU13Usj1DihEIB6
	wWEFccJSyDF8Gx9WK9AUIFhmzEa3NHyeCzciKIVyFP1Eo4vWj8l/HgWqIZTaIRCP
	d2DGn2Wej86Igl/2mxhHLeOpIJr4FFJCD0HoFM617zpypW+da7lRoM6fhnnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772481991; x=1772568391; bh=E5TpxCfsCktR7cHuIuqFbgRNwCzU7pDzRQD
	LJAvzWSE=; b=qx+H5UmRu9SxZewneW/sWee6AIfFM8UPZJFXRxRl3qC0uhvCGnL
	A/zdSTtJBbBfBWMVMXxdX52E/CULPerpR3m1mJ36uSagd3BVw7Wst5ZthyKmUUW8
	F3DiwpYIp38rsvS1XRatrWQsRckCwFW7C5BmJQHuIUILNUtXHA4SPSfeFHVetggW
	lKLxshngc1c1YCgiqXkLiG1iVGYGa+UEP+VLR+m8HzGVvNofALWEHWj3642K8uP8
	HOFrWn03GhFMaj2RC9SWBeBoGI6al+BDc1ARH73+xu123hswDlwLsM54rGB5ggvQ
	EEPVWhTNnKpXswjrf6582Aa3yFvTTRggJpQ==
X-ME-Sender: <xms:x-2laV8_HRDh4MFmfWo2o695qwp61lsrU4rMVvqmqWGXzai52jZ1pw>
    <xme:x-2laR0n9hvu2xJM4OUS146Z736sV3aciHYS8ztU2gqSRFGlAtMxVMMSM7B5HOWmG
    LthSl_B2nJ1ymH6lZ3i3YiFRIzj8VaINSAH5BGQxczGz_LA5ZoF8A>
X-ME-Received: <xmr:x-2laSjDRw07wPK2aLNcKPqHRXvQWj-2B2ciYbqkWF0jHlDZ7xEM5avMMfV9uNV0P8WZrHyH2rWq308YHs_s7rSnkTM2O22qHis>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheekiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefggf
    duveeiudefleeigfefvdeludevffeghfehjeffteekfeeghefggfdtudelgfenucffohhm
    rghinhepiihulhhiphgthhgrthdrtghomhdpghhithhhuhgsrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhn
    vghtpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhih
    ghhuohdrnhgvthdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegsohhquhhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsjhhorhhnfegp
    ghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegrrdhhihhnuggsohhrgh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgv
    rdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuhdprhgtphhtth
    hopegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:x-2laZaGLgzwxDkl7umKH_kzMPvK-aATJmuG8S5EaIP0QWHLzZyweg>
    <xmx:x-2laWUz8p93CYl8zRt2ipfgE6ogFNJio5imcFhJ2SAPiAhP9mgAMg>
    <xmx:x-2laZE_1hB6mDw23RRV_FRxC7XpgaWEB_s-r8Ktlwp6gxSsxc8L2Q>
    <xmx:x-2laYZh65g4MyDuZFKhhn7Vwb7U5jLxbg5lOTNxNHkvab-ocHlAOw>
    <xmx:x-2lafrCxDkhYQMUJtOO8YtEEif2Fdp3GyKgyRexGqTh1xvI1gnHoYRX>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Mar 2026 15:06:31 -0500 (EST)
Date: Mon, 2 Mar 2026 21:06:29 +0100
From: Janne Grunau <j@jannau.net>
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, asahi@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: init: remove
 `#[disable_initialized_field_access]`
Message-ID: <20260302200629.GB22561@robin.jannau.net>
References: <20260302140424.4097655-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302140424.4097655-1-lossin@kernel.org>

On Mon, Mar 02, 2026 at 03:04:14PM +0100, Benno Lossin wrote:
> Gary noticed [1] that the initializer macros as well as the `[Pin]Init`
> traits cannot support unaligned fields, since they use operations that
> require aligned pointers. This means that any code using structs with
> unaligned fields in pin-init is unsound.
> 
> By default, the `init!` macro generates references to initialized
> fields, which makes the compiler check that those fields are aligned.
> However, we added the `#[disable_initialized_field_access]` attribute to
> avoid this behavior in ceca298c53f9 ("rust: pin-init: internal: init:
> add escape hatch for referencing initialized fields"). Thus remove the
> `#[disable_initialized_field_access]` attribute from `init!`, which is
> the only safe way to create an initializer handling unaligned fields.
> 
> If support for in-place initializing structs with unaligned fields is
> required in the future, we could figure out a solution. This is tracked
> in [2].
> 
> Reported-by: Gary Guo <gary@garyguo.net>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-init/topic/initialized.20field.20accessor.20detection/with/576210658 [1]
> Link: https://github.com/Rust-for-Linux/pin-init/issues/112 [2]
> Fixes: ceca298c53f9 ("rust: pin-init: internal: init: add escape hatch for referencing initialized fields")
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Acked-by: Janne Grunau <j@jannau.net>

Janne
