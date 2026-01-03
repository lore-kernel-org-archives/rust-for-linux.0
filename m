Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA1928B3E7;
	Sat,  3 Jan 2026 20:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767471534; cv=none; b=UEzHwkMpL4V0/aC3wn8vijn8r17Y6Eftl/HBx6+siXADbhIG8IErzlj4XFfXXe8FOkvc5dFqtF9j7AC5VFiuurtSAzZeIsrT072+LQMJXl3Z2bILtpLWBIdFsNNYZe8P0enLrRPe2/WYsS1ziHSesoGawtRDvCwC3QZm8z+U6z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767471534; c=relaxed/simple;
	bh=6+y97/pJCEGjal6D0ARna2/i+N2B7Aa2URzyhV67De8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=HKTX6IkWvazFnCNhFggyzRv9fC6htwkKcTsVbxj85CjPfoCzhvBkkGtdbopRl9F7e68pz4F+ZaepJsj5rsAfZtLksYW75Erh1Ua/g2HaIPGWi4VoTjgEzi1uQJzXiltDadCHIPUjKNEXE8b9G4ox4URf3VLRiOqBosKravXZjHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QdQBUKTe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdQBUKTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B979C113D0;
	Sat,  3 Jan 2026 20:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767471534;
	bh=6+y97/pJCEGjal6D0ARna2/i+N2B7Aa2URzyhV67De8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=QdQBUKTezQykXSe3+AJ6bZJgQWkEig5OnEow6GS/FFQA+1vv98jtjmEkcYnVpHpbM
	 y/AvVMckzH1v7Z+cvDFUXZvXy4OYbN3+F3wC09iXN6WBdT+MWqSI2RkgEOPHbM/2oa
	 FW2xVKAOe6FKgdNn3sQ+Q3iAmCxGog3XWFmFXg02iljexkUialYn8iFTKq/MpMfkRi
	 Dh8pe/+yZo0OwL71UZfnnlEmiabdECwDP36HpYJOPIXb8mAmDvMlTFmLsTUGD+cRnP
	 PNtmp9f1mp85Dqv4GznVfgU/R9TaLSCj/2KKyOh+PfczupK4tUVNRUvA11fvV9JaMf
	 PT/7TT0v4w7LA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Jan 2026 21:18:46 +0100
Message-Id: <DFF8D5VJ7RMG.VRLZJ24NT2T3@kernel.org>
Subject: Re: [PATCH v2 2/4] rust: i2c: Update ARef and AlwaysRefCounted
 imports to use sync::aref
Cc: "Shankari Anand" <shankari.ak0208@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Martijn Coenen"
 <maco@android.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Christian
 Brauner" <brauner@kernel.org>, "Carlos Llamas" <cmllamas@google.com>,
 "Suren Baghdasaryan" <surenb@google.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Michal
 Wilczynski" <m.wilczynski@samsung.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Igor Korotin" <igor.korotin.linux@gmail.com>,
 <wsa+renesas@sang-engineering.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
 <20260102202714.184223-3-shankari.ak0208@gmail.com>
 <c7be9f2b-003b-4dca-8296-5cb7a06ded8c@gmail.com>
In-Reply-To: <c7be9f2b-003b-4dca-8296-5cb7a06ded8c@gmail.com>

(Cc: Wolfram)

On Sat Jan 3, 2026 at 7:45 PM CET, Igor Korotin wrote:
> Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>
>
> Since I still don=E2=80=99t yet have a public kernel tree, I=E2=80=99d ap=
preciate it if=20
> someone could pick this up through their tree.

Since I've taken the initial I2C code through the driver-core tree I can pi=
ck
those patches up as well.

However, maybe it's something for Wolfram to just take through his tree?

Please let me know what you prefer.

- Danilo
