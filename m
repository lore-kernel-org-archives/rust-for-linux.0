Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3299280A2C
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552252; cv=none; b=Mvx6e1Ut86gxn8Ql1UWfLabtasex4jwN33LbDm6uw4VM4yfSPax3iITVbxNh5S8QoK862ZIdfoyhz74yR55XGm5CsA2tVJQW+5Vmzka6HoyOTSi7aXWduz5ZiiA+PAtV4N8hhdVAoTNO4nd+JpRpdsxEZkZZW0+yG3R+AlRu4+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552252; c=relaxed/simple;
	bh=39riRR0dLxyvtYHYuiqKe4y4i0jOdrn8sSddtdOyEEA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tWHeLdvce2NHnRao6zYgx7vLzWeZVtBPElQimjV1ETdRP5jIQlCxG9T4G6qgcf3gOT8JVS9WXfCLAks0d1l1sZF6HfkSxiazE+OYZ42giHG5HepDOTbH8R5Vzx41ZWzOlBbIvUlXQwKDwnT2eXAZL2dnZV+iYfxOPxcwCrk4k9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7FX3VBB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7FX3VBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE81FC4CEED;
	Tue, 10 Jun 2025 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749552251;
	bh=39riRR0dLxyvtYHYuiqKe4y4i0jOdrn8sSddtdOyEEA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k7FX3VBBMRIRPGWyUkCUSQMSNbi3nxfRO6fDSRY0RD+tmOQe3xLwBe+V4lsCD0kGG
	 d8KEJxM0r7mDgG66ePatYwQJlIyN4yASjFxufOiJCKGNDMHkD4pHlnlsWCb+7DMDUh
	 zFj+x8My9sdFOZ/xUI8Q63+Rj5p2qewC822AbsQ8i3uYg19qpQjgwbc/VthqaeC+3U
	 bcXw7ZtLUathPNUx4N9Z1adgdonh1lUVZdxHewLqovUIaJx+mbBSXdgme0D/QQnuNE
	 q2xppoxoLfHNJDouO4w82BROtigSD1WLtzHdqqXGGfBxM3cSy6YA3LxTB/BPbiwocR
	 dVcuHfjXGkTWQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,  <aliceryhl@google.com>,
  <bjorn3_gh@protonmail.com>,  <boqun.feng@gmail.com>,  <dakr@kernel.org>,
  <gary@garyguo.net>,  <lossin@kernel.org>,
  <rust-for-linux@vger.kernel.org>,  <tmgross@umich.edu>,
  <tamird@gmail.com>,  "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: time: Fix compile error in impl_has_hr_timer
 macro
In-Reply-To: <CANiq72n-+FKrWmbtwoKn1n90Mw+wyQJKUrGUa7opsuNYbts-tQ@mail.gmail.com>
 (Miguel
	Ojeda's message of "Tue, 10 Jun 2025 11:49:40 +0200")
References: <20250606020505.3186533-1-fujita.tomonori@gmail.com>
	<CANiq72mJwEm5aMCsrKAhD2e9p+ZyrL3d+4zOswM53k1pbDyyfQ@mail.gmail.com>
	<2w_xemXUO2dSUIMi71vfN-naCZx1PE9R9ka68JgQUmrvl8J2lm7iV787DsNgkc9ZDfhGP9maoqYqf8WRy8Hmcw==@protonmail.internalid>
	<CANiq72n7SgO26P5kFuA1AnnzmUW7q2_7FtH+nUxjoxjjcMeD5w@mail.gmail.com>
	<87cybc3v65.fsf@kernel.org>
	<nSogSsFzsrOdtxm2q0yUZehXJhp1YeesQ2pjYzf_DvnaNpHdvSY9At0aQCQNVv_jHkrZm791PcnCiiJQxpJMFQ==@protonmail.internalid>
	<CANiq72n-+FKrWmbtwoKn1n90Mw+wyQJKUrGUa7opsuNYbts-tQ@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 10 Jun 2025 12:43:58 +0200
Message-ID: <875xh33mhd.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Tue, Jun 10, 2025 at 9:36=E2=80=AFAM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Thanks!
>
>> You want to take it directly in the rust fixes PR?
>
> Yeah, since it is a fix, or what do you mean?

Yes, I thought we might want to get it in for v6.16-rc2.

> I guess there is no rush given there is no in-tree user, so you could
> pick it in your -next one, but perhaps someone else wants to start
> using it in another branch?

Either way is fine, just let me know.


Best regards,
Andreas Hindborg


