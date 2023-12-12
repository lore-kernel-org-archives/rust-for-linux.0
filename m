Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="lBoMODRj"
X-Greylist: delayed 113441 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Dec 2023 09:43:28 PST
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E112BCF;
	Tue, 12 Dec 2023 09:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=gooevbgqcfc2zodvlhx4jfz534.protonmail; t=1702403007; x=1702662207;
	bh=y+TsCR4PW7NrBLfHsIFxa3geiSOoWWNUlAyAMODXi2o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lBoMODRjoIgqkk2bFCaW9BdVbEtpFOIDRkaLhi7QraiqqCQjY/TXaRk5xPU7corMA
	 WHNsgewGeHQMQr1Ru2hl0lGPh+vxMJHAFOnVImnoT9YdkVSebVZR6LALSiU+f6NZQT
	 vtfBUpD+p40GW8QhhycSYqzgLV4Z9H7ulmw3BU+MO+tk98QUb0z/Khj8jWo5ahwaoU
	 gm3gxI2zROKKqCPDPtRXn+ZRl5lPK2JJZ+Jmwvoow33CaaHxMTbwn/5mADQk5bedQb
	 9gkj9t+sVSW9N+v1iCNWVAaJT90eJDmrJQKvfDJoBU3MCijhRIS9HOwJXSeWoHQT9J
	 qAgfsygmmfxGA==
Date: Tue, 12 Dec 2023 17:43:16 +0000
To: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] docs: rust: Clarify that 'rustup override' applies to build directory
Message-ID: <e9d84003-79bd-4b56-b0db-97f06f88af2f@proton.me>
In-Reply-To: <e2b943eca92abebbf035447b3569f09a7176c770.1702366951.git.viresh.kumar@linaro.org>
References: <e2b943eca92abebbf035447b3569f09a7176c770.1702366951.git.viresh.kumar@linaro.org>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/12/23 08:43, Viresh Kumar wrote:
> Rustup override is required to be set for the build directory and not
> necessarily the kernel source tree (unless the build directory is its
> subdir).
>=20
> Clarify the same in quick-start guide.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

--=20
Cheers,
Benno

